@inject('request', 'Illuminate\Http\Request')
@extends('layouts.app')

@section('content-header')
      <h1>
        @lang('global.so.title')
        <small>List</small>
      </h1>

      <ol class="breadcrumb">
        <li><a href="{{url('/')}}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">@lang('global.so.title')</li>
      </ol>    
@stop

@push('css')
    <style>
        .min-top {
            display: block;
            margin-top: -2.5em;
        }

        .mt-1 {
            margin-top: 1em !important;
        }
    </style>
@endpush

@section('content')   
<div class="row">
    <div class="col-sm-12">
        <div class="row">
            <div class="col-sm-2 mt-1">
                <a href="{{ route('lhi.create') }}" class="btn btn-success">@lang('global.app_add_new')</a>
            </div>
            <div class="col-sm-6 mt-1" style="display: none;">
                <form action="?" class="form-inline">
                    <input type="text" class="form-control datepicker" id="start_date" name="start_date" value="{{ request('start_date') }}" required>
                    <input type="text" class="form-control datepicker" id="end_date" name="end_date" value="{{ request('end_date') }}" required>
                    <button class="btn btn-secondary" style="margin-top: 5px;">Filter</button>
                </form>

                <small>Pastikan menekan tombol Filter, untuk melihat perubahan.</small>
            </div>
            
            <div class="col-sm-offset-6 col-sm-4 mt-1 hidden">
                <form action="{{ route('so.excel') }}" class="form-inline" method="post">
                    {{ csrf_field() }}
                    <input type="hidden" name="start_date" value="{{ request('start_date') }}">
                    <input type="hidden" name="end_date" value="{{ request('end_date') }}">
                    
                    <div class="col-md-8"></div>
                    <select name="ex" id="ex" class="form-control" style="margin-top: 5px;">
                        <option value="xlsx" selected>xlsx</option>
                        <option value="xls">xls</option>
                        <option value="csv">csv</option>
                    </select>
                    <button class="btn btn-success pull-right" style="margin-top: 5px;"><i class="fas fa-file-excel"></i>Export</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-sm-12 mt-1">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h5 class="panel-title">
                    Daftar LHI
                </h5>
            </div>

            <div class="panel-body table-responsive">
                <table class="table table-bordered table-striped">
                    <thead>
                        <th width="3%">#</th>
                        <th>ID LHI</th>
                        <th>Nama Kolektor</th>
                        <th>Tanggal LHI</th>
                        <th>Area</th>
                        <th width="10%"><i class="fa fa-gear"></i></th>
                    </thead>
                    <tbody>
                        @foreach ($lhi as $key => $list)
                            <tr>
                                <td>{{ $key+1 }}</td>
                                <td>{{ $list->code }}</td>
                                <td>{{ $list->kontak_kolektor['nama_kontak'] }}</td>
                                <td>{{ $list->tgl_lhi }}</td>
                                <td>{{ $list->area }}</td>
                                <td style="text-align: center;">
                                    <form action="{{ route('lhi.destroy', $list->id) }}" method="post">
                                        {{ csrf_field() }}
                                        <input type="hidden" name="_method" value="DELETE">
                                        <div class="btn-group">
                                            <a href="{{ route('lhi_detail.index', $list->code) }}" class="btn btn-default" title="Detail"><i class="fa fa-eye"></i></a>
                                            <a href="{{ route('lhi.edit', $list->id) }}" class="btn btn-warning"><i class="fa fa-pencil"></i></a>
                                            <button class="btn btn-danger" onclick="return confirm('Yakin?')"><i class="fa fa-trash"></i></button>
                                        </div>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@stop

@push('javascripts')
<script>
    $('.table').DataTable()
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy'
    })
</script>
@endpush