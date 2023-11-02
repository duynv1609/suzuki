<?php

namespace App\Http\Requests;

use App\Http\Requests\Request;
use App\Models\VoucherCode;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class OrderRequest extends FormRequest
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
            'customer_id'     => 'required|exists:customers,id',
            'dealer_id'       => 'required|exists:dealers,id',
            'vehicle_id'      => 'required|exists:vehicles,id',
            'original_value'  => 'required|numeric|gt:0',
            'invoice_code'    => [
                'bail',
                'required',
                'alpha_num',
                'not_regex:/BH.+/',
                Rule::unique('orders')->ignore($this->id)
            ],
            'ordered_at'      => 'required',
            'voucher_code_id' => [
                'sometimes',
                'exists:voucher_codes,id',
                function ($attribute, $value, $fail) {
                    $voucherCode = VoucherCode::find($value);
                    if (!$voucherCode || !$voucherCode->isUsable()) {
                        $fail('Mã voucher '.$value.' không sử dụng được.');
                    }
                }
            ]
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
            'invoice_code.not_regex' => 'Hóa đơn Bảo hiểm / Bảo hành không cần thêm vào hệ thống.'
        ];
    }
}
