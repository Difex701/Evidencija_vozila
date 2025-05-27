-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2025 at 12:35 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `evidencija_vozila`
--

-- --------------------------------------------------------

--
-- Table structure for table `auto_oprema`
--

CREATE TABLE `auto_oprema` (
  `VoziloID` int(11) NOT NULL,
  `OpremaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `boja`
--

CREATE TABLE `boja` (
  `BojaID` int(11) NOT NULL,
  `Naziv` varchar(255) NOT NULL,
  `Opis` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `boja`
--

INSERT INTO `boja` (`BojaID`, `Naziv`, `Opis`) VALUES
(1, 'Crvena', 'Tamno');

-- --------------------------------------------------------

--
-- Table structure for table `gorivo`
--

CREATE TABLE `gorivo` (
  `GorivoID` int(11) NOT NULL,
  `Naziv` varchar(255) NOT NULL,
  `Opis` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gorivo`
--

INSERT INTO `gorivo` (`GorivoID`, `Naziv`, `Opis`) VALUES
(1, 'Benzin', 'Moze mu se ');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `ModelID` int(11) NOT NULL,
  `Naziv` varchar(255) NOT NULL,
  `ProizvodjacID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`ModelID`, `Naziv`, `ProizvodjacID`) VALUES
(1, '458', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oprema`
--

CREATE TABLE `oprema` (
  `OpremaID` int(11) NOT NULL,
  `Naziv` varchar(255) NOT NULL,
  `Opis` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proizvodjac`
--

CREATE TABLE `proizvodjac` (
  `ProizvodjacID` int(11) NOT NULL,
  `Naziv` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proizvodjac`
--

INSERT INTO `proizvodjac` (`ProizvodjacID`, `Naziv`) VALUES
(1, 'Ferrari');

-- --------------------------------------------------------

--
-- Table structure for table `vozilo`
--

CREATE TABLE `vozilo` (
  `VoziloID` int(11) NOT NULL,
  `Registracija` varchar(255) NOT NULL,
  `GodinaProizvodnje` int(11) NOT NULL,
  `PredjenoKM` int(11) NOT NULL,
  `ModelID` int(11) NOT NULL,
  `BojaID` int(11) NOT NULL,
  `GorivoID` int(11) NOT NULL,
  `Cena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vozilo`
--

INSERT INTO `vozilo` (`VoziloID`, `Registracija`, `GodinaProizvodnje`, `PredjenoKM`, `ModelID`, `BojaID`, `GorivoID`, `Cena`) VALUES
(1, 'F-458-F', 2000, 500, 1, 1, 1, 100000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auto_oprema`
--
ALTER TABLE `auto_oprema`
  ADD KEY `VoziloID` (`VoziloID`,`OpremaID`),
  ADD KEY `OpremaID` (`OpremaID`);

--
-- Indexes for table `boja`
--
ALTER TABLE `boja`
  ADD PRIMARY KEY (`BojaID`);

--
-- Indexes for table `gorivo`
--
ALTER TABLE `gorivo`
  ADD PRIMARY KEY (`GorivoID`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`ModelID`),
  ADD UNIQUE KEY `ProizvodjacID_2` (`ProizvodjacID`),
  ADD KEY `ProizvodjacID` (`ProizvodjacID`),
  ADD KEY `ProizvodjacID_3` (`ProizvodjacID`);

--
-- Indexes for table `oprema`
--
ALTER TABLE `oprema`
  ADD PRIMARY KEY (`OpremaID`);

--
-- Indexes for table `proizvodjac`
--
ALTER TABLE `proizvodjac`
  ADD PRIMARY KEY (`ProizvodjacID`);

--
-- Indexes for table `vozilo`
--
ALTER TABLE `vozilo`
  ADD PRIMARY KEY (`VoziloID`),
  ADD KEY `ModelID` (`ModelID`,`BojaID`,`GorivoID`),
  ADD KEY `BojaID` (`BojaID`),
  ADD KEY `GorivoID` (`GorivoID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boja`
--
ALTER TABLE `boja`
  MODIFY `BojaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gorivo`
--
ALTER TABLE `gorivo`
  MODIFY `GorivoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
  MODIFY `ModelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oprema`
--
ALTER TABLE `oprema`
  MODIFY `OpremaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proizvodjac`
--
ALTER TABLE `proizvodjac`
  MODIFY `ProizvodjacID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vozilo`
--
ALTER TABLE `vozilo`
  MODIFY `VoziloID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auto_oprema`
--
ALTER TABLE `auto_oprema`
  ADD CONSTRAINT `auto_oprema_ibfk_1` FOREIGN KEY (`OpremaID`) REFERENCES `oprema` (`OpremaID`),
  ADD CONSTRAINT `auto_oprema_ibfk_2` FOREIGN KEY (`VoziloID`) REFERENCES `vozilo` (`VoziloID`);

--
-- Constraints for table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `model_ibfk_1` FOREIGN KEY (`ProizvodjacID`) REFERENCES `proizvodjac` (`ProizvodjacID`);

--
-- Constraints for table `vozilo`
--
ALTER TABLE `vozilo`
  ADD CONSTRAINT `vozilo_ibfk_1` FOREIGN KEY (`BojaID`) REFERENCES `boja` (`BojaID`),
  ADD CONSTRAINT `vozilo_ibfk_2` FOREIGN KEY (`ModelID`) REFERENCES `model` (`ModelID`),
  ADD CONSTRAINT `vozilo_ibfk_3` FOREIGN KEY (`GorivoID`) REFERENCES `gorivo` (`GorivoID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
