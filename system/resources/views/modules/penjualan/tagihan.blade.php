<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Nota Besar</title>
	<style>
		* {
			font-family: arial;
			font-size: 12px;
			color: #000;
		}
		table {margin: auto;}
		.faktur tr td,
		.faktur tr th {
			border: 1px solid #000;
		}
		.faktur tr th {border-top: 2px solid #000;}
		.faktur tr th:last-child,  
		.faktur tr td:last-child {border-right: 2px solid #000;}
		.faktur tr th:nth-child(1),
		.faktur tr td:nth-child(1) {
			border-left: 2px solid #000;
		}
		.faktur tr.last td {
			border-bottom: 2px solid #000;
		}
		.right {
			float: right;
		}
		@media print {
			@page {
				width: 21.5cm;
				height: 14cm;
				margin-left: 1cm;
				margin-right: 1cm;
				margin-top: 1cm;
				margin-bottom: 1cm;
	        }
	        #select-kurir, #btn-print {
	        	display: none;
	        }
	        #kurir {display: inline-block; font-weight: bold;}
		}
	</style>
</head>
<!--<body style="width: 907.08661417px;" onload="window.print()">-->
<body onload="window.print()">
    <br>
	<h4 align="center" style="font-size: 14px; margin-top: 5px; margin-bottom: 0;">FAKTUR PENJUALAN</h4>
	<h4 style="font-size: 14px; margin-left: .5%; margin-bottom: 5px; margin-top: 0; margin-right: .5%; text-transform: uppercase">
		{{ $info->nama_toko }}
		<span style="float: right; font-size: 11px; font-weight: normal;">{{ $penjualan->no_faktur }}</span>
	</h4>
	<table width="100%" style="padding-left: .5%; padding-right: .5%;">
		{{-- <tr>
			<td>No</td>
			<td>: {{ $penjualan->no_faktur }}</td>
			<td colspan="3" width="42.5%"></td>
			<td align="center">Yth</td>
		</tr> --}}
		@php  
		date_default_timezone_set('Asia/Jakarta');
		$date = DateTime::createFromFormat('Y-m-d', $penjualan->tanggal_faktur);
		$tgl = $date->format('d/m/Y');
		@endphp
		{{-- <tr>
			<td>Tgl</td>
			<td>: {{ $tgl }}</td>
			<td colspan="3" width="42.5%"></td>
			<td align="center">{{ $penjualan->nama_kontak }}</td>
		</tr> --}}
		<tr>
			<td colspan="2">Food Packaging & General Supplier</td>
			<td colspan="3" width="5%"></td>
			<td>Tanggal Faktur</td>
			<td align="right">{{ $tgl }}</td>
		</tr>
		<tr>
			<td colspan="2">{{ $info->alamat_toko }} {{ $info->kecamatan_toko }} {{ $info->kota_toko }}</td>
			<td colspan="3" width="5%"></td>
			<td>Nama Pelanggan</td>
			<td>: {{ $penjualan->nama_kontak }}</td>
		</tr>
		<tr>
			<td>WA/HP</td>
			<td>: {{ $info->hp_toko }}</td>
			<td colspan="3" width="5%"></td>
			<td>Alamat Pelanggan</td>
			<td>: {{ $penjualan->alamat1 ?? '-' }}</td>
		</tr>
		<tr>
			<td>Telp</td>
			<td>: {{ $info->hp_toko }}</td>
			<td colspan="3" width="5%"></td>
			<td>Kota Pelanggan</td>
			<td>: {{ $penjualan->kota1 ?? '-' }}</td>
		</tr>
		<tr>
			<td>Sales</td>
			<td>: {{ $sales }}</td>
			<td colspan="3" width="5%"></td>
			<td>Tanggal Jatuh Tempo</td>
			<td>: {{ date('d/m/Y', strtotime($penjualan->tanggal_jatuh_tempo)) }}</td>
		</tr>
	</table>

	<table cellpadding="5" cellspacing="0" width="100%" style="padding-left: .5%; padding-right: .5%;" class="faktur">
		<!-- Header -->
		<tr>
			<th width="2.5%" align="center">NO</th>
			<th width="30%">Nama Barang</th>
			<th colspan="2" width="7.5%">Qty</th>
			<th>Harga Satuan</th>
			<th>Jumlah</th>
		</tr>
		<!-- Body -->
		@php $no = 1; 
		$total1 = 0;
		@endphp

		@foreach ($items1 as $item)
		<tr>
			<td align="center" style="border-bottom: 0;">{{ $no++ }}</td>
			<td style="border-bottom: 0;">{{ $item->nama_produk }}</td>
			<td style="border-bottom: 0;" width="3.75%">{{ $item->qty_terima }}</td> 
			<td style="border-bottom: 0;">{{ $item->uom_id }}</td>
			<td style="border-bottom: 0;">Rp <span class="right">{{ number_format($item->harga_jual,2) }}</span></td>
			<td style="border-bottom: 0;">Rp <span class="right">{{ number_format(($item->qty_terima*$item->harga_jual),2) }}</span></td>
		</tr>
		<span>
		@php 
			$total1 += ($item->qty_terima*$item->harga_jual) 
		@endphp
		</span>
		@endforeach

		@for ($no; $no <= 10; $no++)
			<tr>
				<td align="center" style="border-bottom: 0; border-top: 0;">{{ $no }}</td>
				<td style="border-bottom: 0; border-top: 0;"></td>
				<td style="border-bottom: 0; border-top: 0;"></td>
				<td style="border-bottom: 0; border-top: 0;"></td>
				<td style="border-bottom: 0; border-top: 0;"></td>
				<td style="border-bottom: 0; border-top: 0;"></td>
			</tr>
		@endfor
		<!-- Footer -->
		<tr>
			<td style="border-bottom: 2px solid #000; border-top: 2px solid #000;" colspan="4"></td>
			<td style="border-bottom: 2px solid #000; border-top: 2px solid #000; font-size: 11px; font-weight: bold;">Total</td>
			<td style="border-bottom: 2px solid #000; border-top: 2px solid #000; font-size: 11px; font-weight: bold;">Rp <span class="right">{{ number_format($total1) .'.00' }}</span></td>
		</tr>
		{{-- <tr>
			<td colspan="4"></td>
			<td><span style="visibility: hidden;">Tunai</span></td>
			<td><span style="visibility: hidden;">Rp <span class="right">{{ number_format($penjualan->uang_muka,2) }}</span></span></td>
		</tr>
		<tr class="last">
			<td colspan="4"></td>
			<td><span style="visibility: hidden;">Kembali</span></td>
			<td><span style="visibility: hidden;">Rp <span class="right">{{ number_format(($penjualan->uang_muka - $nett->nett), 2) }}</span></span></td>
		</tr> --}}
	</table>

	@if ($items2->count() >= 1)
	<div style="page-break-before:always;"></div>
	
	<h4 style="visibility: hidden;">FAKTUR PENJUALAN</h4>
	<table cellpadding="5" cellspacing="0" width="100%" style="padding-left: .5%; padding-right: .5%;" class="faktur table-2">
		<tr>
			<th width="2.5%" align="center">NO</th>
			<th width="30%">Nama Barang</th>
			<th colspan="2" width="7.5%">Qty</th>
			<th>Harga Satuan</th>
			<th>Jumlah</th>
		</tr>
		@foreach ($items2 as $item)
			<tr>
				<td align="center">{{ $no++ }}</td>
				<td>{{ $item->nama_produk }}</td>
				<td width="3.75%">{{ $item->qty_terima }}</td> <td>{{ $item->uom_id }}</td>
				<td>Rp <span class="right">{{ number_format($item->harga_jual,2) }}</span></td>
				<td>Rp <span class="right">{{ number_format(($item->qty_terima*$item->harga_jual),2) }}</span></td>
			</tr>
		@endforeach

		<!-- Footer -->
		<tr>
			<td colspan="4"></td>
			<td>Total Keseluruhan</td>
			<td>Rp <span class="right">{{ number_format($nett->nett,2) }}</span></td>
		</tr>
		<tr>
			<td colspan="4"></td>
			<td><span style="visibility: hidden;">Tunai</span></td>
			<td><span style="visibility: hidden;">Rp <span class="right">{{ number_format($penjualan->uang_muka,2) }}</span></span></td>
		</tr>
		<tr class="last">
			<td colspan="4"></td>
			<td><span style="visibility: hidden;">Kembali</span></td>
			<td><span style="visibility: hidden;">Rp <span class="right">{{ number_format(($penjualan->uang_muka - $nett->nett), 2) }}</span></span></td>
		</tr>
	</table>
	@endif
	<p style="margin-bottom: 3px; margin-top: 0; padding-left: .5%;">NB: barang yg sudah di beli tidak dapat di kembalikan</p>
	<p style="padding-left: .5%; margin-bottom: 3px; margin-top: 0;">NO REK : Mandiri (134-001-599-50-29) &nbsp; a.n &nbsp; NURHAYATI</p>
	<p style="padding-left: .5%; margin-top: 0; margin-bottom: 3px;">
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        BCA (418-058-0277) &nbsp; a.n &nbsp; NURHAYATI</p>
        
	<table width="100%" style="padding-left: .5%; padding-right: .5%;">
		<tr>
			<td width="5%" align="center">
				TANDA TERIMA
				<br><br><br>
			</td>
			<td width="50%" align="center">
				SOPIR
				<br><br><br>
			</td>
			<td width="5%" align="center">
				HORMAT KAMI
				<br><br><br>
			</td>
		</tr>
		<tr>
			<td width="5%" align="center">
				(..........................................)
			</td>
			<td width="50%" align="center">
				(..........................................)
			</td>
			<td width="5%" align="center">
				(..........................................)
			</td>
		</tr>
	</table>

	<br><br>
	<button id="btn-print" onclick="window.print()" title="Cetak Faktur Penjualan" style="margin-left: .5%; cursor: pointer;"><img src="{{ url('/images/logo/print.png') }}" alt=""></button>
</body>
</html>