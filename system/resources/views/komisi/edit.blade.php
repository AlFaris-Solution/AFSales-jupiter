@extends('layouts.app')

@section('content-header')
      <h1>
        @lang('global.komisi.title')
        <small>Add</small>
      </h1>

      <ol class="breadcrumb">
        <li><a href="{{ url('/') }}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="{{ route('komisi.index') }}"> @lang('global.komisi.title')</a></li>
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
{!! Form::open(['method' => 'PUT', 'route' => ['komisi.update', $komisi->id],'class' => 'form-horizontal']) !!}
    <div class="row">
        <div class="col-xs-12">

            <div class="panel panel-default">
                
                <div class="panel-heading">
                    @lang('global.app_edit') Edit
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
                        <label for="tgl_berubah" class="col-sm-2 control-label">Tanggal Berubah</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control datepicker" id="tgl_berubah" name="tgl_berubah" required 
                                value="{{ date('d/m/Y') }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="komisi_sales" class="col-sm-2 control-label">Komisi Sales</label>
                        <div class="col-sm-2">
                            <input type="number" class="form-control" id="komisi_sales" name="komisi_sales" required value="{{ $komisi->komisi_sales }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="komisi_db" class="col-sm-2 control-label">Komisi DB</label>
                        <div class="col-sm-2">
                            <input type="number" class="form-control" id="komisi_db" name="komisi_db" required value="{{ $komisi->komisi_db }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="is_active" class="col-sm-2 control-label">Digunakan ?</label>
                        <div class="col-sm-2">
                            <input type="checkbox" id="is_active" name="is_active" value="1" {{ $komisi->is_active == 1 ? 'checked' : '' }}>
                        </div>
                    </div>

                    <div class="btn-group pull-right">
                        <a href="{{ route('komisi.index') }} " class="btn btn-primary"><i class="fa fa-chevron-left fa-fw"></i> Back</a>
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
</script>
@endsection

