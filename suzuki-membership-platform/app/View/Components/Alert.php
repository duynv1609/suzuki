<?php

namespace App\View\Components;

use Illuminate\Contracts\View\View;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\View\Component;

class Alert extends Component
{

    public $type;
    public $message;
    public $icon;
    public $env;

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($type, $message)
    {
        $this->type = $type;
        $this->message = $message;
        switch ($type) {
            case 'success':
                $icon = 'check';
                break;
            case 'error':
                $icon = 'exclamation-triangle';
                break;
            case 'info':
                $icon = 'info-circle';
                break;
            default:
                $icon = '';
        }
        $this->icon = $icon;
        if (Route::getCurrentRoute()->getPrefix() == config('backpack.base.route_prefix')) {
            $this->env = 'back';
        } else {
            $this->env = 'front';
        }

    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return View|string
     */
    public function render()
    {
        return view('components.alert');
    }
}
