<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Nota Sedang</title>
	<style>
		body {
			font-family: arial;
			font-size: 12px;
			color: #454545;
		}
		table {margin: auto;}
		.faktur tr th:last-child,  
		.faktur tr td:last-child {border-right: 2px solid #a0a0a0;}
		.faktur tr td,
		.faktur tr th {
			border: 1px solid #a0a0a0;
		}
		.faktur tr th {border-top: 2px solid #a0a0a0;}
		.faktur tr th:nth-child(1),
		.faktur tr td:nth-child(1) {
			border-left: 2px solid #a0a0a0;
		}
		.faktur tr.last td {
			border-bottom: 2px solid #a0a0a0;
		}
		.right {
			float: right;
		}
		#kurir {
			display: none;
		}
		@media print {
			@page 
	        {
	            margin: 0mm;
	        }

	        #select-kurir, #btn-print {
	        	display: none;
	        }
	        #kurir {display: inline-block; font-weight: bold;}
		}
	</style>
</head>
<body style="width: 445.40944882px;">
{{-- <body> --}}
	@php  
	date_default_timezone_set('Asia/Jakarta');
	$date = DateTime::createFromFormat('Y-m-d', $penjualan->tanggal_faktur);
	$tgl = $date->format('d/m/Y');
	@endphp

	<h4 align="center" style="font-family: times new roman; font-size: 16px;">Faktur Penjualan</h4>
	<p align="center" style="margin-top: -18px;">{{ $tgl }}</p>
	<table width="100%" style="padding-left: 5%; padding-right: 5%;">
		<tr>
			<td>No</td>
			<td>: {{ $penjualan->no_faktur }}</td>
			<td align="right">Yth. {{ $penjualan->nama_kontak }}</td>
		</tr>
	</table>

	<table cellpadding="5" cellspacing="0" width="100%" style="padding-left: 5%; padding-right: 5%;" class="faktur">
		
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
			<td align="center">{{ $no++ }}</td>
			<td>{{ $item->nama_produk }}</td>
			<td width="3.75%">{{ $item->qty_terima }}</td> <td>{{ $item->uom_id }}</td>
			<td>Rp <span class="right">{{ number_format($item->harga_jual,2) }}</span></td>
			<td>Rp <span class="right">{{ number_format(($item->qty_terima*$item->harga_jual),2) }}</span></td>
		</tr>
		<span>
		@php 
			$total1 += ($item->qty_terima*$item->harga_jual) 
		@endphp
		</span>
		@endforeach

		@for ($no; $no <= 20; $no++)
			<tr>
				<td align="center">{{ $no }}</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		@endfor
		<!-- Footer -->
		<tr>
			<td colspan="4"></td>
			<td>Total</td>
			<td>Rp <span class="right">{{ number_format($total1) .'.00' }}</span></td>
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

	@if($items2->count() >= 1)
	<div style="page-break-before:always;"></div>
	
	<h4 style="visibility: hidden;">Faktur Penjualan</h4>
	<table cellpadding="5" cellspacing="0" width="100%" style="padding-left: 5%; padding-right: 5%;" class="faktur table-2">
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

	<br>
	<table width="100%" style="padding-left: 5%; padding-right: 5%;">
		<tr>
			<td>
				<b>Pengirim:</b> <span id="kurir"></span> 
				<select id="select-kurir">
					<option>-- Pilih Kurir --</option>
					@foreach ($kurir as $opt)
						<option value="{{ $opt->nama_kurir }}">{{ $opt->nama_kurir }}</option>
					@endforeach
				</select>
				<br><br>
				<b>Terimakasih telah berbelanja dan sampai jumpa</b>
			</td>
			<td align="center">
				Penerima <br><br> 
				{{ $penjualan->nama_kontak }}
			</td>
		</tr>
	</table>

	<br><br>
	<button id="btn-print" onclick="window.print()" title="Cetak Faktur Penjualan" style="margin-left: 5%; cursor: pointer;"><img src="{{ url('/images/logo/print.png') }}" alt=""></button>

	<script src="/bower_components/gentelella/vendors/jquery/dist/jquery.min.js"></script>
	<script>
		$(function() {
			$('#select-kurir').on('change', function() {
				$('#kurir').text($('#select-kurir').val());
			})
		})
	</script>
</body>
</html>