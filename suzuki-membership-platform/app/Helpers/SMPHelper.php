<?php

namespace App\Helpers;

use App\Classes\Theme\Metronic;

class SMPHelper
{
    public static function statusLabel($status)
    {
        if ($status === 1) {
            $class = 'success';
        } else {
            $class = 'light';
        }
        return view('partials.label', [
            'message' => __('common.voucher_code_status_'.$status),
            'class'   => $class
        ]);
    }

    public static function number_format($value)
    {
        return number_format($value, 0, ',', '.');
    }

    public static function vnd_format($value)
    {
        return self::number_format($value).'&nbsp;VND';
    }

    public static function SVGIcon($filePath, $class = '')
    {
        return Metronic::getSVG(resource_path(config('app.svg_icon_path').$filePath), $class);
    }

    public static function dateFromExcel($excelDate)
    {
        $miliseconds = ($excelDate - (25567 + 2)) * 86400 * 1000;
        $seconds = $miliseconds / 1000;
        return intval($seconds);

    }
}