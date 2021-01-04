<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Pembelian;
use App\Penjualan;
use App\Pengeluaran;
use PDF;

class LaporanController extends Controller
{
    public function index()
    {
		return view('laporan.index');
    }
}
