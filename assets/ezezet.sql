-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2021 at 08:18 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ezezet`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID_ADMIN` varchar(10) NOT NULL,
  `USERNAME` varchar(128) DEFAULT NULL,
  `PASSWORD` mediumtext DEFAULT NULL,
  `LAST_LOGIN` varchar(40) DEFAULT NULL,
  `ROLE` varchar(15) DEFAULT NULL,
  `FULLNAME` varchar(128) DEFAULT NULL,
  `JENKEL` char(1) DEFAULT NULL,
  `NO_TELP` varchar(20) DEFAULT NULL,
  `ALAMAT` mediumtext DEFAULT NULL,
  `PHOTO` mediumtext DEFAULT NULL,
  `DTE_CREATED` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID_ADMIN`, `USERNAME`, `PASSWORD`, `LAST_LOGIN`, `ROLE`, `FULLNAME`, `JENKEL`, `NO_TELP`, `ALAMAT`, `PHOTO`, `DTE_CREATED`) VALUES
('AD001', 'admin', '21232f297a57a5a743894a0e4a801fc3', '15-07-2021 08:07:19', 'superadmin', 'Alif Fadhil Wibowo', 'L', '087820571558', 'Jl.Lamper Mijen RT 01 / RW 05 Semarang', 'default.png', '2017-06-14'),
('AD003', 'hasim', 'd094c0a6c7ec4f01f75837ace20925fa', '15-07-2021 08:03:25', 'admin', 'Hasim Rochmad', 'L', '088788899', 'Jl semeru', 'Image_2d6d9b2.jpg', '2017-06-16'),
('AD004', 'tacik', '977dca586aea0eac2674a89793e252ec', '26-06-2017 18:12:38', 'admin', 'Riski Ananda W. P.', 'P', '087820562445', 'Jl.Tlogosari Raya No 655 Semarang', 'default.png', '2017-06-20'),
('AD005', 'ravi', '63dd3e154ca6d948fc380fa576343ba6', '24-06-2017 11:46:32', 'admin', 'Rafi Agatha', 'L', '085640025301', 'Jl.Lempongsari Selatan No 338A Semarang', 'default.png', '2017-06-21'),
('AD006', 'rehan', '8625d1c13eaf0a75068d3cf2cdde43f6', '16-07-2017 14:46:29', 'admin', 'Rehan Arroihan', 'L', '0897789088', 'Jl Jalan id', 'stdmp.png', '2017-06-24'),
('AD007', 'rasta', '25f423bce283a8d0cbb66252da5d3cdd', '16-06-2021 06:22:09', 'superadmin', 'Rasta Hirgawana', 'P', '085641195718', 'Jl.Lamper Mijen RT01/RW05 Semarang', 'default.png', '2017-07-11');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `ID_ANGGOTA` varchar(10) NOT NULL,
  `ID_ADMIN` varchar(10) DEFAULT NULL,
  `FULL_NAME` varchar(128) DEFAULT NULL,
  `TMP_LAHIR` varchar(90) DEFAULT NULL,
  `TGL_LAHIR` varchar(20) DEFAULT NULL,
  `ALAMAT` mediumtext DEFAULT NULL,
  `GENDER` char(1) DEFAULT NULL,
  `TELP` varchar(20) DEFAULT NULL,
  `FOTO` mediumtext DEFAULT NULL,
  `D_CREATED` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`ID_ANGGOTA`, `ID_ADMIN`, `FULL_NAME`, `TMP_LAHIR`, `TGL_LAHIR`, `ALAMAT`, `GENDER`, `TELP`, `FOTO`, `D_CREATED`) VALUES
('AGT001', 'AD001', 'Multazam Arroihan G', 'Semarang', '02/20/2000', 'Jl. Danau Kerinci V G6D4, Sawojajar, Semarang', 'L', '085733573529', '20__Multazam_A_.JPG', '2017-06-16'),
('AGT002', 'AD001', 'Galbie Putri Noor', 'Semarang', '06/16/2017', 'Jl. Kawi no. 89, Semarang', 'P', '0897786788954', '12__GALBIE_ELINOUR.JPG', '2017-06-16'),
('AGT003', 'AD001', 'Alfan Cahyo Wicaksono', 'Malang', '10/13/1998', 'Jl. Silak Kesam 101', 'L', '087669887654', '2__Alfan_Cahyo_.JPG', '2017-06-16'),
('AGT004', 'AD001', 'Sasna Salsabila Hapsari', 'Madiun', '03/08/1999', 'Perum. Aspol 443, Kota Madiun', 'P', '0818897546788', '30__Sasna_S_.JPG', '2017-06-16'),
('AGT005', 'AD001', 'Riski Ananda Widiya P', 'Tulungagung', '02/19/2000', 'Perum. Grand Emerald ZU3, Tulungagung', 'P', '093889765643', '31__Riski_Ananda.JPG', '2017-06-16'),
('AGT006', 'AD001', 'Anggyanisa Mutia Putri', 'Madiun', '08/18/2000', 'Gg. Pattimura 89', 'P', '085389755644', '2__Anddyanisa_M_.JPG', '2017-06-16'),
('AGT007', 'AD001', 'Prasetya Ananta W. S.', 'Malang', '06/16/1999', 'Sulfat Indah 89', 'L', '08267599432', '28__Prsetya_Ananta.JPG', '2017-06-16'),
('AGT008', 'AD001', 'Irvina Firadila', 'Lumajang', '08/12/1999', 'Ds. Sambungrejo RT. 4 RW. 7 Kec. Welasasih, Lumajang', 'P', '0876654897765', '14__Irvina_F_.JPG', '2017-06-16'),
('AGT009', 'AD001', 'Ridhwan Rofianto', 'Surabaya', '04/01/2001', 'Mburine cito', 'L', '089776598334', '29__RIDHWAN_ROFIANTO.JPG', '2017-06-16'),
('AGT010', 'AD001', 'Muhamad Iqbal Samudra', 'Banyuwangi', '04/05/2000', 'Ds. Sumoharjo, RT. 5 RW. 9', 'L', '08677564987', '18__Muh__Iqbal.JPG', '2017-06-16'),
('AGT011', 'AD001', 'Nabila Hanggana Raras', 'Sidoarjo', '03/08/2000', 'Perum. Sugih Asri F32, Candi, Sidoarjo', 'P', '084876835267', '28__Nabila_Hanggana_Raras.JPG', '2017-06-16'),
('AGT012', 'AD001', 'Erika Prafitasari Rotinsulu', 'Sidoarjo', '08/04/2000', 'Perum. Bumi Citra Fajar A76, Sekardangan, Sidoarjo', 'P', '08567498256', '9__Erika_P_.JPG', '2017-06-16'),
('AGT013', 'AD001', 'Nico Ardian Nugroho', 'Semarang', '04/02/2000', 'Jl. Sironggo Ajoh Kav. 4, Semarang', 'L', '089765689645', '24__Nico_Ardian.JPG', '2017-06-16'),
('AGT014', 'AD001', 'Ad Reana Vidya', 'Malang', '06/29/2000', 'Perum. Siswa Taman AG65, Kepanjen', 'P', '087995764839', '2__Ad_Reana.JPG', '2017-06-29'),
('AGT015', 'AD001', 'Vejryn Shaviero', 'Jember', '06/10/2000', 'Jl. Utama Kota gg. 6, Jember', 'L', '088786368495', '34__VEJRYN_SHAVIERO.JPG', '2017-06-29'),
('AGT016', 'AD001', 'Ridjal Fathoni Rosyidi', 'Tuban', '07/09/1998', 'Jl. Alun alun kota', 'L', '08766754345', '19__Muh__Ridjal.JPG', '2017-07-09');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pinjam`
--

CREATE TABLE `detail_pinjam` (
  `ID_DIPINJAM` int(11) NOT NULL,
  `ID_PINJAM` varchar(10) DEFAULT NULL,
  `ID_PC` varchar(10) DEFAULT NULL,
  `TGL_KEMBALI` date DEFAULT NULL,
  `BAYAR` int(11) DEFAULT NULL,
  `STATUS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pinjam`
--

INSERT INTO `detail_pinjam` (`ID_DIPINJAM`, `ID_PINJAM`, `ID_PC`, `TGL_KEMBALI`, `BAYAR`, `STATUS`) VALUES
(13, 'P170623001', 'BKO005', '2017-06-25', 0, 'Sudah Kembali'),
(14, 'P170623001', 'BKO008', '2021-06-10', 720500, 'Sudah Kembali'),
(15, 'P170623001', 'BKO013', '2021-06-10', 720500, 'Sudah Kembali'),
(16, 'P170623002', 'BKO008', '2021-06-10', 720500, 'Sudah Kembali'),
(17, 'P170624001', 'BKO013', '2017-07-09', 4000, 'Sudah Kembali'),
(18, 'P170624001', 'BKO007', '2021-06-16', 723000, 'Sudah Kembali'),
(19, 'P170624001', 'BKO011', '2021-06-16', 723000, 'Sudah Kembali'),
(21, 'P170624002', 'BKO005', '2021-06-16', 723000, 'Sudah Kembali'),
(22, 'P170624002', 'BKO007', '2021-06-16', 723000, 'Sudah Kembali'),
(23, 'P170624003', 'BKO011', '2021-06-16', 723000, 'Sudah Kembali'),
(24, 'P170624003', 'BKO004', '2021-06-16', 723000, 'Sudah Kembali'),
(25, 'P170624003', 'BKO015', '2021-06-16', 723000, 'Sudah Kembali'),
(26, 'P170624004', 'BKO017', '2017-06-25', 0, 'Sudah Kembali'),
(27, 'P170624005', 'BKO013', '2021-06-16', 723000, 'Sudah Kembali'),
(28, 'P170624005', 'BKO006', '2021-06-16', 723000, 'Sudah Kembali'),
(29, 'P170624006', 'BKO011', '2017-06-25', 0, 'Sudah Kembali'),
(30, 'P170624006', 'BKO018', '2017-07-10', 4500, 'Sudah Kembali'),
(31, 'P170625001', 'BKO019', '2021-06-16', 722500, 'Sudah Kembali'),
(32, 'P170625001', 'BKO020', '2021-06-16', 722500, 'Sudah Kembali'),
(33, 'P170625001', 'BKO021', '2021-06-16', 722500, 'Sudah Kembali'),
(34, 'P170625002', 'BKO010', '2017-07-09', 3500, 'Sudah Kembali'),
(35, 'P170625002', 'BKO016', '2021-06-16', 62000, 'Sudah Kembali'),
(36, 'P170626001', 'BKO012', '2021-06-16', 62000, 'Sudah Kembali'),
(37, 'P170626001', 'BKO009', '2021-06-16', 62000, 'Sudah Kembali'),
(38, 'P170626001', 'BKO014', '2021-06-16', 62000, 'Sudah Kembali'),
(39, 'P170626002', 'BKO014', '2021-06-16', 62000, 'Sudah Kembali'),
(40, 'P170626002', 'BKO010', '2021-06-16', 62000, 'Sudah Kembali'),
(41, 'P170629001', 'BKO013', '2021-06-16', 62000, 'Sudah Kembali'),
(42, 'P170629001', 'BKO009', '2021-06-16', 62000, 'Sudah Kembali'),
(43, 'P170629002', 'BKO010', '2021-06-16', 62000, 'Sudah Kembali'),
(44, 'P170629002', 'BKO016', '2021-06-16', 62000, 'Sudah Kembali'),
(45, 'P170629002', 'BKO012', '2021-06-16', 62000, 'Sudah Kembali'),
(46, 'P170709001', 'BKO020', '2021-06-16', 61500, 'Sudah Kembali'),
(47, 'P170709001', 'BKO011', '2021-06-16', 61500, 'Sudah Kembali'),
(48, 'P170709002', 'BKO022', '2021-06-16', 61500, 'Sudah Kembali'),
(49, 'P170709002', 'BKO021', '2021-06-16', 61500, 'Sudah Kembali'),
(50, 'P210616001', 'BKO004', '2021-06-16', 0, 'Sudah Kembali'),
(51, 'P210616002', 'BKO010', '2021-06-16', 0, 'Sudah Kembali'),
(52, 'P210616003', 'BKO020', '2021-06-16', 0, 'Sudah Kembali'),
(53, 'P210616004', 'BKO014', NULL, 0, 'Belum Kembali'),
(54, 'P210616005', 'BKO018', NULL, 0, 'Belum Kembali'),
(55, 'P210616006', 'BKO019', NULL, 0, 'Belum Kembali'),
(56, 'P210616007', 'BKO021', NULL, 0, 'Belum Kembali');

-- --------------------------------------------------------

--
-- Table structure for table `notif`
--

CREATE TABLE `notif` (
  `ID_NOTIF` int(11) NOT NULL,
  `ID_ADMIN` varchar(128) NOT NULL,
  `JUDUL` varchar(128) NOT NULL,
  `ISI` varchar(128) NOT NULL,
  `DT` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notif`
--

INSERT INTO `notif` (`ID_NOTIF`, `ID_ADMIN`, `JUDUL`, `ISI`, `DT`) VALUES
(12, 'AD001', 'Hallo', 'Selamat Pagi Semua', '2021-06-16'),
(13, 'AD001', 'Tes Perlengkapan', 'Cek semua Perlengkapan Yang Ada', '2021-06-16'),
(14, 'AD007', 'Hallo', 'Selamat siang. jangan lupa sholat dhuhr, cekno tenang atine', '2021-06-16');

-- --------------------------------------------------------

--
-- Table structure for table `pc`
--

CREATE TABLE `pc` (
  `ID_PC` varchar(10) NOT NULL,
  `ID_ADMIN` varchar(10) DEFAULT NULL,
  `TITLE` varchar(150) DEFAULT NULL,
  `PUBLISHER` varchar(128) DEFAULT NULL,
  `YEAR` char(4) DEFAULT NULL,
  `QTY` int(11) DEFAULT NULL,
  `KELUAR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pc`
--

INSERT INTO `pc` (`ID_PC`, `ID_ADMIN`, `TITLE`, `PUBLISHER`, `YEAR`, `QTY`, `KELUAR`) VALUES
('BKO004', 'AD003', 'Processor : AMD Ryzen 7 X4600 \r\n// VGA : RTX 2080 TI\r\n// Motherboard : Asrock AB350 Pro 4\r\n// Ram : 16 GB\r\n// PSU : 800 w', 'HP (Hawlett Packart)', '2019', 3, 1),
('BKO005', 'AD001', 'Processor : AMD Ryzen 5 X4600 \r\n// VGA : RTX 2080 TI\r\n// Motherboard : Asrock AB350 Pro 4\r\n// Ram : 16 GB\r\n// PSU : 800 w', 'HP (Hawlett Packart)', '2019', 3, 0),
('BKO006', 'AD001', 'Processor : AMD Ryzen 7 2400G \r\n// VGA : RX 560 \r\n// Motherboard : Asrock AB350 Pro 4\r\n// Ram : 16 GB\r\n// PSU : 800 w', 'HP (Hawlett Packart)', '2019', 3, 0),
('BKO007', 'AD001', 'Processor : AMD Ryzen 5 2400G\r\n// VGA : RX 560 \r\n// Motherboard : Asrock AB350 Pro 4\r\n// Ram : 16 GB\r\n// PSU : 800 w', 'HP (Hawlett Packart)', '2019', 3, 0),
('BKO008', 'AD001', 'Processor : Intel i7  Gen5 \r\n// VGA : RTX 2080 TI\r\n// Motherboard : Rog Strinx 5400\r\n// Ram : 16 GB\r\n// PSU : 800 w', 'Asus', '2019', 2, 0),
('BKO009', 'AD001', 'Processor : Intel i5  Gen7 \r\n// VGA : RTX 2080 TI\r\n// Motherboard : Rog Strinx 5400\r\n// Ram : 16 GB\r\n// PSU : 800 w', 'Asus', '2019', 3, 0),
('BKO010', 'AD001', 'Processor : Intel i7  Gen5 \r\n// VGA : GTX 1080 TI\r\n// Motherboard : Rog Strinx 5400\r\n// Ram : 16 GB\r\n// PSU : 800 w', 'Asus', '2019', 6, 0),
('BKO011', 'AD001', 'Processor : Intel i5  Gen7 \r\n// VGA : GTX 1080 TI\r\n// Motherboard : Rog Strinx 5400\r\n// Ram : 16 GB\r\n// PSU : 800 w', 'Asus', '2019', 6, 0),
('BKO012', 'AD001', 'Processor : Intel i7  Gen7 \r\n// VGA : GTX 1080 TI\r\n// Motherboard : Biostar B3400\r\n// Ram : 8 GB\r\n// PSU : 800 w', 'Dell', '2019', 3, 0),
('BKO013', 'AD001', 'Processor : Intel i3  Gen5 \r\n// VGA : GTX 2080 TI\r\n// Motherboard : Biostar B3400\r\n// Ram : 16 GB\r\n// PSU : 800 w', 'Dell', '2019', 9, 0),
('BKO014', 'AD001', 'Processor : Intel i3  Gen7 \r\n// VGA : GTX 2080 TI\r\n// Motherboard : Biostar B3400\r\n// Ram : 16 GB\r\n// PSU : 800 w', 'Dell', '2019', 1, 1),
('BKO015', 'AD001', 'Processor : AMD A10  \r\n// VGA : RX 480 \r\n// Motherboard : Asrock B3400\r\n// Ram : 8 GB\r\n// PSU : 600 w', 'HP (Hawlett Packart)', '2019', 4, 0),
('BKO016', 'AD001', 'Processor : AMD A10  \r\n// VGA : RX 480 \r\n// Motherboard : Asrock B3400\r\n// Ram : 16 GB\r\n// PSU : 600 w', 'Moklet Publisher', '2019', 4, 0),
('BKO017', 'AD001', 'Processor : AMD A12\r\n// VGA : RX 480 \r\n// Motherboard : Asrock B3400\r\n// Ram : 16 GB\r\n// PSU : 600 w', 'HP (Hawlett Packart)', '2019', 3, 0),
('BKO018', 'AD001', 'Processor : AMD A12  \r\n// VGA : RX 560 \r\n// Motherboard : Asrock B3400\r\n// Ram : 16 GB\r\n// PSU : 600 w', 'HP (Hawlett Packart)', '2019', 2, 1),
('BKO019', 'AD001', 'Processor : AMD FX 3400  \r\n// VGA : GTX 1060 \r\n// Motherboard : Asrock B3400\r\n// Ram : 8 GB\r\n// PSU : 800 w', 'Asus', '2020', 5, 1),
('BKO020', 'AD001', 'Processor : AMD FX 3400  \r\n// VGA : GTX 1060 \r\n// Motherboard : Asrock B3400\r\n// Ram : 16 GB\r\n// PSU : 800 w', 'Asus', '2020', 5, 0),
('BKO021', 'AD001', 'Processor : AMD FX 3400  \r\n// VGA : GTX 1060 TI \r\n// Motherboard : Asrock B3400\r\n// Ram : 8 GB\r\n// PSU : 600 w', 'Asus', '2020', 1, 1),
('BKO022', 'AD001', 'Processor : AMD FX 3400  \r\n// VGA : GTX 1060 TI \r\n// Motherboard : Asrock B3400\r\n// Ram : 16 GB\r\n// PSU : 800 w', 'Asus', '2021', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pemakaian`
--

CREATE TABLE `pemakaian` (
  `ID_PINJAM` varchar(10) NOT NULL,
  `ID_ANGGOTA` varchar(10) DEFAULT NULL,
  `ID_ADMIN` varchar(10) DEFAULT NULL,
  `TGL_PINJAM` date DEFAULT NULL,
  `STATS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemakaian`
--

INSERT INTO `pemakaian` (`ID_PINJAM`, `ID_ANGGOTA`, `ID_ADMIN`, `TGL_PINJAM`, `STATS`) VALUES
('P170623001', 'AGT002', 'AD004', '2017-06-23', 'Sudah Kembali'),
('P170623002', 'AGT003', 'AD005', '2017-06-23', 'Sudah Kembali'),
('P170624001', 'AGT007', 'AD005', '2017-06-24', 'Sudah Kembali'),
('P170624002', 'AGT008', 'AD005', '2017-06-24', 'Sudah Kembali'),
('P170624003', 'AGT004', 'AD005', '2017-06-24', 'Sudah Kembali'),
('P170624004', 'AGT001', 'AD004', '2017-06-24', 'Sudah Kembali'),
('P170624005', 'AGT007', 'AD004', '2017-06-24', 'Sudah Kembali'),
('P170624006', 'AGT003', 'AD006', '2017-06-24', 'Sudah Kembali'),
('P170625001', 'AGT013', 'AD006', '2017-06-25', 'Sudah Kembali'),
('P170625002', 'AGT010', 'AD006', '2017-06-25', 'Sudah Kembali'),
('P170626001', 'AGT006', 'AD004', '2017-06-26', 'Sudah Kembali'),
('P170626002', 'AGT012', 'AD004', '2017-06-26', 'Sudah Kembali'),
('P170629001', 'AGT014', 'AD006', '2017-06-29', 'Sudah Kembali'),
('P170629002', 'AGT015', 'AD006', '2017-06-29', 'Sudah Kembali'),
('P170709001', 'AGT011', 'AD006', '2017-07-09', 'Sudah Kembali'),
('P170709002', 'AGT016', 'AD006', '2017-07-09', 'Sudah Kembali'),
('P210616001', 'AGT001', 'AD003', '2021-06-16', 'Sudah Kembali'),
('P210616002', 'AGT007', 'AD003', '2021-06-16', 'Sudah Kembali'),
('P210616003', 'AGT008', 'AD003', '2021-06-16', 'Sudah Kembali'),
('P210616004', 'AGT003', 'AD003', '2021-06-16', 'Belum Kembali'),
('P210616005', 'AGT014', 'AD003', '2021-06-16', 'Belum Kembali'),
('P210616006', 'AGT002', 'AD003', '2021-06-16', 'Belum Kembali'),
('P210616007', 'AGT016', 'AD003', '2021-06-16', 'Belum Kembali');

-- --------------------------------------------------------

--
-- Table structure for table `warnet`
--

CREATE TABLE `warnet` (
  `ID_WARNET` int(11) NOT NULL,
  `NAMA_P` varchar(128) DEFAULT NULL,
  `ALAMAT_P` mediumtext DEFAULT NULL,
  `ABOUT` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `warnet`
--

INSERT INTO `warnet` (`ID_WARNET`, `NAMA_P`, `ALAMAT_P`, `ABOUT`) VALUES
(3, 'Warnet Ezezet', 'jalan lamper mijen RT 01 RW 05 No. 338A kelurahan lamper tengah kecamatan semarang selatan kota semarang jawa tengah', 'database ezezet');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_ADMIN`),
  ADD UNIQUE KEY `ADMIN_PK` (`ID_ADMIN`);

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`ID_ANGGOTA`),
  ADD UNIQUE KEY `ANGGOTA_PK` (`ID_ANGGOTA`),
  ADD KEY `MAKE_FK` (`ID_ADMIN`);

--
-- Indexes for table `detail_pinjam`
--
ALTER TABLE `detail_pinjam`
  ADD PRIMARY KEY (`ID_DIPINJAM`),
  ADD UNIQUE KEY `DETAIL_PINJAM_PK` (`ID_DIPINJAM`),
  ADD KEY `MEMILIKI_FK` (`ID_PINJAM`),
  ADD KEY `MENGAMBIL_FK` (`ID_PC`);

--
-- Indexes for table `notif`
--
ALTER TABLE `notif`
  ADD PRIMARY KEY (`ID_NOTIF`),
  ADD KEY `FK_NOTIF_MEMBUAT_ADMIN` (`ID_ADMIN`);

--
-- Indexes for table `pc`
--
ALTER TABLE `pc`
  ADD PRIMARY KEY (`ID_PC`),
  ADD UNIQUE KEY `PC_PK` (`ID_PC`),
  ADD KEY `CREATE_FK` (`ID_ADMIN`);

--
-- Indexes for table `pemakaian`
--
ALTER TABLE `pemakaian`
  ADD PRIMARY KEY (`ID_PINJAM`),
  ADD UNIQUE KEY `PEMINJAMAN_PK` (`ID_PINJAM`),
  ADD KEY `MELAKUKAN_FK` (`ID_ANGGOTA`),
  ADD KEY `MELAYANI_FK` (`ID_ADMIN`);

--
-- Indexes for table `warnet`
--
ALTER TABLE `warnet`
  ADD PRIMARY KEY (`ID_WARNET`),
  ADD UNIQUE KEY `WARNET_PK` (`ID_WARNET`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_pinjam`
--
ALTER TABLE `detail_pinjam`
  MODIFY `ID_DIPINJAM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `notif`
--
ALTER TABLE `notif`
  MODIFY `ID_NOTIF` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `warnet`
--
ALTER TABLE `warnet`
  MODIFY `ID_WARNET` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `FK_ANGGOTA_MAKE_ADMIN` FOREIGN KEY (`ID_ADMIN`) REFERENCES `admin` (`ID_ADMIN`);

--
-- Constraints for table `detail_pinjam`
--
ALTER TABLE `detail_pinjam`
  ADD CONSTRAINT `FK_DETAIL_P_MEMILIKI_PEMINJAM` FOREIGN KEY (`ID_PINJAM`) REFERENCES `pemakaian` (`ID_PINJAM`),
  ADD CONSTRAINT `FK_DETAIL_P_MENGAMBIL_BUKU` FOREIGN KEY (`ID_PC`) REFERENCES `pc` (`ID_PC`);

--
-- Constraints for table `notif`
--
ALTER TABLE `notif`
  ADD CONSTRAINT `FK_NOTIF_MEMBUAT_ADMIN` FOREIGN KEY (`ID_ADMIN`) REFERENCES `admin` (`ID_ADMIN`);

--
-- Constraints for table `pc`
--
ALTER TABLE `pc`
  ADD CONSTRAINT `FK_BUKU_CREATE_ADMIN` FOREIGN KEY (`ID_ADMIN`) REFERENCES `admin` (`ID_ADMIN`);

--
-- Constraints for table `pemakaian`
--
ALTER TABLE `pemakaian`
  ADD CONSTRAINT `FK_PEMINJAM_MELAKUKAN_ANGGOTA` FOREIGN KEY (`ID_ANGGOTA`) REFERENCES `anggota` (`ID_ANGGOTA`),
  ADD CONSTRAINT `FK_PEMINJAM_MELAYANI_ADMIN` FOREIGN KEY (`ID_ADMIN`) REFERENCES `admin` (`ID_ADMIN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
