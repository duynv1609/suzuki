<?php

namespace Database\Seeders;

use App\Models\Vendor;
use App\Models\Voucher;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class VendorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Schema::disableForeignKeyConstraints();
        DB::table('vouchers')->truncate();
        DB::table('vendors')->truncate();
        Vendor::factory()->times(10)->create()->each(function (Vendor $vendor) {
            Voucher::factory()->times(5)->create([
                'vendor_id' => $vendor->id
            ]);
        });
        Schema::enableForeignKeyConstraints();
    }
}
