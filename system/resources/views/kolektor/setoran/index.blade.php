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
                <a href="{{ route('setoran_lhi.create') }}" class="btn btn-success">@lang('global.app_add_new')</a>
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
                    Daftar Setoran Kolektor
                </h5>
            </div>

            <div class="panel-body table-responsive">
                <table class="table table-bordered table-striped">
                    <thead>
                        <th width="3%">#</th>
                        <th>ID LHI</th>
                        <th>No. Kwitansi / SO</th>
                        <th>Tgl Bayar</th>
                        <th>Jml Bayar</th>
                        <th>Tgl Angsuran</th>
                        <th>Angsuran Ke</th>
                        <th>Tgl Janji</th>
                        <th>Ket</th>
                        <th width="10%"><i class="fa fa-gear"></i></th>
                    </thead>
                    <tbody>
                        @foreach ($lhiSetoran as $key => $row)
                            <tr>
                                <td>{{ $key+1 }}</td>
                                <td>{{ $row->code }}</td>
                                <td>{{ $row->no_kwitansi }}</td>
                                <td>{{ $row->tgl_bayar }}</td>
                                <td>@currency($row->jml_bayar)</td>
                                <td>{{ $row->tgl_angsuran }}</td>
                                <td>{{ $row->angsuran_ke }}</td>
                                <td>{{ $row->tgl_janji }}</td>
                                <td>{{ $row->keterangan }}</td>
                                <td style="text-align: center;">
                                    <form action="{{ route('setoran_lhi.destroy', $row->id) }}" method="post">
                                        {{ csrf_field() }}
                                        <input type="hidden" name="_method" value="delete">

                                        <div class="btn-group">
                                            <a href="{{ route('setoran_lhi.edit', $row->id) }}" class="btn btn-warning"><i class="fa fa-pencil"></i></a>
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