<?php

namespace App\Imports;

use App\Product;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;

class ProdukImport implements ToModel, WithStartRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Product([
            'kode_produk'           => $row[0],
            'name'                  => $row[1],
            'nama_produk'           => $row[1], 
            'stok'                  => $row[2],
            'stok_min'              => 1,
            'harga_beli_satuan'     => $row[3],
            'harga_jual_satuan'     => $row[4],
            'uom_id'                => 22,
            'is_active'             => 1,
        ]);
        
    }

    public function startRow(): int
    {
        return 2;
    }
}
