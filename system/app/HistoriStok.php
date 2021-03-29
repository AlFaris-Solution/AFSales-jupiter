<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class HistoriStok extends Model
{
    protected $table = 'histori_stok';
    protected $guarded = [];

    public function gudang()
    {
        return $this->belongsTo(Gudang::class, 'gudang_asal', 'id');
    }
}
