@inject('request', 'Illuminate\Http\Request')
@extends('layouts.app')

@push('css')
  <style type="text/css">
     .th:{
        vertical-align: middle;
      }
  </style>
@endpush

@section('content-header')
      <h1>
        @lang('global.kontak.title')
        <small>List</small>
      </h1>

      <ol class="breadcrumb">
        <li><a href="{{url('/')}}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">@lang('global.kontak.title')</li>
      </ol>    
@stop

@section('content')   
<div class="row">
    <p>
        <a href="{{ route('hargajuals.create') }}" class="btn btn-primary">Tambah Harga Jual</a>
        {!! link_to_route('hargajuals.excel', 
            'Export to Excel', null, 
            ['class' => 'btn btn-success']) 
        !!}
    </p>

    <div class="panel panel-default">
        <div class="panel-heading">
            @lang('global.app_list') Harga Jual Pelanggan
        </div>

        <div class="table-container">
        <div class="panel-body table-responsive">
            <table id="list" class="table table-bordered table-striped {{ count($kontak) > 0 ? 'datatable' : '' }} dt-select">
                <thead>
                    <tr>
                        <th width="5%" style="text-align: center;">id</th>
                        <th width="25%">Pelanggan</th>
                        <th width="20%">Produk</th>
                        <th width="10%" style="text-align: center;">Satuan</th>
                        <th width="15%" style="text-align: right;">Harga Jual Standar</th>
                        <th width="15%" style="text-align: right;">Harga Jual Pelanggan</th>
                        <th width="10%" style="text-align: center;">Aksi</th>
                    </tr>
                </thead>                
                <tbody>                    
                </tbody>
            </table>
        </div>
        </div>

    </div>
    </div>

@include('kontak.harga.editmodal')    
@stop
@push('javascripts')
    <script src="{{ asset('/js/kontak.js') }}"></script>

    <script type="text/javascript">
      $(document).ready(function(){
        table = $('#list').DataTable({
            'processing': true,
            'serverSide': true,
            'paging': true,
            'searching': false,
            'ordering': true,
            'info': true,
            'autoWidth': false,
            'ajax': {
                "url":" {{ route('hargajuals.list') }}",
            },
            'columns': [
                {data: 'id', name: 'id'},
                {data: 'nama_kontak', name: 'nama_kontak'},
                {data: 'nama_produk', name: 'nama_produk'},
                {data: 'uom_id', name: 'uom_id', className: "text-center"},
                {data: 'harga_jual_satuan', render: $.fn.dataTable.render.number(',', '.', 2, ''), name: 'harga_jual_satuan', className: "text-right"},
                {data: 'harga_jual_pelanggan', render: $.fn.dataTable.render.number(',', '.', 2, ''), name: 'harga_jual_pelanggan', className: "text-right"},
                {data: 'action', name: 'action', orderable: false, searchable: false}
            ]
        });
      })
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

    <script type="text/javascript">
      jQuery(document).ready(function($)  {
      //Ajax Show Edit
      $(".table-container").on("click touchstart", ".edit-btn", function () {
           
        $.ajax({
            type: "GET",
            url: "hargajuals/edit/" + $(this).attr("value"),//+ "/edit",
            dataType: 'json',
            headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
          beforeSend: function() {
          $('#item-not-found').remove();
          },
            success: function (data) {
            $("#id").val(data['id']);
            $("#kontak_id").val(data['kontak_id']);
            $("#produk_id").val(data['produk_id']);
            $("#uom_id").val(data['uom_id']);
            $("#harga_jual_standar").val(data['harga_jual_standar']);
            $("#harga_jual_pelanggan").val(data['harga_jual_pelanggan']);
            $('#update-form').show();
          },
            error: function(data) {
            $.notify({
              // options
              icon: 'fa fa-exclamation-triangle',
              title: '<strong>Error</strong>: <br>',
              message: 'An error occurred while getting data.'
              },{
              // settings
              type: "danger",
              allow_dismiss: true,
              newest_on_top: true,
              showProgressbar: false,
              placement: {
              from: "top",
              align: "right"
              },
              offset: 20,
              spacing: 10,
              z_index: 9999,
              delay: 5000,
              timer: 1000,
              mouse_over: "pause",
              animate: {
              enter: 'animated fadeInDown',
              exit: 'animated fadeOutUp'
              }
            });
            $('#update-form').hide();
            (function(){
            var notFound = $('<div class="modal-body fade-text" id="item-not-found"><h1 class="text-center danger">☠</h1><h2 class="text-center">Item not found</h2></div>');
            notFound.insertAfter('#update-form');
            })();
            }, complete() {
              $('#edit-loading-bar').hide();
            }
        });
      });
    });
    </script>

    <script type="text/javascript">
      jQuery(document).ready(function($)  {
      $('#edit-item').on('hidden.bs.modal', function () {
        $("#id").val('');
        $("#uom_id").val('');
        $("#harga_jual_pelanggan").val('');
        $('.error-list').remove();
        $('#item-not-found').remove();
        $('#update-form').hide();
        $('#edit-loading-bar').show();
      });

      //Ajax update
      $("#update-form").submit(function (e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "hargajuals/edit/" + $('#id').attr("value"), //lists/" + $('#id').attr("value"),
            dataType: 'json',
          headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
          data : $(this).serialize(),
            beforeSend: function() {
              $('.error-list').remove();
              $("#update-submit").prop("disabled", true);
              $("#update-submit").html('<i class="loading fa fa-refresh fa-spin fa-3x fa-fw"></i><span class="sr-only loading-fallback">Loading...</span>');
            }, statusCode: {
            500: function() {
              $.notify({
              // options
              icon: 'fa fa-exclamation-triangle',
              title: '<strong>Error 500</strong>: <br>',
              message: 'An error occurred while sending data.'
              },{
              // settings
              type: "danger",
              allow_dismiss: true,
              newest_on_top: true,
              showProgressbar: false,
              placement: {
              from: "top",
              align: "right"
              },
              offset: 20,
              spacing: 10,
              z_index: 9999,
              delay: 5000,
              timer: 1000,
              mouse_over: "pause",
              animate: {
              enter: 'animated fadeInDown',
              exit: 'animated fadeOutUp'
              }
              });
            }
            }, success: function (data) {
              $success = data.responseJSON;
              $.notify({
              // options
              icon: 'fa fa-check',
              title: '<strong>Success</strong>: <br>',
              message: data['msg']
              },{
              // settings
              type: "success",
              allow_dismiss: true,
              newest_on_top: true,
              showProgressbar: false,
              placement: {
              from: "top",
              align: "right"
              },
              offset: 20,
              spacing: 10,
              z_index: 9999,
              delay: 5000,
              timer: 1000,
              mouse_over: "pause",
              animate: {
              enter: 'animated fadeInDown',
              exit: 'animated fadeOutUp'
              }
              });
              $( "#id" ).val('');
              $( "#uom_id" ).val('');
              $( "#harga_jual_pelanggan" ).val('');
              $('#edit-item').modal('toggle');
              // refresh data
              refreshTable();
            }, error :function(data) {
                $errors = data.responseJSON.errors;
                var id = '';
                for (var i in $errors) {
                id += "update-" + i;
                (function(){
                var error = $("<label for='" + id + "' class='error-list'>" + $errors[i] + "</label>");
                error.hide().fadeIn("slow");
                error.insertAfter('#' + id);
                })();
                id = '';
                }
            }, complete() {
            $( ".loading" ).remove();
            $( ".loading-fallback" ).remove();
            $("#update-submit").text('Update Item');
            $("#update-submit").prop("disabled", false);
            }
        });
      });
    });
    </script>
@endpush