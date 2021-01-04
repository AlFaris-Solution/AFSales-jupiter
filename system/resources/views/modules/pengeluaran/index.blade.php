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
        <a href="{{ route('pengeluaran.create') }}" class="btn btn-success">@lang('global.app_add_new')</a>
    </p>

    <div class="panel panel-default">
        <div class="panel-heading">
            @lang('global.app_list') Pengeluaran
        </div>

        <div class="panel-body">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th width="5%">No</th>
                        <th>Tanggal</th>
                        <th>Jenis Pengeluaran</th>
                        <th>Nominal</th>
                        <th width="10%" style="text-align: center;">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                	@foreach ($pengeluaran as $row)
                		<tr>
                			<td>{{ $no++ }}</td>
                            <td>{{ substr($row->created_at, 0, 10) }}</td>
                            <td>{{ $row->nama }}</td>
	                		<td>{{ number_format($row->nilai) }}</td>
	                		<td>
	                			<form action="{{ route('pengeluaran.destroy', $row->id) }}" method="post">
	                				{{ csrf_field() }} {{ method_field('DELETE') }}
	                				<a href="{{ route('pengeluaran.edit', $row->id) }}" class="btn btn-info"><i class="fa fa-pencil"></i></a>
	                				<button type="submin" class="btn btn-danger" onclick="return confirm('Yakin?')"><i class="fa fa-trash"></i></button>
	                			</form>
	                		</td>
                		</tr>
                	@endforeach
                </tbody>
            </table>
        </div>
    </div>
    </div>
@stop

@push('javascripts')
    <script>
    	$(function() {
    		$('.table').DataTable();
    	})
    </script>
@endpush