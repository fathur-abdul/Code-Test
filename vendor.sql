-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2024 at 05:09 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beras`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id_admin` varchar(20) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `foto` varchar(20) DEFAULT NULL,
  `superadmin` tinyint(1) NOT NULL DEFAULT 0,
  `diblokir` tinyint(1) NOT NULL DEFAULT 0,
  `tanggal_bergabung` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id_admin`, `nama_lengkap`, `email`, `password`, `foto`, `superadmin`, `diblokir`, `tanggal_bergabung`) VALUES
('ADM2409242', 'Fathur Abdul Halim', 'fathurabdul@email.com', '$2y$10$jZHn1BE5UtmAF4xjMkED6uSmDF/1mX2lJtC34CwKNq0DbYJ/Cwsim', 'ADM2409242.png', 1, 0, '2024-09-24 15:06:43'),
('ADM2409243', 'admin', 'admin@email.com', '$2y$10$.3LmFAP93zKPeJ2nk9.rZuPSPb6RwiUBe9fdhOPgIrk6SQ2mDmHne', 'default.png', 0, 0, '2024-09-24 15:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `id_kategori` varchar(20) NOT NULL,
  `id_merk` varchar(20) NOT NULL,
  `deskripsi_barang` text NOT NULL,
  `berat_barang` varchar(25) NOT NULL,
  `harga_satuan` int(11) NOT NULL,
  `stok_barang` int(11) NOT NULL,
  `foto_barang` varchar(30) NOT NULL,
  `tanggal_masuk` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`id_barang`, `nama_barang`, `id_kategori`, `id_merk`, `deskripsi_barang`, `berat_barang`, `harga_satuan`, `stok_barang`, `foto_barang`, `tanggal_masuk`) VALUES
('BRG2409241', 'Rendang', 'KTG2409242', 'RM2409241', '<p>Lorem Ipsum</p>', '1', 1, 12, 'BRG2409241.jpeg', '2024-09-24 17:06:55');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_detail_pengguna`
--

CREATE TABLE `tbl_detail_pengguna` (
  `id_pengguna` varchar(20) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(15) DEFAULT NULL,
  `alamat_rumah` text DEFAULT NULL,
  `no_telepon` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_detail_pengguna`
--

INSERT INTO `tbl_detail_pengguna` (`id_pengguna`, `nama_lengkap`, `jenis_kelamin`, `alamat_rumah`, `no_telepon`) VALUES
('PGN2409241', 'user', 'Pria', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_detail_pesanan`
--

CREATE TABLE `tbl_detail_pesanan` (
  `id_pesanan` varchar(20) NOT NULL,
  `id_barang` varchar(20) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `subtotal_berat` double NOT NULL,
  `subtotal_biaya` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_detail_pesanan`
--

INSERT INTO `tbl_detail_pesanan` (`id_pesanan`, `id_barang`, `jumlah_beli`, `subtotal_berat`, `subtotal_biaya`) VALUES
('PSN1811041', 'BRG1810131', 3, 1500, 1020000),
('PSN1811041', 'BRG1810242', 2, 666, 1180000),
('PSN1811041', 'BRG1810131', 3, 1500, 1020000),
('PSN1811041', 'BRG1810242', 2, 666, 1180000),
('PSN2409251', 'BRG2409241', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_invoice`
--

CREATE TABLE `tbl_invoice` (
  `id_invoice` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pesanan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pengguna` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_dibuat` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `id_kategori` varchar(20) NOT NULL,
  `nama_kategori` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`id_kategori`, `nama_kategori`) VALUES
('KTG2409241', 'Makanan Sunda'),
('KTG2409242', 'Makanan Padang');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_keranjang`
--

CREATE TABLE `tbl_keranjang` (
  `id_pengguna` varchar(20) NOT NULL,
  `id_barang` varchar(20) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `subtotal_biaya` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lupa_password`
--

CREATE TABLE `tbl_lupa_password` (
  `email` varchar(30) NOT NULL,
  `token` varchar(50) NOT NULL,
  `tanggal_dibuat` date NOT NULL,
  `tanggal_dihapus` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_merk`
--

CREATE TABLE `tbl_merk` (
  `id_merk` varchar(20) NOT NULL,
  `nama_merk` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_merk`
--

INSERT INTO `tbl_merk` (`id_merk`, `nama_merk`) VALUES
('RM2409241', 'imas');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pembayaran`
--

CREATE TABLE `tbl_pembayaran` (
  `id_pesanan` varchar(20) NOT NULL,
  `id_pengguna` varchar(20) NOT NULL,
  `bank` varchar(20) NOT NULL,
  `atas_nama` varchar(30) NOT NULL,
  `no_rekening` varchar(20) NOT NULL,
  `foto_bukti` varchar(30) DEFAULT NULL,
  `status_pembayaran` tinyint(1) NOT NULL DEFAULT 0,
  `batas_pembayaran` date NOT NULL,
  `tanggal_upload` datetime DEFAULT current_timestamp(),
  `selesai` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_pembayaran`
--

INSERT INTO `tbl_pembayaran` (`id_pesanan`, `id_pengguna`, `bank`, `atas_nama`, `no_rekening`, `foto_bukti`, `status_pembayaran`, `batas_pembayaran`, `tanggal_upload`, `selesai`) VALUES
('PSN2409251', 'PGN2409241', 'BCA', 'Fathur', '98139139', NULL, 0, '2024-09-26', '2024-09-25 10:07:08', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pengguna`
--

CREATE TABLE `tbl_pengguna` (
  `id_pengguna` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `tanggal_bergabung` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_pengguna`
--

INSERT INTO `tbl_pengguna` (`id_pengguna`, `email`, `password`, `tanggal_bergabung`) VALUES
('PGN2409241', 'user@email.com', '$2y$10$0hjQ9nZownmxkJ252AAfw.CmpubHWb4TpIMpKjBdR1hdwrpWal/OO', '2024-09-24 16:12:19');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pesanan`
--

CREATE TABLE `tbl_pesanan` (
  `id_pesanan` varchar(20) NOT NULL,
  `id_pengguna` varchar(20) NOT NULL,
  `nama_penerima` varchar(40) NOT NULL,
  `alamat_tujuan` text NOT NULL,
  `no_telepon` varchar(18) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `layanan` varchar(5) NOT NULL,
  `ongkos_kirim` double NOT NULL,
  `total_bayar` double NOT NULL,
  `no_resi` varchar(30) DEFAULT NULL,
  `status_pesanan` tinyint(4) NOT NULL DEFAULT 0,
  `dibatalkan` tinyint(1) NOT NULL DEFAULT 0,
  `tanggal_dikirim` datetime DEFAULT NULL,
  `tanggal_diterima` datetime DEFAULT NULL,
  `tanggal_pesanan` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_pesanan`
--

INSERT INTO `tbl_pesanan` (`id_pesanan`, `id_pengguna`, `nama_penerima`, `alamat_tujuan`, `no_telepon`, `keterangan`, `layanan`, `ongkos_kirim`, `total_bayar`, `no_resi`, `status_pesanan`, `dibatalkan`, `tanggal_dikirim`, `tanggal_diterima`, `tanggal_pesanan`) VALUES
('PSN2409251', 'PGN2409241', 'fathur', 'Jl. jalanan|Kota. Bandung, Jawa Barat', '0858617238', NULL, 'JTR', 45000, 1, NULL, 0, 0, NULL, NULL, '2024-09-25 10:07:08');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_verifikasi_akun`
--

CREATE TABLE `tbl_verifikasi_akun` (
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `tbl_admin_email_unique` (`email`);

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `tbl_barang_id_kategori_index` (`id_kategori`),
  ADD KEY `id_merk` (`id_merk`);

--
-- Indexes for table `tbl_detail_pengguna`
--
ALTER TABLE `tbl_detail_pengguna`
  ADD UNIQUE KEY `tbl_detail_pengguna_id_pengguna_unique` (`id_pengguna`);

--
-- Indexes for table `tbl_detail_pesanan`
--
ALTER TABLE `tbl_detail_pesanan`
  ADD KEY `tbl_detail_pesanan_id_barang_index` (`id_barang`),
  ADD KEY `id_pesanan` (`id_pesanan`);

--
-- Indexes for table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  ADD PRIMARY KEY (`id_invoice`),
  ADD UNIQUE KEY `id_pesanan` (`id_pesanan`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `tbl_keranjang`
--
ALTER TABLE `tbl_keranjang`
  ADD KEY `id_pengguna` (`id_pengguna`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `tbl_lupa_password`
--
ALTER TABLE `tbl_lupa_password`
  ADD UNIQUE KEY `tbl_lupa_password_email_unique` (`email`);

--
-- Indexes for table `tbl_merk`
--
ALTER TABLE `tbl_merk`
  ADD PRIMARY KEY (`id_merk`);

--
-- Indexes for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD UNIQUE KEY `id_pesanan` (`id_pesanan`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `tbl_pengguna`
--
ALTER TABLE `tbl_pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD UNIQUE KEY `tbl_pengguna_email_unique` (`email`);

--
-- Indexes for table `tbl_pesanan`
--
ALTER TABLE `tbl_pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `tbl_pesanan_id_pengguna_index` (`id_pengguna`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD CONSTRAINT `tbl_barang_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tbl_kategori` (`id_kategori`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_barang_ibfk_2` FOREIGN KEY (`id_merk`) REFERENCES `tbl_merk` (`id_merk`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_detail_pengguna`
--
ALTER TABLE `tbl_detail_pengguna`
  ADD CONSTRAINT `tbl_detail_pengguna_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `tbl_pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_detail_pesanan`
--
ALTER TABLE `tbl_detail_pesanan`
  ADD CONSTRAINT `tbl_detail_pesanan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tbl_barang` (`id_barang`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_detail_pesanan_ibfk_2` FOREIGN KEY (`id_pesanan`) REFERENCES `tbl_pesanan` (`id_pesanan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_keranjang`
--
ALTER TABLE `tbl_keranjang`
  ADD CONSTRAINT `tbl_keranjang_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tbl_barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_keranjang_ibfk_2` FOREIGN KEY (`id_pengguna`) REFERENCES `tbl_pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD CONSTRAINT `tbl_pembayaran_ibfk_1` FOREIGN KEY (`id_pesanan`) REFERENCES `tbl_pesanan` (`id_pesanan`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_pembayaran_ibfk_2` FOREIGN KEY (`id_pengguna`) REFERENCES `tbl_pesanan` (`id_pengguna`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_pesanan`
--
ALTER TABLE `tbl_pesanan`
  ADD CONSTRAINT `tbl_pesanan_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `tbl_pengguna` (`id_pengguna`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
