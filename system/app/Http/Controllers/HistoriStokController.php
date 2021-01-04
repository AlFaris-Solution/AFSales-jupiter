<?php

namespace App\Http\Controllers;

use App\HistoriStok;
use Illuminate\Http\Request;

class HistoriStokController extends Controller
{
    public function index(Request $request)
    {
    	$tglAwal  = $this->changeFormatDate($request->start_date) ?? $this->changeFormatDate(date('01/m/Y'));
        $tglAkhir = $this->changeFormatDate($request->end_date) ?? $this->changeFormatDate(date('t/m/Y'));

    	$historiStok = HistoriStok::latest('tgl_berubah')->get();
    	return view('histori-stok.index', compact('historiStok', 'tglAwal', 'tglAkhir'));
    }

    public function changeFormatDate($request)
    {
        if ($request == null || $request == '-') return null;
        
        $str = explode('/', $request);
        $str = implode('', $str);
        $thn = substr($str, 4);
        $bln = substr($str, 2, 2);
        $tgl = substr($str, 0, 2);
        $str = $thn .'-'. $bln .'-'. $tgl .' '. '00:00:00';
        return $str;
    }
}
