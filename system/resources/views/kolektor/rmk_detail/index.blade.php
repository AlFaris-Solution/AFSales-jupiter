@inject('request', 'Illuminate\Http\Request')
@extends('layouts.app')

@section('content-header')
      <h1>
        @lang('global.so.title')
        <small>List</small>
      </h1>

      <ol class="breadcrumb">
        <li><a href="{{ url('/') }}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">@lang('global.so.title')</li>
      </ol>    
@stop

@push('css')
    <style>
        .min-top {
            display: block;
            margin-top: -2.5em;
        }
        .mt-1 {
            margin-top: 1em !important;
        }
        .text-center {
            text-align: center;
        }
        .border-2 {
            border: 2px solid #000!important;
        }
    </style>
@endpush

@section('content')
<div class="row">
    <div class="col-sm-6">
        <h3>New Collection 27 Mei - 26 Juni 2020</h3>
        <h5>Cabang: Majalengka</h5>
    </div>
    <div class="col-sm-6">
        <form action="?" class="form-inline" style="float: right; margin-right: -1em; margin-top: 1.5em;">
            <input type="text" class="form-control datepicker" id="start_date" name="start_date" value="{{ request('start_date') }}" required>
            <input type="text" class="form-control datepicker" id="end_date" name="end_date" value="{{ request('end_date') }}" required>
            <button class="btn btn-secondary" style="margin-top: 5px;">Filter</button>
        </form>
    </div>
</div>
<div class="row">
    <div class="col-sm-12 mt-1" style="min-height: 756px;">
        <table class="table table-bordered" style="background: #fff;">
            <thead>
                <tr>
                    <th colspan="3" class="text-center">RMK KOMPOR</th>
                    <th colspan="24" class="text-center">DATA TAGIHAN</th>
                </tr>
                <tr>
                    <th rowspan="2" class="text-center">TGL</th>
                    <th colspan="2" class="text-center">LHI</th>
                    <th colspan="3" class="text-center">TAGIHAN 1</th>
                    <th colspan="3" class="text-center">TAGIHAN 2</th>
                    <th colspan="3" class="text-center">TAGIHAN 3</th>
                    <th colspan="3" class="text-center">TAGIHAN 4</th>
                    <th colspan="3" class="text-center">TAGIHAN 5</th>
                    <th colspan="3" class="text-center">TAGIHAN 6</th>
                    <th colspan="3" class="text-center">TAGIHAN 7</th>
                    <th colspan="3" class="text-center">TAGIHAN 8</th>
                </tr>
                <tr class="column">
                    <th>KWT</th>
                    <th>TOTAL TAGIHAN</th>
                    <th>Tertagih</th>
                    <th>Tidak Tertagih</th>
                    <th>Tgl Trf</th>
                    <th>Tertagih</th>
                    <th>Tidak Tertagih</th>
                    <th>Tgl Trf</th>
                    <th>Tertagih</th>
                    <th>Tidak Tertagih</th>
                    <th>Tgl Trf</th>
                    <th>Tertagih</th>
                    <th>Tidak Tertagih</th>
                    <th>Tgl Trf</th>
                    <th>Tertagih</th>
                    <th>Tidak Tertagih</th>
                    <th>Tgl Trf</th>
                    <th>Tertagih</th>
                    <th>Tidak Tertagih</th>
                    <th>Tgl Trf</th>
                    <th>Tertagih</th>
                    <th>Tidak Tertagih</th>
                    <th>Tgl Trf</th>
                    <th>Tertagih</th>
                    <th>Tidak Tertagih</th>
                    <th>Tgl Trf</th>
                </tr>
            </thead>
            <tbody>
                @for ($i = 0; $i < 5; $i++)
                <tr>
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                    <td>5</td>
                    <td>6</td>
                    <td>7</td>
                    <td>8</td>
                    <td>9</td>
                    <td>10</td>
                    <td>11</td>
                    <td>12</td>
                    <td>13</td>
                    <td>14</td>
                    <td>15</td>
                    <td>16</td>
                    <td>17</td>
                    <td>18</td>
                    <td>19</td>
                    <td>20</td>
                    <td>21</td>
                    <td>22</td>
                    <td>23</td>
                    <td>24</td>
                    <td>25</td>
                    <td>26</td>
                    <td>27</td>
                </tr>
                @endfor
            </tbody>
            <tfoot>
                <tr>
                    <th></th>
                    <th>KWT</th>
                    <th>TOTAL TAGIHAN</th>
                    <th>Tertagih</th>
                    <th>Tidak Tertagih</th>
                    <th>Tgl Trf</th>
                    <th>Tertagih</th>
                    <th>Tidak Tertagih</th>
                    <th>Tgl Trf</th>
                    <th>Tertagih</th>
                    <th>Tidak Tertagih</th>
                    <th>Tgl Trf</th>
                    <th>Tertagih</th>
                    <th>Tidak Tertagih</th>
                    <th>Tgl Trf</th>
                    <th>Tertagih</th>
                    <th>Tidak Tertagih</th>
                    <th>Tgl Trf</th>
                    <th>Tertagih</th>
                    <th>Tidak Tertagih</th>
                    <th>Tgl Trf</th>
                    <th>Tertagih</th>
                    <th>Tidak Tertagih</th>
                    <th>Tgl Trf</th>
                    <th>Tertagih</th>
                    <th>Tidak Tertagih</th>
                    <th>Tgl Trf</th>
                </tr>
            </tfoot>
        </table>
    </div>
</div>
@stop

@push('javascripts')
<!-- DataTables -->
<script src="{{asset('/bower_components/AdminLTE/plugins/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('/bower_components/AdminLTE/plugins/datatables/dataTables.bootstrap.min.js')}}"></script>    
<script src="{{asset('/bower_components/sweetalert/docs/assets/sweetalert/sweetalert.min.js')}}"></script>

<script>
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy'
    })
    $('.kolektor').addClass('active')
    $('.kolektor .nav').css('display', 'block')

    let th = $('.column th').length;
    if (th >= 20) {
        $('.table').css('width', '2000px')
        $('.row').css('overflow-x', 'auto')
    }
    if (th >= 25) {
        $('.table').css('width', '2500px')
        $('.row').css('overflow-x', 'auto')
    }
    if (th >= 30) {
        $('.table').css('width', '3000px')
        $('.row').css('overflow-x', 'auto')
    }
</script>

@endpush

{{-- @inject('request', 'Illuminate\Http\Request')
@extends('layouts.app')

@section('content-header')
      <h1>
        @lang('global.so.title')
        <small>List</small>
      </h1>

      <ol class="breadcrumb">
        <li><a href="{{url('/')}}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">@lang('global.so.title')</li>
      </ol>    
@stop

@push('css')
    <style>
        .min-top {
            display: block;
            margin-top: -2.5em;
        }

        .mt-1 {
            margin-top: 1em !important;
        }
    </style>
@endpush

@section('content')   
<div class="row hidden">
    <div class="col-sm-6 mt-1">
        <form action="?" class="form-inline">
            <input type="text" class="form-control datepicker" id="start_date" name="start_date" value="{{ request('start_date') }}" required>
            <input type="text" class="form-control datepicker" id="end_date" name="end_date" value="{{ request('end_date') }}" required>
            <button class="btn btn-secondary" style="margin-top: 5px;">Filter</button>
        </form>

        <small>Pastikan menekan tombol Filter, untuk melihat perubahan.</small>
    </div>
    
    <div class="col-sm-6 mt-1">
        <form action="{{ route('so.excel') }}" class="form-inline" method="post">
            {{ csrf_field() }}
            <input type="hidden" name="start_date" value="{{ request('start_date') }}">
            <input type="hidden" name="end_date" value="{{ request('end_date') }}">
            
            <div class="col-md-9"></div>
            <select name="ex" id="ex" class="form-control" style="margin-top: 5px;">
                <option value="xlsx" selected>xlsx</option>
                <option value="xls">xls</option>
                <option value="csv">csv</option>
            </select>
            <button class="btn btn-success pull-right" style="margin-top: 5px;"><i class="fas fa-file-excel"></i>Export</button>
        </form>
    </div>
</div>
<div class="row">
    <div class="col-sm-12 mt-1">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h5 class="panel-title">
                    Daftar RMK
                </h5>
            </div>

            <div class="panel-body table-responsive">
                <table class="table table-bordered table-striped">
                    <thead>
                        <th width="3%">#</th>
                        <th>Tgl</th>
                        <th>KWT</th>
                        <th>Total Tagihan</th>
                        <th width="10%"><i class="fa fa-gear"></i></th>
                    </thead>
                    <tbody>
                        @foreach ($rmk as $key => $list)
                            <tr>
                                <td>{{ $key+1 }}</td>
                                <td>{{ $list->tgl_lhi }}</td>
                                <td>{{ $list->lhi_details_count }}</td>
                                <td>{{ $list->lhiDetails->sum('nominal_tagihan') }}</td>
                                <td>
                                    <form action="{{ route('rmk.destroy', $list->id) }}" method="post">
                                        <a href="{{ route('rmk_detail.index', $list->code) }}" class="btn btn-default" title="Detail"><i class="fa fa-eye"></i></a>
                                        <a href="{{ route('rmk.edit', $list->id) }}" class="btn btn-warning"><i class="fa fa-pencil"></i></a>

                                        {{ csrf_field() }}
                                        <input type="hidden" name="_method" value="DELETE">
                                        <button class="btn btn-danger" onclick="return confirm('Yakin?')"><i class="fa fa-trash"></i></button>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@stop

@push('javascripts')
<!-- DataTables -->
<script src="{{asset('/bower_components/AdminLTE/plugins/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('/bower_components/AdminLTE/plugins/datatables/dataTables.bootstrap.min.js')}}"></script>    
<script src="{{asset('/bower_components/sweetalert/docs/assets/sweetalert/sweetalert.min.js')}}"></script>

<script>
    $('.table').DataTable()
    $('.datepicker').datepicker({
        format: 'dd/mm/yyyy'
    })
</script>

@endpush --}}