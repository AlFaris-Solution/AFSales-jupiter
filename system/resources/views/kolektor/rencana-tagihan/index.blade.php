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
        .max-715 {
            min-height: 715px !important;
            max-height: 715px !important;
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
        <h3>Rencana Tagihan 
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

<div class="row" id="row">
    <div class="col-sm-12 mt-1 max-715">
        <p style="position: absolute; z-index: 1; margin-left: 10em; padding-top: 5px; cursor: pointer;" onclick="toggleMaximize()">
            <strong><i class="glyphicon glyphicon-fullscreen"></i> Toggle Maximimize</strong>
        </p>
        <table class="table table-bordered" style="background: #fff;">
            <thead>
                <tr class="column">
                    <th class="text-center">#</th>
                    <th class="text-center" width="5%">No SO</th>
                    <th class="text-center">Tgl Act</th>
                    <th class="text-center" width="10%">Total Tagihan</th>
                    <th class="text-center">Tgl Ang ke-1</th>
                    <th class="text-center">Ang ke-1</th>
                    <th class="text-center">Tgl Ang ke-2</th>
                    <th class="text-center">Ang ke-2</th>
                    <th class="text-center">Tgl Ang ke-3</th>
                    <th class="text-center">Ang ke-3</th>
                    <th class="text-center">Tgl Ang ke-4</th>
                    <th class="text-center">Ang ke-4</th>
                    <th class="text-center">Tgl Ang ke-5</th>
                    <th class="text-center">Ang ke-5</th>
                    <th class="text-center">Tgl Ang ke-6</th>
                    <th class="text-center">Ang ke-6</th>
                    <th class="text-center">Tgl Ang ke-7</th>
                    <th class="text-center">Ang ke-7</th>
                </tr>
            </thead>
            <tbody>
                <?php 
                $totalTagihan = 0;
                $jmlSO= 0;
                $ang1 = 0;
                $ang2 = 0;
                $ang3 = 0;
                $ang4 = 0;
                $ang5 = 0;
                $ang6 = 0;
                $ang7 = 0; ?>

                @foreach ($rencanaTagihan as $key => $list)
                    <?php 
                    $totalTagihan += $list->total_tagihan;
                    $jmlSO+= 1;
                    $ang1 += $list->ang_1;
                    $ang2 += $list->ang_2;
                    $ang3 += $list->ang_3;
                    $ang4 += $list->ang_4;
                    $ang5 += $list->ang_5;
                    $ang6 += $list->ang_6;
                    $ang7 += $list->ang_7; ?>

                    <tr>
                        <td>{{ $key +1 }}</td>
                        <td>{{ $list->no_so }}</td>
                        <td>{{ date('d/m/Y', strtotime($list->tgl_act)) }}</td>
                        <td>@currency($list->total_tagihan)</td>
                        <td>{{ !empty($list->tgl_ang_1) ? date('d/m/Y', strtotime($list->tgl_ang_1)) : '' }}</td>
                        <td>@currency($list->ang_1)</td>
                        <td>{{ !empty($list->tgl_ang_2) ? date('d/m/Y', strtotime($list->tgl_ang_2)) : '' }}</td>
                        <td>@currency($list->ang_2)</td>
                        <td>{{ !empty($list->tgl_ang_3) ? date('d/m/Y', strtotime($list->tgl_ang_3)) : '' }}</td>
                        <td>@currency($list->ang_3)</td>
                        <td>{{ !empty($list->tgl_ang_4) ? date('d/m/Y', strtotime($list->tgl_ang_4)) : '' }}</td>
                        <td>@currency($list->ang_4)</td>
                        <td>{{ !empty($list->tgl_ang_5) ? date('d/m/Y', strtotime($list->tgl_ang_5)) : '' }}</td>
                        <td>@currency($list->ang_5)</td>
                        <td>{{ !empty($list->tgl_ang_6) ? date('d/m/Y', strtotime($list->tgl_ang_6)) : '' }}</td>
                        <td>@currency($list->ang_6)</td>
                        <td>{{ !empty($list->tgl_ang_7) ? date('d/m/Y', strtotime($list->tgl_ang_7)) : '' }}</td>
                        <td>@currency($list->ang_7)</td>
                    </tr>
                @endforeach
            </tbody>
            <tfoot>
                <tr>
                    <th style="border-right: 0;"></th>
                    <th>&nbsp; {{ $jmlSO }}</th>
                    <th colspan="1" style="border-right: 0;"></th>
                    <th>@currency($totalTagihan)</th>
                    <th style="border-right: 0;"></th>
                    <th>@currency($ang1)</th>
                    <th style="border-right: 0;"></th>
                    <th>@currency($ang2)</th>
                    <th style="border-right: 0;"></th>
                    <th>@currency($ang3)</th>
                    <th style="border-right: 0;"></th>
                    <th>@currency($ang4)</th>
                    <th style="border-right: 0;"></th>
                    <th>@currency($ang5)</th>
                    <th style="border-right: 0;"></th>
                    <th>@currency($ang6)</th>
                    <th style="border-right: 0;"></th>
                    <th>@currency($ang7)</th>
                </tr>
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
            autowidth: false,
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
    if (th >= 15) {
        $('.table').css('width', '2000px')
        $('#row').css('overflow-x', 'auto')
    }
    if (th >= 20) {
        $('.table').css('width', '2500px')
        $('#row').css('overflow-x', 'auto')
    }
    if (th >= 25) {
        $('.table').css('width', '3000px')
        $('#row').css('overflow-x', 'auto')
    }
</script>
@endpush