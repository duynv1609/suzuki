<?php

namespace App\Http\Controllers;

use App\Classes\Theme\Metronic;
use App\Models\Customer;
use App\Models\Vehicle;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;

class IndexController extends Controller
{
    public function index()
    {
        return view('index.index');
    }

    public function about()
    {
        return view('index.about', [
            'page_title' => 'Giới thiệu'
        ]);
    }

    public function privacy()
    {
        return view('index.privacy', [
            'page_title' => __('pages.titles.privacy')
        ]);
    }

    public function contact()
    {
        return view('index.contact');
    }
}
