<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use App\Pembelian;
use App\PembelianDetail;
use App\User;
use App\Product;
use App\Gudang;
use App\Akun;
use App\Uom;
use App\Kontak;
use App\Transaction;
use App\Departement;
Use Str;
use DataTables;
use Input;
use App\Penjualan;
use App\PenjualanDetail;
use App\Penyesuaian;
use App\PenyesuaianDetail;
use App\Transfer;
use App\TransferDetail;
use App\HistoriStok;
use Session;
use Redirect;
use Carbon\Carbon;

class PenyesuaianController extends Controller
{
    public function index(){
	
	$uoms =  Uom::All();
    $kontak = Kontak::pluck('nama_kontak','id');
	
    return view('modules.penyesuaian.index',compact('uoms','kontak'));
	}

	public function data()
    {
        //$roles = penyesuaian::select(['tanggal_faktur', 'no_faktur', 'no_po', 'kontak_id', 'proyek', 'total_setelah_pajak']);
        $roles = DB::table('penyesuaians')
                 ->join('gudangs','penyesuaians.gudang_asal', '=', 'gudangs.id')
                 ->join('penyesuaian_details','penyesuaians.id', '=', 'penyesuaian_details.penyesuaian_id')
                 ->select('penyesuaians.id','penyesuaians.no_reff','penyesuaians.keterangan', 'penyesuaians.tanggal', 'gudangs.nama_gudang', DB::raw('SUM(penyesuaian_details.qty * penyesuaian_details.harga_satuan) AS nilai'))
                 ->groupBy('penyesuaians.id','penyesuaians.no_reff','penyesuaians.keterangan', 'penyesuaians.tanggal', 'gudangs.nama_gudang')
                 ->get()
                 ;
        return DataTables::of($roles)
               ->addColumn('action', function ($role) {
                return
                  '<div class="text-center btn-group btn-group-justified"><a href="penyesuaian/detail/'.$role->id.'" title="Detail Data penyesuaian"><button type="button" class="btn btn-sm btn-success"><i class="fa fa-search"></i></button></a><a href="penyesuaian/delete/'.$role->id.'" title="Delete" Onclick="return ConfirmDelete();"><button type="button" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></button></a></div>';
            })
            //->editColumn('id', 'ID: {{$id}}')
            //->removeColumn('password')
            //->removeColumn('remember_token')
            ->make(true);
    }

    public function create()
    {
    	date_default_timezone_set('Asia/Jakarta');
        //$date = date('ym');
        $date = '00';

        $dataMax = DB::table('penyesuaians')->select(['no_reff as ID'])
                   ->orderBy('no_reff', 'DESC')
                   ->get();
        $dataMax2 = Str::substr($dataMax,14,5);
        $param1 = 'IJ';
        $param  = $param1.$date.'' ;
            if($dataMax2=='') {
                // Bila Data Kosong
                $ID = $param."0000001";
            }else {
                $MaksID = $dataMax2;
                $MaksID++;
                if($MaksID < 10) $ID = $param."000000".$MaksID; // nilai kurang dari 10
                else if($MaksID < 100) $ID = $param."00000".$MaksID; // nilai kurang dari 100
                else if($MaksID < 100) $ID = $param."0000".$MaksID; // nilai kurang dari 100
                else if($MaksID < 100) $ID = $param."000".$MaksID; // nilai kurang dari 100
                else if($MaksID < 1000) $ID = $param."00".$MaksID; // nilai kurang dari 1000
                else if($MaksID < 10000) $ID = $param."0".$MaksID; // nilai kurang dari 10000
                else $ID = $MaksID; // lebih dari 10000
            }
        //$id = $date.'.'.$ID;
        $invoice = $ID;

        //$invoice = $this->getNewInvoiceNo();

        $product_list = Product::pluck('nama_produk','id');
    	$akun_list = Akun::pluck('nama_akun','id');
    	$kontak_list = Kontak::pluck('nama_kontak','id');
    	$gudang_list = Gudang::pluck('nama_gudang','id');
    	$departement_list = Departement::pluck('nama_departement','id');
    	return view('modules.penyesuaian.add',compact('kontak_list','product_list','invoice','gudang_list','departement_list','akun_list'));
    	//return view('modules.penyesuaian.add');
    }

    public function insert(Request $request)
    {
        $penyesuaian                 = new Penyesuaian;
        $penyesuaian->no_reff        = $request->no_reff;
        $penyesuaian->tanggal        = date('Y-m-d', strtotime(str_replace('/', '-', $request->tanggal)));
        $penyesuaian->proyek         = $request->proyek;
        $penyesuaian->departement_id = $request->departement_id;
        $penyesuaian->keterangan     = $request->keterangan;
        $penyesuaian->gudang_asal    = $request->gudang_asal;
        $penyesuaian->nilai          = $request->total;
        $penyesuaian->is_cetak       = $request->is_cetak;

        if ($penyesuaian->save()){
            foreach ($request->nama_produk as $key => $v) 
            {
                date_default_timezone_set('Asia/Jakarta');
                $detail = PenyesuaianDetail::create([
                    'penyesuaian_id' => $penyesuaian->id,
                    'no_reff'        => $request->no_reff,
                    'produk_id'      => $v,
                    'qty'            => $request->qty[$key],
                    'uom_id'         => $request->uom_id[$key],
                    'harga_satuan'   => $request->harga[$key],
                    'job'            => $request->job[$key],                        
                    'amount'         => $request->amount[$key],
                    'akun_id'        => $request->akun_id[$key]
                ]);

                $historiStokTerakhir = HistoriStok::where('id_produk', $v)->latest('tgl_berubah')->first();
                $historiStokTerakhir = $historiStokTerakhir['stok_tersisa'] ?? 0;
                $namaProduk  = Product::find($v)['nama_produk'];
                $historiStok = HistoriStok::create([
                    'tgl_berubah' => Carbon::now(),
                    'id_produk' => $v,
                    'nama_produk' => $namaProduk,
                    'keterangan' => $penyesuaian->keterangan ?? 'PENYESUAIAN STOK',
                    'gudang_asal' => $penyesuaian->gudang_asal,
                    'masuk' => $request->qty[$key],
                    'keluar' => 0,
                    'stok_tersisa' => $historiStokTerakhir + $request->qty[$key]
                ]);
            }
        }
       
        return redirect()->route('penyesuaian.index');
    }

    public function findPrice(Request $request)
    {
        $data = Product::select('harga_jual_satuan')->where('id', $request->id)->first();
        return response()->json($data);
    }

    public function findKodeProduk(Request $request)
    {
        $data = Product::select('kode_produk')->where('id', $request->id)->first();
        return response()->json($data);
    } 

    public function findSatuan(Request $request)
    {
        $data = Product::select('uom_id')->where('id', $request->id)->first();
        return response()->json($data);
    } 

	/**
     * Remove the specified resource from storage.
     *
     * @param  \App\Uom  $uom
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {   /*
        if (! Gate::allows('uoms_view')) {
            return abort(401);
        }        
        
        $permission = Uom::findOrFail($id);
        $permission->delete();
        return redirect()->route('penyesuaians.index');
        */

        $penyesuaian = Penyesuaian::find($id);
        $penyesuaianDetails = PenyesuaianDetail::where('penyesuaian_id', $id)->get();

        foreach ($penyesuaianDetails as $key => $detail) {
            $historiStokTerakhir = HistoriStok::where('id_produk', $detail->produk_id)->latest('tgl_berubah')->first();
            $historiStokTerakhir = HistoriStok::latest('tgl_berubah')->first();
            $historiStokTerakhir = $historiStokTerakhir['stok_tersisa'] ?? 0;
            $namaProduk  = Product::find($detail->produk_id)['nama_produk'];
            $historiStok = HistoriStok::create([
                'tgl_berubah' => Carbon::now(),
                'id_produk' => $detail->produk_id,
                'nama_produk' => $namaProduk,
                'keterangan' => 'HAPUS PENYESUAIAN STOK',
                'gudang_asal' => $penyesuaian->gudang_asal,
                'masuk' => 0,
                'keluar' => $detail->qty,
                'stok_tersisa' => $historiStokTerakhir - $detail->qty
            ]);

            $detail->delete();
        }
        $penyesuaian->delete();

        Session::flash('message', 'Data Berhasil Dihapus !!!');
        return Redirect::to('penyesuaian');
    }

    public function detail($id){

        $pembelian = DB::table('penyesuaians')->where('id',$id)->first();
        $pembelian_detail = penyesuaianDetail::all()->where('penyesuaian_id','=>',$id);
        $pembelian =
          [
            'pembelian' => $pembelian
          ];
        return view('modules.penyesuaian.detail', $pembelian, compact('pembelian_detail'));

    } 
}
