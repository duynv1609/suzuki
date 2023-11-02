<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CustomerRequest extends FormRequest
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
        if ($this->method() == 'PUT') {
            $unique = $this->id;
        } else {
            $unique = '0';
        }
        return [
            'name'           => 'required',
            'birthday'       => 'required|before:today|after:1900-01-01',
            'mobile'         => 'required|digits:10|unique:App\Models\Customer,mobile,'.$unique,
            'email'          => 'email|unique:App\Models\Customer,email,'.$unique,
            'district_id'    => 'required|numeric',
            'province'       => 'required|numeric',
            'address'        => 'required',
            'id_number'      => 'required|alpha_num|unique:App\Models\Customer,id_number,'.$unique,
            'id_issue_date'  => 'required|date|before:today',
            'gender'         => 'required|numeric',
            'dealer'         => 'required|numeric',
            'province_of_id' => 'required|numeric',
            'new_password'   => 'nullable|confirmed|gte:8'
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
            'mobile'        => 'mobile phone number',
            'email'         => 'email address',
            'id_issue_date' => 'ID issue date',
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
