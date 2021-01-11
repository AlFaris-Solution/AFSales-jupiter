<div class="col-md-3 left_col" style="position: fixed; top: 0; bottom: 0;">
    <div class="left_col scroll-view" style=" overflow-y: auto;">
        <div class="navbar nav_title" style="border: 0;">
            <a href="{{ url('/') }}" class="site_title"><i class="fa fa-home"></i> <span style="margin-left: 1rem;">Jupiter Bike App</span></a>
        </div>
        <div class="clearfix"></div>
        
        <div class="profile clearfix">
            <div class="profile_pic">
                <img src="{{ asset('images/avatar') }}/{{ Auth::user()->photo }}" alt="{{ Auth::user()->name }}" class="img-circle profile_img">
            </div>
            <div class="profile_info">
                <span>Selamat Datang,</span>
                <h2>{{ Auth::user()->name }}</h2>
            </div>
        </div>
        <br />
        
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <h3>MENU UTAMA</h3>
                <ul class="nav side-menu">
                    <li><a href="{{ url('/') }}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
                    
                    <li class="transaksi">
                        <a><i class="fa fa-desktop"></i> Transaksi <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            @can('Menu Pembelian')
                            <li>
                                <a>Pembelian <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li class="sub_menu"><a href="{{ route('pembelian.index') }}">Faktur Pembelian / Penerimaan</a></li>
                                    <li class="sub_menu"><a href="{{ route('pembelian.hutang') }}">Daftar Hutang</a></li>
                                    <li class="sub_menu"><a href="{{ route('pembayaran.index') }}">Pembayaran Hutang</a></li>
                                </ul>
                            </li>
                            @endcan
                            @can('Menu Penjualan')
                            <li>
                                <a>Penjualan <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li class="sub_menu"><a href="{{ route('penjualan.index') }}"> Faktur / Transaksi Penjualan</a></li>
                                    <li class="sub_menu"><a href="{{ route('penjualan.piutang') }}"> Daftar Piutang</a></li>
                                    <li class="sub_menu"><a href="{{ route('piutang.index') }}"> Pembayaran Piutang</a></li>
                                </ul>
                            </li>
                            @endcan
                            @can('Menu Gudang')
                            <li>
                                <a>Gudang <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li class="sub_menu"><a href="{{ route('transfer.index') }}"> Transfer Barang Antar Gudang</a></li>
                                    <li class="sub_menu"><a href="{{ route('penyesuaian.index') }}"> Penyesuaian Stok</a></li>
                                    <li class="sub_menu"><a href="{{ route('histori-stok.index') }}"> Histori Stok</a>
                                </ul>
                            </li>
                            @endcan
                            @can('Menu Keuangan')
                            <li>
                                <a>Keuangan <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li class="sub_menu"><a href="{{ route('kas.pengeluaran.index') }}"> Pengeluaran Kas</a></li>
                                    <li class="sub_menu"><a href="{{ route('kas.penerimaan.index') }}"> Penerimaan Kas</a></li>
                                    <li class="sub_menu"><a href="{{ route('kas.transfer.index') }}"> Transfer Kas</a></li>
                                    <li class="hidden">
                                        <a>Payrol<span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="#"> Absensi</a></li>
                                            <li><a href="#"> Penggajian</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            @endcan              
                        </ul>
                    </li>

                    @can('Menu Laporan')
                    <li class="hidden">
                        <a><i class="fa fa-bar-chart-o"></i> Laporan <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="tables.html">Tables</a></li>
                            <li><a href="tables_dynamic.html">Table Dynamic</a></li>
                        </ul>
                    </li>
                    @endcan

                    @can('Menu Master')
                    <li>
                        <a><i class="fa fa-th"></i> Master Data <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            @can('Lihat UOM')
                            <li><a href="{{ url('uoms') }}"> Data Satuan</a></li>
                            @endcan
                            @can('Lihat Kategori')
                            <li><a href="{{ url('categorys') }}"> Data Kategori</a></li>
                            @endcan
                            @can('Lihat Produk')
                            <li><a href="{{ url('products') }}"> Data Produk</a></li>
                            @endcan
                            @can('Lihat Kontak')
                            <li><a href="{{ url('kontak') }}"> Data Kontak</a></li>
                            @endcan
                            <!-- New -->
                            <li><a href="{{ url('kurir') }}"> Data Kurir</a></li>
                            @can('Lihat Akun')
                            <li><a href="{{ url('akun') }}"> Data Akun</a></li>
                            @endcan
                            @can('Lihat Departemen')
                            <li><a href="{{ url('cabang') }}"> Data Cabang</a></li>
                            @endcan
                            @can('Lihat Gudang')
                            <li><a href="{{ url('gudang') }}"> Data Gudang</a></li>
                            @endcan
                            <!-- New -->
                            <li><a href="{{ url('hargajuals') }}"> Setup Harga Jual Pelanggan</a></li>
                            <li><a href="{{ url('hargabeli') }}"> Harga Beli / HNA</a></li>
                        </ul>
                    </li>
                    @endcan
                    
                    @can('Menu Pengaturan')
                    <li>
                        <a><i class="fa fa-cogs"></i> Sistem Konfigurasi <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            @can('manage_permission')
                            <li><a href="{{ url('admin/permissions') }}"> Permission</a></li>
                            @endcan
                            <li><a href="{{ url('admin/roles') }}"> Roles</a></li>
                            <li><a href="{{ url('admin/users') }}"> Data Pengguna (User)</a></li>
                            <li><a href="{{ url('info/toko') }}"> Setting Profil Perusahaan</a></li>
                        </ul>
                    </li>
                    @endcan
                </ul>
            </div>
        </div>

        <div class="sidebar-footer hidden-small">
            <a style="padding: 8px 0" data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            </a>
            <a style="padding: 8px 0" data-toggle="tooltip" data-placement="top" title="FullScreen" onclick="openFullscreen()">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
            </a>
            <a style="padding: 8px 0" data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
            </a>
            <a style="padding: 8px 0" data-toggle="tooltip" data-placement="top" title="Logout" href="javascript:void(0)"
                onclick="document.getElementById('logout-form2').submit()">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
            </a>
            <form id="logout-form2" action="{{ route('auth.logout') }}" method="POST" class="hidden">
                {{ csrf_field() }}
            </form>
        </div>
    </div>
</div>