<?php

namespace Database\Factories;

use App\Models\Dealer;
use App\Models\Vehicle;
use App\Models\VehicleColor;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class VehicleFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Vehicle::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $modelColors = VehicleColor::all()->pluck('name', 'id')->toArray();
        $dealers = Dealer::all()->pluck('name', 'id')->toArray();
        return [
            'frame_number'     => Str::random(17),
            'vehicle_color_id' => array_rand($modelColors, 1),
            'dealer_id'        => array_rand($dealers, 1),
            'purchased_at'     => now()

        ];
    }
}
