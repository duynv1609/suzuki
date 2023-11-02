<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;

class PasswordChangeRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return Auth::check();
//        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        if ($this->method() === 'POST') {
            return [
                'current_password' => 'required|password',
                'new_password'     => 'gte:8|confirmed'
            ];
        } else {
            return [];
        }

    }

    /**
     * Get the error messages for the defined validation rules.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'current_password.password' => __('dashboard.incorrect_current_password'),
            'new_password.confirmed'    => __('dashboard.passwords_mismatch'),
            'new_password.size'         => __('dashboard.password_length'),
        ];
    }
}
