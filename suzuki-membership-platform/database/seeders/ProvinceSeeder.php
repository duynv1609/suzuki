<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Str;

class ProvinceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Schema::disableForeignKeyConstraints();
        $provinceJson = file_get_contents(app_path('../vendor/madnh/hanhchinhvn/dist/tree.json'));
        $provinceArray = json_decode($provinceJson, true);
        foreach ($provinceArray as $provinceID => $provinceData) {
            DB::table('provinces')->insert([
                'id'             => intval($provinceID),
                'name'           => $provinceData['name'],
                'name_with_type' => $provinceData['name_with_type'],
                'created_at'     => now(),
                'updated_at'     => now()
            ]);
            echo 'Processing '.$provinceData['name']."\n";
            foreach ($provinceData['quan-huyen'] as $districtID => $districtData) {
                DB::table('districts')->insert([
                    'id'             => intval($districtID),
                    'name'           => $districtData['name'],
                    'name_with_type' => $districtData['name_with_type'],
                    'province_id'    => intval($provinceID),
                    'created_at'     => now(),
                    'updated_at'     => now()
                ]);
            }
        }
        Schema::enableForeignKeyConstraints();
    }
}
