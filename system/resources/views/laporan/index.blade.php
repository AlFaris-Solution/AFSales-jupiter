@extends('layouts.app')

@section('content')   
<div class="row">
    <br><br><br><br>
    <div class="panel panel-default">
        <div class="panel-heading">
            Laporan Pendapatan
        </div>

        <div class="panel-body table-responsive">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Tanggal</th>
                        <th>Penjualan</th>
                        <th>Pembelian</th>
                        <th>Pengeluaran</th>
                        <th>Pendapatan</th>
                    </tr>
                </thead>
                
                <tbody></tbody>
            </table>
        </div>
    </div>
</div>
@endsection