@extends('dashboard.right-column-card')

@section('card-title'){{ __('dashboard.personal_info') }}@endsection
@section('card-subtitle'){{ __('dashboard.personal_info_description') }}@endsection

@section('card-content')
    <form class="form" method="post">
        {{ @csrf_field() }}
        <div class="card-body">
            @if (Session::has('info_saved'))
                <x-alert type="success" :message="Session::get('info_saved')"/>
                {{--                        @include('partials.alert', ['type' => 'success', 'message' => Session::get('info_saved')])--}}
            @endif
            <div class="row">
                <div class="col-12">
                    <h5 class="font-weight-bold mb-6">{{ __('dashboard.identity_info') }}</h5>
                    <p class="text-muted text-justify">{{ __('dashboard.identity_help_text') }}</p>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-xl-3 col-lg-3 col-form-label" for="name">Tên:</label>
                <div class="col-lg-9 col-xl-9">
                    <input id="name" class="form-control" disabled type="text" value="{{ $customer->name }}">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-lg-3 col-form-label" for="name">CMND/CCCD:</label>
                <div class="col-lg-4">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Số:</span>
                        </div>
                        <input class="form-control" disabled type="text" value="{{ $customer->id_number ?? '' }}">
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Ngày cấp:</span>
                        </div>
                        <input class="form-control" disabled type="text" value="{{ $customer->id_issue_date ? $customer->id_issue_date->format('d/m/Y') : ''}}">
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-lg-9 offset-3">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Nơi cấp:</span>
                        </div>
                        <input class="form-control" disabled type="text" value="{{ $customer->id_issue_province ? $customer->province_of_id->name : ''}}">
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-xl-3 col-lg-3 col-form-label" for="address">Địa chỉ thường trú:
                    <span class="text-danger">*</span></label>
                <div class="col-lg-9">
                    <input id="address" name="address" required class="form-control" type="text" value="{{ $customer->address }}">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-3 col-form-label" for="districtSelector"></label>
                <div class="col-lg-4">
                    <select class="form-control select2" required name="district_id" id="districtSelector">
                        @foreach($districts as $districtId => $districtName)
                            <option value="{{ $districtId }}" @if($customer->district->id === $districtId) selected @endif>
                                {{ $districtName }}
                            </option>
                        @endforeach
                    </select>
                </div>
                <div class="col-lg-5">
                    <select class="form-control" required name="province_id" id="provinceSelector">
                        @foreach($provinces as $provinceId => $provinceName)
                            <option value="{{ $provinceId }}" @if($customer->province->id === $provinceId) selected @endif>
                                {{ $provinceName }}
                            </option>
                        @endforeach
                    </select>
                </div>
            </div>

            <div class="row">
                {{--                        <label class="col-xl-3"></label>--}}
                <div class="col">
                    <h5 class="font-weight-bold mt-10 mb-6">{{ __('dashboard.contact_info') }}</h5>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-xl-3 col-lg-3 col-form-label" for="customer-mobile">{{ __('dashboard.phone_number') }}</label>
                <div class="col-lg-9 col-xl-6">
                    <input type="text" id="customer-mobile" readonly disabled class="form-control form-control-solid" value="{{ $customer->mobile }}" placeholder="Phone">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-xl-3 col-lg-3 col-form-label">{{ __('dashboard.email_address') }}</label>
                <div class="col-lg-9 col-xl-6">
                    <input type="text" readonly disabled class="form-control form-control-solid" value="{{ $customer->email }}" placeholder="Email">
                </div>
            </div>
        </div>
        <div class="card-footer">
            <button type="submit" class="btn btn-primary mr-2"> {{ __('dashboard.save_changes') }}</button>
            <a href="{{ route('dashboard-home') }}" class="btn btn-secondary">{{ __('dashboard.cancel') }}</a>
        </div>
    </form>
@endsection