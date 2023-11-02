<?php

namespace App\Http\Requests;

use App\Http\Requests\Request;
use Illuminate\Foundation\Http\FormRequest;

class VehicleModelRequest extends FormRequest
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
        return [
            'id' => 'required|min:5|max:20',
            'name' => 'required|min:3|max:100',
            'slug' => 'required|regex:/[a-z-0-9]/',
            'year' => 'required|digits:4|gte:1900'

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
            'id' => 'Mã của mẫu xe',
            'slug' => 'Slug của mã mẫu xe',
            'name' => 'Tên của mẫu xe',
            'year' => 'Năm (đời) của mẫu xe',
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
            'required' => 'Bạn vui lòng nhập :attribute.',
            'regex' => ':Attribute không đúng định dạng.',
            'gte' => ':Attribute vui lòng nhập lớn hơn năm 1900.',
            'digits' => ':Attribute vui lòng nhập đúng năm.',

        ];
    }
}
