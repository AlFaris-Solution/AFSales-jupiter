@inject('request', 'Illuminate\Http\Request')
@extends('layouts.app')
@section('content-header')
      <h1>
        @lang('global.users.title')
        <small>Add</small>
      </h1>

      <ol class="breadcrumb">
        <li><a href="{{url('/')}}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">@lang('global.users.title')</li>
      </ol>    
@stop
@section('content')
<div class="row">
    <p>
        <a href="{{ route('admin.users.create') }}" class="btn btn-success">@lang('global.app_add_new')</a>
    </p>

    <div class="panel panel-default">
        <div class="panel-heading">
            @lang('global.app_list')
        </div>

        <div class="panel-body table-responsive">
            <table id="list" class="table table-bordered table-striped">
                <thead>
                    <th width="5%">No</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>No. Tlp</th>
                    <th width="25%">Alamat</th>
                    <th>Roles</th>
                    <th width="10%">Aksi</th>
                </thead>
            </table>
        </div>
    </div>
</div>
@stop

@section('javascript') 
    <script>
        window.route_mass_crud_entries_destroy = '{{ route('admin.users.mass_destroy') }}';
    </script>
@endsection

@push('javascripts')
    <!-- page script -->
    <script type="text/javascript">
    $(document).ready(function(){
        table = $('#list').DataTable({
            'autoWidth': false,
            'ajax': {
                "url": 'users/list',
                "type": "GET"
            }
        });
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