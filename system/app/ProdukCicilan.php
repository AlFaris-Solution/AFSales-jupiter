<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProdukCicilan extends Model
{
    protected $table = 'produk_cicilan';

    public function product()
    {
        return $this->hasOne(Product::class, 'id', 'product_id');
    }
}
