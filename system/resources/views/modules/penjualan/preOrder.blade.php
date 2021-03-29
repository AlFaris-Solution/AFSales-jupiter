<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Pre Order</title>
	<style>
		body {
			font-family: arial;
			font-size: 12px;
			color: #000;
		}
		table {margin: auto;}
		.faktur tr th:last-child,  
		.faktur tr td:last-child {border-right: 2px solid #000;}
		.faktur tr td,
		.faktur tr th {
			border: 1px solid #000;
			border-top: 0;
			border-bottom: 0;
			padding: 0;
			padding-left: 2px;
		}
		.faktur tr th {border-top: 2px solid #000;}
		.faktur tr th {border-bottom: 2px solid #000;}
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
		.info {display: block;}
		@media print {
			@page 
	        {
	            margin: 0mm;
	        }
	        #btn-print {
	        	display: none;
	        }
		}
	</style>
</head>
<body style="width: 822.04724409;">
	<div style="text-align: center;">
		<h2 style="margin-bottom: 5px; font-family: times new roman;">{{ strtoupper(Auth::user()->nama_toko) }}</h2>
		<span class="info">{{ Auth::user()->alamat }}</span>
		<span class="info">Telp.{{ Auth::user()->tlp }}</span>
	</div>
	
	<table style="margin-left: 5%;">
        <tbody>
            <tr>
            	<td>No Faktur</td>
            	<td> : </td>
            	<td class="text-primary strong">{{ $pembelian->no_faktur }}</td>
            </tr>
            
            @php  
			date_default_timezone_set('Asia/Jakarta');
			$date = DateTime::createFromFormat('Y-m-d', $pembelian->tanggal_faktur);
			$tgl = $date->format('d/m/Y');
			@endphp

            <tr>
            	<td>Tanggal</td>
            	<td> : </td>
            	<td>{{ $tgl }}</td>
            </tr>
            <?php
                $supplier = App\Kontak::where('id', $pembelian->kontak_id)->select('nama_kontak')->first();
                $total = $pembelian->total_setelah_pajak;
                $nilai = $pembelian->saldo_terutang;

                if ($pembelian->kontak_id == "") $nama = "Retail";
                else $nama = $supplier->nama_kontak; ?>
            <tr>
            	<td>Pelanggan</td>
            	<td> : </td>
            	<td>{{ $nama }}</td>
            </tr>
            <tr>
            	<td>No PO</td>
            	<td> : </td>
            	<td>{{ $pembelian->no_po }}</td>
            </tr>
        </tbody>
    </table>
    <br><br>

	<table style="padding-left: 5%; padding-right: 5%; cellpadding="5" cellspacing="0" width="100%"  class="faktur">
        <tr>
			<th width="2.5%" align="center">NO</th>
			<th width="40%">Nama Barang</th>
			<th colspan="2" width="7.5%">Qty</th>
			<th width="20%">Harga Satuan</th>
			<th>Jumlah</th>
		</tr>

            <?php $no = 0;?>
            <?php $total = 0; ?>
            <?php $totalpajak = 0; ?>
            <?php $totalamount = 0; ?>
            @foreach($pembelian_detail as $items)
            <?php $no++ ;?>
                <tr>
                    <td align="center">{{ $no }}</td>
                    <?php
						$produk   = App\Product::where('id', $items->produk_id)->select('nama_produk')->first();
						$amount   = $items->qty_terima * $items->harga_jual;
						$diskonrp = $amount*$items->diskon/100;
						$amount2  = $amount-$diskonrp;
						$pajakrp  = $amount2*$items->pajak/100;
						$total       += $diskonrp;
						$totalpajak  += $pajakrp;
						$totalamount += $amount; 
                    ?>
                    <td style="padding-left: 5px;">{{ $produk->nama_produk }}</td>
                    <td width="3%" align="right" style="padding-right: 5px; border-right: 0;">{{ $items->qty_terima }}</td>
                    <td style="border-left: 0;">{{ $items->uom_id }}</td>
                    <td style="padding-right: 5px;">Rp <span class="right">{{ number_format($items->harga_jual) }}</span></td>
                    <td style="padding-right: 5px;">Rp <span class="right">{{ number_format($amount) }}</span></td>
                </tr>
            @endforeach
			
			@for ($no; $no <= 15; $no++)
				<tr>
					<td align="center">{{ $no }}</td>
					<td></td>
					<td style="border-right: 0;"></td>
					<td style="border-left: 0;"></td>
					<td></td>
					<td></td>
				</tr>
			@endfor

            <tfoot>
                <tr style="border-style: hidden;">
                    <th colspan="5" align="right" style="padding-right: 5px;">Total Pembelian</th>
                    <th align="left" style="padding-right: 5px;">Rp <span class="right">{{number_format($totalamount)}}</span></th>
                </tr>
            </tfoot>
        </table>

	<br><br>
	<button id="btn-print" onclick="window.print()" title="Pre Order" style="margin-left: 5%; cursor: pointer;"><img src="{{ url('/images/logo/print.png') }}" alt=""></button>
</body>
</html>