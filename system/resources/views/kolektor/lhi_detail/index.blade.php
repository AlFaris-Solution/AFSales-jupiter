@inject('request', 'Illuminate\Http\Request')
@extends('layouts.app')

@section('content-header')
      <h1>
        @lang('global.so.title')
        <small>List</small>
      </h1>

      <ol class="breadcrumb">
        <li><a href="{{ url('/') }}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">@lang('global.so.title')</li>
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
    <div class="col-sm-2 mt-1">
        <a href="{{ route('lhi_detail.create', $lhi->code) }}" class="btn btn-success">Tambah Kwitansi</a>
    </div>
</div>
<div class="row">
    <div class="col-sm-12 mt-1">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h5 class="panel-title">
                    Detail LHI
                </h5>
            </div>

            <div class="panel-body table-responsive">
                <table width="100%">
                    <tr>
                        <th width="10%">Kolektor</th>
                        <th width="1%">:</th>
                        <th>{{ $lhi->kontak_kolektor['nama_kontak'] }}</th>
                    </tr>
                    <tr>
                        <th>Tgl LHI</th>
                        <th>:</th>
                        <th>{{ $lhi->tgl_lhi }}</th>
                    </tr>
                    <tr>
                        <th>Area</th>
                        <th>:</th>
                        <th>{{ $lhi->area }}</th>
                    </tr>
                    <tr>
                        <th>Produk</th>
                        <th>:</th>
                        <th>{{ $lhi->product['nama_produk'] }}</th>
                    </tr>
                </table>
                <br><br>

                <table class="table table-bordered table-striped" style="border: 1px solid #ddd; width: 100% !important;">
                    <thead>
                        <tr>
                            <th rowspan="2" width="3%" class="text-center"><span class="min-top">#</span></th>
                            <th rowspan="2" class="text-center"><span class="min-top">Pelanggan</span></th>
                            <th colspan="2" class="text-center">Kwitansi</th>
                            <th rowspan="2" class="text-center"><span class="min-top">Angsuran</span></th>
                            <th colspan="2" class="text-center">Value Kwitansi</th>
                            <th rowspan="2" class="text-center"><span class="min-top">Harus Tagih</span></th>
                            <th rowspan="2" class="text-center"><span class="min-top">Tertagih</span></th>
                            <th rowspan="2" class="text-center"><span class="min-top">Sisa Tagihan</span></th>
                            <th rowspan="2" class="text-center"><span class="min-top">Tanggal Janji</span></th>
                            <th rowspan="2" class="text-center"><span class="min-top">Ket</span></th>
                            <th rowspan="2" class="text-center"><span class="min-top">Status</th>
                            <th rowspan="2" class="text-center"><span class="min-top"><i class="fa fa-gear"></i></th>
                        </tr>
                        <tr>
                            <th style="border-top: 0 !important;" class="text-center">No.</th>
                            <th style="border-top: 0 !important;" class="text-center">Tgl</th>
                            <th style="border-top: 0 !important;" class="text-center">Awal</th>
                            <th style="border-top: 0 !important; border-right: 1px solid #ddd !important;" class="text-center">Sekarang</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($lhiDetails as $key => $row)
                            <tr>
                                <td>{{ $key+1 }}</td>
                                <td>{{ $row->kontak_pelanggan['nama_kontak'] }}</td>
                                <td>{{ $row->no_kwitansi }}</td>
                                <td>{{ $row->tgl_angsuran }}</td>
                                <td>{{ $row->angsuran_ke }}</td>
                                <td>{{ $row->value_awal }}</td>
                                <td>{{ $row->value_sekarang }}</td>
                                <td>{{ $row->nominal_tagihan }}</td>
                                <td>{{ $row->tertagih }}</td>
                                <td>{{ $row->sisa_tagihan }}</td>
                                <td>{{ $row->tgl_janji }}</td>
                                <td>{{ $row->keterangan }}</td>
                                <td>
                                    @switch($row->status)
                                        @case('Belum Lunas') <span class="label label-info">{{ $row->status }}</span> @break
                                        @case('Lunas') <span class="label label-success">{{ $row->status }}</span> @break
                                        @default <span class="label label-danger">{{ $row->status }}</span> @break
                                    @endswitch
                                </td>
                                <td>
                                    <form action="{{ route('lhi_detail.destroy', $row->id) }}" method="post">
                                        {{ csrf_field() }}
                                        <input type="hidden" name="_method" value="delete">
                                        
                                        <div class="btn-group">
                                            <a href="{{ route('lhi_detail.edit', $row->id) }}" class="btn btn-warning"><i class="fa fa-pencil"></i></a>
                                            <button class="btn btn-danger" onclick="return confirm('Yakin?')"><i class="fa fa-trash"></i></button>
                                        </div>
                                    </form>
                                </td>
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
    $('.table').DataTable()
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy'
    })
    $('.kolektor').addClass('active')
    $('.kolektor .nav').css('display', 'block')
</script>
@endpush