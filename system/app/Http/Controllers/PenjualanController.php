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
use App\Kurir;
use App\Transaction;
use App\Departement;
Use Str;
Use PDF;
use DataTables;
use Input;
use App\Penjualan;
use App\PenjualanDetail;
use App\HargaJual;
use App\Harga;
use Session;
use Response;
use Validator;
use Excel;
use Redirect;
use Mike42\Escpos\Printer;
use Mike42\Escpos\EscposImage;
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;
use Mike42\Escpos\PrintConnectors\FilePrintConnector;
use Mike42\Escpos\PrintConnectors\NetworkPrintConnector;
use App\InfoToko;
use App\Items;
use App\HistoriStok;
use Carbon\Carbon;

class PenjualanController extends Controller
{
    public function index(){

        $uoms =  Uom::All();
        $sales = Kontak::where('tipe', 'Seles')->select('id', 'klasifikasi', 'nama_kontak')->get();
        $penjualan = Penjualan::pluck('total_setelah_pajak');
        $penjualans = Penjualan::with('kontak', 'kontak_sales')->get();

        return view('modules.penjualan.index', compact('uoms','sales', 'penjualan', 'penjualans'));
    }

    public function piutang(){

        $roles = DB::table('penjualans')
                ->leftJoin('piutang_details', 'penjualans.id', '=', 'piutang_details.penjualan_id')
                ->leftJoin('piutangs', 'piutang_details.piutang_id', '=', 'piutangs.id')
                ->leftJoin('kontaks','penjualans.kontak_id','=','kontaks.id')
                ->select('penjualans.created_at AS created_at', 'penjualans.no_faktur AS noFaktur', 'kontaks.nama_kontak AS namaKontak','kontaks.kurs','penjualans.saldo_terutang AS saldoTerutang', DB::raw('SUM(IFNULL(piutangs.nilai,0)) AS diBayar'), DB::raw('(IFNULL(penjualans.saldo_terutang,0)) - (SUM(IFNULL(piutangs.nilai,0))) AS totalPiutang')
                )
                ->orderBy('penjualans.created_at', 'DESC')
                ->where('penjualans.saldo_terutang','!=',0)
                ->groupBy('kontaks.nama_kontak','kontaks.kurs','penjualans.saldo_terutang', 'penjualans.no_faktur' ,'penjualans.created_at')->get();

        return view('modules.penjualan.piutang', compact('roles'));
    }

    public function home()
    {
        $roles = DB::table('penjualans')
                 ->leftJoin('kontaks','penjualans.kontak_id', '=', 'kontaks.id')
                 ->leftJoin('penjualan_details','penjualan_details.penjualan_id', '=', 'penjualans.id')
                 ->select('penjualan_details.no_faktur as no_faktur', 'penjualans.tanggal_faktur', DB::raw('IFNULL(kontaks.nama_kontak,"Retail") as nama_kontak'), 'penjualans.total_setelah_pajak')
                 ->orderBy('penjualans.id', 'DESC')->get()
                 ;
    }

    public function data()
    {
        $roles = DB::table('penjualans')
                ->leftJoin('kontaks','kontaks.id', '=', 'penjualans.kontak_id')
                ->leftJoin('penjualan_details','penjualan_details.penjualan_id', '=', 'penjualans.id')
                ->leftJoin('products','products.id', '=', 'penjualan_details.produk_id')
                ->select('penjualans.id','penjualan_details.no_faktur as no_faktur', 'products.nama_produk as nama_produk' ,'penjualan_details.qty_terima as jumlah', 'penjualans.tanggal_faktur', DB::raw('IFNULL(kontaks.nama_kontak, "Retail") as nama_kontak'), 'penjualans.total_setelah_pajak')
                ->orderBy('penjualans.id', 'DESC');

        $tglAwal  = $this->changeFormatDate(request()->start_date) ?? $this->changeFormatDate(date('01/m/Y'));
        $tglAkhir = $this->changeFormatDate(request()->end_date) ?? $this->changeFormatDate(date('t/m/Y'));

        if (!empty(request('sales')) && !empty(request('start_date')) && !empty(request('end_date'))) {
            $roles = $roles
                ->where('sales', request('sales'))
                ->whereBetween('penjualans.tanggal_faktur', [$tglAwal, $tglAkhir]);
        }
        $roles = $roles->get();

        $data = array();
        foreach ($roles as $key => $list) {
            $row                        = array();
            $row['id']                  = $key+1;
            $row['tanggal_faktur']      = date('d/m/Y', strtotime($list->tanggal_faktur));
            $row['no_faktur']           = $list->no_faktur;
            $row['nama_kontak']         = $list->nama_kontak;
            $row['sales']               = $list->nama_kontak;
            $row['total_setelah_pajak'] = $list->total_setelah_pajak;
            $row['action']              = '
                <div class="text-center btn-group btn-group-justified">
                    <a href="penjualan/detail/'.$list->id.'" title="Detail Data penjualan">
                        <button type="button" class="btn btn-sm btn-success"><i class="fa fa-eye"></i></button>
                    </a>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <button class="btn btn-sm btn-default" style="border-radius: 0;"><i class="fa fa-print"></i> <span class="caret"></span></button>
                    </a>
                    <ul class="dropdown-menu" role="menu" style="margin-left: -25%;">
                        <li class="dropdown-item"><a onclick="notaBesar('.$list->id.')">Cetak Nota Besar</a></li>
                        <li class="dropdown-item"><a onclick="notaMedium('.$list->id.')">Cetak Nota Sedang</a></li>
                        <li class="dropdown-item"><a onclick="notaKecil('.$list->id.')">Cetak Nota kecil</a></li>
                    </ul>
                    <a href="penjualan/delete/'.$list->id.'" title="Delete" Onclick="return ConfirmDelete();">
                        <button type="button" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></button>
                    </a>
                </div>
            ';
            $data[] = $row;
        }
        return DataTables::of($data)->make(true);
    }

    public function keyword($keyword)
    {
        $entries = Product::where('kode_produk', $keyword)->first();
        echo json_encode($entries);
    }

    public function create()
    {
        date_default_timezone_set('Asia/Jakarta');
        //$date = date('ym');
        $date = '00'; //00000000098

        $dataMax = DB::table('penjualans')->select(['no_faktur as ID'])
                   //->where('id','<=','120')
                   ->orderBy('no_faktur', 'DESC')
                   ->get();
        $dataMax2 = Str::substr($dataMax,8,11);
        $param1 = 'PJ';
        $param  = $param1.$date.'' ;
            if($dataMax2=='') {
                // Bila Data Kosong
                //$ID = $param."0000001";
                $ID = "00000000001";
            }else {
                $MaksID = $dataMax2;
                $MaksID++;
                /*
                if($MaksID < 10) $ID = $param."000000".$MaksID; // nilai kurang dari 10
                //else if($MaksID < 100) $ID = $param."0000000".$MaksID; // nilai kurang dari 100
                //else if($MaksID < 1000) $ID = $param."000000".$MaksID; // nilai kurang dari 100
                else if($MaksID < 10000) $ID = $param."00000".$MaksID; // nilai kurang dari 100
                else if($MaksID < 100000) $ID = $param."0000".$MaksID; // nilai kurang dari 1000
                else if($MaksID < 1000000) $ID = $param."000".$MaksID; // nilai kurang dari 10000
                else if($MaksID < 10000000) $ID = $param."00".$MaksID; // nilai kurang dari 10000
                else if($MaksID < 100000000) $ID = $param."0".$MaksID; // nilai kurang dari 10000
                else $ID = $MaksID; // lebih dari 10000 */
                if($MaksID < 10) $ID = "0000000000".$MaksID; // nilai kurang dari 10
                else if($MaksID < 100) $ID = "000000000".$MaksID; // nilai kurang dari 100
                else if($MaksID < 1000) $ID = "00000000".$MaksID; // nilai kurang dari 1000
                else if($MaksID < 10000) $ID = "0000000".$MaksID; // nilai kurang dari 10000
                else if($MaksID < 100000) $ID = "000000".$MaksID; // nilai kurang dari 100000
                else if($MaksID < 1000000) $ID = "00000".$MaksID; // nilai kurang dari 1000000
                else if($MaksID < 10000000) $ID = "0000".$MaksID; // nilai kurang dari 10000000
                else if($MaksID < 100000000) $ID = "000".$MaksID; // nilai kurang dari 100000000
                else if($MaksID < 1000000000) $ID = "00".$MaksID; // nilai kurang dari 1000000000
                else if($MaksID < 10000000000) $ID = "0".$MaksID; // nilai kurang dari 10000000000
                else $ID = $MaksID; // lebih dari 10000
            }
        //$id = $date.'.'.$ID;
        $invoice = $ID;

        //$invoice = $this->getNewInvoiceNo();

        //$product_list = Product::pluck('nama_produk','id');
        //$kontak_list = Kontak::pluck('nama_kontak','id');
            $product_list = Product::all();
            $kontak_list = Kontak::all()->where('tipe','=','Customer');
            $sales_list = Kontak::all()->where('tipe','=','Seles');
        $gudang_list = Gudang::pluck('nama_gudang','id');
        $departement_list = Departement::pluck('nama_departement','id');
      $product_uoms_list = DB::table('product_uoms')->where('produk_id', Input::get('produk_id'))->pluck('uom_id','uom_id');

      //$uoms_list = Uom::pluck('nama_uom','nama_uom');
      $uoms_list = Uom::pluck('nama_uom','nama_uom');
        return view('modules.penjualan.add',compact('kontak_list','product_list','invoice','gudang_list','departement_list','uoms_list', 'sales_list'));
        //return view('modules.penjualan.add');
    }

    public function getProduk(Request $request)
    {
        $product_list = Product::all();
        $harga  = Harga::where('kontak_id', $request->kontak_id)->latest()->first();

        // foreach ($product_list as $list) {
        //     if ($request->jenis_penjualan == '2' && $harga) {
        //         $list->harga_jual_satuan = $harga->produk_id == $list->id ? $harga->harga_jual_pelanggan : $list->harga_jual_satuan;
        //     }
        // }

        return response()->json($product_list);
    }

    
public function insert(Request $request)
{
  $rules = array(
  'qty' => 'required',
  'uang_muka' => 'required',
  //'email' => 'required|string|email|max:255|unique:biayas',
  //'password' => 'required|string|min:6|confirmed',
  );

  $messages = [
        'required' => 'The :attribute field is required.',
        'same'     => 'The :attribute and :other must match.',
        'size'     => 'The :attribute must be exactly :size.',
        'between'  => 'The :attribute must be between :min - :max.',
        'in'       => 'The :attribute must be one of the following types: :values',
  ];

  $validator = Validator::make(Input::all(), $rules, $messages);

  if ($validator->fails()) {
        return redirect()->route('penjualan.create')->withErrors($validator)->withInput();
  } else {
    //date_default_timezone_set('Asia/Jakarta');
    $penjualan = new Penjualan;
    $penjualan->jenis_penjualan=$request->jenis_penjualan;
    $penjualan->kontak_id=$request->kontak_id;
    $penjualan->no_faktur=$request->no_faktur;
    
        $var = $request->tanggal_faktur;
    $date = str_replace('/', '-', $var);
    $value = date('Y-m-d', strtotime($date));

    $penjualan->tanggal_faktur=$value;

    $penjualan->gudang_keluar_id=$request->gudang_masuk_id;
    $penjualan->departement_id=$request->departement_id;

    $penjualan->nama_konsumen=$request->nama_konsumen;
    $penjualan->alamat_konsumen=$request->alamat_konsumen;
    $penjualan->kota_konsumen=$request->kota_konsumen;
    $penjualan->desa_konsumen=$request->desa_konsumen;
    $penjualan->provinsi_konsumen=$request->provinsi_konsumen;
    $penjualan->hp_konsumen=$request->hp_konsumen;
    $penjualan->expedisi=$request->expedisi;

    $var = $request->tanggal_kirim;
    $date = str_replace('/', '-', $var);
    $tanggal_kirim = date('Y-m-d', strtotime($date));

    $penjualan->tanggal_kirim=$tanggal_kirim;
    $penjualan->sales=$request->sales;

    $stt = Str::substr($request->totalpajak,4,50);
    $st3 = (int)str_replace(array(' ', ','), '', $stt);
    $penjualan->total_pajak=$st3;

    $sttt = Str::substr($request->totalsetelahpajak,4,50);
    $st4 = (int)str_replace(array(' ', ','), '', $sttt);
    $penjualan->total_setelah_pajak=$st4;
    $penjualan->uang_muka=$request->uang_muka;

    $st = Str::substr($request->saldo_terutang,4,50);
    $st2 = (int)str_replace(array(' ', ','), '', $st);
    $penjualan->saldo_terutang=$st2;
    $penjualan->is_tunai=$request->is_tunai;
    $penjualan->is_cetak=$request->is_cetak;
    $penjualan->is_void=$request->is_void;
    $penjualan->is_canceled=$request->is_canceled;
    $penjualan->user_id = $request->user_id;
    if ($penjualan->save()){
        $id = $penjualan->id;
        foreach ($request->nama_produk as $key => $v)
        {
            date_default_timezone_set('Asia/Jakarta');
            $data = array(
                    'penjualan_id'   => $id,
                    'no_faktur'      => $request->no_faktur,
                    'produk_id'      => $request->produk_id[$key],
                    'qty_terima'     => $request->qty[$key],
                    'uom_id'         => $request->uom_id[$key] ?? null,
                    'harga_jual'     => $request->harga[$key],
                    'diskon'         => $request->discount[$key],
                    'total'          => $request->amount[$key],
                    'pajak'          => $request->pajak[$key],
                    'created_at'     => DB::raw('now()'),
                    'updated_at'     => DB::raw('now()')
                );
            PenjualanDetail::insert($data);
            //-- Manajemen Stok --//
            $qty = Product::select('stok')->where('id', $request->produk_id[$key])->first();

            DB::table('products')
            ->where('id', $request->produk_id[$key])
            ->update(array(
                  'stok' => $qty->stok - $request->qty[$key],
                  //'created_at' => date('y-m-d h:m:s'),
                  'updated_at' => date('y-m-d h:m:s')
            ));

            $historiStokTerakhir = HistoriStok::where('id_produk', $request->produk_id[$key])->latest('tgl_berubah')->first();
            $historiStokTerakhir = $historiStokTerakhir['stok_tersisa'] ?? 0;
            $namaProduk  = Product::find($request->produk_id[$key])['nama_produk'];
            $historiStok = HistoriStok::create([
                'tgl_berubah' => Carbon::now(),
                'id_produk' => $request->produk_id[$key],
                'nama_produk' => $namaProduk,
                'keterangan' => 'PENJUALAN',
                'gudang_asal' => $request->gudang_masuk_id,
                'masuk' => 0,
                'keluar' => $request->qty[$key],
                'stok_tersisa' => $historiStokTerakhir - $request->qty[$key]
            ]);
        }
    }
    }

    //return redirect()->route('penjualan.index');
    return redirect()->route('penjualan.detail',$penjualan->id);
}

    public function findPrice2(Request $request)
    {
        $data = Product::select('harga_jual_satuan')->where('id', $request->id)->first();
        return response()->json($data);
    }

    public function findPrice(Request $request)
    {
        $data = HargaJual::select('harga_jual_satuan')->where('produk', $request->id)->where('kontak_id', $request->kontak_id)->first();
        return response()->json($data);
    }
    
    public function jenisharga(Request $request)
    {
        $data = Product::where('id', $request->id)->pluck($request->jenis_harga);
        return ($data);
    }
    
    public function kredit(Request $request)
    {
        $data = Product::select('harga_jual_kredit')->where('id', $request->id)->first();
        return response()->json($data);
    }

    public function Price(Request $request)
    {
        $data = Product::select('harga_jual_satuan')->where('id', $request->id)->first();
        $data2 = Harga::select('harga_jual_pelanggan AS harga_jual_satuan')->where('produk_id', $request->id)->where('kontak_id', $request->kontak_id)->where('uom_id',$request->uom_id)->first();

        if ($data2 == '') {
            $data3 = $data;
        }else{
            $data3 = $data2;
        }
        return response()->json($data3);
    }
    public function findKodeProduk(Request $request)
    {
        $data = Product::select('kode_produk')->where('id', $request->id)->first();
        return response()->json($data);
    }

    public function findSatuan(Request $request)
    {
        $datax = Harga::select('uom_id')->where('produk_id', $request->id)->where('kontak_id', $request->kontak_id)->first();
        if (count($datax) >= 1) {
            $data = $datax;
        }else{
            $data = 'pcs';
        }
        return response()->json($datax);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Uom  $uom
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $penjualan = Penjualan::find($id);
        $penjualanDetails = PenjualanDetail::where('penjualan_id', $id)->get();

        foreach ($penjualanDetails as $key => $detail) {
            $historiStokTerakhir = HistoriStok::where('id_produk', $detail->produk_id)->latest('tgl_berubah')->first();
            $historiStokTerakhir = $historiStokTerakhir['stok_tersisa'] ?? 0;
            $produk  = Product::find($detail->produk_id)->first();
            $historiStok = HistoriStok::create([
                'tgl_berubah' => Carbon::now(),
                'id_produk' => $produk->id,
                'nama_produk' => $produk->nama_produk,
                'keterangan' => 'HAPUS PENJUALAN',
                'gudang_asal' => $penjualan->gudang_keluar_id,
                'masuk' => $detail->qty_terima,
                'keluar' => 0,
                'stok_tersisa' => $historiStokTerakhir + $detail->qty_terima
            ]);

            $detail->delete();
        }
        $penjualan->delete();
        return Redirect::to('penjualan');
    }

    public function detail($id){

        $pembelian = DB::table('penjualans')->where('id',$id)->first();
        $pembelian_detail = PenjualanDetail::all()->where('penjualan_id','=>',$id);
        $pembelian =
            [
                'pembelian' => $pembelian
            ];
        $uoms_list = Uom::pluck('nama_uom', 'nama_uom');
        return view('modules.penjualan.detail', $pembelian, compact('pembelian_detail', 'uoms_list'));

    }


    public function preOrder($id){

        $pembelian = DB::table('penjualans')->where('id', $id)->first();
        $pembelian_detail = PenjualanDetail::all()->where('penjualan_id','=>', $id);

        return view('modules.penjualan.preOrder', compact('pembelian_detail', 'pembelian'));

    }

    public function detailEdit($id)
    {
      $penjualan = PenjualanDetail::find($id);
      $penjualan->qty_terima = request()->qty;
      $penjualan->uom_id     = request()->satuan;
      $penjualan->total      = (int) $penjualan->harga_jual * request()->qty;
      $penjualan->update();

      return redirect()->back();
    }

    public function detailDelete($id)
    {
        $penjualan_detail = PenjualanDetail::find($id);
        
        $penjualan = Penjualan::find($penjualan_detail->penjualan_id);
        $penjualan->total_setelah_pajak -= $penjualan_detail->total;
        $penjualan->saldo_terutang -= $penjualan_detail->total;
        $penjualan->save();
        
        $penjualan_detail->delete();

        return redirect()->back();
    }

    public function getdataPiutang(){
        $roles = DB::table('penjualans')
                ->leftJoin('piutang_details', 'penjualans.id', '=', 'piutang_details.penjualan_id')
                ->leftJoin('piutangs', 'piutang_details.piutang_id', '=', 'piutangs.id')
                ->leftJoin('kontaks','penjualans.kontak_id','=','kontaks.id')
                // ->select('penjualans.created_at AS created_at', 'kontaks.nama_kontak AS namaKontak','kontaks.kurs','penjualans.saldo_terutang AS saldoTerutang', DB::raw('SUM(IFNULL(piutangs.nilai,0)) AS diBayar'), DB::raw('(IFNULL(penjualans.saldo_terutang,0)) - (SUM(IFNULL(piutangs.nilai,0))) AS totalPiutang')
                //    )
                // ->orderBy('penjualans.tanggal_faktur', 'DESC')
                ->where('penjualans.saldo_terutang','!=', 0);
                // ->groupBy('kontaks.nama_kontak','kontaks.kurs','penjualans.saldo_terutang', 'penjualans.created_at')->get();

        $tglAwal  = $this->changeFormatDate(request()->start_date) ?? $this->changeFormatDate(date('01/m/Y'));
        $tglAkhir = $this->changeFormatDate(request()->end_date) ?? $this->changeFormatDate(date('t/m/Y'));

        if (!empty(request('start_date')) && !empty(request('end_date'))) {
            $roles = $roles->whereBetween('penjualans.tanggal_faktur', [$tglAwal, $tglAkhir]);
        }

        $roles = $roles
                ->get()
                ->groupBy('kontaks.nama_kontak', 'kontaks.kurs', 'pembelians.saldo_terutang');

        $data = array();
        foreach ($roles as $key => $list) {
            $row = array();
            if (request('tanggal_jatuh_tempo') == 1) {
                if (strtotime($list->first()->tanggal_jatuh_tempo) <= strtotime(date('Y-m-d', strtotime(Carbon::today())))) {
                    $row['tanggal_faktur'] = date('d/m/Y', strtotime($list->first()->tanggal_faktur));
                    $row['tanggal_jatuh_tempo'] = date('d/m/Y', strtotime($list->first()->tanggal_jatuh_tempo));
                    $row['no_faktur'] = $list->first()->no_faktur;
                    $row['nama_kontak'] = $list->first()->nama_kontak;
                    $row['kurs'] = $list->first()->kurs;
                    $row['saldoTerutang'] = $list->first()->saldo_terutang;
                    $row['diBayar'] = $list->sum('nilai') ?? 0;
                    $row['totalPiutang'] = ($list->first()->saldo_terutang - $list->sum('nilai')) ?? 0;
                    $data[] = $row;
                }
            } else {
                $row['tanggal_faktur'] = date('d/m/Y', strtotime($list->first()->tanggal_faktur));
                $row['tanggal_jatuh_tempo'] = date('d/m/Y', strtotime($list->first()->tanggal_jatuh_tempo));
                $row['no_faktur'] = $list->first()->no_faktur;
                $row['nama_kontak'] = $list->first()->nama_kontak;
                $row['kurs'] = $list->first()->kurs;
                $row['saldoTerutang'] = $list->first()->saldo_terutang;
                $row['diBayar'] = $list->sum('nilai') ?? 0;
                $row['totalPiutang'] = ($list->first()->saldo_terutang - $list->sum('nilai')) ?? 0;
                $data[] = $row;
            }
        }

        return DataTables::of($data)->make(true);
    }

    public function daftarpiutang(){

    $uoms =  Uom::All();
    $kontak = Kontak::pluck('nama_kontak','id');
    return view('modules.pembelian.piutang',compact('uoms','kontak'));
    }

    public function excel() {

        $payments = Penjualan::leftJoin('kontaks','penjualans.kontak_id', '=', 'kontaks.id')
                 ->leftJoin('penjualan_details','penjualans.id','penjualan_details.penjualan_id')
                 ->leftJoin('products','penjualan_details.produk_id','products.id')
                 ->select('penjualans.id', 'penjualans.tanggal_faktur','penjualans.no_faktur',
                          'penjualans.no_po', DB::raw('IFNULL(kontaks.nama_kontak,"Retail")'),
                          'kode_produk','nama_produk', DB::raw('IFNULL(penjualan_details.qty_terima,0) AS qty_terima'),
                          'penjualan_details.harga_jual',
                          DB::raw('(IFNULL(penjualan_details.qty_terima,0)*penjualan_details.harga_jual) AS subtotal'),
                          DB::raw('IFNULL(penjualan_details.diskon,0) AS diskon'),
                          DB::raw('IFNULL(penjualan_details.qty_terima,0)*penjualan_details.harga_jual*IFNULL(penjualan_details.diskon,0)/100 AS total_diskon'),
                          DB::raw('(IFNULL(penjualan_details.qty_terima,0)*penjualan_details.harga_jual)-(IFNULL(penjualan_details.qty_terima,0)*penjualan_details.harga_jual*IFNULL(penjualan_details.diskon,0)/100) AS total_setelah_diskon')
                          )
                 ->get();

        $data = array();
        foreach ($payments as $key => $payment) {
            $row = array();
            $row['id'] = $key+1;
            $row['tanggal_faktur'] = date('d/m/Y', strtotime($payment->tanggal_faktur));
            $row['no_faktur'] = $payment->no_faktur;
            $row['no_po'] = $payment->no_po;
            $row['nama_kontak'] = $payment->nama_kontak ?? "Retail";
            $row['kode_produk'] = $payment->kode_produk;
            $row['nama_produk'] = $payment->nama_produk;
            $row['qty_terima'] = $payment->qty_terima;
            $row['harga_beli'] = formatNo($payment->harga_beli);
            $row['subtotal'] = formatNo($payment->subtotal);
            $row['diskon'] = explode('.', $payment['diskon'])[0] ?? 0;
            $row['total_diskon'] = explode('.', $payment->total_diskon)[0] ?? 0;
            $row['total_setelah_diskon'] = formatNo(explode('.', $payment->total_setelah_diskon)[0] ?? 0);
            $data[] = $row;
        }

        // Initialize the array which will be passed into the Excel
        // generator.
        $paymentsArray = [];

        // Define the Excel spreadsheet headers

        $paymentsArray[] = ['id','tanggal_faktur','no_faktur','no_po','Pelanggan','kode_produk','nama_produk','qty_jual', 'harga_jual', 'Subtotal', 'Diskon (%)', 'total_diskon', 'total_setelah_diskon'];


        // Convert each member of the returned collection into an array,
        // and append it to the payments array.
        foreach ($data as $list) {
             $paymentsArray[] = $list;
        }

        // Generate and return the spreadsheet
        Excel::create('penjualan', function($excel) use ($paymentsArray) {

        // Set the spreadsheet title, creator, and description
        $excel->setTitle('Penjualan');
        $excel->setCreator('AlFaris')->setCompany('Aplikasi POS');
        $excel->setDescription('penjualan file');

        // Build the spreadsheet, passing in the payments array
        $excel->sheet('sheet1', function($sheet) use ($paymentsArray) {
            $sheet->fromArray($paymentsArray, null, 'A1', false, false);
        });

        })->download('xlsx')->with('success','Data sudah diexport');
    }

    public function faktur(Request $request, $id)
       {
            $products = Product::all();
            $penjualan = PenjualanDetail::leftJoin('penjualans','penjualan_details.penjualan_id','=','penjualans.id')
                                    ->leftJoin('kontaks','penjualans.kontak_id','kontaks.id')
                                    ->leftJoin('kontak_details','penjualans.kontak_id','kontak_details.kontak_id')
                                    ->leftJoin('products','penjualan_details.produk_id','products.id')
                                    ->select(
                                            'penjualans.id',
                                            'kontaks.nama_kontak',
                                            DB::raw('IFNULL(kontaks.nama_kontak,"Retail") as nama_kontak'),
                                            'kontak_details.alamat1',
                                            'kontak_details.kota1',
                                            'penjualans.no_faktur',
                                            'penjualans.tanggal_faktur',
                                            'penjualans.tanggal_jatuh_tempo',
                                            'penjualans.sales',
                                            'penjualans.tanggal_kirim',
                                            'penjualans.uang_muka',
                                            'products.kode_produk',
                                            'products.nama_produk',
                                            'penjualan_details.qty_terima',
                                            'penjualan_details.uom_id',
                                            'penjualan_details.harga_jual',
                                            'penjualan_details.diskon',
                                            DB::raw('penjualan_details.qty_terima*penjualan_details.harga_jual as amount'),
                                            DB::raw('penjualan_details.qty_terima*penjualan_details.harga_jual*(penjualan_details.diskon/100) as tdiskon'),
                                            DB::raw('(penjualan_details.qty_terima*penjualan_details.harga_jual)-(penjualan_details.qty_terima*penjualan_details.harga_jual*(penjualan_details.diskon/100)) as ttlamount')
                                        )
                                    ->where('penjualan_details.penjualan_id',$id)
                                    ->first();

        $items1 = PenjualanDetail::leftJoin('products','penjualan_details.produk_id','products.id')
                                ->select(
                                    'products.kode_produk',
                                    'products.nama_produk',
                                    'penjualan_details.qty_terima',
                                    'penjualan_details.uom_id',
                                    'penjualan_details.harga_jual',
                                    'penjualan_details.diskon',
                                    'penjualan_details.pajak'
                                    )
                                ->where('penjualan_details.penjualan_id',$id)
                                ->take(20)
                                ->get();
        $items2 = PenjualanDetail::leftJoin('products','penjualan_details.produk_id','products.id')
                                ->select(
                                    'products.kode_produk',
                                    'products.nama_produk',
                                    'penjualan_details.qty_terima',
                                    'penjualan_details.uom_id',
                                    'penjualan_details.harga_jual',
                                    'penjualan_details.diskon',
                                    'penjualan_details.pajak'
                                    )
                                ->skip(20)->take(20)
                                ->where('penjualan_details.penjualan_id',$id)
                                ->get();

        $total = PenjualanDetail::select(
                                    DB::raw('SUM(penjualan_details.qty_terima*penjualan_details.harga_jual) AS ttl')
                                    )
                                ->where('penjualan_details.penjualan_id',$id)
                                ->first();

        $info = DB::table('info_toko')
                   ->select(
                     'nama_toko',
                     'alamat_toko',
                     'desa_toko',
                     'kecamatan_toko',
                     'kota_toko',
                     'provinsi_toko',
                     'kode_pos_toko',
                     'hp_toko'
                     )
                   ->first();

         $nett = PenjualanDetail::select(
                                    DB::raw('SUM(penjualan_details.qty_terima*penjualan_details.harga_jual) -
                                             SUM(penjualan_details.qty_terima*penjualan_details.harga_jual*(penjualan_details.diskon/100)) AS nett')
                                       )
                                ->where('penjualan_details.penjualan_id',$id)
                                //->groupBy('penjualan_details.penjualan_id')
                                ->first();

          $kurir = Kurir::all();
          $salesId = Penjualan::find($id)['sales'] ?? '';
          $sales = Kontak::where('id', $salesId)->first()['nama_kontak'] ?? '';

            //     view()->share('products',compact('penjualan','items','nett','info'));
            //     if($request->has('download')){
            //         $pdf = PDF::loadView('htmltopdfview',compact('penjualan','items','nett'));
            //         return $pdf->download('htmltopdfview',compact('penjualan','items','nett'));

            // }

            return view('modules.penjualan.tagihan',compact('penjualan','items1', 'items2', 'nett','info', 'kurir', 'sales'));
       }

       public function printSmall(Request $request, $id)
       {
            $products = Product::all();
            $penjualan = PenjualanDetail::leftJoin('penjualans','penjualan_details.penjualan_id','=','penjualans.id')
                        ->leftJoin('kontaks','penjualans.kontak_id','kontaks.id')
                        ->leftJoin('products','penjualan_details.produk_id','products.id')
                        ->select(
                                'penjualans.id',
                                'kontaks.nama_kontak',
                                 DB::raw('IFNULL(kontaks.nama_kontak,"Retail") as nama_kontak'),
                                'penjualans.no_faktur',
                                'penjualans.tanggal_faktur',
                                'penjualans.tanggal_kirim',
                                'penjualans.uang_muka',
                                'products.kode_produk',
                                'products.nama_produk',
                                'penjualan_details.qty_terima',
                                'penjualan_details.uom_id',
                                'penjualan_details.harga_jual',
                                'penjualan_details.diskon',
                                DB::raw('penjualan_details.qty_terima*penjualan_details.harga_jual as amount'),
                                DB::raw('penjualan_details.qty_terima*penjualan_details.harga_jual*(penjualan_details.diskon/100) as tdiskon'),
                                DB::raw('(penjualan_details.qty_terima*penjualan_details.harga_jual)-(penjualan_details.qty_terima*penjualan_details.harga_jual*(penjualan_details.diskon/100)) as ttlamount')
                            )
                        ->where('penjualan_details.penjualan_id',$id)
                        ->first();

            $items = PenjualanDetail::leftJoin('products','penjualan_details.produk_id','products.id')
                ->select(
                    'products.kode_produk',
                    'products.nama_produk',
                    'penjualan_details.qty_terima',
                    'penjualan_details.uom_id',
                    'penjualan_details.harga_jual',
                    'penjualan_details.diskon',
                    'penjualan_details.pajak'
                    )
                ->where('penjualan_details.penjualan_id',$id)
                ->get();

            $total = PenjualanDetail::select(
                DB::raw('SUM(penjualan_details.qty_terima*penjualan_details.harga_jual) AS ttl'))
                ->where('penjualan_details.penjualan_id',$id)
                ->first();

            $info = DB::table('info_toko')
                ->select(
                'nama_toko',
                'alamat_toko',
                'desa_toko',
                'kecamatan_toko',
                'kota_toko',
                'provinsi_toko',
                'kode_pos_toko',
                'hp_toko'
                )
                ->first();

            $nett = PenjualanDetail::select(
                    DB::raw('SUM(penjualan_details.qty_terima*penjualan_details.harga_jual) -
                             SUM(penjualan_details.qty_terima*penjualan_details.harga_jual*(penjualan_details.diskon/100)) AS nett')
                       )
                    ->where('penjualan_details.penjualan_id',$id)
                    ->first();

            view()->share('products',compact('penjualan','items','nett','info'));
            if($request->has('download')){
                $pdf = PDF::loadView('htmltopdfview', compact('penjualan','items','nett'));
                return $pdf->download('htmltopdfview',compact('penjualan','items','nett'));

            }

            return view('modules.penjualan.printsmall', compact('penjualan','items','nett','info'));           
       }

       public function printMedium(Request $request, $id)
       {
            $kurir = Kurir::all();
            $products = Product::all();
            $penjualan = PenjualanDetail::leftJoin('penjualans','penjualan_details.penjualan_id','=','penjualans.id')
                        ->leftJoin('kontaks','penjualans.kontak_id','kontaks.id')
                        ->leftJoin('products','penjualan_details.produk_id','products.id')
                        ->select(
                                'penjualans.id',
                                'kontaks.nama_kontak',
                                 DB::raw('IFNULL(kontaks.nama_kontak,"Retail") as nama_kontak'),
                                'penjualans.no_faktur',
                                'penjualans.tanggal_faktur',
                                'penjualans.tanggal_kirim',
                                'penjualans.uang_muka',
                                'products.kode_produk',
                                'products.nama_produk',
                                'penjualan_details.qty_terima',
                                'penjualan_details.uom_id',
                                'penjualan_details.harga_jual',
                                'penjualan_details.diskon',
                                DB::raw('penjualan_details.qty_terima*penjualan_details.harga_jual as amount'),
                                DB::raw('penjualan_details.qty_terima*penjualan_details.harga_jual*(penjualan_details.diskon/100) as tdiskon'),
                                DB::raw('(penjualan_details.qty_terima*penjualan_details.harga_jual)-(penjualan_details.qty_terima*penjualan_details.harga_jual*(penjualan_details.diskon/100)) as ttlamount')
                            )
                        ->where('penjualan_details.penjualan_id',$id)
                        ->first();

            $items1 = PenjualanDetail::leftJoin('products','penjualan_details.produk_id','products.id')
                                ->select(
                                    'products.kode_produk',
                                    'products.nama_produk',
                                    'penjualan_details.qty_terima',
                                    'penjualan_details.uom_id',
                                    'penjualan_details.harga_jual',
                                    'penjualan_details.diskon',
                                    'penjualan_details.pajak'
                                    )
                                ->where('penjualan_details.penjualan_id',$id)
                                ->take(20)
                                ->get();
        $items2 = PenjualanDetail::leftJoin('products','penjualan_details.produk_id','products.id')
                                ->select(
                                    'products.kode_produk',
                                    'products.nama_produk',
                                    'penjualan_details.qty_terima',
                                    'penjualan_details.uom_id',
                                    'penjualan_details.harga_jual',
                                    'penjualan_details.diskon',
                                    'penjualan_details.pajak'
                                    )
                                ->skip(20)->take(20)
                                ->where('penjualan_details.penjualan_id',$id)
                                ->get();

            $total = PenjualanDetail::select(
                DB::raw('SUM(penjualan_details.qty_terima*penjualan_details.harga_jual) AS ttl'))
                ->where('penjualan_details.penjualan_id',$id)
                ->first();

            $info = DB::table('info_toko')
                ->select(
                'nama_toko',
                'alamat_toko',
                'desa_toko',
                'kecamatan_toko',
                'kota_toko',
                'provinsi_toko',
                'kode_pos_toko',
                'hp_toko'
                )
                ->first();

            $nett = PenjualanDetail::select(
                    DB::raw('SUM(penjualan_details.qty_terima*penjualan_details.harga_jual) -
                             SUM(penjualan_details.qty_terima*penjualan_details.harga_jual*(penjualan_details.diskon/100)) AS nett')
                       )
                    ->where('penjualan_details.penjualan_id',$id)
                    ->first();

            view()->share('products',compact('penjualan','items','nett','info'));
            if($request->has('download')){
                $pdf = PDF::loadView('htmltopdfview',compact('penjualan','items','nett'));
                return $pdf->download('htmltopdfview',compact('penjualan','items','nett'));

            }

            return view('modules.penjualan.printmedium', compact('penjualan','items1','items2','nett','info', 'kurir'));           
       }

       public function struk(Request $request, $id)
       {
          try {

              $id = $request->id;
              $priter_var = DB::table('printer_tab')->first();
              //$connector = new WindowsPrintConnector("EPSON TM-U220 ReceiptE4");
              $ip = $priter_var->ip; //"192.168.1.21";
              $printer = $priter_var->printer; //"EPSON L805 Series";
              //$connector = new WindowsPrintConnector("smb://'.$ip.'/'.$printerName.'");
              //$ip = '192.168.111.11'; // IP Komputer kita atau printer lain yang masih satu jaringan
			        //$printer = 'EPSON TM-U220 Receipt'; // Nama Printer yang di sharing
		    	    $connector = new WindowsPrintConnector("smb://" . $ip . "/" . $printer);
              //$connector = new WindowsPrintConnector("epson lx-310 admin holis");
              $printer = new Printer($connector);

              /* Information for the receipt
              $items = array(
                  new Product("Example item #1", "4.00"),
                  new Product("Another thing", "3.50"),
                  new Product("Something else", "1.00"),
                  new Product("A final item", "4.45"),
              ); */

              $toko = DB::table('info_toko')
                     ->select(
                       'nama_toko',
                       'alamat_toko',
                       'desa_toko',
                       'kecamatan_toko',
                       'kota_toko',
                       'provinsi_toko',
                       'kode_pos_toko',
                       'hp_toko'
                       )
                     ->first();

              $sales = Penjualan::leftJoin('penjualan_details','penjualans.id','penjualan_details.penjualan_id')
                        ->leftJoin('users','penjualans.user_id','users.id')
                        ->select(
                             'penjualans.id',
                             'penjualans.tanggal_faktur',
                             'users.name',
                             'penjualans.uang_muka'
                        )
                        ->where('penjualans.id','=',$id)
                        ->first();

              $fatura_al = PenjualanDetail::leftJoin('products','penjualan_details.produk_id','products.id')
                                      ->select(
                                          'products.kode_produk',
                                          'products.nama_produk',
                                          'penjualan_details.qty_terima',
                                          'penjualan_details.uom_id',
                                          'penjualan_details.harga_jual',
                                          'penjualan_details.diskon',
                                          'penjualan_details.pajak'
                                          )
                                      ->where('penjualan_details.penjualan_id','=',$id)
                                      ->get();

              $subtotal1 = 0;
              $tdiskon = 0;
              foreach ($fatura_al as $key => $value) {
               $diskon_rp = ($value['qty_terima']*$value['harga_jual'])*($value['diskon']/100);
               if ($diskon_rp > 0) {
                   # code...
                    //$n = <br>;
                    $items[] = new Product(
                                    $value['nama_produk'], 
                                    $value['qty_terima'].' x ', 
                                    number_format($value['harga_jual']), 
                                    number_format($value['qty_terima']*$value['harga_jual']),
                                    'Diskon   '.number_format(-1*$diskon_rp)
                                    );
               }else{
                    $items[] = new Items(
                                    $value['nama_produk'], 
                                    $value['qty_terima'].' x ', 
                                    number_format($value['harga_jual']), 
                                    number_format($value['qty_terima']*$value['harga_jual'])
                                    );
               }               
                   $subtotal1 += $value['qty_terima']*$value['harga_jual'];
                   $tdiskon  += $diskon_rp;
              }

              if ($diskon_rp > 0) {
                  $subtotal = new Product('','','','Subtotal :',number_format($subtotal1),true);
                  $bayar = new Product('','','', 'Bayar :',number_format($sales->uang_muka),true);
                  $total = new Product('','','', 'Total :',number_format($subtotal1-$tdiskon), true);
                  $kembali = new Product('','','', 'Kembali :',number_format(($subtotal1-$tdiskon)-$sales->uang_muka),true);
                  $totaldiskon = new Product('','','', 'Diskon :',number_format($tdiskon),true);
              } else {
                  $subtotal = new Items('','','Subtotal :', number_format($subtotal1),true);
                  $bayar = new Items('','', 'Bayar :', number_format($sales->uang_muka),true);
                  $total = new Items('','', 'Total :', number_format($subtotal1-$tdiskon), true);
                  $kembali = new Items('','', 'Kembali :', number_format(($subtotal1-$tdiskon)-$sales->uang_muka),true);
                  $totaldiskon = new Items('','', 'Diskon :', number_format($tdiskon),true);
              }
              
             

              /* Date is kept the same for testing */
              $date = date('d-m-Y');
              //$date = date('d-m-Y');
              // $date = date('d m Y h:i:s');
              //$date = "Monday 6th of April 2015 02:56:25 PM";

              /* Start the printer */
              //$logo = EscposImage::load("resources/escpos-php.png", false);
              $printer = new Printer($connector);

              /* Print top logo */
              $printer -> setJustification(Printer::JUSTIFY_CENTER);
              //$printer -> graphics($logo);
              //$printer -> setTextSize(1, 8);
              /* Name of shop */
              //$printer -> selectPrintMode(Printer::MODE_SINGLE_WIDTH);
              //$printer -> setTextSize(4,1);
              $printer -> text($toko->nama_toko."\n");
              $printer -> selectPrintMode();
              $printer -> text($toko->alamat_toko."\n");
              $printer -> text($toko->hp_toko."\n");
              //$printer -> text(" \n");
              //$printer -> text("--------------------------\n");
              //$printer -> setEmphasis(true);
              //$printer -> text('Tanggal : '.$sales->tanggal_faktur."\n");
              //$printer -> setEmphasis(false);
              //$printer -> feed();
              //$printer -> text("==========================\n");
              $printer -> feed();

              $printer -> setJustification(Printer::JUSTIFY_LEFT);
              $printer -> text('Tanggal : '.$date."\n");
              $printer -> text('Kasir   : '.$sales->name."\n");
              /* Title of receipt
              $printer -> setEmphasis(true);
              $printer -> text("==========================\n");
              $printer -> text("STRUK PENJUALAN\n");
              $printer -> text("==========================\n");
              $printer -> setEmphasis(false);
              */

              /* Items */
              //$printer -> setJustification(Printer::JUSTIFY_LEFT);
              $printer -> setJustification(Printer::JUSTIFY_RIGHT);
              $printer -> setEmphasis(true);
              $printer -> text("---------------------------------\n");
              //$printer -> text(new Product('', '', ''));
              $printer -> setEmphasis(false);
              foreach ($items as $item) {
                       $printer -> text($item);
              }
              $printer -> text("=================================\n");
              //$printer -> setEmphasis(true);
              //$printer -> text($subtotal);
              //$printer -> setEmphasis(false);
              //$printer -> feed();

              /* Tax and total */
              //$printer -> text($tax);
              //$printer -> selectPrintMode(Printer::MODE_DOUBLE_WIDTH);
              $printer -> setJustification(Printer::JUSTIFY_RIGHT);
              $printer -> text($subtotal);
              $printer -> text($totaldiskon);
              $printer -> text($total);
              $printer -> text($bayar);
              $printer -> text($kembali);
              $printer -> selectPrintMode();

              /* Footer */
              $printer -> feed();
              //$printer -> setJustification(Printer::JUSTIFY_LEFT);
              $printer -> setJustification(Printer::JUSTIFY_CENTER);
              /*
              $printer -> text('Subtotal    : '.number_format($subtotal1)."\n");
              $printer -> text('Diskon      : '.number_format($tdiskon)."\n");
              $printer -> text('Total       : '.number_format($subtotal1-$tdiskon)."\n");
              $printer -> text('Bayar       : '.number_format($sales->uang_muka)."\n");
              $printer -> text('Kembali     : '.number_format(($subtotal1-$tdiskon)-$sales->uang_muka)."\n");
              */
              //$printer -> setPrintBuffer($buffer);
              //$printer -> text("Barang Kena Pajak Sudah Termasuk PPN\n");
              $printer -> text("Terima kasih atas kunjungan Anda\n");
              //$printer -> text("For trading hours, please visit example.com\n");
              //$printer -> feed();
              //$printer -> text($date . "\n");

              /* Cut the receipt and open the cash drawer */
              $printer->cut();
              $printer->pulse();
              /* Close printer */
              $printer->close();
              // echo "Sudah di Print";
              //return true;

          } catch(Exception $e) {
              echo "Couldn't print to this printer: " . $e -> getMessage() . "\n";
              //return false;
          }
            //return redirect('penjualan');
            //var_dump($fatura_al);
            return redirect()->route('penjualan.detail',$request->pembelian_id);
      }

      public function invoicePdf($id)
      {
            $orders = PenjualanDetail::leftJoin('penjualans','penjualan_details.penjualan_id','=','penjualans.id')
                                    ->leftJoin('kontaks','penjualans.kontak_id','kontaks.id')
                                    ->leftJoin('products','penjualan_details.produk_id','products.id')
                                    ->select(
                                            'penjualans.id',
                                            'kontaks.nama_kontak',
                                            'kontaks.kontak',
                                             DB::raw('IFNULL(kontaks.nama_kontak,"Retail") as nama_kontak'),
                                            'penjualans.no_faktur',
                                            'penjualans.tanggal_faktur',
                                            'penjualans.tanggal_kirim',
                                            'penjualans.uang_muka',
                                            'products.kode_produk',
                                            'products.nama_produk',
                                            'penjualan_details.qty_terima',
                                            'penjualan_details.uom_id',
                                            'penjualan_details.harga_jual',
                                            'penjualan_details.diskon',
                                            DB::raw('penjualan_details.qty_terima*penjualan_details.harga_jual as amount'),
                                            DB::raw('penjualan_details.qty_terima*penjualan_details.harga_jual*(penjualan_details.diskon/100) as tdiskon'),
                                            DB::raw('(penjualan_details.qty_terima*penjualan_details.harga_jual)-(penjualan_details.qty_terima*penjualan_details.harga_jual*(penjualan_details.diskon/100)) as ttlamount')
                                        )
                                    ->where('penjualan_details.penjualan_id',$id)
                                    ->first();
			$order = PenjualanDetail::leftJoin('products','penjualan_details.produk_id','products.id')
                                ->select(
									//'penjualan_details.penjualan_id',
                                    'products.kode_produk',
                                    'products.nama_produk',
                                    'penjualan_details.qty_terima',
                                    'penjualan_details.uom_id',
                                    'penjualan_details.harga_jual',
                                    'penjualan_details.diskon',
                                    'penjualan_details.pajak'
                                    )
                                ->where('penjualan_details.penjualan_id',$id)
                                ->get();

            $info = DB::table('info_toko')
                   ->select(
                     'nama_toko',
                     'alamat_toko',
                     'desa_toko',
                     'kecamatan_toko',
                     'kota_toko',
                     'provinsi_toko',
                     'kode_pos_toko',
                     'hp_toko'
                     )
                   ->first();

            
            $customPaper = array(0,0,590,440);
            //$dompdf->set_paper($customPaper);

            $pdf = PDF::setOptions(['dpi' => 150, 'defaultFont' => 'sans-serif'])
					  ->setPaper($customPaper, 'potrait')
                      ->loadView('modules.penjualan.faktur', compact('order','orders','info'));
            return $pdf->stream();
            //return var_dump($order);;
      }

      public function invoicePdf2($id)
      {
            $orders = PenjualanDetail::leftJoin('penjualans','penjualan_details.penjualan_id','=','penjualans.id')
                                    ->leftJoin('kontaks','penjualans.kontak_id','kontaks.id')
                                    ->leftJoin('products','penjualan_details.produk_id','products.id')
                                    ->select(
                                            'penjualans.id',
                                            'kontaks.nama_kontak',
                                            'kontaks.kontak',
                                             DB::raw('IFNULL(kontaks.nama_kontak,"Retail") as nama_kontak'),
                                            'penjualans.no_faktur',
                                            'penjualans.tanggal_faktur',
                                            'penjualans.tanggal_kirim',
                                            'penjualans.uang_muka',
                                            'products.kode_produk',
                                            'products.nama_produk',
                                            'penjualan_details.qty_terima',
                                            'penjualan_details.uom_id',
                                            'penjualan_details.harga_jual',
                                            'penjualan_details.diskon',
                                            DB::raw('penjualan_details.qty_terima*penjualan_details.harga_jual as amount'),
                                            DB::raw('penjualan_details.qty_terima*penjualan_details.harga_jual*(penjualan_details.diskon/100) as tdiskon'),
                                            DB::raw('(penjualan_details.qty_terima*penjualan_details.harga_jual)-(penjualan_details.qty_terima*penjualan_details.harga_jual*(penjualan_details.diskon/100)) as ttlamount')
                                        )
                                    ->where('penjualan_details.penjualan_id',$id)
                                    ->first();
            $order = PenjualanDetail::leftJoin('products','penjualan_details.produk_id','products.id')
                                ->select(
                                    //'penjualan_details.penjualan_id',
                                    'products.kode_produk',
                                    'products.nama_produk',
                                    'penjualan_details.qty_terima',
                                    'penjualan_details.uom_id',
                                    'penjualan_details.harga_jual',
                                    'penjualan_details.diskon',
                                    'penjualan_details.pajak'
                                    )
                                ->where('penjualan_details.penjualan_id',$id)
                                ->get();

            $info = DB::table('info_toko')
                   ->select(
                     'nama_toko',
                     'alamat_toko',
                     'desa_toko',
                     'kecamatan_toko',
                     'kota_toko',
                     'provinsi_toko',
                     'kode_pos_toko',
                     'hp_toko'
                     )
                   ->first();

            $pdf = PDF::setOptions(['dpi' => 150, 'defaultFont' => 'sans-serif'])
                      ->setPaper('A4', 'potrait')
                      ->loadView('modules.penjualan.faktur2', compact('order','orders','info'));
            return $pdf->stream();
            //return var_dump($order);;
    }

    public function changeFormatDate($request)
    {
        if ($request == null || $request == '-') return null;        
        return date('Y-m-d 00:00:00', strtotime(str_replace('/', '-', $request) ?? time()));
    }
    
            public function kasir()
    {
        date_default_timezone_set('Asia/Jakarta');
        //$date = date('ym');
        $date = '00'; //00000000098

        $dataMax = DB::table('penjualans')->select(['no_faktur as ID'])
                   //->where('id','<=','120')
                   ->orderBy('no_faktur', 'DESC')
                   ->get();
        $dataMax2 = Str::substr($dataMax,8,11);
        $param1 = 'PJ';
        $param  = $param1.$date.'' ;
            if($dataMax2=='') {
                // Bila Data Kosong
                //$ID = $param."0000001";
                $ID = "00000000001";
            }else {
                $MaksID = $dataMax2;
                $MaksID++;
                /*
                if($MaksID < 10) $ID = $param."000000".$MaksID; // nilai kurang dari 10
                //else if($MaksID < 100) $ID = $param."0000000".$MaksID; // nilai kurang dari 100
                //else if($MaksID < 1000) $ID = $param."000000".$MaksID; // nilai kurang dari 100
                else if($MaksID < 10000) $ID = $param."00000".$MaksID; // nilai kurang dari 100
                else if($MaksID < 100000) $ID = $param."0000".$MaksID; // nilai kurang dari 1000
                else if($MaksID < 1000000) $ID = $param."000".$MaksID; // nilai kurang dari 10000
                else if($MaksID < 10000000) $ID = $param."00".$MaksID; // nilai kurang dari 10000
                else if($MaksID < 100000000) $ID = $param."0".$MaksID; // nilai kurang dari 10000
                else $ID = $MaksID; // lebih dari 10000 */
                if($MaksID < 10) $ID = "0000000000".$MaksID; // nilai kurang dari 10
                else if($MaksID < 100) $ID = "000000000".$MaksID; // nilai kurang dari 100
                else if($MaksID < 1000) $ID = "00000000".$MaksID; // nilai kurang dari 1000
                else if($MaksID < 10000) $ID = "0000000".$MaksID; // nilai kurang dari 10000
                else if($MaksID < 100000) $ID = "000000".$MaksID; // nilai kurang dari 100000
                else if($MaksID < 1000000) $ID = "00000".$MaksID; // nilai kurang dari 1000000
                else if($MaksID < 10000000) $ID = "0000".$MaksID; // nilai kurang dari 10000000
                else if($MaksID < 100000000) $ID = "000".$MaksID; // nilai kurang dari 100000000
                else if($MaksID < 1000000000) $ID = "00".$MaksID; // nilai kurang dari 1000000000
                else if($MaksID < 10000000000) $ID = "0".$MaksID; // nilai kurang dari 10000000000
                else $ID = $MaksID; // lebih dari 10000
            }
        //$id = $date.'.'.$ID;
        $invoice = $ID;

        //$invoice = $this->getNewInvoiceNo();

        //$product_list = Product::pluck('nama_produk','id');
        //$kontak_list = Kontak::pluck('nama_kontak','id');
            $product_list = Product::all();
            $kontak_list = Kontak::all()->where('tipe','=','Customer');
            $sales_list = Kontak::all()->where('tipe','=','Seles');
        $gudang_list = Gudang::pluck('nama_gudang','id');
        $departement_list = Departement::pluck('nama_departement','id');
      $product_uoms_list = DB::table('product_uoms')->where('produk_id', Input::get('produk_id'))->pluck('uom_id','uom_id');

      //$uoms_list = Uom::pluck('nama_uom','nama_uom');
      $uoms_list = Uom::pluck('nama_uom','nama_uom');
        return view('modules.penjualan.add',compact('kontak_list','product_list','invoice','gudang_list','departement_list','uoms_list', 'sales_list'));
        //return view('kasir');
    }
}
