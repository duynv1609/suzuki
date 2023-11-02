<?php

namespace App\Http\Requests;

use App\Http\Requests\Request;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class VehicleRequest extends FormRequest
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
        $user = Auth::getUser();

        if ($this->method() == 'PUT') {
            $unique = $this->id;
        } else {
            $unique = '0';
        }

        if ($user->isDealer()) {
            $dealer = [
                'required',
                Rule::in([$user->dealer_id])
            ];
        } else {
            $dealer = 'required';
        }

        return [
            'frame_number'     => 'required|unique:App\Models\Vehicle,frame_number,'.$unique,
            'customer'         => 'required',
            'model'            => 'required',
            'vehicle_color_id' => 'required',
            'purchased_at'     => 'nullable|before_or_equal:today',
            'dealer'           => $dealer,
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
