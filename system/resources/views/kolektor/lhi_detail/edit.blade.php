@extends('layouts.app')

@section('content-header')
      <h1>
        @lang('global.lhi.title')
        <small>Add</small>
      </h1>

      <ol class="breadcrumb">
        <li><a href="{{ url('/') }}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="{{ route('lhi_detail.index', $lhiDetail->code) }}"> @lang('global.lhi.title')</a></li>
        <li class="active">@lang('global.app_create')</li>
      </ol>    
@stop

@section('content')
{!! Form::open(['method' => 'PUT', 'route' => ['lhi_detail.update', $lhiDetail->id], 'class' => 'form-horizontal']) !!}
    <div class="row">
        <div class="col-xs-12">

            <div class="panel panel-default">
                
                <div class="panel-heading">
                    @lang('global.app_edit') Kwitansi
                </div>

                @if (count($errors) > 0)
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
                
                <div class="panel-body table-responsive">
                    <div class="form-group">
                        <label for="pelanggan" class="col-sm-2 control-label">Pelanggan</label>
                        <div class="col-sm-3">
                            <select name="pelanggan" id="pelanggan" class="form-control" required>
                                <option value="-">-- Pilih Pelanggan --</option>
                                @foreach ($kordinator as $list)
                                    <option value="{{ $list->id }}" {{ $list->id == $lhiDetail->pelanggan ? 'selected' : '' }}>{{ $list->nama_kontak }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="no_kwitansi" class="col-sm-2 control-label">No Kwitansi (SO)</label>
                        <div class="col-sm-2">
                            <select name="no_kwitansi" id="no_kwitansi" class="form-control">
                                <option>-- Masukan Kwitansi (SO) --</option>
                                @foreach ($no_so as $list)
                                    <option value="{{ $list->no_so }}" {{ $list->no_so == $lhiDetail->no_kwitansi ? 'selected' : '' }}>{{ $list->no_so }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tgl_angsuran" class="col-sm-2 control-label">Tanggal Angsuran</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control datepicker" id="tgl_angsuran" name="tgl_angsuran" required value="{{ $lhiDetail->tgl_angsuran }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="angsuran_ke" class="col-sm-2 control-label">Angsuran Ke-</label>
                        <div class="col-sm-1">
                            <input type="number" class="form-control" id="angsuran_ke" name="angsuran_ke" required value="{{ $lhiDetail->angsuran_ke }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="value_awal" class="col-sm-2 control-label">Value Kwitansi (Awal)</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="value_awal" name="value_awal" value="{{ $lhiDetail->value_awal }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="value_sekarang" class="col-sm-2 control-label">Value Kwitansi (Sekarang)</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="value_sekarang" name="value_sekarang" value="{{ $lhiDetail->value_sekarang }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="nominal_tagihan" class="col-sm-2 control-label">Harus Tagih <small>(Nominal Tagihan)</small></label>
                        <div class="col-sm-2">
                            <input type="number" class="form-control" id="nominal_tagihan" name="nominal_tagihan" required value="{{ $lhiDetail->nominal_tagihan }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tertagih" class="col-sm-2 control-label">Tertagih</label>
                        <div class="col-sm-2">
                            <input type="number" class="form-control" id="tertagih" name="tertagih" required value="{{ $lhiDetail->tertagih }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sisa_tagihan" class="col-sm-2 control-label">Sisa Tagihan</label>
                        <div class="col-sm-2">
                            <input type="number" class="form-control" id="sisa_tagihan" name="sisa_tagihan" required value="{{ $lhiDetail->sisa_tagihan }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tgl_janji" class="col-sm-2 control-label">Tanggal Janji</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control datepicker" id="tgl_janji" name="tgl_janji" required value="{{ $lhiDetail->tgl_janji }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="keterangan" class="col-sm-2 control-label">Keterangan</label>
                        <div class="col-sm-4">
                            <textarea name="keterangan" id="keterangan" class="form-control">{{ $lhiDetail->keterangan }}</textarea>
                        </div>
                    </div>

                    <div class="btn-group pull-right">
                        <a href="{{ route('lhi_detail.index', $lhiDetail->code) }} " class="btn btn-primary"><i class="fa fa-chevron-left fa-fw"></i> Back</a>
                        <button type="submit" class="btn btn-success" style="margin-left: 5px;">
                        <i class="fa fa-check fa-fw"></i> Save</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
{!! Form::close() !!}
@stop

@section('javascript')
<script>
    $('select').select2()
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy'
    })

    $('.kolektor').addClass('active')
    $('.kolektor ul').css('display', 'block')

    $('#no_kwitansi').on('change', function() {
        $.get({
            url: '{{ url('/get_so') }}/' + $(this).val(),
            success: (data) => {
                $('#pelanggan').val(data.kordinator).trigger('change')
                $('#nominal_tagihan').val(data.angsuran_perbulan * data.jml_act)
                $('#tertagih').val(0)
                $('#sisa_tagihan').val(0)
            },
            error: (err) => {
                if (err.status == 404) {
                    $('#pelanggan').val('')
                    $('#nominal_tagihan').val('')
                    $('#tertagih').val(0)
                    $('#sisa_tagihan').val('')
                }
            }
        })
    })
</script>
@endsection

