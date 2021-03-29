@extends('layouts.app')



@section('content-header')
      <h1>
        @lang('global.products.title')
        <small>Import</small>
      </h1>

      <ol class="breadcrumb">
        <li><a href="{{url('/')}}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="{{url('products')}}"> @lang('global.products.title')</a></li>
        <li class="active">@lang('global.app_create')</li>
      </ol>    
@stop

@section('content')
    {!! Form::open(['method' => 'POST','files' => true, 'route' => ['products.importfile'],'class' => 'form-horizontal']) !!}

<div class="row">

<div class="col-xs-12">

    <div class="panel panel-default">
        
        <div class="panel-heading">
            Import Data Produk
        </div>
        @if (count($errors) > 0)
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
        <div class="panel-body table-responsive">

                <div class="form-group">
                    {!! Form::label('file', 'Import *', ['class' => 'col-sm-2 control-label']) !!}
                    <div class="col-sm-10">
                    {!! Form::file('file', old('file'), ['class' => 'form-control', 'placeholder' => '', 'required' => '']) !!}
                    </div>
                    <p class="help-block"></p>
                    @if($errors->has('file'))
                        <p class="help-block">
                            {{ $errors->first('file') }}
                        </p>
                    @endif
                </div>                
                        
            <div class="form-group">
                  {!! Form::label('is_active', '&nbsp;', ['class' => 'col-sm-2 control-label']) !!}
                  <div class="col-sm-10">
                  <div class="btn-group pull-left">
                  <a href="{{URL('products')}}" class="btn btn-primary"><i class="fa fa-chevron-left fa-fw"></i> Back</a>
                  <button type="submit" class="btn btn-success" id="btnSubmit" style="margin-left: 5px;">
                  <i class="fa fa-check fa-fw"></i> Import</button>
                  </div>
                  </div>
                </div>

            </div>   
                
            
        
        <div class="panel-footer"> 
        <p>&nbsp;</p>
            
        </div>

    </div>

    </div>
</div>

{!! Form::close() !!}

@stop

@push('javascripts')

<script type="text/javascript">

    $( document ).on("click change paste keyup", ".calcEvent", function() {
        //alert('test');
        calcTotals();
    });

    function calcTotals(){

        var harga_beli    = parseInt($("[name='harga_beli_satuan']").val());
        var pct     = parseFloat($("[name='pct_harga']").val()) > 0 ? parseFloat($("[name='pct_harga']").val()) : 0;
        
        var pct_amount    = (pct/100) * harga_beli;
        var harga_jual    = harga_beli + pct_amount;

        //total           += parseFloat(subTotal+totalTax-discount_amount);
        //amountDue       += parseFloat(subTotal+totalTax-discount_amount-paid);
        //alert(harga_beli+'  '+pct+'  '+pct_amount+'  '+harga_jual);
        $('#harga_jual_satuan').val( harga_jual);
        //$( '#taxTotal' ).text( totalTax.toFixed(2) );
        //$( '#grandTotal' ).text( total.toFixed(2) );
        //$( '#amountDue' ).text( amountDue.toFixed(2) );
    }
</script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" type="text/css"/>


<script type="text/javascript">
    $(document).ready(function() {
        $('#multiselect').multiselect({
            //buttonWidth: '100%'
        });
    });

    $('#tambah-settingan').on('click', function() {
        $('#content-credit').append(`
        <div class="row-content">
            <div class="col-sm-3">
                <input type="number" class="form-control" name="lama_angsuran[]" id="lama_angsuran" min="1" max="36" placeholder="Lama Bulan" required>
            </div>
            <div class="col-sm-7">
                <input type="number" class="form-control" name="nominal_angsuran[]" id="nominal_angsuran" placeholder="Nominal Angsuran" required>
            </div>
            <div class="col-sm-1">
                <button type="button" class="btn btn-danger hapus-settingan"><i class="fa fa-times"></i></button>
            </div>
            <br><br>
        </div>
        `)
    })

    $(document).on('click', '.hapus-settingan', function () {
        $(this).parent().parent().remove()
    })
</script>

<!--
<script type="text/javascript">    
// Material Select Initialization
$(document).ready(function() {
    $('.mdb-select').material_select();
});
            
</script>
-->

<!--
<style type="text/css">
    .multiselect-container {
        width: 100% !important;
    }
</style>
-->
@endpush


