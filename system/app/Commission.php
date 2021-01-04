<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Commission extends Model
{
    protected $guarded = [];

    protected function fetchCommissions($query = null)
    {
    	return parent::latest()->get();
    }

    protected function createCommission($value)
    {
    	return parent::create($value);
    }

    protected function getCommission($idSo)
    {
        return parent::select('qty', 'sales_commission', 'db_commission')->where('id_so', $idSo)
                    ->latest()
                    ->first();
    }
}
