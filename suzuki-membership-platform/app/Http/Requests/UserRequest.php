<?php

namespace App\Http\Requests;

use App\Http\Requests\Request;
use App\Models\Customer;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;

class UserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        // only allow updates if the user is logged in
        return backpack_auth()->check();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $request = $this;

        if ($this->method() == 'PUT') { // Updating user
            $uniqueUserID = $this->id;
        } else {
            $uniqueUserID = '0';
        }

        if (Str::contains(Route::currentRouteName(), 'store') || Str::contains(Route::currentRouteName(), 'create')) {
            $password = 'required|gte:8|confirmed';
            $password_confirm = 'required';
        } else {
            $password = 'nullable|gte:8|confirmed';
            $password_confirm = '';
        }

        return [
            'email'                 => 'email|required|unique:App\Models\User,email,'.$uniqueUserID,
            'password'              => $password,
            'password_confirmation' => $password_confirm,
            'roles'                 => 'required',
            'dealer'                => Rule::requiredIf(function () use ($request) {
                if ($request->roles && in_array('3',
                        $request->roles)) { // Requires dealer_id if this user has role "Dealers"
                    return true;
                }
                return false;
            })
        ];
    }

    /**
     * Get the validation attributes that apply to the request.
     *
     * @return array
     */
    public function attributes()
    {
        return [
            //
        ];
    }

    /**
     * Get the validation messages that apply to the request.
     *
     * @return array
     */
    public function messages()
    {
        return [
            //
        ];
    }
}
