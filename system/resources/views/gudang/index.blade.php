@inject('request', 'Illuminate\Http\Request')
@extends('layouts.app')

@section('content-header')
      <h1>
        @lang('global.gudang.title')
        <small>List</small>
      </h1>

      <ol class="breadcrumb">
        <li><a href="{{url('/')}}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">@lang('global.gudang.title')</li>
      </ol>    
@stop

@section('content')   
<div class="row">
    <p>
        <a href="{{ route('gudang.create') }}" class="btn btn-success">@lang('global.app_add_new')</a>
        {!! link_to_route('gudang.excel', 
            'Export to Excel', null, 
            ['class' => 'btn btn-success']) 
        !!}
    </p>

    <div class="panel panel-default">
        <div class="panel-heading">
            @lang('global.app_list') Gudang
        </div>

        <div class="panel-body table-responsive">
            <table id="list" class="table table-bordered table-striped {{ count($gudang) > 0 ? 'datatable' : '' }} dt-select">
                <thead>
                    <tr>
                        <th width="15%">@lang('global.gudang.fields.kode_gudang')</th>
                        <th width="42%">@lang('global.gudang.fields.nama_gudang')</th>
                        <th width="10%">@lang('global.gudang.fields.is_container')</th>
                        <th width="13%">@lang('global.gudang.fields.is_active')</th>
                        <th width="10%">@lang('global.gudang.fields.utama')</th>
                        <th  width="10%">Aksi</th>

                    </tr>
                </thead>
                
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    </div>
@stop

@section('javascript') 
    <script>
        window.route_mass_crud_entries_destroy = '{{ route('gudang.mass_destroy') }}';
    </script>
@endsection

@push('javascripts')

    <script type="text/javascript">
        var id = winvar.id;
        var scrt_var = 'create/' + id;
        document.getElementById("link").setAttribute("href",scrt_var);
    </script>
    
    <script src="{{asset('/js/gudang.js')}}"></script>

    <!-- page script -->
    <script type="text/javascript">
    $(document).ready(function(){
        datatables.init();
    });
    </script>

    <script>
        function ConfirmDelete()
        {
          var x = confirm("Anda yakin akan menghapus data ini ?");
          if (x)
              return true;
          else
              return false;
          };

        function ConfirmEdit()
        {
          var x = confirm("Anda yakin akan merubah data ini ?");
          if (x)
              return true;
          else
              return false;
          }; 
    </script>        

@endpush