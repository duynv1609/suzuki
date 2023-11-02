<?php

namespace App\Observers;

use App\Models\Order;
use Illuminate\Support\Facades\Auth;

class OrderObserver
{
    /**
     * Handle the Order "created" event.
     *
     * @param  \App\Models\Order  $order
     * @return void
     */
    public function created(Order $order)
    {
        /* Mark the VoucherCode as used if needed */
        if ($order->voucher_code_id) {
            $order->voucherCode()->update([
                'status'     => config('constants.voucher_code.status_used'),
                'applied_at' => now()
            ]);
        }

        /* Create Membership for Vehicle if this is its first Order */
        if (!$order->customer->membership()->exists()) {
            $order->customer->membership()->create();
        }
    }

    /**
     * Handle the Order "updated" event.
     *
     * @param  \App\Models\Order  $order
     * @return void
     */
    public function updated(Order $order)
    {
        //
    }

    public function saved(Order $order)
    {
        /* Create a PointHistory for points earned from this Order */
        $order->pointHistory()->updateOrCreate([
            'customer_id'     => $order->customer_id,
            'voucher_code_id' => $order->voucher_code_id
        ], [
            'amount'     => intdiv($order->discounted_value, config('constants.point.exchange_rate')),
            'type'       => config('constants.point_history_type.earn_from_order'),
            'created_at' => $order->ordered_at
        ]);

        /* Deduct discount annual quota */
        if ($order->discounted_value < $order->original_value) {
            $order->vehicle->updateRemainingQuota();
        }
    }

    /* Assign user_id to the Order. This should be done sever-side */
    public function creating(Order $order)
    {
        $order->user_id = Auth::id();
    }

    /* Always calculate discount value based on original one and voucher code, don't rely on submitted form fields */
    public function saving(Order $order)
    {
        $order->calculateDiscountedValue();
    }

    public function deleted(Order $order)
    {
        // Delete associated point history of this Order
        $order->pointHistory->delete();

        // Remove Membership if all Orders have been deleted
        $order->customer->load(['orders', 'membership']);
        if (!$order->customer->orders->count()) {
            $order->customer->membership->delete();
        }

    }
}
