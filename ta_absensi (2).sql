-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2020 at 07:34 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ta_absensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(12) NOT NULL,
  `admin_username` varchar(30) NOT NULL,
  `admin_password` varchar(50) NOT NULL,
  `admin_nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_username`, `admin_password`, `admin_nama`) VALUES
(1, 'admin', 'admin', 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `izin`
--

CREATE TABLE `izin` (
  `izin_id` int(12) NOT NULL,
  `karyawan_id` int(12) NOT NULL,
  `izin_nama` varchar(50) NOT NULL,
  `izin_dari` date NOT NULL,
  `izin_sampai` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `jabatan_id` int(12) NOT NULL,
  `jabatan_nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`jabatan_id`, `jabatan_nama`) VALUES
(5, 'asd'),
(4, 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `jadwal_id` int(12) NOT NULL,
  `jabatan_id` int(12) NOT NULL,
  `jadwal_hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu','Minggu') NOT NULL,
  `jadwal_masuk` time NOT NULL,
  `jadwal_pulang` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`jadwal_id`, `jabatan_id`, `jadwal_hari`, `jadwal_masuk`, `jadwal_pulang`) VALUES
(8, 4, 'Senin', '12:00:00', '12:00:00'),
(9, 4, 'Selasa', '00:00:00', '00:00:00'),
(10, 4, 'Rabu', '00:00:00', '00:00:00'),
(11, 4, 'Kamis', '00:01:00', '00:36:00'),
(12, 4, 'Jumat', '00:00:00', '00:00:00'),
(13, 4, 'Sabtu', '00:00:00', '00:00:00'),
(14, 4, 'Minggu', '00:00:00', '00:00:00'),
(15, 5, 'Senin', '00:00:00', '00:00:00'),
(16, 5, 'Selasa', '00:00:00', '00:00:00'),
(17, 5, 'Rabu', '00:00:00', '00:00:00'),
(18, 5, 'Kamis', '00:00:00', '00:00:00'),
(19, 5, 'Jumat', '00:00:00', '00:00:00'),
(20, 5, 'Sabtu', '00:00:00', '00:00:00'),
(21, 5, 'Minggu', '00:00:00', '00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `karyawan_id` int(12) NOT NULL,
  `jabatan_id` int(12) NOT NULL,
  `karyawan_rfid` varchar(10) NOT NULL,
  `karyawan_nama` varchar(50) NOT NULL,
  `karyawan_nik` varchar(16) NOT NULL,
  `karyawan_jeniskelamin` enum('M','F') NOT NULL,
  `karyawan_lahir` date NOT NULL,
  `karyawan_nomorhp` varchar(20) NOT NULL,
  `karyawan_alamat` varchar(500) NOT NULL,
  `karyawan_foto` varchar(255) NOT NULL,
  `karyawan_status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`karyawan_id`, `jabatan_id`, `karyawan_rfid`, `karyawan_nama`, `karyawan_nik`, `karyawan_jeniskelamin`, `karyawan_lahir`, `karyawan_nomorhp`, `karyawan_alamat`, `karyawan_foto`, `karyawan_status`) VALUES
(3, 4, '2098751239', 'Ilyasa', '1234567891234561', 'M', '2020-11-12', '121212121212', 'asdadsasasdasd', '17606119435fac198fe6ee3.png', '1'),
(6, 5, '2098751232', 'Fefe', '1234567891234562', 'M', '2020-11-12', '121212121213', 'asdadsasasdasd', '17606119435fac198fe6ee3.png', '1');

-- --------------------------------------------------------

--
-- Table structure for table `libur`
--

CREATE TABLE `libur` (
  `libur_id` int(12) NOT NULL,
  `libur_keterangan` varchar(50) NOT NULL,
  `libur_dari` date NOT NULL,
  `libur_sampai` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rekap`
--

CREATE TABLE `rekap` (
  `rekap_id` bigint(20) NOT NULL,
  `jadwal_id` int(12) NOT NULL,
  `karyawan_id` int(12) NOT NULL,
  `rekap_tanggal` date NOT NULL,
  `rekap_masuk` time DEFAULT NULL,
  `rekap_keluar` time DEFAULT NULL,
  `rekap_photomasuk` varchar(255) DEFAULT NULL,
  `rekap_photokeluar` varchar(255) DEFAULT NULL,
  `rekap_keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekap`
--

INSERT INTO `rekap` (`rekap_id`, `jadwal_id`, `karyawan_id`, `rekap_tanggal`, `rekap_masuk`, `rekap_keluar`, `rekap_photomasuk`, `rekap_photokeluar`, `rekap_keterangan`) VALUES
(5, 11, 3, '2020-11-12', '00:36:05', '00:36:33', '17926309375fac2105b3baf.png', '8224842815fac2121756e8.png', 'Hadir Pulang'),
(6, 8, 3, '2020-11-13', '20:34:35', '20:37:38', '12156778565fb27febb5d03.png', '2513340875fb280a26a990.png', 'Hadir Pulang'),
(7, 8, 3, '2020-11-14', '20:34:35', '20:37:38', '12156778565fb27febb5d03.png', '2513340875fb280a26a990.png', 'Hadir Pulang'),
(8, 8, 3, '2020-11-15', '20:34:35', '20:37:38', '12156778565fb27febb5d03.png', '2513340875fb280a26a990.png', 'Hadir Pulang'),
(9, 8, 3, '2020-11-16', '20:34:35', '20:37:38', '12156778565fb27febb5d03.png', '2513340875fb280a26a990.png', 'Hadir Masuk'),
(10, 8, 3, '2020-11-17', '20:34:35', '20:37:38', '12156778565fb27febb5d03.png', '2513340875fb280a26a990.png', 'Hadir Masuk');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_username` (`admin_username`);

--
-- Indexes for table `izin`
--
ALTER TABLE `izin`
  ADD PRIMARY KEY (`izin_id`),
  ADD KEY `izin karywanid to karyawanid` (`karyawan_id`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`jabatan_id`),
  ADD UNIQUE KEY `jabatan_nama` (`jabatan_nama`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`jadwal_id`),
  ADD KEY `jadwal jabatanid to jabatanid` (`jabatan_id`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`karyawan_id`),
  ADD UNIQUE KEY `karyawan_rfid` (`karyawan_rfid`),
  ADD UNIQUE KEY `karyawan_nik` (`karyawan_nik`),
  ADD KEY `karyawan jabatanid to jabatanid` (`jabatan_id`);

--
-- Indexes for table `libur`
--
ALTER TABLE `libur`
  ADD PRIMARY KEY (`libur_id`);

--
-- Indexes for table `rekap`
--
ALTER TABLE `rekap`
  ADD PRIMARY KEY (`rekap_id`),
  ADD KEY `rekap karyawanid to karyawanid` (`karyawan_id`),
  ADD KEY `rekapjadwalfk` (`jadwal_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `izin`
--
ALTER TABLE `izin`
  MODIFY `izin_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `jabatan_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `jadwal_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `karyawan_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `libur`
--
ALTER TABLE `libur`
  MODIFY `libur_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rekap`
--
ALTER TABLE `rekap`
  MODIFY `rekap_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `izin`
--
ALTER TABLE `izin`
  ADD CONSTRAINT `izin karywanid to karyawanid` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawan` (`karyawan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal jabatanid to jabatanid` FOREIGN KEY (`jabatan_id`) REFERENCES `jabatan` (`jabatan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan jabatanid to jabatanid` FOREIGN KEY (`jabatan_id`) REFERENCES `jabatan` (`jabatan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rekap`
--
ALTER TABLE `rekap`
  ADD CONSTRAINT `rekap karyawanid to karyawanid` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawan` (`karyawan_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rekapjadwalfk` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwal` (`jadwal_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
