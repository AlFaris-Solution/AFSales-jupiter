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
    <div class="col-sm-12 mt-1 max-702">
        <p style="position: absolute; z-index: 1; margin-left: 10em; padding-top: 5px; cursor: pointer;" onclick="toggleMaximize()">
            <strong><i class="glyphicon glyphicon-fullscreen"></i> Toggle Maximimize</strong>
        </p>
        <table class="table table-bordered" style="background: #fff;">
            <thead>
                <tr>
                    <th colspan="4" class="text-center">DATA RMK</th>
                    <th colspan="{{ 7*3 }}" class="text-center">DATA TAGIHAN</th>
                </tr>
                <tr>
                    <th rowspan="2" class="text-center">TGL</th>
                    <th colspan="3" class="text-center">ACT</th>
                    @for ($i = 1; $i <= 7; $i++)
                        <th colspan="3" class="text-center">TAGIHAN {{ $i }}</th>
                    @endfor
                </tr>
                <tr class="column">
                    <th class="text-center">KWT</th>
                    <th class="text-center" width="5%">ANGSURAN</th>
                    <th class="text-center" width="10%">TOTAL TAGIHAN</th>
                    @for ($i = 1; $i <= 7; $i++)
                        <th class="text-center">Tertagih</th>
                        <th class="text-center">Tidak Tertagih</th>
                        <th class="text-center">Tgl Tf</th>
                    @endfor
                </tr>
            </thead>
            <tbody>
                <?php
                    $jmlTotalTagihan  = 0;
                    $tidakTertagih    = 0;
                    $jmlSO = 0;
                ?>
                
                @foreach ($rows as $key => $row)
                    <tr>
                        <?php $tglAngsuran = date('d/m/Y', strtotime($row->first()['tgl_angsuran'])); ?>
                        <td>{{ $tglAngsuran }}</td>
                        <td>
                            <?php
                            $soPertama    = $row->first()['no_so']; 
                            $jmlKwt       = 0;
                            // $totalTagihan = $row->sum('nominal_angsuran') ?? 0;
                            $totalTagihan = 0;
                            $tagihan = $row->groupBy('no_so');
                            foreach ($tagihan as $key => $list) {
                                $nominalAngsuran = $list->first()['nominal_angsuran'];
                                $bagi = $list->first()['rencanaTagihan']['lama_angsuran'] ?? 1;
                                $totalTagihan += ($nominalAngsuran / $bagi);
                            }
                            $angsuranKe   = [];

                            foreach ($row as $column) {
                                if ($column->no_so != $soPertama) {
                                    $jmlKwt += 1;
                                } else {
                                    $jmlKwt = 1;
                                }
                            } 
                            $jmlSO += $jmlKwt;
                            $jmlTotalTagihan += $totalTagihan; ?> 
                            {{ $jmlKwt }}
                        </td>
                        <td>
                            @foreach ($row as $column)
                                <?php array_push($angsuranKe, $column->angsuran_ke); ?>
                            @endforeach
                            <?php 
                            $angsuranKe = array_unique($angsuranKe);
                            
                            $words = ''; ?>
                            @for ($i = 0; $i < count($angsuranKe); $i++)
                                <?php if (!empty($angsuranKe[$i])) $words .= ($angsuranKe[$i]) .", "; ?>
                            @endfor
                            
                            <?php 
                            $words = explode(", ", $words);
                            array_splice($words, -1);
                            echo implode(", ", $words); ?>
                        </td>
                        <td>@currency($totalTagihan)</td>
                        
                        <?php 
                        $columnIsNull = 0; 
                        $tertagih = 0; 
                        $lunas = false; ?>
                        @foreach ($setoran as $key => $list)
                            @if ($key == $tglAngsuran)
                                @foreach ($list as $el)
                                    <?php 
                                    $columnIsNull += 1; 
                                    $columnTertagih = $el->jml_bayar;
                                    $tertagih += $columnTertagih;
                                    $columnTidakTertagih = $totalTagihan - $tertagih; 
                                    ?>
                                    <td>@currency($columnTertagih)</td>
                                    <td>@currency($columnTidakTertagih)</td>
                                    <td></td>

                                    @if ($columnTidakTertagih == 0)
                                        @php
                                            $lunas = true;
                                        @endphp
                                    @endif
                                @endforeach
                            @endif
                        @endforeach
                        @if ($columnIsNull < 7)
                            @if ($lunas)
                                @for ($i = 0; $i < (7 - $columnIsNull); $i++)
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                @endfor
                            @elseif($tertagih > 0)
                                @for ($i = 0; $i < (7 - $columnIsNull); $i++)
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                @endfor
                            @elseif(!$lunas && $tertagih == 0)
                                <td>@currency(0)</td>
                                <td>@currency($totalTagihan)</td>
                                <td></td>
                                @for ($i = 0; $i < 6; $i++)
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                @endfor
                            @endif
                        @endif
                    </tr>
                @endforeach
            </tbody>
            <tfoot>
                <tr>
                    <th style="border-right: 0"></th>
                    <th>&nbsp;{{ $jmlSO }}</th>
                    <th style="border-right: 0"></th>
                    <th>@currency($jmlTotalTagihan)</th>
                    @for ($i = 0; $i < 7; $i++)
                        <th colspan="3" style="border-right: 0;"></th>
                    @endfor
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