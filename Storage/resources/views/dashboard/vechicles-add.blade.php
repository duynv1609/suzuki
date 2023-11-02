@extends('dashboard.right-column-card')

@section('card-title') {{ __('dashboard.add_vehicle') }} @endsection
@section('card-subtitle'){{ __('dashboard.add_vehicle_description') }}@endsection

@section('card-content')
    <form action="{{ route('dashboard-vehicle-add') }}" method="post">
        <div class="card-body">
            @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif
            @csrf
            <div class="form-group row">
                <label class="col-xl-3 col-lg-3 col-form-label" for="type-selector">Loại xe:
                    <span class="text-danger">*</span></label>
                <div class="col-lg-9 col-xl-6">
                    <select class="form-control" onchange="catchEvent()" id="type-selector" name="type" required>
                        {{--  TODO: Display old values from selections --}}
                        <option value=""></option>
                        @foreach(config('constants.vehicle_model.2w4w') as $slug=>$name)
                            {{--  TODO: Display old values from selections --}}
                            <option value="{{ $slug }}">{{$name}}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-xl-3 col-lg-3 col-form-label" for="model-selector">Dòng xe:
                    <span class="text-danger">*</span></label>
                <div class="col-lg-9 col-xl-6">
                    <select class="form-control selectpicker" data-live-search="true" onchange="getFrame()"
                            id="model-selector" name="model" required>

                        <option value=""></option>
                        {{--                        @foreach(config('constants.vehicle_model.slug') as $slug=>$name)--}}
                        {{--                            --}}{{--  TODO: Display old values from selections --}}
                        {{--                            <option value="{{ $slug }}">{{$name}}</option>--}}
                        {{--                        @endforeach--}}
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-xl-3 col-lg-3 col-form-label" for="version-selector">Phiên bản:
                    <span class="text-danger">*</span></label>
                <div class="col-lg-9 col-xl-6">
                    <select class="form-control" id="version-selector" name="variant" required></select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-xl-3 col-lg-3 col-form-label" for="color-selector">Màu sắc:
                    <span class="text-danger">*</span></label>
                <div class="col-lg-9 col-xl-6">
                    <select class="form-control" id="color-selector" name="color" required>

                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-xl-3 col-lg-3 col-form-label" for="year-selector">Năm sản xuất:
                    <span class="text-danger">*</span></label>
                <div class="col-lg-9 col-xl-6">
                    <select class="form-control" id="year-selector" name="year" required>
                        @for ($i = now()->year; $i >= 2005 ; $i--)
                            <option @if(old('year') == $i) selected="selected" @endif value="{{ $i }}">{{$i}}</option>
                        @endfor
                        <option value="0">Khác</option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-xl-3 col-lg-3 col-form-label" for="frame_number">Số khung (VIN):
                    <span class="text-danger">*</span>
                </label>
                <div class="col-lg-9 col-xl-6">
                    <div class="input-group">
                        <span class="input-group-text" id="frame_number_text"></span>
                        <input type="hidden" id="frame_text_input" name="frame_number">
                        <input id="frame_number" class="form-control"
                               value="{{ old('frame_number') }}"
                               placeholder="Nhập số khung tiếp theo"
                               type="text" name="" required minlength="6" maxlength="7">
                    </div>
                    <span style="font-size: 9px">Số khung có ký tự bắt đầu là: </span>
                    <span style="font-size: 9px; color: red;" id="frame_number_txt"></span>

                </div>
            </div>


            <div class="form-group row">
                <label class="col-xl-3 col-lg-3 col-form-label" for="dealer-selector">Đại lý mua xe:
                    <span class="text-danger">*</span></label>
                <div class="col-lg-9 col-xl-6">
                    <select class="form-control" id="dealer-selector" name="dealer" required>
                        @foreach($dealers as $dealer)
                            <option @if(old('dealer') == $dealer->id) selected="selected"
                                    @endif value="{{ $dealer->id }}">{{$dealer->name}}</option>
                        @endforeach
                        <option value="0">Đại lý khác</option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-xl-3 col-lg-3 col-form-label" for="purchased-at">Ngày mua:
                    <span class="text-danger">*</span></label>
                <div class="col-lg-9 col-xl-6">
                    <input id="purchased-at" class="form-control text-uppercase"
                           required="required"
                           min='2021-01-01' max='2030-13-13'
                           value="{{ old('purchased_at') }}"
                           type="date" name="purchased_at">
                    {{--                        <span class="form-text text-muted">Chấp nhận các định dạng biển số ở Việt Nam</span>--}}
                </div>
            </div>
            <div class="form-group row">
                <label class="col-xl-3 col-lg-3 col-form-label" for="plate-number">Biển số:</label>
                <div class="col-lg-9 col-xl-6">
                    <input id="plate-number" class="form-control text-uppercase" value="{{ old('plate_number') }}"
                           type="text" name="plate_number">
                    <span class="form-text text-muted">Chấp nhận các định dạng biển số ở Việt Nam</span>
                </div>
            </div>
            <p class="text-info">
                <i class="la la-info-circle text-info"></i>
                Những thông tin này của xe sẽ được sử dụng để tích lũy điểm và hưởng các quyền lợi khi Hội viên thực
                hiện dịch vụ tại đại lý. Vì vậy, vui lòng kiểm tra kỹ trước khi gửi.
            </p>
            <div class="form-group row">
                <div class="col-xl-3 col-lg-3"></div>
                <div class="col-lg-9 col-xl-6">
                    <label class="check-box">
                        <input type="checkbox" name="confirmation" required>
                        <span></span> Tôi đã kiểm tra và xác nhận thông tin gửi đi là chính xác.
                    </label>
                </div>
            </div>
        </div>
        <div class="card-footer">
            <div class="form-group">
                <input class="btn btn-primary" type="submit" value="Thêm xe này">
            </div>
        </div>
    </form>

@endsection

@push('scripts-stack')

    <script>
        $("#frame_number").on('keyup change', function () {
            let value = $(this).val();
            let text = $('#frame_number_text').text();
            let texts = text + value;
            console.log(texts);
            $('#frame_number_txt').text(texts);
            $('#frame_text_input').val(texts);
        })
    </script>
    Hello
    <script type="text/javascript">
        let vehicleTypes = @json($types, JSON_PRETTY_PRINT);
        // console.log('vehicle types', vehicleTypes)
        let vehicleModels = @json($models, JSON_PRETTY_PRINT);
        // console.log('vehicle models', vehicleModels)
        let vehicleColors = @json($colors, JSON_PRETTY_PRINT);
        SMPDashboard.initAddNewVehicle();


        $(function () {
            $('#frame_number').keyup(function () {
                this.value = this.value.toLocaleUpperCase();
            });
        });

        //Create variable to save the data
        let arrayType;

        //Create a function to catch event of the select box
        function catchEvent() {
            let values = $("#model-selector").val();

            //Get value when we selected the option
            let value = $("#type-selector").val();
            //Convert the JSON to Array
            const arr = Object.entries(vehicleModels).sort()

            // Assign the variable to get the data based on the "2W4W" type vehicle
            arrayType = arr.filter(parent => {
                const childArray = parent[1].filter(child => {
                    //Executed the condition of the "2W4W" type vehicle
                    if (child['2w4w'] == value) {
                        return child;
                    }
                })

                //If length childArray not equal 0, it will be return childArray
                if (!childArray.length == 0) {
                    return childArray;
                }
            })
            // Create a variable to tranfer slug to name and foreach
            let slug = [@foreach(config('constants.vehicle_model.slug') as $slug=>$name)
            [`{{$slug}}`, `{{$name}}`],
                @endforeach]
            // console.log('ex', slug);

            //Create a variable to display value in HTML
            let option = '';
            arrayType.forEach(item => {
                //Get transferred $slug variable
                slug.forEach(slug => {
                    //Compared the transferred slug variable with slug data at the DB to get the name
                    if (slug[0] == item[0]) {

                        // console.log('item1',item[1][0]['prefix_code_frame'])
                        //String concatenation between item and slug
                        option += `<option data-frame = "` + item[1][0]['prefix_code_frame'] + `"  value=` + item[0] + `>` + slug[1] + `</option>`
                    }
                })
            })

            $('#model-selector').html(option);
            if (arrayType.length > 0) {
                arrayType.splice(0, arrayType.length);
            }
            $("#model-selector").val($("#model-selector option:first").val());
            let val = $("#model-selector").val();
            if (val) {
                getFrame();
            }

        }

        let frame

        function getFrame() {
            //Get value when we selected the option
            frame = $("#model-selector").find(':selected').attr('data-frame');
            $('#frame_number_txt').html(frame);
            $('#frame_number_text').html(frame);
            //DANG LAM
            let getValue = $("#frame_number_text").text();
            let getName = $("input[name=frame_number]").val();
            let assign = getValue + getName
            console.log('getTextSpan', assign)

        }


        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!
        var yyyy = today.getFullYear();
        if (dd < 10) {
            dd = '0' + dd
        }
        if (mm < 10) {
            mm = '0' + mm
        }

        today = yyyy + '-' + mm + '-' + dd;
        document.getElementById("purchased-at").setAttribute("max", today);

    </script>
@endpush
