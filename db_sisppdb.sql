-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2023 at 12:19 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sisppdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_email` varchar(35) NOT NULL,
  `admin_password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_email`, `admin_password`) VALUES
(1, 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `daftar`
--

CREATE TABLE `daftar` (
  `daftar_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `thn_ajar` varchar(10) NOT NULL,
  `nm_lengkap` varchar(35) NOT NULL,
  `nm_panggil` varchar(10) NOT NULL,
  `jk` varchar(10) NOT NULL,
  `anak_ke` int(11) NOT NULL,
  `KpsPkh` varchar(10) NOT NULL,
  `tb` int(11) NOT NULL,
  `bb` int(11) NOT NULL,
  `jarak_kesekolah` int(11) NOT NULL,
  `waktu_tempuh` int(11) NOT NULL,
  `moda_transportasi` varchar(20) NOT NULL,
  `pas_photo` varchar(100) NOT NULL,
  `fc_AkteLahir` varchar(100) NOT NULL,
  `fc_KTPOrtu` varchar(100) NOT NULL,
  `fc_KK` varchar(100) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'Unverified',
  `tgl_konfirmasi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daftar`
--

INSERT INTO `daftar` (`daftar_id`, `user_id`, `thn_ajar`, `nm_lengkap`, `nm_panggil`, `jk`, `anak_ke`, `KpsPkh`, `tb`, `bb`, `jarak_kesekolah`, `waktu_tempuh`, `moda_transportasi`, `pas_photo`, `fc_AkteLahir`, `fc_KTPOrtu`, `fc_KK`, `status`, `tgl_konfirmasi`) VALUES
(9, 14, '2021/2022', 'Razita Syazwana', 'Ita', 'P', 5, 'Tidak', 115, 20, 1, 10, 'Ojek Online', 'images/pas-photo/pas-photo_Razita Syazwana.jpg', 'images/akte-lahir/akte-lahir_Razita Syazwana.jpg', 'images/ktp-ortu/ktp-ortu_Razita Syazwana.jpg', 'images/kk/kk_Razita Syazwana.jpg', 'Verified', '2023-08-01');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(35) NOT NULL,
  `user_password` varchar(8) NOT NULL,
  `tgl_daftar` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_email`, `user_password`, `tgl_daftar`) VALUES
(14, 'user@gmail.com', 'user', '2023-08-01 12:58:16');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_cetak_pendaftaran`
-- (See below for the actual view)
--
CREATE TABLE `v_cetak_pendaftaran` (
`nm_lengkap` varchar(35)
,`user_email` varchar(35)
,`tgl_daftar` timestamp
,`tgl_konfirmasi` date
);

-- --------------------------------------------------------

--
-- Structure for view `v_cetak_pendaftaran`
--
DROP TABLE IF EXISTS `v_cetak_pendaftaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cetak_pendaftaran`  AS SELECT `daftar`.`nm_lengkap` AS `nm_lengkap`, `user`.`user_email` AS `user_email`, `user`.`tgl_daftar` AS `tgl_daftar`, `daftar`.`tgl_konfirmasi` AS `tgl_konfirmasi` FROM (`user` join `daftar` on(`user`.`user_id` = `daftar`.`user_id`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `daftar`
--
ALTER TABLE `daftar`
  ADD PRIMARY KEY (`daftar_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `daftar`
--
ALTER TABLE `daftar`
  MODIFY `daftar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar`
--
ALTER TABLE `daftar`
  ADD CONSTRAINT `daftar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
