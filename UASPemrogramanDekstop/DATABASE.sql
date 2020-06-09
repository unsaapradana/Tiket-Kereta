-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 09, 2020 at 03:13 PM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `KeretaApi`
--

-- --------------------------------------------------------

--
-- Table structure for table `Jurusan`
--

CREATE TABLE `Jurusan` (
  `idJurusan` int(11) NOT NULL,
  `jurusan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Kereta`
--

CREATE TABLE `Kereta` (
  `idKereta` int(11) NOT NULL,
  `idJurusan` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `harga` int(21) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `LoggedIn`
--

CREATE TABLE `LoggedIn` (
  `namaPegawai` varchar(255) NOT NULL,
  `statusPegawai` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Pegawai`
--

CREATE TABLE `Pegawai` (
  `idPegawai` int(21) NOT NULL,
  `namaPegawai` varchar(255) NOT NULL,
  `jkPegawai` varchar(255) NOT NULL,
  `alamatPegawai` varchar(255) NOT NULL,
  `telpPegawai` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `statusPegawai` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Pembelian`
--

CREATE TABLE `Pembelian` (
  `idPembelian` int(11) NOT NULL,
  `idKereta` int(11) NOT NULL,
  `idPegawai` int(11) NOT NULL,
  `namaPembeli` varchar(255) NOT NULL,
  `telpPembeli` varchar(255) NOT NULL,
  `alamatPembeli` varchar(255) NOT NULL,
  `scanFoto` longblob NOT NULL,
  `nomorKursi` varchar(255) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Jurusan`
--
ALTER TABLE `Jurusan`
  ADD PRIMARY KEY (`idJurusan`);

--
-- Indexes for table `Kereta`
--
ALTER TABLE `Kereta`
  ADD PRIMARY KEY (`idKereta`),
  ADD KEY `idJurusan` (`idJurusan`);

--
-- Indexes for table `Pegawai`
--
ALTER TABLE `Pegawai`
  ADD PRIMARY KEY (`idPegawai`);

--
-- Indexes for table `Pembelian`
--
ALTER TABLE `Pembelian`
  ADD PRIMARY KEY (`idPembelian`),
  ADD KEY `idKereta` (`idKereta`,`idPegawai`),
  ADD KEY `idPegawai` (`idPegawai`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Kereta`
--
ALTER TABLE `Kereta`
  ADD CONSTRAINT `kereta_ibfk_1` FOREIGN KEY (`idJurusan`) REFERENCES `Jurusan` (`idJurusan`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `Pembelian`
--
ALTER TABLE `Pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`idKereta`) REFERENCES `Kereta` (`idKereta`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`idPegawai`) REFERENCES `Pegawai` (`idPegawai`) ON DELETE NO ACTION ON UPDATE CASCADE;
