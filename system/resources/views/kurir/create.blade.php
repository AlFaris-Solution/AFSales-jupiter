@extends('layouts.app')

@section('content-header')
      <h1>
        @lang('global.akun.title')
        <small>List</small>
      </h1>

      <ol class="breadcrumb">
        <li><a href="{{url('/')}}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">@lang('global.akun.title')</li>
      </ol>    
@stop

@section('content')   
<div class="row">
    <p>
        <span style="color: transparent;">asasasasasa</span>
    </p>
    <div class="panel panel-default">
        <div class="panel-heading">
            Tambah Data Kurir
        </div>

        <div class="panel-body">
            <form action="{{ route('kurir.store') }}" method="post">
                {{ csrf_field() }} {{ method_field('POST') }}
                <div class="form-group">
                    <label for="name">Nama Kurir</label>
                    <input type="text" name="name" id="name" class="form-control" required autofocus style="width: 60%">
                </div>

                <div class="form-group">
                    <button class="btn btn-primary" type="submit">Simpan</button>
                </div>
            </form>
        </div>
    </div>
    </div>
@stop