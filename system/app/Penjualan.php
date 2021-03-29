<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Penjualan extends Model
{
    public function kontak()
    {
        return $this->belongsTo(Kontak::class, 'kontak_id', 'id');
    }

    public function kontak_sales()
    {
        return $this->belongsTo(Kontak::class, 'sales', 'id');
    }
}
