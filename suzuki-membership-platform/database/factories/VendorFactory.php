<?php

namespace Database\Factories;

use App\Models\Vendor;
use Illuminate\Database\Eloquent\Factories\Factory;

class VendorFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Vendor::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name'           => $this->faker->company,
            'logo'           => 'vendor-'.rand(0, 100).".jpg",
            'cover'          => 'cover-'.rand(0, 100).".jpg",
            'address'        => $this->faker->address,
            'phone'          => $this->faker->e164PhoneNumber,
            'contact_person' => $this->faker->name

        ];
    }

}
