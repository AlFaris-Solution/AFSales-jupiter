@extends('layouts.app')

@section('content-header')
      <h1>
        @lang('global.lhi.title')
        <small>Add</small>
      </h1>

      <ol class="breadcrumb">
        <li><a href="{{ url('/') }}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="{{ route('lhi.index') }}"> @lang('global.lhi.title')</a></li>
        <li class="active">@lang('global.app_edit')</li>
      </ol>    
@stop

@push('css')
    <link href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    <style>
        .select2 {
            width:100%!important;
        }
    </style>
@endpush

@section('content')
{!! Form::open(['method' => 'PUT', 'route' => ['setoran_lhi.update', $lhiSetoran->id],'class' => 'form-horizontal']) !!}
    <div class="row">
        <div class="col-xs-12">

            <div class="panel panel-default">
                
                <div class="panel-heading">
                    @lang('global.app_edit') Setoran Kolektor
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
                        <label for="kolektor" class="col-sm-2 control-label">Kolektor</label>
                        <div class="col-sm-2">
                            <select name="kolektor" id="kolektor" class="form-control" required>
                                <option value="-">-- Pilih Kolektor --</option>
                                @foreach ($kolektor as $list)
                                    <option value="{{ $list->id }}" {{ $list->id == old('kolektor') ? 'selected' : '' }}>{{ $list->nama_kontak }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="code" class="col-sm-2 control-label">ID LHI</label>
                        <div class="col-sm-2">
                            <select name="code" id="code" class="form-control" required>
                                <option value="-">-- Pilih LHI --</option>
                                @foreach ($lhi as $list)
                                    <option value="{{ $list->code }}" {{ $list->code == $lhiSetoran->code ? 'selected' : '' }}>{{ $list->code }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="no_kwitansi" class="col-sm-2 control-label">No Kwitansi (SO)</label>
                        <div class="col-sm-2">
                            <select name="no_kwitansi" id="no_kwitansi" class="form-control">
                                <option>-- Masukan No Kwitansi --</option>
                                @foreach ($no_so as $list)
                                    <option value="{{ $list->no_so }}" {{ $list->no_so == $lhiSetoran->no_kwitansi ? 'selected' : '' }}>{{ $list->no_so }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tgl_bayar" class="col-sm-2 control-label">Tanggal Bayar</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control datepicker" id="tgl_bayar" name="tgl_bayar" required value="{{ $lhiSetoran->tgl_bayar }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="jml_bayar" class="col-sm-2 control-label">Jumlah Bayar</label>
                        <div class="col-sm-1">
                            <input type="number" class="form-control" id="jml_bayar" name="jml_bayar" required value="{{ $lhiSetoran->jml_bayar }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="angsuran_ke" class="col-sm-2 control-label">Angsuran Ke</label>
                        <div class="col-sm-1">
                            <input type="number" class="form-control" id="angsuran_ke" name="angsuran_ke" required value="{{ $lhiSetoran->angsuran_ke }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tgl_janji" class="col-sm-2 control-label">Tanggal Janji</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control datepicker" id="tgl_janji" name="tgl_janji" required value="{{ $lhiSetoran->tgl_janji }}">
                            <span class="text-muted d-none"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="keterangan" class="col-sm-2 control-label">Keterangan</label>
                        <div class="col-sm-3">
                            <textarea name="keterangan" id="keterangan" class="form-control">{{ $lhiSetoran->keterangan }}</textarea>
                        </div>
                    </div>

                    <div class="btn-group pull-right">
                        <a href="{{ route('lhi.index') }} " class="btn btn-primary"><i class="fa fa-chevron-left fa-fw"></i> Back</a>
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
<script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script>
    $('select').select2()
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy'
    })

    $('#kolektor').on('change', function() {
        $.get({
            url: '{{ url('/get_lhi') }}/' + $(this).val(),
            success: (data) => {
                $('#code').empty();
                let opt = null;

                opt += `<option value="-">-- Pilih LHI --</option>`;
                $.each(data, (e, val) => {
                    opt += `<option value="${val.code}">${val.code}</option>`;
                });
                $('#code').append(opt);
            },
            error: (err) => {
                if (err.status == 404) {
                    $('#code').empty();
                }
            }
        })
    })

    $('#code').on('change', function() {
        $.get({
            url: '{{ url('/get_lhi_detail') }}/' + $(this).val(),
            success: (data) => {
                $('#no_kwitansi').empty();
                let opt = null;

                opt += `<option value="-">-- Masukan No Kwitansi --</option>`;
                $.each(data, (e, val) => {
                    opt += `<option value="${val.no_kwitansi}">${val.no_kwitansi}</option>`;
                });
                $('#no_kwitansi').append(opt);
            },
            error: (err) => {
                if (err.status == 404) {
                    $('#no_kwitansi').empty();
                }
            }
        })
    })

    $('#no_kwitansi').on('change', function() {
        $.get({
            url: '{{ url('/get_lhi_detail') }}/' + $('#code').val(),
            success: (response) => {
                let data = response[0];
                $('#jml_bayar').val(data.sisa_tagihan)
                $('#angsuran_ke').val(data.angsuran_ke)
                $('#tgl_janji').val(data.tgl_janji)
                $('.text-muted').removeClass('d-none')
                $('.text-muted').text(data.tgl_janji)
            },
            error: (err) => {
                if (err.status == 404) {
                    $('#jml_bayar').val('')
                    $('#angsuran_ke').val('')
                    $('#tgl_janji').val('')
                    $('.text-muted').addClass('d-none')
                }
            }
        })
    })
</script>
@endsection

