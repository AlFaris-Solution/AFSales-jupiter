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
            <select name="supplier_id" id="supplier_id" class="form-control select2">
                <option value="">-- Pilih --</option>
                @foreach ($suppliers as $supplier)
                <option value="{{ $supplier['id'] }}" {{ $supplier->id == request('supplier_id') ? 'selected' : '' }}>{{ $supplier['nama_kontak'] }}{{ !empty($supplier['klasifikasi']) ? " - $supplier->klasifikasi" : '' }}</option>
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
            <a href="{{route('pembelian.create')}}" class="btn btn-info" style="margin-top: 6px;">
            <i class="fa fa-plus fa-fw"></i> Baru
            </a>
        </div>
        <div>
            {!! link_to_route('pembelian.excel', 
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
                                <th class="text-center" width="10%">Tanggal</th>
                                <th class="text-center" width="12%">No. Faktur</th>
                                <th class="text-center" width="12%">No. Pesanan</th>
                                <th class="text-center" width="30%">Nama Pemasok</th>
                                <th class="text-center" width="13%">Nilai</th>
                                <th class="text-center" width="5%">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@include('partials.footervar')
@stop
@push('javascripts')
<script>
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy'
    })
    $('.select2').select2();
    
    $(function(){
        /*-----------------------------------------------------------
         Delete Button clicked
         --------------------------------------------------------------*/
        $(document).on('click', '.btn-delete', function (e){e.preventDefault(); confirm_dialog($(this).parent('form')); });
        function confirm_dialog(form){
            BootstrapDialog.show({
                title: 'Deleting a Record',
                message: 'Are you sure you want to delete this record. This action cannot be undone.',
                buttons: [ {
                    icon: 'fa fa-check',
                    label: 'Yes',
                    cssClass: 'btn-success btn-xs pull-left',
                    action: function(){
                        form.submit();
                    }
                }, {
                    icon: 'fa fa-remove',
                    label: 'No',
                    cssClass: 'btn-danger btn-xs pull-right',
                    action: function(dialogItself){
                        dialogItself.close();
                    }
                }]
            });
            return false;
        }
    });
</script>
<script type="text/javascript">
    function formatDate (input) {
    var datePart = input.match(/\d+/g),
    year = datePart[0].substring(2), // get only two digits
    month = datePart[1], day = datePart[2];
    
    return day+'/'+month+'/'+year;
    }
    //formatDate ('2010/01/18'); // "18/01/10"
</script>
 
<script src="{{asset('/js/pembelian.js')}}"></script>
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