<?php
/*
 * This file is a part of Suzuki Membership Platform which is privately-owned by Vietnam Suzuki Corporation and for internal use only.
 * @package Suzuki Membership Platform
 * @copyright 2020. Vietnam Suzuki Corporation (VISUCO)
 * @author Nguyen Tran Duy Phuong <phuongntd@vietnamsuzuki.com.vn>
 * @link https://suzuki.com.vn
 */

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\View;
use Illuminate\Validation\ValidationException;
use Input;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function showLoginForm()
    {
        return view('auth.login', [
            'useBlankLayout' => true
        ]);
    }

    /**
     * Allow users to login using their email address or mobile phone number
     *
     */
    public function username()
    {
        $login = request()->input('username');
        if (is_numeric($login)) {
            $field = 'mobile';
        } elseif (filter_var($login, FILTER_VALIDATE_EMAIL)) {
            $field = 'email';
        } else {
            $field = 'username';
        }
        request()->merge([$field => $login]);
        return $field;
    }

    protected function sendFailedLoginResponse(Request $request)
    {
        throw ValidationException::withMessages([
            $this->username() => __('auth.failed')
        ]);
    }

    protected function authenticated(Request $request, $user)
    {

    }
}
