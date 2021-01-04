<?php
use App\LHI;
use App\LHISetoran;
use Illuminate\Support\Facades\DB;
?>

@inject('request', 'Illuminate\Http\Request')
@extends('layouts.app')

@section('content-header')
      <h1>
        @lang('global.rmk-global.title')
        <small>List</small>
      </h1>

      <ol class="breadcrumb">
        <li><a href="{{ url('/') }}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">@lang('global.rmk-global.title')</li>
      </ol>    
@stop

@push('css')
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.2/css/buttons.dataTables.min.css">
    <style>
        .min-top {
            display: block;
            margin-top: -2.5em;
        }
        .mt-1 {
            margin-top: 1em !important;
        }
        .text-center {
            text-align: center;
        }
        .border-2 {
            border: 2px solid #000!important;
        }

    </style>
@endpush

@section('content')
<div class="row">
    <div class="col-sm-12">
        <h3>RMK Global
            <small>Periode:  
            {{ !empty(request('start_date')) ? date('d M Y', strtotime($tglAwal)) : date('27 M Y') }} - 
            {{ !empty(request('end_date')) ? date('d M Y', strtotime($tglAkhir)) : date('d M Y', strtotime($tglAkhir)) }}</small>
        </h3>
        <form action="?" class="form-inline">
            <h5>Cabang: 
                <select name="cabang" id="cabang" class="form-control">
                    <option value="All">All</option>
                    @foreach ($cabang as $list)
                        <option value="{{ $list->id }}" {{ $list->id == $cabangTerpilih ? 'selected' : '' }}>{{ $list->nama_departement }}</option>
                    @endforeach
                </select>
                <input type="text" class="form-control datepicker" id="start_date" name="start_date" value="{{ request('start_date') ?? date('27/m/Y') }}" required>
                <input type="text" class="form-control datepicker" id="end_date" name="end_date" value="{{ request('end_date') ?? date('d/m/Y', strtotime($tglAkhir)) }}" required>
                <button class="btn btn-primary" style="margin-top: 5px;">Filter</button>
                <a href="?" class="btn btn-default" style="margin-top: 5px;">Bersihkan Filter</a>
            </h5>
        </form>
    </div>
</div>

<div class="row" id="row">
    <div class="col-sm-12 mt-1" style="min-height: 685px; max-height: 685px;">
        <table class="table table-bordered" style="background: #fff;">
            <thead>
                <tr>
                    <?php 
                        $values = [];
                        foreach ($rows as $row) {
                            $values[] = $row->count();
                        }
                        $columnIsValid = !empty($values) ? max($values) : 1;
                    ?>

                    <th colspan="4" class="text-center">RMK KOMPOR</th>
                    <th colspan="{{ $columnIsValid *3 }}" class="text-center">DATA TAGIHAN</th>
                </tr>
                <tr>
                    <th rowspan="2" class="text-center">TGL</th>
                    <th colspan="3" class="text-center">ACT</th>
                    @for ($i = 1; $i <= $columnIsValid; $i++)
                        <th colspan="3" class="text-center">TAGIHAN {{ $i }}</th>
                    @endfor
                </tr>
                <tr class="column">
                    <th class="text-center">KWT</th>
                    <th class="text-center" width="5%">ANGSURAN</th>
                    <th class="text-center" width="10%">TOTAL TAGIHAN</th>
                    @for ($i = 1; $i <= $columnIsValid; $i++)
                        <th class="text-center">Tertagih</th>
                        <th class="text-center">Tidak Tertagih</th>
                        <th class="text-center">Tgl Tf</th>
                    @endfor
                </tr>
            </thead>
            <tbody>
                <?php
                    $tgl              = '';
                    $kwt              = 0;
                    // $jmlKwt           = 0;
                    $jmlTotalTagihan  = 0;
                    $tidakTertagih    = 0;
                ?>
                
                @foreach ($rows as $key => $row)
                    <tr>
                        <td>{{ $row->first()['tgl_angsuran'] }}</td>
                        <td>
                            <?php 
                            $soPertama = $row->first()['no_so']; 
                            $jmlKwt = 0;
                            ?>
                            @foreach ($row as $column)
                                @if ($column->no_so != $soPertama)
                                    <?php $jmlKwt = $column->count('no_so'); ?>
                                @else
                                    <?php $jmlKwt = 1; ?>
                                @endif
                            @endforeach
                            {{ $jmlKwt }}
                        </td>
                        <td>
                            <?php $angsuran = []; ?>
                            @foreach ($row as $column)
                                <?php array_push($angsuran, $column->angsuran_ke); ?>
                            @endforeach

                            {{ array_unique($angsuran)[0] }}
                        </td>
                        <td>
                            <?php 
                            $soPertama = $row->first()['no_so']; 
                            $totalTagihan = 0;
                            ?>
                            @foreach ($row as $column)
                                @if ($column->no_so != $soPertama)
                                    <?php $totalTagihan = $column['so']->sum('angsuran_perbulan') ?>
                                @else
                                    <?php $totalTagihan = $column['so']['angsuran_perbulan'] * $column['so']['jml_act'] ?>
                                @endif
                            @endforeach
                            @currency($totalTagihan)
                        </td>

                        <?php 
                        $columnIsNull = 0;
                        $tertagih = 0; ?>
                        @foreach ($row as $column)
                            <?php 
                            $columnIsNull += 1; 
                            $columnTertagih = $column->jml_bayar;
                            $tertagih += $columnTertagih;
                            $columnTidakTertagih = ($column['so']['angsuran_perbulan'] * $column['so']['jml_act']) - $tertagih; ?>
                            <td>@currency($columnTertagih)</td>
                            <td>@currency($columnTidakTertagih)</td>
                            <td></td>
                        @endforeach

                        @if ($columnIsNull < $columnIsValid)
                            @for ($i = 0; $i < ($columnIsValid - $columnIsNull); $i++)
                                <td></td>
                                <td></td>
                                <td></td>
                            @endfor
                        @endif
                    </tr>
                @endforeach
            </tbody>
            <tfoot>
                {{-- @includeIf('kolektor.rmk-global.tfoot') --}}
            </tfoot>
        </table>
    </div>
</div>
@stop

@push('javascripts')
<script>
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy'
    })

    // $('#row .col-sm-12').niceScroll({
    //     cursorwidth: "12px",
    //     cursorcolor: 'rgba(0,0,0,.25)',
    //     background: "rgba(20,20,20,0.15)"
    // })

    $(document).ready(function() {
        $('.table').DataTable({
            dom: 'Bfrtip',
            paginate: false,
            ordering: false,
            bInfo: false,
            buttons: [
                { 
                    extend: 'excel',
                    autoClose: 'true',
                    text: ' Export to Excel',
                    tag: 'button',
                    className: 'fa fa-file-excel-o',
                    footer: true 
                },
            ],
            "language": {
                "emptyTable": "Ups data kosong!.",
                "zeroRecords": "Ups data tidak ditemukan!."
            },
        })
    })

    let th = $('.column th').length;
    if (th >= 20) {
        $('.table').css('width', '2000px')
        $('#row').css('overflow-x', 'auto')
    }
    if (th >= 25) {
        $('.table').css('width', '2500px')
        $('#row').css('overflow-x', 'auto')
    }
    if (th >= 30) {
        $('.table').css('width', '3000px')
        $('#row').css('overflow-x', 'auto')
    }
</script>
@endpush