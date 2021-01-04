<?php

namespace App\Http\Controllers;

use App\Komisi;
use Illuminate\Http\Request;

class KomisiController extends Controller
{
    public function index()
    {
    	$komisi = Komisi::orderBy('tgl_berubah', 'desc')->get();
    	return view('komisi.index', compact('komisi'));
    }

    public function create()
    {
    	return view('komisi.create');
    }

    public function store(Request $request)
    {
    	$data = $this->validate($request, [
    		'komisi_sales' => 'integer|required',
    		'komisi_db' => 'integer|required',
    		'is_active' => 'nullable'
    	]);
    	$data['tgl_berubah'] = $this->changeFormatDate($request->tgl_berubah);
    	Komisi::create($data);
    	return redirect(url('/komisi'))->with('success','Data Berhasil Disimpan');
    }

    public function edit($id)
    {
    	$komisi = Komisi::find($id);
    	return view('komisi.edit', compact('komisi'));
    }

    public function update(Request $request, $id)
    {
    	$data = $this->validate($request, [
    		'komisi_sales' => 'integer|required',
    		'komisi_db' => 'integer|required',
    		'is_active' => 'nullable'
    	]);
    	$data['tgl_berubah'] = $this->changeFormatDate($request->tgl_berubah);
    	Komisi::find($id)->update($data);
    	return redirect(url('/komisi'))->with('warning','Data Berhasil Disimpan');
    }

    public function destroy($id)
    {
    	$komisi = Komisi::find($id)->delete();
    	return redirect(url('/komisi'))->with('danger','Data Berhasil Disimpan');
    }

    public function changeFormatDate($request)
    {
    	if ($request == null) return date('Y-m-d H:i:s');

        $str = explode('/', $request);
        $str = implode('', $str);
        $thn = substr($str, 4);
        $bln = substr($str, 2, 2);
        $tgl = substr($str, 0, 2);
        $str = $thn .'-'. $bln .'-'. $tgl .' '. '00:00:00';
        return $str;
    }
}
