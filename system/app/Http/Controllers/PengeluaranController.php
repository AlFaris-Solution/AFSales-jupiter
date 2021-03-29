<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Pengeluaran;

class PengeluaranController extends Controller
{
    public function index()
    {
    	$no = 1;
    	$pengeluaran = Pengeluaran::all();
    	return view('modules.pengeluaran.index', compact('pengeluaran', 'no'));
    }

    public function create()
    {
    	return view('modules.pengeluaran.create');
    }

    public function store(Request $request)
    {
    	$pengeluaran = new Pengeluaran;
    	$pengeluaran->nama = $request->nama;
    	$pengeluaran->nilai = $request->nilai;
    	$pengeluaran->save();
    	return redirect('/pengeluaran');
    }

    public function edit($id)
    {
    	$pengeluaran = Pengeluaran::find($id);
    	return view('modules.pengeluaran.edit', compact('pengeluaran'));
    }

    public function update(Request $request, $id)
    {
    	$pengeluaran = Pengeluaran::find($id);
    	$pengeluaran->nama = $request->nama;
    	$pengeluaran->nilai = $request->nilai;
    	$pengeluaran->update();
    	return redirect('/pengeluaran');
    }

    public function destroy($id)
    {
    	$kurir = Pengeluaran::destroy($id);
    	return redirect('/pengeluaran');
    }
}
