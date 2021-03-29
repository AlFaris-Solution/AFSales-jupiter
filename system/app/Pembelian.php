<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pembelian extends Model
{
	public function pembayarans()
	{
	    return $this->hasMany(Pembayaran::class, 'pembelian_id', 'id');
	}

    public function pembayaran_details()
    {
        return $this->hasMany(PembayaranDetail::class, 'pembelian_id', 'id');
    }

    public function kontak()
    {
        return $this->belongsTo(Kontak::class, 'kontak_id', 'id');
    }
}
