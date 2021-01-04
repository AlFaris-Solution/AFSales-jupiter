<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Kurir extends Model
{
    protected $primaryKey = 'id_kurir';
    protected $fillable = ['nama_kurir'];
}