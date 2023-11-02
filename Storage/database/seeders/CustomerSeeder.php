<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class CustomerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('customers')->insert([
            'id' => 1,
            'name' => 'Trần Duy Phương',
            'surname' => 'Nguyễn',
            'mobile' => '0987955990',
            'province_id' => 79,
            'email' => 'phuongntd@vietnamsuzuki.com.vn',
            'district_id' => 766,
            'address' => '02 Phổ Quang',
            'birthday' => '1990-09-05',
            'id_number' => '225390811',
            'issue_date' => '2006-03-16',
            'point_balance' => 1000
        ]);
    }
}
