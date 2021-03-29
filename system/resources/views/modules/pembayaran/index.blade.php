@inject('request', 'Illuminate\Http\Request')
@extends('layouts.app')

@section('content')
<div class="row">
    <div class="col-xs-12">
        <p>
            <div class="btn-group">
                <a href="{{ route('pembayaran.create') }}" class="btn btn-info">
                <i class="fa fa-plus fa-fw"></i> Baru</a>
            </div>
        </p>
        
        <div class="panel panel-default">
            <div class="panel-heading">
                @lang('global.app_list')
            </div>
            <div class="panel-body table-responsive">
                <div class="table-responsive">
                    <table id="list" class="table table-bordered table-striped table-condensed">
                        <thead>
                            <th class="text-center" width="10%">Tanggal</th>
                            <th class="text-center" width="12%">No. Reff</th>
                            <th class="text-center" width="30%">Nama Pemasok</th>
                            <th class="text-center" width="13%">Nilai</th>
                            <th class="text-center" width="13%">Action</th>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@include('partials.footervar')
@stop

@push('javascripts')
    <script src="{{ asset('/js/pembelian.js') }}"></script>
    <script>
        $(document).ready(function(){
            datatablesPembayaran.init();
        });
    
        function ConfirmDelete()
        {
            var x = confirm("Anda yakin akan menghapus data ini ?");
            if (x)
                return true;
            else
                return false;
            };

        function ConfirmEdit()
        {
            var x = confirm("Anda yakin akan merubah data ini ?");
            if (x)
                return true;
            else
                return false;
            }; 
    </script>
@endpush