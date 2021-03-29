<?php
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
                    @php
                        $column = LHISetoran::select(DB::raw('tgl_bayar, count(*) as jml'))
                            ->groupBy('tgl_bayar')
                            ->get()
                            ->count();
                    @endphp
                    <th colspan="3" class="text-center">RMK KOMPOR</th>
                    <th colspan="{{ $column * $column }}" class="text-center">DATA TAGIHAN</th>
                </tr>
                <tr>
                    <th rowspan="2" class="text-center">TGL</th>
                    <th colspan="2" class="text-center">LHI</th>
                    @foreach ($rmk as $list)
                        @php
                            $column = LHISetoran::select(DB::raw('count(*) as jml'))
                                ->groupBy('tgl_bayar')
                                ->get()
                                ->count();
                        @endphp
                        
                        @for ($i = 1; $i <= $column; $i++)
                            <th colspan="3" class="text-center">TAGIHAN {{ $i }}</th>
                        @endfor
                    @endforeach
                </tr>
                <tr class="column">
                    <th class="text-center">KWT</th>
                    <th class="text-center">TOTAL TAGIHAN</th>
                    @foreach ($rmk as $list)
                        @php
                            $column = LHISetoran::select(DB::raw('count(*) as jml'))
                                ->groupBy('tgl_bayar')
                                ->get()
                                ->count();
                        @endphp

                        @for ($i = 1; $i <= $column; $i++)
                            <th class="text-center">Tertagih</th>
                            <th class="text-center">Tidak Tertagih</th>
                            <th class="text-center">Tgl Tf</th>
                        @endfor
                    @endforeach
                </tr>
            </thead>
            <tbody>
                @php
                    $kwt = 0;
                    $totalTagihan = 0;
                    $jmlTertagih = 0;
                    $jmlTidakTertagih = 0;
                @endphp
                @foreach ($rmk as $key => $list)
                <?php 
                    $kwt += $list->lhi_details_count; 
                    $totalTagihan += $list->lhiDetails->sum('nominal_tagihan');
                    $jmlTertagih  += $list->lhiDetails->sum('nominal_tagihan');
                    $jmlTagihan    = $list->lhiDetails->sum('nominal_tagihan');
                ?>
                <tr>
                    <td>{{ $list->tgl_lhi }}</td>
                    <td>{{ $list->lhi_details_count }}</td>
                    <td>@currency($jmlTagihan)</td>
                    
                    @foreach ($rmk as $list)
                        @php
                            $nominalTagihan = LHISetoran::select(DB::raw('tgl_bayar, SUM(jml_bayar) as jml_bayar'))
                                ->groupBy('tgl_bayar')
                                ->get();
                        @endphp
                        
                        @foreach ($nominalTagihan as $list)
                            @php
                                $jmlTagihan -= $list->jml_bayar;
                            @endphp
                            <td>@currency($list->jml_bayar)</td>
                            <td>@currency($jmlTagihan)</td>
                            <td>#</td>
                        @endforeach
                    @endforeach
                </tr>
                @endforeach
            </tbody>
            <tfoot>
                <tr>
                    <th></th>
                    <th>{{ $kwt }}</th>
                    <th>@currency($totalTagihan)</th>
                    @foreach ($rmk as $list)
                        @php
                            $column = LHISetoran::select(DB::raw('count(*) as jml'))
                                ->groupBy('tgl_bayar')
                                ->get()
                                ->count();
                            $nominalTagihan = LHISetoran::select(DB::raw('tgl_bayar, SUM(jml_bayar) as jml_bayar'))
                                ->groupBy('tgl_bayar')
                                ->get();
                        @endphp
                        
                        @foreach ($nominalTagihan as $list)
                            @php
                                $jmlTertagih -= 0;
                            @endphp
                            <th colspan="3">{{ $jmlTertagih }}</th>
                        @endforeach

                        {{-- @for ($i = 1; $i <= $column; $i++)
                            <th>{{ $tertagih }}</th>
                            <th>Tidak Tertagih</th>
                            <th>Tgl Trf</th>
                        @endfor --}}
                    @endforeach
                </tr>
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