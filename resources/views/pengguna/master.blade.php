<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Vendor Food &mdash; @yield('title')</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        @include('pengguna.elemen.static_css')
        @yield('custom_css')
        <style>
        .site-navbar .site-navigation .site-menu > li > a.btn:hover {
            color: #fff;
        }
        </style>
    </head>
    <body>
        <div class="site-wrap">
            <header class="site-navbar" role="banner">
                <div class="site-navbar-top">
                    <div class="container">
                        <div class="row align-items-center">

                            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
                                {{ Form::open(['route' => 'produk', 'class' => 'site-block-top-search', 'method' => 'GET']) }}
                                    <span class="icon icon-search2"></span>
                                    {{ Form::text('search', null, ['class' => 'form-control border-0', 'placeholder' => 'Cari Barang...']) }}
                                    @if(!empty($_GET['kategori']))
                                    {{ Form::hidden('kategori', $_GET['kategori']) }}
                                    @endif
                                {{ Form::close() }}
                            </div>

                            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
                                <div class="site-logo">
                                    <a href="{{ route('beranda') }}" class="js-logo-clone">Vendor Food</a>
                                </div>
                            </div>

                            @if(session('email_pengguna'))
                            <div class="col-6 col-md-4 order-4 order-md-3 text-right">
                                <div class="site-top-icons">
                                    <ul>
                                        <li><a href="{{ route('info_akun') }}"><span class="icon icon-person" title="Detail Akun"></span></a></li>
                                        <li>
                                            <a href="{{ route('keranjang') }}" class="site-cart" title="Keranjang">
                                                <span class="icon icon-shopping_cart"></span>
                                                <span class="count" data="keranjang"></span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="{{ route('pembayaran') }}" class="site-cart" title="Pembayaran">
                                                <span class="icon icon-money"></span>
                                                <span class="count" data="pembayaran"></span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="{{ route('pesanan') }}" class="site-cart" title="Pesanan">
                                                <span class="icon icon-shopping-basket"></span>
                                                <span class="count" data="pesanan"></span>
                                            </a>
                                        </li>
                                        <li class="d-inline d-md-none ml-md-0">
                                            <a href="#" class="site-menu-toggle js-menu-toggle ml-2">
                                                <span class="icon-menu"></span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            @endif
                        </div>
                    </div>
                </div>
                @include('pengguna.elemen.navbar')
            </header>
            @yield('breadcrumb')
            @yield('content')
            @yield('modal')
            <footer class="site-footer border-top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 mb-5 mb-lg-0" id="kontak">
                            {{ Form::open(['route' => 'hubungi_kami']) }}
                            <div class="row">
                                <div class="col-md-12">
                                    <h3 class="footer-heading mb-4">Hubungi Kami</h3>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" name="nama" class="form-control" placeholder="Nama Pengguna">
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <input type="email" name="email" class="form-control" placeholder="Email Pengguna">
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-12">
                                    <div class="form-group">
                                        <input type="text" name="subject" class="form-control" placeholder="subject">
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-12">
                                    <div class="form-group">
                                        <input type="text" name="pesan" class="form-control" placeholder="Isi Pesan">
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <input type="submit" class="btn btn-primary" value="Kirim Pesan">
                                    </div>
                                </div>
                            </div>
                            {{ Form::close() }}
                        </div>
                    <div class="row pt-5 mt-5 text-center">
                        <div class="col-md-12">
                        </div>
                    </div>
                </div>
            </footer>
        </div>
        @include('pengguna.elemen.static_js')
        @yield('custom_js')
        <script>
            $(document).ready(function(){
                $.get('{{ route('get_kategori') }}').done(function(data){
                    var elemen = ''
                    var index  = 1
                    for(var values of data) {
                        var slug = values.replace(' ', '-').toLowerCase()
                        elemen += '<li><a href="{{ route('produk') }}?kategori='+slug+'">'+values+'</a></li>'
                    }
                    $('ul#kategori').html(elemen)
                })
                $.get('{{ route('data_counter') }}').done(function(data){
                    for(var key in data){
                        $('span[data="'+key+'"]').html(data[key])
                    }
                })
            })
        </script>
    </body>
</html>
