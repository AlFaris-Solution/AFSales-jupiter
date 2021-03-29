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
            <label for="tanggal_jatuh_tempo" style="margin-right: 1em;">
                <input type="checkbox" name="tanggal_jatuh_tempo" id="tanggal_jatuh_tempo" value="1" {{ request('tanggal_jatuh_tempo') == 1 ? 'checked' : '' }}>
                <span>Tanggal Jatuh Tempo</span>
            </label>
        </form>
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
                    <table id="list" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Tanggal</th>
                                <th>Tgl Jatuh Tempo</th>
                                <th>No Faktur</th>
                                <th>Pelanggan</th>
                                <th class="text-center">Mata Uang</th>
                                <th align="right">Debit</th>
                                <th align="right">Piutang Terbayar</th>
                                <th align="right">Saldo Piutang</th>
                            </tr>
                        </thead>
                        {{-- <tbody>
                            @php
                            $no = 1;
                            $totalSaldoPiutang = 0;
                            @endphp
                            @foreach ($roles as $data)
                            <tr>
                                <td>{{ $no++ }}</td>
                                <td>{{ $data->noFaktur }}</td>
                                <td>{{ $data->namaKontak }}</td>
                                <td align="center">{{ $data->kurs }}</td>
                                <td>{{ number_format($data->saldoTerutang) }}</td>
                                <td>{{ number_format($data->diBayar) }}</td>
                                <td>{{ number_format($data->totalPiutang) }}</td>
                                <td>{{ substr($data->created_at, 0, 10) }}</td>
                            </tr>
                            <span>@php $totalSaldoPiutang += $data->totalPiutang @endphp</span>
                            @endforeach
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="5"></td>
                            <td><strong>Total Saldo Piutang</strong></td>
                            <td colspan="2"><strong>{{ number_format($totalSaldoPiutang) }}</strong></td>
                        </tr>
                        </tfoot> --}}
                    </table>
                </div>                
            </div>
        </div>
    </div>
</div>
@stop

@push('javascripts')
<script>
    $(function() {
        table = $('#list').DataTable({
            'processing': true,
            'serverSide': true,
            'paging': true,
            'searching': true,
            'ordering': true,
            'info': true,
            'autoWidth': false,
            'ajax': {
                "url": '{{ url('penjualan/getdataPiutang') }}' + window.location.search,
            },
            'columns': [
                {data: 'tanggal_faktur', name: 'tanggal_faktur'},
                {data: 'tanggal_jatuh_tempo', name: 'tanggal_jatuh_tempo'},
                {data: 'no_faktur', name: 'no_faktur'},
                {data: 'nama_kontak', name: 'nama_kontak'},
                {data: 'kurs', name: 'kurs', className: "text-center"},
                {data: 'saldoTerutang', render: $.fn.dataTable.render.number(',', '.', 2, ''), name: 'totalhutang', className: "text-right"},
                {data: 'diBayar', render: $.fn.dataTable.render.number(',', '.', 2, ''), name: 'totalbayar', className: "text-right"},
                {data: 'totalPiutang', render: $.fn.dataTable.render.number(',', '.', 2, ''), name: 'saldohutang', className: "text-right"},
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

        $('.datepicker').datepicker({
            format: 'dd/mm/yyyy'
        })
    })
</script>  
@endpush