-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 04 Jan 2021 pada 15.12
-- Versi server: 10.3.27-MariaDB-cll-lve
-- Versi PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `intercup_grosir`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akuns`
--

CREATE TABLE `akuns` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_akun` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_akun` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_alias` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subklasifikasi_id` int(11) DEFAULT NULL,
  `kas_bank` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kurs` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departement_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `akuns`
--

INSERT INTO `akuns` (`id`, `kode_akun`, `nama_akun`, `nama_alias`, `subklasifikasi_id`, `kas_bank`, `is_active`, `kurs`, `departement_id`, `created_at`, `updated_at`) VALUES
(1, '110015021', 'Bank', 'kas_on_bank', 2, NULL, NULL, '$', '1', '2018-03-25 02:03:01', '2018-05-15 05:05:27'),
(2, '110099020', 'Kas', 'kas', 1, 'Y', NULL, 'IDR', '1', '2018-03-25 03:03:44', '2018-05-14 06:05:21'),
(4, '110099022', 'Cash On Hand', 'cash_on_hand', 1, 'Y', 'Y', 'IDR', '1', '2018-04-19 05:04:21', '2018-05-14 13:05:43'),
(5, '110011001', 'Piutang Dagang', 'piutang_dagang', 1, 'Y', NULL, 'IDR', NULL, '2018-05-14 13:05:10', '2018-05-14 06:05:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_kategori` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_kategori` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departement_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sifat_persediaan_disimpan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sifat_persediaan_dibeli` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sifat_persediaan_dijual` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sistem_persediaan_average_costing` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `akun_harga_pokok` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `akun_penjualan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `akun_persediaan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gambar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `kode_kategori`, `nama_kategori`, `departement_id`, `sifat_persediaan_disimpan`, `sifat_persediaan_dibeli`, `sifat_persediaan_dijual`, `sistem_persediaan_average_costing`, `akun_harga_pokok`, `akun_penjualan`, `akun_persediaan`, `gambar`, `created_at`, `updated_at`) VALUES
(17, 'K001', 'Mika', 'DEPT001', 'Y', 'Y', 'Y', 'Y', '4', '5', NULL, NULL, '2020-06-07 20:47:32', '2020-06-07 20:47:32'),
(18, 'K002', 'Cup', 'DEPT001', 'Y', 'Y', 'Y', 'Y', NULL, NULL, NULL, NULL, '2020-06-07 20:48:06', '2020-06-07 20:48:06'),
(19, 'K003', 'Sendok Plastik', 'DEPT001', 'Y', 'Y', 'Y', 'Y', NULL, NULL, NULL, NULL, '2020-06-07 20:48:26', '2020-06-11 04:24:11'),
(20, 'K004', 'Sterefoam', 'DEPT001', 'Y', 'Y', 'Y', 'Y', NULL, NULL, NULL, NULL, '2020-06-07 20:49:04', '2020-06-07 20:49:04'),
(21, 'K005', 'Dus', 'DEPT001', 'Y', 'Y', 'Y', 'Y', NULL, NULL, NULL, NULL, '2020-06-24 18:25:50', '2020-06-24 18:26:29'),
(22, 'K006', 'Tutup', 'DEPT001', 'Y', 'Y', 'Y', 'Y', NULL, NULL, NULL, NULL, '2020-06-24 18:27:06', '2020-06-24 18:27:06'),
(23, 'K007', 'Thinwall', 'DEPT001', 'Y', 'Y', 'Y', 'Y', NULL, NULL, NULL, NULL, '2020-06-25 23:20:07', '2020-06-25 23:20:07'),
(24, 'K008', 'GARPU', 'DEPT001', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-02 10:02:16', '2021-01-02 10:02:16'),
(25, 'K009', 'karet gelang', 'DEPT001', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-02 10:03:05', '2021-01-02 10:03:05'),
(26, 'k010', 'Handbag/Plastik', 'DEPT001', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-02 10:03:41', '2021-01-02 10:03:41'),
(27, 'K011', 'SEALER', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-02 12:29:08', '2021-01-02 12:29:08'),
(28, 'K012', 'tUSUK', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-02 12:29:56', '2021-01-02 12:29:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `departements`
--

CREATE TABLE `departements` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_departement` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_departement` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_departement` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bidang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catatan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `departements`
--

INSERT INTO `departements` (`id`, `kode_departement`, `nama_departement`, `sub_departement`, `manager`, `bidang`, `catatan`, `created_at`, `updated_at`) VALUES
(10, 'DEPT001', 'Intercup Pusat', NULL, 'Anggi Ramdhani', 'Owner', NULL, '2018-05-15 06:12:20', '2020-06-07 20:50:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gudangs`
--

CREATE TABLE `gudangs` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_gudang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_gudang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dimensi_container` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kota` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_pos` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `negara` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kategori_gudang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_container` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `gudangs`
--

INSERT INTO `gudangs` (`id`, `kode_gudang`, `nama_gudang`, `dimensi_container`, `alamat`, `kota`, `kode_pos`, `negara`, `keterangan`, `kategori_gudang`, `is_container`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'GD001', 'GUDANG UTAMA', '20', NULL, 'Majalengka', NULL, NULL, NULL, 'on', 'on', 'on', '2018-10-16 08:10:51', '2018-10-16 08:10:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hargabeli`
--

CREATE TABLE `hargabeli` (
  `id` int(11) NOT NULL,
  `kontak_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hargabeli_detail`
--

CREATE TABLE `hargabeli_detail` (
  `id` int(11) NOT NULL,
  `hargabeli_id` int(11) DEFAULT NULL,
  `kontak_id` int(11) DEFAULT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `kode_produk` varchar(191) DEFAULT NULL,
  `uom_id` varchar(191) DEFAULT NULL,
  `harga_beli_standar` double DEFAULT NULL,
  `harga_beli_khusus` double DEFAULT NULL,
  `harga` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hargajual`
--

CREATE TABLE `hargajual` (
  `id` int(11) NOT NULL,
  `harga_id` int(11) DEFAULT NULL,
  `kontak_id` int(11) DEFAULT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `kode_produk` varchar(191) DEFAULT NULL,
  `uom_id` varchar(191) DEFAULT NULL,
  `harga_jual_standar` double DEFAULT 0,
  `harga_jual_pelanggan` double DEFAULT 0,
  `harga` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hargajual`
--

INSERT INTO `hargajual` (`id`, `harga_id`, `kontak_id`, `produk_id`, `kode_produk`, `uom_id`, `harga_jual_standar`, `harga_jual_pelanggan`, `harga`, `created_at`, `updated_at`) VALUES
(126, 48, 78, 234, 'S0011', 'Dus', 300000, 300000, NULL, '2020-12-30 12:47:02', '2020-12-30 12:47:02'),
(127, 49, 176, 100, 'c011', 'Ball', 280000, 280000, NULL, '2021-01-04 14:44:37', '2021-01-04 01:01:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hargajual_hdr`
--

CREATE TABLE `hargajual_hdr` (
  `id` int(11) NOT NULL,
  `kontak_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hargajual_hdr`
--

INSERT INTO `hargajual_hdr` (`id`, `kontak_id`, `created_at`, `updated_at`) VALUES
(48, 78, '2020-12-30 11:47:02', '2020-12-30 11:47:02'),
(49, 176, '2021-01-04 13:44:37', '2021-01-04 13:44:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `harga_juals`
--

CREATE TABLE `harga_juals` (
  `id` int(10) UNSIGNED NOT NULL,
  `kontak_id` int(10) DEFAULT NULL,
  `kode_kontak` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_add` date NOT NULL,
  `produk` int(10) NOT NULL,
  `harga_jual_satuan` int(11) NOT NULL DEFAULT 0,
  `is_active` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `histori_stok`
--

CREATE TABLE `histori_stok` (
  `id` int(10) NOT NULL,
  `tgl_berubah` datetime NOT NULL,
  `id_produk` int(10) NOT NULL,
  `nama_produk` varchar(64) NOT NULL,
  `keterangan` varchar(191) NOT NULL,
  `no_so` int(10) DEFAULT NULL,
  `gudang_asal` int(10) NOT NULL,
  `masuk` int(10) NOT NULL DEFAULT 0,
  `keluar` int(10) NOT NULL DEFAULT 0,
  `stok_tersisa` int(10) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `histori_stok`
--

INSERT INTO `histori_stok` (`id`, `tgl_berubah`, `id_produk`, `nama_produk`, `keterangan`, `no_so`, `gudang_asal`, `masuk`, `keluar`, `stok_tersisa`, `created_at`, `updated_at`) VALUES
(11, '2020-09-22 15:30:31', 93, 'cup 12oz nat master', 'PENJUALAN', NULL, 1, 0, 0, 0, '2020-09-22 07:30:31', '2020-09-22 07:30:31'),
(12, '2020-09-22 15:30:58', 92, 'cup 10oz nat master', 'HAPUS PENJUALAN', NULL, 1, 0, 0, 0, '2020-09-22 07:30:58', '2020-09-22 07:30:58'),
(13, '2020-09-22 16:04:14', 93, 'cup 12oz nat master', 'PENJUALAN', NULL, 1, 0, 0, 0, '2020-09-22 08:04:14', '2020-09-22 08:04:14'),
(14, '2020-09-29 09:29:29', 92, 'cup 10oz nat master', 'HAPUS PENJUALAN', NULL, 1, 0, 0, 0, '2020-09-29 01:29:29', '2020-09-29 01:29:29'),
(15, '2020-09-29 09:30:22', 92, 'cup 10oz nat master', 'PENJUALAN', NULL, 1, 0, 0, 0, '2020-09-29 01:30:22', '2020-09-29 01:30:22'),
(16, '2020-10-02 08:24:52', 92, 'cup 10oz nat master', 'HAPUS PENJUALAN', NULL, 1, 0, 0, 0, '2020-10-02 00:24:52', '2020-10-02 00:24:52'),
(17, '2020-10-02 08:27:32', 92, 'cup 10oz nat master', 'PENJUALAN', NULL, 1, 0, 20, -20, '2020-10-02 00:27:32', '2020-10-02 00:27:32'),
(18, '2020-10-02 08:27:32', 127, 'Mika 2A NS', 'PENJUALAN', NULL, 1, 0, 20, -20, '2020-10-02 00:27:32', '2020-10-02 00:27:32'),
(19, '2020-10-02 08:28:09', 92, 'cup 10oz nat master', 'HAPUS PENJUALAN', NULL, 1, 20, 0, 0, '2020-10-02 00:28:09', '2020-10-02 00:28:09'),
(20, '2020-10-02 08:28:09', 92, 'cup 10oz nat master', 'HAPUS PENJUALAN', NULL, 1, 20, 0, 0, '2020-10-02 00:28:09', '2020-10-02 00:28:09'),
(21, '2020-10-02 12:40:52', 105, 'cup 10oz nat ascot', 'PENJUALAN', NULL, 1, 0, 0, 0, '2020-10-02 04:40:52', '2020-10-02 04:40:52'),
(22, '2020-10-02 12:42:44', 92, 'cup 10oz nat master', 'HAPUS PENJUALAN', NULL, 1, 0, 0, 0, '2020-10-02 04:42:44', '2020-10-02 04:42:44'),
(23, '2020-10-02 12:43:42', 105, 'cup 10oz nat ascot', 'PENJUALAN', NULL, 1, 0, 1, -1, '2020-10-02 04:43:42', '2020-10-02 04:43:42'),
(24, '2020-10-02 17:02:37', 92, 'cup 10oz nat master', 'HAPUS PENJUALAN', NULL, 1, 1, 0, 0, '2020-10-02 09:02:37', '2020-10-02 09:02:37'),
(25, '2020-10-02 17:03:29', 93, 'cup 12oz nat master', 'PENJUALAN', NULL, 1, 0, 1, -1, '2020-10-02 09:03:29', '2020-10-02 09:03:29'),
(26, '2020-10-03 09:52:14', 92, 'cup 10oz nat master', 'HAPUS PENJUALAN', NULL, 1, 1, 0, 0, '2020-10-03 01:52:14', '2020-10-03 01:52:14'),
(27, '2020-10-03 09:52:48', 107, 'cup 14oz nat ascot', 'PENJUALAN', NULL, 1, 0, 0, 0, '2020-10-03 01:52:48', '2020-10-03 01:52:48'),
(28, '2020-10-03 10:59:29', 92, 'cup 10oz nat master', 'HAPUS PENJUALAN', NULL, 1, 0, 0, 0, '2020-10-03 02:59:29', '2020-10-03 02:59:29'),
(29, '2020-10-14 15:23:21', 97, 'cup 10oz nat starglas', 'PENJUALAN', NULL, 1, 0, 1, -1, '2020-10-14 07:23:21', '2020-10-14 07:23:21'),
(30, '2020-10-14 15:23:21', 97, 'cup 10oz nat starglas', 'PENJUALAN', NULL, 1, 0, 1, -2, '2020-10-14 07:23:21', '2020-10-14 07:23:21'),
(31, '2020-10-27 16:22:39', 92, 'cup 10oz nat master', 'HAPUS PENJUALAN', NULL, 1, 1, 0, 0, '2020-10-27 08:22:39', '2020-10-27 08:22:39'),
(32, '2020-10-27 16:22:40', 92, 'cup 10oz nat master', 'HAPUS PENJUALAN', NULL, 1, 1, 0, 0, '2020-10-27 08:22:40', '2020-10-27 08:22:40'),
(33, '2020-10-27 16:24:03', 93, 'cup 12oz nat master', 'PENJUALAN', NULL, 1, 0, 1, -2, '2020-10-27 08:24:03', '2020-10-27 08:24:03'),
(34, '2020-12-12 13:19:31', 92, 'cup 10oz nat master', 'HAPUS PENJUALAN', NULL, 1, 1, 0, -1, '2020-12-12 05:19:31', '2020-12-12 05:19:31'),
(35, '2020-12-12 13:21:26', 97, 'cup 10oz nat starglas', 'PENJUALAN', NULL, 1, 0, 1, -2, '2020-12-12 05:21:26', '2020-12-12 05:21:26'),
(36, '2020-12-12 13:21:27', 92, 'cup 10oz nat master', 'PENJUALAN', NULL, 1, 0, 1, -2, '2020-12-12 05:21:27', '2020-12-12 05:21:27'),
(37, '2020-12-15 09:52:55', 92, 'cup 10oz nat master', 'HAPUS PENJUALAN', NULL, 1, 1, 0, -1, '2020-12-15 01:52:55', '2020-12-15 01:52:55'),
(38, '2020-12-15 09:52:55', 92, 'cup 10oz nat master', 'HAPUS PENJUALAN', NULL, 1, 1, 0, 0, '2020-12-15 01:52:55', '2020-12-15 01:52:55'),
(39, '2020-12-15 09:54:10', 101, 'cup 10oz nat dias', 'PENJUALAN', NULL, 1, 0, 1, -1, '2020-12-15 01:54:10', '2020-12-15 01:54:10'),
(40, '2020-12-15 09:54:11', 105, 'cup 10oz nat ascot', 'PENJUALAN', NULL, 1, 0, 1, -2, '2020-12-15 01:54:11', '2020-12-15 01:54:11'),
(41, '2020-12-22 18:14:58', 97, 'cup 10oz nat starglas', 'PENJUALAN', NULL, 1, 0, 1, -3, '2020-12-22 10:14:58', '2020-12-22 10:14:58'),
(42, '2020-12-22 18:14:58', 92, 'cup 10oz nat master', 'PENJUALAN', NULL, 1, 0, 1, -2, '2020-12-22 10:14:58', '2020-12-22 10:14:58'),
(43, '2020-12-30 10:51:17', 92, 'cup 10oz nat master', 'HAPUS PENJUALAN', NULL, 1, 1, 0, -2, '2020-12-30 02:51:17', '2020-12-30 02:51:17'),
(44, '2020-12-30 10:51:17', 92, 'cup 10oz nat master', 'HAPUS PENJUALAN', NULL, 1, 1, 0, -1, '2020-12-30 02:51:17', '2020-12-30 02:51:17'),
(45, '2020-12-30 10:51:21', 92, 'cup 10oz nat master', 'HAPUS PENJUALAN', NULL, 1, 1, 0, 0, '2020-12-30 02:51:21', '2020-12-30 02:51:21'),
(46, '2020-12-30 10:51:21', 92, 'cup 10oz nat master', 'HAPUS PENJUALAN', NULL, 1, 1, 0, -1, '2020-12-30 02:51:21', '2020-12-30 02:51:21'),
(47, '2020-12-30 11:05:03', 92, 'cup 10oz nat master', 'PENYESUAIAN STOK', NULL, 1, 2, 0, 2, '2020-12-30 03:05:03', '2020-12-30 03:05:03'),
(48, '2020-12-30 11:06:27', 92, 'cup 10oz nat master', 'HAPUS PENYESUAIAN STOK', NULL, 1, 0, 2, 0, '2020-12-30 03:06:27', '2020-12-30 03:06:27'),
(49, '2020-12-30 11:22:24', 234, 'SENDOK MAKAN HOSEO', 'PENYESUAIAN STOK', NULL, 1, 9, 0, 9, '2020-12-30 03:22:24', '2020-12-30 03:22:24'),
(50, '2020-12-30 11:26:17', 236, 'SENDOK MAKAN PREMIUM', 'PENYESUAIAN STOK', NULL, 1, 1, 0, 1, '2020-12-30 03:26:17', '2020-12-30 03:26:17'),
(51, '2020-12-30 11:38:42', 234, 'SENDOK MAKAN HOSEO', 'HAPUS PENYESUAIAN STOK', NULL, 1, 0, 9, -8, '2020-12-30 03:38:42', '2020-12-30 03:38:42'),
(52, '2020-12-30 11:38:48', 236, 'SENDOK MAKAN PREMIUM', 'HAPUS PENYESUAIAN STOK', NULL, 1, 0, 1, -9, '2020-12-30 03:38:48', '2020-12-30 03:38:48'),
(53, '2020-12-30 11:40:48', 234, 'SENDOK MAKAN HOSEO', 'MASP', NULL, 1, 9, 0, 1, '2020-12-30 03:40:48', '2020-12-30 03:40:48'),
(54, '2020-12-30 12:04:21', 234, 'SENDOK MAKAN HOSEO', 'HAPUS PENYESUAIAN STOK', NULL, 1, 0, 9, -8, '2020-12-30 04:04:21', '2020-12-30 04:04:21'),
(55, '2020-12-30 12:10:37', 234, 'SENDOK MAKAN HOSEO', 'MASP', NULL, 1, 9, 0, 1, '2020-12-30 04:10:37', '2020-12-30 04:10:37'),
(56, '2020-12-30 12:12:18', 236, 'SENDOK MAKAN PREMIUM', 'SDK PREMIUM', NULL, 1, 1, 0, -8, '2020-12-30 04:12:18', '2020-12-30 04:12:18'),
(57, '2020-12-30 12:19:42', 153, 'Sendok bebek warna', 'PENYESUAIAN STOK', NULL, 1, 98, 0, 98, '2020-12-30 04:19:42', '2020-12-30 04:19:42'),
(58, '2020-12-30 12:19:56', 153, 'Sendok bebek warna', 'HAPUS PENYESUAIAN STOK', NULL, 1, 0, 98, 0, '2020-12-30 04:19:56', '2020-12-30 04:19:56'),
(59, '2020-12-30 12:20:52', 153, 'Sendok bebek warna', 'KJP', NULL, 1, 98, 0, 98, '2020-12-30 04:20:52', '2020-12-30 04:20:52'),
(60, '2020-12-30 12:29:49', 161, 'Sendok ager warna', 'EVARY', NULL, 1, 360, 0, 360, '2020-12-30 04:29:49', '2020-12-30 04:29:49'),
(61, '2020-12-30 12:39:00', 209, 'tutup cembung polos sukawa', 'JA', NULL, 1, 74, 0, 74, '2020-12-30 04:39:00', '2020-12-30 04:39:00'),
(62, '2020-12-30 12:45:28', 236, 'SENDOK MAKAN PREMIUM', 'PENJUALAN', NULL, 1, 0, 1, -9, '2020-12-30 04:45:28', '2020-12-30 04:45:28'),
(63, '2020-12-30 12:49:54', 92, 'cup 10oz nat master', 'HAPUS PENJUALAN', NULL, 1, 1, 0, -8, '2020-12-30 04:49:54', '2020-12-30 04:49:54'),
(64, '2020-12-30 13:01:39', 234, 'SENDOK MAKAN HOSEO', 'PEMBELIAN', NULL, 1, 9, 0, 10, '2020-12-30 05:01:39', '2020-12-30 05:01:39'),
(65, '2020-12-30 13:06:28', 234, 'SENDOK MAKAN HOSEO', 'HAPUS PENYESUAIAN STOK', NULL, 1, 0, 9, 1, '2020-12-30 05:06:28', '2020-12-30 05:06:28'),
(66, '2020-12-30 13:06:33', 236, 'SENDOK MAKAN PREMIUM', 'HAPUS PENYESUAIAN STOK', NULL, 1, 0, 1, 0, '2020-12-30 05:06:33', '2020-12-30 05:06:33'),
(67, '2020-12-30 13:06:37', 153, 'Sendok bebek warna', 'HAPUS PENYESUAIAN STOK', NULL, 1, 0, 98, -98, '2020-12-30 05:06:37', '2020-12-30 05:06:37'),
(68, '2020-12-30 13:06:42', 161, 'Sendok ager warna', 'HAPUS PENYESUAIAN STOK', NULL, 1, 0, 360, -458, '2020-12-30 05:06:42', '2020-12-30 05:06:42'),
(69, '2020-12-30 13:06:45', 209, 'tutup cembung polos sukawa', 'HAPUS PENYESUAIAN STOK', NULL, 1, 0, 74, -532, '2020-12-30 05:06:45', '2020-12-30 05:06:45'),
(70, '2020-12-30 13:17:51', 153, 'Sendok bebek warna', 'PEMBELIAN', NULL, 1, 98, 0, 0, '2020-12-30 05:17:51', '2020-12-30 05:17:51'),
(71, '2020-12-30 13:24:26', 161, 'Sendok ager warna', 'PEMBELIAN', NULL, 1, 350, 0, -108, '2020-12-30 05:24:26', '2020-12-30 05:24:26'),
(72, '2020-12-30 13:26:53', 209, 'tutup cembung polos sukawa', 'PEMBELIAN', NULL, 1, 0, 0, -532, '2020-12-30 05:26:53', '2020-12-30 05:26:53'),
(73, '2020-12-30 13:29:48', 92, 'cup 10oz nat master', 'HAPUS PEMBELIAN', NULL, 0, 0, 0, -532, '2020-12-30 05:29:48', '2020-12-30 05:29:48'),
(74, '2020-12-30 13:31:00', 209, 'tutup cembung polos sukawa', 'PEMBELIAN', NULL, 1, 15, 0, -517, '2020-12-30 05:31:00', '2020-12-30 05:31:00'),
(75, '2020-12-30 13:34:12', 134, 'Mika 4xx Weetan', 'PEMBELIAN', NULL, 1, 10, 0, 10, '2020-12-30 05:34:12', '2020-12-30 05:34:12'),
(76, '2020-12-30 13:36:50', 139, 'Mika 6a Weetan', 'PEMBELIAN', NULL, 1, 15, 0, 15, '2020-12-30 05:36:50', '2020-12-30 05:36:50'),
(77, '2020-12-30 13:38:16', 133, 'Mika 3xx Weetan', 'PEMBELIAN', NULL, 1, 30, 0, 30, '2020-12-30 05:38:16', '2020-12-30 05:38:16'),
(78, '2020-12-30 13:41:18', 93, 'cup 12oz nat master', 'PEMBELIAN', NULL, 1, 5, 0, 3, '2020-12-30 05:41:18', '2020-12-30 05:41:18'),
(79, '2020-12-30 13:42:54', 94, 'cup 14oz nat master', 'PEMBELIAN', NULL, 1, 30, 0, 30, '2020-12-30 05:42:54', '2020-12-30 05:42:54'),
(80, '2020-12-30 13:44:06', 96, 'cup 16oz nat master', 'PEMBELIAN', NULL, 1, 2, 0, 2, '2020-12-30 05:44:06', '2020-12-30 05:44:06'),
(81, '2020-12-30 13:46:12', 123, 'Cup onde', 'PEMBELIAN', NULL, 1, 24, 0, 24, '2020-12-30 05:46:12', '2020-12-30 05:46:12'),
(82, '2020-12-30 13:48:07', 107, 'cup 14oz nat ascot', 'PEMBELIAN', NULL, 1, 14, 0, 14, '2020-12-30 05:48:07', '2020-12-30 05:48:07'),
(83, '2020-12-30 13:50:00', 103, 'cup 14oz nat dias', 'PEMBELIAN', NULL, 1, 1, 0, 1, '2020-12-30 05:50:00', '2020-12-30 05:50:00'),
(84, '2020-12-30 14:38:18', 172, 'Dus donat polos', 'PEMBELIAN', NULL, 1, 1750, 0, 1750, '2020-12-30 06:38:18', '2020-12-30 06:38:18'),
(85, '2020-12-30 14:39:28', 169, 'Dus donat laminasi', 'PEMBELIAN', NULL, 1, 250, 0, 250, '2020-12-30 06:39:28', '2020-12-30 06:39:28'),
(86, '2020-12-30 14:42:31', 110, 'Cup 220ml hanica', 'PEMBELIAN', NULL, 1, 203, 0, 203, '2020-12-30 06:42:31', '2020-12-30 06:42:31'),
(87, '2020-12-30 14:44:58', 98, 'Cup 12 oz hanica', 'PEMBELIAN', NULL, 1, 83, 0, 83, '2020-12-30 06:44:58', '2020-12-30 06:44:58'),
(88, '2020-12-30 16:06:37', 125, 'Mika NS 1 Jumbo', 'PEMBELIAN', NULL, 1, 12500, 0, 12500, '2020-12-30 08:06:37', '2020-12-30 08:06:37'),
(89, '2020-12-30 16:13:10', 132, 'Mika 7C NS', 'PEMBELIAN', NULL, 1, 50, 0, 50, '2020-12-30 08:13:10', '2020-12-30 08:13:10'),
(90, '2020-12-30 16:15:49', 131, 'Mika TM 18 NS', 'PEMBELIAN', NULL, 1, 26, 0, 26, '2020-12-30 08:15:49', '2020-12-30 08:15:49'),
(91, '2021-01-02 10:56:42', 92, 'cup 10oz nat master', 'HAPUS PEMBELIAN', NULL, 0, 0, 26, 0, '2021-01-02 02:56:42', '2021-01-02 02:56:42'),
(92, '2021-01-02 10:56:47', 92, 'cup 10oz nat master', 'HAPUS PEMBELIAN', NULL, 0, 0, 50, 0, '2021-01-02 02:56:47', '2021-01-02 02:56:47'),
(93, '2021-01-02 10:56:54', 92, 'cup 10oz nat master', 'HAPUS PEMBELIAN', NULL, 0, 0, 5, -2, '2021-01-02 02:56:54', '2021-01-02 02:56:54'),
(94, '2021-01-02 10:56:58', 92, 'cup 10oz nat master', 'HAPUS PEMBELIAN', NULL, 0, 0, 30, 0, '2021-01-02 02:56:58', '2021-01-02 02:56:58'),
(95, '2021-01-02 10:57:04', 92, 'cup 10oz nat master', 'HAPUS PEMBELIAN', NULL, 0, 0, 83, 0, '2021-01-02 02:57:04', '2021-01-02 02:57:04'),
(96, '2021-01-02 10:57:08', 92, 'cup 10oz nat master', 'HAPUS PEMBELIAN', NULL, 0, 0, 203, 0, '2021-01-02 02:57:08', '2021-01-02 02:57:08'),
(97, '2021-01-02 10:57:12', 92, 'cup 10oz nat master', 'HAPUS PEMBELIAN', NULL, 0, 0, 250, 0, '2021-01-02 02:57:12', '2021-01-02 02:57:12'),
(98, '2021-01-02 10:57:27', 92, 'cup 10oz nat master', 'HAPUS PEMBELIAN', NULL, 0, 0, 1750, 0, '2021-01-02 02:57:27', '2021-01-02 02:57:27'),
(99, '2021-01-02 10:57:31', 92, 'cup 10oz nat master', 'HAPUS PEMBELIAN', NULL, 0, 0, 1, 0, '2021-01-02 02:57:31', '2021-01-02 02:57:31'),
(100, '2021-01-02 10:57:34', 92, 'cup 10oz nat master', 'HAPUS PEMBELIAN', NULL, 0, 0, 14, 0, '2021-01-02 02:57:34', '2021-01-02 02:57:34'),
(101, '2021-01-02 10:57:38', 92, 'cup 10oz nat master', 'HAPUS PEMBELIAN', NULL, 0, 0, 24, 0, '2021-01-02 02:57:38', '2021-01-02 02:57:38'),
(102, '2021-01-02 10:57:41', 92, 'cup 10oz nat master', 'HAPUS PEMBELIAN', NULL, 0, 0, 2, 0, '2021-01-02 02:57:41', '2021-01-02 02:57:41'),
(103, '2021-01-02 10:57:45', 92, 'cup 10oz nat master', 'HAPUS PEMBELIAN', NULL, 0, 0, 30, 0, '2021-01-02 02:57:45', '2021-01-02 02:57:45'),
(104, '2021-01-02 10:57:48', 92, 'cup 10oz nat master', 'HAPUS PEMBELIAN', NULL, 0, 0, 15, 0, '2021-01-02 02:57:48', '2021-01-02 02:57:48'),
(105, '2021-01-02 10:57:53', 92, 'cup 10oz nat master', 'HAPUS PEMBELIAN', NULL, 0, 0, 10, 0, '2021-01-02 02:57:53', '2021-01-02 02:57:53'),
(106, '2021-01-02 10:57:56', 92, 'cup 10oz nat master', 'HAPUS PEMBELIAN', NULL, 0, 0, 15, -532, '2021-01-02 02:57:56', '2021-01-02 02:57:56'),
(107, '2021-01-02 10:58:00', 92, 'cup 10oz nat master', 'HAPUS PEMBELIAN', NULL, 0, 0, 350, -458, '2021-01-02 02:58:00', '2021-01-02 02:58:00'),
(108, '2021-01-02 10:58:03', 92, 'cup 10oz nat master', 'HAPUS PEMBELIAN', NULL, 0, 0, 98, -98, '2021-01-02 02:58:03', '2021-01-02 02:58:03'),
(109, '2021-01-02 10:58:07', 92, 'cup 10oz nat master', 'HAPUS PEMBELIAN', NULL, 0, 0, 9, -8, '2021-01-02 02:58:07', '2021-01-02 02:58:07'),
(110, '2021-01-02 11:01:24', 234, 'SENDOK MAKAN HOSEO', 'PEMBELIAN', NULL, 1, 9, 0, 10, '2021-01-02 03:01:24', '2021-01-02 03:01:24'),
(111, '2021-01-02 11:13:50', 237, 'SENDOK MAKAN HOSEO', 'PEMBELIAN', NULL, 1, 9, 0, 9, '2021-01-02 03:13:50', '2021-01-02 03:13:50'),
(112, '2021-01-02 11:18:33', 238, 'sendok makan premium', 'PEMBELIAN', NULL, 1, 1, 0, 1, '2021-01-02 03:18:33', '2021-01-02 03:18:33'),
(113, '2021-01-02 11:19:00', 99, 'Cup 14 oz hanica', 'HAPUS PEMBELIAN', NULL, 0, 0, 9, 0, '2021-01-02 03:19:00', '2021-01-02 03:19:00'),
(114, '2021-01-02 11:24:45', 239, 'Sendok bebek warna', 'PEMBELIAN', NULL, 1, 98, 0, 98, '2021-01-02 03:24:45', '2021-01-02 03:24:45'),
(115, '2021-01-02 11:34:57', 241, 'sensok ager warna', 'PEMBELIAN', NULL, 1, 360, 0, 360, '2021-01-02 03:34:57', '2021-01-02 03:34:57'),
(116, '2021-01-02 11:57:40', 99, 'Cup 14 oz hanica', 'HAPUS PEMBELIAN', NULL, 0, 0, 360, 0, '2021-01-02 03:57:40', '2021-01-02 03:57:40'),
(117, '2021-01-02 11:59:09', 99, 'Cup 14 oz hanica', 'HAPUS PEMBELIAN', NULL, 0, 0, 1, 0, '2021-01-02 03:59:09', '2021-01-02 03:59:09'),
(118, '2021-01-02 12:03:56', 238, 'sendok makan premium', 'PEMBELIAN', NULL, 1, 1, 0, 2, '2021-01-02 04:03:56', '2021-01-02 04:03:56'),
(119, '2021-01-02 12:07:17', 242, 'Sendok bebek warna', 'PEMBELIAN', NULL, 1, 93, 0, 93, '2021-01-02 04:07:17', '2021-01-02 04:07:17'),
(120, '2021-01-02 12:12:10', 243, 'Sendok ager warna', 'PEMBELIAN', NULL, 1, 315, 0, 315, '2021-01-02 04:12:10', '2021-01-02 04:12:10'),
(121, '2021-01-02 12:12:22', 99, 'Cup 14 oz hanica', 'HAPUS PEMBELIAN', NULL, 0, 0, 315, 0, '2021-01-02 04:12:22', '2021-01-02 04:12:22'),
(122, '2021-01-02 12:17:57', 244, 'tutup cembung polos JA', 'PEMBELIAN', NULL, 1, 74, 0, 74, '2021-01-02 04:17:57', '2021-01-02 04:17:57'),
(123, '2021-01-02 12:25:11', 245, 'tutup ager BULAN', 'PEMBELIAN', NULL, 1, 191, 0, 191, '2021-01-02 04:25:11', '2021-01-02 04:25:11'),
(124, '2021-01-02 12:30:26', 246, 'tutup datar master', 'PEMBELIAN', NULL, 1, 185, 0, 185, '2021-01-02 04:30:26', '2021-01-02 04:30:26'),
(125, '2021-01-02 12:38:49', 247, 'tutup cembung 22oz', 'PEMBELIAN', NULL, 1, 27, 0, 27, '2021-01-02 04:38:49', '2021-01-02 04:38:49'),
(126, '2021-01-02 12:53:04', 248, 'Mika 3xx Weetan', 'PEMBELIAN', NULL, 1, 27, 0, 27, '2021-01-02 04:53:04', '2021-01-02 04:53:04'),
(127, '2021-01-02 12:54:37', 249, 'Mika 4xx Weetan', 'PEMBELIAN', NULL, 1, 8, 0, 8, '2021-01-02 04:54:37', '2021-01-02 04:54:37'),
(128, '2021-01-02 12:59:43', 139, 'Mika 6a Weetan', 'PEMBELIAN', NULL, 1, 15, 0, 30, '2021-01-02 04:59:43', '2021-01-02 04:59:43'),
(129, '2021-01-02 13:09:28', 126, 'Mika NS 1A', 'PEMBELIAN', NULL, 1, 200, 0, 200, '2021-01-02 05:09:28', '2021-01-02 05:09:28'),
(130, '2021-01-02 13:14:24', 250, 'mika sayur 18 ns', 'PEMBELIAN', NULL, 1, 24, 0, 24, '2021-01-02 05:14:24', '2021-01-02 05:14:24'),
(131, '2021-01-02 13:18:36', 251, 'Mika 3 NS', 'PEMBELIAN', NULL, 1, 2, 0, 2, '2021-01-02 05:18:36', '2021-01-02 05:18:36'),
(132, '2021-01-02 13:29:17', 252, 'cup 12oz nat duyung', 'PEMBELIAN', NULL, 1, 4, 0, 4, '2021-01-02 05:29:17', '2021-01-02 05:29:17'),
(133, '2021-01-02 13:30:21', 253, 'cup 14oz nat duyung', 'PEMBELIAN', NULL, 1, 13, 0, 13, '2021-01-02 05:30:21', '2021-01-02 05:30:21'),
(134, '2021-01-02 13:37:24', 254, 'cup 16oz nat duyung', 'PEMBELIAN', NULL, 1, 1, 0, 1, '2021-01-02 05:37:24', '2021-01-02 05:37:24'),
(135, '2021-01-02 13:39:30', 253, 'cup 14oz nat duyung', 'PEMBELIAN', NULL, 1, 1, 0, 14, '2021-01-02 05:39:30', '2021-01-02 05:39:30'),
(136, '2021-01-02 14:01:51', 260, 'cup 12oz nat hanica', 'PEMBELIAN', NULL, 1, 82, 0, 82, '2021-01-02 06:01:51', '2021-01-02 06:01:51'),
(137, '2021-01-02 14:04:01', 99, 'Cup 14 oz hanica', 'PEMBELIAN', NULL, 1, 102, 0, 102, '2021-01-02 06:04:01', '2021-01-02 06:04:01'),
(138, '2021-01-02 14:07:01', 100, 'Cup 16 oz hanica', 'PEMBELIAN', NULL, 1, 51, 0, 51, '2021-01-02 06:07:01', '2021-01-02 06:07:01'),
(139, '2021-01-02 14:52:03', 269, 'Cup 220ml hanica', 'PEMBELIAN', NULL, 1, 193, 0, 193, '2021-01-02 06:52:03', '2021-01-02 06:52:03'),
(140, '2021-01-02 14:55:32', 270, 'cup 220ml nat master', 'PEMBELIAN', NULL, 1, 3, 0, 3, '2021-01-02 06:55:32', '2021-01-02 06:55:32'),
(141, '2021-01-02 14:57:59', 121, 'Cup 22oz Euro', 'PEMBELIAN', NULL, 1, 13, 0, 13, '2021-01-02 06:57:59', '2021-01-02 06:57:59'),
(142, '2021-01-02 15:00:52', 267, 'cup 14oz nat ascot', 'PEMBELIAN', NULL, 1, 14, 0, 14, '2021-01-02 07:00:52', '2021-01-02 07:00:52'),
(143, '2021-01-02 15:02:05', 263, 'cup 14oz nat dias', 'PEMBELIAN', NULL, 1, 1, 0, 1, '2021-01-02 07:02:05', '2021-01-02 07:02:05'),
(144, '2021-01-02 15:13:13', 272, 'cup 220ml nat ibc', 'PEMBELIAN', NULL, 1, 46, 0, 46, '2021-01-02 07:13:13', '2021-01-02 07:13:13'),
(145, '2021-01-02 15:24:01', 122, 'Cup Ager 50ml OPW', 'PEMBELIAN', NULL, 1, 2, 0, 2, '2021-01-02 07:24:01', '2021-01-02 07:24:01'),
(146, '2021-01-02 15:29:24', 273, 'Cup ager 65ml topcup', 'PEMBELIAN', NULL, 1, 2, 0, 2, '2021-01-02 07:29:24', '2021-01-02 07:29:24'),
(147, '2021-01-02 15:30:42', 274, 'Cup ager 90ml topcup', 'PEMBELIAN', NULL, 1, 75, 0, 75, '2021-01-02 07:30:42', '2021-01-02 07:30:42'),
(148, '2021-01-02 15:36:27', 123, 'Cup onde if', 'PEMBELIAN', NULL, 1, 24, 0, 48, '2021-01-02 07:36:27', '2021-01-02 07:36:27'),
(149, '2021-01-02 15:51:37', 275, 'cup 14oz nat oval bsm', 'PEMBELIAN', NULL, 1, 6, 0, 6, '2021-01-02 07:51:37', '2021-01-02 07:51:37'),
(150, '2021-01-02 15:52:54', 276, 'cup 16oz nat oval bsm', 'PEMBELIAN', NULL, 1, 3, 0, 3, '2021-01-02 07:52:54', '2021-01-02 07:52:54'),
(151, '2021-01-02 16:05:01', 278, 'cup coffee 8oz isi 25x25', 'PEMBELIAN', NULL, 1, 5, 0, 5, '2021-01-02 08:05:01', '2021-01-02 08:05:01'),
(152, '2021-01-02 16:07:48', 279, 'thinwall Hanzo 750ml(250pcs)', 'PEMBELIAN', NULL, 1, 7, 0, 7, '2021-01-02 08:07:48', '2021-01-02 08:07:48'),
(153, '2021-01-02 16:08:40', 280, 'thinwall Hanzo 750ml(500pcs)', 'PEMBELIAN', NULL, 1, 25, 0, 25, '2021-01-02 08:08:40', '2021-01-02 08:08:40'),
(154, '2021-01-02 16:30:24', 147, 'Mika siffon 18 TP', 'PEMBELIAN', NULL, 1, 1650, 0, 1650, '2021-01-02 08:30:24', '2021-01-02 08:30:24'),
(155, '2021-01-02 16:38:54', 219, 'DM 500ml', 'PEMBELIAN', NULL, 1, 24, 0, 24, '2021-01-02 08:38:54', '2021-01-02 08:38:54'),
(156, '2021-01-02 16:40:12', 220, 'DM 650ml', 'PEMBELIAN', NULL, 1, 24, 0, 24, '2021-01-02 08:40:12', '2021-01-02 08:40:12'),
(157, '2021-01-02 16:41:27', 215, 'DM 300ml', 'PEMBELIAN', NULL, 1, 5, 0, 5, '2021-01-02 08:41:27', '2021-01-02 08:41:27'),
(158, '2021-01-02 16:48:41', 282, 'Papercup eskrim', 'PEMBELIAN', NULL, 1, 10, 0, 10, '2021-01-02 08:48:41', '2021-01-02 08:48:41'),
(159, '2021-01-02 17:02:34', 285, 'thinwall TP 750ml', 'PEMBELIAN', NULL, 1, 1, 0, 1, '2021-01-02 09:02:34', '2021-01-02 09:02:34'),
(160, '2021-01-02 17:03:47', 283, 'thinwall TP 500ml KOTAK', 'PEMBELIAN', NULL, 1, 3, 0, 3, '2021-01-02 09:03:47', '2021-01-02 09:03:47'),
(161, '2021-01-02 17:04:57', 281, 'thinwall TP 200ml', 'PEMBELIAN', NULL, 1, 1, 0, 1, '2021-01-02 09:04:57', '2021-01-02 09:04:57'),
(162, '2021-01-02 17:06:35', 284, 'thinwall TP 650ml', 'PEMBELIAN', NULL, 1, 6, 0, 6, '2021-01-02 09:06:35', '2021-01-02 09:06:35'),
(163, '2021-01-02 18:12:41', 146, 'Mika 7C NS', 'PEMBELIAN', NULL, 1, 50, 0, 50, '2021-01-02 10:12:41', '2021-01-02 10:12:41'),
(164, '2021-01-02 18:20:21', 286, 'mika 1 jumbo NS', 'PEMBELIAN', NULL, 1, 12500, 0, 12500, '2021-01-02 10:20:21', '2021-01-02 10:20:21'),
(165, '2021-01-02 18:25:24', 287, 'sifon 18 NS', 'PEMBELIAN', NULL, 1, 5000, 0, 5000, '2021-01-02 10:25:24', '2021-01-02 10:25:24'),
(166, '2021-01-02 18:29:26', 288, 'mika sifon 22 NS', 'PEMBELIAN', NULL, 1, 4000, 0, 4000, '2021-01-02 10:29:26', '2021-01-02 10:29:26'),
(167, '2021-01-02 18:37:54', 289, 'foam hb BSM', 'PEMBELIAN', NULL, 1, 420, 0, 420, '2021-01-02 10:37:54', '2021-01-02 10:37:54'),
(168, '2021-01-02 18:51:09', 231, 'Foam mangkok BSM', 'PEMBELIAN', NULL, 1, 55, 0, 55, '2021-01-02 10:51:09', '2021-01-02 10:51:09'),
(169, '2021-01-02 19:04:27', 228, 'Foam Sekat BSM', 'PEMBELIAN', NULL, 1, 100, 0, 100, '2021-01-02 11:04:27', '2021-01-02 11:04:27'),
(170, '2021-01-02 19:05:49', 230, 'Foam tanggung BSM', 'PEMBELIAN', NULL, 1, 5, 0, 5, '2021-01-02 11:05:49', '2021-01-02 11:05:49'),
(171, '2021-01-02 19:16:32', 192, 'dus snak R3 kjp', 'PEMBELIAN', NULL, 1, 68100, 0, 68100, '2021-01-02 11:16:32', '2021-01-02 11:16:32'),
(172, '2021-01-02 20:37:58', 160, 'Sendok stb super', 'PEMBELIAN', NULL, 1, 30, 0, 30, '2021-01-02 12:37:58', '2021-01-02 12:37:58'),
(173, '2021-01-02 20:42:07', 291, 'sealer SHUKAKU motif teh isi 1000pcs', 'PEMBELIAN', NULL, 1, 10, 0, 10, '2021-01-02 12:42:07', '2021-01-02 12:42:07'),
(174, '2021-01-02 20:55:54', 232, 'Tusuk sate Seika', 'PEMBELIAN', NULL, 1, 5, 0, 5, '2021-01-02 12:55:54', '2021-01-02 12:55:54'),
(175, '2021-01-02 21:00:41', 292, 'tusuk sate SHUKAKU', 'PEMBELIAN', NULL, 1, 10, 0, 10, '2021-01-02 13:00:41', '2021-01-02 13:00:41'),
(176, '2021-01-02 21:02:34', 233, 'Tusuk gigi JA', 'PEMBELIAN', NULL, 1, 4, 0, 4, '2021-01-02 13:02:34', '2021-01-02 13:02:34'),
(177, '2021-01-02 21:04:13', 229, 'Foam polos BSM', 'PEMBELIAN', NULL, 1, 57, 0, 57, '2021-01-02 13:04:13', '2021-01-02 13:04:13'),
(178, '2021-01-02 21:09:53', 293, 'sealer SMILE kartun', 'PEMBELIAN', NULL, 1, 16, 0, 16, '2021-01-02 13:09:53', '2021-01-02 13:09:53'),
(179, '2021-01-04 08:46:19', 294, 'karet kuning AMIGO', 'PEMBELIAN', NULL, 1, 189, 0, 189, '2021-01-04 00:46:19', '2021-01-04 00:46:19'),
(180, '2021-01-04 08:51:02', 295, 'karet kuning SINON', 'PEMBELIAN', NULL, 1, 119, 0, 119, '2021-01-04 00:51:02', '2021-01-04 00:51:02'),
(181, '2021-01-04 08:55:06', 296, 'garpu buah kiloan', 'PEMBELIAN', NULL, 1, 147, 0, 147, '2021-01-04 00:55:06', '2021-01-04 00:55:06'),
(182, '2021-01-04 08:59:19', 150, 'Mika brownies S', 'PEMBELIAN', NULL, 1, 450, 0, 450, '2021-01-04 00:59:19', '2021-01-04 00:59:19'),
(183, '2021-01-04 09:03:27', 297, 'tutup cembung rigi SIPP', 'PEMBELIAN', NULL, 1, 213, 0, 213, '2021-01-04 01:03:27', '2021-01-04 01:03:27'),
(184, '2021-01-04 09:17:49', 298, 'handbag sm 30x30', 'PEMBELIAN', NULL, 1, 110, 0, 110, '2021-01-04 01:17:49', '2021-01-04 01:17:49'),
(185, '2021-01-04 09:20:11', 302, 'plastik standing pouch 10x17', 'PEMBELIAN', NULL, 1, 45, 0, 45, '2021-01-04 01:20:11', '2021-01-04 01:20:11'),
(186, '2021-01-04 09:22:54', 303, 'plastik standing pouch 12x20', 'PEMBELIAN', NULL, 1, 140, 0, 140, '2021-01-04 01:22:54', '2021-01-04 01:22:54'),
(187, '2021-01-04 09:38:09', 305, 'dus donat laminasi bigbox', 'PEMBELIAN', NULL, 1, 0, 0, 0, '2021-01-04 01:38:09', '2021-01-04 01:38:09'),
(188, '2021-01-04 09:41:37', 306, 'dus donat motif', 'PEMBELIAN', NULL, 1, 1800, 0, 1800, '2021-01-04 01:41:37', '2021-01-04 01:41:37'),
(189, '2021-01-04 09:45:37', 166, 'Dus Pizza 15x15 goden', 'PEMBELIAN', NULL, 1, 1950, 0, 1950, '2021-01-04 01:45:37', '2021-01-04 01:45:37'),
(190, '2021-01-04 09:47:20', 168, 'Dus pizza 25x25', 'PEMBELIAN', NULL, 1, 2000, 0, 2000, '2021-01-04 01:47:20', '2021-01-04 01:47:20'),
(191, '2021-01-04 09:50:41', 163, 'Dus 16 laminasi simpak', 'PEMBELIAN', NULL, 1, 1400, 0, 1400, '2021-01-04 01:50:41', '2021-01-04 01:50:41'),
(192, '2021-01-04 09:55:17', 164, 'dus 18 laminasi simpak', 'PEMBELIAN', NULL, 1, 40000, 0, 40000, '2021-01-04 01:55:17', '2021-01-04 01:55:17'),
(193, '2021-01-04 10:07:43', 147, 'Mika siffon 18 TP', 'PEMBELIAN', NULL, 1, 1500, 0, 3150, '2021-01-04 02:07:43', '2021-01-04 02:07:43'),
(194, '2021-01-04 10:09:05', 149, 'Mika siffon 22 TP', 'PEMBELIAN', NULL, 1, 1200, 0, 1200, '2021-01-04 02:09:05', '2021-01-04 02:09:05'),
(195, '2021-01-04 10:10:42', 307, 'mika sayur 20 weetan IF', 'PEMBELIAN', NULL, 1, 5, 0, 5, '2021-01-04 02:10:42', '2021-01-04 02:10:42'),
(196, '2021-01-04 10:12:39', 308, 'mika sifon 25 MMP IF', 'PEMBELIAN', NULL, 1, 100, 0, 100, '2021-01-04 02:12:39', '2021-01-04 02:12:39'),
(197, '2021-01-04 10:14:46', 248, 'Mika 3xx Weetan', 'PEMBELIAN', NULL, 1, 1, 0, 28, '2021-01-04 02:14:46', '2021-01-04 02:14:46'),
(198, '2021-01-04 10:32:42', 309, 'SEDOTAN BUBBLE 6MM', 'PEMBELIAN', NULL, 1, 100, 0, 100, '2021-01-04 02:32:42', '2021-01-04 02:32:42'),
(199, '2021-01-04 10:33:49', 310, 'SEDOTAN BUBBLE 8MM', 'PEMBELIAN', NULL, 1, 32, 0, 32, '2021-01-04 02:33:49', '2021-01-04 02:33:49'),
(200, '2021-01-04 10:47:08', 276, 'cup 16oz nat oval bsm', 'PENJUALAN', NULL, 1, 0, 1, 2, '2021-01-04 02:47:08', '2021-01-04 02:47:08'),
(201, '2021-01-04 10:47:08', 237, 'SENDOK MAKAN HOSEO', 'PENJUALAN', NULL, 1, 0, 2, 7, '2021-01-04 02:47:08', '2021-01-04 02:47:08'),
(202, '2021-01-04 10:47:08', 121, 'Cup 22oz Euro', 'PENJUALAN', NULL, 1, 0, 1, 12, '2021-01-04 02:47:08', '2021-01-04 02:47:08'),
(203, '2021-01-04 10:51:34', 294, 'karet kuning AMIGO', 'PENJUALAN', NULL, 1, 0, 3, 186, '2021-01-04 02:51:34', '2021-01-04 02:51:34'),
(204, '2021-01-04 10:51:34', 242, 'Sendok bebek warna', 'PENJUALAN', NULL, 1, 0, 1, 92, '2021-01-04 02:51:34', '2021-01-04 02:51:34'),
(205, '2021-01-04 10:51:35', 146, 'Mika 7C NS', 'PENJUALAN', NULL, 1, 0, 1, 49, '2021-01-04 02:51:35', '2021-01-04 02:51:35'),
(206, '2021-01-04 10:59:42', 228, 'Foam Sekat BSM', 'PENJUALAN', NULL, 1, 0, 20, 80, '2021-01-04 02:59:42', '2021-01-04 02:59:42'),
(207, '2021-01-04 10:59:42', 215, 'DM 300ml', 'PENJUALAN', NULL, 1, 0, 1, 4, '2021-01-04 02:59:42', '2021-01-04 02:59:42'),
(208, '2021-01-04 10:59:42', 289, 'foam hb BSM', 'PENJUALAN', NULL, 1, 0, 100, 320, '2021-01-04 02:59:42', '2021-01-04 02:59:42'),
(209, '2021-01-04 10:59:42', 229, 'Foam polos BSM', 'PENJUALAN', NULL, 1, 0, 30, 27, '2021-01-04 02:59:42', '2021-01-04 02:59:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `info_toko`
--

CREATE TABLE `info_toko` (
  `id` int(11) NOT NULL,
  `nama_toko` varchar(191) DEFAULT NULL,
  `alamat_toko` varchar(191) DEFAULT NULL,
  `desa_toko` varchar(191) DEFAULT NULL,
  `kecamatan_toko` varchar(191) DEFAULT NULL,
  `kota_toko` varchar(191) DEFAULT NULL,
  `provinsi_toko` varchar(191) DEFAULT NULL,
  `kode_pos_toko` varchar(191) DEFAULT NULL,
  `hp_toko` varchar(191) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `info_toko`
--

INSERT INTO `info_toko` (`id`, `nama_toko`, `alamat_toko`, `desa_toko`, `kecamatan_toko`, `kota_toko`, `provinsi_toko`, `kode_pos_toko`, `hp_toko`, `created_at`, `updated_at`) VALUES
(2, 'Intercup', 'Blok Senin/30 Bata, No. 166', 'Panjalin Kidul', 'Sumberjaya', 'Majalengka', 'Jawa Barat', '45455', '(0233) 8515935', '2018-07-16 08:07:03', '2020-12-22 07:12:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `klasifikasis`
--

CREATE TABLE `klasifikasis` (
  `id` int(10) UNSIGNED NOT NULL,
  `klasifikasi` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontaks`
--

CREATE TABLE `kontaks` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_kontak` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_kontak` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kurs` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `klasifikasi` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kontak` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jabatan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `handphone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `situs_web` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `npwp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batas_kredit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hari_diskon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hari_jatuh_tempo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diskon_awal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `denda_terlambat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kontaks`
--

INSERT INTO `kontaks` (`id`, `kode_kontak`, `nama_kontak`, `kurs`, `tipe`, `jenis`, `klasifikasi`, `kontak`, `jabatan`, `phone1`, `phone2`, `fax`, `handphone`, `email`, `situs_web`, `npwp`, `batas_kredit`, `hari_diskon`, `hari_jatuh_tempo`, `diskon_awal`, `denda_terlambat`, `created_at`, `updated_at`) VALUES
(77, 'SP001', 'Naga Semut', 'IDR', 'Supplier', NULL, 'Kebumen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-07 20:06:08', '2020-06-07 20:06:08'),
(78, 'CS001', 'Diding Hermawan', 'IDR', 'Customer', 'Majalengka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-07 20:06:40', '2020-06-07 20:06:40'),
(79, 'K001', 'Nana', 'IDR', 'Pegawai', 'Majalengka', 'Dusun Jahalaksana Ds.Palasah', '0859111470071', 'Sales', NULL, NULL, NULL, '0859111470071', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-07 21:06:14', '2020-06-19 22:06:35'),
(80, 'CS002', 'Tk Rado', 'IDR', 'Customer', 'Majalengka', 'Desa paningkiran', '085321975111', NULL, NULL, NULL, NULL, '085321975111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 22:06:48', '2020-06-23 23:06:59'),
(81, 'CS003', 'Tamago', 'IDR', NULL, NULL, 'ciparay leuwimunding', NULL, NULL, NULL, NULL, NULL, '085321956901', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 22:06:52', '2020-06-18 22:06:52'),
(82, 'CS004', 'Tamago', 'IDR', 'Customer', 'Majalengka', 'ciparay leuwimunding', '085321956901', NULL, NULL, NULL, NULL, '085321956901', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 22:06:36', '2020-06-23 23:06:38'),
(83, 'CS005', 'Pa H tosin', 'IDR', 'Customer', 'Majalengka', 'Pasar Rajagaluh', '081312352712', NULL, NULL, NULL, NULL, '081312352712', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 22:06:59', '2020-06-18 22:06:59'),
(84, 'CS006', 'Ibu Dini', 'IDR', 'Customer', 'Majalengka', 'Pasar Rajagaluh', '082117513401', NULL, NULL, NULL, NULL, '082117513401', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 22:06:37', '2020-06-18 22:06:37'),
(85, 'CS007', 'Pa Aceng', 'IDR', 'Customer', 'Majalengka', 'Pasar Rajagaluh', '085316171795', NULL, NULL, NULL, NULL, '085316171795', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 22:06:43', '2020-06-18 22:06:43'),
(86, 'CS008', 'Tk Ipin', 'IDR', 'Customer', 'Majalengka', 'Pasar Rajagaluh', '085295511123', NULL, NULL, NULL, NULL, '085295511123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 22:06:15', '2020-06-18 22:06:15'),
(87, 'CS009', 'Hanim', 'IDR', 'Customer', 'Majalengka', 'Rajagaluh', '081295348251', NULL, NULL, NULL, NULL, '081295348251', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 22:06:28', '2020-06-18 22:06:28'),
(88, 'CS010', 'Pa Imam/C7', 'IDR', 'Customer', 'Majalengka', 'Tanjungsari', '0895807956565', NULL, NULL, NULL, NULL, '0895807956565', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 22:06:53', '2020-06-18 22:06:53'),
(89, 'CS011', 'Pa H Komar', 'IDR', 'Customer', 'Majalengka', 'Pasar Leuwimunding', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 22:06:04', '2020-06-18 22:06:04'),
(90, 'CS012', 'Zidan', 'IDR', 'Customer', 'Majalengka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 22:06:46', '2020-06-18 22:06:46'),
(91, 'CS013', 'Aminta', 'IDR', 'Customer', 'Majalengka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 22:06:55', '2020-06-18 22:06:55'),
(92, 'CS014', 'Motekar', 'IDR', 'Customer', 'Majalengka', 'Majalengka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 22:06:54', '2020-06-18 22:06:54'),
(93, 'CS015', 'Ade makmur', 'IDR', 'Customer', 'Majalengka', 'Sindang kasih. Majalengka', '085210922257', NULL, NULL, NULL, NULL, '085210922257', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 22:06:56', '2020-06-18 22:06:56'),
(94, 'CS016', 'Tk Dean', 'IDR', 'Customer', 'Majalengka', 'Maja', '089653997765', NULL, NULL, NULL, NULL, '089653997765', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 22:06:08', '2020-06-18 22:06:08'),
(95, 'CS017', 'Tk Misbah', 'IDR', 'Customer', 'Majalengka', 'Maja', '081313178822', NULL, NULL, NULL, NULL, '081313178822', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 22:06:05', '2020-06-18 22:06:05'),
(96, 'CS018', 'Tk Sri Rezeki', 'IDR', 'Customer', 'Majalengka', 'Pasar maja', '088801816096', NULL, NULL, NULL, NULL, '088801816096', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 22:06:30', '2020-06-18 22:06:30'),
(97, 'CS019', 'Tk Murni Plastik', 'IDR', 'Customer', 'Majalengka', 'Pasar maja', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 22:06:05', '2020-06-18 22:06:05'),
(98, 'CS020', 'Tk Mz Jaya', 'IDR', 'Customer', 'Majalengka', 'Pasar Talaga', '082117875302', NULL, NULL, NULL, NULL, '082117875302', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 22:06:47', '2020-06-18 22:06:47'),
(99, 'CS021', 'Tk Ridho', 'IDR', 'Customer', NULL, 'Cikijing', '082320691899', NULL, NULL, NULL, NULL, '082320691899', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 22:06:07', '2021-01-03 17:01:01'),
(100, 'CS022', 'Tk TD Putri', 'IDR', 'Customer', 'Majalengka', 'Pasar cikijing', '081214716777', NULL, NULL, NULL, NULL, '081214716777', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:50', '2020-06-18 23:06:50'),
(101, 'CS023', 'Tk Ahsan Plastik', 'IDR', 'Customer', 'Majalengka', 'Pasar Darma', '082217610671', NULL, NULL, NULL, NULL, '082217610671', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:43', '2020-06-18 23:06:43'),
(102, 'CS024', 'Tk H45PRO', 'IDR', 'Customer', 'Majalengka', 'Sukaraja', '085324662803', NULL, NULL, NULL, NULL, '085324662803', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:32', '2020-06-18 23:06:32'),
(103, 'CS025', 'Tk Desofa', 'IDR', 'Customer', 'Cirebon', 'susukan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:06', '2020-06-18 23:06:06'),
(104, 'CS026', 'Kaya Kue', 'IDR', 'Customer', 'Cirebon', 'Pasar Arjawinangun', '089518594724', NULL, NULL, NULL, NULL, '089518594724', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:55', '2020-06-18 23:06:55'),
(105, 'CS027', 'Ibu Fatonah', 'IDR', 'Customer', 'Cirebon', 'Pasar Arjawinangun', '085864664889', NULL, NULL, NULL, NULL, '085864664889', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:01', '2020-06-18 23:06:01'),
(106, 'CS028', 'Ibu Duroh', 'IDR', 'Customer', 'Cirebon', 'Pasar Arjawinangun', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:52', '2020-06-18 23:06:52'),
(107, 'CS029', 'Ibu Jaro', 'IDR', 'Customer', 'Cirebon', 'Pasar Arjawinangun', '081218481578', NULL, NULL, NULL, NULL, '081218481578', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:16', '2020-06-18 23:06:16'),
(108, 'CS030', 'Ibu Juju', 'IDR', 'Customer', 'Cirebon', 'Pasar Arjawinangun', '087777299500', NULL, NULL, NULL, NULL, '087777299500', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:16', '2020-06-18 23:06:16'),
(109, 'CS031', 'Tk Eniyah', 'IDR', 'Customer', 'Cirebon', 'Pasar Minggu Palimanan', '082128866337', NULL, NULL, NULL, NULL, '082128866337', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:20', '2020-06-18 23:06:20'),
(110, 'CS032', 'Pa Haris', 'IDR', 'Customer', 'Cirebon', 'Pasar Minggu Palimanan', '085315791969', NULL, NULL, NULL, NULL, '085315791969', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:35', '2020-06-18 23:06:35'),
(111, 'CS033', 'Tk Galih', 'IDR', 'Customer', 'Cirebon', 'Warukawung', '085721435996', NULL, NULL, NULL, NULL, '085721435996', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:55', '2020-06-18 23:06:28'),
(112, 'CS034', 'Tk Plastik RR', 'IDR', 'Customer', 'Cirebon', 'Pilangsari cirebon', '082111017044', NULL, NULL, NULL, NULL, '082111017044', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:57', '2020-06-18 23:06:57'),
(113, 'CS035', 'Tk Elen', 'IDR', 'Customer', 'Cirebon', 'Celancang', '087829070894', NULL, NULL, NULL, NULL, '087829070894', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:11', '2020-06-18 23:06:11'),
(114, 'CS036', 'Tk Tiga Simpati', 'IDR', 'Customer', 'Cirebon', 'Mundu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:20', '2020-06-18 23:06:20'),
(115, 'CS037', 'Tk Harapan Plastik', 'IDR', 'Customer', 'Cirebon', 'Mundu', '087720062014', NULL, NULL, NULL, NULL, '087720062014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:10', '2020-06-18 23:06:10'),
(116, 'CS038', 'Jaya Utama Plastik', 'IDR', 'Customer', 'Cirebon', 'Astanajapura', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:18', '2020-06-18 23:06:18'),
(117, 'CS039', 'Mamah Super', 'IDR', 'Customer', 'Cirebon', 'Mertapada', '085221767555', NULL, NULL, NULL, NULL, '085221767555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:37', '2020-06-18 23:06:37'),
(118, 'CS040', 'Tk Hj Muriah', 'IDR', 'Customer', 'Cirebon', 'Mertapada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:37', '2020-06-18 23:06:37'),
(119, 'CS041', 'Pa Idin', 'IDR', 'Customer', 'Cirebon', 'Pasar Lemah abang', '081909919569', NULL, NULL, NULL, NULL, '081909919569', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:21', '2020-06-23 23:06:39'),
(120, 'CS042', 'Tk Al Fath', 'IDR', 'Customer', 'Cirebon', 'Sigong Lemah abang', '082292048890', NULL, NULL, NULL, NULL, '082292048890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:01', '2020-06-18 23:06:01'),
(121, 'CS043', 'Tk Akila', 'IDR', 'Customer', 'Cirebon', 'Karangsembung', '081564639672', NULL, NULL, NULL, NULL, '081564639672', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:31', '2020-06-18 23:06:31'),
(122, 'CS044', 'Tk Makmur Jaya', 'IDR', 'Customer', 'Cirebon', 'Karangsembung', '081222122233', NULL, NULL, NULL, NULL, '081222122233', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:02', '2020-06-18 23:06:02'),
(123, 'CS045', 'Dewangga', 'IDR', 'Customer', 'Cirebon', 'Cikulak Pabuaran', '088972109015', NULL, NULL, NULL, NULL, '088972109015', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:07', '2020-06-18 23:06:07'),
(124, 'CS046', 'Ibu Nanih', 'IDR', 'Customer', 'Cirebon', 'Pasar Pabuaran', '083106984994', NULL, NULL, NULL, NULL, '083106984994', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:08', '2020-06-18 23:06:08'),
(125, 'CS047', 'Jembar Plastik', 'IDR', 'Customer', 'Cirebon', 'Pabuaran', '081383197344', NULL, NULL, NULL, NULL, '081383197344', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:48', '2020-06-18 23:06:48'),
(126, 'CS048', 'Pa Durja', 'IDR', 'Customer', 'Cirebon', 'Pabuaran', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:27', '2020-06-18 23:06:27'),
(127, 'CS049', 'Tk Nafa', 'IDR', 'Customer', 'Cirebon', 'Babakan pabuaran', '082214113767', NULL, NULL, NULL, NULL, '082214113767', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:27', '2020-06-18 23:06:27'),
(128, 'CS050', 'Tk Adam/ibu Yani', 'IDR', 'Customer', 'Cirebon', 'Pabuaran', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:40', '2020-06-18 23:06:40'),
(129, 'CS051', 'Tiara Plastik', 'IDR', 'Customer', 'Cirebon', 'Pabuaran', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-18 23:06:09', '2020-06-18 23:06:09'),
(130, 'CS052', 'Tk Kampeng', 'IDR', 'Customer', 'Cirebon', 'Ciledug', '08170242222', NULL, NULL, NULL, NULL, '08170242222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:48', '2020-06-19 00:06:48'),
(131, 'CS053', 'Tk Sinar Plastik', 'IDR', 'Customer', 'Cirebon', 'Ciledug', '089660228707', NULL, NULL, NULL, NULL, '089660228707', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:12', '2020-06-19 00:06:53'),
(132, 'CS054', 'Tk Dante Jaya', 'IDR', 'Customer', 'Cirebon', 'Pasar Ciledug', '085974778485', NULL, NULL, NULL, NULL, '085974778485', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:28', '2020-06-19 00:06:28'),
(133, 'CS055', 'TK Jupri', 'IDR', 'Customer', 'Cirebon', 'Pasar Ciledug', '081294127897', NULL, NULL, NULL, NULL, '081294127897', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:17', '2020-06-19 00:06:17'),
(134, 'CS056', 'Ibu Acih', 'IDR', 'Customer', 'Cirebon', 'Pasar Ciledug', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:53', '2020-06-19 00:06:53'),
(135, 'CS057', 'Tk Rudi', 'IDR', 'Customer', NULL, 'Pasar Larangan', '082324414796', NULL, NULL, NULL, NULL, '082324414796', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:06', '2020-06-19 00:06:06'),
(136, 'CS058', 'Tk Kancil', 'IDR', 'Customer', 'Indramayu', 'Kedokan Indramayu', '085222077808', NULL, NULL, NULL, NULL, '085222077808', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:17', '2020-06-19 00:06:17'),
(137, 'CS059', 'Tk Ade Fitri', 'IDR', 'Customer', 'Indramayu', 'Pasar Karangampel', '087718854002', NULL, NULL, NULL, NULL, '087718854002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:08', '2020-06-19 00:06:08'),
(138, 'CS060', 'Tk Lani/sigit', 'IDR', 'Customer', 'Indramayu', 'Pasar baru indramayu', '08989894631', NULL, NULL, NULL, NULL, '08989894631', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:08', '2020-06-19 00:06:08'),
(139, 'CS061', 'Ibu Rifa', 'IDR', 'Customer', 'Indramayu', 'Pasar baru indramayu', '081313289131', NULL, NULL, NULL, NULL, '081313289131', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:26', '2020-06-19 00:06:26'),
(140, 'CS062', 'Tk Eca', 'IDR', 'Customer', 'Indramayu', 'Pasar baru indramayu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:31', '2020-06-19 00:06:31'),
(141, 'CS063', 'Pa Imron', 'IDR', 'Customer', 'Indramayu', 'Pasar baru indramayu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:17', '2020-06-19 00:06:17'),
(142, 'CS064', 'Anisa', 'IDR', 'Customer', 'Indramayu', 'Pasar baru indramayu', '0895368962706', NULL, NULL, NULL, NULL, '0895368962706', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:18', '2020-06-19 00:06:18'),
(143, 'CS065', 'Ibu Wiwin', 'IDR', 'Customer', 'Indramayu', 'Pasar baru indramayu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:27', '2020-06-19 00:06:27'),
(144, 'CS066', 'Ibu Wati', 'IDR', 'Customer', 'Indramayu', 'Pasar baru indramayu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:27', '2020-06-19 00:06:27'),
(145, 'CS067', 'Ibu Nur', 'IDR', 'Customer', 'Indramayu', 'Pasar baru indramayu', '08974337978', NULL, NULL, NULL, NULL, '08974337978', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:58', '2020-06-19 00:06:58'),
(146, 'CS068', 'Tk Aneka', 'IDR', 'Customer', 'Indramayu', 'Pasar baru indramayu', '087760635020', NULL, NULL, NULL, NULL, '087760635020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:30', '2020-06-19 00:06:30'),
(147, 'CS069', 'Tk Sumber Plastik', 'IDR', 'Customer', 'Indramayu', 'Pasar baru indramayu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:25', '2020-06-19 00:06:25'),
(148, 'CS070', 'Setia Putra', 'IDR', 'Customer', 'Indramayu', 'Pasar baru indramayu', '085352278238', NULL, NULL, NULL, NULL, '085352278238', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:04', '2020-06-19 00:06:04'),
(149, 'CS071', 'Tk Larissa', 'IDR', 'Customer', 'Indramayu', 'Pasar baru indramayu', '089615565855', NULL, NULL, NULL, NULL, '089615565855', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:40', '2020-06-19 00:06:40'),
(150, 'CS072', 'Tk Gilang', 'IDR', 'Customer', 'Indramayu', 'Pasar baru indramayu', '087723794111', NULL, NULL, NULL, NULL, '087723794111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:11', '2020-06-19 00:06:11'),
(151, 'CS073', 'Tk Garuda Plastik', 'IDR', 'Customer', 'Indramayu', 'garuda,indramayu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 00:06:45', '2020-06-19 00:06:45'),
(152, 'CS074', 'Tk Anugerah 29', 'IDR', 'Customer', 'Indramayu', 'garuda,indramayu', '085900049606', NULL, NULL, NULL, NULL, '085900049606', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:10', '2020-06-19 01:06:10'),
(153, 'CS075', 'H Udin', 'IDR', 'Customer', 'Indramayu', 'Pasar Kertasmaya', '081222137403', NULL, NULL, NULL, NULL, '081222137403', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:40', '2020-06-19 01:06:40'),
(154, 'CS076', 'Ibu Munah', 'IDR', 'Customer', 'Indramayu', 'Pasar Kertasmaya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:27', '2020-06-19 01:06:27'),
(155, 'CS077', 'Tk Mafaza', 'IDR', 'Customer', 'Indramayu', 'Widasari, jatibarang', '087725343081', NULL, NULL, NULL, NULL, '087725343081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:09', '2020-06-19 01:06:09'),
(156, 'CS078', 'Sani', 'IDR', 'Customer', 'Indramayu', 'Tugu', '089691722827', NULL, NULL, NULL, NULL, '089691722827', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:45', '2020-06-19 01:06:45'),
(157, 'CS079', 'Lea sosis', 'IDR', 'Customer', 'Indramayu', 'Pasar lelea', '087848752404', NULL, NULL, NULL, NULL, '087848752404', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:00', '2020-06-19 01:06:00'),
(158, 'CS080', 'Bunda Sosis', 'IDR', 'Customer', 'Indramayu', 'Pasar Terisi', '081320993606', NULL, NULL, NULL, NULL, '081320993606', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:31', '2020-06-19 01:06:31'),
(159, 'CS081', 'Pa Lukman', 'IDR', 'Customer', 'Indramayu', 'Pasar Terisi', '082128663490', NULL, NULL, NULL, NULL, '082128663490', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:49', '2020-06-19 01:06:49'),
(160, 'CS082', 'Ibu Hj. Titi', 'IDR', 'Customer', 'Indramayu', 'Pasar Terisi', '082119677222', NULL, NULL, NULL, NULL, '082119677222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:15', '2020-06-19 01:06:15'),
(161, 'CS083', 'Mawar sari', 'IDR', 'Customer', 'Indramayu', 'Terisi', '085221926729', NULL, NULL, NULL, NULL, '085221926729', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:49', '2020-06-19 01:06:49'),
(162, 'CS084', 'Tk Afika', 'IDR', 'Customer', 'Indramayu', 'Depan Lap.bola Terisi', '082126666737', NULL, NULL, NULL, NULL, '082126666737', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:49', '2020-06-19 01:06:49'),
(163, 'CS085', 'Fitri Plastik', 'IDR', 'Customer', 'Indramayu', 'Rajasinga,terisi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:06', '2020-06-19 01:06:06'),
(164, 'CS086', 'Maulana sosis', 'IDR', 'Customer', 'Indramayu', 'Pasar gabus', '081313249767', NULL, NULL, NULL, NULL, '081313249767', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:31', '2020-06-19 01:06:31'),
(165, 'CS087', 'Tk Bagus', 'IDR', 'Customer', 'Indramayu', 'Gabus. karangsinom', '085559133616', NULL, NULL, NULL, NULL, '085559133616', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:11', '2020-06-19 01:06:11'),
(166, 'CS088', 'Tk Family Plastik', 'IDR', 'Customer', 'Indramayu', 'Parean', '087882956458', NULL, NULL, NULL, NULL, '087882956458', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:45', '2020-06-19 01:06:45'),
(167, 'CS089', 'Ade Sosis', 'IDR', 'Customer', 'Indramayu', 'Pasar Eretan', '085217301946', NULL, NULL, NULL, NULL, '085217301946', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:00', '2020-06-19 01:06:00'),
(168, 'CS090', 'Rosita', 'IDR', 'Customer', 'Indramayu', 'Anjatan, Patrol', '085956559658', NULL, NULL, NULL, NULL, '085956559658', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:11', '2020-06-19 01:06:11'),
(169, 'CS091', 'Tk aneka Plastik', 'IDR', 'Customer', 'Indramayu', 'Gabus wetan', '081947019793', NULL, NULL, NULL, NULL, '081947019793', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:02', '2020-06-19 01:06:02'),
(170, 'CS092', 'Mulya sejati', 'IDR', 'Customer', 'Indramayu', 'Wanguk', '085224925679', NULL, NULL, NULL, NULL, '085224925679', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:57', '2020-06-19 01:06:57'),
(171, 'CS093', 'Tk Hanaputri', 'IDR', 'Customer', 'Cirebon', 'Ketanggungan', '081542108710', NULL, NULL, NULL, NULL, '081542108710', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:06', '2020-06-19 01:06:06'),
(172, 'CS094', 'Tk Jempol', 'IDR', 'Customer', NULL, 'Sitanggal,brebes', '085640046960', NULL, NULL, NULL, NULL, '085640046960', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:44', '2020-06-19 01:06:44'),
(173, 'CS095', 'Tk NF', 'IDR', 'Customer', 'Cirebon', 'Pasar Minggu Palimanan', '085224242449', NULL, NULL, NULL, NULL, '085224242449', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:31', '2020-06-19 01:06:31'),
(174, 'CS096', 'Tk Aira', 'IDR', 'Customer', 'Majalengka', 'Ciparay. leuwimunding', '082156160133', NULL, NULL, NULL, NULL, '082156160133', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:54', '2020-06-19 01:06:54'),
(175, 'K002', 'Kasum', 'IDR', 'Pegawai', 'Majalengka', 'Dusun Jahalaksana Ds.Palasah', '082320272575', NULL, NULL, NULL, NULL, '082320272575', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 01:06:20', '2020-06-19 01:06:20'),
(176, 'CS097', 'Lili Plastik', 'IDR', 'Customer', 'Majalengka', 'Pasar ciborelang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 18:06:34', '2020-06-19 18:06:34'),
(177, 'CS098', 'Tk Cemerlang', 'IDR', 'Customer', 'Majalengka', 'Mekarsari Jatiwangi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 18:06:38', '2020-06-19 18:06:38'),
(178, 'CS099', 'H Elnit', 'IDR', 'Customer', 'Majalengka', 'Sukaraja', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 18:06:37', '2020-06-19 18:06:37'),
(179, 'CS100', 'Amanah', 'IDR', 'Customer', 'Majalengka', 'Pasar Cigasong', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 18:06:26', '2020-06-19 18:06:26'),
(180, 'CS101', 'Mekar jaya', 'IDR', 'Customer', 'Majalengka', 'Pasar Cigasong', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 18:06:15', '2020-06-19 18:06:15'),
(181, 'CS102', 'Mega Jaya', 'IDR', 'Customer', 'Majalengka', 'Pasar Mambo, Majalengka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 18:06:56', '2020-06-19 18:06:56'),
(182, 'CS103', 'Tk 2 Dara', 'IDR', 'Customer', 'Majalengka', 'Majalengka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 18:06:20', '2020-06-19 18:06:31'),
(183, 'CS104', 'Mimi Makmur', 'IDR', 'Customer', 'Majalengka', 'Majalengka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 18:06:09', '2020-06-19 18:06:09'),
(184, 'CS105', 'Tk Naufa', 'IDR', 'Customer', 'Majalengka', 'Jl.Pahlawan, Majalengka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 18:06:54', '2020-06-19 18:06:54'),
(185, 'CS106', 'Tk Athar', 'IDR', 'Customer', 'Majalengka', 'Cijati, Majalengka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:50', '2020-06-19 19:06:50'),
(186, 'CS107', 'Tk Yoga', 'IDR', 'Customer', 'Majalengka', 'Pasar Minggu Palimanan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:37', '2020-06-19 19:06:37'),
(187, 'CS108', 'Zio', 'IDR', 'Customer', 'Cirebon', 'Zemaras, Cirebon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:42', '2020-06-19 19:06:42'),
(188, 'CS109', 'Tk Bintang', 'IDR', 'Customer', 'Indramayu', 'Jatibarang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:40', '2020-06-19 19:06:40'),
(189, 'CS110', 'Andri', 'IDR', 'Customer', 'Indramayu', 'Pasar Jatibarang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:50', '2020-06-19 19:06:50'),
(190, 'CS111', 'Tk Makmur', 'IDR', 'Customer', 'Indramayu', 'Pasar Jatibarang', '087879625550', NULL, NULL, NULL, NULL, '087879625550', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:39', '2020-06-23 23:06:34'),
(191, 'CS112', 'Pa.Hadi', 'IDR', 'Customer', 'Indramayu', 'Pasar Bangkir', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:44', '2020-06-19 19:06:44'),
(192, 'CS113', 'Tk Arofah', 'IDR', 'Customer', 'Indramayu', 'Sindang, Indramayu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:59', '2020-06-19 19:06:59'),
(193, 'CS114', 'Maria', 'IDR', 'Customer', 'Indramayu', 'Pasar baru indramayu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:55', '2020-06-19 19:06:55'),
(194, 'CS115', 'Ibu Khotob', 'IDR', 'Customer', 'Indramayu', 'Pasar Karangampel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:06', '2020-06-19 19:06:06'),
(195, 'CS116', 'Hj. Lia', 'IDR', 'Customer', 'Indramayu', 'Pasar Karangampel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:50', '2020-06-19 19:06:50'),
(196, 'CS117', 'Mitra Family', 'IDR', 'Customer', 'Indramayu', 'Karang ampel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:03', '2020-06-19 19:06:03'),
(197, 'CS118', 'Tk Mekar', 'IDR', 'Customer', 'Indramayu', 'Karang ampel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:21', '2020-06-19 19:06:21'),
(198, 'CS119', 'Pa. Majid', 'IDR', 'Customer', 'Cirebon', 'Pejagan asem', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:02', '2020-06-19 19:06:02'),
(199, 'CS120', 'Tk. Aneka Kersana', 'IDR', 'Customer', NULL, 'Kersana, Brebes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:07', '2020-06-19 19:06:07'),
(200, 'CS121', 'Tk Aneka bj', 'IDR', 'Customer', NULL, 'Banjarharjo, Brebes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:26', '2020-06-19 19:06:26'),
(201, 'CS122', 'Tk Karunia bj', 'IDR', 'Customer', NULL, 'Belakang jogja, Ketanggungan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:05', '2020-06-19 19:06:05'),
(202, 'CS123', 'Ibu Khoriah', 'IDR', 'Customer', NULL, 'Ketanggungan, Brebes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:50', '2020-06-19 19:06:50'),
(203, 'CS124', 'Tk Aneka Plastik', 'IDR', 'Customer', NULL, 'Sitanggal,brebes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:23', '2020-06-19 19:06:23'),
(204, 'CS125', 'Tk Sanmar', 'IDR', 'Customer', NULL, 'Sitanggal,brebes', '085741701730', NULL, NULL, NULL, NULL, '085741701730', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:17', '2020-06-19 20:06:05'),
(205, 'CS126', 'Tk HN Plastik', 'IDR', 'Customer', NULL, 'Brebes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 19:06:36', '2020-06-19 19:06:36'),
(206, 'CS127', 'Tk Cahaya Surya', 'IDR', 'Customer', NULL, 'Tegal', '08996682445', NULL, NULL, NULL, NULL, '08996682445', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 20:06:45', '2020-06-19 20:06:45'),
(207, 'CS128', 'Tk. Salim', 'IDR', 'Customer', NULL, 'Slawi, Jawa tengah', '082313870378', NULL, NULL, NULL, NULL, '082313870378', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 20:06:42', '2020-06-19 20:06:42'),
(208, 'CS129', 'Setia Jaya', 'IDR', 'Customer', NULL, 'Tegal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 20:06:47', '2020-06-19 20:06:47'),
(209, 'CS130', 'Ibu Euis', 'IDR', 'Customer', NULL, 'Brebes', '085295246211', NULL, NULL, NULL, NULL, '085317817224', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 20:06:04', '2020-06-24 00:06:42'),
(210, 'CS131', 'Bang Agus', 'IDR', 'Customer', 'Cirebon', 'Tangkil, Cirebon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 20:06:01', '2020-06-19 20:06:01'),
(211, 'CS132', 'Tk Bilqis', 'IDR', 'Customer', 'Cirebon', 'Tangkil, Cirebon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 20:06:32', '2020-06-19 20:06:32'),
(212, 'CS133', 'Sinar Pelangi', 'IDR', 'Customer', 'Cirebon', 'Arjawinangun, Cirebon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 20:06:48', '2020-06-19 20:06:48'),
(213, 'CS134', 'Ibu Ayu', 'IDR', 'Customer', 'Cirebon', 'Pasar Arjawinangun, Cirebon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 20:06:36', '2020-06-19 20:06:36'),
(214, 'CS135', 'Ibu Rokidah', 'IDR', 'Customer', 'Cirebon', 'Pasar Arjawinangun, Cirebon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 20:06:10', '2020-06-19 20:06:10'),
(215, 'CS136', 'Ibu Uti', 'IDR', 'Customer', 'Cirebon', 'Pasar Arjawinangun, Cirebon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 20:06:14', '2020-06-19 20:06:14'),
(216, 'CS137', 'Berkah', 'IDR', 'Customer', 'Cirebon', 'Pasar Minggu Palimanan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 20:06:56', '2020-06-19 20:06:56'),
(217, 'CS138', 'Tk Rudi', 'IDR', 'Customer', 'Cirebon', 'Pasar Minggu Palimanan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 20:06:35', '2020-06-19 20:06:35'),
(218, 'CS139', 'Yoga', 'IDR', 'Customer', 'Cirebon', 'Pasar Minggu Palimanan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 20:06:05', '2020-06-19 20:06:05'),
(219, 'CS140', 'Ibu Sukiti', 'IDR', 'Customer', 'Cirebon', 'Pasar Minggu Palimanan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 20:06:42', '2020-06-19 20:06:42'),
(220, 'CS141', 'Tk Hijau Fortune', 'IDR', 'Customer', 'Cirebon', 'Pasar Kramat, Cirebon', '0817424499', NULL, NULL, NULL, NULL, '0817424499', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 20:06:25', '2020-06-19 20:06:25'),
(221, 'CS142', 'Tk Laksana', 'IDR', 'Customer', 'Cirebon', 'Pasar Kramat, Cirebon', '083823111650', NULL, NULL, NULL, NULL, '083823111650', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 20:06:29', '2020-06-19 20:06:29'),
(222, 'CS143', 'Tk Al-Barokah', 'IDR', 'Customer', 'Cirebon', 'Sumber, Cirebon', '082320002935', NULL, NULL, NULL, NULL, '082320002935', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 20:06:03', '2020-06-19 20:06:03'),
(223, 'CS144', 'Tk Sumber Plastik', 'IDR', 'Customer', 'Cirebon', 'Sumber, Cirebon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 20:06:14', '2020-06-19 20:06:14'),
(224, 'CS145', 'HJ. Djaja', 'IDR', 'Customer', 'Cirebon', 'Sumber, Cirebon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 20:06:43', '2020-06-19 20:06:43'),
(225, 'CS146', 'Tk Dewi 21', 'IDR', 'Customer', 'Cirebon', 'Sumber, Cirebon', '082321302818', NULL, NULL, NULL, NULL, '082321302818', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 20:06:29', '2020-06-19 20:06:29'),
(226, 'CS147', 'Mba Upi', 'IDR', 'Customer', 'Cirebon', 'Megu,Plered cirebon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 22:06:59', '2020-06-19 22:06:59'),
(227, 'CS148', 'Pandawa', 'IDR', 'Customer', 'Cirebon', 'Plered, Cirebon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 22:06:46', '2020-06-19 22:06:46'),
(228, 'CS149', 'Maryam', 'IDR', 'Customer', 'Cirebon', 'Plered, Cirebon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 22:06:22', '2020-06-19 22:06:22'),
(229, 'CS150', 'Ibu Sri', 'IDR', 'Customer', 'Cirebon', 'Plered, Cirebon', '085317817224', NULL, NULL, NULL, NULL, '085317817224', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 22:06:53', '2020-06-23 23:06:47'),
(230, 'CS151', 'Dika Jaya', 'IDR', 'Customer', 'Cirebon', 'Tengah tani, Plered', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 22:06:31', '2020-06-19 22:06:31'),
(231, 'CS152', 'Tk 21', 'IDR', 'Customer', 'Cirebon', 'Kalitanjung, Cirebon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 22:06:16', '2020-06-19 22:06:16'),
(232, 'CS153', 'Tk Makmur', 'IDR', 'Customer', 'Cirebon', 'Kalitanjung, Cirebon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 22:06:21', '2020-06-19 22:06:21'),
(233, 'CS154', 'Tk Larisa', 'IDR', 'Customer', 'Cirebon', 'Pasar Minggu Palimanan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 22:06:15', '2020-06-19 22:06:15'),
(234, 'CS155', 'Tk Salsabel', 'IDR', 'Customer', 'Cirebon', 'Plered, Cirebon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 22:06:06', '2020-06-19 22:06:06'),
(235, 'K003', 'Nandang', 'IDR', 'Pegawai', 'Majalengka', 'Dusun Jahalaksana Ds.Palasah', '081223757317', NULL, NULL, NULL, NULL, '081223757317', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 22:06:50', '2020-06-19 22:06:50'),
(236, 'K004', 'Jejen', 'IDR', 'Pegawai', 'Majalengka', 'Ds.Panjalin kidul', '085321129058', NULL, NULL, NULL, NULL, '085321129058', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 22:06:26', '2020-06-19 22:06:26'),
(237, 'K005', 'ikhwan', 'IDR', 'Seles', NULL, 'Ds. Lewikujang leuwimunding', '085319252364', 'Sales', NULL, NULL, NULL, '085319252364', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 22:06:23', '2020-08-16 02:08:06'),
(238, 'CS156', 'Tk Dirga Jaya', 'IDR', 'Customer', NULL, 'Tegal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 22:06:02', '2020-06-19 22:06:02'),
(239, 'CS157', 'Tk Teratai', 'IDR', 'Customer', 'Cirebon', 'Sumber, Cirebon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-19 23:06:52', '2020-06-19 23:06:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontak_details`
--

CREATE TABLE `kontak_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `kontak_id` int(10) DEFAULT NULL,
  `kode_kontak` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kota1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_pos1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `negara1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat_pengiraman1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat_pengiraman2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kota2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_pos2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `negara2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kontak2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kontak_details`
--

INSERT INTO `kontak_details` (`id`, `kontak_id`, `kode_kontak`, `alamat1`, `alamat2`, `kota1`, `kode_pos1`, `negara1`, `alamat_pengiraman1`, `alamat_pengiraman2`, `kota2`, `kode_pos2`, `negara2`, `kontak2`, `catatan`, `photo`, `created_at`, `updated_at`) VALUES
(77, 77, 'SP001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 78, 'CS001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 79, 'K001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 80, 'cs002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 81, 'CS003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 82, 'CS004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 83, 'CS005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 84, 'CS006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 85, 'CS007', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 86, 'CS008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 87, 'CS009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 88, 'CS010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 89, 'CS011', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 90, 'CS012', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 91, 'CS013', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 92, 'CS014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 93, 'CS015', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 94, 'CS016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 95, 'CS017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, 96, 'CS018', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 97, 'CS019', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, 98, 'CS020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 99, 'CS021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, 100, 'CS022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 101, 'CS023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 102, 'CS024', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, 103, 'CS025', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, 104, 'CS026', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(105, 105, 'CS027', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 106, 'CS028', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(107, 107, 'CS029', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 108, 'CS030', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 109, 'CS031', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, 110, 'CS032', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, 111, 'CS034', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, 112, 'CS034', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, 113, 'CS035', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 114, 'CS036', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, 115, 'CS037', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(116, 116, 'CS038', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(117, 117, 'CS039', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, 118, 'CS040', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(119, 119, 'CS041', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 120, 'CS042', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, 121, 'CS043', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, 122, 'CS044', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, 123, 'CS045', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(124, 124, 'CS046', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(125, 125, 'CS047', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(126, 126, 'CS048', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(127, 127, 'CS049', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(128, 128, 'CS050', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(129, 129, 'CS051', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(130, 130, 'CS052', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, 131, 'CS054', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(132, 132, 'CS054', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(133, 133, 'CS055', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(134, 134, 'CS056', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(135, 135, 'CS057', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(136, 136, 'CS058', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(137, 137, 'CS059', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(138, 138, 'CS060', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(139, 139, 'CS061', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(140, 140, 'CS062', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(141, 141, 'CS063', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(142, 142, 'CS064', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(143, 143, 'CS065', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(144, 144, 'CS066', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(145, 145, 'CS067', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(146, 146, 'CS068', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(147, 147, 'CS069', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(148, 148, 'CS070', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(149, 149, 'CS071', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(150, 150, 'CS072', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(151, 151, 'CS073', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(152, 152, 'CS074', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(153, 153, 'CS075', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(154, 154, 'CS076', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(155, 155, 'CS077', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(156, 156, 'CS078', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(157, 157, 'CS079', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(158, 158, 'CS080', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(159, 159, 'CS081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(160, 160, 'CS082', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(161, 161, 'CS083', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(162, 162, 'CS084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(163, 163, 'CS085', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(164, 164, 'CS086', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(165, 165, 'CS087', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(166, 166, 'CS088', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(167, 167, 'CS089', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(168, 168, 'CS090', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(169, 169, 'CS091', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(170, 170, 'CS092', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(171, 171, 'CS093', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(172, 172, 'CS094', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(173, 173, 'CS095', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(174, 174, 'CS096', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(175, 175, 'K002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(176, 176, 'CS097', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(177, 177, 'CS098', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(178, 178, 'CS099', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(179, 179, 'CS100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(180, 180, 'CS101', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(181, 181, 'CS102', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(182, 182, '103', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(183, 183, 'CS104', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(184, 184, 'CS105', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(185, 185, 'CS106', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(186, 186, 'CS107', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(187, 187, 'CS108', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(188, 188, 'CS109', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(189, 189, 'CS110', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(190, 190, 'CS111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(191, 191, 'CS112', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(192, 192, 'CS113', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(193, 193, 'CS114', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(194, 194, 'CS115', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(195, 195, 'CS116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(196, 196, 'CS117', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(197, 197, 'CS118', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(198, 198, 'CS119', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(199, 199, 'CS120', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200, 200, 'CS121', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(201, 201, 'CS122', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(202, 202, 'CS123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(203, 203, 'CS124', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(204, 204, 'CS125', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(205, 205, 'CS126', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(206, 206, 'CS127', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(207, 207, 'CS128', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(208, 208, 'CS129', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(209, 209, 'CS130', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(210, 210, 'CS131', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(211, 211, 'CS132', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(212, 212, 'CS133', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(213, 213, 'CS134', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(214, 214, 'CS135', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(215, 215, 'CS136', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(216, 216, 'CS137', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(217, 217, 'CS138', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(218, 218, 'CS139', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(219, 219, 'CS140', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(220, 220, 'CS141', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(221, 221, 'CS142', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(222, 222, 'CS143', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(223, 223, 'CS144', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(224, 224, 'CS145', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(225, 225, 'CS146', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(226, 226, 'CS147', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(227, 227, 'CS148', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(228, 228, 'CS149', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(229, 229, 'CS150', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(230, 230, 'CS151', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(231, 231, 'CS152', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(232, 232, 'CS153', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(233, 233, 'CS154', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(234, 234, 'CS155', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(235, 235, 'K003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(236, 236, 'K004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(237, 237, 'K005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(238, 238, 'CS156', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(239, 239, 'CS157', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kurirs`
--

CREATE TABLE `kurirs` (
  `id_kurir` int(10) NOT NULL,
  `nama_kurir` varchar(64) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_07_12_145959_create_permission_tables', 1),
(4, '2018_03_18_021600_create_uoms_table', 2),
(5, '2018_03_18_021628_create_categories_table', 2),
(6, '2018_03_18_021642_create_products_table', 2),
(7, '2018_03_23_123022_create_departements_table', 3),
(8, '2018_03_23_131055_create_gudangs_table', 4),
(9, '2018_03_24_081154_create_klasifikasis_table', 5),
(10, '2018_03_24_081221_create_sub_klasifikasis_table', 5),
(11, '2018_03_24_082133_create_akuns_table', 5),
(12, '2018_03_25_182641_create_kontaks_table', 6),
(13, '2018_03_25_194449_create_kontak_details_table', 7),
(14, '2018_03_26_215314_create_harga_juals_table', 8),
(15, '2018_04_04_064401_transactions_table', 9),
(16, '2018_04_04_143233_create_pembelians_table', 10),
(17, '2018_04_06_031355_create_pembelian_details_table', 10),
(18, '2018_04_09_115820_create_penjualans_table', 11),
(19, '2018_04_09_184214_create_penjualan_deatails_table', 11),
(20, '2018_04_09_193221_create_transfers_table', 12),
(21, '2018_04_09_193240_create_transfer_details_table', 12),
(22, '2018_04_11_213135_create_pembayarans_table', 12),
(23, '2018_04_11_213208_create_pembayaran_details_table', 12),
(24, '2018_04_12_185331_create_pengeluaran_kas_table', 13),
(25, '2018_04_12_185419_create_pengeluaran_kas_details_table', 13),
(26, '2018_04_12_231957_create_penerimaan_kas_table', 14),
(27, '2018_04_12_232106_create_penerimaan_detail_kas_table', 14),
(29, '2018_04_13_033020_create_transfer_kas_table', 15),
(30, '2018_04_13_220901_create_penyesuaians_table', 16),
(31, '2018_04_13_221017_create_penyesuaian_details_table', 16),
(32, '2018_04_14_063029_create_piutangs_table', 17),
(33, '2018_04_14_063100_create_piutang_details_table', 17),
(34, '2018_05_11_034146_create_produk_uoms_table', 18);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_id`, `model_type`) VALUES
(1, 1, 'App\\User'),
(1, 3, 'App\\User'),
(1, 4, 'App\\User'),
(1, 8, 'App\\User'),
(1, 9, 'App\\User'),
(1, 10, 'App\\User'),
(2, 2, 'App\\User'),
(2, 5, 'App\\User'),
(2, 6, 'App\\User'),
(2, 7, 'App\\User'),
(2, 11, 'App\\User'),
(2, 12, 'App\\User');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayarans`
--

CREATE TABLE `pembayarans` (
  `id` int(10) UNSIGNED NOT NULL,
  `no_reff` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `nilai` int(11) DEFAULT 0,
  `akun_id` int(11) NOT NULL,
  `kontak_id` int(11) NOT NULL,
  `proyek` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departement_id` int(11) NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `denda` int(11) DEFAULT 0,
  `userid` int(11) DEFAULT NULL,
  `is_giro` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_cetak` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_batal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_void` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran_details`
--

CREATE TABLE `pembayaran_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `pembayaran_id` int(11) NOT NULL,
  `no_reff` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pembelian_id` int(11) DEFAULT NULL,
  `saldo` int(11) DEFAULT 0,
  `diskon` int(11) DEFAULT 0,
  `jml_dibayar` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelians`
--

CREATE TABLE `pembelians` (
  `id` int(10) UNSIGNED NOT NULL,
  `kontak_id` int(11) DEFAULT NULL,
  `no_faktur` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_po` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_faktur` date NOT NULL,
  `tgl_jatuh_tempo` date DEFAULT NULL,
  `proyek` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asal_penerimaan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cara_pembelian` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gudang_masuk_id` int(11) DEFAULT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departement_id` int(11) DEFAULT NULL,
  `tanggal_kirim` date DEFAULT NULL,
  `bagian_pembelian` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `denda_terlambat` int(11) DEFAULT 0,
  `debit_kredit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biaya_lain` int(11) DEFAULT 0,
  `total_pajak` int(11) DEFAULT 0,
  `total_setelah_pajak` int(11) DEFAULT 0,
  `uang_muka` int(11) DEFAULT 0,
  `saldo_terutang` float DEFAULT 0,
  `is_tunai` tinyint(1) DEFAULT NULL,
  `is_cetak` tinyint(1) DEFAULT NULL,
  `is_void` tinyint(1) DEFAULT NULL,
  `is_canceled` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pembelians`
--

INSERT INTO `pembelians` (`id`, `kontak_id`, `no_faktur`, `no_po`, `tanggal_faktur`, `tgl_jatuh_tempo`, `proyek`, `asal_penerimaan`, `cara_pembelian`, `lainnya`, `gudang_masuk_id`, `keterangan`, `departement_id`, `tanggal_kirim`, `bagian_pembelian`, `denda_terlambat`, `debit_kredit`, `biaya_lain`, `total_pajak`, `total_setelah_pajak`, `uang_muka`, `saldo_terutang`, `is_tunai`, `is_cetak`, `is_void`, `is_canceled`, `is_deleted`, `created_at`, `updated_at`) VALUES
(29, NULL, 'PB000000018', NULL, '2020-12-30', '2020-12-30', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2020-12-30', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '2020-12-30 08:06:37', '2020-12-30 08:06:37'),
(32, NULL, 'PB000000019', '001', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 2205000, 0, 2205000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 03:01:24', '2021-01-02 03:01:24'),
(35, NULL, 'PB000000022', '003', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 17640000, 0, 17640000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 03:24:45', '2021-01-02 03:24:45'),
(37, NULL, 'PB000000023', '002', '2021-01-02', '2021-01-02', NULL, NULL, 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 218000, 0, 218000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 04:03:56', '2021-01-02 04:03:56'),
(38, NULL, 'PB000000024', '004', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 13950000, 0, 13950000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 04:07:17', '2021-01-02 04:07:17'),
(39, NULL, 'PB000000025', '005', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 4725000, 0, 4725000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 04:10:51', '2021-01-02 04:10:51'),
(42, NULL, 'PB000000026', '006', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 10138000, 0, 10138000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 04:17:57', '2021-01-02 04:17:57'),
(43, NULL, 'PB000000027', '007', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 15853000, 0, 15853000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 04:25:11', '2021-01-02 04:25:11'),
(44, NULL, 'PB000000028', '008', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 13875000, 0, 13875000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 04:30:26', '2021-01-02 04:30:26'),
(45, NULL, 'PB000000029', '009', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 3375000, 0, 3375000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 04:38:48', '2021-01-02 04:38:48'),
(46, NULL, 'PB000000030', '010', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 8910000, 0, 8910000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 04:53:04', '2021-01-02 04:53:04'),
(47, NULL, 'PB000000031', '011', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 1680000, 0, 1680000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 04:54:37', '2021-01-02 04:54:37'),
(48, NULL, 'PB000000032', '012', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 3825000, 0, 3825000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 04:59:43', '2021-01-02 04:59:43'),
(49, NULL, 'PB000000033', '013', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 136000, 0, 136000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 05:09:27', '2021-01-02 05:09:27'),
(50, NULL, 'PB000000034', '014', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 3960000, 0, 3960000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 05:14:24', '2021-01-02 05:14:24'),
(51, NULL, 'PB000000035', '015', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 627000, 0, 627000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 05:18:36', '2021-01-02 05:18:36'),
(52, NULL, 'PB000000036', '016', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 960000, 0, 960000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 05:29:17', '2021-01-02 05:29:17'),
(53, NULL, 'PB000000037', '017', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 3120000, 0, 3120000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 05:30:21', '2021-01-02 05:30:21'),
(54, NULL, 'PB000000038', '018', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 240000, 0, 240000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 05:37:24', '2021-01-02 05:37:24'),
(55, NULL, 'PB000000039', '019', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 240000, 0, 240000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 05:39:30', '2021-01-02 05:39:30'),
(56, NULL, 'PB000000040', '020', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 19844000, 0, 19844000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 06:01:51', '2021-01-02 06:01:51'),
(57, NULL, 'PB000000041', '021', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 24684000, 0, 24684000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 06:04:01', '2021-01-02 06:04:01'),
(58, NULL, 'PB000000042', '022', '2021-01-02', '2021-01-02', NULL, NULL, 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 12342000, 0, 12342000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 06:07:01', '2021-01-02 06:07:01'),
(59, NULL, 'PB000000043', '023', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 34392600, 0, 34392600, NULL, NULL, NULL, NULL, NULL, '2021-01-02 06:52:03', '2021-01-02 06:52:03'),
(60, NULL, 'PB000000044', '024', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 465000, 0, 465000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 06:55:32', '2021-01-02 06:55:32'),
(61, NULL, 'PB000000045', '025', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 4160000, 0, 4160000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 06:57:59', '2021-01-02 06:57:59'),
(62, NULL, 'PB000000046', '026', '2021-01-02', '2021-01-02', NULL, NULL, 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 3444000, 0, 3444000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 07:00:52', '2021-01-02 07:00:52'),
(63, NULL, 'PB000000047', '027', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 246000, 0, 246000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 07:02:05', '2021-01-02 07:02:05'),
(64, NULL, 'PB000000048', '028', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 7820000, 0, 7820000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 07:13:13', '2021-01-02 07:13:13'),
(65, NULL, 'PB000000049', '029', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 460000, 0, 460000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 07:24:00', '2021-01-02 07:24:00'),
(66, NULL, 'PB000000050', '030', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 436000, 0, 436000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 07:29:24', '2021-01-02 07:29:24'),
(67, NULL, 'PB000000051', '031', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 16350000, 0, 16350000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 07:30:42', '2021-01-02 07:30:42'),
(68, NULL, 'PB000000052', '032', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 5520000, 0, 5520000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 07:36:26', '2021-01-02 07:36:26'),
(69, NULL, 'PB000000053', '033', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 1440000, 0, 1440000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 07:51:37', '2021-01-02 07:51:37'),
(70, NULL, 'PB000000054', '034', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 720000, 0, 720000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 07:52:54', '2021-01-02 07:52:54'),
(71, NULL, 'PB000000055', '035', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 400000, 0, 400000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 08:05:01', '2021-01-02 08:05:01'),
(72, NULL, 'PB000000056', '036', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 1592500, 0, 1592500, NULL, NULL, NULL, NULL, NULL, '2021-01-02 08:07:48', '2021-01-02 08:07:48'),
(73, NULL, 'PB000000057', '037', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 11375000, 0, 11375000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 08:08:40', '2021-01-02 08:08:40'),
(74, NULL, 'PB000000058', '038', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 1427250, 0, 1427250, NULL, NULL, NULL, NULL, NULL, '2021-01-02 08:30:24', '2021-01-02 08:30:24'),
(75, NULL, 'PB000000059', '039', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 10560000, 0, 10560000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 08:38:54', '2021-01-02 08:38:54'),
(76, NULL, 'PB000000060', '040', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 10920000, 0, 10920000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 08:40:12', '2021-01-02 08:40:12'),
(77, NULL, 'PB000000061', '041', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 1350000, 0, 1350000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 08:41:27', '2021-01-02 08:41:27'),
(78, NULL, 'PB000000062', '042', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 3300000, 0, 3300000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 08:48:41', '2021-01-02 08:48:41'),
(79, NULL, 'PB000000063', '043', '2021-01-02', '2021-01-02', NULL, NULL, 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 375000, 0, 375000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 09:02:34', '2021-01-02 09:02:34'),
(80, NULL, 'PB000000064', '044', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 1350000, 0, 1350000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 09:03:47', '2021-01-02 09:03:47'),
(81, NULL, 'PB000000065', '045', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 270000, 0, 270000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 09:04:56', '2021-01-02 09:04:56'),
(82, NULL, 'PB000000066', '046', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 2160000, 0, 2160000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 09:06:35', '2021-01-02 09:06:35'),
(83, NULL, 'PB000000067', '047', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 9330000, 0, 9330000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 10:12:41', '2021-01-02 10:12:41'),
(84, NULL, 'PB000000068', '048', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 13787500, 0, 13787500, NULL, NULL, NULL, NULL, NULL, '2021-01-02 10:20:21', '2021-01-02 10:20:21'),
(85, NULL, 'PB000000069', '049', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 4215000, 0, 4215000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 10:25:24', '2021-01-02 10:25:24'),
(86, NULL, 'PB000000070', '050', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 4224000, 0, 4224000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 10:29:26', '2021-01-02 10:29:26'),
(87, NULL, 'PB000000071', '051', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 11970000, 0, 11970000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 10:37:54', '2021-01-02 10:37:54'),
(88, NULL, 'PB000000072', '052', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 990000, 0, 990000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 10:51:08', '2021-01-02 10:51:08'),
(89, NULL, 'PB000000073', '053', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 2950000, 0, 2950000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 11:04:27', '2021-01-02 11:04:27'),
(90, NULL, 'PB000000074', '054', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 97500, 0, 97500, NULL, NULL, NULL, NULL, NULL, '2021-01-02 11:05:49', '2021-01-02 11:05:49'),
(91, NULL, 'PB000000075', '055', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 23494500, 0, 23494500, NULL, NULL, NULL, NULL, NULL, '2021-01-02 11:16:32', '2021-01-02 11:16:32'),
(92, NULL, 'PB000000076', '056', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 6450000, 0, 6450000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 12:37:57', '2021-01-02 12:37:57'),
(93, NULL, 'PB000000077', '057', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 4140000, 0, 4140000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 12:42:07', '2021-01-02 12:42:07'),
(94, NULL, 'PB000000078', '058', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 2700000, 0, 2700000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 12:55:54', '2021-01-02 12:55:54'),
(95, NULL, 'PB000000079', '059', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 5400000, 0, 5400000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 13:00:41', '2021-01-02 13:00:41'),
(96, NULL, 'PB000000080', '060', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 940000, 0, 940000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 13:02:33', '2021-01-02 13:02:33'),
(97, NULL, 'PB000000081', NULL, '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 1681500, 0, 1681500, NULL, NULL, NULL, NULL, NULL, '2021-01-02 13:04:13', '2021-01-02 13:04:13'),
(98, NULL, 'PB000000082', '062', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 6912000, 0, 6912000, NULL, NULL, NULL, NULL, NULL, '2021-01-02 13:09:53', '2021-01-02 13:09:53'),
(99, NULL, 'PB000000082', '062', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-02', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-02 13:11:01', '2021-01-02 13:11:01'),
(100, NULL, 'PB000000083', '063', '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, NULL, 0, 0, 6615000, 0, 6615000, NULL, NULL, NULL, NULL, NULL, '2021-01-04 00:46:19', '2021-01-04 00:46:19'),
(101, NULL, 'PB000000084', '064', '2021-01-04', '2021-01-04', NULL, NULL, 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, NULL, 0, 0, 5355000, 0, 5355000, NULL, NULL, NULL, NULL, NULL, '2021-01-04 00:51:02', '2021-01-04 00:51:02'),
(102, NULL, 'PB000000085', '065', '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, NULL, 0, 0, 4263000, 0, 4263000, NULL, NULL, NULL, NULL, NULL, '2021-01-04 00:55:05', '2021-01-04 00:55:05'),
(103, NULL, 'PB000000086', '066', '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, NULL, 0, 0, 382500, 0, 382500, NULL, NULL, NULL, NULL, NULL, '2021-01-04 00:59:19', '2021-01-04 00:59:19'),
(104, NULL, 'PB000000087', '067', '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, NULL, 0, 0, 28755000, 0, 28755000, NULL, NULL, NULL, NULL, NULL, '2021-01-04 01:03:27', '2021-01-04 01:03:27'),
(105, NULL, 'PB000000088', '068', '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, NULL, 0, 0, 3630000, 0, 3630000, NULL, NULL, NULL, NULL, NULL, '2021-01-04 01:17:49', '2021-01-04 01:17:49'),
(106, NULL, 'PB000000089', '069', '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, NULL, 0, 0, 405000, 0, 405000, NULL, NULL, NULL, NULL, NULL, '2021-01-04 01:20:11', '2021-01-04 01:20:11'),
(107, NULL, 'PB000000090', '70', '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, NULL, 0, 0, 1820000, 0, 1820000, NULL, NULL, NULL, NULL, NULL, '2021-01-04 01:22:54', '2021-01-04 01:22:54'),
(108, NULL, 'PB000000091', '071', '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, NULL, 0, 0, 2070000, 0, 2070000, NULL, NULL, NULL, NULL, NULL, '2021-01-04 01:38:09', '2021-01-04 01:38:09'),
(109, NULL, 'PB000000091', '071', '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '2021-01-04 01:38:22', '2021-01-04 01:38:22'),
(110, NULL, 'PB000000091', '071', '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, NULL, 0, 0, 2070000, 0, 2070000, NULL, NULL, NULL, NULL, NULL, '2021-01-04 01:38:39', '2021-01-04 01:38:39'),
(111, NULL, 'PB000000092', '072', '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, NULL, 0, 0, 2070000, 0, 2070000, NULL, NULL, NULL, NULL, NULL, '2021-01-04 01:41:37', '2021-01-04 01:41:37'),
(112, NULL, 'PB000000093', '073', '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, NULL, 0, 0, 1014000, 0, 1014000, NULL, NULL, NULL, NULL, NULL, '2021-01-04 01:45:37', '2021-01-04 01:45:37'),
(113, NULL, 'PB000000094', '074', '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, NULL, 0, 0, 2600000, 0, 2600000, NULL, NULL, NULL, NULL, NULL, '2021-01-04 01:47:20', '2021-01-04 01:47:20'),
(114, NULL, 'PB000000095', '075', '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, NULL, 0, 0, 1400000, 0, 1400000, NULL, NULL, NULL, NULL, NULL, '2021-01-04 01:50:41', '2021-01-04 01:50:41'),
(115, NULL, 'PB000000096', '076', '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Lainnya', 'TEMPO', 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, '4/2/2021', 0, 0, 42000000, 0, 42000000, NULL, NULL, NULL, NULL, NULL, '2021-01-04 01:55:16', '2021-01-04 01:55:16'),
(116, NULL, 'PB000000097', '077', '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Termin', 'TEMPO', 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, '4/2/2021', 0, 0, 1297500, 0, 1297500, NULL, NULL, NULL, NULL, NULL, '2021-01-04 02:07:41', '2021-01-04 02:07:41'),
(117, NULL, 'PB000000098', '078', '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Termin', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, NULL, 0, 0, 1440000, 0, 1440000, NULL, NULL, NULL, NULL, NULL, '2021-01-04 02:09:05', '2021-01-04 02:09:05'),
(118, NULL, 'PB000000099', '079', '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Termin', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, NULL, 0, 0, 1150000, 0, 1150000, NULL, NULL, NULL, NULL, NULL, '2021-01-04 02:10:42', '2021-01-04 02:10:42'),
(119, NULL, 'PB0000100', '080', '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Termin', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, '4/2/2021', 0, 0, 270000, 0, 270000, NULL, NULL, NULL, NULL, NULL, '2021-01-04 02:12:39', '2021-01-04 02:12:39'),
(120, NULL, 'PB0000100\"}', 'RETUR001', '2021-01-02', '2021-01-02', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, NULL, 0, 0, 335000, 0, 335000, NULL, NULL, NULL, NULL, NULL, '2021-01-04 02:14:46', '2021-01-04 02:14:46'),
(121, NULL, 'PB0000100\\\"', NULL, '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, NULL, 0, 0, 700000, 0, 700000, NULL, NULL, NULL, NULL, NULL, '2021-01-04 02:32:42', '2021-01-04 02:32:42'),
(122, NULL, 'PB0000100\\\\', NULL, '2021-01-04', '2021-01-04', NULL, 'Supplier', 'Cash', NULL, 1, 'PEMBELIAN', 10, '2021-01-04', NULL, NULL, NULL, 0, 0, 224000, 0, 224000, NULL, NULL, NULL, NULL, NULL, '2021-01-04 02:33:49', '2021-01-04 02:33:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_details`
--

CREATE TABLE `pembelian_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `pembelian_id` int(11) NOT NULL,
  `no_faktur` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_produk` int(191) NOT NULL,
  `akun_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_terima` int(11) NOT NULL DEFAULT 0,
  `qty_pesan` int(11) DEFAULT 0,
  `uom_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `harga_beli` int(11) DEFAULT 0,
  `diskon` decimal(8,2) DEFAULT 0.00,
  `total` int(11) DEFAULT 0,
  `pajak` decimal(8,2) DEFAULT 0.00,
  `proyek` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pembelian_details`
--

INSERT INTO `pembelian_details` (`id`, `pembelian_id`, `no_faktur`, `kode_produk`, `akun_id`, `qty_terima`, `qty_pesan`, `uom_id`, `harga_beli`, `diskon`, `total`, `pajak`, `proyek`, `created_at`, `updated_at`) VALUES
(32, 29, 'PB000000018', 125, NULL, 12500, NULL, 'Pcs', 0, 0.00, 0, 0.00, NULL, '2020-12-30 09:06:37', '2020-12-30 09:06:37'),
(35, 32, 'PB000000019', 234, NULL, 9, NULL, 'Dus', 245000, 0.00, 2205000, 0.00, NULL, '2021-01-02 04:01:24', '2021-01-02 04:01:24'),
(38, 35, 'PB000000022', 239, NULL, 98, NULL, 'Ball', 180000, 0.00, 17640000, 0.00, NULL, '2021-01-02 04:24:45', '2021-01-02 04:24:45'),
(40, 37, 'PB000000023', 238, NULL, 1, NULL, 'Dus', 218000, 0.00, 218000, 0.00, NULL, '2021-01-02 05:03:56', '2021-01-02 05:03:56'),
(41, 38, 'PB000000024', 242, NULL, 93, NULL, 'Ball', 150000, 0.00, 13950000, 0.00, NULL, '2021-01-02 05:07:17', '2021-01-02 05:07:17'),
(43, 42, 'PB000000026', 244, NULL, 74, NULL, 'Dus', 137000, 0.00, 10138000, 0.00, NULL, '2021-01-02 05:17:57', '2021-01-02 05:17:57'),
(44, 43, 'PB000000027', 245, NULL, 191, NULL, 'Dus', 83000, 0.00, 15853000, 0.00, NULL, '2021-01-02 05:25:11', '2021-01-02 05:25:11'),
(45, 44, 'PB000000028', 246, NULL, 185, NULL, 'Dus', 75000, 0.00, 13875000, 0.00, NULL, '2021-01-02 05:30:26', '2021-01-02 05:30:26'),
(46, 45, 'PB000000029', 247, NULL, 27, NULL, 'Dus', 125000, 0.00, 3375000, 0.00, NULL, '2021-01-02 05:38:49', '2021-01-02 05:38:49'),
(47, 46, 'PB000000030', 248, NULL, 27, NULL, 'Pilih Satuan', 330000, 0.00, 8910000, 0.00, NULL, '2021-01-02 05:53:04', '2021-01-02 05:53:04'),
(48, 47, 'PB000000031', 249, NULL, 8, NULL, 'Dus', 210000, 0.00, 1680000, 0.00, NULL, '2021-01-02 05:54:37', '2021-01-02 05:54:37'),
(49, 48, 'PB000000032', 139, NULL, 15, NULL, 'Dus', 255000, 0.00, 3825000, 0.00, NULL, '2021-01-02 05:59:43', '2021-01-02 05:59:43'),
(50, 49, 'PB000000033', 126, NULL, 200, NULL, 'Pcs', 680, 0.00, 136000, 0.00, NULL, '2021-01-02 06:09:27', '2021-01-02 06:09:27'),
(51, 50, 'PB000000034', 250, NULL, 24, NULL, 'Dus', 165000, 0.00, 3960000, 0.00, NULL, '2021-01-02 06:14:24', '2021-01-02 06:14:24'),
(52, 51, 'PB000000035', 251, NULL, 2, NULL, 'Pilih Satuan', 313500, 0.00, 627000, 0.00, NULL, '2021-01-02 06:18:36', '2021-01-02 06:18:36'),
(53, 52, 'PB000000036', 252, NULL, 4, NULL, 'Dus', 240000, 0.00, 960000, 0.00, NULL, '2021-01-02 06:29:17', '2021-01-02 06:29:17'),
(54, 53, 'PB000000037', 253, NULL, 13, NULL, 'Dus', 240000, 0.00, 3120000, 0.00, NULL, '2021-01-02 06:30:21', '2021-01-02 06:30:21'),
(55, 54, 'PB000000038', 254, NULL, 1, NULL, 'Dus', 240000, 0.00, 240000, 0.00, NULL, '2021-01-02 06:37:24', '2021-01-02 06:37:24'),
(56, 55, 'PB000000039', 253, NULL, 1, NULL, 'Dus', 240000, 0.00, 240000, 0.00, NULL, '2021-01-02 06:39:30', '2021-01-02 06:39:30'),
(57, 56, 'PB000000040', 260, NULL, 82, NULL, 'Dus', 242000, 0.00, 19844000, 0.00, NULL, '2021-01-02 07:01:51', '2021-01-02 07:01:51'),
(58, 57, 'PB000000041', 99, NULL, 102, NULL, 'Dus', 242000, 0.00, 24684000, 0.00, NULL, '2021-01-02 07:04:01', '2021-01-02 07:04:01'),
(59, 58, 'PB000000042', 100, NULL, 51, NULL, 'Dus', 242000, 0.00, 12342000, 0.00, NULL, '2021-01-02 07:07:01', '2021-01-02 07:07:01'),
(60, 59, 'PB000000043', 269, NULL, 193, NULL, 'Dus', 178200, 0.00, 34392600, 0.00, NULL, '2021-01-02 07:52:03', '2021-01-02 07:52:03'),
(61, 60, 'PB000000044', 270, NULL, 3, NULL, 'Dus', 155000, 0.00, 465000, 0.00, NULL, '2021-01-02 07:55:32', '2021-01-02 07:55:32'),
(62, 61, 'PB000000045', 121, NULL, 13, NULL, 'Dus', 320000, 0.00, 4160000, 0.00, NULL, '2021-01-02 07:57:59', '2021-01-02 07:57:59'),
(63, 62, 'PB000000046', 267, NULL, 14, NULL, 'Dus', 246000, 0.00, 3444000, 0.00, NULL, '2021-01-02 08:00:52', '2021-01-02 08:00:52'),
(64, 63, 'PB000000047', 263, NULL, 1, NULL, 'Dus', 246000, 0.00, 246000, 0.00, NULL, '2021-01-02 08:02:05', '2021-01-02 08:02:05'),
(65, 64, 'PB000000048', 272, NULL, 46, NULL, 'Dus', 170000, 0.00, 7820000, 0.00, NULL, '2021-01-02 08:13:13', '2021-01-02 08:13:13'),
(66, 65, 'PB000000049', 122, NULL, 2, NULL, 'Dus', 230000, 0.00, 460000, 0.00, NULL, '2021-01-02 08:24:00', '2021-01-02 08:24:00'),
(67, 66, 'PB000000050', 273, NULL, 2, NULL, 'Dus', 218000, 0.00, 436000, 0.00, NULL, '2021-01-02 08:29:24', '2021-01-02 08:29:24'),
(68, 67, 'PB000000051', 274, NULL, 75, NULL, 'Dus', 218000, 0.00, 16350000, 0.00, NULL, '2021-01-02 08:30:42', '2021-01-02 08:30:42'),
(69, 68, 'PB000000052', 123, NULL, 24, NULL, 'Dus', 230000, 0.00, 5520000, 0.00, NULL, '2021-01-02 08:36:26', '2021-01-02 08:36:26'),
(70, 69, 'PB000000053', 275, NULL, 6, NULL, 'Pilih Satuan', 240000, 0.00, 1440000, 0.00, NULL, '2021-01-02 08:51:37', '2021-01-02 08:51:37'),
(71, 70, 'PB000000054', 276, NULL, 3, NULL, 'Dus', 240000, 0.00, 720000, 0.00, NULL, '2021-01-02 08:52:54', '2021-01-02 08:52:54'),
(72, 71, 'PB000000055', 278, NULL, 5, NULL, 'Dus', 80000, 0.00, 400000, 0.00, NULL, '2021-01-02 09:05:01', '2021-01-02 09:05:01'),
(73, 72, 'PB000000056', 279, NULL, 7, NULL, 'Dus', 227500, 0.00, 1592500, 0.00, NULL, '2021-01-02 09:07:48', '2021-01-02 09:07:48'),
(74, 73, 'PB000000057', 280, NULL, 25, NULL, 'Dus', 455000, 0.00, 11375000, 0.00, NULL, '2021-01-02 09:08:40', '2021-01-02 09:08:40'),
(75, 74, 'PB000000058', 147, NULL, 1650, NULL, 'Dus', 865, 0.00, 1427250, 0.00, NULL, '2021-01-02 09:30:24', '2021-01-02 09:30:24'),
(76, 75, 'PB000000059', 219, NULL, 24, NULL, 'Dus', 440000, 0.00, 10560000, 0.00, NULL, '2021-01-02 09:38:54', '2021-01-02 09:38:54'),
(77, 76, 'PB000000060', 220, NULL, 24, NULL, 'Dus', 455000, 0.00, 10920000, 0.00, NULL, '2021-01-02 09:40:12', '2021-01-02 09:40:12'),
(78, 77, 'PB000000061', 215, NULL, 5, NULL, 'Dus', 270000, 0.00, 1350000, 0.00, NULL, '2021-01-02 09:41:27', '2021-01-02 09:41:27'),
(79, 78, 'PB000000062', 282, NULL, 10, NULL, 'Dus', 330000, 0.00, 3300000, 0.00, NULL, '2021-01-02 09:48:41', '2021-01-02 09:48:41'),
(80, 79, 'PB000000063', 285, NULL, 1, NULL, 'Dus', 375000, 0.00, 375000, 0.00, NULL, '2021-01-02 10:02:34', '2021-01-02 10:02:34'),
(81, 80, 'PB000000064', 283, NULL, 3, NULL, 'Dus', 450000, 0.00, 1350000, 0.00, NULL, '2021-01-02 10:03:47', '2021-01-02 10:03:47'),
(82, 81, 'PB000000065', 281, NULL, 1, NULL, 'Dus', 270000, 0.00, 270000, 0.00, NULL, '2021-01-02 10:04:57', '2021-01-02 10:04:57'),
(83, 82, 'PB000000066', 284, NULL, 6, NULL, 'Dus', 360000, 0.00, 2160000, 0.00, NULL, '2021-01-02 10:06:35', '2021-01-02 10:06:35'),
(84, 83, 'PB000000067', 146, NULL, 50, NULL, 'Dus', 186600, 0.00, 9330000, 0.00, NULL, '2021-01-02 11:12:41', '2021-01-02 11:12:41'),
(85, 84, 'PB000000068', 286, NULL, 12500, NULL, 'Pcs', 1103, 0.00, 13787500, 0.00, NULL, '2021-01-02 11:20:21', '2021-01-02 11:20:21'),
(86, 85, 'PB000000069', 287, NULL, 5000, NULL, 'Pcs', 843, 0.00, 4215000, 0.00, NULL, '2021-01-02 11:25:24', '2021-01-02 11:25:24'),
(87, 86, 'PB000000070', 288, NULL, 4000, NULL, 'Pcs', 1056, 0.00, 4224000, 0.00, NULL, '2021-01-02 11:29:26', '2021-01-02 11:29:26'),
(88, 87, 'PB000000071', 289, NULL, 420, NULL, 'Ball', 28500, 0.00, 11970000, 0.00, NULL, '2021-01-02 11:37:54', '2021-01-02 11:37:54'),
(89, 88, 'PB000000072', 231, NULL, 55, NULL, 'Ball', 18000, 0.00, 990000, 0.00, NULL, '2021-01-02 11:51:09', '2021-01-02 11:51:09'),
(90, 89, 'PB000000073', 228, NULL, 100, NULL, 'Ball', 29500, 0.00, 2950000, 0.00, NULL, '2021-01-02 12:04:27', '2021-01-02 12:04:27'),
(91, 90, 'PB000000074', 230, NULL, 5, NULL, 'Ball', 19500, 0.00, 97500, 0.00, NULL, '2021-01-02 12:05:49', '2021-01-02 12:05:49'),
(92, 91, 'PB000000075', 192, NULL, 68100, NULL, 'Pcs', 345, 0.00, 23494500, 0.00, NULL, '2021-01-02 12:16:32', '2021-01-02 12:16:32'),
(93, 92, 'PB000000076', 160, NULL, 30, NULL, 'Dus', 215000, 0.00, 6450000, 0.00, NULL, '2021-01-02 13:37:58', '2021-01-02 13:37:58'),
(94, 93, 'PB000000077', 291, NULL, 10, NULL, 'Dus', 414000, 0.00, 4140000, 0.00, NULL, '2021-01-02 13:42:07', '2021-01-02 13:42:07'),
(95, 94, 'PB000000078', 232, NULL, 5, NULL, 'Dus', 540000, 0.00, 2700000, 0.00, NULL, '2021-01-02 13:55:54', '2021-01-02 13:55:54'),
(96, 95, 'PB000000079', 292, NULL, 10, NULL, 'Dus', 540000, 0.00, 5400000, 0.00, NULL, '2021-01-02 14:00:41', '2021-01-02 14:00:41'),
(97, 96, 'PB000000080', 233, NULL, 4, NULL, 'Ball', 235000, 0.00, 940000, 0.00, NULL, '2021-01-02 14:02:34', '2021-01-02 14:02:34'),
(98, 97, 'PB000000081', 229, NULL, 57, NULL, 'Ball', 29500, 0.00, 1681500, 0.00, NULL, '2021-01-02 14:04:13', '2021-01-02 14:04:13'),
(99, 98, 'PB000000082', 293, NULL, 16, NULL, 'Dus', 432000, 0.00, 6912000, 0.00, NULL, '2021-01-02 14:09:53', '2021-01-02 14:09:53'),
(100, 100, 'PB000000083', 294, NULL, 189, NULL, 'KG', 35000, 0.00, 6615000, 0.00, NULL, '2021-01-04 01:46:19', '2021-01-04 01:46:19'),
(101, 101, 'PB000000084', 295, NULL, 119, NULL, 'KG', 45000, 0.00, 5355000, 0.00, NULL, '2021-01-04 01:51:02', '2021-01-04 01:51:02'),
(102, 102, 'PB000000085', 296, NULL, 147, NULL, 'KG', 29000, 0.00, 4263000, 0.00, NULL, '2021-01-04 01:55:05', '2021-01-04 01:55:05'),
(103, 103, 'PB000000086', 150, NULL, 450, NULL, 'Pcs', 850, 0.00, 382500, 0.00, NULL, '2021-01-04 01:59:19', '2021-01-04 01:59:19'),
(104, 104, 'PB000000087', 297, NULL, 213, NULL, 'Dus', 135000, 0.00, 28755000, 0.00, NULL, '2021-01-04 02:03:27', '2021-01-04 02:03:27'),
(105, 105, 'PB000000088', 298, NULL, 110, NULL, 'Pack', 33000, 0.00, 3630000, 0.00, NULL, '2021-01-04 02:17:49', '2021-01-04 02:17:49'),
(106, 106, 'PB000000089', 302, NULL, 45, NULL, 'Pack', 9000, 0.00, 405000, 0.00, NULL, '2021-01-04 02:20:11', '2021-01-04 02:20:11'),
(107, 107, 'PB000000090', 303, NULL, 140, NULL, 'Pack', 13000, 0.00, 1820000, 0.00, NULL, '2021-01-04 02:22:54', '2021-01-04 02:22:54'),
(108, 108, 'PB000000091', 305, NULL, 0, NULL, 'Pcs', 1400, 0.00, 0, 0.00, NULL, '2021-01-04 02:38:09', '2021-01-04 02:38:09'),
(109, 111, 'PB000000092', 306, NULL, 1800, NULL, 'Pilih Satuan', 1150, 0.00, 2070000, 0.00, NULL, '2021-01-04 02:41:37', '2021-01-04 02:41:37'),
(110, 112, 'PB000000093', 166, NULL, 1950, NULL, 'Pcs', 520, 0.00, 1014000, 0.00, NULL, '2021-01-04 02:45:37', '2021-01-04 02:45:37'),
(111, 113, 'PB000000094', 168, NULL, 2000, NULL, 'Pcs', 1300, 0.00, 2600000, 0.00, NULL, '2021-01-04 02:47:20', '2021-01-04 02:47:20'),
(112, 114, 'PB000000095', 163, NULL, 1400, NULL, 'Pcs', 1000, 0.00, 1400000, 0.00, NULL, '2021-01-04 02:50:41', '2021-01-04 02:50:41'),
(113, 115, 'PB000000096', 164, NULL, 40000, NULL, 'Pcs', 1050, 0.00, 42000000, 0.00, NULL, '2021-01-04 02:55:17', '2021-01-04 02:55:17'),
(114, 116, 'PB000000097', 147, NULL, 1500, NULL, 'Pcs', 865, 0.00, 1297500, 0.00, NULL, '2021-01-04 03:07:43', '2021-01-04 03:07:43'),
(115, 117, 'PB000000098', 149, NULL, 1200, NULL, 'Dus', 1200, 0.00, 1440000, 0.00, NULL, '2021-01-04 03:09:05', '2021-01-04 03:09:05'),
(116, 118, 'PB000000099', 307, NULL, 5, NULL, 'Dus', 230000, 0.00, 1150000, 0.00, NULL, '2021-01-04 03:10:42', '2021-01-04 03:10:42'),
(117, 119, 'PB0000100', 308, NULL, 100, NULL, 'Pcs', 2700, 0.00, 270000, 0.00, NULL, '2021-01-04 03:12:39', '2021-01-04 03:12:39'),
(118, 120, 'PB0000100\"}', 248, NULL, 1, NULL, 'Dus', 335000, 0.00, 335000, 0.00, NULL, '2021-01-04 03:14:46', '2021-01-04 03:14:46'),
(119, 121, 'PB0000100\\\"', 309, NULL, 100, NULL, 'Pack', 7000, 0.00, 700000, 0.00, NULL, '2021-01-04 03:32:42', '2021-01-04 03:32:42'),
(120, 122, 'PB0000100\\\\', 310, NULL, 32, NULL, 'Pack', 7000, 0.00, 224000, 0.00, NULL, '2021-01-04 03:33:49', '2021-01-04 03:33:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerimaan_detail_kas`
--

CREATE TABLE `penerimaan_detail_kas` (
  `id` int(10) UNSIGNED NOT NULL,
  `penerimaan_id` int(11) NOT NULL,
  `akun_id` int(11) NOT NULL,
  `departement_id` int(11) NOT NULL,
  `jml_keluar` int(11) NOT NULL,
  `job` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerimaan_kas`
--

CREATE TABLE `penerimaan_kas` (
  `id` int(10) UNSIGNED NOT NULL,
  `akun_id` int(11) NOT NULL,
  `kontak_id` int(11) NOT NULL,
  `no_cek` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `nilai` int(11) NOT NULL,
  `proyek` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departement_id` int(11) NOT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `is_giro` tinyint(1) DEFAULT NULL,
  `is_cetak` tinyint(1) DEFAULT NULL,
  `is_void` tinyint(1) DEFAULT NULL,
  `is_batal` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `is_discharge` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengeluaran_kas`
--

CREATE TABLE `pengeluaran_kas` (
  `id` int(10) UNSIGNED NOT NULL,
  `akun_id` int(11) NOT NULL,
  `kontak_id` int(11) NOT NULL,
  `no_cek` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `nilai` int(11) NOT NULL,
  `proyek` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departement_id` int(11) NOT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `is_giro` tinyint(1) DEFAULT NULL,
  `is_cetak` tinyint(1) DEFAULT NULL,
  `is_void` tinyint(1) DEFAULT NULL,
  `is_batal` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `is_discharge` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pengeluaran_kas`
--

INSERT INTO `pengeluaran_kas` (`id`, `akun_id`, `kontak_id`, `no_cek`, `tanggal`, `nilai`, `proyek`, `departement_id`, `keterangan`, `userid`, `is_giro`, `is_cetak`, `is_void`, `is_batal`, `is_delete`, `is_discharge`, `created_at`, `updated_at`) VALUES
(1, 2, 79, 'CD000000001', '2018-03-01', 225000, '-', 10, 'Uang dikasihkan ke Nana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-07 21:37:18', '2020-06-07 21:37:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengeluaran_kas_details`
--

CREATE TABLE `pengeluaran_kas_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `pengeluaran_id` int(11) NOT NULL,
  `akun_id` int(11) NOT NULL,
  `departement_id` int(11) NOT NULL,
  `jml_keluar` int(11) NOT NULL,
  `job` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pengeluaran_kas_details`
--

INSERT INTO `pengeluaran_kas_details` (`id`, `pengeluaran_id`, `akun_id`, `departement_id`, `jml_keluar`, `job`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 10, 150000, 'Beli Kabel', '2020-06-08 05:37:18', '2020-06-08 05:37:18'),
(2, 1, 2, 10, 75000, 'Mouse Laptop', '2020-06-08 05:37:18', '2020-06-08 05:37:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualans`
--

CREATE TABLE `penjualans` (
  `id` int(10) UNSIGNED NOT NULL,
  `jenis_penjualan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kontak_id` int(11) DEFAULT NULL,
  `no_faktur` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_po` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_faktur` date NOT NULL,
  `tanggal_jatuh_tempo` datetime DEFAULT NULL,
  `proyek` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gudang_keluar_id` int(11) DEFAULT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departement_id` int(11) DEFAULT NULL,
  `tanggal_kirim` date DEFAULT NULL,
  `sales` int(11) DEFAULT NULL,
  `term_pembayaran` int(11) DEFAULT NULL,
  `debit_kredit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biaya_lain` int(11) DEFAULT 0,
  `total_pajak` int(11) DEFAULT 0,
  `total_setelah_pajak` int(11) DEFAULT 0,
  `uang_muka` int(11) DEFAULT 0,
  `saldo_terutang` int(11) DEFAULT 0,
  `nama_konsumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat_konsumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kota_konsumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desa_konsumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provinsi_konsumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hp_konsumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expedisi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_tunai` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_cetak` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_void` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_canceled` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `penjualans`
--

INSERT INTO `penjualans` (`id`, `jenis_penjualan`, `kontak_id`, `no_faktur`, `no_po`, `tanggal_faktur`, `tanggal_jatuh_tempo`, `proyek`, `gudang_keluar_id`, `keterangan`, `departement_id`, `tanggal_kirim`, `sales`, `term_pembayaran`, `debit_kredit`, `biaya_lain`, `total_pajak`, `total_setelah_pajak`, `uang_muka`, `saldo_terutang`, `nama_konsumen`, `alamat_konsumen`, `kota_konsumen`, `desa_konsumen`, `provinsi_konsumen`, `hp_konsumen`, `expedisi`, `is_tunai`, `is_cetak`, `is_void`, `is_canceled`, `user_id`, `created_at`, `updated_at`) VALUES
(37, '2', 156, '00000000001', NULL, '2021-01-04', '2021-01-18 00:00:00', NULL, 1, NULL, 10, '1970-01-01', 237, NULL, NULL, 0, 0, 1350000, 0, 1350000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, '2021-01-04 02:47:08', '2021-01-04 02:47:08'),
(38, '2', 162, '00000000002', NULL, '2021-01-04', '2021-01-18 00:00:00', NULL, 1, NULL, 10, '1970-01-01', 237, NULL, NULL, 0, 0, 535000, 0, 535000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, '2021-01-04 02:51:34', '2021-01-04 02:51:34'),
(39, '2', 170, '00000000003', NULL, '2021-01-04', '2021-01-18 00:00:00', NULL, 1, NULL, 10, '1970-01-01', 237, NULL, NULL, 0, 0, 5250000, 0, 5250000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, '2021-01-04 02:59:42', '2021-01-04 02:59:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan_deatails`
--

CREATE TABLE `penjualan_deatails` (
  `id` int(10) UNSIGNED NOT NULL,
  `penjualan_id` int(11) NOT NULL,
  `no_faktur` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produk_id` int(11) NOT NULL,
  `akun_id` int(11) NOT NULL,
  `qty_terima` int(11) NOT NULL,
  `qty_pesan` int(11) NOT NULL,
  `uom_id` int(11) NOT NULL,
  `harga_jual` double(8,2) NOT NULL,
  `diskon` decimal(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `pajak` decimal(8,2) NOT NULL,
  `proyek2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan_details`
--

CREATE TABLE `penjualan_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `penjualan_id` int(11) NOT NULL,
  `no_faktur` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produk_id` int(11) NOT NULL,
  `akun_id` int(11) DEFAULT NULL,
  `qty_terima` int(11) DEFAULT 0,
  `qty_pesan` int(11) DEFAULT 0,
  `uom_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `harga_jual` int(11) DEFAULT 0,
  `diskon` decimal(8,2) DEFAULT 0.00,
  `total` int(11) DEFAULT 0,
  `pajak` decimal(8,2) DEFAULT 0.00,
  `proyek2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `penjualan_details`
--

INSERT INTO `penjualan_details` (`id`, `penjualan_id`, `no_faktur`, `produk_id`, `akun_id`, `qty_terima`, `qty_pesan`, `uom_id`, `harga_jual`, `diskon`, `total`, `pajak`, `proyek2`, `created_at`, `updated_at`) VALUES
(75, 37, '00000000001', 276, NULL, 1, NULL, NULL, 350000, 0.00, 350000, NULL, NULL, '2021-01-04 03:47:08', '2021-01-04 03:47:08'),
(76, 37, '00000000001', 237, NULL, 2, NULL, NULL, 300000, 0.00, 600000, NULL, NULL, '2021-01-04 03:47:08', '2021-01-04 03:47:08'),
(77, 37, '00000000001', 121, NULL, 1, NULL, NULL, 400000, 0.00, 400000, NULL, NULL, '2021-01-04 03:47:08', '2021-01-04 03:47:08'),
(78, 38, '00000000002', 294, NULL, 3, NULL, 'KG', 45000, 0.00, 135000, NULL, NULL, '2021-01-04 03:51:34', '2021-01-04 03:51:34'),
(79, 38, '00000000002', 242, NULL, 1, NULL, 'Ball', 180000, 0.00, 180000, NULL, NULL, '2021-01-04 03:51:34', '2021-01-04 03:51:34'),
(80, 38, '00000000002', 146, NULL, 1, NULL, 'Dus', 220000, 0.00, 220000, NULL, NULL, '2021-01-04 03:51:34', '2021-01-04 03:51:34'),
(81, 39, '00000000003', 228, NULL, 20, NULL, 'Ball', 33000, 0.00, 660000, NULL, NULL, '2021-01-04 03:59:42', '2021-01-04 03:59:42'),
(82, 39, '00000000003', 215, NULL, 1, NULL, 'Dus', 300000, 0.00, 300000, NULL, NULL, '2021-01-04 03:59:42', '2021-01-04 03:59:42'),
(83, 39, '00000000003', 289, NULL, 100, NULL, 'Ball', 33000, 0.00, 3300000, NULL, NULL, '2021-01-04 03:59:42', '2021-01-04 03:59:42'),
(84, 39, '00000000003', 229, NULL, 30, NULL, 'Ball', 33000, 0.00, 990000, NULL, NULL, '2021-01-04 03:59:42', '2021-01-04 03:59:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyesuaians`
--

CREATE TABLE `penyesuaians` (
  `id` int(10) UNSIGNED NOT NULL,
  `no_reff` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proyek` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` date NOT NULL,
  `departement_id` int(191) NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gudang_asal` int(11) NOT NULL,
  `gudang_terima` int(11) DEFAULT 0,
  `nilai` int(11) DEFAULT 0,
  `is_cetak` tinyint(1) DEFAULT 0,
  `is_batal` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyesuaian_details`
--

CREATE TABLE `penyesuaian_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `penyesuaian_id` int(11) NOT NULL,
  `no_reff` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produk_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `uom_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `harga_satuan` int(11) DEFAULT NULL,
  `akun_id` int(11) DEFAULT NULL,
  `job` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departement_id` int(191) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Menu Pembelian', 'web', '2018-04-02 17:42:30', '2018-04-02 17:42:44'),
(2, 'Menu Gudang', 'web', '2018-03-17 15:10:30', '2018-03-17 15:10:30'),
(3, 'Menu Penjualan', 'web', '2018-04-02 18:04:54', '2018-04-02 18:05:07'),
(4, 'Menu Kolektor', 'web', '2018-03-17 15:10:30', '2018-03-17 15:10:30'),
(5, 'Menu Keuangan', 'web', '2018-03-17 15:10:30', '2018-03-17 15:10:30'),
(6, 'Menu Master', 'web', '2018-03-17 15:10:30', '2018-03-17 15:10:30'),
(7, 'Menu Laporan', 'web', '2018-04-02 18:04:54', '2018-04-02 18:05:07'),
(8, 'Menu Pengaturan', 'web', '2018-03-17 13:11:05', '2018-03-17 13:11:05'),
(9, 'Lihat UOM', 'web', '2018-03-17 15:23:29', '2018-03-17 15:23:29'),
(10, 'Lihat Kategori', 'web', '2018-03-17 15:23:48', '2018-03-17 15:23:48'),
(11, 'Lihat Produk', 'web', '2018-03-17 15:24:03', '2018-03-17 15:24:03'),
(12, 'Lihat Kontak', 'web', '2018-03-25 07:34:07', '2018-03-25 07:34:07'),
(13, 'Lihat Akun', 'web', '2018-03-24 11:25:55', '2018-03-24 11:25:55'),
(14, 'Lihat Departemen', 'web', '2018-03-23 01:38:01', '2018-03-23 01:38:01'),
(15, 'Lihat Gudang', 'web', '2018-03-23 02:32:39', '2018-03-23 02:32:39'),
(16, 'Lihat Komisi', 'web', '2018-03-23 02:32:39', '2020-07-15 08:31:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `piutangs`
--

CREATE TABLE `piutangs` (
  `id` int(10) UNSIGNED NOT NULL,
  `no_reff` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `nilai` int(11) NOT NULL,
  `akun_id` int(11) NOT NULL,
  `kontak_id` int(11) NOT NULL,
  `proyek` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departement_id` int(11) NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `denda` int(11) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `is_giro` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_cetak` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_batal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_void` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `piutangs`
--

INSERT INTO `piutangs` (`id`, `no_reff`, `tanggal`, `nilai`, `akun_id`, `kontak_id`, `proyek`, `departement_id`, `keterangan`, `denda`, `userid`, `is_giro`, `is_cetak`, `is_batal`, `is_void`, `created_at`, `updated_at`) VALUES
(13, 'CR000000001', '1970-01-01', 400000, 1, 78, NULL, 10, NULL, NULL, 9, NULL, NULL, NULL, NULL, '2020-06-07 21:21:07', '2020-06-07 21:21:07'),
(14, 'CR000000002', '1970-01-01', 400000, 2, 78, NULL, 10, NULL, NULL, 9, NULL, NULL, NULL, NULL, '2020-06-07 21:21:32', '2020-06-07 21:21:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `piutang_details`
--

CREATE TABLE `piutang_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `piutang_id` int(11) NOT NULL,
  `no_reff` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penjualan_id` int(191) NOT NULL,
  `saldo` int(11) NOT NULL DEFAULT 0,
  `diskon` int(11) NOT NULL DEFAULT 0,
  `jml_dibayar` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `piutang_details`
--

INSERT INTO `piutang_details` (`id`, `piutang_id`, `no_reff`, `penjualan_id`, `saldo`, `diskon`, `jml_dibayar`, `created_at`, `updated_at`) VALUES
(6, 13, 'CR000000001', 1, 1400000, 0, 400000, '2020-06-08 05:21:08', '2020-06-08 05:21:08'),
(7, 14, 'CR000000002', 1, 0, 0, 400000, '2020-06-08 05:21:32', '2020-06-08 05:21:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `printer_tab`
--

CREATE TABLE `printer_tab` (
  `id` int(11) NOT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `printer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `printer_tab`
--

INSERT INTO `printer_tab` (`id`, `ip`, `printer`) VALUES
(1, 'AXIOO-NET', 'EPSON TM-U220 Receipt');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_produk` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_produk` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kategori_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_alias` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_alias` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stok` int(11) DEFAULT 0,
  `stok_min` int(11) DEFAULT NULL,
  `harga_beli_satuan` int(11) DEFAULT NULL,
  `pct_harga` float DEFAULT NULL,
  `harga_jual_satuan` int(191) DEFAULT NULL,
  `cash_price` int(11) DEFAULT NULL,
  `supplier_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uom_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pajak_masuk` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pajak_keluar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 0,
  `is_jasa` tinyint(1) DEFAULT 0,
  `photo_produk` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dp` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `nama_produk`, `kode_produk`, `kategori_id`, `kode_alias`, `nama_alias`, `stok`, `stok_min`, `harga_beli_satuan`, `pct_harga`, `harga_jual_satuan`, `cash_price`, `supplier_id`, `uom_id`, `pajak_masuk`, `pajak_keluar`, `is_active`, `is_jasa`, `photo_produk`, `created_at`, `updated_at`, `dp`) VALUES
(99, 'Cup 14 oz hanica', 'Cup 14 oz hanica', 'c010', 'Cup', NULL, NULL, 102, NULL, 242000, NULL, 290000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-11 06:43:23', '2021-01-01 18:01:01', 0),
(100, 'Cup 16 oz hanica', 'Cup 16 oz hanica', 'c011', 'Cup', NULL, NULL, 51, 5, 242000, NULL, 295000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-11 06:45:55', '2021-01-01 18:01:01', 0),
(121, 'Cup 22oz Euro', 'Cup 22oz Euro', 'C024', 'Cup', NULL, NULL, 12, NULL, 320000, NULL, 400000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 00:36:16', '2021-01-04 02:01:08', 0),
(122, 'Cup Ager 50ml OPW', 'Cup Ager 50ml OPW', 'C027', 'Cup', NULL, NULL, 2, 5, 230000, NULL, 290000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 00:38:36', '2021-01-01 19:01:01', 0),
(123, 'Cup onde if', 'Cup onde if', 'C028', 'Cup', NULL, NULL, 48, 5, 230000, NULL, 300000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 00:42:47', '2021-01-01 19:01:26', 0),
(126, 'Mika NS 1A', 'Mika NS 1A', 'M002', 'Mika', NULL, NULL, 200, 100, 680, NULL, 1500, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-24 00:48:20', '2021-01-01 17:01:28', 0),
(129, 'Mika 4 NS', 'Mika 4 NS', 'M005', 'Mika', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 00:56:45', '2020-06-24 00:56:45', 0),
(130, 'Mika 5 NS', 'Mika 5 NS', 'M006', 'Mika', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 00:57:51', '2020-06-24 00:57:51', 0),
(135, 'Mika 5xx Weetan', 'Mika 5xx Weetan', 'M011', 'Mika', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:04:47', '2020-06-24 01:04:47', 0),
(136, 'Mika 3a Weetan', 'Mika 3a Weetan', 'M012', 'Mika', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:06:29', '2020-06-24 01:06:29', 0),
(137, 'Mika 4a Weetan', 'Mika 4a Weetan', 'M013', 'Mika', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:07:10', '2020-06-24 01:07:10', 0),
(138, 'Mika 5a Weetan', 'Mika 5a Weetan', 'M014', 'Mika', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:08:34', '2020-06-24 01:08:34', 0),
(139, 'Mika 6a Weetan', 'Mika 6a Weetan', 'M015', 'Mika', NULL, NULL, 30, 5, 255000, NULL, 300000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:09:10', '2021-01-02 04:01:43', 0),
(140, 'Mika 2A Vip', 'Mika 2A Vip', 'M016', 'Mika', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:11:11', '2020-06-24 01:11:11', 0),
(141, 'Mika 3 vip', 'Mika 3 vip', 'M017', 'Mika', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:11:42', '2020-06-24 01:11:42', 0),
(142, 'Mika 4 vip', 'Mika 4 vip', 'M018', 'Mika', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:12:07', '2020-06-24 01:12:07', 0),
(143, 'Mika 5 vip', 'Mika 5 vip', 'M019', 'Mika', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:12:35', '2020-06-24 01:12:35', 0),
(144, 'Mika 6 vip', 'Mika 6 vip', 'M020', 'Mika', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:13:17', '2020-06-24 01:13:17', 0),
(145, 'Mika 7 vip', 'Mika 7 vip', 'M021', 'Mika', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:14:09', '2020-06-24 01:14:09', 0),
(146, 'Mika 7C NS', 'Mika 7C NS', 'M022', 'Mika', NULL, NULL, 49, 5, 186600, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:15:25', '2021-01-04 02:01:34', 0),
(147, 'Mika siffon 18 TP', 'Mika siffon 18 TP', 'M023', 'Mika', NULL, NULL, 3150, NULL, 865, NULL, 1500, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:17:36', '2021-01-04 02:01:43', 0),
(148, 'Mika siffon 20 SJP', 'Mika siffon 20 SJP', 'M024', 'Mika', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:21:00', '2020-06-24 01:21:00', 0),
(149, 'Mika siffon 22 TP', 'Mika siffon 22 TP', 'M025', 'Mika', NULL, NULL, 1200, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:21:30', '2021-01-04 02:01:05', 0),
(150, 'Mika brownies S', 'Mika brownies S', 'M026', 'Mika', NULL, NULL, 450, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:23:04', '2021-01-04 00:01:19', 0),
(151, 'Mika Brownies M', 'Mika Brownies M', 'M027', 'Mika', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:24:09', '2020-06-24 01:24:09', 0),
(152, 'Mika Brownies L', 'Mika Brownies L', 'M028', 'Mika', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:25:08', '2020-06-24 01:25:08', 0),
(154, 'Sendok bebek bening', 'Sendok bebek bening', 'S002', 'Sendok Plastik', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Ball', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:38:15', '2020-06-24 01:38:15', 0),
(155, 'Sendok makan hepi ( 20 pak )', 'Sendok makan hepi ( 20 pak )', 'S003', 'Sendok Plastik', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:39:46', '2020-06-24 01:39:46', 0),
(156, 'Sendok makan hepi ( 40 Pak )', 'Sendok makan hepi ( 40 Pak )', 'S004', 'Sendok Plastik', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:40:48', '2020-06-24 01:40:48', 0),
(157, 'Sendok makan 3 jeruk', 'Sendok makan 3 jeruk', 'S005', 'Sendok Plastik', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:41:57', '2020-06-24 01:41:57', 0),
(158, 'Sendok stg anggur', 'Sendok stg anggur', 'S006', 'Sendok Plastik', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:43:04', '2020-06-24 01:43:04', 0),
(159, 'Sendok stg bintik', 'Sendok stg bintik', 'S007', 'Sendok Plastik', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:43:44', '2020-06-24 01:43:44', 0),
(160, 'Sendok stb super', 'Sendok stb super', 'S008', 'Sendok Plastik', NULL, NULL, 30, NULL, 215000, NULL, 250000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:44:44', '2021-01-02 00:01:44', 0),
(162, 'Garfu makan 2 jambu', 'Garfu makan 2 jambu', 'G001', 'Sendok Plastik', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-24 01:47:10', '2021-01-01 22:01:43', 0),
(163, 'Dus 16 laminasi simpak', 'Dus 16 laminasi simpak', 'D001', 'Dus', NULL, NULL, 1400, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:16:42', '2021-01-04 01:01:41', 0),
(164, 'dus 18 laminasi simpak', 'dus 18 laminasi simpak', 'D002', 'Dus', NULL, NULL, 40000, 1000, 1050, NULL, 1170, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:18:51', '2021-01-04 01:01:32', 0),
(165, 'dus 20 laminasi simpak', 'dus 20 laminasi simpak', 'D003', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:20:11', '2020-06-25 22:20:11', 0),
(166, 'Dus Pizza 15x15 goden', 'Dus Pizza 15x15 goden', 'D004', 'Dus', NULL, NULL, 1950, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:24:01', '2021-01-04 01:01:37', 0),
(167, 'Dus pizza 22x22', 'Dus pizza 22x22', 'D005', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:25:14', '2020-12-29 18:12:59', 0),
(168, 'Dus pizza 25x25', 'Dus pizza 25x25', 'D006', 'Dus', NULL, NULL, 2000, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:29:31', '2021-01-04 01:01:20', 0),
(170, 'dus 18 motif simpak', 'dus 18 motif simpak', 'D008', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:33:14', '2020-06-25 22:33:14', 0),
(171, 'dus 20 simpak motif', 'dus 20 simpak motif', 'D009', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:33:53', '2020-06-25 22:33:53', 0),
(172, 'Dus donat polos', 'Dus donat polos', 'D010', 'Dus', NULL, NULL, 1750, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:34:37', '2020-12-29 18:12:18', 0),
(173, 'dus snak 12x12 simpak', 'dus snak 12x12 simpak', 'D011', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:36:44', '2020-06-25 22:36:44', 0),
(174, 'dus snak 12x14 simpak', 'dus snak 12x14 simpak', 'D013', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:38:01', '2020-06-25 22:06:27', 0),
(175, 'Dus snak 12x16 simpak', 'Dus snak 12x16 simpak', 'D012', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:38:35', '2020-06-25 22:06:12', 0),
(176, 'dus 16 laminasi dago', 'dus 16 laminasi dago', 'D014', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:40:57', '2020-06-25 22:40:57', 0),
(177, 'dus 18 laminasi dago', 'dus 18 laminasi dago', 'D015', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:41:25', '2020-06-25 22:41:25', 0),
(178, 'dus 20 laminasi dago', 'dus 20 laminasi dago', 'D016', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:41:49', '2020-06-25 22:41:49', 0),
(179, 'dus 16 polos dago', 'dus 16 polos dago', 'D017', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:42:28', '2020-06-25 22:42:28', 0),
(180, 'dus 18 polos dago', 'dus 18 polos dago', 'D018', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:43:09', '2020-06-25 22:43:09', 0),
(181, 'dus 20 polos dago', 'dus 20 polos dago', 'D019', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:43:50', '2020-06-25 22:43:50', 0),
(182, 'dus snak R3 dago', 'dus snak R3 dago', 'D020', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:44:58', '2020-06-25 22:44:58', 0),
(183, 'dus snak 12x12 dago', 'dus snak 12x12 dago', 'D021', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:45:45', '2020-06-25 22:45:45', 0),
(184, 'dus snak 12x14 dago', 'dus snak 12x14 dago', 'D022', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:46:39', '2020-06-25 22:46:39', 0),
(185, 'dus snak 12x16 dago', 'dus snak 12x16 dago', 'D023', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:47:27', '2020-06-25 22:47:27', 0),
(186, 'dus martabak', 'dus martabak', 'D024', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:48:53', '2020-06-25 22:48:53', 0),
(187, 'dus snak 12x14 anecdot', 'dus snak 12x14 anecdot', 'D025', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:49:37', '2020-06-25 22:49:37', 0),
(188, 'dus snak 12x16 anecdot', 'dus snak 12x16 anecdot', 'D026', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:50:11', '2020-06-25 22:50:11', 0),
(189, 'dus 18 laminasi bigbox', 'dus 18 laminasi bigbox', 'D027', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:51:05', '2020-06-25 22:51:05', 0),
(190, 'dus 20 laminasi bigbox', 'dus 20 laminasi bigbox', 'D028', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:51:56', '2020-06-25 22:51:56', 0),
(191, 'dus snak ARNC', 'dus snak ARNC', 'D029', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:53:39', '2020-06-25 22:53:39', 0),
(192, 'dus snak R3 kjp', 'dus snak R3 kjp', 'D030', 'Dus', NULL, NULL, 68100, 1000, 345, NULL, 390, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:54:20', '2021-01-01 23:01:32', 0),
(193, 'dus snak T polos kjp', 'dus snak T polos kjp', 'D031', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:55:23', '2020-06-25 22:55:23', 0),
(194, 'dus 16 polos hoseo', 'dus 16 polos hoseo', 'D032', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:56:29', '2020-06-25 22:56:29', 0),
(195, 'dus 18 polos hoseo', 'dus 18 polos hoseo', 'D033', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 22:56:59', '2020-06-25 22:56:59', 0),
(196, 'dus 20 polos hoseo', 'dus 20 polos hoseo', 'D034', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:00:22', '2020-06-25 23:00:22', 0),
(197, 'dus 16 laminasi hoseo', 'dus 16 laminasi hoseo', 'D035', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:01:45', '2020-06-25 23:01:45', 0),
(198, 'dus 18 laminasi hoseo', 'dus 18 laminasi hoseo', 'D036', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:02:12', '2020-06-25 23:02:12', 0),
(199, 'dus 20 laminasi hoseo', 'dus 20 laminasi hoseo', 'D037', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:02:57', '2020-06-25 23:02:57', 0),
(200, 'dus snak T polos hoseo', 'dus snak T polos hoseo', 'D038', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:04:29', '2020-06-25 23:04:29', 0),
(201, 'dus snak 12x12 hoseo', 'dus snak 12x12 hoseo', 'D039', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:05:31', '2020-06-25 23:05:31', 0),
(202, 'dus snak 12x14 hoseo', 'dus snak 12x14 hoseo', 'D040', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:05:56', '2020-06-25 23:05:56', 0),
(203, 'dus snak 12x16 hoseo', 'dus snak 12x16 hoseo', 'D041', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:06:21', '2020-06-25 23:06:21', 0),
(204, 'dus martabak hoseo', 'dus martabak hoseo', 'D042', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:07:29', '2020-06-25 23:07:29', 0),
(205, 'dus snak R3 bilal', 'dus snak R3 bilal', 'D043', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:09:33', '2020-06-25 23:09:33', 0),
(206, 'dus 25 mja', 'dus 25 mja', 'D044', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:11:08', '2020-06-25 23:11:08', 0),
(207, 'dus 30 mja', 'dus 30 mja', 'D045', 'Dus', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:11:35', '2020-06-25 23:11:35', 0),
(208, 'tutup cembung rigi sukawa', 'tutup cembung rigi sukawa', 'TP001', 'Tutup', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:13:39', '2020-06-25 23:13:39', 0),
(210, 'tutup cembung rigi kezia', 'tutup cembung rigi kezia', 'TP003', 'Tutup', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:14:48', '2020-06-25 23:14:48', 0),
(211, 'tutup datar tjus', 'tutup datar tjus', 'TP004', 'Tutup', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:15:43', '2020-06-25 23:15:43', 0),
(212, 'tutup ager bido', 'tutup ager bido', 'TP005', 'Tutup', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:16:26', '2020-06-25 23:16:26', 0),
(213, 'tutup ager sukawa', 'tutup ager sukawa', 'TP006', 'Tutup', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:16:53', '2020-06-25 23:16:53', 0),
(214, 'DM 200ml', 'DM 200ml', 'TW001', 'Thinwall', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:21:17', '2020-06-25 23:06:38', 0),
(215, 'DM 300ml', 'DM 300ml', 'TW002', 'Thinwall', NULL, NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:21:45', '2021-01-04 02:01:42', 0),
(216, 'DM 350ml', 'DM 350ml', 'TW003', 'Thinwall', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:22:19', '2020-06-25 23:22:19', 0),
(217, 'DM 400ml', 'DM 400ml', 'TW004', 'Thinwall', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:23:36', '2020-06-25 23:23:36', 0),
(218, 'DM 450ml', 'DM 450ml', 'TW005', 'Thinwall', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:25:29', '2020-06-25 23:25:29', 0),
(219, 'DM 500ml', 'DM 500ml', 'TW006', 'Thinwall', NULL, NULL, 24, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:26:00', '2021-01-01 20:01:54', 0),
(220, 'DM 650ml', 'DM 650ml', 'TW007', 'Thinwall', NULL, NULL, 24, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:26:46', '2021-01-01 20:01:12', 0),
(221, 'DM 750ml', 'DM 750ml', 'TW008', 'Thinwall', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:27:23', '2020-06-25 23:27:23', 0),
(222, 'Foam HB Mega', 'Foam HB Mega', 'F001', 'Sterefoam', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Ball', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:29:49', '2020-06-25 23:06:17', 0),
(223, 'Foam sekat mega', 'Foam sekat mega', 'F002', 'Sterefoam', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Ball', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:30:27', '2020-06-25 23:30:27', 0),
(224, 'Foam polos Mega', 'Foam polos Mega', 'F003', 'Sterefoam', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Ball', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:32:13', '2020-06-25 23:32:13', 0),
(225, 'Foam tanggung mega', 'Foam tanggung mega', 'F004', 'Sterefoam', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Ball', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:33:41', '2020-06-25 23:33:41', 0),
(226, 'Foam mangkok Mega', 'Foam mangkok Mega', 'F005', 'Sterefoam', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Ball', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:34:20', '2020-06-25 23:34:20', 0),
(228, 'Foam Sekat BSM', 'Foam Sekat BSM', 'F007', 'Sterefoam', NULL, NULL, 80, 10, 29500, NULL, 33000, NULL, NULL, 'Ball', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:35:36', '2021-01-04 02:01:42', 0),
(229, 'Foam polos BSM', 'Foam polos BSM', 'F008', 'Sterefoam', NULL, NULL, 27, 10, 29500, NULL, 33000, NULL, NULL, 'Ball', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:36:09', '2021-01-04 02:01:42', 0),
(230, 'Foam tanggung BSM', 'Foam tanggung BSM', 'F009', 'Sterefoam', NULL, NULL, 5, NULL, 19500, NULL, 23000, NULL, NULL, 'Ball', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:36:36', '2021-01-01 23:01:49', 0),
(231, 'Foam mangkok BSM', 'Foam mangkok BSM', 'F010', 'Sterefoam', NULL, NULL, 55, NULL, NULL, NULL, 23000, NULL, NULL, 'Ball', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:37:14', '2021-01-01 22:01:09', 0),
(232, 'Tusuk sate Seika', 'Tusuk sate Seika', 'T001', 'tUSUK', NULL, NULL, 5, 5, 540000, NULL, 600000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:39:02', '2021-01-02 00:01:54', 0),
(233, 'Tusuk gigi JA', 'Tusuk gigi JA', 'T003', 'Thinwall', NULL, NULL, 4, 5, 235000, NULL, 0, NULL, NULL, 'Ball', NULL, NULL, 0, NULL, NULL, '2020-06-25 23:39:42', '2021-01-02 01:01:34', 0),
(237, 'SENDOK MAKAN HOSEO', 'SENDOK MAKAN HOSEO', 'S0011', 'Sendok Plastik', NULL, NULL, 7, 5, 245000, NULL, 300000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 03:11:59', '2021-01-04 02:01:08', 0),
(238, 'sendok makan premium', 'sendok makan premium', 'S0012', 'Sendok Plastik', NULL, NULL, 2, 5, 215000, NULL, 300000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 03:16:10', '2021-01-02 04:01:56', 0),
(242, 'Sendok bebek warna', 'Sendok bebek warna', 'S001', 'Sendok Plastik', NULL, NULL, 92, 10, 150000, NULL, 180000, NULL, NULL, 'Ball', NULL, NULL, 0, NULL, NULL, '2021-01-02 04:05:39', '2021-01-04 02:01:34', 0),
(243, 'Sendok ager warna', 'Sendok ager warna', 'S009', 'Sendok Plastik', NULL, NULL, 315, 250, 15000, NULL, 18000, NULL, NULL, 'Pack', NULL, NULL, 0, NULL, NULL, '2021-01-02 04:08:44', '2021-01-02 04:01:10', 0),
(244, 'tutup cembung polos JA', 'tutup cembung polos JA', 'TP002', 'Tutup', NULL, NULL, 74, 5, 137000, NULL, 180000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 04:16:29', '2021-01-02 04:01:57', 0),
(245, 'tutup ager BULAN', 'tutup ager BULAN', 'TP007', 'Tutup', NULL, NULL, 191, 5, 83000, NULL, 150000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 04:23:44', '2021-01-02 04:01:11', 0),
(246, 'tutup datar master', 'tutup datar master', 'TP008', 'Tutup', NULL, NULL, 185, 10, 75000, NULL, 100000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 04:28:57', '2021-01-02 04:01:26', 0),
(247, 'tutup cembung 22oz', 'tutup cembung 22oz', 'TP009', 'Tutup', NULL, NULL, 27, 5, 125000, NULL, 180000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 04:37:37', '2021-01-02 04:01:49', 0),
(248, 'Mika 3xx Weetan', 'Mika 3xx Weetan', 'm009', 'Mika', NULL, NULL, 28, 5, 330000, NULL, 370000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 04:49:37', '2021-01-04 02:01:46', 0),
(249, 'Mika 4xx Weetan', 'Mika 4xx Weetan', 'M010', 'Mika', NULL, NULL, 8, 5, 210000, NULL, 250000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 04:51:08', '2021-01-02 04:01:37', 0),
(250, 'mika sayur 18 ns', 'mika sayur 18 ns', 'M003', 'Mika', NULL, NULL, 24, 5, 165000, NULL, 210000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 05:12:56', '2021-01-01 17:01:24', 0),
(251, 'Mika 3 NS', 'Mika 3 NS', 'M004', 'Mika', NULL, NULL, 2, 5, 313500, NULL, 375000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 05:16:43', '2021-01-01 17:01:36', 0),
(252, 'cup 12oz nat duyung', 'cup 12oz nat duyung', 'c001', 'Cup', NULL, NULL, 4, 5, 240000, NULL, 280000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 05:24:14', '2021-01-01 17:01:17', 0),
(253, 'cup 14oz nat duyung', 'cup 14oz nat duyung', 'c002', 'Cup', NULL, NULL, 14, 5, 240000, NULL, 280000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 05:24:54', '2021-01-01 17:01:30', 0),
(254, 'cup 16oz nat duyung', 'cup 16oz nat duyung', 'c003', 'Cup', NULL, NULL, 1, 5, 240000, NULL, 285000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 05:25:36', '2021-01-01 17:01:24', 0),
(255, 'cup 10oz nat master', 'cup 10oz nat master', 'c004', 'Cup', NULL, NULL, 0, 5, 255000, NULL, 285000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 05:50:25', '2021-01-02 05:50:25', 0),
(256, 'cup 12oz nat master', 'cup 12oz nat master', 'C005', 'Cup', NULL, NULL, 0, 5, 255000, NULL, 285000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 05:51:07', '2021-01-02 05:51:07', 0),
(257, 'cup 14oz nat master', 'cup 14oz nat master', 'c006', 'Cup', NULL, NULL, 0, 5, 255000, NULL, 285000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 05:52:00', '2021-01-02 05:52:00', 0),
(258, 'cup 16oz nat master', 'cup 16oz nat master', 'c007', 'Cup', NULL, NULL, 0, 5, 260000, NULL, 290000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 05:54:37', '2021-01-02 05:54:37', 0),
(259, 'Cup 10oz hanica', 'Cup 10oz hanica', 'c008', 'Cup', NULL, NULL, 0, 5, 242000, NULL, 290000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 05:56:42', '2021-01-02 05:56:42', 0),
(260, 'cup 12oz nat hanica', 'cup 12oz nat hanica', 'c009', 'Cup', NULL, NULL, 82, 5, 242000, NULL, 290000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 05:58:47', '2021-01-01 18:01:51', 0),
(261, 'cup 10oz nat dias', 'cup 10oz nat dias', 'c012', 'Cup', NULL, NULL, 0, 5, 246000, NULL, 280000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 06:14:06', '2021-01-02 06:14:06', 0),
(262, 'cup 12oz nat dias', 'cup 12oz nat dias', 'c013', 'Cup', NULL, NULL, 0, 5, 246000, NULL, 275000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 06:14:56', '2021-01-02 06:14:56', 0),
(263, 'cup 14oz nat dias', 'cup 14oz nat dias', 'c014', 'Cup', NULL, NULL, 1, 5, 246000, NULL, 275000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 06:15:35', '2021-01-01 19:01:05', 0),
(264, 'cup 16oz nat dias', 'cup 16oz nat dias', 'c015', 'Cup', NULL, NULL, 0, 5, 246000, NULL, 275000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 06:16:32', '2021-01-02 06:16:32', 0),
(265, 'cup 10oz nat ascot', 'cup 10oz nat ascot', 'c016', 'Cup', NULL, NULL, 0, 5, 246000, NULL, 280000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 06:42:18', '2021-01-02 06:42:18', 0),
(266, 'cup 12oz nat ascot', 'cup 12oz nat ascot', 'c017', 'Cup', NULL, NULL, 0, 5, 246000, NULL, 275000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 06:42:50', '2021-01-02 06:42:50', 0),
(267, 'cup 14oz nat ascot', 'cup 14oz nat ascot', 'c018', 'Cup', NULL, NULL, 14, 5, 246000, NULL, 275000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 06:43:25', '2021-01-01 19:01:52', 0),
(268, 'cup 16oz nat ascot', 'cup 16oz nat ascot', 'C019', 'Cup', NULL, NULL, 0, 5, 246000, NULL, 275000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 06:43:56', '2021-01-02 06:43:56', 0),
(269, 'Cup 220ml hanica', 'Cup 220ml hanica', 'c020', 'Cup', NULL, NULL, 193, 5, 178200, NULL, 210000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 06:50:37', '2021-01-01 18:01:03', 0),
(270, 'cup 220ml nat master', 'cup 220ml nat master', 'C021', 'Cup', NULL, NULL, 3, 5, 155000, NULL, 185000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 06:53:41', '2021-01-01 18:01:32', 0),
(271, 'cup 220ml nat dias', 'cup 220ml nat dias', 'C022', 'Cup', NULL, NULL, 0, 5, 145000, NULL, 175000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 07:04:32', '2021-01-02 07:04:32', 0),
(272, 'cup 220ml nat ibc', 'cup 220ml nat ibc', 'c023', 'Cup', NULL, NULL, 46, 5, 170000, NULL, 200000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 07:07:50', '2021-01-01 19:01:13', 0),
(273, 'Cup ager 65ml topcup', 'Cup ager 65ml topcup', 'C025', 'Cup', NULL, NULL, 2, 5, 218000, NULL, 290000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 07:26:47', '2021-01-01 19:01:24', 0),
(274, 'Cup ager 90ml topcup', 'Cup ager 90ml topcup', 'C026', 'Cup', NULL, NULL, 75, 5, 218000, NULL, 290000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 07:27:30', '2021-01-01 19:01:42', 0),
(275, 'cup 14oz nat oval bsm', 'cup 14oz nat oval bsm', 'C029', 'Cup', NULL, NULL, 6, 5, 240000, NULL, 340000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 07:43:54', '2021-01-01 19:01:37', 0),
(276, 'cup 16oz nat oval bsm', 'cup 16oz nat oval bsm', 'C030', 'Cup', NULL, NULL, 2, 5, 240000, NULL, 340000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 07:45:13', '2021-01-04 02:01:08', 0),
(277, 'cup coffee 8oz', 'cup coffee 8oz', 'c031', 'Cup', NULL, NULL, 0, 5, NULL, NULL, 300000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 07:46:24', '2021-01-02 07:46:24', 0),
(278, 'cup coffee 8oz isi 25x25', 'cup coffee 8oz isi 25x25', 'C032', 'Cup', NULL, NULL, 5, 5, 80000, NULL, 130000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 07:48:32', '2021-01-01 20:01:01', 0),
(279, 'thinwall Hanzo 750ml(250pcs)', 'thinwall Hanzo 750ml(250pcs)', 'TW009', 'Thinwall', NULL, NULL, 7, 5, 227500, NULL, 245000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 08:01:59', '2021-01-01 20:01:48', 0),
(280, 'thinwall Hanzo 750ml(500pcs)', 'thinwall Hanzo 750ml(500pcs)', 'TW010', 'Thinwall', NULL, NULL, 25, 5, 455000, NULL, 490000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 08:03:10', '2021-01-01 20:01:40', 0),
(281, 'thinwall TP 200ml', 'thinwall TP 200ml', 'TW011', 'Thinwall', NULL, NULL, 1, 5, 270000, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 08:26:18', '2021-01-01 21:01:57', 0),
(282, 'Papercup eskrim', 'Papercup eskrim', 'C033', 'Cup', NULL, NULL, 10, 5, 335000, NULL, 355000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 08:46:28', '2021-01-01 22:01:39', 0),
(283, 'thinwall TP 500ml KOTAK', 'thinwall TP 500ml KOTAK', 'TW012', 'Thinwall', NULL, NULL, 3, 5, 450000, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 08:52:55', '2021-01-01 21:01:47', 0),
(284, 'thinwall TP 650ml', 'thinwall TP 650ml', 'TW013', 'Thinwall', NULL, NULL, 6, 5, 360000, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 08:54:05', '2021-01-01 21:01:35', 0),
(285, 'thinwall TP 750ml', 'thinwall TP 750ml', 'TW014', 'Thinwall', NULL, NULL, 1, 5, 375000, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 08:54:57', '2021-01-01 21:01:34', 0),
(286, 'mika 1 jumbo NS', 'mika 1 jumbo NS', 'M029', 'Mika', NULL, NULL, 12500, 250, 1103, NULL, 1700, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2021-01-02 10:16:47', '2021-01-01 22:01:21', 0),
(287, 'mika sifon 18 NS', 'mika sifon 18 NS', 'M030', 'Mika', NULL, NULL, 5000, 100, 843, NULL, 1500, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2021-01-02 10:23:07', '2021-01-01 22:01:13', 0),
(288, 'mika sifon 22 NS', 'mika sifon 22 NS', 'M031', 'Mika', NULL, NULL, 4000, 100, 1056, NULL, 1800, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2021-01-02 10:27:00', '2021-01-01 22:01:26', 0),
(289, 'foam hb BSM', 'foam hb BSM', 'F011', 'Sterefoam', NULL, NULL, 320, 10, 28500, NULL, 33000, NULL, NULL, 'Ball', NULL, NULL, 0, NULL, NULL, '2021-01-02 10:35:46', '2021-01-04 02:01:42', 0),
(290, 'sealer SHUKAKU polos isi 1000pcs', 'sealer SHUKAKU polos isi 1000pcs', 'SL001', 'SEALER', NULL, NULL, 0, 5, 414000, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 12:32:55', '2021-01-02 12:32:55', 0),
(291, 'sealer SHUKAKU motif teh isi 1000pcs', 'sealer SHUKAKU motif teh isi 1000pcs', 'SL002', 'SEALER', NULL, NULL, 10, 5, 414000, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 12:40:56', '2021-01-02 00:01:07', 0),
(292, 'tusuk sate SHUKAKU', 'tusuk sate SHUKAKU', 'T002', 'tUSUK', NULL, NULL, 10, 5, 540000, NULL, 600000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 12:59:03', '2021-01-02 01:01:41', 0),
(293, 'sealer SMILE kartun', 'sealer SMILE kartun', 'SL003', 'SEALER', NULL, NULL, 16, 5, 432000, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-02 13:08:28', '2021-01-02 01:01:53', 0),
(294, 'karet kuning AMIGO', 'karet kuning AMIGO', 'KR001', 'karet gelang', NULL, NULL, 186, 10, 35000, NULL, 45000, NULL, NULL, 'KG', NULL, NULL, 0, NULL, NULL, '2021-01-04 00:43:15', '2021-01-04 02:01:34', 0),
(295, 'karet kuning SINON', 'karet kuning SINON', 'KR002', 'karet gelang', NULL, NULL, 119, 119, 45000, NULL, 500000, NULL, NULL, 'KG', NULL, NULL, 0, NULL, NULL, '2021-01-04 00:49:11', '2021-01-04 00:01:02', 0),
(296, 'garpu buah kiloan', 'garpu buah kiloan', 'G002', 'GARPU', NULL, NULL, 147, 147, 29000, NULL, 0, NULL, NULL, 'KG', NULL, NULL, 0, NULL, NULL, '2021-01-04 00:54:00', '2021-01-04 00:01:06', 0),
(297, 'tutup cembung rigi SIPP', 'tutup cembung rigi SIPP', 'TP010', 'Tutup', NULL, NULL, 213, 213, 135000, NULL, 0, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-04 01:02:29', '2021-01-04 01:01:27', 0),
(298, 'handbag sm 30x30', 'handbag sm 30x30', 'H001', 'Handbag/Plastik', NULL, NULL, 110, 5, 35000, NULL, 40000, NULL, NULL, 'Pack', NULL, NULL, 0, NULL, NULL, '2021-01-04 01:06:31', '2021-01-04 01:01:49', 0),
(299, 'handbag sm 25x30', 'handbag sm 25x30', 'H002', 'Handbag/Plastik', NULL, NULL, 0, 10, 0, NULL, 0, NULL, NULL, 'Pack', NULL, NULL, 0, NULL, NULL, '2021-01-04 01:07:17', '2021-01-04 01:07:17', 0),
(300, 'handbag sm 20x25', 'handbag sm 20x25', 'H003', 'Handbag/Plastik', NULL, NULL, 0, 10, 0, NULL, 22000, NULL, NULL, 'Pack', NULL, NULL, 0, NULL, NULL, '2021-01-04 01:09:12', '2021-01-04 01:09:12', 0),
(301, 'handbag batik 30x32', 'handbag batik 30x32', 'H004', 'Handbag/Plastik', NULL, NULL, 0, 20, NULL, NULL, 22000, NULL, NULL, 'Pack', NULL, NULL, 0, NULL, NULL, '2021-01-04 01:09:54', '2021-01-04 01:09:54', 0),
(302, 'plastik standing pouch 10x17', 'plastik standing pouch 10x17', 'H005', 'Handbag/Plastik', NULL, NULL, 45, 10, 0, NULL, 0, NULL, NULL, 'Pack', NULL, NULL, 0, NULL, NULL, '2021-01-04 01:13:28', '2021-01-04 01:01:11', 0),
(303, 'plastik standing pouch 12x20', 'plastik standing pouch 12x20', 'H006', 'Handbag/Plastik', NULL, NULL, 140, 10, 0, NULL, 0, NULL, NULL, 'Pack', NULL, NULL, 0, NULL, NULL, '2021-01-04 01:14:21', '2021-01-04 01:01:54', 0),
(304, 'plastik standing pouch 14x22', 'plastik standing pouch 14x22', 'H007', 'Handbag/Plastik', NULL, NULL, 0, 10, 0, NULL, 0, NULL, NULL, 'Pack', NULL, NULL, 0, NULL, NULL, '2021-01-04 01:15:10', '2021-01-04 01:15:10', 0),
(305, 'dus donat laminasi bigbox', 'dus donat laminasi bigbox', 'D046', 'Dus', NULL, NULL, 0, 100, 1250, NULL, 1400, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2021-01-04 01:30:47', '2021-01-04 01:01:09', 0),
(306, 'dus donat motif', 'dus donat motif', 'D047', 'Dus', NULL, NULL, 1800, 100, 1150, NULL, 1300, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2021-01-04 01:31:44', '2021-01-04 01:01:37', 0),
(307, 'mika sayur 20 weetan IF', 'mika sayur 20 weetan IF', 'm032', 'Mika', NULL, NULL, 5, 3, 230000, NULL, 270000, NULL, NULL, 'Dus', NULL, NULL, 0, NULL, NULL, '2021-01-04 02:01:42', '2021-01-04 02:01:42', 0),
(308, 'mika sifon 25 MMP IF', 'mika sifon 25 MMP IF', 'M033', 'Mika', NULL, NULL, 100, 50, 2700, NULL, 3200, NULL, NULL, 'Pcs', NULL, NULL, 0, NULL, NULL, '2021-01-04 02:05:03', '2021-01-04 02:01:39', 0),
(309, 'SEDOTAN BUBBLE 6MM', 'SEDOTAN BUBBLE 6MM', 'SB001', NULL, NULL, NULL, 100, NULL, 7000, NULL, 9000, NULL, NULL, 'Pack, Ball', NULL, NULL, 0, NULL, NULL, '2021-01-04 02:27:31', '2021-01-04 02:01:42', 0),
(310, 'SEDOTAN BUBBLE 8MM', 'SEDOTAN BUBBLE 8MM', 'SB002', NULL, NULL, NULL, 32, NULL, 7000, NULL, 9000, NULL, NULL, 'Pack, Ball', NULL, NULL, 0, NULL, NULL, '2021-01-04 02:28:41', '2021-01-04 02:01:49', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_uoms`
--

CREATE TABLE `product_uoms` (
  `id` int(11) NOT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `nama_uom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_cicilan`
--

CREATE TABLE `produk_cicilan` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) NOT NULL,
  `lama_angsuran` int(11) NOT NULL,
  `nominal_angsuran` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk_cicilan`
--

INSERT INTO `produk_cicilan` (`id`, `product_id`, `lama_angsuran`, `nominal_angsuran`, `created_at`, `updated_at`) VALUES
(1, 92, 1, 0, '2020-12-30 00:57:42', '2020-12-30 02:59:07'),
(2, 93, 10, 2000, '2020-12-30 02:46:47', '2020-12-30 02:46:47'),
(3, 94, 1, 0, '2020-12-30 02:57:21', '2020-12-30 02:57:21'),
(4, 234, 1, 1, '2020-12-30 03:14:51', '2020-12-30 03:14:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_uoms`
--

CREATE TABLE `produk_uoms` (
  `id` int(10) UNSIGNED NOT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `uom_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isi_pcs` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `produk_uoms`
--

INSERT INTO `produk_uoms` (`id`, `produk_id`, `uom_id`, `isi_pcs`, `created_at`, `updated_at`) VALUES
(1, 5, 'Pcs', 1, '2018-05-11 18:39:43', '2018-05-11 18:39:46'),
(2, 5, 'Dus', 20, '2018-05-11 18:40:00', '2018-05-11 18:40:02'),
(7, 1, 'Pcs', 1, '2018-05-14 08:05:42', '2018-05-14 08:05:42'),
(10, 1, 'Dozen', 12, '2018-05-14 10:05:39', '2018-05-14 10:05:26'),
(11, 6, 'Pcs', 1, '2018-05-15 08:05:16', '2018-05-15 08:05:16'),
(13, 8, 'Pcs', 1, '2018-05-22 07:05:11', '2018-05-22 07:05:11'),
(14, 8, 'Dus', 25, '2018-05-22 07:05:56', '2018-05-22 07:05:56'),
(15, 9, 'Pcs', 1, '2018-05-25 04:05:37', '2018-05-25 04:05:37'),
(16, 9, 'Ball', 15, '2018-05-25 04:05:13', '2018-05-25 04:05:13'),
(17, 14, 'Pcs', 1, '2018-05-25 05:05:04', '2018-05-25 05:05:04'),
(18, 14, 'Dus', 20, '2018-05-25 05:05:31', '2018-05-25 05:05:31'),
(19, 13, 'Pcs', 1, '2018-05-25 05:05:49', '2018-05-25 05:05:49'),
(20, 13, 'Dus', 20, '2018-05-25 05:05:49', '2018-05-25 05:05:49'),
(21, 12, 'Pcs', 1, '2018-05-25 05:05:26', '2018-05-25 05:05:26'),
(22, 12, 'Dus', 12, '2018-05-25 05:05:51', '2018-05-25 05:05:51'),
(23, 11, 'Dus', 30, '2018-05-25 05:05:35', '2018-05-25 05:05:35'),
(24, 11, 'Pcs', 1, '2018-05-25 05:05:56', '2018-05-25 05:05:56'),
(25, 16, 'Pcs', 1, '2018-05-28 04:05:52', '2018-05-28 04:05:52'),
(26, 16, 'Dus', 20, '2018-05-28 04:05:11', '2018-05-28 04:05:11'),
(27, 17, 'Dus', 20, '2018-05-28 04:05:32', '2018-05-28 04:05:32'),
(28, 17, 'Pack', 1, '2018-05-28 04:05:44', '2018-05-28 04:05:44'),
(29, 19, 'Pcs', 1, '2018-05-28 04:05:13', '2018-05-28 04:05:13'),
(30, 19, 'Dus', 20, '2018-05-28 04:05:27', '2018-05-28 04:05:27'),
(31, 20, 'Dus', 20, '2018-05-28 04:05:58', '2018-05-28 04:05:58'),
(32, 22, 'Pcs', 1, '2018-05-28 04:05:28', '2018-05-28 04:05:52'),
(33, 22, 'Dus', 20, '2018-05-28 04:05:27', '2018-05-28 04:05:27'),
(34, 23, 'Dus', 20, '2018-05-28 04:05:45', '2018-05-28 04:05:45'),
(35, 25, 'Dus', 12, '2018-05-28 04:05:51', '2018-05-28 04:05:51'),
(36, 28, 'Ball', 10, '2018-05-28 05:05:07', '2018-05-28 05:05:07'),
(37, 29, 'Dus', 12, '2018-05-28 05:05:28', '2018-05-28 05:05:28'),
(38, 30, 'Dus', 12, '2018-05-28 05:05:58', '2018-05-28 05:05:58'),
(39, 32, 'Dus', 20, '2018-05-28 05:05:51', '2018-05-28 05:05:51'),
(40, 33, 'Dus', 18, '2018-05-28 05:05:03', '2018-05-28 05:05:03'),
(41, 34, 'Dus', 18, '2018-05-28 05:05:46', '2018-05-28 05:05:46'),
(42, 35, 'Dus', 50, '2018-05-28 05:05:24', '2018-05-28 05:05:24'),
(43, 36, 'Dus', 20, '2018-05-28 05:05:35', '2018-05-28 05:05:35'),
(44, 37, 'Dus', 25, '2018-05-28 05:05:02', '2018-05-28 05:05:02'),
(45, 38, 'Dus', 20, '2018-05-28 05:05:50', '2018-05-28 05:05:50'),
(46, 39, 'Dus', 10, '2018-05-28 05:05:23', '2018-05-28 05:05:23'),
(47, 43, 'Dus', 15, '2018-05-28 05:05:58', '2018-05-28 05:05:58'),
(48, 42, 'Dus', 20, '2018-05-28 05:05:32', '2018-05-28 05:05:32'),
(49, 41, 'Dus', 10, '2018-05-28 05:05:17', '2018-05-28 05:05:17'),
(50, 40, 'Dus', 10, '2018-05-28 05:05:39', '2018-05-28 05:05:39'),
(51, 44, 'Dus', 20, '2018-05-28 05:05:51', '2018-05-28 05:05:51'),
(52, 46, 'Dus', 24, '2018-05-29 04:05:54', '2018-05-29 04:05:54'),
(53, 47, 'Dus', 60, '2018-05-29 05:05:05', '2018-05-29 05:05:05'),
(54, 48, 'Dus', 50, '2018-05-29 05:05:06', '2018-05-29 05:05:06'),
(55, 49, 'Dus', 20, '2018-05-29 05:05:12', '2018-05-29 05:05:12'),
(56, 50, 'Dus', 60, '2018-05-29 05:05:52', '2018-05-29 05:05:52'),
(57, 51, 'Dus', 20, '2018-05-29 05:05:07', '2018-05-29 05:05:07'),
(58, 52, 'Dus', 20, '2018-05-29 05:05:13', '2018-05-29 05:05:13'),
(59, 53, 'Dus', 8, '2018-05-29 05:05:35', '2018-05-29 05:05:35'),
(60, 55, 'Dus', 20, '2018-05-29 05:05:59', '2018-05-29 05:05:59'),
(61, 56, 'Dus', 20, '2018-05-29 05:05:02', '2018-05-29 05:05:02'),
(62, 57, 'Dus', 12, '2018-05-29 05:05:02', '2018-06-13 02:06:46'),
(63, 58, 'Dus', 20, '2018-05-29 05:05:38', '2018-05-29 05:05:38'),
(64, 59, 'Dus', 12, '2018-05-29 05:05:52', '2018-05-29 05:05:52'),
(65, 60, 'Dus', 12, '2018-05-29 05:05:13', '2018-05-29 05:05:13'),
(66, 61, 'Dus', 24, '2018-05-29 05:05:37', '2018-05-29 05:05:37'),
(67, 63, 'Dus', 12, '2018-05-29 05:05:58', '2018-05-29 05:05:58'),
(68, 64, 'Dus', 12, '2018-05-29 05:05:24', '2018-05-29 05:05:24'),
(69, 65, 'Dus', 24, '2018-05-29 06:05:52', '2018-05-29 06:05:52'),
(70, 66, 'Dus', 24, '2018-05-29 06:05:11', '2018-05-29 06:05:11'),
(71, 67, 'Renteng', 10, '2018-05-29 06:05:10', '2018-05-29 06:05:10'),
(72, 67, 'Dus', 24, '2018-05-29 06:05:29', '2018-05-29 06:05:29'),
(73, 6, 'Ball', 25, '2018-06-04 07:06:43', '2018-06-04 07:06:43'),
(75, 10, 'Ball', 25, '2018-06-04 07:06:15', '2018-06-04 07:06:15'),
(77, 10, 'Pcs', 1, '2018-06-12 12:06:39', '2018-06-12 12:06:39'),
(78, 21, 'Dus', 20, '2018-06-12 12:06:01', '2018-06-12 12:06:01'),
(79, 21, 'Pcs', 1, '2018-06-12 12:06:18', '2018-06-12 12:06:18'),
(80, 24, 'Dus', 10, '2018-06-12 12:06:07', '2018-06-12 12:06:07'),
(81, 24, 'Pcs', 1, '2018-06-12 12:06:26', '2018-06-12 12:06:26'),
(82, 20, 'Pcs', 1, '2018-06-12 12:06:32', '2018-06-12 12:06:32'),
(83, 26, 'Pcs', 1, '2018-06-12 12:06:48', '2018-06-12 12:06:48'),
(85, 26, 'Dus', 16, '2018-06-12 12:06:56', '2018-06-12 12:06:56'),
(86, 25, 'Pcs', 1, '2018-06-12 12:06:01', '2018-06-12 12:06:01'),
(87, 27, 'Pcs', 1, '2018-06-12 12:06:24', '2018-06-12 12:06:24'),
(88, 27, 'Dus', 20, '2018-06-12 12:06:50', '2018-06-12 12:06:50'),
(89, 7, 'Pcs', 1, '2018-06-12 12:06:07', '2018-06-12 12:06:07'),
(90, 7, 'Dus', 25, '2018-06-12 12:06:41', '2018-06-12 12:06:41'),
(91, 28, 'Pcs', 1, '2018-06-12 12:06:02', '2018-06-12 12:06:02'),
(92, 29, 'Pcs', 1, '2018-06-12 12:06:08', '2018-06-12 12:06:08'),
(93, 33, 'Pcs', 1, '2018-06-12 12:06:09', '2018-06-12 12:06:09'),
(94, 34, 'Pcs', 1, '2018-06-12 12:06:15', '2018-06-12 12:06:15'),
(95, 35, 'Pcs', 1, '2018-06-13 02:06:19', '2018-06-13 02:06:19'),
(96, 36, 'Pcs', 1, '2018-06-13 02:06:01', '2018-06-13 02:06:01'),
(97, 37, 'Pcs', 1, '2018-06-13 02:06:54', '2018-06-13 02:06:54'),
(98, 38, 'Pcs', 1, '2018-06-13 02:06:30', '2018-06-13 02:06:30'),
(99, 39, 'Pcs', 1, '2018-06-13 02:06:57', '2018-06-13 02:06:57'),
(100, 40, 'Pcs', 1, '2018-06-13 02:06:21', '2018-06-13 02:06:21'),
(101, 41, 'Pcs', 1, '2018-06-13 02:06:55', '2018-06-13 02:06:55'),
(102, 42, 'Pcs', 1, '2018-06-13 02:06:24', '2018-06-13 02:06:24'),
(103, 43, 'Pcs', 1, '2018-06-13 02:06:58', '2018-06-13 02:06:58'),
(104, 44, 'Pcs', 1, '2018-06-13 02:06:29', '2018-06-13 02:06:29'),
(106, 45, 'Pcs', 1, '2018-06-13 02:06:42', '2018-06-13 02:06:42'),
(107, 45, 'Dus', 50, '2018-06-13 02:06:56', '2018-06-13 02:06:56'),
(108, 46, 'Pcs', 1, '2018-06-13 02:06:17', '2018-06-13 02:06:17'),
(109, 47, 'Pcs', 1, '2018-06-13 02:06:11', '2018-06-13 02:06:11'),
(110, 57, 'Pcs', 1, '2018-06-13 02:06:52', '2018-06-13 02:06:52'),
(111, 51, 'Dus', 1, '2018-06-13 04:06:05', '2018-06-13 04:06:05'),
(112, 67, 'Pcs', 1, '2018-08-06 02:08:01', '2018-08-06 02:08:01'),
(113, 90, 'Dus', 2000, '2020-06-07 21:06:02', '2020-06-07 21:06:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2018-03-17 21:11:05', '2018-03-17 21:11:05'),
(2, 'Admin Gudang', 'web', '2018-03-18 22:35:59', '2018-03-18 22:35:59'),
(3, 'User', 'web', '2018-03-18 22:35:59', '2018-03-18 22:35:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2),
(16, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_klasifikasis`
--

CREATE TABLE `sub_klasifikasis` (
  `id` int(10) UNSIGNED NOT NULL,
  `klasifikasi` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subklasifikasi` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sub_klasifikasis`
--

INSERT INTO `sub_klasifikasis` (`id`, `klasifikasi`, `subklasifikasi`, `created_at`, `updated_at`) VALUES
(1, 'Harta', 'Kas', '2018-03-25 14:03:22', '2018-03-25 14:03:22'),
(2, 'Harta', 'Bank', '2018-03-25 14:04:01', '2018-03-25 14:04:01'),
(3, 'Fixed Asset', 'Harta', '2018-04-15 04:57:11', '2018-04-15 04:57:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transfers`
--

CREATE TABLE `transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `no_reff` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `departement_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gudang_asal` int(11) NOT NULL,
  `gudang_terima` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_cetak` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_tunai` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_batal` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transfer_details`
--

CREATE TABLE `transfer_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `transfer_id` smallint(6) NOT NULL,
  `no_reff` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produk_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `uom_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ke_gudang` int(11) DEFAULT NULL,
  `jobs` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transfer_kas`
--

CREATE TABLE `transfer_kas` (
  `id` int(10) UNSIGNED NOT NULL,
  `from_akun_id` int(11) NOT NULL,
  `to_akun_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `no_reff` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departement_id` int(11) DEFAULT NULL,
  `nilai` int(11) NOT NULL DEFAULT 0,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `is_cetak` tinyint(1) DEFAULT 0,
  `is_batal` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  `is_void` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `uoms`
--

CREATE TABLE `uoms` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode_uom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_uom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `uoms`
--

INSERT INTO `uoms` (`id`, `kode_uom`, `nama_uom`, `deskripsi`, `name`, `created_at`, `updated_at`) VALUES
(22, 'pcs', 'Pcs', 'smalest unit', NULL, '2018-04-20 10:59:27', '2018-05-22 06:53:02'),
(23, 'dus', 'Dus', 'large unit', NULL, '2018-04-20 10:59:35', '2018-05-22 06:52:14'),
(25, 'Pack', 'Pack', NULL, NULL, '2018-05-16 12:32:07', '2018-05-16 12:32:07'),
(26, 'Rent', 'Renteng', NULL, NULL, '2018-05-17 12:20:41', '2018-05-22 06:53:27'),
(27, 'Ball', 'Ball', NULL, NULL, '2018-05-17 12:21:00', '2018-05-17 12:21:00'),
(28, 'KG', 'KG', NULL, NULL, '2021-01-04 00:40:57', '2021-01-04 00:40:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default.jpg',
  `tlp` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gudang_id` int(11) DEFAULT NULL,
  `departement_id` int(11) DEFAULT NULL,
  `remember_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `email`, `password`, `photo`, `tlp`, `alamat`, `gudang_id`, `departement_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'admin@admin.com', '$2y$10$XmmbQolfbcdbK2BWmmhVWuu6X26BszRJeTMV3wuY4OMHslWwsv4D.', 'default.jpg', '08987379232', 'Majalengka', 1, 10, 'kNGkAHRpS0IzFG698NNa1nDJNAbUK9DSl8xM2Ns12GeLikyjB23oMwzhypEy', '2018-03-17 21:11:06', '2020-02-14 19:03:36'),
(3, 'master', 'Super Admin', 'master@admin.com', '$2y$10$j9n2ANJX2Ml.RBjBPEafBu3a4zH5CkXeMSd56NlZaG7hg16GbKx5G', 'default.jpg', '0', NULL, 1, 10, 'AJUw93GzBbrTM0fjz8EvOKqTNyXTJ2c70dRSjr63e7G0a5ptv63P6Sipv6YR', '2018-04-09 21:05:09', '2018-04-09 21:05:09'),
(9, 'anggi', 'Anggi Ramdhani', 'anggi@gmail.com', '$2y$10$9C9WDDex/Fr/NE04dzOmNuAkg7OtsQ38gzgM1qlqHAgVQE7wdC0L2', 'default.jpg', NULL, NULL, 1, 10, NULL, '2020-06-07 20:44:01', '2020-06-07 20:44:01'),
(10, 'nurhayati', 'Nurhayati', 'nurhayati@gmail.com', '$2y$10$1KmfDl9XjPC/Ef9F.r4nvebN0cFKYi8nYTyr508Zvl2X7lgPhM2uC', 'default.jpg', NULL, NULL, 1, 10, NULL, '2020-06-07 20:44:42', '2020-06-07 20:44:42'),
(11, 'kasum', 'Kasum', 'kasum@gmail.com', '$2y$10$F0CEiuWmU4OuywqwMZ6nseYQByRYdO2EfEBGSg8LVtkKUQLGtlaTO', 'default.jpg', NULL, NULL, 1, 10, NULL, '2020-06-07 20:45:27', '2020-06-07 20:45:27'),
(12, 'userdemo', 'User Demo', 'demo@gmail.com', '$2y$10$EbXcC8/ZtpSv2eAIOruRGeXqSN2b4SIHhfsr44CsGitxwGZ1YQE8i', 'default.jpg', NULL, NULL, 1, 10, 'C82pcGMu0bXzwFzo2B5dixPpwfFx9VLio8AHQt4FrC9XSyUcRQT0TaSoXBXO', '2020-06-19 17:33:29', '2020-06-19 17:33:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `views_saldo_hutang`
--

CREATE TABLE `views_saldo_hutang` (
  `id` int(10) UNSIGNED DEFAULT NULL,
  `kontak_id` int(11) DEFAULT NULL,
  `saldo_terutang` float DEFAULT NULL,
  `bayar` decimal(32,0) DEFAULT NULL,
  `saldohutang` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `view_saldo_utang`
--

CREATE TABLE `view_saldo_utang` (
  `id` int(10) UNSIGNED DEFAULT NULL,
  `kontak_id` int(11) DEFAULT NULL,
  `saldo_terutang` float DEFAULT NULL,
  `bayar` decimal(32,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akuns`
--
ALTER TABLE `akuns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `akuns_kode_akun_unique` (`kode_akun`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_nama_kategori_unique` (`nama_kategori`),
  ADD UNIQUE KEY `categories_kode_kategori_unique` (`kode_kategori`);

--
-- Indeks untuk tabel `departements`
--
ALTER TABLE `departements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departements_kode_departement_unique` (`kode_departement`);

--
-- Indeks untuk tabel `gudangs`
--
ALTER TABLE `gudangs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gudangs_kode_gudang_unique` (`kode_gudang`);

--
-- Indeks untuk tabel `hargabeli`
--
ALTER TABLE `hargabeli`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `hargabeli_detail`
--
ALTER TABLE `hargabeli_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `hargajual`
--
ALTER TABLE `hargajual`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `hargajual_hdr`
--
ALTER TABLE `hargajual_hdr`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `harga_juals`
--
ALTER TABLE `harga_juals`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `histori_stok`
--
ALTER TABLE `histori_stok`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `info_toko`
--
ALTER TABLE `info_toko`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `klasifikasis`
--
ALTER TABLE `klasifikasis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `klasifikasis_klasifikasi_unique` (`klasifikasi`);

--
-- Indeks untuk tabel `kontaks`
--
ALTER TABLE `kontaks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kontaks_kode_kontak_unique` (`kode_kontak`);

--
-- Indeks untuk tabel `kontak_details`
--
ALTER TABLE `kontak_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kurirs`
--
ALTER TABLE `kurirs`
  ADD PRIMARY KEY (`id_kurir`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `pembayarans`
--
ALTER TABLE `pembayarans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pembayarans_no_reff_unique` (`no_reff`);

--
-- Indeks untuk tabel `pembayaran_details`
--
ALTER TABLE `pembayaran_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pembelians`
--
ALTER TABLE `pembelians`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pembelian_details`
--
ALTER TABLE `pembelian_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penerimaan_detail_kas`
--
ALTER TABLE `penerimaan_detail_kas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penerimaan_kas`
--
ALTER TABLE `penerimaan_kas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `penerimaan_kas_no_cek_unique` (`no_cek`);

--
-- Indeks untuk tabel `pengeluaran_kas`
--
ALTER TABLE `pengeluaran_kas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pengeluaran_kas_no_cek_unique` (`no_cek`);

--
-- Indeks untuk tabel `pengeluaran_kas_details`
--
ALTER TABLE `pengeluaran_kas_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penjualans`
--
ALTER TABLE `penjualans`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penjualan_deatails`
--
ALTER TABLE `penjualan_deatails`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penjualan_details`
--
ALTER TABLE `penjualan_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penyesuaians`
--
ALTER TABLE `penyesuaians`
  ADD PRIMARY KEY (`id`,`no_reff`,`tanggal`,`departement_id`,`gudang_asal`),
  ADD UNIQUE KEY `penyesuaians_no_reff_unique` (`no_reff`);

--
-- Indeks untuk tabel `penyesuaian_details`
--
ALTER TABLE `penyesuaian_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `piutangs`
--
ALTER TABLE `piutangs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `piutangs_no_reff_unique` (`no_reff`);

--
-- Indeks untuk tabel `piutang_details`
--
ALTER TABLE `piutang_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `printer_tab`
--
ALTER TABLE `printer_tab`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product_uoms`
--
ALTER TABLE `product_uoms`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `produk_cicilan`
--
ALTER TABLE `produk_cicilan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `produk_uoms`
--
ALTER TABLE `produk_uoms`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `sub_klasifikasis`
--
ALTER TABLE `sub_klasifikasis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sub_klasifikasis_subklasifikasi_unique` (`subklasifikasi`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transfers_no_reff_unique` (`no_reff`);

--
-- Indeks untuk tabel `transfer_details`
--
ALTER TABLE `transfer_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transfer_kas`
--
ALTER TABLE `transfer_kas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transfer_kas_no_reff_unique` (`no_reff`);

--
-- Indeks untuk tabel `uoms`
--
ALTER TABLE `uoms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uoms_kode_uom_unique` (`kode_uom`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `akuns`
--
ALTER TABLE `akuns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `departements`
--
ALTER TABLE `departements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `gudangs`
--
ALTER TABLE `gudangs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `hargabeli`
--
ALTER TABLE `hargabeli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `hargabeli_detail`
--
ALTER TABLE `hargabeli_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `hargajual`
--
ALTER TABLE `hargajual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT untuk tabel `hargajual_hdr`
--
ALTER TABLE `hargajual_hdr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT untuk tabel `harga_juals`
--
ALTER TABLE `harga_juals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `histori_stok`
--
ALTER TABLE `histori_stok`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT untuk tabel `info_toko`
--
ALTER TABLE `info_toko`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `klasifikasis`
--
ALTER TABLE `klasifikasis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kontaks`
--
ALTER TABLE `kontaks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT untuk tabel `kontak_details`
--
ALTER TABLE `kontak_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT untuk tabel `kurirs`
--
ALTER TABLE `kurirs`
  MODIFY `id_kurir` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `pembayarans`
--
ALTER TABLE `pembayarans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pembayaran_details`
--
ALTER TABLE `pembayaran_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pembelians`
--
ALTER TABLE `pembelians`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT untuk tabel `pembelian_details`
--
ALTER TABLE `pembelian_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT untuk tabel `penerimaan_detail_kas`
--
ALTER TABLE `penerimaan_detail_kas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `penerimaan_kas`
--
ALTER TABLE `penerimaan_kas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengeluaran_kas`
--
ALTER TABLE `pengeluaran_kas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pengeluaran_kas_details`
--
ALTER TABLE `pengeluaran_kas_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `penjualans`
--
ALTER TABLE `penjualans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `penjualan_deatails`
--
ALTER TABLE `penjualan_deatails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `penjualan_details`
--
ALTER TABLE `penjualan_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT untuk tabel `penyesuaians`
--
ALTER TABLE `penyesuaians`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `penyesuaian_details`
--
ALTER TABLE `penyesuaian_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `piutangs`
--
ALTER TABLE `piutangs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `piutang_details`
--
ALTER TABLE `piutang_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `printer_tab`
--
ALTER TABLE `printer_tab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT untuk tabel `product_uoms`
--
ALTER TABLE `product_uoms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `produk_cicilan`
--
ALTER TABLE `produk_cicilan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `produk_uoms`
--
ALTER TABLE `produk_uoms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `sub_klasifikasis`
--
ALTER TABLE `sub_klasifikasis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `transfer_details`
--
ALTER TABLE `transfer_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `transfer_kas`
--
ALTER TABLE `transfer_kas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `uoms`
--
ALTER TABLE `uoms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
