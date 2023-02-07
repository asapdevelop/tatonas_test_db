-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2023 at 10:29 AM
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
-- Database: `tatonas_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_absen`
--

CREATE TABLE `tbl_absen` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `in_out` varchar(5) NOT NULL,
  `tanggal` varchar(50) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hardware`
--

CREATE TABLE `tbl_hardware` (
  `hardware` int(11) NOT NULL,
  `location` varchar(50) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_hardware`
--

INSERT INTO `tbl_hardware` (`hardware`, `location`, `latitude`, `longitude`, `deleted`) VALUES
(4001, 'ST. JOMBANG', -3.709444, 115.403611, 0),
(4002, 'ST. TIMBURU', -2.552639, 115.964806, 0),
(4003, 'ST. RIAM ADUNGAN', -3.738917, 115.198417, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hardware_detail`
--

CREATE TABLE `tbl_hardware_detail` (
  `id` int(11) NOT NULL,
  `hardware` int(11) NOT NULL,
  `sensor` varchar(2) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_hardware_detail`
--

INSERT INTO `tbl_hardware_detail` (`id`, `hardware`, `sensor`, `deleted`) VALUES
(1, 4001, 'rf', 0),
(2, 4002, 'wl', 0),
(3, 4002, 'bt', 0),
(4, 4003, 'ah', 0),
(5, 4003, 'ws', 0),
(6, 4003, 'bt', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sensor`
--

CREATE TABLE `tbl_sensor` (
  `sensor` varchar(2) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_sensor`
--

INSERT INTO `tbl_sensor` (`sensor`, `nama`, `unit`, `deleted`) VALUES
('ah', 'Air Humidity', '%', 0),
('bt', 'Battery', 'Volt', 0),
('rf', 'Rainfall', 'mm', 0),
('wl', 'Water Level', 'cm', 0),
('ws', 'Wind Speed', 'm/s', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id` int(11) NOT NULL,
  `hardware` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id`, `hardware`, `created_at`) VALUES
(1, 4001, '2022-11-08 16:20:00'),
(2, 4002, '2022-11-08 16:20:00'),
(3, 4003, '2022-11-08 16:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi_detail`
--

CREATE TABLE `tbl_transaksi_detail` (
  `id` int(11) NOT NULL,
  `id_trans` int(11) NOT NULL,
  `hardware` int(11) NOT NULL,
  `sensor` varchar(2) NOT NULL,
  `value` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_transaksi_detail`
--

INSERT INTO `tbl_transaksi_detail` (`id`, `id_trans`, `hardware`, `sensor`, `value`) VALUES
(1, 1, 4001, 'rf', 0.5),
(2, 2, 4002, 'wl', 701.25),
(3, 2, 4002, 'bt', 12.15),
(4, 3, 4003, 'ah', 27),
(5, 3, 4003, 'ws', 10),
(6, 3, 4003, 'bt', 12.15);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`username`, `password`, `nama_lengkap`, `jabatan`, `no_telp`, `email`) VALUES
('alvin2525', 'password', 'Alvin Sanjaya', 'HR Admin', '0822998877', 'alvin25@gmail.com'),
('budi123', 'password', 'Budi Doremi', 'Operation Staff', '0877789456', 'budi123@gmail.com'),
('iqbal_ok', 'password', 'Iqbal Ramadhan', 'Operation Staff', '0899232345', 'iqbalramadhan@gmail.com'),
('johndoe1991', 'password', 'John Doe', 'Android Developer', '0811223344', 'johndoe91@gmail.com'),
('yunisara', 'password', 'Yuni Sara', 'Resepsionis', '08123233454', 'yunisara18@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_absen`
--
ALTER TABLE `tbl_absen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_hardware`
--
ALTER TABLE `tbl_hardware`
  ADD PRIMARY KEY (`hardware`);

--
-- Indexes for table `tbl_hardware_detail`
--
ALTER TABLE `tbl_hardware_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sensor`
--
ALTER TABLE `tbl_sensor`
  ADD PRIMARY KEY (`sensor`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_transaksi_detail`
--
ALTER TABLE `tbl_transaksi_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_absen`
--
ALTER TABLE `tbl_absen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_hardware_detail`
--
ALTER TABLE `tbl_hardware_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_transaksi_detail`
--
ALTER TABLE `tbl_transaksi_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
