-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2016 at 11:23 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nursingcbt`
--
CREATE DATABASE IF NOT EXISTS `nursingcbt` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `nursingcbt`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `sn` int(10) NOT NULL,
  `user_id` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) DEFAULT NULL,
  `enc_psw` varchar(100) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `midname` varchar(50) DEFAULT NULL,
  `passport` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`sn`, `user_id`, `password`, `enc_psw`, `surname`, `firstname`, `midname`, `passport`) VALUES
(1, 'mayorjo', 'mayoskele', '9bc4da116f1916333f9dcc0634de1fe9', 'Ojo', 'Isaac', 'Mayowa', 'mayowa.jpg'),
(2, 'admin', 'hamdala001', 'afe73af8e1e715b0fc6504e6a7433396', 'Hamdala', 'Komputer', 'Konsult', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `sn` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(20) NOT NULL,
  `unit` int(2) NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  `faculty` varchar(100) DEFAULT NULL,
  `department` varchar(100) NOT NULL,
  `level` varchar(20) NOT NULL,
  `semester` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`sn`, `name`, `code`, `unit`, `status`, `faculty`, `department`, `level`, `semester`) VALUES
(45, 'Biology', 'BIO', 1, 'C', NULL, '', 'SSCE', '1st'),
(46, 'General Mathematics', 'MAT', 1, 'C', NULL, '', 'SSCE', '2nd'),
(47, 'Physics', 'PHY', 2, 'C', NULL, '', 'SSCE', '1st'),
(48, 'English Language', 'ENG', 1, 'C', NULL, '', 'SSCE', '1st');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `sn` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(20) NOT NULL,
  `facCode` varchar(20) NOT NULL DEFAULT '',
  `status` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`sn`, `name`, `code`, `facCode`, `status`) VALUES
(15, 'Junior Secondary School One', 'JSS1', 'JSS', 'active'),
(16, 'Junior Secondary School Two', 'JSS2', 'JSS', 'active'),
(18, 'Junior Secondary School Three', 'JSS3', 'JSS', 'inactive'),
(21, 'Senior Secondary School One', 'SS1', 'SS', 'active'),
(22, 'Senior Secondary School Two', 'SS2', 'SS', 'active'),
(23, 'Senior Secondary School Three', 'SS3', 'SS', 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `epanel`
--

CREATE TABLE `epanel` (
  `sn` int(11) NOT NULL,
  `codegen` varchar(100) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL,
  `total_sec` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `epanel`
--

INSERT INTO `epanel` (`sn`, `codegen`, `title`, `year`, `state`, `total_sec`) VALUES
(1, '2016_cbt_grap_colo_and_draw_0827_675', 'Graphics Coloring And Drawing', 2016, 'ready', 900);

-- --------------------------------------------------------

--
-- Table structure for table `esource`
--

CREATE TABLE `esource` (
  `sn` int(10) NOT NULL,
  `code` varchar(30) NOT NULL,
  `qtype` varchar(50) DEFAULT NULL,
  `year` varchar(10) DEFAULT NULL,
  `codegen` varchar(100) DEFAULT NULL,
  `total_qtn` int(4) DEFAULT NULL,
  `max_qtn` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `esource`
--

INSERT INTO `esource` (`sn`, `code`, `qtype`, `year`, `codegen`, `total_qtn`, `max_qtn`) VALUES
(1, 'BIO', 'exam', '2016', '2016_cbt_grap_colo_and_draw_0827_675', 20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `sn` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(20) NOT NULL,
  `status` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`sn`, `name`, `code`, `status`) VALUES
(11, 'Junior Secondary School', 'JSS', 'active'),
(13, 'Senior Secondary School', 'SS', 'active'),
(14, 'Primary School', 'PRY', 'inactive'),
(15, 'Nursery School', 'NUR', 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `qtn_remind`
--

CREATE TABLE `qtn_remind` (
  `sn` int(20) NOT NULL,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `year` varchar(12) NOT NULL,
  `qtype` varchar(50) NOT NULL DEFAULT '0',
  `code` varchar(50) NOT NULL DEFAULT '',
  `codegen` varchar(100) NOT NULL,
  `instruction` text,
  `num` int(5) DEFAULT NULL,
  `tot_option` int(1) DEFAULT NULL,
  `optiontype` varchar(30) DEFAULT NULL,
  `passage` text,
  `question` text,
  `marks` int(2) DEFAULT NULL,
  `option1` varchar(255) DEFAULT NULL,
  `option2` varchar(255) DEFAULT NULL,
  `option3` varchar(255) DEFAULT NULL,
  `option4` varchar(255) DEFAULT NULL,
  `option5` varchar(255) DEFAULT NULL,
  `image1` varchar(100) DEFAULT NULL,
  `image2` varchar(100) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `picked1` varchar(255) DEFAULT NULL,
  `typeAns` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qtn_remind`
--

INSERT INTO `qtn_remind` (`sn`, `user_id`, `year`, `qtype`, `code`, `codegen`, `instruction`, `num`, `tot_option`, `optiontype`, `passage`, `question`, `marks`, `option1`, `option2`, `option3`, `option4`, `option5`, `image1`, `image2`, `answer`, `picked1`, `typeAns`) VALUES
(1, 'NCE001', '2016', 'exam', 'BIO', '2016_cbt_grap_colo_and_draw_0827_675', '', 1, 4, 'choice', '', '<p>Transportation of water in the xylem tissue involves the following except.......</p>', 2, 'root pressure ', 'transpiration pull ', 'capillary action ', 'Translocation', NULL, '', NULL, 'Translocation', 'transpiration pull ', ''),
(2, 'NCE001', '2016', 'exam', 'BIO', '2016_cbt_grap_colo_and_draw_0827_675', '', 2, 4, 'choice', '', '<p>The brain and the spinal cord make up the ........................</p>', 2, 'central nervous system', ' sympathetic nervous system', 'autonomic nervous system', 'peripheral nervous system', NULL, '', NULL, 'central nervous system', 'autonomic nervous system', ''),
(3, 'NCE001', '2016', 'exam', 'BIO', '2016_cbt_grap_colo_and_draw_0827_675', 'Use the diagram below to answer this question', 3, 4, 'choice', '', '<p>The structure labeled I originates from the</p>', 2, 'kidney', 'small intestine ', 'stomach', 'liver ', NULL, 'img_for_BIO_exam_15_1470846840.png', NULL, 'kidney', 'kidney', ''),
(4, 'NCE001', '2016', 'exam', 'BIO', '2016_cbt_grap_colo_and_draw_0827_675', '', 4, 4, 'choice', '', '<p>The rods in the retina of the eye are examples of</p>', 2, 'cells', 'tissues ', 'organs', 'systems', NULL, '', NULL, 'cells', 'cells', ''),
(5, 'NCE001', '2016', 'exam', 'BIO', '2016_cbt_grap_colo_and_draw_0827_675', '', 5, 4, 'choice', '', '<p>The absence of special food and water conducting systems restricts the body size in</p>', 2, 'liverworts, mosses and ferns', 'the bryophytes ad the pteridophytes', 'algae, liverworts and mosses', 'the thallophytes and the pteridophytes', NULL, '', NULL, 'algae, liverworts and mosses', 'the bryophytes ad the pteridophytes', ''),
(6, 'NCE001', '2016', 'exam', 'BIO', '2016_cbt_grap_colo_and_draw_0827_675', '', 6, 4, 'choice', '', '<p>The distribution of organisms in a fresh water habitat like a stream or pond is determined by the following factors except...................</p>', 2, 'temperature', 'rainfall ', 'light penetration ', 'pH of the soil ', NULL, '', NULL, 'pH of the soil ', 'pH of the soil ', ''),
(7, 'NCE001', '2016', 'exam', 'BIO', '2016_cbt_grap_colo_and_draw_0827_675', '', 7, 4, 'choice', '', '<p>An organism which operates at the cellular level of organisation carries out its physiological activities by using its ....................</p>', 2, 'small size ', 'cell membrane ', 'cytoplasm ', 'Organelles', NULL, '', NULL, 'Organelles', 'cell membrane ', ''),
(8, 'NCE001', '2016', 'exam', 'BIO', '2016_cbt_grap_colo_and_draw_0827_675', 'Use the diagram below to answer this question', 8, 4, 'choice', '', '<p>The hormone secreted at IV served to</p>', 2, 'make the body react to emergencies.', 'raise the level of calcium ions in the blood', 'lower blood glucose level', 'facilitate the development of facial hairs', NULL, 'img_for_BIO_exam_13_1470846556.png', NULL, 'facilitate the development of facial hairs', 'lower blood glucose level', ''),
(9, 'NCE001', '2016', 'exam', 'BIO', '2016_cbt_grap_colo_and_draw_0827_675', '', 9, 4, 'choice', '<p>this passage is very important, you must read it well befoere you answer the question under it</p>', '<p>The gland usually found in the position labelled I is the</p>', 2, 'pituitary', 'thyroid ', 'pancreatic', 'adrenal ', NULL, '', NULL, 'pituitary', 'thyroid ', ''),
(10, 'NCE001', '2016', 'exam', 'BIO', '2016_cbt_grap_colo_and_draw_0827_675', '', 10, 4, 'choice', '', '<p>A pulse is best described as....................</p>', 2, 'contraction of veins to allow blood into them', ' dilation of arteries to accommodate blood rushing through', 'pumping action of the heart to move blood round the body', 'contraction of arteries to let out blood ', NULL, '', NULL, ' dilation of arteries to accommodate blood rushing through', 'contraction of arteries to let out blood ', ''),
(11, 'NCE001', '2016', 'exam', 'BIO', '2016_cbt_grap_colo_and_draw_0827_675', 'Use the diagram below to answer this question', 11, 4, 'choice', '', '<p>Blood vessels usually pass through the structure labelled</p>', 2, 'II', 'IV', 'V', 'III', NULL, 'img_for_BIO_exam_12_1470846393.png', NULL, 'V', 'IV', ''),
(12, 'NCE001', '2016', 'exam', 'BIO', '2016_cbt_grap_colo_and_draw_0827_675', 'Use the diagram below to answer this question', 12, 4, 'choice', '', '<p>Birth control by vasectomy is achieved by severing the structure labelled</p>', 2, 'IV', 'III', 'I', 'II', NULL, 'img_for_BIO_exam_15_1470846840.png', NULL, 'III', 'II', ''),
(13, 'NCE001', '2016', 'exam', 'BIO', '2016_cbt_grap_colo_and_draw_0827_675', '', 13, 4, 'choice', '', '<p>The ability of organisms to maintain a constant internal environment is known as ------</p>', 2, 'endosmosis ', 'diuresis ', 'plasmolysis ', 'Homeostasis', NULL, '', NULL, 'diuresis ', 'diuresis ', ''),
(14, 'NCE001', '2016', 'exam', 'BIO', '2016_cbt_grap_colo_and_draw_0827_675', 'Use the diagram below to answer this question', 14, 4, 'choice', '', '<p>The endoplasmic reticulum is represented by the part labelled</p>', 2, 'IV', 'III', 'II', 'I', NULL, 'img_for_BIO_exam_17_1470847021.png', NULL, 'IV', 'IV', ''),
(15, 'NCE001', '2016', 'Exam', 'BIO', '2016_cbt_grap_colo_and_draw_0827_675', '', 15, 4, 'choice', '', '<p>Which of the following specialised structures are stimulated by touch, pressure, pain, heat and cold? .......</p>', 2, 'relay neurones ', 'myelin sheath', 'receptors ', 'synapse ', NULL, '', NULL, 'receptors ', 'receptors ', ''),
(16, 'NCE001', '2016', 'exam', 'BIO', '2016_cbt_grap_colo_and_draw_0827_675', 'Use the diagram below to answer this question', 16, 4, 'choice', '', '<p>The part labelled II is responsible for</p>', 2, 'photosynthesis', 'respiration', 'protein synthesis', 'excretion', NULL, 'img_for_BIO_exam_17_1470847021.png', NULL, 'respiration', 'respiration', ''),
(17, 'NCE001', '2016', 'exam', 'BIO', '2016_cbt_grap_colo_and_draw_0827_675', '', 17, 4, 'choice', '', '<p>Which of the following diseases cannot be spread by an insect?</p>', 2, 'Malaria ', 'Cholera ', 'Trypanosomiasis ', 'Measles', NULL, '', NULL, 'Measles', 'Trypanosomiasis ', ''),
(18, 'NCE001', '2016', 'exam', 'BIO', '2016_cbt_grap_colo_and_draw_0827_675', 'Use the diagram below to answer this question', 18, 4, 'choice', '', '<p>The structure above represents a</p>', 2, 'caudal vertebra', 'cervical vertebra', 'thoracic vertebra', 'lumbar vertebra.', NULL, 'img_for_BIO_exam_11_1470846350.png', NULL, 'cervical vertebra', 'cervical vertebra', ''),
(19, 'NCE001', '2016', 'exam', 'BIO', '2016_cbt_grap_colo_and_draw_0827_675', '', 19, 4, 'choice', '', '<p>When a person\\''s urine contains a high concentration of urea, it could be as a result of .....</p>', 2, 'having', 'a drop in body temperature', 'drinking a large amount of water', 'eating a meal rich in proteins', NULL, '', NULL, 'eating a meal rich in proteins', 'eating a meal rich in proteins', ''),
(20, 'NCE001', '2016', 'exam', 'BIO', '2016_cbt_grap_colo_and_draw_0827_675', '', 20, 4, 'choice', '', '<p>The relationship between the retina and the brain is similar to that between the...........</p>', 2, 'cochlea and semi circular canal', 'eardrum and brain', 'cochlea and brain ', 'cochlea and auditory nerve ', NULL, '', NULL, 'cochlea and brain ', 'eardrum and brain', '');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `sn` int(10) UNSIGNED NOT NULL,
  `code` varchar(20) NOT NULL,
  `year` varchar(15) NOT NULL,
  `level` varchar(20) NOT NULL DEFAULT '',
  `qtype` varchar(50) DEFAULT NULL,
  `tot_option` int(2) DEFAULT NULL,
  `optiontype` varchar(30) DEFAULT NULL,
  `instruction` text,
  `num` int(10) DEFAULT NULL,
  `passage` text,
  `question` text,
  `marks` int(2) DEFAULT NULL,
  `option1` varchar(255) DEFAULT NULL,
  `option2` varchar(255) DEFAULT NULL,
  `option3` varchar(255) DEFAULT NULL,
  `option4` varchar(255) DEFAULT NULL,
  `option5` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `typeAns` varchar(255) DEFAULT NULL,
  `image1` varchar(100) DEFAULT NULL,
  `image2` varchar(100) DEFAULT NULL,
  `recordtime` varchar(100) DEFAULT NULL,
  `recorddate` varchar(100) DEFAULT NULL,
  `updatetime` varchar(100) DEFAULT NULL,
  `dateupdated` varchar(100) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`sn`, `code`, `year`, `level`, `qtype`, `tot_option`, `optiontype`, `instruction`, `num`, `passage`, `question`, `marks`, `option1`, `option2`, `option3`, `option4`, `option5`, `answer`, `typeAns`, `image1`, `image2`, `recordtime`, `recorddate`, `updatetime`, `dateupdated`, `createdby`, `updatedby`) VALUES
(1, 'BIO', '2016', 'SSCE', 'exam', 4, 'choice', '', 1, '', '<p>The ability of organisms to maintain a constant internal environment is known as ------</p>', 2, 'diuresis ', 'endosmosis ', 'plasmolysis ', 'Homeostasis', NULL, 'diuresis ', '', '', NULL, '1470845070', 'Wed 10th Aug, 2016 - 6:04 30 PM', NULL, NULL, 'admin', NULL),
(2, 'BIO', '2016', 'SSCE', 'exam', 4, 'choice', '', 2, '', '<p>An organism which operates at the cellular level of organisation carries out its physiological activities by using its ....................</p>', 2, 'cell membrane ', 'small size ', 'cytoplasm ', 'Organelles', NULL, 'Organelles', '', '', NULL, '1470845156', 'Wed 10th Aug, 2016 - 6:05 56 PM', NULL, NULL, 'admin', NULL),
(3, 'BIO', '2016', 'SSCE', 'exam', 4, 'choice', '', 3, '', '<p>A pulse is best described as....................</p>', 2, 'contraction of arteries to let out blood ', 'contraction of veins to allow blood into them', ' dilation of arteries to accommodate blood rushing through', 'pumping action of the heart to move blood round the body', NULL, ' dilation of arteries to accommodate blood rushing through', '', '', NULL, '1470845231', 'Wed 10th Aug, 2016 - 6:07 11 PM', NULL, NULL, 'admin', NULL),
(4, 'BIO', '2016', 'SSCE', 'exam', 4, 'choice', '', 4, '', '<p>The relationship between the retina and the brain is similar to that between the...........</p>', 2, 'cochlea and auditory nerve ', 'cochlea and brain ', 'cochlea and semi circular canal', 'eardrum and brain', NULL, 'cochlea and brain ', '', '', NULL, '1470845305', 'Wed 10th Aug, 2016 - 6:08 25 PM', NULL, NULL, 'admin', NULL),
(5, 'BIO', '2016', 'SSCE', 'exam', 4, 'choice', '', 5, '', '<p>Transportation of water in the xylem tissue involves the following except.......</p>', 2, 'root pressure ', 'transpiration pull ', 'capillary action ', 'Translocation', NULL, 'Translocation', '', '', NULL, '1470845393', 'Wed 10th Aug, 2016 - 6:09 53 PM', NULL, NULL, 'admin', NULL),
(6, 'BIO', '2016', 'SSCE', 'exam', 4, 'choice', '', 6, '', '<p>The distribution of organisms in a fresh water habitat like a stream or pond is determined by the following factors except...................</p>', 2, 'pH of the soil ', 'light penetration ', 'rainfall ', 'temperature', NULL, 'pH of the soil ', '', '', NULL, '1470845464', 'Wed 10th Aug, 2016 - 6:11 04 PM', NULL, NULL, 'admin', NULL),
(7, 'BIO', '2016', 'SSCE', 'exam', 4, 'choice', '', 7, '', '<p>The brain and the spinal cord make up the ........................</p>', 2, 'autonomic nervous system', 'peripheral nervous system', 'central nervous system', ' sympathetic nervous system', NULL, 'central nervous system', '', '', NULL, '1470845540', 'Wed 10th Aug, 2016 - 6:12 20 PM', NULL, NULL, 'admin', NULL),
(8, 'BIO', '2016', 'SSCE', 'Exam', 4, 'choice', '', 8, '', '<p>Which of the following specialised structures are stimulated by touch, pressure, pain, heat and cold? .......</p>', 2, 'relay neurones ', 'receptors ', 'synapse ', 'myelin sheath', NULL, 'receptors ', '', '', NULL, '1470845873', 'Wed 10th Aug, 2016 - 6:17 53 PM', NULL, NULL, 'admin', NULL),
(9, 'BIO', '2016', 'SSCE', 'exam', 4, 'choice', '', 9, '', '<p>When a person\\''s urine contains a high concentration of urea, it could be as a result of .....</p>', 2, 'a drop in body temperature', 'having', 'eating a meal rich in proteins', 'drinking a large amount of water', NULL, 'eating a meal rich in proteins', '', '', NULL, '1470845984', 'Wed 10th Aug, 2016 - 6:19 44 PM', NULL, NULL, 'admin', NULL),
(10, 'BIO', '2016', 'SSCE', 'exam', 4, 'choice', '', 10, '', '<p>Which of the following diseases cannot be spread by an insect?</p>', 2, 'Cholera ', 'Malaria ', 'Trypanosomiasis ', 'Measles', NULL, 'Measles', '', '', NULL, '1470846060', 'Wed 10th Aug, 2016 - 6:21 00 PM', NULL, NULL, 'admin', NULL),
(11, 'BIO', '2016', 'SSCE', 'exam', 4, 'choice', 'Use the diagram below to answer this question', 11, '', '<p>The structure above represents a</p>', 2, 'thoracic vertebra', 'cervical vertebra', 'caudal vertebra', 'lumbar vertebra.', '', 'cervical vertebra', '', 'img_for_BIO_exam_11_1470846350.png', NULL, '1470846231', 'Wed 10th Aug, 2016 - 6:23 51 PM', '1470846350', 'Wed 10th Aug, 2016 - 6:25 50 PM', 'admin', 'admin'),
(12, 'BIO', '2016', 'SSCE', 'exam', 4, 'choice', 'Use the diagram below to answer this question', 12, '', '<p>Blood vessels usually pass through the structure labelled</p>', 2, 'II', 'III', 'IV', 'V', '', 'V', '', 'img_for_BIO_exam_12_1470846393.png', NULL, '1470846303', 'Wed 10th Aug, 2016 - 6:25 03 PM', '1470846393', 'Wed 10th Aug, 2016 - 6:26 33 PM', 'admin', 'admin'),
(13, 'BIO', '2016', 'SSCE', 'exam', 4, 'choice', '', 13, '<p>this passage is very important, you must read it well befoere you answer the question under it</p>', '<p>The gland usually found in the position labelled I is the</p>', 2, 'adrenal ', 'thyroid ', 'pancreatic', 'pituitary', '', 'pituitary', '', '', NULL, '1470846556', 'Wed 10th Aug, 2016 - 6:29 16 PM', '1471328697', 'Tue 16th Aug, 2016 - 8:24 57 AM', 'admin', 'mayorjo'),
(14, 'BIO', '2016', 'SSCE', 'exam', 4, 'choice', 'Use the diagram below to answer this question', 14, '', '<p>The hormone secreted at IV served to</p>', 2, 'facilitate the development of facial hairs', 'raise the level of calcium ions in the blood', 'lower blood glucose level', 'make the body react to emergencies.', NULL, 'facilitate the development of facial hairs', '', 'img_for_BIO_exam_13_1470846556.png', NULL, '1470846669', 'Wed 10th Aug, 2016 - 6:31 09 PM', NULL, NULL, 'admin', NULL),
(15, 'BIO', '2016', 'SSCE', 'exam', 4, 'choice', 'Use the diagram below to answer this question', 15, '', '<p>The structure labeled I originates from the</p>', 2, 'liver ', 'kidney', 'small intestine ', 'stomach', NULL, 'kidney', '', 'img_for_BIO_exam_15_1470846840.png', NULL, '1470846840', 'Wed 10th Aug, 2016 - 6:34 00 PM', NULL, NULL, 'admin', NULL),
(16, 'BIO', '2016', 'SSCE', 'exam', 4, 'choice', 'Use the diagram below to answer this question', 16, '', '<p>Birth control by vasectomy is achieved by severing the structure labelled</p>', 2, 'I', 'II', 'III', 'IV', NULL, 'III', '', 'img_for_BIO_exam_15_1470846840.png', NULL, '1470846890', 'Wed 10th Aug, 2016 - 6:34 50 PM', NULL, NULL, 'admin', NULL),
(17, 'BIO', '2016', 'SSCE', 'exam', 4, 'choice', 'Use the diagram below to answer this question', 17, '', '<p>The endoplasmic reticulum is represented by the part labelled</p>', 2, 'I', 'II', 'III', 'IV', NULL, 'IV', '', 'img_for_BIO_exam_17_1470847021.png', NULL, '1470847021', 'Wed 10th Aug, 2016 - 6:37 01 PM', NULL, NULL, 'admin', NULL),
(18, 'BIO', '2016', 'SSCE', 'exam', 4, 'choice', 'Use the diagram below to answer this question', 18, '', '<p>The part labelled II is responsible for</p>', 2, 'photosynthesis', 'respiration', 'protein synthesis', 'excretion', NULL, 'respiration', '', 'img_for_BIO_exam_17_1470847021.png', NULL, '1470847088', 'Wed 10th Aug, 2016 - 6:38 08 PM', NULL, NULL, 'admin', NULL),
(19, 'BIO', '2016', 'SSCE', 'exam', 4, 'choice', '', 19, '', '<p>The rods in the retina of the eye are examples of</p>', 2, 'cells', 'tissues ', 'organs', 'systems', NULL, 'cells', '', '', NULL, '1470847205', 'Wed 10th Aug, 2016 - 6:40 05 PM', NULL, NULL, 'admin', NULL),
(20, 'BIO', '2016', 'SSCE', 'exam', 4, 'choice', '', 20, '', '<p>The absence of special food and water conducting systems restricts the body size in</p>', 2, 'algae, liverworts and mosses', 'liverworts, mosses and ferns', 'the bryophytes ad the pteridophytes', 'the thallophytes and the pteridophytes', NULL, 'algae, liverworts and mosses', '', '', NULL, '1470847298', 'Wed 10th Aug, 2016 - 6:41 38 PM', NULL, NULL, 'admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `school_info`
--

CREATE TABLE `school_info` (
  `sn` int(3) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `shortname` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `address` text,
  `resortcode` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school_info`
--

INSERT INTO `school_info` (`sn`, `name`, `shortname`, `logo`, `address`, `resortcode`) VALUES
(0, 'Kwara State College of Education Technical.. Lafiagi', 'KWCOETL', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `sn` int(20) NOT NULL,
  `user_id` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL,
  `enc_psw` varchar(200) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `midname` varchar(50) DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `day` int(2) DEFAULT NULL,
  `month` int(2) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `faculty` varchar(100) DEFAULT NULL,
  `department` varchar(60) DEFAULT NULL,
  `level` varchar(15) DEFAULT NULL,
  `homeaddress` text,
  `phone` varchar(11) DEFAULT NULL,
  `passport` varchar(100) DEFAULT NULL,
  `yearreg` int(4) DEFAULT NULL,
  `datereg` varchar(30) DEFAULT NULL,
  `timereg` varchar(20) DEFAULT NULL,
  `scheduledate` varchar(100) DEFAULT NULL,
  `batch` varchar(10) DEFAULT NULL,
  `logtime` varchar(30) DEFAULT NULL,
  `logdate` varchar(60) DEFAULT NULL,
  `logstatus` varchar(10) DEFAULT NULL,
  `pc_name` varchar(200) DEFAULT NULL,
  `pc_ip` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`sn`, `user_id`, `password`, `enc_psw`, `surname`, `firstname`, `midname`, `sex`, `dob`, `day`, `month`, `year`, `email`, `faculty`, `department`, `level`, `homeaddress`, `phone`, `passport`, `yearreg`, `datereg`, `timereg`, `scheduledate`, `batch`, `logtime`, `logdate`, `logstatus`, `pc_name`, `pc_ip`) VALUES
(49, 'NCE001', 'abubakar', '34d302424ba0733ebaa8327fb13f12e8', 'ABUBAKAR ', 'Fatima ', 'Bana', 'M', '01/01/1985', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', '2016 PRE NCE', NULL, '01234567890', 'p1.png', NULL, NULL, NULL, NULL, NULL, '1471471254', 'Thu 18th Aug, 2016 - 12:00 54 AM', 'lout', 'OJO-ISAAC-MAYOWA', NULL),
(50, 'NCE002', 'oseni', '0f0656ce098f3541c257314a1c2e5f82', 'OSENI', 'Saheed', NULL, 'M', '01/01/1986', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', '2016 PRE NCE', NULL, '01234567891', 'p2.jpg', NULL, NULL, NULL, NULL, NULL, '1471465493', 'Wed 17th Aug, 2016 - 10:24 53 PM', 'lout', 'OJO-ISAAC-MAYOWA', NULL),
(51, 'NCE003', 'mohammed', 'd79cd06799863224b7324d969c1e2084', 'MOHAMMED', 'Hawawu', 'Haja', 'F', '01/01/1987', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', '2016 PRE NCE', NULL, '01234567892', 'p3.png', NULL, NULL, NULL, NULL, NULL, '1471465532', 'Wed 17th Aug, 2016 - 10:25 32 PM', 'lout', 'OJO-ISAAC-MAYOWA', NULL),
(52, 'NCE004', 'jimoh', '827e7b89978c2d7867caa6d264861911', 'JIMOH', 'Muhinat', NULL, 'F', '01/01/1988', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', '2016 PRE NCE', NULL, '01234567893', 'p5.jpg', NULL, NULL, NULL, NULL, NULL, '1471464855', 'Wed 17th Aug, 2016 - 10:14 15 PM', 'lout', 'OJO-ISAAC-MAYOWA', NULL),
(53, 'NCE005', 'abubakar ', 'dd90d91477daee7b7f92004d0846f6f8', 'ABUBAKAR ', 'Ndaman', NULL, 'M', '01/01/1989', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', '2016 PRE NCE', NULL, '01234567894', 'p6.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'lout', NULL, NULL),
(54, 'NCE006', 'yakubu', 'd226742d4715dd70100150ebf63dfa94', 'YAKUBU', 'Joy', NULL, 'F', '01/01/1990', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', '2016 PRE NCE', NULL, '01234567895', 'p7.png', NULL, NULL, NULL, NULL, NULL, '1471465265', 'Wed 17th Aug, 2016 - 10:21 05 PM', 'lout', 'OJO-ISAAC-MAYOWA', NULL),
(55, 'NCE007', 'usman ', '91ee53cbcfb0ffbf48251e60c8d63da3', 'USMAN ', 'Soliu', 'Olarewaju', 'M', '01/01/1991', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', '2016 PRE NCE', NULL, '01234567896', 'p8.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'lout', NULL, NULL),
(56, 'NCE008', 'babagbemi', '2b5d0b995c48a6939f5150706726d6af', 'BABAGBEMI', 'Feyishayo', NULL, 'M', '01/01/1992', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', '2016 PRE NCE', NULL, '01234567897', 'p9.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'lout', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_course_reg`
--

CREATE TABLE `users_course_reg` (
  `sn` int(5) NOT NULL,
  `session` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `startime` varchar(100) DEFAULT NULL,
  `endtime` varchar(100) DEFAULT NULL,
  `start` varchar(20) DEFAULT NULL,
  `stop` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_courses`
--

CREATE TABLE `users_courses` (
  `sn` int(20) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `level` varchar(10) DEFAULT NULL,
  `code` varchar(30) NOT NULL,
  `year` varchar(15) DEFAULT NULL,
  `department` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_courses`
--

INSERT INTO `users_courses` (`sn`, `user_id`, `level`, `code`, `year`, `department`) VALUES
(1, 'KWCOETL/AP2016/0006', 'NCE1', 'GSE 111', '2016', NULL),
(2, 'KWCOETL/AP2016/0006', 'NCE1', 'GSE 112', '2016', NULL),
(3, 'KWCOETL/AP2016/0006', 'NCE1', 'GSE 113', '2016', NULL),
(4, 'KWCOETL/AP2016/0006', 'NCE1', 'EDU 111', '2016', NULL),
(5, 'KWCOETL/AP2016/0006', 'NCE1', 'EDU 112', '2016', NULL),
(6, 'KWCOETL/AP2016/0006', 'NCE1', 'EDU 113', '2016', NULL),
(7, 'KWCOETL/AP2016/0006', 'NCE1', 'EDU 114', '2016', NULL),
(8, 'KWCOETL/AP2016/0001', 'NCE1', 'GSE 111', '2016', NULL),
(9, 'KWCOETL/AP2016/0001', 'NCE1', 'GSE 112', '2016', NULL),
(10, 'KWCOETL/AP2016/0001', 'NCE1', 'GSE 113', '2016', NULL),
(11, 'KWCOETL/AP2016/0001', 'NCE1', 'EDU 111', '2016', NULL),
(12, 'KWCOETL/AP2016/0001', 'NCE1', 'EDU 112', '2016', NULL),
(13, 'KWCOETL/AP2016/0001', 'NCE1', 'EDU 113', '2016', NULL),
(14, 'KWCOETL/AP2016/0001', 'NCE1', 'EDU 114', '2016', NULL),
(15, 'KWCOETL/AP2016/0005', 'NCE1', 'GSE 111', '2016', NULL),
(16, 'KWCOETL/AP2016/0005', 'NCE1', 'GSE 112', '2016', NULL),
(17, 'KWCOETL/AP2016/0005', 'NCE1', 'GSE 113', '2016', NULL),
(18, 'KWCOETL/AP2016/0005', 'NCE1', 'EDU 111', '2016', NULL),
(19, 'KWCOETL/AP2016/0005', 'NCE1', 'EDU 112', '2016', NULL),
(20, 'KWCOETL/AP2016/0005', 'NCE1', 'EDU 113', '2016', NULL),
(21, 'KWCOETL/AP2016/0005', 'NCE1', 'EDU 114', '2016', NULL),
(22, 'KWCOETL/AP2016/0008', 'NCE1', 'GSE 111', '2016', NULL),
(23, 'KWCOETL/AP2016/0008', 'NCE1', 'GSE 112', '2016', NULL),
(24, 'KWCOETL/AP2016/0008', 'NCE1', 'GSE 113', '2016', NULL),
(25, 'KWCOETL/AP2016/0008', 'NCE1', 'EDU 111', '2016', NULL),
(26, 'KWCOETL/AP2016/0008', 'NCE1', 'EDU 112', '2016', NULL),
(27, 'KWCOETL/AP2016/0008', 'NCE1', 'EDU 113', '2016', NULL),
(28, 'KWCOETL/AP2016/0008', 'NCE1', 'EDU 114', '2016', NULL),
(29, 'KWCOETL/AP2016/0011', 'NCE1', 'GSE 111', '2016', NULL),
(30, 'KWCOETL/AP2016/0011', 'NCE1', 'GSE 112', '2016', NULL),
(31, 'KWCOETL/AP2016/0011', 'NCE1', 'GSE 113', '2016', NULL),
(32, 'KWCOETL/AP2016/0011', 'NCE1', 'EDU 111', '2016', NULL),
(33, 'KWCOETL/AP2016/0011', 'NCE1', 'EDU 112', '2016', NULL),
(34, 'KWCOETL/AP2016/0011', 'NCE1', 'EDU 113', '2016', NULL),
(35, 'KWCOETL/AP2016/0011', 'NCE1', 'EDU 114', '2016', NULL),
(36, '56149087CJ', 'NCE1', 'GSE 111', '2016', NULL),
(37, '56149087CJ', 'NCE1', 'GSE 112', '2016', NULL),
(38, '56149087CJ', 'NCE1', 'GSE 113', '2016', NULL),
(39, '56149087CJ', 'NCE1', 'EDU 111', '2016', NULL),
(40, '56149087CJ', 'NCE1', 'EDU 112', '2016', NULL),
(41, '56149087CJ', 'NCE1', 'EDU 113', '2016', NULL),
(42, '56149087CJ', 'NCE1', 'EDU 114', '2016', NULL),
(43, 'KWCOETL/AP2016/0004', 'NCE1', 'GSE 111', '2016', NULL),
(44, 'KWCOETL/AP2016/0004', 'NCE1', 'GSE 112', '2016', NULL),
(45, 'KWCOETL/AP2016/0004', 'NCE1', 'GSE 113', '2016', NULL),
(46, 'KWCOETL/AP2016/0004', 'NCE1', 'EDU 111', '2016', NULL),
(47, 'KWCOETL/AP2016/0004', 'NCE1', 'EDU 112', '2016', NULL),
(48, 'KWCOETL/AP2016/0004', 'NCE1', 'EDU 113', '2016', NULL),
(49, 'KWCOETL/AP2016/0004', 'NCE1', 'EDU 114', '2016', NULL),
(50, 'KWCOETL/AP2016/0010', 'NCE1', 'GSE 111', '2016', NULL),
(51, 'KWCOETL/AP2016/0010', 'NCE1', 'GSE 112', '2016', NULL),
(52, 'KWCOETL/AP2016/0010', 'NCE1', 'GSE 113', '2016', NULL),
(53, 'KWCOETL/AP2016/0010', 'NCE1', 'EDU 111', '2016', NULL),
(54, 'KWCOETL/AP2016/0010', 'NCE1', 'EDU 112', '2016', NULL),
(55, 'KWCOETL/AP2016/0010', 'NCE1', 'EDU 113', '2016', NULL),
(56, 'KWCOETL/AP2016/0010', 'NCE1', 'EDU 114', '2016', NULL),
(57, 'KWCOETL/AP2016/0003', 'NCE1', 'GSE 111', '2016', NULL),
(58, 'KWCOETL/AP2016/0003', 'NCE1', 'GSE 112', '2016', NULL),
(59, 'KWCOETL/AP2016/0003', 'NCE1', 'GSE 113', '2016', NULL),
(60, 'KWCOETL/AP2016/0003', 'NCE1', 'EDU 111', '2016', NULL),
(61, 'KWCOETL/AP2016/0003', 'NCE1', 'EDU 112', '2016', NULL),
(62, 'KWCOETL/AP2016/0003', 'NCE1', 'EDU 113', '2016', NULL),
(63, 'KWCOETL/AP2016/0003', 'NCE1', 'EDU 114', '2016', NULL),
(64, '56299321IG', 'NCE1', 'GSE 111', '2016', NULL),
(65, '56299321IG', 'NCE1', 'GSE 112', '2016', NULL),
(66, '56299321IG', 'NCE1', 'GSE 113', '2016', NULL),
(67, '56299321IG', 'NCE1', 'EDU 111', '2016', NULL),
(68, '56299321IG', 'NCE1', 'EDU 112', '2016', NULL),
(69, '56299321IG', 'NCE1', 'EDU 113', '2016', NULL),
(70, '56299321IG', 'NCE1', 'EDU 114', '2016', NULL),
(71, 'KWCOETL/AP2016/0009', 'NCE1', 'GSE 111', '2016', NULL),
(72, 'KWCOETL/AP2016/0009', 'NCE1', 'GSE 112', '2016', NULL),
(73, 'KWCOETL/AP2016/0009', 'NCE1', 'GSE 113', '2016', NULL),
(74, 'KWCOETL/AP2016/0009', 'NCE1', 'EDU 111', '2016', NULL),
(75, 'KWCOETL/AP2016/0009', 'NCE1', 'EDU 112', '2016', NULL),
(76, 'KWCOETL/AP2016/0009', 'NCE1', 'EDU 113', '2016', NULL),
(77, 'KWCOETL/AP2016/0009', 'NCE1', 'EDU 114', '2016', NULL),
(78, 'KWCOETL/AP2016/0002', 'NCE1', 'GSE 111', '2016', NULL),
(79, 'KWCOETL/AP2016/0002', 'NCE1', 'GSE 112', '2016', NULL),
(80, 'KWCOETL/AP2016/0002', 'NCE1', 'GSE 113', '2016', NULL),
(81, 'KWCOETL/AP2016/0002', 'NCE1', 'EDU 111', '2016', NULL),
(82, 'KWCOETL/AP2016/0002', 'NCE1', 'EDU 112', '2016', NULL),
(83, 'KWCOETL/AP2016/0002', 'NCE1', 'EDU 113', '2016', NULL),
(84, 'KWCOETL/AP2016/0002', 'NCE1', 'EDU 114', '2016', NULL),
(85, 'KWCOETL/AP2016/0007', 'NCE1', 'GSE 111', '2016', NULL),
(86, 'KWCOETL/AP2016/0007', 'NCE1', 'GSE 112', '2016', NULL),
(87, 'KWCOETL/AP2016/0007', 'NCE1', 'GSE 113', '2016', NULL),
(88, 'KWCOETL/AP2016/0007', 'NCE1', 'EDU 111', '2016', NULL),
(89, 'KWCOETL/AP2016/0007', 'NCE1', 'EDU 112', '2016', NULL),
(90, 'KWCOETL/AP2016/0007', 'NCE1', 'EDU 113', '2016', NULL),
(91, 'KWCOETL/AP2016/0007', 'NCE1', 'EDU 114', '2016', NULL),
(92, 'KWCOETL/AP2016/0006', 'NCE1', 'EDU 121', '2016', NULL),
(93, 'KWCOETL/AP2016/0001', 'NCE1', 'EDU 121', '2016', NULL),
(94, 'KWCOETL/AP2016/0005', 'NCE1', 'EDU 121', '2016', NULL),
(95, 'KWCOETL/AP2016/0008', 'NCE1', 'EDU 121', '2016', NULL),
(96, 'KWCOETL/AP2016/0011', 'NCE1', 'EDU 121', '2016', NULL),
(97, '56149087CJ', 'NCE1', 'EDU 121', '2016', NULL),
(98, 'KWCOETL/AP2016/0004', 'NCE1', 'EDU 121', '2016', NULL),
(99, 'KWCOETL/AP2016/0010', 'NCE1', 'EDU 121', '2016', NULL),
(100, 'KWCOETL/AP2016/0003', 'NCE1', 'EDU 121', '2016', NULL),
(101, '56299321IG', 'NCE1', 'EDU 121', '2016', NULL),
(102, 'KWCOETL/AP2016/0009', 'NCE1', 'EDU 121', '2016', NULL),
(103, 'KWCOETL/AP2016/0002', 'NCE1', 'EDU 121', '2016', NULL),
(104, 'KWCOETL/AP2016/0007', 'NCE1', 'EDU 121', '2016', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_result`
--

CREATE TABLE `users_result` (
  `sn` int(20) NOT NULL,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `scheduledate` varchar(100) DEFAULT NULL,
  `currently` varchar(50) DEFAULT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  `qtype` varchar(25) NOT NULL,
  `codegen` varchar(100) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `year` varchar(12) DEFAULT NULL,
  `total_qtn` int(3) DEFAULT NULL,
  `level` varchar(20) DEFAULT NULL,
  `totalmark` int(3) NOT NULL,
  `unitmark` double(5,0) NOT NULL,
  `totalscore` int(3) NOT NULL,
  `unitscore` int(3) DEFAULT NULL,
  `point` int(2) NOT NULL,
  `grade` varchar(2) NOT NULL,
  `paperlogintime` varchar(50) DEFAULT NULL,
  `paperlogouttime` varchar(50) DEFAULT NULL,
  `paper_signal` varchar(50) DEFAULT NULL,
  `percent` double(5,0) DEFAULT NULL,
  `total_sec` int(10) DEFAULT NULL,
  `sec_used` int(20) DEFAULT NULL,
  `bus_stop` int(4) DEFAULT NULL,
  `department` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_result`
--

INSERT INTO `users_result` (`sn`, `user_id`, `scheduledate`, `currently`, `code`, `qtype`, `codegen`, `title`, `year`, `total_qtn`, `level`, `totalmark`, `unitmark`, `totalscore`, `unitscore`, `point`, `grade`, `paperlogintime`, `paperlogouttime`, `paper_signal`, `percent`, `total_sec`, `sec_used`, `bus_stop`, `department`) VALUES
(1, 'NCE001', '17 - Aug - 2016', 'off', '', '', '2016_cbt_grap_colo_and_draw_0827_675', 'Graphics Coloring And Drawing', '2016', 20, '2016 PRE NCE', 40, 0, 14, 13, 0, '', 'Wed 17th Aug, 2016 - 10:57 35 PM', 'Wed 17th Aug, 2016 - 11:07 39 PM', 'done', 35, 900, 675, 8, NULL),
(2, 'NCE002', '17 - Aug - 2016', 'off', '', '', '2016_cbt_grap_colo_and_draw_0827_675', 'Graphics Coloring And Drawing', '2016', 20, '2016 PRE NCE', 0, 0, 0, NULL, 0, '', NULL, NULL, 'normal', NULL, 900, NULL, NULL, NULL),
(3, 'NCE003', '17 - Aug - 2016', 'off', '', '', '2016_cbt_grap_colo_and_draw_0827_675', 'Graphics Coloring And Drawing', '2016', 20, '2016 PRE NCE', 0, 0, 0, NULL, 0, '', NULL, NULL, 'normal', NULL, 900, NULL, NULL, NULL),
(4, 'NCE004', '17 - Aug - 2016', 'off', '', '', '2016_cbt_grap_colo_and_draw_0827_675', 'Graphics Coloring And Drawing', '2016', 20, '2016 PRE NCE', 0, 0, 0, NULL, 0, '', NULL, NULL, 'normal', NULL, 900, NULL, NULL, NULL),
(5, 'NCE005', '17 - Aug - 2016', 'off', '', '', '2016_cbt_grap_colo_and_draw_0827_675', 'Graphics Coloring And Drawing', '2016', 20, '2016 PRE NCE', 0, 0, 0, NULL, 0, '', NULL, NULL, 'normal', NULL, 900, NULL, NULL, NULL),
(6, 'NCE006', '17 - Aug - 2016', 'off', '', '', '2016_cbt_grap_colo_and_draw_0827_675', 'Graphics Coloring And Drawing', '2016', 20, '2016 PRE NCE', 0, 0, 0, NULL, 0, '', NULL, NULL, 'normal', NULL, 900, NULL, NULL, NULL),
(7, 'NCE007', '17 - Aug - 2016', 'off', '', '', '2016_cbt_grap_colo_and_draw_0827_675', 'Graphics Coloring And Drawing', '2016', 20, '2016 PRE NCE', 0, 0, 0, NULL, 0, '', NULL, NULL, 'normal', NULL, 900, NULL, NULL, NULL),
(8, 'NCE008', '17 - Aug - 2016', 'off', '', '', '2016_cbt_grap_colo_and_draw_0827_675', 'Graphics Coloring And Drawing', '2016', 20, '2016 PRE NCE', 0, 0, 0, NULL, 0, '', NULL, NULL, 'normal', NULL, 900, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userslogs`
--

CREATE TABLE `userslogs` (
  `sn` int(20) NOT NULL,
  `user_id` varchar(30) NOT NULL DEFAULT '',
  `logtime` varchar(60) DEFAULT NULL,
  `logdate` varchar(60) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `department` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userslogs`
--

INSERT INTO `userslogs` (`sn`, `user_id`, `logtime`, `logdate`, `type`, `department`) VALUES
(1, 'KWCOETL/AP2016/0011 ', '1465104903', 'Sun 5th Jun, 2016 - 7:35 03 AM', 'lin', NULL),
(2, 'KWCOETL/AP2016/0011 ', '1465105188', 'Sun 5th Jun, 2016 - 7:39 48 AM', 'lout', NULL),
(3, 'KWCOETL/AP2016/0011 ', '1465118993', 'Sun 5th Jun, 2016 - 11:29 53 AM', 'lin', NULL),
(4, 'KWCOETL/AP2016/0011 ', '1465119033', 'Sun 5th Jun, 2016 - 11:30 33 AM', 'lin', NULL),
(5, 'KWCOETL/AP2016/0011 ', '1465119690', 'Sun 5th Jun, 2016 - 11:41 30 AM', 'lout', NULL),
(6, 'KWCOETL/AP2016/0010 ', '1465127784', 'Sun 5th Jun, 2016 - 1:56 24 PM', 'lin', NULL),
(7, 'KWCOETL/AP2016/0010 ', '1465127810', 'Sun 5th Jun, 2016 - 1:56 50 PM', 'lout', NULL),
(8, 'kwcoetl/ap2016/0010', '1465150372', 'Sun 5th Jun, 2016 - 8:12 52 PM', 'lin', NULL),
(9, 'kwcoetl/ap2016/0010', '1465151661', 'Sun 5th Jun, 2016 - 8:34 21 PM', 'lout', NULL),
(10, 'kwcoetl/ap2016/0003', '1465153600', 'Sun 5th Jun, 2016 - 9:06 40 PM', 'lin', NULL),
(11, 'kwcoetl/ap2016/0003', '1465153670', 'Sun 5th Jun, 2016 - 9:07 50 PM', 'lout', NULL),
(12, 'kwcoetl/ap2016/0002', '1465153733', 'Sun 5th Jun, 2016 - 9:08 53 PM', 'lin', NULL),
(13, 'KWCOETL/AP2016/0005', '1465182780', 'Mon 6th Jun, 2016 - 5:13 00 AM', 'lin', NULL),
(14, 'KWCOETL/AP2016/0005', '1465182793', 'Mon 6th Jun, 2016 - 5:13 13 AM', 'lout', NULL),
(15, 'kwcoetl/ap2016/0002', '1465184008', 'Mon 6th Jun, 2016 - 5:33 28 AM', 'lin', NULL),
(16, 'kwcoetl/ap2016/0002', '1465184014', 'Mon 6th Jun, 2016 - 5:33 34 AM', 'lout', NULL),
(17, 'KWCOETL/AP2016/0006', '1465318649', 'Tue 7th Jun, 2016 - 6:57 29 PM', 'lin', NULL),
(18, 'KWCOETL/AP2016/0006', '1465318875', 'Tue 7th Jun, 2016 - 7:01 15 PM', 'lout', NULL),
(19, 'kwcoetl/ap2016/0001', '1465318911', 'Tue 7th Jun, 2016 - 7:01 51 PM', 'lin', NULL),
(20, 'kwcoetl/ap2016/0001', '1465319102', 'Tue 7th Jun, 2016 - 7:05 02 PM', 'lout', NULL),
(21, 'KWCOETL/AP2016/0006', '1465320010', 'Tue 7th Jun, 2016 - 7:20 10 PM', 'lin', NULL),
(22, 'KWCOETL/AP2016/0006', '1465320402', 'Tue 7th Jun, 2016 - 7:26 42 PM', 'lout', NULL),
(23, 'kwcoetl/ap2016/0001', '1465320421', 'Tue 7th Jun, 2016 - 7:27 01 PM', 'lin', NULL),
(24, 'kwcoetl/ap2016/0001', '1465320554', 'Tue 7th Jun, 2016 - 7:29 14 PM', 'lin', NULL),
(25, 'kwcoetl/ap2016/0001', '1465320681', 'Tue 7th Jun, 2016 - 7:31 21 PM', 'lin', NULL),
(26, 'kwcoetl/ap2016/0001', '1465321014', 'Tue 7th Jun, 2016 - 7:36 54 PM', 'lout', NULL),
(27, '56149087CJ ', '1465321973', 'Tue 7th Jun, 2016 - 7:52 53 PM', 'lin', NULL),
(28, '56149087CJ ', '1465322075', 'Tue 7th Jun, 2016 - 7:54 35 PM', 'lout', NULL),
(29, '56149087CJ ', '1465322162', 'Tue 7th Jun, 2016 - 7:56 02 PM', 'lin', NULL),
(30, '56149087CJ ', '1465322552', 'Tue 7th Jun, 2016 - 8:02 32 PM', 'lout', NULL),
(31, 'admin', '1465359855', 'Wed 8th Jun, 2016 - 6:24 15 AM', 'lout', NULL),
(32, '56299321IG', '1465360022', 'Wed 8th Jun, 2016 - 6:27 02 AM', 'lin', NULL),
(33, '56299321IG', '1465360529', 'Wed 8th Jun, 2016 - 6:35 29 AM', 'lin', NULL),
(34, '56299321IG', '1465360911', 'Wed 8th Jun, 2016 - 6:41 51 AM', 'lout', NULL),
(35, 'KWCOETL/AP2016/0003', '1465361037', 'Wed 8th Jun, 2016 - 6:43 57 AM', 'lin', NULL),
(36, 'KWCOETL/AP2016/0003', '1465361236', 'Wed 8th Jun, 2016 - 6:47 16 AM', 'lout', NULL),
(37, 'KWCOETL/AP2016/0002', '1465361267', 'Wed 8th Jun, 2016 - 6:47 47 AM', 'lin', NULL),
(38, 'KWCOETL/AP2016/0002', '1465361440', 'Wed 8th Jun, 2016 - 6:50 40 AM', 'lout', NULL),
(39, 'KWCOETL/AP2016/0005', '1465361472', 'Wed 8th Jun, 2016 - 6:51 12 AM', 'lin', NULL),
(40, 'KWCOETL/AP2016/0005', '1465361880', 'Wed 8th Jun, 2016 - 6:58 00 AM', 'lout', NULL),
(41, 'kwcoetl/ap2016/0007', '1465362000', 'Wed 8th Jun, 2016 - 7:00 00 AM', 'lin', NULL),
(42, 'kwcoetl/ap2016/0007', '1465362153', 'Wed 8th Jun, 2016 - 7:02 33 AM', 'lout', NULL),
(43, 'KWCOETL/AP2016/0009', '1465362223', 'Wed 8th Jun, 2016 - 7:03 43 AM', 'lin', NULL),
(44, 'KWCOETL/AP2016/0009', '1465362289', 'Wed 8th Jun, 2016 - 7:04 49 AM', 'lout', NULL),
(45, 'KWCOETL/AP2016/0009', '1465362302', 'Wed 8th Jun, 2016 - 7:05 02 AM', 'lin', NULL),
(46, 'KWCOETL/AP2016/0009', '1465362644', 'Wed 8th Jun, 2016 - 7:10 44 AM', 'lout', NULL),
(47, 'KWCOETL/AP2016/0011', '1465362734', 'Wed 8th Jun, 2016 - 7:12 14 AM', 'lin', NULL),
(48, 'KWCOETL/AP2016/0011', '1465362876', 'Wed 8th Jun, 2016 - 7:14 36 AM', 'lout', NULL),
(49, 'KWCOETL/AP2016/0010', '1465362895', 'Wed 8th Jun, 2016 - 7:14 55 AM', 'lin', NULL),
(50, 'KWCOETL/AP2016/0010', '1465363000', 'Wed 8th Jun, 2016 - 7:16 40 AM', 'lout', NULL),
(51, 'KWCOETL/AP2016/0008', '1465363064', 'Wed 8th Jun, 2016 - 7:17 44 AM', 'lin', NULL),
(52, 'KWCOETL/AP2016/0008', '1465363601', 'Wed 8th Jun, 2016 - 7:26 41 AM', 'lout', NULL),
(53, 'KWCOETL/AP2016/0004', '1465363618', 'Wed 8th Jun, 2016 - 7:26 58 AM', 'lin', NULL),
(54, 'KWCOETL/AP2016/0004', '1465363689', 'Wed 8th Jun, 2016 - 7:28 09 AM', 'lout', NULL),
(55, 'kwcoetl/ap2016/0010', '1465374173', 'Wed 8th Jun, 2016 - 10:22 53 AM', 'lin', NULL),
(56, 'kwcoetl/ap2016/0010', '1465374182', 'Wed 8th Jun, 2016 - 10:23 02 AM', 'lout', NULL),
(57, '56299321IG', '1469047474', 'Wed 20th Jul, 2016 - 10:44 34 PM', 'lin', NULL),
(58, '56299321IG', '1469047571', 'Wed 20th Jul, 2016 - 10:46 11 PM', 'lout', NULL),
(59, 'KWCOETL/AP2016/0011 ', '1470644112', 'Mon 8th Aug, 2016 - 10:15 12 AM', 'lin', NULL),
(60, 'KWCOETL/AP2016/0011 ', '1470649593', 'Mon 8th Aug, 2016 - 11:46 33 AM', 'lout', NULL),
(61, 'kwcoetl/ap2016/0001', '1470722198', 'Tue 9th Aug, 2016 - 7:56 38 AM', 'lin', NULL),
(62, 'KWCOETL/AP2016/0003 ', '1470858067', 'Wed 10th Aug, 2016 - 9:41 07 PM', 'lin', NULL),
(63, 'KWCOETL/AP2016/0008', '1471182202', 'Sun 14th Aug, 2016 - 3:43 22 PM', 'lin', NULL),
(64, 'KWCOETL/AP2016/0008', '1471184059', 'Sun 14th Aug, 2016 - 4:14 19 PM', 'lout', NULL),
(65, 'KWCOETL/AP2016/0011', '1471185614', 'Sun 14th Aug, 2016 - 4:40 14 PM', 'lin', NULL),
(66, 'KWCOETL/AP2016/0011', '1471185636', 'Sun 14th Aug, 2016 - 4:40 36 PM', 'lout', NULL),
(67, 'KWCOETL/AP2016/0010', '1471185698', 'Sun 14th Aug, 2016 - 4:41 38 PM', 'lin', NULL),
(68, 'KWCOETL/AP2016/0010', '1471185728', 'Sun 14th Aug, 2016 - 4:42 08 PM', 'lout', NULL),
(69, '56149087CJ', '1471185798', 'Sun 14th Aug, 2016 - 4:43 18 PM', 'lin', NULL),
(70, '56149087CJ', '1471188452', 'Sun 14th Aug, 2016 - 5:27 32 PM', 'lout', NULL),
(71, 'KWCOETL/AP2016/0002 ', '1471188460', 'Sun 14th Aug, 2016 - 5:27 40 PM', 'lin', NULL),
(72, 'KWCOETL/AP2016/0002 ', '1471188484', 'Sun 14th Aug, 2016 - 5:28 04 PM', 'lout', NULL),
(73, '56299321IG', '1471188496', 'Sun 14th Aug, 2016 - 5:28 16 PM', 'lin', NULL),
(74, '56299321IG', '1471188530', 'Sun 14th Aug, 2016 - 5:28 50 PM', 'lout', NULL),
(75, 'KWCOETL/AP2016/0009', '1471188576', 'Sun 14th Aug, 2016 - 5:29 36 PM', 'lin', NULL),
(76, 'KWCOETL/AP2016/0009', '1471189344', 'Sun 14th Aug, 2016 - 5:42 24 PM', 'lout', NULL),
(77, 'KWCOETL/AP2016/0005', '1471189379', 'Sun 14th Aug, 2016 - 5:42 59 PM', 'lin', NULL),
(78, 'KWCOETL/AP2016/0005', '1471189605', 'Sun 14th Aug, 2016 - 5:46 45 PM', 'lout', NULL),
(79, 'KWCOETL/AP2016/0005 ', '1471189633', 'Sun 14th Aug, 2016 - 5:47 13 PM', 'lin', NULL),
(80, 'KWCOETL/AP2016/0005 ', '1471189638', 'Sun 14th Aug, 2016 - 5:47 18 PM', 'lout', NULL),
(81, '56149087CJ ', '1471189670', 'Sun 14th Aug, 2016 - 5:47 50 PM', 'lin', NULL),
(82, '56149087CJ ', '1471189762', 'Sun 14th Aug, 2016 - 5:49 22 PM', 'lout', NULL),
(83, '56149087CJ ', '1471189835', 'Sun 14th Aug, 2016 - 5:50 35 PM', 'lin', NULL),
(84, '56149087CJ ', '1471195892', 'Sun 14th Aug, 2016 - 7:31 32 PM', 'lout', NULL),
(85, '56149087CJ', '1471363262', 'Tue 16th Aug, 2016 - 6:01 02 PM', 'lin', NULL),
(86, '56149087CJ', '1471363338', 'Tue 16th Aug, 2016 - 6:02 18 PM', 'lout', NULL),
(87, 'KWCOETL/AP2016/0010', '1471363353', 'Tue 16th Aug, 2016 - 6:02 33 PM', 'lin', NULL),
(88, 'KWCOETL/AP2016/0010', '1471363532', 'Tue 16th Aug, 2016 - 6:05 32 PM', 'lin', NULL),
(89, 'KWCOETL/AP2016/0010', '1471364147', 'Tue 16th Aug, 2016 - 6:15 47 PM', 'lout', NULL),
(90, 'KWCOETL/AP2016/0010', '1471364171', 'Tue 16th Aug, 2016 - 6:16 11 PM', 'lin', NULL),
(91, 'KWCOETL/AP2016/0010', '1471366162', 'Tue 16th Aug, 2016 - 6:49 22 PM', 'lin', NULL),
(92, 'kwcoetl/ap2016/0010', '1471368983', 'Tue 16th Aug, 2016 - 7:36 23 PM', 'lin', NULL),
(93, 'KWCOETL/AP2016/0005 ', '1471375161', 'Tue 16th Aug, 2016 - 9:19 21 PM', 'lin', NULL),
(94, 'KWCOETL/AP2016/0005', '1471375986', 'Tue 16th Aug, 2016 - 9:33 06 PM', 'lin', NULL),
(95, 'KWCOETL/AP2016/0005 ', '1471376499', 'Tue 16th Aug, 2016 - 9:41 39 PM', 'lin', NULL),
(96, 'KWCOETL/AP2016/0005 ', '1471378080', 'Tue 16th Aug, 2016 - 10:08 00 PM', 'lout', NULL),
(97, 'KWCOETL/AP2016/0003', '1471380295', 'Tue 16th Aug, 2016 - 10:44 55 PM', 'lin', NULL),
(98, 'KWCOETL/AP2016/0003', '1471384443', 'Tue 16th Aug, 2016 - 11:54 03 PM', 'lout', NULL),
(99, 'KWCOETL/AP2016/0009', '1471384455', 'Tue 16th Aug, 2016 - 11:54 15 PM', 'lin', NULL),
(100, 'KWCOETL/AP2016/0009', '1471385980', 'Wed 17th Aug, 2016 - 12:19 40 AM', 'lout', NULL),
(101, 'NCE004', '1471464848', 'Wed 17th Aug, 2016 - 10:14 08 PM', 'lin', NULL),
(102, 'NCE004', '1471464855', 'Wed 17th Aug, 2016 - 10:14 15 PM', 'lout', NULL),
(103, 'nce006', '1471465225', 'Wed 17th Aug, 2016 - 10:20 25 PM', 'lin', NULL),
(104, 'nce006', '1471465265', 'Wed 17th Aug, 2016 - 10:21 05 PM', 'lout', NULL),
(105, 'NCE001', '1471465434', 'Wed 17th Aug, 2016 - 10:23 54 PM', 'lin', NULL),
(106, 'NCE001', '1471465448', 'Wed 17th Aug, 2016 - 10:24 08 PM', 'lout', NULL),
(107, 'NCE002', '1471465489', 'Wed 17th Aug, 2016 - 10:24 49 PM', 'lin', NULL),
(108, 'NCE002', '1471465493', 'Wed 17th Aug, 2016 - 10:24 53 PM', 'lout', NULL),
(109, 'NCE003', '1471465527', 'Wed 17th Aug, 2016 - 10:25 27 PM', 'lin', NULL),
(110, 'NCE003', '1471465532', 'Wed 17th Aug, 2016 - 10:25 32 PM', 'lout', NULL),
(111, 'NCE001', '1471466062', 'Wed 17th Aug, 2016 - 10:34 22 PM', 'lin', NULL),
(112, 'nce001', '1471466214', 'Wed 17th Aug, 2016 - 10:36 54 PM', 'lin', NULL),
(113, 'nce001', '1471467054', 'Wed 17th Aug, 2016 - 10:50 54 PM', 'lin', NULL),
(114, 'nce001', '1471467448', 'Wed 17th Aug, 2016 - 10:57 28 PM', 'lin', NULL),
(115, 'NCE001', '1471468321', 'Wed 17th Aug, 2016 - 11:12 01 PM', 'lin', NULL),
(116, 'NCE001', '1471468345', 'Wed 17th Aug, 2016 - 11:12 25 PM', 'lout', NULL),
(117, 'nce001', '1471471254', 'Thu 18th Aug, 2016 - 12:00 54 AM', 'lout', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`sn`,`user_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`sn`,`code`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`sn`,`code`,`facCode`);

--
-- Indexes for table `epanel`
--
ALTER TABLE `epanel`
  ADD PRIMARY KEY (`sn`,`codegen`);

--
-- Indexes for table `esource`
--
ALTER TABLE `esource`
  ADD PRIMARY KEY (`sn`,`code`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`sn`,`code`);

--
-- Indexes for table `qtn_remind`
--
ALTER TABLE `qtn_remind`
  ADD PRIMARY KEY (`sn`,`user_id`,`year`,`codegen`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`sn`,`code`,`year`,`level`);

--
-- Indexes for table `school_info`
--
ALTER TABLE `school_info`
  ADD PRIMARY KEY (`sn`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`sn`,`user_id`);

--
-- Indexes for table `users_course_reg`
--
ALTER TABLE `users_course_reg`
  ADD PRIMARY KEY (`sn`);

--
-- Indexes for table `users_courses`
--
ALTER TABLE `users_courses`
  ADD PRIMARY KEY (`sn`,`user_id`,`code`);

--
-- Indexes for table `users_result`
--
ALTER TABLE `users_result`
  ADD PRIMARY KEY (`sn`,`user_id`,`codegen`);

--
-- Indexes for table `userslogs`
--
ALTER TABLE `userslogs`
  ADD PRIMARY KEY (`sn`,`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `sn` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `sn` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `sn` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `epanel`
--
ALTER TABLE `epanel`
  MODIFY `sn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `esource`
--
ALTER TABLE `esource`
  MODIFY `sn` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `sn` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `qtn_remind`
--
ALTER TABLE `qtn_remind`
  MODIFY `sn` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `sn` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `sn` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `users_course_reg`
--
ALTER TABLE `users_course_reg`
  MODIFY `sn` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_courses`
--
ALTER TABLE `users_courses`
  MODIFY `sn` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `users_result`
--
ALTER TABLE `users_result`
  MODIFY `sn` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `userslogs`
--
ALTER TABLE `userslogs`
  MODIFY `sn` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
