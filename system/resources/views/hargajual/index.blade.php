@inject('request', 'Illuminate\Http\Request')
@extends('layouts.app')

@section('content-header')
      <h1>
        @lang('global.hargajual.title')
        <small>List</small>
      </h1>

      <ol class="breadcrumb">
        <li><a href="{{url('/')}}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">@lang('global.hargajual.title')</li>
      </ol>    
@stop

@section('content')   
    <div class="row">
        
        <div class="col-xs-12">
          
    <p>
        <div class="btn-group">
              <a id="link" class="btn btn-info">
              <i class="fa fa-plus fa-fw"></i> Tambah Harga Produk</a>

              <a href="{{url('kontak')}}" class="btn btn-warning"><i class="fa fa-chevron-left fa-fw"></i> Kembali</a>
        </div>

    </p>

    <div class="panel panel-default">
        <div class="panel-heading">
            @lang('global.app_list') Harga Jual Per Customer
        </div>

        <div class="panel-body table-responsive">
              
              
              
              
              <div class="table-responsive">                    
                <table id="list" class="table table-bordered table-striped table-condensed">
                  <thead>
                    <tr>
                      <th width="20%">Pelanggan</th>
                      <th class="text-center" width="10%">Tanggal</th>
                      <th width="30%">Produk</th>
                      <th class="text-center" width="15%">Harga Jual</th>
                      <th class="text-center" width="15%">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>              
              </div>
              <!-- end table-responsive -->
            
            </div>
            <!-- /.box-body -->
          
          </div>
          <!-- /.box -->
        
        </div>
        <!-- /.col -->
      
</div>

@include('partials.footervar')

@stop

@push('javascripts')
    <script src="{{asset('/js/kontak.js')}}"></script>

    <!-- page script -->
    <script type="text/javascript">
    $(document).ready(function(){
        datatablesHargaJual.init();
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