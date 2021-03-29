<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Nota Kecil</title>
	<style>
		span {display: block; margin: 3px;}
		table {font-family: arial; font-size: 12px;}
		.small {font-size: 12px; display: inline-block;}
		
		@media print {
			@page 
	        {
	            /*size: auto;*/
	            margin: 0mm;
	        }
		}
	</style>
</head>
<body style="width: 300px;" onload="window.print()">
	
	<div style="text-align: center;">
		<h2 style="margin-bottom: 5px; font-family: times new roman;">TOKO {{ strtoupper($info->nama_toko) }}</h2>
		<span>{{ Auth::user()->alamat }}</span>
		<span>Telp.{{ Auth::user()->tlp }}</span>
		@php  
		date_default_timezone_set('Asia/Jakarta');
		$date = DateTime::createFromFormat('Y-m-d', $penjualan->tanggal_faktur);
		$tgl = $date->format('d/m/Y');

		$tglDay = $date->format('Y-m-d');
		$day = date('D', strtotime($tglDay));
		$dayList = [
			'Sun' => 'Minggu',
			'Mon' => 'Senin',
			'Tue' => 'Selasa',
			'Wed' => 'Rabu',
			'Thu' => 'Kamis',
			'Fri' => 'Jumat',
			'Sat' => 'Sabtu'
		];


		@endphp
		<span>{{ $dayList[$day] }}, {{ $tgl }}</span>
	</div>

	<hr style="border-style: all"> <hr style="margin-top: -7px;">
	<table border="0" width="100%" style="padding-left: 5%; padding-right: 5%;">
		@foreach($items as $item)
		<tr>
			<td colspan="2">{{ $item->nama_produk }}</td>
		</tr>
		<tr>
			<td>{{ number_format($item->harga_jual,2) }}</td> 
			<td>x {{ $item->qty_terima }}</td> 
			<td align="right">{{ number_format(($item->qty_terima*$item->harga_jual),2) }}</td>
		</tr>
		@endforeach
	</table>

	<table border="0" width="100%" style="border-top: 1px solid #a0a0a0; padding-left: 5%; padding-right: 5%;">
		<tr>
			<td colspan="1">Total Belanja</td> <td align="right"><span class="small">Rp</span> {{ number_format($nett->nett,2) }}</td>
		</tr>
		<tr>
			<td colspan="1">Tunai</td> <td align="right"><span class="small">Rp</span> {{ number_format($penjualan->uang_muka,2) }}</td>
		</tr>
		<tr>
			<td colspan="1">Kembali</td> <td align="right"><span class="small">Rp</span> {{ number_format(($penjualan->uang_muka - $nett->nett), 2) }}</td>
		</tr>
	</table>

	<br> 
	<div style="text-align: center;">
		<p>Terima Kasih</p>
		<span>kasir: {{ Auth::user()->username }}</span>
		<span>No.{{ $penjualan->no_faktur }}</span>
	</div>


	<br><br>
	<button id="btn-print" onclick="window.print()" title="Cetak Faktur Penjualan" style="margin-left: 5%; cursor: pointer;"><img src="{{ url('/images/logo/print.png') }}" alt=""></button>
</body>
</html>