<?php
/*
 * This file is a part of Suzuki Membership Platform which is privately-owned by Vietnam Suzuki Corporation and for internal use only.
 * @package Suzuki Membership Platform
 * @copyright 2020. Vietnam Suzuki Corporation (VISUCO)
 * @author Nguyen Tran Duy Phuong <phuongntd@vietnamsuzuki.com.vn>
 * @link https://suzuki.com.vn
 */

namespace App\Providers;

use App\Models\Customer;
use Illuminate\Auth\EloquentUserProvider as UserProvider;
use Illuminate\Contracts\Auth\Authenticatable as UserContract;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\DB;


class CustomUserProvider extends UserProvider
{

    /**
     * Overrides the framework defaults validate credentials method
     *
     * @param  UserContract  $user
     * @param  array  $credentials
     * @return bool
     */
    public function validateCredentials(UserContract $user, array $credentials)
    {
        $plain = $credentials['password'];

//        $customer = Customer::where('user_id', $user->id)->get()->take(1);
//
//        $roles = $user->getRoleNames();
//
//        if ($roles->count() === 1 && $roles[0] == 'Customers') {
//            return false;
//        }

        return $this->hasher->check($plain, $user->getAuthPassword());
    }

}


