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
                <a href="{{ route('komisi.create') }}" class="btn btn-success">@lang('global.app_add_new')</a>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-sm-12 mt-1">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h5 class="panel-title">
                    Daftar Komisi
                </h5>
            </div>

            <div class="panel-body table-responsive">
                <table class="table table-bordered table-striped">
                    <thead>
                        <th width="3%">#</th>
                        <th>Sedang Digunakan</th>
                        <th>Tgl Update</th>
                        <th>Komisi Sales</th>
                        <th>Komisi DB</th>
                        <th width="10%"><i class="fa fa-gear"></i></th>
                    </thead>
                    <tbody>
                        @foreach ($komisi as $key => $row)
                            <tr>
                                <td>{{ $key+1 }}</td>
                                <td>{!! $row->is_active == true ? '<span class="label label btn-success">Aktif</span>' : '-' !!}</td>
                                <td>{{ date('d/m/Y', strtotime($row->tgl_berubah)) }}</td>
                                <td>{{ $row->komisi_sales }}</td>
                                <td>{{ $row->komisi_db }}</td>
                                <td style="text-align: center;">
                                    <form action="{{ route('komisi.destroy', $row->id) }}" method="post">
                                        {{ csrf_field() }}
                                        <input type="hidden" name="_method" value="delete">

                                        <div class="btn-group">
                                            <a href="{{ route('komisi.edit', $row->id) }}" class="btn btn-warning"><i class="fa fa-pencil"></i></a>
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