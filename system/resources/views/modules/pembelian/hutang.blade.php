@inject('request', 'Illuminate\Http\Request')
@extends('layouts.app')

@section('content')
<div class="row">
    <div class="col-sm-12" style="display: flex; align-items: center; justify-content: left;">
        <form action="?" class="form-inline">
            <input type="text" class="form-control datepicker" id="start_date" name="start_date" value="{{ request('start_date') ?? date('01/m/Y') }}" required>
            <input type="text" class="form-control datepicker" id="end_date" name="end_date" value="{{ request('end_date') ?? date('t/m/Y') }}" required>
            <button class="btn btn-primary" style="margin-top: 5px;">Filter</button>
            <a href="?" class="btn btn-default" style="margin-top: 5px;">Bersihkan Filter</a>
            <br>
            <label for="tgl_jatuh_tempo" style="margin-right: 1em;">
                <input type="checkbox" name="tgl_jatuh_tempo" id="tgl_jatuh_tempo" value="1" {{ request('tgl_jatuh_tempo') == 1 ? 'checked' : '' }}>
                <span>Tanggal Jatuh Tempo</span>
            </label>
        </form>
    </div>

    {{-- <div class="col-sm-2" style="display: flex; align-items: center; justify-content: flex-end;">
        <div>
            <a href="{{ url('/') }}" class="btn btn-info" style="margin-top: 6px;">
                <i class="fa fa-times-circle fa-fw"></i> Tutup
            </a>
        </div>
        <div>
            {!! link_to_route('pembelian.hutang.excelHutang', 
            'Export to Excel', null, 
            ['class' => 'btn btn-success', 'style' => 'margin-top: 6px; margin-right: 0;']) 
            !!}
        </div>
    </div> --}}
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
                            <th>Tanggal</th>
                            <th>Tgl Jatuh Tempo</th>
                            <th class="text-left">Pemasok</th>
                            <th class="text-center">Mata Uang</th>
                            <th class="text-right">Total Utang</th>
                            <th class="text-right">Utang Terbayar</th>
                            <th class="text-right">Saldo Utang</th>
                            {{-- <th class="text-center">Action</th> --}}
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@stop

@push('javascripts')
    <script>
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy'
    })
    $(document).ready(function(){
       table = $('#list').DataTable({
            'processing': true,
            'serverSide': true,
            'paging': true,
            'searching': true,
            'ordering': true,
            'info': true,
            'autoWidth': false,
            'ajax': {
                "url": '{{ url('pembelian/getdataHutang') }}' + window.location.search,
            },
            'columns': [
                {data: 'tanggal_faktur', name: 'tanggal_faktur'},
                {data: 'tgl_jatuh_tempo', name: 'tgl_jatuh_tempo'},
                {data: 'nama_kontak', name: 'nama_kontak'},
                {data: 'kurs', name: 'kurs', className: "text-center"},
                {data: 'totalhutang', render: $.fn.dataTable.render.number(',', '.', 2, ''), name: 'totalhutang', className: "text-right"},
                {data: 'totalbayar', render: $.fn.dataTable.render.number(',', '.', 2, ''), name: 'totalbayar', className: "text-right"},
                {data: 'saldohutang', render: $.fn.dataTable.render.number(',', '.', 2, ''), name: 'saldohutang', className: "text-right"},
                // {data: 'action', name: 'action', orderable: false, searchable: false}
            ],
            lengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
            dom: 'Bfrtip',
            buttons: [
                'pageLength',
                { 
                    extend: 'excel',
                    autoClose: 'true',
                    text: ' Export to Excel',
                    tag: 'button',
                    className: 'fa fa-file-excel-o',
                    footer: true,
                },
            ],
        });
    });
    
    function ConfirmDelete()
    {
        var x = confirm("Anda yakin akan menghapus data ini ?");
        if (x) return true;
        else return false;
    }

    function ConfirmEdit()
    {
        var x = confirm("Anda yakin akan merubah data ini ?");
        if (x) return true;
        else return false;
    }
</script>        

@endpush