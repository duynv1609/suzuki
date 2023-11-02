<?php

namespace Database\Factories;

use App\Models\Voucher;
use Illuminate\Database\Eloquent\Factories\Factory;

class VoucherFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Voucher::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $discount_type = rand(1, 2);
        if ($discount_type === 1) {
            $discount_amount = rand(5, 15);
        } else {
            $discount_amount = rand(100000, 300000);
        }
        $quantity = rand(-2, 100);
        return [
            'name'             => $this->faker->sentence(8, true),
            '2w4w'             => 1,
            'is_active'        => rand(0, 1),
            'vendor_id'        => rand(1, 10),
            'price'            => $this->faker->numberBetween(100, 500),
            'quantity'         => $quantity,
            'remain'           => $quantity,
            'max_per_customer' => rand(0, 3),
            'valid_duration'   => rand(30, 60),
            'discount_type'    => $discount_type,
            'discount_amount'  => $discount_amount,
            'image'            => 'https://via.placeholder.com/256',
            'description'      => $this->faker->text(500)
        ];
    }


}
