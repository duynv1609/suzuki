<?php

namespace App\Console\Commands;

use App\Models\Voucher;
use App\Models\VoucherCode;
use Illuminate\Console\Command;

class MarkExpiredVouchers extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'smp:mark-expired-vouchers';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '[Suzuki Membership Platform] Mark the expired vouchers';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        VoucherCode::whereTime('end_date', '<',
            now())->where('status', config('constants.voucher_code.status_new'))
                   ->update(['status' => config('constants.voucher_code.status_expired')]);
        return 0;
    }
}
