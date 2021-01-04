@inject('request', 'Illuminate\Http\Request')
@extends('layouts.app')
@push('css')
<style>
    @media (min-width: 768px) {
    .select2 {
        width: 30% !important;
        }
    }
</style>
@endpush

@section('content')
<div class="row">
    <div class="col-sm-10" style="display: flex; align-items: center; justify-content: left;">
        <form action="?" class="form-inline">
            <select name="sales" id="sales" class="form-control select2">
                <option value="">-- Pilih --</option>
                @foreach ($sales as $list)
                    <option value="{{ $list['id'] }}" {{ $list->id == request('sales') ? 'selected' : '' }}>{{ $list['nama_kontak'] }} {{ !empty($list['klasifikasi']) ? " - $list->klasifikasi" : '' }}</option>
                @endforeach
            </select>
            <input type="text" class="form-control datepicker" id="start_date" name="start_date" value="{{ request('start_date') ?? date('01/m/Y') }}" required>
            <input type="text" class="form-control datepicker" id="end_date" name="end_date" value="{{ request('end_date') ?? date('t/m/Y') }}" required>
            <button class="btn btn-primary" style="margin-top: 5px;">Filter</button>
            <a href="?" class="btn btn-default" style="margin-top: 5px;">Bersihkan Filter</a>
        </form>
    </div>
    <div class="col-sm-2" style="display: flex; align-items: center; justify-content: flex-end;">
        <div>
            <a href="{{route('penjualan.create')}}" class="btn btn-info" style="margin-top: 6px;">
            <i class="fa fa-plus fa-fw"></i> Baru
            </a>
        </div>
        <div>
            {!! link_to_route('penjualan.excel', 
            'Export to Excel', null, 
            ['class' => 'btn btn-success', 'style' => 'margin-top: 6px; margin-right: 0;']) 
            !!}
        </div>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                @lang('global.app_list')
            </div>
            <div class="panel-body table-responsive">
                <div class="table-responsive">
                    <table id="list" class="table table-bordered table-striped table-condensed">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Tanggal</th>
                                <th>No. Faktur</th>
                                <th>Nama Pelanggan</th>
                                <th>Sales</th>
                                <th>Total</th>
                                <th width="12.5%">Aksi</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@include('partials.footervar')
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Modal Header</h4>
            </div>
            <div class="modal-body">
                <p>Some text in the modal.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- End Modal -->
@stop

@push('javascripts')
<script>
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy'
    })
    $('.select2').select2()
    
    $(function(){
        table = $('#list').DataTable({
            'processing': true,
            'serverSide': true,
            'autoWidth': false,
            'ajax': {
                "url": 'penjualan/list'+ window.location.search,
                'type': 'get'
              },
            'columns': [
              {data: 'id', name: 'id'},
              {data: 'tanggal_faktur', name: 'tanggal_faktur'},
              {data: 'no_faktur', name: 'no_faktur'},
              {data: 'nama_kontak', name: 'kontaks.nama_kontak'},
              {data: 'sales', name: 'products.sales'},
              {data: 'total_setelah_pajak', render: $.fn.dataTable.render.number(',', '.', 2, ''), name: 'total_setelah_pajak', className: "text-right"},
              {data: 'action', name: 'action', orderable: false, searchable: false}
            ]
        });
    });
    
    function notaBesar(id) {
        popupCenter({url: "penjualan/print/"+ id, title: "Cetak Nota Besar", w: 1024, h: 875});
    }
    
    function notaKecil(id) {
        popupCenter({url: "penjualan/printsmall/"+ id, title: "Cetak Nota Kecil", w: 675, h: 675});
    }
    
    function notaMedium(id) {
        popupCenter({url: "penjualan/printmedium/"+ id, title: "Cetak Nota Sedang", w: 675, h: 675});
    }

    const popupCenter = ({url, title, w, h}) => {
        // Fixes dual-screen position                             Most browsers      Firefox
        const dualScreenLeft = window.screenLeft !==  undefined ? window.screenLeft : window.screenX;
        const dualScreenTop = window.screenTop !==  undefined   ? window.screenTop  : window.screenY;

        const width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
        const height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

        const systemZoom = width / window.screen.availWidth;
        const left = (width - w) / 2 / systemZoom + dualScreenLeft
        const top = (height - h) / 2 / systemZoom + dualScreenTop
        const newWindow = window.open(url, title, 
        `
        scrollbars=yes,
        width=${w / systemZoom}, 
        height=${h / systemZoom}, 
        top=${top}, 
        left=${left}
        `
        )

        if (window.focus) newWindow.focus();
    }

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