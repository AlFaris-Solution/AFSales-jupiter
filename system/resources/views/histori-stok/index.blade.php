@inject('request', 'Illuminate\Http\Request')
@extends('layouts.app')

@section('content-header')
      <h1>
        @lang('global.histo-stok.title')
        <small>List</small>
      </h1>

      <ol class="breadcrumb">
        <li><a href="{{url('/')}}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">@lang('global.histo-stok.title')</li>
      </ol>    
@stop

@push('css')
    <style>
        .min-top {
            display: block;
            margin-top: -2.5em;
        }

        .mt-1 {
            margin-top: 1em !important;
        }
    </style>
@endpush

@section('content')   
<div class="row">
    <div class="col-sm-12">
        <h3>Histori Stok 
            {{ !empty(request('start_date')) ? date('d M Y', strtotime($tglAwal)) : date('01 M Y') }} - 
            {{ !empty(request('end_date')) ? date('d M Y', strtotime($tglAkhir)) : date('t M Y') }}
        </h3>

        <form action="?" class="form-inline">
            <input type="text" class="form-control datepicker" id="start_date" name="start_date" value="{{ request('start_date') ?? date('01/m/Y') }}" required>
            <input type="text" class="form-control datepicker" id="end_date" name="end_date" value="{{ request('end_date') ?? date('t/m/Y') }}" required>
            <button class="btn btn-primary" style="margin-top: 5px;">Filter</button>
            <a href="?" class="btn btn-default" style="margin-top: 5px;">Bersihkan Filter</a>
        </form>
    </div>
</div>

<div class="row">
    <div class="col-sm-12 mt-1">
        <div class="panel panel-default">

            <div class="panel-body table-responsive">
                <table class="table table-bordered table-striped">
                    <thead>
                        <th width="3%">#</th>
                        <th>Tanggal</th>
                        <th>Keterangan</th>
                        <th>Produk</th>
                        <th>Gudang</th>
                        <th>Masuk</th>
                        <th>Keluar</th>
                        <th>Sisa Stok</th>
                    </thead>
                    <tbody>
                        @foreach ($historiStok as $key => $stok)
                            <tr>
                                <td>{{ $key+1 }}</td>
                                <td>{{ date('d/m/Y', strtotime($stok->tgl_berubah)) }}</td>
                                <td>{{ $stok->keterangan }}</td>
                                <td>{{ $stok->nama_produk }}</td>
                                <td>{!! $stok->gudang['nama_gudang'] ?? '<span class="label label-danger">Belum Teridentifikasi</span>' !!}</td>
                                <td>{{ $stok->masuk }}</td>
                                <td>{{ $stok->keluar }}</td>
                                <td>{{ $stok->stok_tersisa }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@stop

@push('javascripts')
<script>
    $('.table').DataTable({
        lengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
        pageLength: 100,
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
    })
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy'
    })
</script>
@endpush