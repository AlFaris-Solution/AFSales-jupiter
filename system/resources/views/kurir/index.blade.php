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
        <a href="{{ route('kurir.create') }}" class="btn btn-success">@lang('global.app_add_new')</a>
    </p>

    <div class="panel panel-default">
        <div class="panel-heading">
            @lang('global.app_list') Kurir
        </div>

        <div class="panel-body">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th width="5%">No</th>
                        <th>Nama</th>
                        <th width="10%" style="text-align: center;">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                	@foreach ($kurir as $row)
                		<tr>
                			<td>{{ $no++ }}</td>
	                		<td>{{ $row->nama_kurir }}</td>
	                		<td>
	                			<form action="{{ route('kurir.destroy', $row->id_kurir) }}" method="post">
	                				{{ csrf_field() }} {{ method_field('DELETE') }}
	                				<a href="{{ route('kurir.edit', $row->id_kurir) }}" class="btn btn-info"><i class="fa fa-pencil"></i></a>
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