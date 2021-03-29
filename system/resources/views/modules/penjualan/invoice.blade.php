<!DOCTYPE html>
<html>
<head>
	<!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'ALFARIS') }} | POS</title>

    <!-- Bootstrap -->
    <link href="{{ asset('bower_components/gentelella/vendors/bootstrap/dist/css/bootstrap.min.css') }}" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="{{ asset('bower_components/gentelella/vendors/font-awesome/css/font-awesome.min.css') }}" rel="stylesheet">
    <style type="text/css">
body {
    background-color: #ecf0f5;
    font-family: "Lato",Helvetica,Arial,sans-serif;
    font-size: 14px;
    font-weight: 500;
}
body.login-page:after {
    content: "";
    display: block;
    position: absolute;
    top: 0;
    left: 0;
    background: url(../img/bg.jpg) repeat;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
    width: 100%;
    height: 100%;
    opacity: 0.9;
    z-index: -1;
}
.sidebar-menu>li>a {
    font-weight: 100;
}
.wrapper{
    background: #2e3e4e !important;
}
.main-header .logo {
    background: #38354a !important;
    position: fixed;
}
.main-header .navbar {
    background-color: #007196 !important;
}
aside.main-sidebar{
    background: #2e2b3c !important;
}
.skin-blue .sidebar-menu>li>a:hover, .skin-blue .sidebar-menu>li.active>a {
    color: #fff;
    border-left: 5px solid #007196;
    background-color: #007196 !important;
}
.skin-blue .sidebar-menu>li>a {
    border-left: 5px solid transparent;
    padding: 8px;
}
.sidebar-menu>li>a>.fa {
    font-size: 13px;
    width: 30px;
    height: 30px;
    border-radius: 50%;
    line-height: 30px;
    margin-right: 7px;
    color: #FFFFFF;
    text-align: center;
    background: #38354a;
}
.content-header {
    font-size: 15px;
    color: #000;
    font-weight: 400;
    padding-bottom: 15px;
    border-bottom: 1px solid #d2d2d2;
    margin-bottom: 20px;
    margin-top: 50px;
    background: #ffffff !important;
    padding-left: 25px;
    box-shadow: 0 1px 1px rgba(0,0,0,.16),0 3px 6px rgba(0,0,0,.23);
}
.content-wrapper h1 {
   color:#444;
}
.modal-header{
    background-color: #007196 !important;
    color:#ffffff;
    border-bottom: 0;
    min-height: 20px;
    padding: 15px;
}
.modal-header h5{
    color:#fff;
}
button.close{
    color: #ffffff;
}
.main-header li.user-header{
    background-color: #007196 !important;
}
.item-table-header{
    background: #2e3e4e;
    color: #fff;
}
.listthumb{
    margin-bottom: 0px;
}

.spinner {
    position: relative
}
.spinner:after {
    position: absolute;
    top: 0;
    left: 0;
    content: '';
    width: 100%;
    height: 100%;
    background: rgba(255,255,255,0.8) url(../img/cubes_loader.gif) no-repeat 50% 50%;
    visibility: visible;
    z-index: 5000;
}

.form-control{
    border-radius: 0;
}
label{
    font-weight: 700;
}
textarea{
    resize: none;
}
.table tbody>tr>td{
    vertical-align: middle;
}
.sidebar h4 {
    font-size: 15px;
    font-weight: 600;
    letter-spacing: 1px;
    color:#ffffff;
    margin-left: 20px;
}
.login-logo {
    font-size: 20px;
    text-align: center;
    margin-bottom: 0;
    background: #007196;
    padding: 25px;
    color: #FFFFFF;
}
.panel-footer {
    padding: 25px 25px !important;
    border-top: none !important;
    background: #007196 !important;
}
.panel-footer a{
    color:#fff;
}
.invoice {
    padding: 15px 9px 80px;
    z-index: 2;
    color: #555;
    max-width: 1000px;
    overflow: hidden;
    min-height: 900px;
    box-shadow: 2px 2px 2px 2px rgba(0,0,0,0.1);
}
.invoice table tbody>tr>td .form-group{
    margin-bottom: 0;
}
#taxTotal, #grandTotal, #subTotal, .currencySymbol,#amountDue{
    font-weight: 700;
}
.amount_due{
    font-size: 20px;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
input[type="number"] {
    -moz-appearance: textfield;
    padding-right: 0.2em;
}
.chosen-container {
    width: 100% !important;
}
.invoice_title{
    color: #2e3e4e;
    font-weight: bold;
}
hr.separator{
    border-color:  #2e3e4e;
    margin-top: 10px;
    margin-bottom: 10px;
}
tbody#items > tr > td{
    border: 3px solid #fff !important;
    vertical-align: middle;
}
#items{
    background-color: #f1f1f1;
}

.invoice_status_cancelled
{
    font-size : 25px;
    text-align : center;
    color: #cc0000;
    border: 1px solid #cc0000;
}
.invoice_status_paid
{
    font-size : 30px;
    text-align : center;
    color: #82b440;
    border: 1px solid #82b440;
}
.dropdown-menu>li>a {
    font-weight: 400;
    font-size: 12px;
    letter-spacing: 0px;
    line-height: 23px;
}
.navbar-default .dropdown-menu>li>a:hover, .navbar-default .dropdown-menu>.active>a, .navbar-default .dropdown-menu>.active>a:hover {
    background: rgba(0,0,0,0.1);
    color: #f6f6f6;
}
.dropdown-menu .divider {
    height: 1px;
    margin: 0;
    overflow: hidden;
}
.dropdown ul.dropdown-menu {
    border-radius:4px;
    box-shadow:none;
    margin-top:15px;
}
.dropdown ul.dropdown-menu:before {
    content: "";
    border-bottom: 10px solid #007196;
    border-right: 10px solid transparent;
    border-left: 10px solid transparent;
    position: absolute;
    top: -10px;
    right: 0px;
    z-index: 10;
}
.dropdown ul.dropdown-menu:after {
    content: "";
    border-bottom: 12px solid #007196;
    border-right: 12px solid transparent;
    border-left: 12px solid transparent;
    position: absolute;
    top: -12px;
    right: 0;
    z-index: 9;
}

.navbar-default .dropdown-menu {
    background-color: #007196;
}
.language-img {
    margin-right: 5px;
    margin-top: -2px;
}
.input-file { position: relative; } /* Remove margin, it is just for stackoverflow viewing */
.input-file .input-group-addon { border: 0px; padding: 0px; }
.input-file .input-group-addon .btn { border-radius: 0 4px 4px 0 }
.input-file .input-group-addon input { cursor: pointer; position:absolute; width: 100%;height:35px; z-index:2;top:0;right:0;filter: alpha(opacity=0);-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";opacity:0; background-color:transparent; color:transparent; }
.scrollable {
    overflow-x: hidden;
    overflow-y: auto;
}
.line-legend li > span, .pie-legend li span {
    display: inline-block;
    height: 3px;
    width: 20px;
    margin-right: 5px;
    position: relative;
    top: -3px;
}
.line-legend li, .pie-legend li {
    list-style: none;
    list-style-type: none;
    font-size: 14px;
    float: left;
    margin-right: 20px;
    line-height: 1.6em;
}
.dashboard_stats{
    font-size: 14px;
}
.info-box i {
    font-size: 2.4em;
    display: block;
    float: left;
    margin-right: 15px;
    width: 60px;
    height: 60px;
    line-height: 60px;
    text-align: center;
    border-radius: 50%;
    background-clip: padding-box;
    color: #fff;
}
.info-box {
    padding: 20px;
    background: #FFFFFF;
    box-shadow: 1px 1px 2px 0 #CCCCCC;
    margin-bottom: 16px;
    border-radius: 3px;
    background-clip: padding-box;
}
.info-box .info-box-text {
    display: block;
    font-size: 1.2em;
    font-weight: 300;
    text-align: right;
}
.info-box .info-box-number {
    font-size: 2.1em;
    font-weight: 600;
    margin-top: -5px;
    display: block;
    text-align: right;
}
.user-footer a {
    color: #0079a1 !important;;
    background: transparent !important;
}
div.table-responsive>div.dataTables_wrapper>div.row {
    margin: 0;
}
.btn-sm {
    padding: 5px 10px;
}
.dataTables_processing {
    position: absolute;
    top: 50%;
    left: 50%;
    width: 250px;
    height: 80px;
    margin-left: -125px;
    margin-top: -15px;
    padding: 15px 0 30px 0;
    border: 1px solid #ddd;
    text-align: center;
    color: #444;
    font-size: 14px;
    background: url(../img/loading_bar.gif) no-repeat center 38px #fff;
    box-shadow: 2px 2px 5px #444;
    -moz-box-shadow: 2px 2px 5px #444;
    -webkit-box-shadow: 2px 2px 5px #444;
    z-index: 9999;
}

.divide {
	width: 100%;
	margin: 0 auto;
}

</style>

</head>
<body>
	<div><button onclick="return printContent('printarea')">Print</button></div>



	<div id="printarea">

	<div id="container"

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="col-md-12 content-header" >
	    <h1><i class="fa fa-quote-left"></i> Faktur Penjualan</h1>
	</div>
	<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">

                    </div>
                    <div class="row">
                        <div class="invoice">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="panel-body">
                                    <img src="http://ci.elantsys.com/assets/img/ihqsfjmm5akjttbnufnhouq7j5z5ejskqunuq5kkv9dkndrqsb.png" alt="logo" width="50%"/>
                                    </div>
                                </div>
                                <div class="col-md-9 text-right">
                                    <div class="panel-body" style="font-size: 16px;font-weight: bold;padding:0">
                                        <div class="col-xs-12 text-right"> <h1 style="margin:0">Faktur Penjualan</h1></div>
                                        <div class="col-xs-9 text-right invoice_title">No Faktur</div>
                                        <div class="col-xs-3 text-right">{{ $penjualan->no_faktur }}</div>
                                        <div class="col-xs-9 text-right invoice_title">Tanggal Faktur</div>
                                        <div class="col-xs-3 text-right">{{ $penjualan->tanggal_faktur }}</div>
                                        <div class="col-xs-9 text-right invoice_title">Due Date</div>
                                        <div class="col-xs-3 text-right">{{ $penjualan->no_faktur }}</div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="panel-body">
                                        <h4 class="invoice_title">Informasi Kami</h4>
                                        <hr class="separator"/>
                                        <h4>Marwah Fashion</h4>
                                        ---------------<br/>
                                        ---------------,<br/>
                                        ---------------<br/>
                                        ---------------<br/>
                                        ---------------
                                        </div>
                                </div>
                                <div class="col-xs-6">
                                        <div class="panel-body">
                                            <h4 class="invoice_title">Kepada Yth. </h4><hr class="separator"/>
                                            <h4>{{ $penjualan->nama_kontak }}</h4>
                                            -------------, ---<br/>
                                            -------------, --,<br/>
                                            ----------<br/>
                                            Phone: {{$penjualan->kontak}}<br/>
                                            mail: -.
                                        </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                            <table class="table">
                                <thead style="margin-bottom:30px;background: #2e3e4e;color: #fff;">
                                <tr>
                                    <th style="width:50%">Produk</th>
                                    <th style="width:10%" class="text-center">Qty</th>
                                    <th style="width:15%" class="text-right">Harga</th>
                                    <th style="width:15%" class="text-right">Sub Total</th>
                                    <th style="width:10%" class="text-center">Diskon</th>
                                    <th style="width:15%" class="text-right">Total</th>
                                </tr>
                                </thead>
                                <tbody id="items">
                                    @foreach($items as $item)
                                    <tr>
	                                    <td><b>{{ $item->nama_produk }}</b><br/>{{ $item->uom_id }}</td>
	                                    <td class="text-center">{{ $item->qty_terima }}</td>
	                                    <td class="text-right">{{ number_format($item->harga_jual,2) }}</td>
	                                    <td class="text-right">{{ number_format(($item->qty_terima*$item->harga_jual),2) }}</td>
	                                    <td class="text-center">{{ $item->diskon }} %</td>
	                                    <td class="text-right">{{ number_format((($item->qty_terima*$item->harga_jual)-(($item->qty_terima*$item->harga_jual)*($item->diskon/100))),2) }}</td>
                                	   </tr>
                                	   @endforeach
                                </tbody>
                            </table>
                            </div>
                            <div class="col-md-6" style="padding: 7% 12% 0 15%; text-transform: uppercase">
                                    <div class="invoice_status_cancelled">
                                        Unpaid
                                    </div>
                            </div>

                            <div class="col-md-6">
                                <div class="table-responsive">
                                    <table class="table"><tbody>
                                        <tr>
                                            <th style="width:50%">Sub Total</th>
                                            <td class="text-right">
                                                <span id="subTotal">{{ number_format($nett->nett,2) }}</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Pajak</th>
                                            <td class="text-right">
                                                <span id="taxTotal">0.00</span>
                                            </td>
                                        </tr>
                                                                                <tr>
                                            <th>Total</th>
                                            <td class="text-right">
                                                <span id="grandTotal">{{ number_format($nett->nett,2) }}</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Pembayaran</th>
                                            <td class="text-right">
                                                <span id="grandTotal">{{ number_format($penjualan->uang_muka,2) }}</span>
                                            </td>
                                        </tr>
                                        <tr class="amount_due">
                                            <th>Sisa Utang:</th>
                                            <td class="text-right">
                                                <?php
                                                	$tot = $nett->nett - $penjualan->uang_muka;
                                                ?>
                                                <span class="currencySymbol" style="display: inline-block;">Rp. </span>
                                                <span id="amountDue">{{ number_format($tot,2) }}</span>
                                            </td>
                                        </tr>
                                        </tbody></table>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <h4 class="invoice_title">Terms</h4><hr class="separator"/>
                                    <div>-<br></div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="cleafix"></div>
    </div>
</section>
</div><!-- /.content-wrapper -->


</div>
</div>

<script type="text/javascript">

	function printContent(el){
		var restorepage = document.body.innerHTML;
		var printcontent = document.getElementById(el).innerHMTL;
		document.body.innerHTML = printcontent;
		window.print();
		document.body.innerHTML = restorepage;
		window.close();
	}

</script>

</body>





<!-- Bootstrap -->
<script src="{{ asset('bower_components/gentelella/vendors/bootstrap/dist/js/bootstrap.min.js') }}"></script>
<!-- FastClick -->
<script src="{{ asset('bower_components/gentelella/vendors/fastclick/lib/fastclick.js') }}"></script>

<script type="text/javascript">
/*--This JavaScript method for Print command--*/
    function PrintDoc() {
        var toPrint = document.getElementById('printarea');
        var popupWin = window.open('', '_blank', 'width=350,height=150,location=no,left=200px');
        popupWin.document.open();
        popupWin.document.write('<html><title>::Preview::</title><link rel="stylesheet" type="text/css" href="print.css" /></head><body onload="window.print()">')
        popupWin.document.write(toPrint.innerHTML);
        popupWin.document.write('</html>');
        popupWin.document.close();
    }
/*--This JavaScript method for Print Preview command--*/
    function PrintPreview() {
        var toPrint = document.getElementById('printarea');
        var popupWin = window.open('', '_blank', 'width=350,height=150,location=no,left=200px');
        popupWin.document.open();
        popupWin.document.write('<html><title>::Print Preview::</title><link rel="stylesheet" type="text/css" href="Print.css" media="screen"/></head><body">')
        popupWin.document.write(toPrint.innerHTML);
        popupWin.document.write('</html>');
        popupWin.document.close();
    }
</script>

</html>
