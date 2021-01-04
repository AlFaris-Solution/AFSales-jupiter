<?php
use App\LHI;
use App\LHISetoran;
use Illuminate\Support\Facades\DB;
?>

@inject('request', 'Illuminate\Http\Request')
@extends('layouts.app')

@section('content-header')
      <h1>
        @lang('global.rmk.title')
        <small>List</small>
      </h1>

      <ol class="breadcrumb">
        <li><a href="{{ url('/') }}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">@lang('global.rmk.title')</li>
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
        .text-center {
            text-align: center;
        }
        .border-2 {
            border: 2px solid #000!important;
        }
        .max-702 {
            min-height: 702px !important;
            max-height: 702px !important;
        }
        .max-800 {
            min-height: 800px !important;
            max-height: 800px !important;
        }
        .max-1000 {
            max-height: 1000px;
        }
    </style>
@endpush

@section('content')
<div class="row hidden-me">
    <div class="col-sm-12">
        <h3>Rekap Setoran Kolektor 
            <small>Periode: 
            {{ !empty(request('start_date')) ? date('d M Y', strtotime($tglAwal)) : date('01 M Y') }} - 
            {{ !empty(request('end_date')) ? date('d M Y', strtotime($tglAkhir)) : date('t M Y') }} </small>
        </h3>
        <form action="?" class="form-inline">
            <h5>Cabang: 
                <select name="cabang" id="cabang" class="form-control">
                    <option value="All">All</option>
                    @foreach ($cabang as $list)
                        <option value="{{ $list->id }}" {{ $list->id == $cabangTerpilih ? 'selected' : '' }}>{{ $list->nama_departement }}</option>
                    @endforeach
                </select>
                <input type="text" class="form-control datepicker" id="start_date" name="start_date" value="{{ request('start_date') ?? date('01/m/Y') }}" required>
                <input type="text" class="form-control datepicker" id="end_date" name="end_date" value="{{ request('end_date') ?? date('t/m/Y') }}" required>
                <button class="btn btn-primary" style="margin-top: 5px;">Filter</button>
                <a href="?" class="btn btn-default" style="margin-top: 5px;">Bersihkan Filter</a>
            </h5>
        </form>
    </div>
</div>

<div class="row" id="row">
    <div class="col-sm-12 mt-1 max-702">
        <p style="position: absolute; z-index: 1; margin-left: 10em; padding-top: 5px; cursor: pointer;" onclick="toggleMaximize()">
            <strong><i class="glyphicon glyphicon-fullscreen"></i> Toggle Maximimize</strong>
        </p>
        <table class="table table-bordered" style="background: #fff;">
            <thead>
                <tr>
                    <?php 
                        $rows = LHISetoran::with('lhi')
                                        ->orderBy('tgl_bayar', 'asc')
                                        ->get()
                                        ->groupBy('lhi.tgl_lhi');
                        if ($cabangTerpilih != 'All') {
                            $rows = LHISetoran::with('lhi')
                                            ->whereHas('lhi', function($q) use ($cabangTerpilih) {
                                                $q->where('id_cabang', $cabangTerpilih);
                                            })
                                            ->orderBy('tgl_bayar', 'asc')
                                            ->get()
                                            ->groupBy('lhi.tgl_lhi');
                        }
                        $tHead = [];
                        foreach ($rows as $row) {
                            $tHead[] = $row->groupBy('tgl_bayar');
                        }

                        $values = [];
                        for ($i = 0; $i < count($tHead); $i++) { 
                            array_push($values, count($tHead[$i]));
                        }
                        $columnIsValid = !empty($values) ? max($values) : 1;
                    ?>

                    <th colspan="3" class="text-center">DATA RMK</th>
                    <th colspan="{{ $columnIsValid *3 }}" class="text-center">DATA TAGIHAN</th>
                </tr>
                <tr>
                    <th rowspan="2" class="text-center">TGL</th>
                    <th colspan="2" class="text-center">LHI</th>
                    @for ($i = 1; $i <= $columnIsValid; $i++)
                        <th colspan="3" class="text-center">TAGIHAN {{ $i }}</th>
                    @endfor
                </tr>
                <tr class="column">
                    <th class="text-center">KWT</th>
                    <th class="text-center">TOTAL TAGIHAN</th>
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
                    $jmlKwt           = 0;
                    $jmlTotalTagihan  = 0;
                    $tidakTertagih    = 0;
                ?>
                @foreach ($columns as $key => $column)
                    <tr>
                        <td>
                        <?php foreach ($column as $cell) {
                                 $tgl = $cell[0]['lhi']['tgl_lhi'];
                        } ?>
                            {{ $tgl }}
                        </td>
                        <td>
                            {{ $kwt = $rmk[$tgl]->sum('lhi_details_count') }}
                            <?php $jmlKwt += $kwt ?>
                        </td>
                        <td>
                        <?php 
                            $lastLoop = count($rmk[$tgl]); 
                            $tagihan = 0;
                        
                            for ($i = 0; $i < count($rmk[$tgl]); $i++) { 
                                if ($i > 0 && $i != $lastLoop) $tagihan += $rmk[$tgl][$i]['lhiDetails']->sum('nominal_tagihan');
                                else $tagihan = $rmk[$tgl][$i]['lhiDetails']->sum('nominal_tagihan');
                            }

                            $tidakTertagih = $tagihan;
                            $jmlTotalTagihan += $tagihan; 
                        ?>
                            @currency($tagihan)
                        </td>
                        <?php $columnIsNull = 0 ?>
                        @foreach ($column as $cell)
                            @for ($i = 0; $i < count($cell->groupBy('tgl_bayar')); $i++)
                            <?php 
                                $columnIsNull += 1;
                                $tidakTertagih -= $cell->sum('jml_bayar'); 
                            ?>
                                <td>@currency($cell->sum('jml_bayar'))</td>
                                <td>@currency($tidakTertagih)</td>
                                <td>-</td>
                            @endfor
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
                @includeIf('kolektor.rmk.tfoot')
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

    function toggleMaximize() {
        $('.hidden-me').toggleClass('hidden');
        $('#row .col-sm-12').toggleClass('max-800');
    }

    $(document).ready(function() {
        $('.table').DataTable({
            dom: 'Bfrtip',
            paginate: false,
            ordering: false,
            bInfo: true,
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