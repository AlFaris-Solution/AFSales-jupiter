@extends('layouts.app')

@section('content-header')
      <h1>
        @lang('global.lhi.title')
        <small>Add</small>
      </h1>

      <ol class="breadcrumb">
        <li><a href="{{url('/')}}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="{{ route('lhi.index') }}"> @lang('global.lhi.title')</a></li>
        <li class="active">@lang('global.app_create')</li>
      </ol>    
@stop

@section('content')
{!! Form::open(['method' => 'POST', 'route' => ['lhi.store'], 'class' => 'form-horizontal']) !!}
    <div class="row">
        <div class="col-xs-12">

            <div class="panel panel-default">
                
                <div class="panel-heading">
                    @lang('global.app_create') LHI
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
                        <label for="tgl_lhi" class="col-sm-2 control-label">Tanggal LHI</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control datepicker" id="tgl_lhi" name="tgl_lhi" required value="{{ old('tgl_lhi') }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="kolektor" class="col-sm-2 control-label">kolektor</label>
                        <div class="col-sm-4">
                            <select name="kolektor" id="kolektor" class="form-control" required>
                                <option value="-">-- Pilih kolektor --</option>
                                @foreach ($kolektor as $list)
                                    <option value="{{ $list->id }}" {{ $list->id == old('kolektor') ? 'selected' : '' }}>{{ $list->nama_kontak }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="area" class="col-sm-2 control-label">Area</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="area" name="area" required value="{{ old('area') }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="id_produk" class="col-sm-2 control-label">Produk</label>
                        <div class="col-sm-6">
                            <select name="id_produk" id="id_produk" class="form-control" required>
                                <option value="-">-- Pilih Produk --</option>
                                @foreach ($products as $product)
                                    <option value="{{ $product->id }}" {{ $product->id == old('id_produk') ? 'selected' : '' }}>{{ $product->nama_produk }}</option>
                                @endforeach
                            </select>
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
<script>
    $('select').select2()
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy'
    })

    $('.kolektor').addClass('active')
    $('.kolektor ul').css('display', 'block')
</script>
@endsection

