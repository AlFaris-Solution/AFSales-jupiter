<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Kurir;

class KurirController extends Controller
{
    public function index()
    {
    	$no = 1;
    	$kurir = Kurir::all();
    	return view('kurir.index', compact('kurir', 'no'));
    }

    public function create()
    {
    	return view('kurir.create');
    }

    public function store(Request $request)
    {
    	$kurir = new Kurir;
    	$kurir->nama_kurir = $request->name;
    	$kurir->save();
    	return redirect('/kurir');
    }

    public function edit($id)
    {
    	$kurir = Kurir::find($id);
    	return view('kurir.edit', compact('kurir'));
    }

    public function update(Request $request, $id)
    {
    	$kurir = Kurir::find($id);
    	$kurir->nama_kurir = $request->name;
    	$kurir->update();
    	return redirect('/kurir');
    }

    public function destroy($id)
    {
    	$kurir = Kurir::destroy($id);
    	return redirect('/kurir');
    }
}
