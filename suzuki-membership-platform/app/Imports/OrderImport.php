<?php

namespace App\Imports;

use App\Models\Order;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\ToModel;

class OrderImport implements ToModel, ToCollection
{
    public function model(array $row)
    {

    }

    public function collection(Collection $collection)
    {
        
    }
}
