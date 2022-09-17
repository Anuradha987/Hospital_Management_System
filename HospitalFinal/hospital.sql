-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 11, 2021 at 04:03 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
CREATE TABLE IF NOT EXISTS `activity` (
  `AID` varchar(50) NOT NULL,
  `Activity` varchar(500) NOT NULL,
  `STID` varchar(50) NOT NULL,
  `DT` date NOT NULL,
  `TM` time NOT NULL,
  `PID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`AID`, `Activity`, `STID`, `DT`, `TM`, `PID`) VALUES
('2021-04-18#11:16:54.887_PAT_145', 'Blood Check', 'Nur_1524', '2021-04-18', '11:16:54', 'PAT_145'),
('2021-04-18#11:17:04.126_PAT_145', 'NEck check', 'Nur_1524', '2021-04-18', '11:17:04', 'PAT_145'),
('2021-04-18#11:17:24.766_PAT_145#', 'NEck check', 'Nur_1524', '2021-04-18', '11:17:24', 'PAT_145#'),
('2021-04-18#11:17:30.895_PAT_145#', 'Skin check', 'Nur_1524', '2021-04-18', '11:17:30', 'PAT_145#'),
('2021-04-22#19:36:52.615_PAT_1456', 'asdfasdfasdf', 'abc', '2021-04-22', '19:36:52', 'PAT_1456'),
('2021-04-27#18:56:23.848_PAT_145', 'Blood Test', 'Nur_1524', '2021-04-27', '18:56:23', 'PAT_145'),
('2021-04-27#18:56:34.588_PAT_145', 'Preasure Checkup\r\n', 'Nur_1524', '2021-04-27', '18:56:34', 'PAT_145'),
('2021-04-27#18:56:40.694_PAT_145', 'Blood test\r\n', 'Nur_1524', '2021-04-27', '18:56:40', 'PAT_145'),
('2021-04-27#18:56:57.247_PAT_145', 'X ray\r\n', 'Nur_1524', '2021-04-27', '18:56:57', 'PAT_145'),
('2021-04-27#18:57:12.688_PAT_145', 'took PCR test\r\n', 'Nur_1524', '2021-04-27', '18:57:12', 'PAT_145'),
('2021-04-27#18:58:21.599_PAT_145', 'Took MRI Scan', 'Nur_1524', '2021-04-27', '18:58:21', 'PAT_145'),
('2021-04-27#18:58:29.352_PAT_145', 'X ray', 'Nur_1524', '2021-04-27', '18:58:29', 'PAT_145'),
('2021-04-28#08:24:32.187_Pat_12_12', 'Neck Check', 'Nur_1524', '2021-04-28', '08:24:32', 'Pat_12_12');

-- --------------------------------------------------------

--
-- Table structure for table `dailyreport`
--

DROP TABLE IF EXISTS `dailyreport`;
CREATE TABLE IF NOT EXISTS `dailyreport` (
  `RID` varchar(50) NOT NULL,
  `PID` varchar(50) NOT NULL,
  `STID` varchar(50) NOT NULL,
  `Details` varchar(500) NOT NULL,
  `DT` date NOT NULL,
  `TM` time NOT NULL,
  PRIMARY KEY (`RID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dailyreport`
--

INSERT INTO `dailyreport` (`RID`, `PID`, `STID`, `Details`, `DT`, `TM`) VALUES
('2021-04-17#23:10:52.431_PAT_145', 'PAT_145', 'DOC_1524', 'Patient is in good condition', '2021-04-17', '23:10:52'),
('2021-04-28#09:16:42.799_Pat_12_12', 'Pat_12_12', 'DOC_1524', 'Situation is bad', '2021-04-28', '09:16:42');

-- --------------------------------------------------------

--
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
CREATE TABLE IF NOT EXISTS `medication` (
  `MdcID` varchar(50) NOT NULL,
  `STID` varchar(50) NOT NULL,
  `PID` varchar(50) NOT NULL,
  `MdInID` varchar(50) NOT NULL,
  `DT` date NOT NULL,
  `TM` time NOT NULL,
  `QUN` int(11) DEFAULT NULL,
  `STS` varchar(25) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  PRIMARY KEY (`MdcID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medication`
--

INSERT INTO `medication` (`MdcID`, `STID`, `PID`, `MdInID`, `DT`, `TM`, `QUN`, `STS`, `Price`) VALUES
('2021-04-18#08:42:38.193_ExPephone 4', 'DOC_1524', 'PAT_145', 'ExPephone 4', '2021-04-18', '08:42:38', 15, 'Delevered', 150),
('2021-04-18#08:42:47.523_Panadol', 'DOC_1524', 'PAT_145', 'Panadol', '2021-04-18', '08:42:47', 8, 'Not_Delevered', 200),
('2021-04-18#08:42:55.244_Zoton', 'DOC_1524', 'PAT_145', 'Zoton', '2021-04-18', '08:42:55', 4, 'Not_Delevered', 300),
('2021-04-18#08:43:09.967_ExPephone 4', 'DOC_1524', 'PAT_145#', 'ExPephone 4', '2021-04-18', '08:43:09', 12, 'Not_Delevered', 800),
('2021-04-18#08:43:18.720_Vintogino', 'DOC_1524', 'PAT_145#', 'Vintogino', '2021-04-18', '08:43:18', 2, 'Not_Delevered', 1250),
('2021-04-22#14:15:31.580_ExPephone 4', 'a', 'PAT_15#17', 'ExPephone 4', '2021-04-22', '14:15:31', 15, 'Not_Delevered', 2),
('2021-04-22#14:17:00.149_Zoton', 'a', 'PAT_15#1', 'Zoton', '2021-04-22', '14:17:00', 10, 'Not_Delevered', 5000),
('2021-04-22#19:39:36.789_LV56', 'abc', 'PAT_15#17', 'LV56', '2021-04-22', '19:39:36', 15, 'Not_Delevered', 2250),
('2021-04-22#19:39:54.126_Methanol', 'abc', 'PAT_15#17', 'Methanol', '2021-04-22', '19:39:54', 12, 'Not_Delevered', 240),
('2021-04-27#18:54:50.784_LV56', 'DOC_1524', 'PAT_145', 'LV56', '2021-04-27', '18:54:50', 15, 'Not_Delevered', 2250),
('2021-04-27#18:55:00.249_Dianabol', 'DOC_1524', 'PAT_1456', 'Dianabol', '2021-04-27', '18:55:00', 15, 'Not_Delevered', 75),
('2021-04-27#18:55:04.380_ExPephone 4', 'DOC_1524', 'PAT_145', 'ExPephone 4', '2021-04-27', '18:55:04', 15, 'Not_Delevered', 30),
('2021-04-27#18:55:11.484_Zoton', 'DOC_1524', 'PAT_145', 'Zoton', '2021-04-27', '18:55:11', 100, 'Not_Delevered', 50000),
('2021-04-27#18:55:56.761_ExPephone 4', 'DOC_1524', 'PAT_145', 'ExPephone 4', '2021-04-27', '18:55:56', 5, 'Not_Delevered', 10),
('2021-04-27#18:56:04.568_Panadol', 'DOC_1524', 'PAT_145', 'Panadol', '2021-04-27', '18:56:04', 12, 'Not_Delevered', 1800),
('2021-04-28#08:12:27.686_Dianabol', 'DOC_1524', 'Pat_12_12', 'Dianabol', '2021-04-28', '08:12:27', 1414, 'Not_Delevered', 7070);

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
CREATE TABLE IF NOT EXISTS `medicine` (
  `MdInID` varchar(50) NOT NULL,
  `NM` varchar(250) NOT NULL,
  `QUN` int(11) NOT NULL,
  `UOM` varchar(10) DEFAULT NULL,
  `EP` int(11) DEFAULT NULL,
  `ID` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`MdInID`, `NM`, `QUN`, `UOM`, `EP`, `ID`) VALUES
('Med1524lo', 'Covax', 150, 'SIRINGER', 120, '2021-05-03#07:10:54.747_Key'),
('at154', 'Amphoterocine B', 800, 'Tablets', 2, '2df4'),
('Med155', 'LV56', 152, 'bottle', 150, 'adf14kk'),
('ex012', 'ExPephone 4', 14, 'Tablets', 2, 'asdf33d3'),
('PN45', 'Panadol', 1500, 'Tablets', 150, 'asdf444444'),
('Vin12', 'Vintogino', 50, 'ml', 400, 'asdf44ft'),
('Zot12', 'Zoton', 500, 'ml', 500, 'asdfsf45555'),
('Met451', 'Methanol', 150, 'ml', 20, 'ds334d'),
('ssss', 'ssss', 141, 'ssss', 455, 'saf4v44fr'),
('D21', 'Dianabol', 150, 'tablets', 5, 'sss33333');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `PID` varchar(50) NOT NULL,
  `FN` varchar(50) NOT NULL,
  `LN` varchar(50) NOT NULL,
  `Ward` varchar(50) NOT NULL,
  `ADDate` date NOT NULL,
  `Reason` varchar(250) NOT NULL,
  `CN` int(11) NOT NULL,
  `STS` varchar(25) NOT NULL,
  `BedNo` int(11) DEFAULT NULL,
  `EM` varchar(50) DEFAULT NULL,
  `ID` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`PID`, `FN`, `LN`, `Ward`, `ADDate`, `Reason`, `CN`, `STS`, `BedNo`, `EM`, `ID`) VALUES
('PAT_145', 'Muththa', 'Kirika', '1', '2020-02-14', 'Gutikala', 765010, 'Normal', 1, NULL, '154sdddd\r\n'),
('PKK_14DDD', 'Sunil', 'Perera', 'None', '2021-05-03', 'Headahe', 1000000, 'Very Bad', 0, 'sm@gmail.com', '2021-05-03#07:15:43.729_Key'),
('Pat_12_12', 'asssss', 'asssss', 'None', '2021-04-22', 'asdfaf', 1414, 'Very', 0, 'ffffff', 'asd15471'),
('Pat_NEw_1487', 'Piyal', 'Danapala', 'None', '2021-04-27', 'Neck ache', 751444, 'Normal', 0, 'v@gmail.com', 'asdddd10'),
('PAT_1456', 'Sajith', 'Perera', '3', '2020-02-14', 'Fever', 765010, 'Normal', 3, NULL, 'asddddd44555'),
('PAT_15#17', 'Piyasena', 'Perera', '2', '2020-02-14', 'Cough', 765010, 'Bad', 1, NULL, 'asdf1414414'),
('PAT_15#1', 'Piyasena', 'Perera', '2', '2020-02-14', 'Cough', 765010, 'Discharged', 4, NULL, 'catf104'),
('PAT_145#', 'Danapala', 'Perera', '1', '2020-02-14', 'Cough', 765010, 'Bad', 4, NULL, 'dbh758');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `STID` varchar(50) NOT NULL,
  `FN` varchar(50) NOT NULL,
  `LN` varchar(50) NOT NULL,
  `Ward` varchar(50) NOT NULL,
  `LycNO` varchar(50) NOT NULL,
  `CN` int(11) NOT NULL,
  `PW` varchar(50) NOT NULL,
  `STS` varchar(50) NOT NULL,
  `Avai` varchar(50) DEFAULT NULL,
  `ID` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`STID`, `FN`, `LN`, `Ward`, `LycNO`, `CN`, `PW`, `STS`, `Avai`, `ID`) VALUES
('DC_1477', 'SaimanNN', 'Bandara', '3', 'dd', 75, 'dd', 'Doctor', 'Online', '1sdf44'),
('st123', 'FFF', 'SSS', '3', 'nyyss', 412452, 'ssss', 'Admin', 'Online', '2021-05-03#07:08:11.338_Key'),
('NU_1477', 'Megan', 'Bandara', '1', 'nn', 75, 'nn', 'Nurse', 'Online', '222dddd'),
('pppp', 'ppp', 'ppp', '1', 'p', 41, 'p', 'Pharmacist', 'Offline', 'asdf34444'),
('Nur_1524', 'TharinduNr', 'Perera', '1', 'n', 76655142, 'n', 'Nurse', 'Online', 'asdf345'),
('a', 'a', 'a', '1', 'a', 155, 'a', 'Admin', 'Online', 'q1324234'),
('abc', 'a', 'a', '1', 'a', 155, 'a', 'Admin', 'Online', 'qweew11'),
('DOC_1524', 'Praneeth', 'Perera', '17', 'd', 76655142, 'd', 'Doctor', 'Online', 'sdf234'),
('rrrr', 'rrr', 'rrrr', '1', 'r', 41, 'r', 'Receptionist', 'Offline', 'sdf4444'),
('REP_001', 'Gayani', 'Kaushalya', '4', 'gayani', 724545781, 'dHtR5HP5EElm2+vu29wf1A==', 'Receptionist', 'Online', '2021-05-09#12:28:55.505_Key'),
('NUR_001', 'Ramani', 'Perera', '3', 'ramani', 716880993, 'B0BBiM/jHC9IJ/t2JFQ5kg==', 'Nurse', 'Online', '2021-05-09#12:26:23.595_Key'),
('DOC_001', 'Nilantha', 'Rajakaruna', '2', 'nilantha', 776657113, '0d48VIz0YfAPWIKv9If/KA==', 'Doctor', 'Online', '2021-05-09#12:24:34.318_Key'),
('PHA_001', 'Gavinu', 'Wijekoon', '4', 'gavinu', 754448880, 'KvwAHHYgUdnYaCG7xhKZHQ==', 'Pharmacist', 'Online', '2021-05-09#12:30:08.846_Key'),
('ADM_002', 'Kavinda', 'Paranavithana', '3', 'kavinda', 769955381, '/12de2XxeS6hUnKLI2WYFw==', 'Admin', 'Online', '2021-05-09#12:31:36.675_Key');

-- --------------------------------------------------------

--
-- Table structure for table `suggestions`
--

DROP TABLE IF EXISTS `suggestions`;
CREATE TABLE IF NOT EXISTS `suggestions` (
  `SID` varchar(50) NOT NULL,
  `SB` varchar(255) NOT NULL,
  `CN` varchar(500) NOT NULL,
  `DT` date NOT NULL,
  `STID` varchar(50) DEFAULT NULL,
  `POST` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suggestions`
--

INSERT INTO `suggestions` (`SID`, `SB`, `CN`, `DT`, `STID`, `POST`) VALUES
('2021-04-26#22:26:36.898_Key', 'asdfas', 'null', '2021-04-26', 'abc', 'Admin'),
('2021-04-26#22:46:16.452_Key', 'asdfasdfaf', 'null', '2021-04-26', 'abc', 'Admin'),
('2021-04-26#22:48:06.641_Key', 'asdf', 'null', '2021-04-26', 'abc', 'Admin'),
('2021-04-26#22:51:47.826_Key', 'asdf', 'asdfasdf', '2021-04-26', 'abc', 'Admin'),
('2021-05-11#09:22:47.506_Key', 'hh', 'ugh', '2021-05-11', 'DOC_001', 'Doctor'),
('2021-05-11#09:23:40.380_Key', 'uih', 'oh', '2021-05-11', 'DOC_001', 'Doctor');

-- --------------------------------------------------------

--
-- Table structure for table `ward`
--

DROP TABLE IF EXISTS `ward`;
CREATE TABLE IF NOT EXISTS `ward` (
  `WID` varchar(50) NOT NULL,
  `NofB` int(11) NOT NULL,
  `ID` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ward`
--

INSERT INTO `ward` (`WID`, `NofB`, `ID`) VALUES
('ICU', 8, 'ddccccc142'),
('3', 22, 'sdedf15745'),
('7', 48, 'secbhh444'),
('2', 18, 'sevvv1100'),
('1', 35, 'Wd154ddd'),
('8', 8, 'wdrd3343'),
('4', 20, '2021-05-08#12:04:29.717_Key'),
('5', 20, '2021-05-11#09:00:49.572_Key'),
('6', 25, '2021-05-11#09:03:45.681_Key');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
