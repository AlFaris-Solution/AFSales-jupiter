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
    </style>
@endpush

@section('content')
<div class="row">
    <div class="col-sm-6">
        <h3>New Collection 01 Jun - 03 Jul 2020</h3>
        <h5>Cabang: Majalengka</h5>
    </div>
    <div class="col-sm-6">
        <form action="?" class="form-inline" style="float: right; margin-right: -1em; margin-top: 1.5em;">
            <input type="text" class="form-control datepicker" id="start_date" name="start_date" value="{{ request('start_date') }}" required>
            <input type="text" class="form-control datepicker" id="end_date" name="end_date" value="{{ request('end_date') }}" required>
            <button class="btn btn-secondary" style="margin-top: 5px;">Filter</button>
        </form>
    </div>
</div>
<div class="row">
    <div class="col-sm-12 mt-1" style="min-height: 770px; max-height: 770px; overflow-y: auto;">
        <table class="table table-bordered" style="background: #fff;">
            <thead>
                <tr>
                    <?php 
                        $countColumn = 0;
                        $rows = LHISetoran::with('lhi')
                                        ->orderBy('tgl_bayar', 'asc')->get()
                                        ->groupBy('code');
                        $columns = [];
                        foreach ($rows as $row) {
                            $columns[] = $row->groupBy('tgl_bayar');
                        }

                        $values = [];
                        for ($i = 0; $i < count($columns); $i++) { 
                            array_push($values, count($columns[$i]));
                        }
                        $columnIsValid = !empty($values) ? max($values) : 1;
                    ?>

                    <th colspan="3" class="text-center">RMK KOMPOR</th>
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
                    $kwt              = 0;
                    $jmlKwt           = 0;
                    $tgl              = null;
                    $totalTagihan     = 0;
                    $jmlTotalTagihan  = 0;
                    $tertagih         = 0;
                    $tidakTertagih    = 0;
                    $jmlTertagih      = 0;
                    $jmlTidakTertagih = 0;
                ?>
                @foreach ($columns as $column)
                    <tr>
                        <td>
                            <?php $code = null; ?>
                            @foreach ($column as $key => $cell)
                                <?php $code = $cell[0]['code']; ?>
                            @endforeach
                            <?php  
                                $lhi = LHI::withCount('lhiDetails')
                                          ->with('lhiDetails')
                                          // ->where('code', $code)
                                          ->get()
                                          ->groupBy('tgl_lhi');
                                $tgl = null;
                                if (!empty($lhi)) {
                                    foreach ($lhi as $list) {
                                        foreach ($list as $key => $l) {
                                            $tgl              = $l['tgl_lhi'];
                                            $kwt              = $l['lhi_details_count'];
                                            $jmlKwt          += $kwt;
                                            $totalTagihan     = $l['lhiDetails']->sum('nominal_tagihan');
                                            $jmlTotalTagihan += $totalTagihan;
                                            $tidakTertagih    = $l['lhiDetails']->sum('nominal_tagihan'); 
                                        }
                                    }
                                }
                            ?>
                            {{ $tgl }}
                        </td>
                        <td>{{ $kwt }}</td>
                        <td>@currency($totalTagihan)</td>
                        @foreach ($column as $cell)
                            @for ($i = 0; $i < count($cell->groupBy('tgl_bayar')); $i++)
                                <?php 
                                    $tidakTertagih -= $cell->sum('jml_bayar'); 
                                ?>
                                <td>@currency($cell->sum('jml_bayar'))</td>
                                <td>@currency($tidakTertagih)</td>
                                <td>#</td>
                            @endfor
                        @endforeach
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
<!-- DataTables -->
<script src="{{asset('/bower_components/AdminLTE/plugins/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('/bower_components/AdminLTE/plugins/datatables/dataTables.bootstrap.min.js')}}"></script>    
<script src="{{asset('/bower_components/sweetalert/docs/assets/sweetalert/sweetalert.min.js')}}"></script>

<script>
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy'
    })

    let th = $('.column th').length;
    if (th >= 20) {
        $('.table').css('width', '2000px')
        $('.row').css('overflow-x', 'auto')
    }
    if (th >= 25) {
        $('.table').css('width', '2500px')
        $('.row').css('overflow-x', 'auto')
    }
    if (th >= 30) {
        $('.table').css('width', '3000px')
        $('.row').css('overflow-x', 'auto')
    }
</script>

@endpush