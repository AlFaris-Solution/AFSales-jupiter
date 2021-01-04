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
    <div class="col-sm-12 mt-1">
        <table class="table table-bordered" style="background: #fff;">
            <thead>
                <tr class="column">
                    <th class="text-center">#</th>
                    <th class="text-center" width="5%">No SO</th>
                    <th class="text-center">Tgl Act</th>
                    <th class="text-center" width="10%">Total Tagihan</th>

                    @for ($i = 0; $i < $columnIsValid; $i++)
                        <th class="text-center">Tgl Ang ke-{{ $i+1 }}</th>
                        <th class="text-center">Angsuran ke-{{ $i+1 }}</th>
                    @endfor
                </tr>
            </thead>
            <tbody>
                <?php 
                $totalTagihan  = 0;
                ?>
                @foreach ($act as $key => $el)
                    <tr>
                        <td>{{ $key+1 }}</td>
                        <td>{{ $el->no_so }}</td>
                        <td>{{ $el->tgl_act }}</td>
                        <?php $totalTagihan += $el->total_angsuran; ?>
                        <td>@currency($el->total_angsuran)</td>
                        
                        <?php 
                        $columnIsNull  = 0; ?>
                        @for ($i = 0; $i < $columnIsValid; $i++)
                            @if ($el->lama_angsuran > $i)
                                <?php
                                $columnIsNull += 1;
                                $time = strtotime(date('Y-m-d', strtotime(str_replace('/', '-', $el->tgl_act)))); 
                                $increment = $i+1; 
                                $d = date('d', strtotime(str_replace('/', '-', $el->tgl_act)));
                                ?>
                                <td>{{ date("d/m/Y", strtotime("+{$increment} month", $time)) }}</td>
                                <td>@currency($el->angsuran_perbulan * $el->jml_act)</td>
                            @endif
                        @endfor

                        @if ($columnIsNull < $columnIsValid)
                            @for ($i = 0; $i < ($columnIsValid - $columnIsNull); $i++)
                                <td></td>
                                <td></td>
                            @endfor
                        @endif
                    </tr>
                @endforeach
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="3"></th>
                    <th style="border-right: 0;">@currency($totalTagihan)</th>
                    <th colspan="{{ $columnIsValid*2 }}"></th>
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

    $(document).ready(function() {
        $('.table').DataTable({
            dom: 'Bfrtip',
            paginate: false,
            autowidth: false,
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