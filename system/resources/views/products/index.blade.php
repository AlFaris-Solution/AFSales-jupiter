@inject('request', 'Illuminate\Http\Request')
@extends('layouts.app')

@section('content-header')
      <h1>
        @lang('global.products.title')
        <small>List</small>
      </h1>

      <ol class="breadcrumb">
        <li><a href="{{url('/')}}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">@lang('global.products.title')</li>
      </ol>    
@stop

@section('content')   
<div class="row">
    </br>
    </br>
    
    </br>
    <!-- search container -->
    <div class="panel panel-default">
         <!--
         <div class="panel-heading">            
            <h4 class="panel-title">Custom Filter [Case Sensitive]</h4>            
         </div> -->
         <div class="panel-body">
         <form method="POST" id="search-form" name="search-form" class="form-horizontal" action="{{route('products.index')}}" autocomplete="off">
         <input type="hidden" name="_token" value="{{ csrf_token() }}"> 

            <div class="form-group">
              <label for="nama_produk" class="col-sm-2 control-label">Nama Produk</label>
              <div class="col-sm-4">
              <input type="text" class="form-control" name="nama_produk" id="nama_produk" placeholder="nama produk">
              </div>

              <label for="kode_produk" class="col-sm-2 control-label">Kode Produk</label>
              <div class="col-sm-4">
              <input type="text" class="form-control" name="kode_produk" id="kode_produk" placeholder="kode produk">
              </div>
            </div>
            
            <div class="form-group">
              <label for="kategori_id" class="col-sm-2 control-label">Kategori</label>
              <div class="col-sm-4">
              <input type="text" class="form-control" name="kategori_id" id="kategori_id" placeholder="Kategori">
              <!--
              {{ Form::select('kategori_id', $kategori_list, old('kategori_id'), array('class'=>'form-control')) }}
              -->
              </div>

              <label for="is_active" class="col-sm-2 control-label">Aktif</label>
              <div class="col-sm-4">
              <select type="text" class="form-control" name="is_active" id="is_active">
                <option value="" selected="true" disabled="true">-- Pilih Status --</option>
                <option value="0">Ya</option>
                <option value="1">Tidak</option>
              </select>
              </div>
            </div>

            <div class="form-group">
              <label for="kategori_id" class="col-sm-2 control-label">&nbsp;</label>
              <div class="col-sm-4">
              <button type="reset" onClick="window.location.reload()" name="btnReset" id="btnReset" class="btn btn-warning">Reset</button>
              <button type="submit" class="btn btn-primary">&nbsp;Cari&nbsp;</button>
              </div>
            </div>
            

          </form>
          </div>
    </div>
    <!-- /.panel -->


    <p>
      <a href="{{ route('products.create') }}" class="btn btn-success">@lang('global.app_add_new')</a>
      {!! link_to_route('products.excel', 
            'Export to Excel', null, 
            ['class' => 'btn btn-success']) 
      !!}
            {!! link_to_route('products.import', 
            'Import Products', null, 
            ['class' => 'btn btn-success']) 
      !!}
    </p>

    <div class="panel panel-default">
        <div class="panel-heading">
            @lang('global.app_list') Produk
        </div>

        <div class="panel-body table-responsive">
            <table id="list" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <!--
                        <th style="text-align:center;"><input type="checkpanel" id="select-all" /></th>
                        -->
                        <th width="10%">@lang('global.products.fields.kode_produk')</th>
                        <th width="20%">@lang('global.products.fields.nama_produk')</th>
                        <th width="15%">Kelompok</th>
                        <th width="10%" style="text-align: right;">@lang('global.products.fields.stok')</th>
                        <th width="10%" style="text-align: center;">@lang('global.products.fields.uom_id')</th>
                        <th width="10%" style="text-align: right;">@lang('global.products.fields.harga_pokok')</th>
                        <th width="10%" style="text-align: right;">@lang('global.products.fields.harga_total')</th>
                        <th width="15%" style="text-align: center;">Aksi</th>

                    </tr>
                </thead>
                <tbody>
                    <tfoot>
                        <tr>
                            <th style="text-align: right; border-right: 0;">Total :</th>
                            <th style="border-right: 0;"></th>
                            <th style="border-right: 0;"></th>
                            <th></th>
                            <th style="text-aligin: right; border-right: 0;"></th>
                            <th style="border-right: 0;"></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </tfoot>
                </tbody>
            </table>
        </div>
    </div>
    </div>
@stop

@section('javascript') 
    <script>
        window.route_mass_crud_entries_destroy = '{{ route('products.mass_destroy') }}';
    </script>
@endsection

@push('javascripts')

    <script type="text/javascript">
        var id = winvar.id;
        var scrt_var = 'create/' + id;
        document.getElementById("link").setAttribute("href",scrt_var);
    </script>
    
    <script src="{{asset('/js/uom.js')}}"></script>

    <!-- page script -->
    <script type="text/javascript">
    $(document).ready(function(){
        //datatablesProd.init();
    });
    </script>

    
    <script type="text/javascript">
      var oTable = $('#list').DataTable({
        pageLength: 100,
        lengthMenu: [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        searching: false,
        processing: true,
        serverSide: true,
        ajax: {
            url: '{{ url("products/list")  }}',
            data: function (d) {
                d.nama_produk = $('input[name=nama_produk]').val();
                d.kode_produk = $('input[name=kode_produk]').val();
                d.kategori_id = $('input[name=kategori_id]').val(); 
                d.is_active = $('#is_active option:selected').val();
            }
        },
        'columns': [
            {data: 'kode_produk', name: 'kode_produk'},
            {data: 'nama_produk', name: 'nama_produk'},
            {data: 'kategori_id', name: 'kategori_id'},
            {data: 'stok', render: $.fn.dataTable.render.number(',', '.'), name: 'stok', className: "text-right"},
            {data: 'uom_id', name: 'uom_id', className: "text-center"},
            {data: 'harga_beli_satuan', render: $.fn.dataTable.render.number(',', '.', 2, ''), name: 'harga_beli_satuan', className: "text-right"},
            {data: 'nilai_total', render: $.fn.dataTable.render.number(',', '.', 2, ''), name: 'nilai_total', className: "text-right"},
            {data: 'action', name: 'action', orderable: false, searchable: false}
        ],
        'footerCallback': function ( row, data, start, end, display ) {
            var api = this.api(), data;
 
            // Remove the formatting to get integer data for summation
            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };

            // Stok over all pages
            stok = api
                .column( 3 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Stok over this page
            pageStok = api
                .column( 3, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 3 ).footer() ).html(
                formatRupiah(pageStok)
            );
 
            // Total over all pages
            total = api
                .column( 6 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Total over this page
            pageTotal = api
                .column( 6, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 6 ).footer() ).html(
                formatRupiah(pageTotal)
            );
        }
    });

    function formatRupiah(angka, prefix){
        var number_string = angka.toString().replace(/[^,\d]/g, ''),
        split   		= number_string.split(','),
        sisa     		= split[0].length % 3,
        rupiah     		= split[0].substr(0, sisa),
        ribuan     		= split[0].substr(sisa).match(/\d{3}/gi);

        // tambahkan titik jika yang di input sudah menjadi angka ribuan
        if(ribuan){
            separator = sisa ? ',' : '';
            rupiah += separator + ribuan.join(',') + '.00';
        }

        rupiah = split[1] != undefined ? rupiah + ',' + split[1] : rupiah;
        return prefix == undefined ? rupiah : (rupiah ? 'Rp. ' + rupiah : '');
    }

    $('#search-form').on('submit', function(e) {
        oTable.draw();
        e.preventDefault();
    });

    $("#btnReset").on("click", function() {
        $("#search-form").trigger("reset");
        $(".selectpicker").selectpicker("val", "");
        oTable.draw();
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

