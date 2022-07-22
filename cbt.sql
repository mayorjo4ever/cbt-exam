-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2016 at 04:36 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ilorin_edu_cbt`
--
CREATE DATABASE IF NOT EXISTS `ilorin_edu_cbt` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ilorin_edu_cbt`;

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
-- Table structure for table `course_schedule`
--

CREATE TABLE `course_schedule` (
  `sn` int(10) NOT NULL,
  `code` varchar(30) NOT NULL,
  `qtype` varchar(50) DEFAULT NULL,
  `year` varchar(10) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_schedule`
--

INSERT INTO `course_schedule` (`sn`, `code`, `qtype`, `year`, `state`) VALUES
(1, 'EDU 121', 'TEST', '2016', 'done'),
(2, 'EDU 113', 'Exam', '2016', 'ready');

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
(31, 'General English  I', 'GSE 111', 1, 'C', NULL, '', '100', '1st'),
(32, 'Introduction to Library Studies ', 'GSE 112', 1, 'C', NULL, '', '100', '1st'),
(33, 'Basic general Mathematics I', 'GSE 113', 1, 'C', NULL, '', '100', '1st'),
(34, 'General English II', 'GSE 121', 1, 'C', NULL, '', '100', '2nd'),
(35, 'Basic general Mathematics II', 'GSE 122', 1, 'C', NULL, '', '100', '2nd'),
(36, 'Introduction to computer Studies I', 'GSE 123', 1, 'C', NULL, '', '100', '2nd'),
(37, 'FLEHI - Family Life and Emerging Health Issues', 'GSE 124', 1, 'C', NULL, '', '100', '2nd'),
(38, 'General Engliish III', 'GSE 211', 1, 'C', NULL, '', '200', '1st'),
(39, 'Basic General Mathematics III', 'GSE 212', 1, 'C', NULL, '', '200', '1st'),
(40, 'Introduction to computer Studies II', 'GSE 213', 1, 'C', NULL, '', '200', '1st'),
(41, 'General English IV', 'GSE 221', 2, 'C', NULL, '', '200', '2nd'),
(42, 'Basic General Mathematics IV', 'GSE 222', 1, 'C', NULL, '', '200', '2nd'),
(43, 'Citizinship Education ', 'GSE 223', 1, 'C', NULL, '', '200', '2nd'),
(44, 'Enterpreneurship', 'GSE 224', 1, 'C', NULL, '', '200', '2nd'),
(45, 'General English V', 'GSE 321', 1, 'C', NULL, '', '300', '2nd'),
(46, 'Basic General Mathematics V', 'GSE 322', 1, 'C', NULL, '', '300', '2nd'),
(47, 'Science and Technology in Society', 'GSE 323', 1, 'E', NULL, '', '300', '2nd'),
(48, 'Political Economy', 'GSE 324', 1, 'E', NULL, '', '300', '2nd'),
(49, 'History of Education in Nigeria', 'EDU 111', 1, 'C', NULL, '', '100', '1st'),
(50, 'Educational Psycology I', 'EDU 112', 1, 'C', NULL, '', '100', '1st'),
(51, 'Principles and Methods of Teaching', 'EDU 113', 1, 'C', NULL, '', '100', '1st'),
(52, 'Introduction to Pre-primary and Primary Education', 'EDU 114', 1, 'C', NULL, '', '100', '1st'),
(53, 'Sociology of Education', 'EDU 121', 1, 'C', NULL, '', '100', '2nd'),
(54, 'Educational Psycology II (Human Learning)', 'EDU 122/125', 1, 'C', NULL, '', '100', '2nd'),
(56, 'Introduction to Teacher Education ', 'EDU 123/122', 1, 'C', NULL, '', '100', '2nd'),
(57, 'Philosophy of Education ', 'EDU 211/123', 1, 'C', NULL, '', '200', '1st'),
(58, 'Educational Technology: Theory & Practice', 'EDU 212', 1, 'C', NULL, '', '200', '1st'),
(59, 'Micro - Teaching: Theory', 'EDU 213', 1, 'C', NULL, '', '200', '1st'),
(60, 'Introduction to Research Methods ', 'EDU 214', 1, 'C', NULL, '', '200', '1st'),
(61, 'Education of Special Target Groups', 'EDU 215', 1, 'C', NULL, '', '200', '2nd'),
(62, 'Introduction to Special Education ', 'EDU 221/225', 1, 'C', NULL, '', '200', '2nd'),
(63, 'Curriculum Studies I', 'EDU 222/221', 1, 'C', NULL, '', '200', '2nd'),
(64, 'Measurement and Evaluation', 'EDU 223/222', 1, 'C', NULL, '', '200', '2nd'),
(65, 'Educational Admin; Planning & Supervision', 'EDU 226/224', 1, 'C', NULL, '', '200', '2nd'),
(66, 'Introduction to Adult Education & Non-Formal', 'EDU 321/325', 1, 'C', NULL, '', '200', '2nd'),
(67, 'Curriculum Studies II', 'EDU 322/321', 1, 'C', NULL, '', '200', '2nd'),
(68, 'Educational Planning and Supervision', 'EDU 324', 1, 'C', NULL, '', '200', '2nd'),
(69, 'Adolescent Psychology', 'EDU 325/322', 1, 'C', NULL, '', '200', '2nd'),
(70, 'Introduction to Theory & Practical of Guidance & Counselling', 'EDU 326/324', 1, 'C', NULL, '', '200', '2nd'),
(71, 'Theory and Practice of CFSs', 'EDU 124', 1, 'C', NULL, '', '100', '2nd');

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
  `sn` int(10) NOT NULL,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `year` varchar(12) DEFAULT NULL,
  `qtype` varchar(50) NOT NULL DEFAULT '0',
  `code` varchar(50) NOT NULL DEFAULT '',
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

INSERT INTO `qtn_remind` (`sn`, `user_id`, `year`, `qtype`, `code`, `num`, `tot_option`, `optiontype`, `passage`, `question`, `marks`, `option1`, `option2`, `option3`, `option4`, `option5`, `image1`, `image2`, `answer`, `picked1`, `typeAns`) VALUES
(11, 'KWCOETL/AP2016/0009', '2016', 'Exam', 'EDU 113', 1, 4, 'choice', '', '<p><span style="font-size: 14pt;">The product of 2 and 3 is ___</span></p>', 2, '5', '6', '7', '8', '', '', NULL, '6', '6', NULL),
(12, 'KWCOETL/AP2016/0009', '2016', 'Exam', 'EDU 113', 2, 4, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 2 and 3 is ____</span></p>', 5, '5', '6', '7', '8', '', '', NULL, '5', '5', NULL),
(13, 'KWCOETL/AP2016/0009', '2016', 'Exam', 'EDU 113', 3, 5, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 20, 30, 50 and <span style="text-decoration: underline;">X</span> gives 205, what is <span style="text-decoration: underline;">X</span></span></p>', 2, '55', '85', '105', '115', '95', '', NULL, '105', '105', NULL),
(14, 'KWCOETL/AP2016/0009', '2016', 'Exam', 'EDU 113', 4, 4, 'choice', '', '<p><span style="font-size: 14pt;">How many student are there all together</span></p>', 2, '50', '30', '60', '80', '70', '', NULL, '80', '30', NULL),
(15, 'KWCOETL/AP2016/0009', '2016', 'Exam', 'EDU 113', 5, 5, 'choice', '', '<p><span style="font-size: 14pt;">What is the average of the students who sat for the exams</span></p>', 2, '800.333', '773.333', '73.333', '7333.33', '733.33', '', NULL, '733.33', '7333.33', NULL),
(16, 'kwcoetl/ap2016/0009', '2016', 'TEST', 'GSE 113', 1, 4, 'choice', '', '<p><span style="font-size: 14pt;">If the graph of y = f(x) is transformed into the graph of 2y - 6 = - 4 f(x - 3), point (a , b) on the graph of y = f(x) becomes point (A , B) on the graph of 2y - 6 = - 4 f(x - 3) where A and B are given by </span></p>', 2, ' A = a - 3, B = b', 'A = a - 3, B = b ', 'A = a + 3, B = -2 b ', 'A = a + 3, B = -2 b +3', '', '', NULL, 'A = a + 3, B = -2 b +3', ' A = a - 3, B = b', NULL),
(17, 'kwcoetl/ap2016/0009', '2016', 'TEST', 'GSE 113', 2, 4, 'choice', '', '<p><span style="font-size: 14pt;">If Log<sub>4</sub> (x) = 12, then log<sub>2</sub> (x / 4) is equal to</span></p>', 2, '11', '48', '-12', '22', '', '', NULL, '22', '48', NULL),
(18, 'kwcoetl/ap2016/0009', '2016', 'TEST', 'GSE 113', 3, 4, 'choice', '', '<p><span style="font-size: 14pt;">Five different books (A, B, C, D and E) are to be arranged on a shelf. Books C and D are to be arranged first and second starting from the right of the shelf. The number of different orders in which books A, B and E may be arranged is </span></p>', 2, '5!', '3!', '2!', '3! * 2!', '', '', NULL, '3!', '3!', NULL),
(19, 'kwcoetl/ap2016/0009', '2016', 'TEST', 'GSE 113', 4, 4, 'choice', '', '<p><span style="font-size: 14pt;">If Log<sub>x</sub> (1 / 8) = - 3 / 2, then x is equal to</span></p>', 2, '-4', '4', '1/4', '10', '', '', NULL, '4', '1/4', NULL),
(20, 'kwcoetl/ap2016/0009', '2016', 'TEST', 'GSE 113', 5, 4, 'choice', '', '<p><span style="font-size: 14pt;">20% of 2 is equal to</span></p>', 2, '20', '4', '0.4', '0.04', '', '', NULL, '0.4', '0.4', NULL),
(21, 'kwcoetl/ap2016/0009', '2016', 'TEST', 'GSE 113', 6, 4, 'choice', '', '<p><span style="font-size: 14pt;">The population of a country increased by an average of 2% per year from 2000 to 2003. If the population of this country was 2 000 000 on December 31, 2003, then the population of this country on January 1, 2000, to the nearest thousand would have been </span></p>', 2, '1 846 000 ', '1 852 000', '1 000 000', '1 500 000', '', '', NULL, '1 846 000 ', '1 852 000', NULL),
(22, 'kwcoetl/ap2016/0009', '2016', 'TEST', 'GSE 113', 7, 4, 'choice', '', '<p><span style="font-size: 14pt;">The exam scores of all 500 students were recorded and it was determined that these scores were normally distributed. If Jane''s score is 0.8 standard deviation above the mean, then how many, to the nearest unit, students scored above Jane? </span></p>', 2, '394', '250', '400', '106', NULL, '', NULL, '106', '106', NULL),
(23, 'kwcoetl/ap2016/0009', '2016', 'TEST', 'GSE 113', 8, 4, 'choice', '', '<p><span style="font-size: 14pt;">A school committee consists of 2 teachers and 4 students. The number of different committees that can be formed from 5 teachers and 10 students is</span></p>', 2, '10', '15', '2100', '8', '', '', NULL, '2100', '10', NULL),
(24, 'kwcoetl/ap2016/0009', '2016', 'TEST', 'GSE 113', 9, 4, 'choice', '', '<p><span style="font-size: 14pt;">f is a quadratic function&nbsp;whose graph is a parabola opening upward and has a vertex on the x-axis. The graph of the new function g defined by g(x) = 2 - f(x - 5) has a range defined by the interval</span></p>', 2, ' [ -5 , + infinity) ', ' [ 2 , + infinity) ', '( - infinity , 2] ', '( - infinity , 0]', '', '', NULL, '( - infinity , 2] ', ' [ 2 , + infinity) ', NULL),
(25, 'kwcoetl/ap2016/0009', '2016', 'TEST', 'GSE 113', 10, 4, 'choice', '', '<p><span style="font-size: 14pt;">When a parabola represented by the equation y - 2x<sup> 2</sup> = 8 x + 5 is translated 3 units to the left and 2 units up, the new parabola has its vertex at</span></p>', 2, '(-5 , -1) ', '(-5 , -5) ', '(-1 , -3) ', '(-2 , -3)', '', '', NULL, '(-5 , -1) ', '(-5 , -5) ', NULL),
(1326, 'kwcoetl/ap2016/0010', '2016', 'TEST', 'GSE 113', 1, 4, 'choice', '', '<p><span style="font-size: 14pt;">The exam scores of all 500 students were recorded and it was determined that these scores were normally distributed. If Jane''s score is 0.8 standard deviation above the mean, then how many, to the nearest unit, students scored above Jane? </span></p>', 2, '394', '250', '400', '106', NULL, '', NULL, '106', '106', NULL),
(1327, 'kwcoetl/ap2016/0010', '2016', 'TEST', 'GSE 113', 2, 4, 'choice', '', '<p><span style="font-size: 14pt;">If the graph of y = f(x) is transformed into the graph of 2y - 6 = - 4 f(x - 3), point (a , b) on the graph of y = f(x) becomes point (A , B) on the graph of 2y - 6 = - 4 f(x - 3) where A and B are given by </span></p>', 2, ' A = a - 3, B = b', 'A = a - 3, B = b ', 'A = a + 3, B = -2 b ', 'A = a + 3, B = -2 b +3', '', '', NULL, 'A = a + 3, B = -2 b +3', 'A = a + 3, B = -2 b ', NULL),
(1328, 'kwcoetl/ap2016/0010', '2016', 'TEST', 'GSE 113', 3, 4, 'choice', '', '<p><span style="font-size: 14pt;">A school committee consists of 2 teachers and 4 students. The number of different committees that can be formed from 5 teachers and 10 students is</span></p>', 2, '10', '15', '2100', '8', '', '', NULL, '2100', '2100', NULL),
(1329, 'kwcoetl/ap2016/0010', '2016', 'TEST', 'GSE 113', 4, 4, 'choice', '', '<p><span style="font-size: 14pt;">If Log<sub>x</sub> (1 / 8) = - 3 / 2, then x is equal to</span></p>', 2, '-4', '4', '1/4', '10', '', '', NULL, '4', '1/4', NULL),
(1330, 'kwcoetl/ap2016/0010', '2016', 'TEST', 'GSE 113', 5, 4, 'choice', '', '<p><span style="font-size: 14pt;">When a parabola represented by the equation y - 2x<sup> 2</sup> = 8 x + 5 is translated 3 units to the left and 2 units up, the new parabola has its vertex at</span></p>', 2, '(-5 , -1) ', '(-5 , -5) ', '(-1 , -3) ', '(-2 , -3)', '', '', NULL, '(-5 , -1) ', '(-5 , -1) ', NULL),
(1331, 'kwcoetl/ap2016/0010', '2016', 'TEST', 'GSE 113', 6, 4, 'choice', '', '<p><span style="font-size: 14pt;">f is a quadratic function&nbsp;whose graph is a parabola opening upward and has a vertex on the x-axis. The graph of the new function g defined by g(x) = 2 - f(x - 5) has a range defined by the interval</span></p>', 2, ' [ -5 , + infinity) ', ' [ 2 , + infinity) ', '( - infinity , 2] ', '( - infinity , 0]', '', '', NULL, '( - infinity , 2] ', '( - infinity , 2] ', NULL),
(1332, 'kwcoetl/ap2016/0010', '2016', 'TEST', 'GSE 113', 7, 4, 'choice', '', '<p><span style="font-size: 14pt;">If Log<sub>4</sub> (x) = 12, then log<sub>2</sub> (x / 4) is equal to</span></p>', 2, '11', '48', '-12', '22', '', '', NULL, '22', '48', NULL),
(1333, 'kwcoetl/ap2016/0010', '2016', 'TEST', 'GSE 113', 8, 4, 'choice', '', '<p><span style="font-size: 14pt;">Five different books (A, B, C, D and E) are to be arranged on a shelf. Books C and D are to be arranged first and second starting from the right of the shelf. The number of different orders in which books A, B and E may be arranged is </span></p>', 2, '5!', '3!', '2!', '3! * 2!', '', '', NULL, '3!', '3!', NULL),
(1334, 'kwcoetl/ap2016/0010', '2016', 'TEST', 'GSE 113', 9, 4, 'choice', '', '<p><span style="font-size: 14pt;">20% of 2 is equal to</span></p>', 2, '20', '4', '0.4', '0.04', '', '', NULL, '0.4', '0.4', NULL),
(1335, 'kwcoetl/ap2016/0010', '2016', 'TEST', 'GSE 113', 10, 4, 'choice', '', '<p><span style="font-size: 14pt;">The population of a country increased by an average of 2% per year from 2000 to 2003. If the population of this country was 2 000 000 on December 31, 2003, then the population of this country on January 1, 2000, to the nearest thousand would have been </span></p>', 2, '1 846 000 ', '1 852 000', '1 000 000', '1 500 000', '', '', NULL, '1 846 000 ', '1 846 000 ', NULL),
(1372, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 1, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is the square rootof 144 ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '12', '12'),
(1373, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 2, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-10) * (5 - 2) = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '-30', '-30'),
(1374, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 3, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">Calculate 3<sup>2</sup> + (-4)<sup>2</sup></span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '25', '25'),
(1375, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 4, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is 5 to the power of 0 ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '1', '1'),
(1376, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 5, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">How many sides does a hexagon has ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '6', '6'),
(1377, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 6, 4, 'choice', '', '<p><span style="font-size: 14pt;">The product of 2 and 3 is ___</span></p>', 2, '5', '6', '7', '8', '', '', NULL, '6', '6', ''),
(1378, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 7, 4, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 2 and 3 is ____</span></p>', 5, '5', '6', '7', '8', '', '', NULL, '5', '5', ''),
(1379, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 8, 4, 'choice', '', '<p><span style="font-size: 14pt;">How many student are there all together</span></p>', 2, '50', '30', '60', '80', '70', '', NULL, '80', '30', ''),
(1380, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 9, 5, 'choice', '', '<p><span style="font-size: 14pt;">What is the average of the students who sat for the exams</span></p>', 2, '800.333', '773.333', '73.333', '7333.33', '733.33', '', NULL, '733.33', '773.333', ''),
(1381, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 10, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-8)<sup>2</sup> = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '64', '64'),
(1382, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 11, 5, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 20, 30, 50 and <span style="text-decoration: underline;">X</span> gives 205, what is <span style="text-decoration: underline;">X</span></span></p>', 2, '55', '85', '105', '115', '95', '', NULL, '105', '105', ''),
(1383, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 12, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">28 - 9 = ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '19', '19'),
(1420, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 1, 5, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 20, 30, 50 and <span style="text-decoration: underline;">X</span> gives 205, what is <span style="text-decoration: underline;">X</span></span></p>', 2, '55', '85', '105', '115', '95', '', NULL, '105', '105', ''),
(1421, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 2, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">28 - 9 = ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '19', '19'),
(1422, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 3, 5, 'choice', '', '<p><span style="font-size: 14pt;">What is the average of the students who sat for the exams</span></p>', 2, '800.333', '773.333', '73.333', '7333.33', '733.33', '', NULL, '733.33', '7333.33', ''),
(1423, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 4, 4, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 2 and 3 is ____</span></p>', 5, '5', '6', '7', '8', '', '', NULL, '5', '7', ''),
(1424, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 5, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is the square rootof 144 ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '12', '12'),
(1425, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 6, 4, 'choice', '', '<p><span style="font-size: 14pt;">How many student are there all together</span></p>', 2, '50', '30', '60', '80', '70', '', NULL, '80', '60', ''),
(1426, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 7, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">Calculate 3<sup>2</sup> + (-4)<sup>2</sup></span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '25', '25'),
(1427, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 8, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">How many sides does a hexagon has ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '8', '6'),
(1428, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 9, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-10) * (5 - 2) = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '10', '-30'),
(1429, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 10, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is 5 to the power of 0 ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '1', '1'),
(1430, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 11, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-8)<sup>2</sup> = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '64', '64'),
(1431, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 12, 4, 'choice', '', '<p><span style="font-size: 14pt;">The product of 2 and 3 is ___</span></p>', 2, '5', '6', '7', '8', '', '', NULL, '6', '6', ''),
(1432, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 1, 4, 'choice', '', '<p><span style="font-size: 14pt;">The product of 2 and 3 is ___</span></p>', 2, '5', '6', '7', '8', '', '', NULL, '6', '6', ''),
(1433, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 2, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">28 - 9 = ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '19', '19'),
(1434, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 3, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">Calculate 3<sup>2</sup> + (-4)<sup>2</sup></span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '25', '25'),
(1435, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 4, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">How many sides does a hexagon has ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '6', '6'),
(1436, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 5, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is 5 to the power of 0 ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '1', '1'),
(1437, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 6, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is the square rootof 144 ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '12', '12'),
(1438, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 7, 4, 'choice', '', '<p><span style="font-size: 14pt;">How many student are there all together</span></p>', 2, '50', '30', '60', '80', '70', '', NULL, '80', '60', ''),
(1439, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 8, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-10) * (5 - 2) = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '-30', '-30'),
(1440, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 9, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-8)<sup>2</sup> = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '64', '64'),
(1441, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 10, 4, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 2 and 3 is ____</span></p>', 5, '5', '6', '7', '8', '', '', NULL, '5', '5', ''),
(1442, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 11, 5, 'choice', '', '<p><span style="font-size: 14pt;">What is the average of the students who sat for the exams</span></p>', 2, '800.333', '773.333', '73.333', '7333.33', '733.33', '', NULL, '733.33', '733.33', ''),
(1443, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 12, 5, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 20, 30, 50 and <span style="text-decoration: underline;">X</span> gives 205, what is <span style="text-decoration: underline;">X</span></span></p>', 2, '55', '85', '105', '115', '95', '', NULL, '105', '105', ''),
(1444, 'kwcoetl/ap2016/0011', '2016', 'TEST', 'GSE 113', 1, 4, 'choice', '', '<p><span style="font-size: 14pt;">The population of a country increased by an average of 2% per year from 2000 to 2003. If the population of this country was 2 000 000 on December 31, 2003, then the population of this country on January 1, 2000, to the nearest thousand would have been </span></p>', 2, '1 846 000 ', '1 852 000', '1 000 000', '1 500 000', '', '', NULL, '1 846 000 ', '1 000 000', ''),
(1445, 'kwcoetl/ap2016/0011', '2016', 'TEST', 'GSE 113', 2, 4, 'choice', '', '<p><span style="font-size: 14pt;">A school committee consists of 2 teachers and 4 students. The number of different committees that can be formed from 5 teachers and 10 students is</span></p>', 2, '10', '15', '2100', '8', '', '', NULL, '2100', '2100', ''),
(1446, 'kwcoetl/ap2016/0011', '2016', 'TEST', 'GSE 113', 3, 4, 'choice', '', '<p><span style="font-size: 14pt;">If Log<sub>x</sub> (1 / 8) = - 3 / 2, then x is equal to</span></p>', 2, '-4', '4', '1/4', '10', '', '', NULL, '4', '1/4', ''),
(1447, 'kwcoetl/ap2016/0011', '2016', 'TEST', 'GSE 113', 4, 4, 'choice', '', '<p><span style="font-size: 14pt;">When a parabola represented by the equation y - 2x<sup> 2</sup> = 8 x + 5 is translated 3 units to the left and 2 units up, the new parabola has its vertex at</span></p>', 2, '(-5 , -1) ', '(-5 , -5) ', '(-1 , -3) ', '(-2 , -3)', '', '', NULL, '(-5 , -1) ', '(-5 , -5) ', ''),
(1448, 'kwcoetl/ap2016/0011', '2016', 'TEST', 'GSE 113', 5, 4, 'choice', '', '<p><span style="font-size: 14pt;">If Log<sub>4</sub> (x) = 12, then log<sub>2</sub> (x / 4) is equal to</span></p>', 2, '11', '48', '-12', '22', '', '', NULL, '22', '', ''),
(1449, 'kwcoetl/ap2016/0011', '2016', 'TEST', 'GSE 113', 6, 4, 'choice', '', '<p><span style="font-size: 14pt;">f is a quadratic function&nbsp;whose graph is a parabola opening upward and has a vertex on the x-axis. The graph of the new function g defined by g(x) = 2 - f(x - 5) has a range defined by the interval</span></p>', 2, ' [ -5 , + infinity) ', ' [ 2 , + infinity) ', '( - infinity , 2] ', '( - infinity , 0]', '', '', NULL, '( - infinity , 2] ', '', ''),
(1450, 'kwcoetl/ap2016/0011', '2016', 'TEST', 'GSE 113', 7, 4, 'choice', '', '<p><span style="font-size: 14pt;">The exam scores of all 500 students were recorded and it was determined that these scores were normally distributed. If Jane''s score is 0.8 standard deviation above the mean, then how many, to the nearest unit, students scored above Jane? </span></p>', 2, '394', '250', '400', '106', NULL, '', NULL, '106', '400', NULL),
(1451, 'kwcoetl/ap2016/0011', '2016', 'TEST', 'GSE 113', 8, 4, 'choice', '', '<p><span style="font-size: 14pt;">If the graph of y = f(x) is transformed into the graph of 2y - 6 = - 4 f(x - 3), point (a , b) on the graph of y = f(x) becomes point (A , B) on the graph of 2y - 6 = - 4 f(x - 3) where A and B are given by </span></p>', 2, ' A = a - 3, B = b', 'A = a - 3, B = b ', 'A = a + 3, B = -2 b ', 'A = a + 3, B = -2 b +3', '', '', NULL, 'A = a + 3, B = -2 b +3', '', ''),
(1452, 'kwcoetl/ap2016/0011', '2016', 'TEST', 'GSE 113', 9, 4, 'choice', '', '<p><span style="font-size: 14pt;">Five different books (A, B, C, D and E) are to be arranged on a shelf. Books C and D are to be arranged first and second starting from the right of the shelf. The number of different orders in which books A, B and E may be arranged is </span></p>', 2, '5!', '3!', '2!', '3! * 2!', '', '', NULL, '3!', '', ''),
(1453, 'kwcoetl/ap2016/0011', '2016', 'TEST', 'GSE 113', 10, 4, 'choice', '', '<p><span style="font-size: 14pt;">20% of 2 is equal to</span></p>', 2, '20', '4', '0.4', '0.04', '', '', NULL, '0.4', '', ''),
(1454, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 1, 4, 'choice', NULL, 'How many numbers between 1 and 60 begins or end with 5', 2, '5', '8', '15', '18', NULL, NULL, NULL, '15', '8', NULL),
(1455, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 2, 4, 'choice', NULL, 'The senate president during the second republic was.........................', 2, 'Dr. Joseph Wayas', 'Senator Anyim Pius Anyim', 'Senator Iyorchia Ayu', 'Chief Adopous Wabara', NULL, NULL, NULL, 'Dr. Joseph Wayas', 'Senator Iyorchia Ayu', NULL),
(1456, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 3, 4, 'choice', NULL, 'One essential duty of a citizen to his/her state is to...........................', 2, 'Vote and support the government in power', 'Recite the national anthem and the pledge', 'Pay his tax', 'Encourage other citizens to be loyal', NULL, NULL, NULL, 'Pay his tax', 'Vote and support the government in power', NULL),
(1457, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 4, 4, 'choice', NULL, 'A researcher conducted in the laboratory showed that 55% rats died of liver disorder when exposed to sulphur dioxide but 96% of rats who died of liver disorder were not exposed to sulphur dioxide. This means that', 2, 'Small portion of studied rats was exposed to Sulphur dioxide   ', 'There is only one cause of fatal liver disease in rats', 'Sulphur dioxide is not particularly dangerous to theliver of rats', 'Most rats will not suffer from exposure to low level of Sulphur dioxide.', NULL, NULL, NULL, 'Small portion of studied rats was exposed to Sulphur dioxide   ', 'Most rats will not suffer from exposure to low level of Sulphur dioxide.', NULL),
(1458, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 5, 4, 'choice', NULL, 'A written piece of paper which indicates that goods bought and services rendered have been paid for is called...............................', 2, 'An Invoice', 'A receipt', 'A wage bill', 'A trade document', NULL, NULL, NULL, 'A receipt', 'A trade document', NULL),
(1459, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 6, 4, 'choice', NULL, 'A boy buys a biscuit for N4 and sells it at a profit of 20%. Find the actual price and the selling price?', 2, 'i =N1.00k, ii = N5.00k', 'i = 60k,      ii = N4.40k', 'i = 80k, ii = N4.80k', 'i = 50k,      ii = N4.50k', NULL, NULL, NULL, 'i = 80k, ii = N4.80k', 'i =N1.00k, ii = N5.00k', NULL),
(1460, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 7, 4, 'choice', NULL, 'President Barrack Obama is the.................. president of the United States of America and first African-American president of U.S.', 2, '35th', '44th', '40th', '39th', NULL, NULL, NULL, '44th', '44th', NULL),
(1461, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 8, 4, 'choice', NULL, 'Three people witnessed a lady who was robbed in a cyber cafÃ© and they were asked to    describe the mugger. Which of the following best described the mugger?', 2, 'He was tall, of average weight and middle-aged ', 'He was tall, thin and young', 'He was average height, thin and middle-aged', 'He was tall, thin and middle-aged', NULL, NULL, NULL, 'He was tall, thin and middle-aged', 'He was tall, thin and middle-aged', NULL),
(1462, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 9, 4, 'choice', NULL, 'It was Friday on Jan 1, 2010. What was the day of the week Jan 1, 2011? ', 2, 'Sunday', 'Wednesday', 'Thursday', 'Saturday', NULL, NULL, NULL, 'Saturday', 'Thursday', NULL),
(1463, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 10, 4, 'choice', NULL, 'An example of confluence town in Nigeria is...................................', 2, 'Onitsha ', 'Obudu ', 'Lokoja', 'PortHarcout', NULL, NULL, NULL, 'Lokoja', 'Lokoja', NULL),
(1464, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 11, 4, 'choice', NULL, 'A trained person that specializes in the treatment of diseases and disorders of the teeth is called................', 2, 'Cardiologist', 'Dermatologist', 'Physician', 'Dentist', NULL, NULL, NULL, 'Dentist', 'Cardiologist', NULL),
(1465, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 12, 4, 'choice', NULL, '<p>A person who flies an aircraft is called..........................</p>', 2, 'A captain', 'A craftologist', 'A pilot', 'An aeronautics engineer', '', NULL, NULL, 'A craftologist', '', NULL),
(1466, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 13, 4, 'choice', NULL, 'At a basket match, Roland was sitting in seat 356. Peter on the right of Roland in seat 355.  Samuel was on the left of Roland. Samson was by the left of Samuel. Which seat is Samson sitting?', 2, '354', '357', '358', '353', NULL, NULL, NULL, '354', '', NULL),
(1467, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 14, 4, 'choice', NULL, ' If the total sales for a bag shop in a certain year were #150, 000 What were sales in July, if July sales were half the monthly average?', 2, '#6,250', '#8,650', '#12,500', '#7,550', NULL, NULL, NULL, '#6,250', '', NULL),
(1468, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 15, 4, 'choice', NULL, 'In UITH, Dr Steve has worked more night shift than Dr. Greg who has worked five night shifts. Dr Okon has worked fifteen night shifts more than Dr. Steve and Dr. Greg combined. Dr. Uche has worked eight night shifts less than Dr. Steve. How many night shifts has Dr, Steve worked?', 2, 'Ten', 'Nine', 'Eight', 'Seven', NULL, NULL, NULL, 'Nine', '', NULL),
(1469, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 16, 4, 'choice', NULL, 'A bricklayer is Paid N1000:00k for 5days work. What is his pay for 22days work?', 2, 'N22,000:00k', 'N50,000:00k', 'N4,400:00k', 'N5,000:00k', NULL, NULL, NULL, 'N4,400:00k', '', NULL),
(1470, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 17, 4, 'choice', NULL, 'THE PRIMARY SOURCE OF ENERGY IS CALLED                                                      ', 2, 'SUNLIGHT      ', 'WATER      ', 'FOOD', 'HEAT', NULL, NULL, NULL, 'SUNLIGHT      ', 'SUNLIGHT      ', NULL),
(1471, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 18, 4, 'choice', NULL, 'We eat Carbohydrate food to give us..........................', 2, 'Energy ', 'Good sight', 'Good teeth', 'Strong bones ', NULL, NULL, NULL, 'Energy ', 'Good sight', NULL),
(1472, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 19, 4, 'choice', NULL, ' â€œMy Heart Jumped into my mouthâ€ What is the meaning of the above statement?', 2, 'To be confused      ', 'To be hungry      ', 'To be afraid ', 'To be discouraged   ', NULL, NULL, NULL, 'To be afraid ', '', NULL),
(1473, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 20, 4, 'choice', NULL, 'The device for stepping up or down electricity voltage on transmission line is called......................', 2, 'Electricity meter', 'Transmission station', 'Transformer', 'Step-down panel', NULL, NULL, NULL, 'Transformer', '', NULL),
(1474, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 21, 4, 'choice', NULL, 'The major raw material for pottery is.............................', 2, 'Metal', 'Ceramics', 'Cement', 'Clay', NULL, NULL, NULL, 'Clay', '', NULL),
(1475, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 22, 4, 'choice', NULL, 'Two-third of a class passed English Language as a subject. The number of students who       failed English Language will be?', 2, '42007', '42006', '42008', '42067', NULL, NULL, NULL, '42007', '', NULL),
(1476, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 23, 4, 'choice', NULL, 'How many Lunar months make one year ', 2, '13', '11', '12', '14', NULL, NULL, NULL, '13', '', NULL),
(1477, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 24, 4, 'choice', '', '<p>Which of the following will sink when placed on water?</p>', 2, 'Ball', 'Plastic Cup', 'Balloon', 'Eraser', '', NULL, NULL, 'Balloon', '', NULL),
(1478, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'GSE 111', 25, 4, 'choice', NULL, 'The title of the traditional ruler of Benin is called................................', 2, 'Obi', 'Obong', 'Oba', 'Igwe', NULL, NULL, NULL, 'Oba', '', NULL),
(1479, 'kwcoetl/ap2016/0005', '2016', 'Exam', 'EDU 113', 1, 4, 'choice', '', '<p><span style="font-size: 14pt;">How many student are there all together</span></p>', 2, '50', '30', '60', '80', '70', '', NULL, '80', '60', ''),
(1480, 'kwcoetl/ap2016/0005', '2016', 'Exam', 'EDU 113', 2, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-10) * (5 - 2) = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '-30', '-30'),
(1481, 'kwcoetl/ap2016/0005', '2016', 'Exam', 'EDU 113', 3, 5, 'typeIn', '', '<p><span style=\\"font-size: 14pt;\\">Governor _____________ is the governor of kwara state</span></p>', 5, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'fatai', 'FATAI'),
(1482, 'kwcoetl/ap2016/0005', '2016', 'Exam', 'EDU 113', 4, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-8)<sup>2</sup> = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '64', '64'),
(1483, 'kwcoetl/ap2016/0005', '2016', 'Exam', 'EDU 113', 5, 4, 'choice', '', '<p><span style="font-size: 14pt;">The product of 2 and 3 is ___</span></p>', 2, '5', '6', '7', '8', '', '', NULL, '6', '6', ''),
(1484, 'kwcoetl/ap2016/0005', '2016', 'Exam', 'EDU 113', 6, 5, 'typeIn', '', '<p>Mouse is an ________ device</p>', 2, '', '', '', '', '', '', NULL, '', 'input', 'input'),
(1485, 'kwcoetl/ap2016/0005', '2016', 'Exam', 'EDU 113', 7, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">How many sides does a hexagon has ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '7', '6'),
(1486, 'kwcoetl/ap2016/0005', '2016', 'Exam', 'EDU 113', 8, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">Calculate 3<sup>2</sup> + (-4)<sup>2</sup></span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '25', '25'),
(1487, 'kwcoetl/ap2016/0005', '2016', 'Exam', 'EDU 113', 9, 4, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 2 and 3 is ____</span></p>', 5, '5', '6', '7', '8', '', '', NULL, '5', '8', ''),
(1488, 'kwcoetl/ap2016/0005', '2016', 'Exam', 'EDU 113', 10, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is the square rootof 144 ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'twelve', '12'),
(1489, 'kwcoetl/ap2016/0005', '2016', 'Exam', 'EDU 113', 11, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">28 - 9 = ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '11', '19'),
(1490, 'kwcoetl/ap2016/0005', '2016', 'Exam', 'EDU 113', 12, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is 5 to the power of 0 ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '1', '1'),
(1491, 'kwcoetl/ap2016/0005', '2016', 'Exam', 'EDU 113', 13, 5, 'choice', '', '<p><span style="font-size: 14pt;">What is the average of the students who sat for the exams</span></p>', 2, '800.333', '773.333', '73.333', '7333.33', '733.33', '', NULL, '733.33', '733.33', ''),
(1492, 'kwcoetl/ap2016/0003', '2016', 'Exam', 'EDU 113', 1, 4, 'choice', '', '<p><span style="font-size: 14pt;">The product of 2 and 3 is ___</span></p>', 2, '5', '6', '7', '8', '', '', NULL, '6', '6', ''),
(1493, 'kwcoetl/ap2016/0003', '2016', 'Exam', 'EDU 113', 2, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">____________ is an electronic machine that accepts data and process data&nbsp;</span></p>', 2, '', '', '', '', '', '', NULL, '', 'COMPUTER', 'computer'),
(1494, 'kwcoetl/ap2016/0003', '2016', 'Exam', 'EDU 113', 3, 5, 'choice', '', '<p><span style="font-size: 14pt;">What is the average of the students who sat for the exams</span></p>', 2, '800.333', '773.333', '73.333', '7333.33', '733.33', '', NULL, '733.33', '800.333', ''),
(1495, 'kwcoetl/ap2016/0003', '2016', 'Exam', 'EDU 113', 4, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">Calculate 3<sup>2</sup> + (-4)<sup>2</sup></span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '25', '25'),
(1496, 'kwcoetl/ap2016/0003', '2016', 'Exam', 'EDU 113', 5, 5, 'typeIn', '', '<p><span style=\\"font-size: 14pt;\\">Governor _____________ is the governor of kwara state</span></p>', 5, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'FATAI', 'FATAI'),
(1497, 'kwcoetl/ap2016/0003', '2016', 'Exam', 'EDU 113', 6, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-8)<sup>2</sup> = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '65', '64'),
(1498, 'kwcoetl/ap2016/0003', '2016', 'Exam', 'EDU 113', 7, 4, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 2 and 3 is ____</span></p>', 5, '5', '6', '7', '8', '', '', NULL, '5', '5', ''),
(1499, 'kwcoetl/ap2016/0003', '2016', 'Exam', 'EDU 113', 8, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is 5 to the power of 0 ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '1', '1'),
(1500, 'kwcoetl/ap2016/0003', '2016', 'Exam', 'EDU 113', 9, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">The square rootof 144 is ____</span></p>', 2, '', '', '', '', '', '', NULL, '', '13', '12'),
(1501, 'kwcoetl/ap2016/0003', '2016', 'Exam', 'EDU 113', 10, 5, 'typeIn', '', '<p>Mouse is an ________ device</p>', 2, '', '', '', '', '', '', NULL, '', 'OUTPUT', 'input'),
(1502, 'kwcoetl/ap2016/0003', '2016', 'Exam', 'EDU 113', 11, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-10) * (5 - 2) = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '30', '-30'),
(1503, 'kwcoetl/ap2016/0003', '2016', 'Exam', 'EDU 113', 12, 4, 'choice', '', '<p><span style="font-size: 14pt;">How many student are there all together</span></p>', 2, '50', '30', '60', '80', '70', '', NULL, '80', '80', ''),
(1504, 'kwcoetl/ap2016/0003', '2016', 'Exam', 'EDU 113', 13, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">How many sides does a hexagon has ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '6', '6'),
(1518, 'KWCOETL/AP2016/0006', '2016', 'TEST', 'EDU 121', 1, 4, 'choice', '', '<h2 style="color: #000000;">______ is the study of living things&nbsp;</h2>', 2, 'Ecology', 'Pathology', 'Biology', 'Ecosystem', '', '', NULL, 'Biology', 'Ecology', ''),
(1519, 'KWCOETL/AP2016/0006', '2016', 'TEST', 'EDU 121', 2, 4, 'choice', '', '<h2 style="color: #000000;">Which of these foods gives energy</h2>', 2, 'Carbohydrate', 'Protein', 'Minerals', 'Vitamins', '', '', NULL, 'Carbohydrate', 'Carbohydrate', ''),
(1520, 'KWCOETL/AP2016/0006', '2016', 'TEST', 'EDU 121', 3, 4, 'choice', '<p><span style="font-size: 14pt;">my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;</span></p>', '<h2 style="color: #000000;">______ animals chew the chord</h2>', 2, 'Domestic', 'Ruminant', 'Non ruminant', 'Ordinary', '', '', NULL, 'Ruminant', 'Ruminant', NULL),
(1521, 'KWCOETL/AP2016/0006', '2016', 'TEST', 'EDU 121', 4, 5, 'choice', '', '<h2 style="color: #000000;">Domestic animals lives in the ______</h2>', 2, 'Forest', 'Zoo', 'Bush', 'House', 'all of the above', '', NULL, 'House', 'House', NULL),
(1522, 'KWCOETL/AP2016/0006', '2016', 'TEST', 'EDU 121', 5, 4, 'choice', '', '<h2 style="color: #000000;">_____ is the smallest unit of living organism</h2>', 2, 'Atom', 'Plant', 'Cell', 'Osmosis', '', 'img_for_EDU 121_TEST_6_1458432607.jpeg', NULL, 'Cell', 'Cell', NULL),
(1523, 'KWCOETL/AP2016/0006', '2016', 'TEST', 'EDU 121', 6, 4, 'choice', '<p><span style="font-size: 14pt;">my friend, how are you now&nbsp;</span></p>', '<h2 style="color: #000000;">______ food is best good for domestic animals&nbsp;</h2>', 2, 'Cereal', 'Solid', 'Liquid', 'Herbs', '', 'img_for_EDU 121_TEST_9_1458435185.jpeg', NULL, 'Herbs', 'Cereal', ''),
(1524, 'KWCOETL/AP2016/0006', '2016', 'TEST', 'EDU 121', 7, 4, 'typeIn', '', '<h2 style="color: #000000;">it tooks _____ days for fowls to produce children</h2>', 2, '21', '28', '30', '14', '', '', NULL, '', '21', '30'),
(1525, 'KWCOETL/AP2016/0006', '2016', 'TEST', 'EDU 121', 8, 4, 'choice', '', '<p><span style="font-size: 14pt;">A sinner never quits in his journey&nbsp;</span></p>', 2, 'True', 'False', 'Lie', 'Beta', '', '', NULL, 'True', 'False', NULL),
(1526, 'KWCOETL/AP2016/0006', '2016', 'TEST', 'EDU 121', 9, 4, 'choice', '', '<h2 style="color: #000000;">Animals that lives&nbsp;in water are called _______ &nbsp;animals</h2>', 2, 'Aquatic', 'Amphibian', 'Domestic', 'Marine', '', 'img_for_EDU 121_TEST_9_1458435185.jpeg', NULL, 'Aquatic', 'Aquatic', NULL),
(1527, 'KWCOETL/AP2016/0006', '2016', 'TEST', 'EDU 121', 10, 4, 'choice', '', '<h2 style="color: #000000;">Eating healthy food gives our body&nbsp;_______</h2>', 4, 'Kwashiorkor', 'Stunted growth', 'Good health', 'None of the above', '', 'img_for_EDU 121_TEST2_1458430422.jpeg', NULL, 'Good health', 'Good health', ''),
(1528, 'kwcoetl/ap2016/0001', '2016', 'TEST', 'EDU 121', 1, 4, 'choice', '<p><span style="font-size: 14pt;">my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;</span></p>', '<h2 style="color: #000000;">______ animals chew the chord</h2>', 2, 'Domestic', 'Ruminant', 'Non ruminant', 'Ordinary', '', '', NULL, 'Ruminant', 'Ruminant', NULL),
(1529, 'kwcoetl/ap2016/0001', '2016', 'TEST', 'EDU 121', 2, 4, 'choice', '<p><span style="font-size: 14pt;">my friend, how are you now&nbsp;</span></p>', '<h2 style="color: #000000;">______ food is best good for domestic animals&nbsp;</h2>', 2, 'Cereal', 'Solid', 'Liquid', 'Herbs', '', 'img_for_EDU 121_TEST_9_1458435185.jpeg', NULL, 'Herbs', 'Herbs', ''),
(1530, 'kwcoetl/ap2016/0001', '2016', 'TEST', 'EDU 121', 3, 4, 'choice', '', '<h2 style="color: #000000;">Animals that lives&nbsp;in water are called _______ &nbsp;animals</h2>', 2, 'Aquatic', 'Amphibian', 'Domestic', 'Marine', '', 'img_for_EDU 121_TEST_9_1458435185.jpeg', NULL, 'Aquatic', 'Aquatic', NULL),
(1531, 'kwcoetl/ap2016/0001', '2016', 'TEST', 'EDU 121', 4, 4, 'choice', '', '<h2 style="color: #000000;">Eating healthy food gives our body&nbsp;_______</h2>', 4, 'Kwashiorkor', 'Stunted growth', 'Good health', 'None of the above', '', 'img_for_EDU 121_TEST2_1458430422.jpeg', NULL, 'Good health', 'Good health', ''),
(1532, 'kwcoetl/ap2016/0001', '2016', 'TEST', 'EDU 121', 5, 4, 'choice', '', '<p><span style="font-size: 14pt;">A sinner never quits in his journey&nbsp;</span></p>', 2, 'True', 'False', 'Lie', 'Beta', '', '', NULL, 'True', 'True', NULL),
(1533, 'kwcoetl/ap2016/0001', '2016', 'TEST', 'EDU 121', 6, 4, 'choice', '', '<h2 style="color: #000000;">______ is the study of living things&nbsp;</h2>', 2, 'Ecology', 'Pathology', 'Biology', 'Ecosystem', '', '', NULL, 'Biology', 'Biology', ''),
(1534, 'kwcoetl/ap2016/0001', '2016', 'TEST', 'EDU 121', 7, 5, 'choice', '', '<h2 style="color: #000000;">Domestic animals lives in the ______</h2>', 2, 'Forest', 'Zoo', 'Bush', 'House', 'all of the above', '', NULL, 'House', 'House', NULL),
(1535, 'kwcoetl/ap2016/0001', '2016', 'TEST', 'EDU 121', 8, 4, 'choice', '', '<h2 style="color: #000000;">Which of these foods gives energy</h2>', 2, 'Carbohydrate', 'Protein', 'Minerals', 'Vitamins', '', '', NULL, 'Carbohydrate', 'Carbohydrate', ''),
(1536, 'kwcoetl/ap2016/0001', '2016', 'TEST', 'EDU 121', 9, 4, 'choice', '', '<h2 style="color: #000000;">_____ is the smallest unit of living organism</h2>', 2, 'Atom', 'Plant', 'Cell', 'Osmosis', '', 'img_for_EDU 121_TEST_6_1458432607.jpeg', NULL, 'Cell', 'Cell', NULL),
(1537, 'kwcoetl/ap2016/0001', '2016', 'TEST', 'EDU 121', 10, 4, 'typeIn', '', '<h2 style="color: #000000;">it tooks _____ days for fowls to produce children</h2>', 2, '21', '28', '30', '14', '', '', NULL, '', '21', '30'),
(1538, 'KWCOETL/AP2016/0006', '2016', 'Exam', 'EDU 113', 1, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">Calculate 3<sup>2</sup> + (-4)<sup>2</sup></span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '25', '25'),
(1539, 'KWCOETL/AP2016/0006', '2016', 'Exam', 'EDU 113', 2, 4, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 2 and 3 is ____</span></p>', 5, '5', '6', '7', '8', '', '', NULL, '5', '5', ''),
(1540, 'KWCOETL/AP2016/0006', '2016', 'Exam', 'EDU 113', 3, 4, 'choice', '', '<p><span style="font-size: 14pt;">how many days are there in the month of November</span></p>', 2, '29', '30', '31', '28', '70', '', NULL, '30', '30', ''),
(1541, 'KWCOETL/AP2016/0006', '2016', 'Exam', 'EDU 113', 4, 5, 'choice', '', '<p><span style="font-size: 14pt;">in the year 2004, 200&nbsp;students sats for exam, in the year 2005, it was 300, while in the year 2006, total was 250,&nbsp;w</span><span style="font-size: 14pt;">hat is the average of the students who sat for the exams</span></p>', 2, '750', '300', '250', '500', '200', '', NULL, '250', '750', ''),
(1542, 'KWCOETL/AP2016/0006', '2016', 'Exam', 'EDU 113', 5, 5, 'typeIn', '', '<p><span style=\\"font-size: 14pt;\\">Governor _____________ is the governor of kwara state</span></p>', 5, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'abdulfatai', 'FATAI'),
(1543, 'KWCOETL/AP2016/0006', '2016', 'Exam', 'EDU 113', 6, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-8)<sup>2</sup> = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '16', '64'),
(1544, 'KWCOETL/AP2016/0006', '2016', 'Exam', 'EDU 113', 7, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">____________ is an electronic machine that accepts data and process data&nbsp;</span></p>', 2, '', '', '', '', '', '', NULL, '', 'computer', 'computer'),
(1545, 'KWCOETL/AP2016/0006', '2016', 'Exam', 'EDU 113', 8, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-10) * (5 - 2) = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '13', '-30'),
(1546, 'KWCOETL/AP2016/0006', '2016', 'Exam', 'EDU 113', 9, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is 5 to the power of 0 ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '1'),
(1547, 'KWCOETL/AP2016/0006', '2016', 'Exam', 'EDU 113', 10, 4, 'choice', '', '<p><span style="font-size: 14pt;">The product of 2 and 3 is ___</span></p>', 2, '5', '6', '7', '8', '', '', NULL, '6', '', ''),
(1548, 'KWCOETL/AP2016/0006', '2016', 'Exam', 'EDU 113', 11, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">How many sides does a hexagon has ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '6'),
(1549, 'KWCOETL/AP2016/0006', '2016', 'Exam', 'EDU 113', 12, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">The square rootof 144 is ____</span></p>', 2, '', '', '', '', '', '', NULL, '', '', '12'),
(1562, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'EDU 113', 1, 5, 'typeIn', '', '<p><span style="font-size: 14pt;">Mouse is an ________ device in computer</span></p>', 2, '', '', '', '', '', '', NULL, '', 'output', 'input'),
(1563, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'EDU 113', 2, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">Calculate 3<sup>2</sup> + (-4)<sup>2</sup></span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '25', '25'),
(1564, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'EDU 113', 3, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">____________ is an electronic machine that accepts data and process data&nbsp;</span></p>', 2, '', '', '', '', '', '', NULL, '', 'computer', 'computer'),
(1565, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'EDU 113', 4, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-8)<sup>2</sup> = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '64', '64'),
(1566, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'EDU 113', 5, 5, 'typeIn', '', '<p><span style=\\"font-size: 14pt;\\">Governor _____________ is the governor of kwara state</span></p>', 5, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'abdulfatai', 'FATAI'),
(1567, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'EDU 113', 6, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">How many sides does a hexagon has ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '6', '6'),
(1568, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'EDU 113', 7, 5, 'choice', '', '<p><span style="font-size: 14pt;">in the year 2004, 200&nbsp;students sats for exam, in the year 2005, it was 300, while in the year 2006, total was 250,&nbsp;w</span><span style="font-size: 14pt;">hat is the average of the students who sat for the exams</span></p>', 2, '750', '300', '250', '500', '200', '', NULL, '250', '750', ''),
(1569, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'EDU 113', 8, 4, 'choice', '', '<p><span style="font-size: 14pt;">how many days are there in the month of November</span></p>', 2, '29', '30', '31', '28', '70', '', NULL, '30', '30', ''),
(1570, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'EDU 113', 9, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">The square rootof 144 is ____</span></p>', 2, '', '', '', '', '', '', NULL, '', '12', '12'),
(1571, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'EDU 113', 10, 4, 'choice', '', '<p><span style="font-size: 14pt;">The product of 2 and 3 is ___</span></p>', 2, '5', '6', '7', '8', '', '', NULL, '6', '5', ''),
(1572, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'EDU 113', 11, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is 5 to the power of 0 ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '5degree', '1'),
(1573, 'kwcoetl/ap2016/0001', '2016', 'Exam', 'EDU 113', 12, 4, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 2 and 3 is ____</span></p>', 5, '5', '6', '7', '8', '', '', NULL, '5', '5', ''),
(1586, '56149087CJ ', '2016', 'Exam', 'EDU 113', 1, 5, 'typeIn', '', '<p><span style="font-size: 14pt;">Mouse is an ________ device in computer</span></p>', 2, '', '', '', '', '', '', NULL, '', 'output', 'input'),
(1587, '56149087CJ ', '2016', 'Exam', 'EDU 113', 2, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">The square rootof 144 is ____</span></p>', 2, '', '', '', '', '', '', NULL, '', '12', '12'),
(1588, '56149087CJ ', '2016', 'Exam', 'EDU 113', 3, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-10) * (5 - 2) = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '30', '-30'),
(1589, '56149087CJ ', '2016', 'Exam', 'EDU 113', 4, 5, 'typeIn', '', '<p>Governor _____________ is the governor of kwara state</p>', 2, '', '', '', '', '', '', NULL, '', 'abdulfatai ahmed magida', 'abdulfatai'),
(1590, '56149087CJ ', '2016', 'Exam', 'EDU 113', 5, 4, 'choice', '', '<p><span style="font-size: 14pt;">The product of 2 and 3 is ___</span></p>', 2, '5', '6', '7', '8', '', '', NULL, '6', '6', ''),
(1591, '56149087CJ ', '2016', 'Exam', 'EDU 113', 6, 4, 'choice', '', '<p><span style="font-size: 14pt;">how many days are there in the month of November</span></p>', 2, '29', '30', '31', '28', '70', '', NULL, '30', '31', ''),
(1592, '56149087CJ ', '2016', 'Exam', 'EDU 113', 7, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">____________ is an electronic machine that accepts data and process data&nbsp;</span></p>', 2, '', '', '', '', '', '', NULL, '', 'computer', 'computer');
INSERT INTO `qtn_remind` (`sn`, `user_id`, `year`, `qtype`, `code`, `num`, `tot_option`, `optiontype`, `passage`, `question`, `marks`, `option1`, `option2`, `option3`, `option4`, `option5`, `image1`, `image2`, `answer`, `picked1`, `typeAns`) VALUES
(1593, '56149087CJ ', '2016', 'Exam', 'EDU 113', 8, 5, 'choice', '', '<p><span style="font-size: 14pt;">in the year 2004, 200&nbsp;students sats for exam, in the year 2005, it was 300, while in the year 2006, total was 250,&nbsp;w</span><span style="font-size: 14pt;">hat is the average of the students who sat for the exams</span></p>', 2, '750', '300', '250', '500', '200', '', NULL, '250', '250', ''),
(1594, '56149087CJ ', '2016', 'Exam', 'EDU 113', 9, 4, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 2 and 3 is ____</span></p>', 5, '5', '6', '7', '8', '', '', NULL, '5', '6', ''),
(1595, '56149087CJ ', '2016', 'Exam', 'EDU 113', 10, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-8)<sup>2</sup> = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '16', '64'),
(1596, '56149087CJ ', '2016', 'Exam', 'EDU 113', 11, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">Calculate 3<sup>2</sup> + (-4)<sup>2</sup></span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '25', '25'),
(1597, '56149087CJ ', '2016', 'Exam', 'EDU 113', 12, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is 5 to the power of 0 ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '1'),
(1610, '56299321IG', '2016', 'Exam', 'EDU 113', 1, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">____________ is an electronic machine that accepts data and process data&nbsp;</span></p>', 2, '', '', '', '', '', '', NULL, '', 'computer', 'computer'),
(1611, '56299321IG', '2016', 'Exam', 'EDU 113', 2, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-8)<sup>2</sup> = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '64', '64'),
(1612, '56299321IG', '2016', 'Exam', 'EDU 113', 3, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-10) * (5 - 2) = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '30', '-30'),
(1613, '56299321IG', '2016', 'Exam', 'EDU 113', 4, 5, 'typeIn', '', '<p>Governor _____________ is the governor of kwara state</p>', 2, '', '', '', '', '', '', NULL, '', 'abdulfatai', 'abdulfatai'),
(1614, '56299321IG', '2016', 'Exam', 'EDU 113', 5, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is 5 to the power of 0 ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '1', '1'),
(1615, '56299321IG', '2016', 'Exam', 'EDU 113', 6, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">How many sides does a hexagon has ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '6', '6'),
(1616, '56299321IG', '2016', 'Exam', 'EDU 113', 7, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">The square rootof 144 is ____</span></p>', 2, '', '', '', '', '', '', NULL, '', '12', '12'),
(1617, '56299321IG', '2016', 'Exam', 'EDU 113', 8, 5, 'typeIn', '', '<p><span style="font-size: 14pt;">Mouse is an ________ device in computer</span></p>', 2, '', '', '', '', '', '', NULL, '', 'inout', 'input'),
(1618, '56299321IG', '2016', 'Exam', 'EDU 113', 9, 5, 'choice', '', '<p><span style="font-size: 14pt;">in the year 2004, 200&nbsp;students sats for exam, in the year 2005, it was 300, while in the year 2006, total was 250,&nbsp;w</span><span style="font-size: 14pt;">hat is the average of the students who sat for the exams</span></p>', 2, '750', '300', '250', '500', '200', '', NULL, '250', '250', ''),
(1619, '56299321IG', '2016', 'Exam', 'EDU 113', 10, 4, 'choice', '', '<p><span style="font-size: 14pt;">how many days are there in the month of November</span></p>', 2, '29', '30', '31', '28', '70', '', NULL, '30', '30', ''),
(1620, '56299321IG', '2016', 'Exam', 'EDU 113', 11, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">Calculate 3<sup>2</sup> + (-4)<sup>2</sup></span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '25', '25'),
(1621, '56299321IG', '2016', 'Exam', 'EDU 113', 12, 4, 'choice', '', '<p><span style="font-size: 14pt;">The product of 2 and 3 is ___</span></p>', 2, '5', '6', '7', '8', '', '', NULL, '6', '', ''),
(1622, 'KWCOETL/AP2016/0003', '2016', 'Exam', 'EDU 113', 1, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-8)<sup>2</sup> = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '6', '64'),
(1623, 'KWCOETL/AP2016/0003', '2016', 'Exam', 'EDU 113', 2, 4, 'choice', '', '<p><span style="font-size: 14pt;">The product of 2 and 3 is ___</span></p>', 2, '5', '6', '7', '8', '', '', NULL, '6', 'COMPUTER', ''),
(1624, 'KWCOETL/AP2016/0003', '2016', 'Exam', 'EDU 113', 3, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is 5 to the power of 0 ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '800.333', '1'),
(1625, 'KWCOETL/AP2016/0003', '2016', 'Exam', 'EDU 113', 4, 4, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 2 and 3 is ____</span></p>', 5, '5', '6', '7', '8', '', '', NULL, '5', '25', ''),
(1626, 'KWCOETL/AP2016/0003', '2016', 'Exam', 'EDU 113', 5, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">How many sides does a hexagon has ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'FATAI', '6'),
(1627, 'KWCOETL/AP2016/0003', '2016', 'Exam', 'EDU 113', 6, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-10) * (5 - 2) = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '65', '-30'),
(1628, 'KWCOETL/AP2016/0003', '2016', 'Exam', 'EDU 113', 7, 4, 'choice', '', '<p><span style="font-size: 14pt;">how many days are there in the month of November</span></p>', 2, '29', '30', '31', '28', '70', '', NULL, '30', '5', ''),
(1629, 'KWCOETL/AP2016/0003', '2016', 'Exam', 'EDU 113', 8, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">Calculate 3<sup>2</sup> + (-4)<sup>2</sup></span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '1', '25'),
(1630, 'KWCOETL/AP2016/0003', '2016', 'Exam', 'EDU 113', 9, 5, 'typeIn', '', '<p>Governor _____________ is the governor of kwara state</p>', 2, '', '', '', '', '', '', NULL, '', '13', 'abdulfatai'),
(1631, 'KWCOETL/AP2016/0003', '2016', 'Exam', 'EDU 113', 10, 5, 'typeIn', '', '<p><span style="font-size: 14pt;">Mouse is an ________ device in computer</span></p>', 2, '', '', '', '', '', '', NULL, '', 'OUTPUT', 'input'),
(1632, 'KWCOETL/AP2016/0003', '2016', 'Exam', 'EDU 113', 11, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">____________ is an electronic machine that accepts data and process data&nbsp;</span></p>', 2, '', '', '', '', '', '', NULL, '', '30', 'computer'),
(1633, 'KWCOETL/AP2016/0003', '2016', 'Exam', 'EDU 113', 12, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">The square rootof 144 is ____</span></p>', 2, '', '', '', '', '', '', NULL, '', '80', '12'),
(1634, 'KWCOETL/AP2016/0002', '2016', 'Exam', 'EDU 113', 1, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-10) * (5 - 2) = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '-30', '-30'),
(1635, 'KWCOETL/AP2016/0002', '2016', 'Exam', 'EDU 113', 2, 4, 'choice', '', '<p><span style="font-size: 14pt;">how many days are there in the month of November</span></p>', 2, '29', '30', '31', '28', '70', '', NULL, '30', '30', ''),
(1636, 'KWCOETL/AP2016/0002', '2016', 'Exam', 'EDU 113', 3, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">____________ is an electronic machine that accepts data and process data&nbsp;</span></p>', 2, '', '', '', '', '', '', NULL, '', 'computer', 'computer'),
(1637, 'KWCOETL/AP2016/0002', '2016', 'Exam', 'EDU 113', 4, 5, 'typeIn', '', '<p>Governor _____________ is the governor of kwara state</p>', 2, '', '', '', '', '', '', NULL, '', 'fatai', 'abdulfatai'),
(1638, 'KWCOETL/AP2016/0002', '2016', 'Exam', 'EDU 113', 5, 4, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 2 and 3 is ____</span></p>', 5, '5', '6', '7', '8', '', '', NULL, '5', '5', ''),
(1639, 'KWCOETL/AP2016/0002', '2016', 'Exam', 'EDU 113', 6, 4, 'choice', '', '<p><span style="font-size: 14pt;">The product of 2 and 3 is ___</span></p>', 2, '5', '6', '7', '8', '', '', NULL, '6', '6', ''),
(1640, 'KWCOETL/AP2016/0002', '2016', 'Exam', 'EDU 113', 7, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">Calculate 3<sup>2</sup> + (-4)<sup>2</sup></span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '25', '25'),
(1641, 'KWCOETL/AP2016/0002', '2016', 'Exam', 'EDU 113', 8, 5, 'choice', '', '<p><span style="font-size: 14pt;">in the year 2004, 200&nbsp;students sats for exam, in the year 2005, it was 300, while in the year 2006, total was 250,&nbsp;w</span><span style="font-size: 14pt;">hat is the average of the students who sat for the exams</span></p>', 2, '750', '300', '250', '500', '200', '', NULL, '250', '300', ''),
(1642, 'KWCOETL/AP2016/0002', '2016', 'Exam', 'EDU 113', 9, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-8)<sup>2</sup> = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '64', '64'),
(1643, 'KWCOETL/AP2016/0002', '2016', 'Exam', 'EDU 113', 10, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">The square rootof 144 is ____</span></p>', 2, '', '', '', '', '', '', NULL, '', '12', '12'),
(1644, 'KWCOETL/AP2016/0002', '2016', 'Exam', 'EDU 113', 11, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is 5 to the power of 0 ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '1', '1'),
(1645, 'KWCOETL/AP2016/0002', '2016', 'Exam', 'EDU 113', 12, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">How many sides does a hexagon has ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '6', '6'),
(1646, 'KWCOETL/AP2016/0005', '2016', 'Exam', 'EDU 113', 1, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is 5 to the power of 0 ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '60', '1'),
(1647, 'KWCOETL/AP2016/0005', '2016', 'Exam', 'EDU 113', 2, 4, 'choice', '', '<p><span style="font-size: 14pt;">how many days are there in the month of November</span></p>', 2, '29', '30', '31', '28', '70', '', NULL, '30', '-30', ''),
(1648, 'KWCOETL/AP2016/0005', '2016', 'Exam', 'EDU 113', 3, 4, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 2 and 3 is ____</span></p>', 5, '5', '6', '7', '8', '', '', NULL, '5', 'fatai', ''),
(1649, 'KWCOETL/AP2016/0005', '2016', 'Exam', 'EDU 113', 4, 5, 'choice', '', '<p><span style="font-size: 14pt;">in the year 2004, 200&nbsp;students sats for exam, in the year 2005, it was 300, while in the year 2006, total was 250,&nbsp;w</span><span style="font-size: 14pt;">hat is the average of the students who sat for the exams</span></p>', 2, '750', '300', '250', '500', '200', '', NULL, '250', '64', ''),
(1650, 'KWCOETL/AP2016/0005', '2016', 'Exam', 'EDU 113', 5, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">Calculate 3<sup>2</sup> + (-4)<sup>2</sup></span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '6', '25'),
(1651, 'KWCOETL/AP2016/0005', '2016', 'Exam', 'EDU 113', 6, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-10) * (5 - 2) = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'input', '-30'),
(1652, 'KWCOETL/AP2016/0005', '2016', 'Exam', 'EDU 113', 7, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">The square rootof 144 is ____</span></p>', 2, '', '', '', '', '', '', NULL, '', '7', '12'),
(1653, 'KWCOETL/AP2016/0005', '2016', 'Exam', 'EDU 113', 8, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">____________ is an electronic machine that accepts data and process data&nbsp;</span></p>', 2, '', '', '', '', '', '', NULL, '', '25', 'computer'),
(1654, 'KWCOETL/AP2016/0005', '2016', 'Exam', 'EDU 113', 9, 5, 'typeIn', '', '<p><span style="font-size: 14pt;">Mouse is an ________ device in computer</span></p>', 2, '', '', '', '', '', '', NULL, '', '8', 'input'),
(1655, 'KWCOETL/AP2016/0005', '2016', 'Exam', 'EDU 113', 10, 5, 'typeIn', '', '<p>Governor _____________ is the governor of kwara state</p>', 2, '', '', '', '', '', '', NULL, '', 'twelve', 'abdulfatai'),
(1656, 'KWCOETL/AP2016/0005', '2016', 'Exam', 'EDU 113', 11, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">How many sides does a hexagon has ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '11', '6'),
(1657, 'KWCOETL/AP2016/0005', '2016', 'Exam', 'EDU 113', 12, 4, 'choice', '', '<p><span style="font-size: 14pt;">The product of 2 and 3 is ___</span></p>', 2, '5', '6', '7', '8', '', '', NULL, '6', '1', ''),
(1658, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 1, 5, 'typeIn', '', '<p><span style="font-size: 14pt;">Mouse is an ________ device in computer</span></p>', 2, '', '', '', '', '', '', NULL, '', '12', 'input'),
(1659, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 2, 4, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 2 and 3 is ____</span></p>', 5, '5', '6', '7', '8', '', '', NULL, '5', '-30', ''),
(1660, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 3, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">Calculate 3<sup>2</sup> + (-4)<sup>2</sup></span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '25', '25'),
(1661, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 4, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-10) * (5 - 2) = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '1', '-30'),
(1662, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 5, 4, 'choice', '', '<p><span style="font-size: 14pt;">The product of 2 and 3 is ___</span></p>', 2, '5', '6', '7', '8', '', '', NULL, '6', '6', ''),
(1663, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 6, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">____________ is an electronic machine that accepts data and process data&nbsp;</span></p>', 2, '', '', '', '', '', '', NULL, '', '6', 'computer'),
(1664, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 7, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is 5 to the power of 0 ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '5', '1'),
(1665, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 8, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-8)<sup>2</sup> = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '30', '64'),
(1666, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 9, 5, 'choice', '', '<p><span style="font-size: 14pt;">in the year 2004, 200&nbsp;students sats for exam, in the year 2005, it was 300, while in the year 2006, total was 250,&nbsp;w</span><span style="font-size: 14pt;">hat is the average of the students who sat for the exams</span></p>', 2, '750', '300', '250', '500', '200', '', NULL, '250', '773.333', ''),
(1667, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 10, 4, 'choice', '', '<p><span style="font-size: 14pt;">how many days are there in the month of November</span></p>', 2, '29', '30', '31', '28', '70', '', NULL, '30', '64', ''),
(1668, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 11, 5, 'typeIn', '', '<p>Governor _____________ is the governor of kwara state</p>', 2, '', '', '', '', '', '', NULL, '', '105', 'abdulfatai'),
(1669, 'kwcoetl/ap2016/0007', '2016', 'Exam', 'EDU 113', 12, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">How many sides does a hexagon has ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '19', '6'),
(1670, 'KWCOETL/AP2016/0009', '2016', 'Exam', 'EDU 113', 1, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">The square rootof 144 is ____</span></p>', 2, '', '', '', '', '', '', NULL, '', '6', '12'),
(1671, 'KWCOETL/AP2016/0009', '2016', 'Exam', 'EDU 113', 2, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">____________ is an electronic machine that accepts data and process data&nbsp;</span></p>', 2, '', '', '', '', '', '', NULL, '', '5', 'computer'),
(1672, 'KWCOETL/AP2016/0009', '2016', 'Exam', 'EDU 113', 3, 5, 'typeIn', '', '<p><span style="font-size: 14pt;">Mouse is an ________ device in computer</span></p>', 2, '', '', '', '', '', '', NULL, '', '105', 'input'),
(1673, 'KWCOETL/AP2016/0009', '2016', 'Exam', 'EDU 113', 4, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">How many sides does a hexagon has ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '30', '6'),
(1674, 'KWCOETL/AP2016/0009', '2016', 'Exam', 'EDU 113', 5, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-8)<sup>2</sup> = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '7333.33', '64'),
(1675, 'KWCOETL/AP2016/0009', '2016', 'Exam', 'EDU 113', 6, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-10) * (5 - 2) = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '6', '-30'),
(1676, 'KWCOETL/AP2016/0009', '2016', 'Exam', 'EDU 113', 7, 5, 'typeIn', '', '<p>Governor _____________ is the governor of kwara state</p>', 2, '', '', '', '', '', '', NULL, '', '5', 'abdulfatai'),
(1677, 'KWCOETL/AP2016/0009', '2016', 'Exam', 'EDU 113', 8, 5, 'choice', '', '<p><span style="font-size: 14pt;">in the year 2004, 200&nbsp;students sats for exam, in the year 2005, it was 300, while in the year 2006, total was 250,&nbsp;w</span><span style="font-size: 14pt;">hat is the average of the students who sat for the exams</span></p>', 2, '750', '300', '250', '500', '200', '', NULL, '250', '105', ''),
(1678, 'KWCOETL/AP2016/0009', '2016', 'Exam', 'EDU 113', 9, 4, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 2 and 3 is ____</span></p>', 5, '5', '6', '7', '8', '', '', NULL, '5', '30', ''),
(1679, 'KWCOETL/AP2016/0009', '2016', 'Exam', 'EDU 113', 10, 4, 'choice', '', '<p><span style="font-size: 14pt;">The product of 2 and 3 is ___</span></p>', 2, '5', '6', '7', '8', '', '', NULL, '6', '7333.33', ''),
(1680, 'KWCOETL/AP2016/0009', '2016', 'Exam', 'EDU 113', 11, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is 5 to the power of 0 ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '1'),
(1681, 'KWCOETL/AP2016/0009', '2016', 'Exam', 'EDU 113', 12, 4, 'choice', '', '<p><span style="font-size: 14pt;">how many days are there in the month of November</span></p>', 2, '29', '30', '31', '28', '70', '', NULL, '30', '', ''),
(1682, 'KWCOETL/AP2016/0011', '2016', 'Exam', 'EDU 113', 1, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-10) * (5 - 2) = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '30', '-30'),
(1683, 'KWCOETL/AP2016/0011', '2016', 'Exam', 'EDU 113', 2, 5, 'typeIn', '', '<p><span style="font-size: 14pt;">Mouse is an ________ device in computer</span></p>', 2, '', '', '', '', '', '', NULL, '', 'input', 'input'),
(1684, 'KWCOETL/AP2016/0011', '2016', 'Exam', 'EDU 113', 3, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-8)<sup>2</sup> = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '64', '64'),
(1685, 'KWCOETL/AP2016/0011', '2016', 'Exam', 'EDU 113', 4, 4, 'choice', '', '<p><span style="font-size: 14pt;">The product of 2 and 3 is ___</span></p>', 2, '5', '6', '7', '8', '', '', NULL, '6', '6', ''),
(1686, 'KWCOETL/AP2016/0011', '2016', 'Exam', 'EDU 113', 5, 4, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 2 and 3 is ____</span></p>', 5, '5', '6', '7', '8', '', '', NULL, '5', '5', ''),
(1687, 'KWCOETL/AP2016/0011', '2016', 'Exam', 'EDU 113', 6, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">Calculate 3<sup>2</sup> + (-4)<sup>2</sup></span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '25', '25'),
(1688, 'KWCOETL/AP2016/0011', '2016', 'Exam', 'EDU 113', 7, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">How many sides does a hexagon has ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '6', '6'),
(1689, 'KWCOETL/AP2016/0011', '2016', 'Exam', 'EDU 113', 8, 5, 'typeIn', '', '<p>Governor _____________ is the governor of kwara state</p>', 2, '', '', '', '', '', '', NULL, '', 'ahmed', 'abdulfatai'),
(1690, 'KWCOETL/AP2016/0011', '2016', 'Exam', 'EDU 113', 9, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is 5 to the power of 0 ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '1', '1'),
(1691, 'KWCOETL/AP2016/0011', '2016', 'Exam', 'EDU 113', 10, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">The square rootof 144 is ____</span></p>', 2, '', '', '', '', '', '', NULL, '', '12', '12'),
(1692, 'KWCOETL/AP2016/0011', '2016', 'Exam', 'EDU 113', 11, 5, 'choice', '', '<p><span style="font-size: 14pt;">in the year 2004, 200&nbsp;students sats for exam, in the year 2005, it was 300, while in the year 2006, total was 250,&nbsp;w</span><span style="font-size: 14pt;">hat is the average of the students who sat for the exams</span></p>', 2, '750', '300', '250', '500', '200', '', NULL, '250', '250', ''),
(1693, 'KWCOETL/AP2016/0011', '2016', 'Exam', 'EDU 113', 12, 4, 'choice', '', '<p><span style="font-size: 14pt;">how many days are there in the month of November</span></p>', 2, '29', '30', '31', '28', '70', '', NULL, '30', '29', ''),
(1694, 'KWCOETL/AP2016/0010', '2016', 'Exam', 'EDU 113', 1, 4, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 2 and 3 is ____</span></p>', 5, '5', '6', '7', '8', '', '', NULL, '5', '5', ''),
(1695, 'KWCOETL/AP2016/0010', '2016', 'Exam', 'EDU 113', 2, 4, 'choice', '', '<p><span style="font-size: 14pt;">The product of 2 and 3 is ___</span></p>', 2, '5', '6', '7', '8', '', '', NULL, '6', '6', ''),
(1696, 'KWCOETL/AP2016/0010', '2016', 'Exam', 'EDU 113', 3, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is 5 to the power of 0 ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '1', '1'),
(1697, 'KWCOETL/AP2016/0010', '2016', 'Exam', 'EDU 113', 4, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">How many sides does a hexagon has ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '6', '6'),
(1698, 'KWCOETL/AP2016/0010', '2016', 'Exam', 'EDU 113', 5, 5, 'typeIn', '', '<p><span style="font-size: 14pt;">Mouse is an ________ device in computer</span></p>', 2, '', '', '', '', '', '', NULL, '', 'input', 'input'),
(1699, 'KWCOETL/AP2016/0010', '2016', 'Exam', 'EDU 113', 6, 4, 'choice', '', '<p><span style="font-size: 14pt;">how many days are there in the month of November</span></p>', 2, '29', '30', '31', '28', '70', '', NULL, '30', '30', ''),
(1700, 'KWCOETL/AP2016/0010', '2016', 'Exam', 'EDU 113', 7, 5, 'typeIn', '', '<p>Governor _____________ is the governor of kwara state</p>', 2, '', '', '', '', '', '', NULL, '', 'fatai', 'abdulfatai'),
(1701, 'KWCOETL/AP2016/0010', '2016', 'Exam', 'EDU 113', 8, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-10) * (5 - 2) = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '-30', '-30'),
(1702, 'KWCOETL/AP2016/0010', '2016', 'Exam', 'EDU 113', 9, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">Calculate 3<sup>2</sup> + (-4)<sup>2</sup></span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '25', '25'),
(1703, 'KWCOETL/AP2016/0010', '2016', 'Exam', 'EDU 113', 10, 5, 'choice', '', '<p><span style="font-size: 14pt;">in the year 2004, 200&nbsp;students sats for exam, in the year 2005, it was 300, while in the year 2006, total was 250,&nbsp;w</span><span style="font-size: 14pt;">hat is the average of the students who sat for the exams</span></p>', 2, '750', '300', '250', '500', '200', '', NULL, '250', '300', ''),
(1704, 'KWCOETL/AP2016/0010', '2016', 'Exam', 'EDU 113', 11, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">____________ is an electronic machine that accepts data and process data&nbsp;</span></p>', 2, '', '', '', '', '', '', NULL, '', 'computer', 'computer'),
(1705, 'KWCOETL/AP2016/0010', '2016', 'Exam', 'EDU 113', 12, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">The square rootof 144 is ____</span></p>', 2, '', '', '', '', '', '', NULL, '', '12', '12'),
(1706, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 1, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-8)<sup>2</sup> = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '105', '64'),
(1707, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 2, 5, 'choice', '', '<p><span style="font-size: 14pt;">in the year 2004, 200&nbsp;students sats for exam, in the year 2005, it was 300, while in the year 2006, total was 250,&nbsp;w</span><span style="font-size: 14pt;">hat is the average of the students who sat for the exams</span></p>', 2, '750', '300', '250', '500', '200', '', NULL, '250', '19', ''),
(1708, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 3, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">The square rootof 144 is ____</span></p>', 2, '', '', '', '', '', '', NULL, '', '7333.33', '12'),
(1709, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 4, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">Calculate 3<sup>2</sup> + (-4)<sup>2</sup></span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '7', '25'),
(1710, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 5, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">____________ is an electronic machine that accepts data and process data&nbsp;</span></p>', 2, '', '', '', '', '', '', NULL, '', '12', 'computer'),
(1711, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 6, 5, 'typeIn', '', '<p>Governor _____________ is the governor of kwara state</p>', 2, '', '', '', '', '', '', NULL, '', '60', 'abdulfatai'),
(1712, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 7, 4, 'choice', '', '<p><span style="font-size: 14pt;">The product of 2 and 3 is ___</span></p>', 2, '5', '6', '7', '8', '', '', NULL, '6', '25', ''),
(1713, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 8, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">How many sides does a hexagon has ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '8', '6'),
(1714, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 9, 4, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 2 and 3 is ____</span></p>', 5, '5', '6', '7', '8', '', '', NULL, '5', '10', ''),
(1715, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 10, 4, 'choice', '', '<p><span style="font-size: 14pt;">how many days are there in the month of November</span></p>', 2, '29', '30', '31', '28', '70', '', NULL, '30', '1', ''),
(1716, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 11, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is 5 to the power of 0 ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '64', '1'),
(1717, 'KWCOETL/AP2016/0008', '2016', 'Exam', 'EDU 113', 12, 5, 'typeIn', '', '<p><span style="font-size: 14pt;">Mouse is an ________ device in computer</span></p>', 2, '', '', '', '', '', '', NULL, '', '6', 'input'),
(1718, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 1, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-10) * (5 - 2) = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '6', '-30'),
(1719, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 2, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">Calculate 3<sup>2</sup> + (-4)<sup>2</sup></span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '19', '25'),
(1720, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 3, 5, 'typeIn', '', '<p><span style="font-size: 14pt;">Mouse is an ________ device in computer</span></p>', 2, '', '', '', '', '', '', NULL, '', '25', 'input'),
(1721, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 4, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">How many sides does a hexagon has ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '6', '6'),
(1722, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 5, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">The square rootof 144 is ____</span></p>', 2, '', '', '', '', '', '', NULL, '', '1', '12'),
(1723, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 6, 4, 'choice', '', '<p><span style="font-size: 14pt;">The sum of 2 and 3 is ____</span></p>', 5, '5', '6', '7', '8', '', '', NULL, '5', '12', ''),
(1724, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 7, 4, 'choice', '', '<p><span style="font-size: 14pt;">how many days are there in the month of November</span></p>', 2, '29', '30', '31', '28', '70', '', NULL, '30', '60', ''),
(1725, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 8, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">What is 5 to the power of 0 ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '-30', '1'),
(1726, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 9, 5, 'choice', '', '<p><span style="font-size: 14pt;">in the year 2004, 200&nbsp;students sats for exam, in the year 2005, it was 300, while in the year 2006, total was 250,&nbsp;w</span><span style="font-size: 14pt;">hat is the average of the students who sat for the exams</span></p>', 2, '750', '300', '250', '500', '200', '', NULL, '250', '64', ''),
(1727, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 10, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">(-8)<sup>2</sup> = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '5', '64'),
(1728, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 11, 4, 'choice', '', '<p><span style="font-size: 14pt;">The product of 2 and 3 is ___</span></p>', 2, '5', '6', '7', '8', '', '', NULL, '6', '733.33', ''),
(1729, 'KWCOETL/AP2016/0004', '2016', 'Exam', 'EDU 113', 12, 3, 'typeIn', '', '<p><span style="font-size: 14pt;">____________ is an electronic machine that accepts data and process data&nbsp;</span></p>', 2, '', '', '', '', '', '', NULL, '', '105', 'computer');

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

INSERT INTO `questions` (`sn`, `code`, `year`, `level`, `qtype`, `tot_option`, `optiontype`, `num`, `passage`, `question`, `marks`, `option1`, `option2`, `option3`, `option4`, `option5`, `answer`, `typeAns`, `image1`, `image2`, `recordtime`, `recorddate`, `updatetime`, `dateupdated`, `createdby`, `updatedby`) VALUES
(257, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 1, NULL, 'A labourer is paid N5,400:00k per month. What is his total salary in 1 3/4years?', 2, 'N113,40:00', 'N64,800:00', 'N97,200:00', 'N129,600:00', NULL, 'N113,40:00', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(258, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 2, NULL, 'Which of the following will sink when placed on water?', 2, 'Ball', 'Plastic Cup', 'Balloon', 'Eraser', NULL, 'Eraser', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(259, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 3, NULL, 'The following  are domestic birds except', 2, 'Duck', 'Pigeon', 'Turkey', 'Vulture', NULL, 'Vulture', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(260, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 4, NULL, 'A boy buys a biscuit for N4 and sells it at a profit of 20%. Find the actual price and the selling price?', 2, 'i =N1.00k, ii = N5.00k', 'i = 60k,      ii = N4.40k', 'i = 80k, ii = N4.80k', 'i = 50k,      ii = N4.50k', NULL, 'i = 80k, ii = N4.80k', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(261, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 5, NULL, 'A man buys recharge card for N500. He sells it for N430. What is the percentage loss?', 2, '0.07', '0.09', '0.14', '0.2', NULL, '0.14', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(262, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 6, NULL, 'The title of the traditional ruler of Benin is called................................', 2, 'Obi', 'Obong', 'Oba', 'Igwe', NULL, 'Oba', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(263, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 7, NULL, 'Which of these is not a method of preventing iron from rusting?', 2, 'Lubrication ', 'Galvanization', 'Melting', 'Painting', NULL, 'Melting', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(264, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 8, NULL, 'Which of the following is not a rainbow colour?', 2, 'Indigo ', 'Purple ', 'Orange', 'Green', NULL, 'Purple ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(265, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 9, NULL, 'A person who flies an aircraft is called..........................', 2, 'A captain', 'A craftologist', 'A pilot', 'An aeronautics engineer', NULL, 'A pilot', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(266, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 10, NULL, 'Kwame Nkrumah Museum is located in..................................', 2, 'Tanzania ', 'Kenya', 'Mauritania', 'Ghana', NULL, 'Ghana', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(267, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 11, NULL, 'An example of confluence town in Nigeria is...................................', 2, 'Onitsha ', 'Obudu ', 'Lokoja', 'PortHarcout', NULL, 'Lokoja', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(268, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 12, NULL, 'A trained person that specializes in the treatment of diseases and disorders of the teeth is called................', 2, 'Cardiologist', 'Dermatologist', 'Physician', 'Dentist', NULL, 'Dentist', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(269, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 13, NULL, 'A bricklayer is Paid N1000:00k for 5days work. What is his pay for 22days work?', 2, 'N22,000:00k', 'N50,000:00k', 'N4,400:00k', 'N5,000:00k', NULL, 'N4,400:00k', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(270, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 14, NULL, 'In parliamentary system of government, members of the parliament are required to report the proceedings of the house to their..............................', 2, 'Local government chairman and governors', 'Constituencies', 'Political parties and party  stalwarts', 'Traditional rulers', NULL, 'Constituencies', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(271, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 15, NULL, 'One essential duty of a citizen to his/her state is to...........................', 2, 'Vote and support the government in power', 'Recite the national anthem and the pledge', 'Pay his tax', 'Encourage other citizens to be loyal', NULL, 'Pay his tax', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(272, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 16, NULL, 'Under whose regime were Delta and Adamawa States created?', 2, 'Gen Sanni Abacha', 'Gen yakubu Gowon', 'Gen Murtala Muhammed', 'Gen Ibrahim Babangida', NULL, 'Gen Ibrahim Babangida', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(273, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 17, NULL, 'The body charged with the responsibility of regulating and protecting consumers against illicit foods and drugs in Nigeria', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(274, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 18, NULL, 'The senate president during the second republic was.........................', 2, 'Dr. Joseph Wayas', 'Senator Anyim Pius Anyim', 'Senator Iyorchia Ayu', 'Chief Adopous Wabara', NULL, 'Dr. Joseph Wayas', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(275, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 19, NULL, 'We eat Carbohydrate food to give us..........................', 2, 'Energy ', 'Good sight', 'Good teeth', 'Strong bones ', NULL, 'Energy ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(276, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 20, NULL, 'President Barrack Obama is the.................. president of the United States of America and first African-American president of U.S.', 2, '35th', '44th', '40th', '39th', NULL, '44th', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(277, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 21, NULL, 'A large area of water surrounded by land is called.......................................', 2, 'A dam', 'An Island ', 'An Is berg', 'A lake', NULL, 'A lake', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(278, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 22, NULL, 'A written piece of paper which indicates that goods bought and services rendered have been paid for is called...............................', 2, 'An Invoice', 'A receipt', 'A wage bill', 'A trade document', NULL, 'A receipt', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(279, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 23, NULL, 'The device for stepping up or down electricity voltage on transmission line is called......................', 2, 'Electricity meter', 'Transmission station', 'Transformer', 'Step-down panel', NULL, 'Transformer', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(280, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 24, NULL, 'The major raw material for pottery is.............................', 2, 'Metal', 'Ceramics', 'Cement', 'Clay', NULL, 'Clay', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(281, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 25, NULL, ' If the total sales for a bag shop in a certain year were #150, 000 What were sales in July, if July sales were half the monthly average?', 2, '#6,250', '#8,650', '#12,500', '#7,550', NULL, '#6,250', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(282, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 26, NULL, 'In UITH, Dr Steve has worked more night shift than Dr. Greg who has worked five night shifts. Dr Okon has worked fifteen night shifts more than Dr. Steve and Dr. Greg combined. Dr. Uche has worked eight night shifts less than Dr. Steve. How many night shifts has Dr, Steve worked?', 2, 'Ten', 'Nine', 'Eight', 'Seven', NULL, 'Nine', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(283, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 27, NULL, 'At a basket match, Roland was sitting in seat 356. Peter on the right of Roland in seat 355.  Samuel was on the left of Roland. Samson was by the left of Samuel. Which seat is Samson sitting?', 2, '354', '357', '358', '353', NULL, '354', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(284, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 28, NULL, 'While preparing for the post jamb aptitude test, Felix read through pages 35 to 78 and 102 to 127 of an English text book. How many pages did he read altogether? ', 2, '58', '70', '68', '64', NULL, '70', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(285, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 29, NULL, 'How many numbers between 1 and 60 begins or end with 5', 2, '5', '8', '15', '18', NULL, '15', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(286, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 30, NULL, 'A researcher conducted in the laboratory showed that 55% rats died of liver disorder when exposed to sulphur dioxide but 96% of rats who died of liver disorder were not exposed to sulphur dioxide. This means that', 2, 'Small portion of studied rats was exposed to Sulphur dioxide   ', 'There is only one cause of fatal liver disease in rats', 'Sulphur dioxide is not particularly dangerous to theliver of rats', 'Most rats will not suffer from exposure to low level of Sulphur dioxide.', NULL, 'Small portion of studied rats was exposed to Sulphur dioxide   ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(287, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 31, NULL, 'Three people witnessed a lady who was robbed in a cyber cafÃ© and they were asked to    describe the mugger. Which of the following best described the mugger?', 2, 'He was tall, of average weight and middle-aged ', 'He was tall, thin and young', 'He was average height, thin and middle-aged', 'He was tall, thin and middle-aged', NULL, 'He was tall, thin and middle-aged', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(288, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 32, NULL, 'If 15 cans of food are needed for seven adults for two days, the number of cans needed to       feed four adults for seven days is?', 2, '25', '15', '20', '30', NULL, '30', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(289, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 33, NULL, 'Which one of the following key techniques is necessary for all the others to be effective?', 2, 'Communication ', 'Teamwork', 'Leadership ', 'Technical know-how      ', NULL, 'Communication ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(290, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 34, NULL, 'How many Lunar months make one year ', 2, '13', '11', '12', '14', NULL, '13', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(291, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 35, NULL, 'Two-third of a class passed English Language as a subject. The number of students who       failed English Language will be?', 2, '42007', '42006', '42008', '42067', NULL, '42007', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(292, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 36, NULL, ' â€œMy Heart Jumped into my mouthâ€ What is the meaning of the above statement?', 2, 'To be confused      ', 'To be hungry      ', 'To be afraid ', 'To be discouraged   ', NULL, 'To be afraid ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(293, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 37, NULL, 'It was Friday on Jan 1, 2010. What was the day of the week Jan 1, 2011? ', 2, 'Sunday', 'Wednesday', 'Thursday', 'Saturday', NULL, 'Saturday', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(294, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 38, NULL, 'Today is Monday. After 63 days, it will be: ', 2, 'Wednesday     ', 'Monday', 'Tuesday', 'Saturday', NULL, 'Monday', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(295, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 39, NULL, 'AT 10% DISCOUNT, AN ITEM VALUED AT N45000 NOW COST', 2, '4050', '40500', '40505', '40550', NULL, '40550', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(296, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 40, NULL, 'IN WHICH COUNTRY IS MISSISSIPPI RIVER', 2, 'USA', 'ARGENTINA       ', 'BRAZIL        ', 'CANADA', NULL, 'USA', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(297, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 41, NULL, 'ON A ROAD MAP, A LINE SEGMENT OF 4 INCHES LONG REPRESENTS A DISDANCE OF         12 MILES.  HOW MANY MILES LONG IS 4.5 INCHES.', 2, '12.5', '13.5', '14.5', '15.5', NULL, '13.5', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(298, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 42, NULL, 'THE BREATH AND LENTH OF A RECTANGLE ARE L AND 2L RESPECTIVELY. WHAT IS THE       PERIMETER OF THE RECTANGLE?', 2, 'L', '3L', '5L', '6L', NULL, '6L', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(299, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 43, NULL, 'THE PLACE WHERE WATER IS FOUND IN THE DESERT IS CALLED', 2, 'LAKE', 'DAM', 'DIFF', 'OASIS', NULL, 'OASIS', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(300, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 44, NULL, 'WHICH OF THE FOLLOWING HAS THE HIGHEST POPULATION IN THE WORLD', 2, 'INDIA   ', 'RUSSIA      ', 'CHINA     ', 'USA', NULL, 'CHINA     ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(301, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 45, NULL, 'THE SCIENTIFIC WAY OF REFERRING TO THE ACTIVITY OF THE EAR IS', 2, 'AUDIO VISUAL  ', 'AUDIO   ', 'VISUAL   ', 'CHEMORECEPTOR', NULL, 'AUDIO   ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(302, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 46, NULL, 'THE UPPER LEGISLATIVE ARM OF GOVERNMENT IN NIGERIA IS HEADED BY ', 2, 'SPEAKER             ', 'PRESIDENT   ', 'LEADER     ', 'SECRETARY                         ', NULL, 'PRESIDENT   ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(303, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 47, NULL, 'THE DEGREE OF HOTNESS AND COLDNESS OF A PLACE IS CALLED', 2, 'RAINFALL          ', 'HUMIDITY     ', 'TEMPERATURE     ', 'WEATHER            ', NULL, 'TEMPERATURE     ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(304, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 48, NULL, 'A PLACE WHERE TWO RIVERS MEET IS CALLED', 2, 'CONFLUENCE     ', 'JUNCTION     ', 'JOINT           ', 'DELTA                                 ', NULL, 'CONFLUENCE     ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(305, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 49, NULL, 'THE PRIMARY SOURCE OF ENERGY IS CALLED                                                      ', 2, 'SUNLIGHT      ', 'WATER      ', 'FOOD', 'HEAT', NULL, 'SUNLIGHT      ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(306, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'choice', 50, NULL, 'THE FIRST COLOUR OF THE RAINBOW IS CALLED', 2, 'GREEN       ', 'VIOLET      ', 'INDIGO     ', 'RED', NULL, 'RED', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(307, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 10, NULL, 'A labourer is paid N5,400:00k per month. What is his total salary in 1 3/4years?', 2, 'N113,40:00', 'N64,800:00', 'N97,200:00', 'N129,600:00', NULL, 'N113,40:00', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(308, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 2, '', '<p>Which of the following will sink when placed on water?</p>', 2, 'Ball', 'Plastic Cup', 'Balloon', 'Eraser', '', 'Balloon', NULL, NULL, NULL, '1458152698', 'Wed 16th Mar, 2016 - 7:24 58 PM', NULL, NULL, NULL, NULL),
(309, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 3, NULL, 'The following  are domestic birds except', 2, 'Duck', 'Pigeon', 'Turkey', 'Vulture', NULL, 'Vulture', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(310, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 4, NULL, 'A boy buys a biscuit for N4 and sells it at a profit of 20%. Find the actual price and the selling price?', 2, 'i =N1.00k, ii = N5.00k', 'i = 60k,      ii = N4.40k', 'i = 80k, ii = N4.80k', 'i = 50k,      ii = N4.50k', NULL, 'i = 80k, ii = N4.80k', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(311, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 5, NULL, 'A man buys recharge card for N500. He sells it for N430. What is the percentage loss?', 2, '0.07', '0.09', '0.14', '0.2', NULL, '0.14', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(312, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 6, NULL, 'The title of the traditional ruler of Benin is called................................', 2, 'Obi', 'Obong', 'Oba', 'Igwe', NULL, 'Oba', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(313, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 7, '', '<p>Which of these is not a method of preventing iron from rusting?</p>', 2, 'Lubrication ', 'Galvanization', 'Melting', 'Painting', '', 'Lubrication ', NULL, NULL, NULL, '1458152789', 'Wed 16th Mar, 2016 - 7:26 29 PM', NULL, NULL, NULL, NULL),
(314, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 8, NULL, 'Which of the following is not a rainbow colour?', 2, 'Indigo ', 'Purple ', 'Orange', 'Green', NULL, 'Purple ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(315, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 9, NULL, '<p>A person who flies an aircraft is called..........................</p>', 2, 'A captain', 'A craftologist', 'A pilot', 'An aeronautics engineer', '', 'A craftologist', NULL, NULL, NULL, '1457970916', 'Mon 14th Mar, 2016 - 4:55 16 PM', NULL, NULL, NULL, NULL),
(316, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 1, NULL, 'Kwame Nkrumah Museum is located in..................................', 2, 'Tanzania ', 'Kenya', 'Mauritania', 'Ghana', NULL, 'Ghana', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(317, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 11, NULL, 'An example of confluence town in Nigeria is...................................', 2, 'Onitsha ', 'Obudu ', 'Lokoja', 'PortHarcout', NULL, 'Lokoja', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(318, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 12, NULL, 'A trained person that specializes in the treatment of diseases and disorders of the teeth is called................', 2, 'Cardiologist', 'Dermatologist', 'Physician', 'Dentist', NULL, 'Dentist', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(319, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 13, NULL, 'A bricklayer is Paid N1000:00k for 5days work. What is his pay for 22days work?', 2, 'N22,000:00k', 'N50,000:00k', 'N4,400:00k', 'N5,000:00k', NULL, 'N4,400:00k', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(320, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 14, NULL, 'In parliamentary system of government, members of the parliament are required to report the proceedings of the house to their..............................', 2, 'Local government chairman and governors', 'Constituencies', 'Political parties and party  stalwarts', 'Traditional rulers', NULL, 'Constituencies', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(321, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 15, NULL, 'One essential duty of a citizen to his/her state is to...........................', 2, 'Vote and support the government in power', 'Recite the national anthem and the pledge', 'Pay his tax', 'Encourage other citizens to be loyal', NULL, 'Pay his tax', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(322, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 16, NULL, 'Under whose regime were Delta and Adamawa States created?', 2, 'Gen Sanni Abacha', 'Gen yakubu Gowon', 'Gen Murtala Muhammed', 'Gen Ibrahim Babangida', NULL, 'Gen Ibrahim Babangida', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(323, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 17, NULL, 'The body charged with the responsibility of regulating and protecting consumers against illicit foods and drugs in Nigeria', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(324, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 18, NULL, 'The senate president during the second republic was.........................', 2, 'Dr. Joseph Wayas', 'Senator Anyim Pius Anyim', 'Senator Iyorchia Ayu', 'Chief Adopous Wabara', NULL, 'Dr. Joseph Wayas', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(325, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 19, NULL, 'We eat Carbohydrate food to give us..........................', 2, 'Energy ', 'Good sight', 'Good teeth', 'Strong bones ', NULL, 'Energy ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(326, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 20, NULL, 'President Barrack Obama is the.................. president of the United States of America and first African-American president of U.S.', 2, '35th', '44th', '40th', '39th', NULL, '44th', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(327, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 21, NULL, 'A large area of water surrounded by land is called.......................................', 2, 'A dam', 'An Island ', 'An Is berg', 'A lake', NULL, 'A lake', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(328, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 22, NULL, 'A written piece of paper which indicates that goods bought and services rendered have been paid for is called...............................', 2, 'An Invoice', 'A receipt', 'A wage bill', 'A trade document', NULL, 'A receipt', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(329, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 23, NULL, 'The device for stepping up or down electricity voltage on transmission line is called......................', 2, 'Electricity meter', 'Transmission station', 'Transformer', 'Step-down panel', NULL, 'Transformer', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(330, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 24, NULL, 'The major raw material for pottery is.............................', 2, 'Metal', 'Ceramics', 'Cement', 'Clay', NULL, 'Clay', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(331, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 25, NULL, ' If the total sales for a bag shop in a certain year were #150, 000 What were sales in July, if July sales were half the monthly average?', 2, '#6,250', '#8,650', '#12,500', '#7,550', NULL, '#6,250', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(332, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 26, NULL, 'In UITH, Dr Steve has worked more night shift than Dr. Greg who has worked five night shifts. Dr Okon has worked fifteen night shifts more than Dr. Steve and Dr. Greg combined. Dr. Uche has worked eight night shifts less than Dr. Steve. How many night shifts has Dr, Steve worked?', 2, 'Ten', 'Nine', 'Eight', 'Seven', NULL, 'Nine', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(333, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 27, NULL, 'At a basket match, Roland was sitting in seat 356. Peter on the right of Roland in seat 355.  Samuel was on the left of Roland. Samson was by the left of Samuel. Which seat is Samson sitting?', 2, '354', '357', '358', '353', NULL, '354', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(334, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 28, NULL, 'While preparing for the post jamb aptitude test, Felix read through pages 35 to 78 and 102 to 127 of an English text book. How many pages did he read altogether? ', 2, '58', '70', '68', '64', NULL, '70', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(335, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 29, NULL, 'How many numbers between 1 and 60 begins or end with 5', 2, '5', '8', '15', '18', NULL, '15', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(336, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 30, NULL, 'A researcher conducted in the laboratory showed that 55% rats died of liver disorder when exposed to sulphur dioxide but 96% of rats who died of liver disorder were not exposed to sulphur dioxide. This means that', 2, 'Small portion of studied rats was exposed to Sulphur dioxide   ', 'There is only one cause of fatal liver disease in rats', 'Sulphur dioxide is not particularly dangerous to theliver of rats', 'Most rats will not suffer from exposure to low level of Sulphur dioxide.', NULL, 'Small portion of studied rats was exposed to Sulphur dioxide   ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(337, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 31, NULL, 'Three people witnessed a lady who was robbed in a cyber cafÃ© and they were asked to    describe the mugger. Which of the following best described the mugger?', 2, 'He was tall, of average weight and middle-aged ', 'He was tall, thin and young', 'He was average height, thin and middle-aged', 'He was tall, thin and middle-aged', NULL, 'He was tall, thin and middle-aged', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(338, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 32, NULL, 'If 15 cans of food are needed for seven adults for two days, the number of cans needed to       feed four adults for seven days is?', 2, '25', '15', '20', '30', NULL, '30', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(339, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 33, NULL, 'Which one of the following key techniques is necessary for all the others to be effective?', 2, 'Communication ', 'Teamwork', 'Leadership ', 'Technical know-how      ', NULL, 'Communication ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(340, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 34, NULL, 'How many Lunar months make one year ', 2, '13', '11', '12', '14', NULL, '13', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(341, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 35, NULL, 'Two-third of a class passed English Language as a subject. The number of students who       failed English Language will be?', 2, '42007', '42006', '42008', '42067', NULL, '42007', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(342, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 36, NULL, ' â€œMy Heart Jumped into my mouthâ€ What is the meaning of the above statement?', 2, 'To be confused      ', 'To be hungry      ', 'To be afraid ', 'To be discouraged   ', NULL, 'To be afraid ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(343, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 37, NULL, 'It was Friday on Jan 1, 2010. What was the day of the week Jan 1, 2011? ', 2, 'Sunday', 'Wednesday', 'Thursday', 'Saturday', NULL, 'Saturday', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(344, 'GSE 111', '2016', '100', 'TEST', 4, 'choice', 1, NULL, 'Today is Monday. After 63 days, it will be: ', 2, 'Wednesday     ', 'Monday', 'Tuesday', 'Saturday', NULL, 'Monday', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(345, 'GSE 111', '2016', '100', 'TEST', 4, 'choice', 2, NULL, 'AT 10% DISCOUNT, AN ITEM VALUED AT N45000 NOW COST', 2, '4050', '40500', '40505', '40550', NULL, '40550', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(346, 'GSE 111', '2016', '100', 'TEST', 4, 'choice', 3, NULL, 'IN WHICH COUNTRY IS MISSISSIPPI RIVER', 2, 'USA', 'ARGENTINA       ', 'BRAZIL        ', 'CANADA', NULL, 'USA', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(347, 'GSE 111', '2016', '100', 'TEST', 4, 'choice', 4, NULL, 'ON A ROAD MAP, A LINE SEGMENT OF 4 INCHES LONG REPRESENTS A DISDANCE OF         12 MILES.  HOW MANY MILES LONG IS 4.5 INCHES.', 2, '12.5', '13.5', '14.5', '15.5', NULL, '13.5', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(348, 'GSE 111', '2016', '100', 'TEST', 4, 'choice', 5, NULL, 'THE BREATH AND LENTH OF A RECTANGLE ARE L AND 2L RESPECTIVELY. WHAT IS THE       PERIMETER OF THE RECTANGLE?', 2, 'L', '3L', '5L', '6L', NULL, '6L', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(349, 'GSE 111', '2016', '100', 'TEST', 4, 'choice', 6, NULL, 'THE PLACE WHERE WATER IS FOUND IN THE DESERT IS CALLED', 2, 'LAKE', 'DAM', 'DIFF', 'OASIS', NULL, 'OASIS', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(350, 'GSE 111', '2016', '100', 'TEST', 4, 'choice', 7, NULL, 'WHICH OF THE FOLLOWING HAS THE HIGHEST POPULATION IN THE WORLD', 2, 'INDIA   ', 'RUSSIA      ', 'CHINA     ', 'USA', NULL, 'CHINA     ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(351, 'GSE 111', '2016', '100', 'TEST', 4, 'choice', 8, NULL, 'THE SCIENTIFIC WAY OF REFERRING TO THE ACTIVITY OF THE EAR IS', 2, 'AUDIO VISUAL  ', 'AUDIO   ', 'VISUAL   ', 'CHEMORECEPTOR', NULL, 'AUDIO   ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(352, 'GSE 111', '2016', '100', 'TEST', 4, 'choice', 9, NULL, 'THE UPPER LEGISLATIVE ARM OF GOVERNMENT IN NIGERIA IS HEADED BY ', 2, 'SPEAKER             ', 'PRESIDENT   ', 'LEADER     ', 'SECRETARY                         ', NULL, 'PRESIDENT   ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(353, 'GSE 111', '2016', '100', 'TEST', 4, 'choice', 10, NULL, 'THE DEGREE OF HOTNESS AND COLDNESS OF A PLACE IS CALLED', 2, 'RAINFALL          ', 'HUMIDITY     ', 'TEMPERATURE     ', 'WEATHER            ', NULL, 'TEMPERATURE     ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(354, 'GSE 111', '2016', '100', 'TEST', 4, 'choice', 11, NULL, 'A PLACE WHERE TWO RIVERS MEET IS CALLED', 2, 'CONFLUENCE     ', 'JUNCTION     ', 'JOINT           ', 'DELTA                                 ', NULL, 'CONFLUENCE     ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(355, 'GSE 111', '2016', '100', 'Exam', 4, 'choice', 38, NULL, 'THE PRIMARY SOURCE OF ENERGY IS CALLED                                                      ', 2, 'SUNLIGHT      ', 'WATER      ', 'FOOD', 'HEAT', NULL, 'SUNLIGHT      ', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(356, 'GSE 111', '2016', '100', 'TEST', 4, 'choice', 12, NULL, 'THE FIRST COLOUR OF THE RAINBOW IS CALLED', 2, 'GREEN       ', 'VIOLET      ', 'INDIGO     ', 'RED', NULL, 'RED', NULL, NULL, NULL, '1457965104', 'Mon 14th Mar, 2016 - 3:18 24 PM', NULL, NULL, NULL, NULL),
(357, 'EDU 121', '2016', '100', 'TEST', 5, 'choice', 1, '', '<h2 style="color: #000000;">Domestic animals lives in the ______</h2>', 2, 'Forest', 'Zoo', 'Bush', 'House', 'all of the above', 'House', NULL, '', NULL, '1458430319', 'Sun 20th Mar, 2016 - 12:31 59 AM', NULL, NULL, NULL, NULL),
(358, 'EDU 121', '2016', '100', 'TEST', 4, 'choice', 2, '', '<h2 style="color: #000000;">Eating healthy food gives our body&nbsp;_______</h2>', 4, 'Kwashiorkor', 'Stunted growth', 'Good health', 'None of the above', '', 'Good health', '', 'img_for_EDU 121_TEST2_1458430422.jpeg', NULL, '1458430422', 'Sun 20th Mar, 2016 - 12:33 42 AM', '1465050413', 'Sat 4th Jun, 2016 - 4:26 53 PM', NULL, 'admin'),
(359, 'EDU 121', '2016', '100', 'Test', 4, 'choice', 3, '', '<h2 style="color: #000000;">______ is the study of living things&nbsp;</h2>', 2, 'Ecology', 'Pathology', 'Biology', 'Ecosystem', '', 'Biology', '', '', NULL, '1458436069', 'Sun 20th Mar, 2016 - 2:07 49 AM', '1461328419', 'Fri 22nd Apr, 2016 - 2:33 39 PM', NULL, 'mayorjo'),
(360, 'EDU 121', '2016', '100', 'TEST', 4, 'choice', 4, '<p><span style="font-size: 14pt;">my friend, how are you now&nbsp;</span></p>', '<h2 style="color: #000000;">______ food is best good for domestic animals&nbsp;</h2>', 2, 'Cereal', 'Solid', 'Liquid', 'Herbs', '', 'Herbs', '', 'img_for_EDU 121_TEST_9_1458435185.jpeg', NULL, '1458435917', 'Sun 20th Mar, 2016 - 2:05 17 AM', NULL, NULL, NULL, NULL),
(361, 'EDU 121', '2016', '100', 'TEST', 4, 'choice', 5, '<p><span style="font-size: 14pt;">my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;my friend, how are you now&nbsp;</span></p>', '<h2 style="color: #000000;">______ animals chew the chord</h2>', 2, 'Domestic', 'Ruminant', 'Non ruminant', 'Ordinary', '', 'Ruminant', NULL, '', NULL, '1458436969', 'Sun 20th Mar, 2016 - 2:22 49 AM', NULL, NULL, NULL, NULL),
(362, 'EDU 121', '2016', '100', 'TEST', 4, 'choice', 6, '', '<h2 style="color: #000000;">_____ is the smallest unit of living organism</h2>', 2, 'Atom', 'Plant', 'Cell', 'Osmosis', '', 'Cell', NULL, 'img_for_EDU 121_TEST_6_1458432607.jpeg', NULL, '1458432607', 'Sun 20th Mar, 2016 - 1:10 07 AM', NULL, NULL, NULL, NULL),
(363, 'EDU 121', '2016', '100', 'TEST', 4, 'choice', 7, '', '<h2 style="color: #000000;">Which of these foods gives energy</h2>', 2, 'Carbohydrate', 'Protein', 'Minerals', 'Vitamins', '', 'Carbohydrate', '', '', NULL, '1458435619', 'Sun 20th Mar, 2016 - 2:00 19 AM', '1461579891', 'Mon 25th Apr, 2016 - 12:24 51 PM', NULL, 'admin'),
(364, 'EDU 121', '2016', '100', 'TEST', 4, 'typeIn', 8, '', '<h2 style="color: #000000;">it tooks _____ days for fowls to produce children</h2>', 2, '21', '28', '30', '14', '', '', '30', '', NULL, '1458463250', 'Sun 20th Mar, 2016 - 9:40 50 AM', '1461328335', 'Fri 22nd Apr, 2016 - 2:32 15 PM', NULL, 'mayorjo'),
(365, 'EDU 121', '2016', '100', 'TEST', 4, 'choice', 9, '', '<h2 style="color: #000000;">Animals that lives&nbsp;in water are called _______ &nbsp;animals</h2>', 2, 'Aquatic', 'Amphibian', 'Domestic', 'Marine', '', 'Aquatic', NULL, 'img_for_EDU 121_TEST_9_1458435185.jpeg', NULL, '1458435185', 'Sun 20th Mar, 2016 - 1:53 05 AM', NULL, NULL, NULL, NULL),
(366, 'EDU 121', '2016', '100', 'TEST', 4, 'choice', 10, '', '<p><span style="font-size: 14pt;">A sinner never quits in his journey&nbsp;</span></p>', 2, 'True', 'False', 'Lie', 'Beta', '', 'True', NULL, '', NULL, '1458435105', 'Sun 20th Mar, 2016 - 1:51 45 AM', NULL, NULL, NULL, NULL),
(367, 'EDU 111', '2016', '100', 'Test', 4, 'checkbox', 1, '', '<p><span style="font-size: 14pt;">Which of thr following places can a woman cook delicious food</span></p>', 2, 'Kitchen', 'Room', 'Tiolet', 'Parlour', '', 'Kitchen', '', '', NULL, '1458814279', 'Thu 24th Mar, 2016 - 11:11 19 AM', NULL, NULL, NULL, NULL),
(368, 'EDU 111', '2016', '100', 'Test', 5, 'checkbox', 2, '', '<p><span style="font-size: 14pt;">Which of the following food gives energy&nbsp;?</span></p>', 2, 'Tomato', 'Onion', 'Rice', 'Pounded Yam', 'Beans', 'Rice', NULL, '', NULL, '1458813855', 'Thu 24th Mar, 2016 - 11:04 15 AM', NULL, NULL, NULL, NULL),
(369, 'EDU 111', '2016', '100', 'Test', 5, 'choice', 3, '', '<p><span style="font-size: 14pt;">Education is the ____ legacy</span></p>', 2, 'Worst', 'Most', 'Best', 'Only', 'All of the above', 'Best', NULL, '', NULL, '1458813949', 'Thu 24th Mar, 2016 - 11:05 49 AM', NULL, NULL, NULL, NULL),
(370, 'EDU 111', '2016', '100', 'Test', 5, 'choice', 4, '', '<p><span style="font-size: 14pt;">Nigeria got independence in the year _____?</span></p>', 2, '1981', '1966', '1980', '1963', '1960', '1960', NULL, '', NULL, '1458814022', 'Thu 24th Mar, 2016 - 11:07 02 AM', NULL, NULL, NULL, NULL),
(371, 'EDU 111', '2016', '100', 'Test', 5, 'choice', 5, '', '<p><span style="font-size: 14pt;">A noun is a ____ of any person, _____ , _____ or things</span></p>', 2, 'union, man, woman', 'idea, men, women', 'name, brother, places', 'title, animal, birds', 'name, animal, places', 'name, animal, places', NULL, '', NULL, '1458814225', 'Thu 24th Mar, 2016 - 11:10 25 AM', NULL, NULL, NULL, NULL),
(372, 'EDU 113', '2016', '100', 'Exam', 4, 'choice', 1, '', '<p><span style="font-size: 14pt;">The sum of 2 and 3 is ____</span></p>', 5, '5', '6', '7', '8', '', '5', '', '', NULL, '1459175684', 'Mon 28th Mar, 2016 - 4:34 44 PM', '1461506190', 'Sun 24th Apr, 2016 - 3:56 30 PM', NULL, 'admin'),
(373, 'EDU 113', '2016', '100', 'Exam', 4, 'choice', 2, '', '<p><span style="font-size: 14pt;">The product of 2 and 3 is ___</span></p>', 2, '5', '6', '7', '8', '', '6', '', '', NULL, '1459175714', 'Mon 28th Mar, 2016 - 4:35 14 PM', '1461400067', 'Sat 23rd Apr, 2016 - 10:27 47 AM', NULL, 'mayorjo'),
(374, 'EDU 113', '2016', '100', 'Exam', 5, 'choice', 3, '', '<p><span style="font-size: 14pt;">in the year 2004, 200&nbsp;students sats for exam, in the year 2005, it was 300, while in the year 2006, total was 250,&nbsp;w</span><span style="font-size: 14pt;">hat is the average of the students who sat for the exams</span></p>', 2, '750', '300', '250', '500', '200', '250', '', '', NULL, '1461161689', 'Wed 20th Apr, 2016 - 4:14 49 PM', '1465319708', 'Tue 7th Jun, 2016 - 7:15 08 PM', NULL, 'admin'),
(375, 'EDU 113', '2016', '100', 'Exam', 4, 'choice', 4, '', '<p><span style="font-size: 14pt;">how many days are there in the month of November</span></p>', 2, '29', '30', '31', '28', '70', '30', '', '', NULL, '1461162401', 'Wed 20th Apr, 2016 - 4:26 41 PM', '1465319820', 'Tue 7th Jun, 2016 - 7:17 00 PM', NULL, 'admin'),
(376, 'EDU 113', '2016', '100', 'Exam', 5, 'typeIn', 5, '', '<p><span style="font-size: 14pt;">Mouse is an ________ device in computer</span></p>', 2, '', '', '', '', '', '', 'input', '', NULL, '1459166407', 'Mon 28th Mar, 2016 - 2:00 07 PM', '1465319878', 'Tue 7th Jun, 2016 - 7:17 58 PM', NULL, 'admin'),
(377, 'EDU 124', '2016', '100', 'Test', 4, 'choice', 1, '', '<p><span style="font-size: 14pt;">The full meaning of WWW is _______</span></p>', 2, 'Word Wild Web', 'World Wild Web', 'World Wide Web', 'World Wide Webs', NULL, 'World Wide Web', NULL, '', NULL, '1459341366', 'Wed 30th Mar, 2016 - 2:36 06 PM', NULL, NULL, NULL, NULL),
(378, 'EDU 124', '2016', '100', 'Test', 4, 'choice', 2, '', '<p><span style="font-size: 14pt;">The full meaning of ICT is ______</span></p>', 2, 'Introduction To Computer Training', 'Information and Computer Technology', 'Introduction To Communication Technology', 'Information and Communication Technology', NULL, 'Information and Communication Technology', NULL, '', NULL, '1459341536', 'Wed 30th Mar, 2016 - 2:38 56 PM', NULL, NULL, NULL, NULL),
(379, 'EDU 124', '2016', '100', 'Test', 4, 'choice', 3, '', '<p><span style="font-size: 14pt;">There are _____ generations of Computer&nbsp;</span></p>', 2, '6', '5', '4', '7', NULL, '5', NULL, '', NULL, '1459341635', 'Wed 30th Mar, 2016 - 2:40 35 PM', NULL, NULL, NULL, NULL),
(380, 'EDU 124', '2016', '100', 'Test', 4, 'choice', 4, '', '<p><span style="font-size: 14pt;">Which of the following Peripherals is an input device in computer&nbsp;</span></p>', 2, 'Monitor', 'Keyboard', 'Speaker', 'Printer', NULL, 'Keyboard', NULL, '', NULL, '1459341762', 'Wed 30th Mar, 2016 - 2:42 42 PM', NULL, NULL, NULL, NULL),
(381, 'EDU 124', '2016', '100', 'Test', 4, 'choice', 5, '', '<p><span style="font-size: 18.6667px;">The process of Putting On the computer for the first time is called _______ booting</span></p>', 2, 'Cold', 'Warm', 'Restart', 'Start', NULL, 'Cold', NULL, '', NULL, '1459341868', 'Wed 30th Mar, 2016 - 2:44 28 PM', NULL, NULL, NULL, NULL),
(382, 'EDU 124', '2016', '100', 'Test', 4, 'choice', 6, '', '<p><span style="font-size: 14pt;">The only language that a computer system &nbsp;understands is the ______ language</span></p>', 2, 'High Level', 'Low Level', 'Assembly', 'Binary', NULL, 'Assembly', NULL, '', NULL, '1459341985', 'Wed 30th Mar, 2016 - 2:46 25 PM', NULL, NULL, NULL, NULL),
(383, 'EDU 124', '2016', '100', 'Test', 4, 'choice', 7, '', '<p><span style="font-size: 14pt;">Convert&nbsp;1101<sub>2</sub> to base 10</span></p>', 2, '15', '13', '12', '8', NULL, '13', NULL, '', NULL, '1459342119', 'Wed 30th Mar, 2016 - 2:48 39 PM', NULL, NULL, NULL, NULL),
(384, 'EDU 124', '2016', '100', 'Test', 4, 'choice', 8, '', '<p><span style="font-size: 14pt;">Convert 10102 to base 8</span></p>', 2, 'A', '10', '12', '14', NULL, '12', NULL, '', NULL, '1459342225', 'Wed 30th Mar, 2016 - 2:50 25 PM', NULL, NULL, NULL, NULL),
(385, 'EDU 124', '2016', '100', 'Test', 4, 'choice', 9, '', '<p><span style="font-size: 14pt;">15<sub>10</sub> is equivalent to <span style="text-decoration: underline;">X</span> in base 2, what is <span style="text-decoration: underline;">X</span></span></p>', 2, '1111', '1110', '1011', '1101', NULL, '1111', NULL, '', NULL, '1459342345', 'Wed 30th Mar, 2016 - 2:52 25 PM', NULL, NULL, NULL, NULL),
(386, 'EDU 124', '2016', '100', 'Test', 4, 'choice', 10, '', '<p><span style="font-size: 14pt;">A byte is equals to _____ bits</span></p>', 2, '2 ', '16', '1', '8', NULL, '8', NULL, '', NULL, '1459342459', 'Wed 30th Mar, 2016 - 2:54 19 PM', NULL, NULL, NULL, NULL),
(387, 'GSE 113', '2016', '100', 'TEST', 4, 'choice', 1, '', '<p><span style="font-size: 14pt;">If Log<sub>x</sub> (1 / 8) = - 3 / 2, then x is equal to</span></p>', 2, '-4', '4', '1/4', '10', '', '4', '', '', NULL, '1461150464', 'Wed 20th Apr, 2016 - 1:07 44 PM', '1462622978', 'Sat 7th May, 2016 - 2:09 38 PM', NULL, 'admin'),
(388, 'GSE 113', '2016', '100', 'TEST', 4, 'choice', 2, '', '<p><span style="font-size: 14pt;">20% of 2 is equal to</span></p>', 2, '20', '4', '0.4', '0.04', '', '0.4', '', '', NULL, '1461150543', 'Wed 20th Apr, 2016 - 1:09 03 PM', '1461399444', 'Sat 23rd Apr, 2016 - 10:17 24 AM', NULL, 'admin'),
(389, 'GSE 113', '2016', '100', 'TEST', 4, 'choice', 3, '', '<p><span style="font-size: 14pt;">If Log<sub>4</sub> (x) = 12, then log<sub>2</sub> (x / 4) is equal to</span></p>', 2, '11', '48', '-12', '22', '', '22', '', '', NULL, '1461150619', 'Wed 20th Apr, 2016 - 1:10 19 PM', '1461399457', 'Sat 23rd Apr, 2016 - 10:17 37 AM', NULL, 'admin'),
(390, 'GSE 113', '2016', '100', 'TEST', 4, 'choice', 4, '', '<p><span style="font-size: 14pt;">The population of a country increased by an average of 2% per year from 2000 to 2003. If the population of this country was 2 000 000 on December 31, 2003, then the population of this country on January 1, 2000, to the nearest thousand would have been </span></p>', 2, '1 846 000 ', '1 852 000', '1 000 000', '1 500 000', '', '1 846 000 ', '', '', NULL, '1461150728', 'Wed 20th Apr, 2016 - 1:12 08 PM', '1461399475', 'Sat 23rd Apr, 2016 - 10:17 55 AM', NULL, 'admin'),
(391, 'GSE 113', '2016', '100', 'TEST', 4, 'choice', 5, '', '<p><span style="font-size: 14pt;">f is a quadratic function&nbsp;whose graph is a parabola opening upward and has a vertex on the x-axis. The graph of the new function g defined by g(x) = 2 - f(x - 5) has a range defined by the interval</span></p>', 2, ' [ -5 , + infinity) ', ' [ 2 , + infinity) ', '( - infinity , 2] ', '( - infinity , 0]', '', '( - infinity , 2] ', '', '', NULL, '1461150830', 'Wed 20th Apr, 2016 - 1:13 50 PM', '1461399490', 'Sat 23rd Apr, 2016 - 10:18 10 AM', NULL, 'admin'),
(392, 'GSE 113', '2016', '100', 'TEST', 4, 'choice', 6, '', '<p><span style="font-size: 14pt;">If the graph of y = f(x) is transformed into the graph of 2y - 6 = - 4 f(x - 3), point (a , b) on the graph of y = f(x) becomes point (A , B) on the graph of 2y - 6 = - 4 f(x - 3) where A and B are given by </span></p>', 2, ' A = a - 3, B = b', 'A = a - 3, B = b ', 'A = a + 3, B = -2 b ', 'A = a + 3, B = -2 b +3', '', 'A = a + 3, B = -2 b +3', '', '', NULL, '1461150946', 'Wed 20th Apr, 2016 - 1:15 46 PM', '1461399682', 'Sat 23rd Apr, 2016 - 10:21 22 AM', NULL, 'admin'),
(393, 'GSE 113', '2016', '100', 'TEST', 4, 'choice', 7, '', '<p><span style="font-size: 14pt;">When a parabola represented by the equation y - 2x<sup> 2</sup> = 8 x + 5 is translated 3 units to the left and 2 units up, the new parabola has its vertex at</span></p>', 2, '(-5 , -1) ', '(-5 , -5) ', '(-1 , -3) ', '(-2 , -3)', '', '(-5 , -1) ', '', '', NULL, '1461151106', 'Wed 20th Apr, 2016 - 1:18 26 PM', '1461399698', 'Sat 23rd Apr, 2016 - 10:21 38 AM', NULL, 'admin'),
(394, 'GSE 113', '2016', '100', 'TEST', 4, 'choice', 8, '', '<p><span style="font-size: 14pt;">A school committee consists of 2 teachers and 4 students. The number of different committees that can be formed from 5 teachers and 10 students is</span></p>', 2, '10', '15', '2100', '8', '', '2100', '', '', NULL, '1461151239', 'Wed 20th Apr, 2016 - 1:20 39 PM', '1461399712', 'Sat 23rd Apr, 2016 - 10:21 52 AM', NULL, 'admin'),
(395, 'GSE 113', '2016', '100', 'TEST', 4, 'choice', 9, '', '<p><span style="font-size: 14pt;">Five different books (A, B, C, D and E) are to be arranged on a shelf. Books C and D are to be arranged first and second starting from the right of the shelf. The number of different orders in which books A, B and E may be arranged is </span></p>', 2, '5!', '3!', '2!', '3! * 2!', '', '3!', '', '', NULL, '1461151377', 'Wed 20th Apr, 2016 - 1:22 57 PM', '1461399730', 'Sat 23rd Apr, 2016 - 10:22 10 AM', NULL, 'admin'),
(396, 'GSE 113', '2016', '100', 'TEST', 4, 'choice', 10, '', '<p><span style="font-size: 14pt;">The exam scores of all 500 students were recorded and it was determined that these scores were normally distributed. If Jane''s score is 0.8 standard deviation above the mean, then how many, to the nearest unit, students scored above Jane? </span></p>', 2, '394', '250', '400', '106', NULL, '106', NULL, '', NULL, '1461151532', 'Wed 20th Apr, 2016 - 1:25 32 PM', NULL, NULL, NULL, NULL);
INSERT INTO `questions` (`sn`, `code`, `year`, `level`, `qtype`, `tot_option`, `optiontype`, `num`, `passage`, `question`, `marks`, `option1`, `option2`, `option3`, `option4`, `option5`, `answer`, `typeAns`, `image1`, `image2`, `recordtime`, `recorddate`, `updatetime`, `dateupdated`, `createdby`, `updatedby`) VALUES
(403, 'GSE 122', '2016', '100', 'Test', 3, 'choice', 1, '<p><span style="font-size: 12pt; color: #000000; font-style: normal; font-variant: normal;">Carly has a large family.<br /><span style="color: #000000; font-style: normal; font-variant: normal;">She lives with four people.<br />Carly also has two pets.<br /><span style="font-family: Arial; color: #000000; font-style: normal; font-variant: normal;">Carly&rsquo;s mom is a doctor. Carly&rsquo;s mom works<br />at the hospital. Carly&rsquo;s mom helps people who<br />are sick.<br />Carly&rsquo;s dad works at home. Carly&rsquo;s dad<br />cooks for the family. Carly&rsquo;s dad drives the kids<br />to soccer practice.<br />Carly has two brothers. James is ten years<br />old. Scott is fourteen years old.<br />Carly has two pets. Jinx is a small, black cat.<br />Diego is a large, brown dog.<br />Carly loves her family!</span></span></span></p>', '<p><span style="font-size: 14pt;">Carly''s mom works at the</span></p>', 2, 'restaurant', 'mall', 'hospital', '', '', 'hospital', '', '', NULL, '1461309037', 'Fri 22nd Apr, 2016 - 9:10 37 AM', '1461583584', 'Mon 25th Apr, 2016 - 1:26 24 PM', NULL, 'admin'),
(404, 'GSE 321', '2016', '300', 'Exam', 4, 'typeIn', 1, '', '<p><span style="font-size: 12pt;">What is the full meaning of WWW ?</span></p>', 2, '', '', '', '', '70', NULL, 'World Wide Web', '', NULL, '1461334645', 'Fri 22nd Apr, 2016 - 4:17 25 PM', NULL, NULL, 'mayorjo', NULL),
(405, 'GSE 321', '2016', '300', 'Exam', 3, 'typeIn', 2, '', '<p><span style="font-size: 12pt;">What is missing in this sentence " Information and Communication ___________"</span></p>', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'Technology', 'img_for_GSE 321_Exam_2_1461396243.jpeg', NULL, '1461396243', 'Sat 23rd Apr, 2016 - 9:24 03 AM', NULL, NULL, 'mayorjo', NULL),
(406, 'GSE 321', '2016', '300', 'Exam', 4, 'choice', 3, '', '<p><span style="font-size: 14pt;">Which of the following peripherals is an input device in computer ?</span></p>', 2, 'Monitor', 'Speaker', 'Keyboard', 'CPU', '', 'Keyboard', '', '', NULL, '1461396509', 'Sat 23rd Apr, 2016 - 9:28 29 AM', '1461399339', 'Sat 23rd Apr, 2016 - 10:15 39 AM', 'mayorjo', 'admin'),
(407, 'EDU 113', '2016', '100', 'Exam', 3, 'typeIn', 6, '', '<p><span style="font-size: 14pt;">____________ is an electronic machine that accepts data and process data&nbsp;</span></p>', 2, '', '', '', '', '', '', 'computer', '', NULL, '1461550364', 'Mon 25th Apr, 2016 - 4:12 44 AM', '1462627742', 'Sat 7th May, 2016 - 3:29 02 PM', 'admin', 'admin'),
(408, 'EDU 113', '2016', '100', 'Exam', 3, 'typeIn', 7, '', '<p><span style="font-size: 14pt;">How many sides does a hexagon has ?</span></p>', 3, NULL, NULL, NULL, NULL, NULL, NULL, '6', '', NULL, '1461550472', 'Mon 25th Apr, 2016 - 4:14 32 AM', NULL, NULL, 'admin', NULL),
(409, 'EDU 113', '2016', '100', 'Exam', 3, 'typeIn', 8, '', '<p><span style="font-size: 14pt;">The square rootof 144 is ____</span></p>', 2, '', '', '', '', '', '', '12', '', NULL, '1461550550', 'Mon 25th Apr, 2016 - 4:15 50 AM', '1462627831', 'Sat 7th May, 2016 - 3:30 31 PM', 'admin', 'admin'),
(410, 'EDU 113', '2016', '100', 'Exam', 3, 'typeIn', 9, '', '<p><span style="font-size: 14pt;">What is 5 to the power of 0 ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, NULL, '1', '', NULL, '1461550641', 'Mon 25th Apr, 2016 - 4:17 21 AM', NULL, NULL, 'admin', NULL),
(411, 'EDU 113', '2016', '100', 'Exam', 3, 'typeIn', 10, '', '<p><span style="font-size: 14pt;">(-10) * (5 - 2) = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, NULL, '-30', '', NULL, '1461551014', 'Mon 25th Apr, 2016 - 4:23 34 AM', NULL, NULL, 'admin', NULL),
(412, 'EDU 113', '2016', '100', 'Exam', 3, 'typeIn', 11, '', '<p><span style="font-size: 14pt;">(-8)<sup>2</sup> = ?</span></p>', 2, NULL, NULL, NULL, NULL, NULL, NULL, '64', '', NULL, '1461551151', 'Mon 25th Apr, 2016 - 4:25 51 AM', NULL, NULL, 'admin', NULL),
(413, 'EDU 113', '2016', '100', 'Exam', 3, 'typeIn', 12, '', '<p><span style="font-size: 14pt;">Calculate 3<sup>2</sup> + (-4)<sup>2</sup></span></p>', 2, NULL, NULL, NULL, NULL, NULL, NULL, '25', '', NULL, '1461551251', 'Mon 25th Apr, 2016 - 4:27 31 AM', NULL, NULL, 'admin', NULL),
(414, 'GSE 122', '2016', '100', 'Test', 3, 'choice', 2, '<p><span style="font-size: 12pt; color: #000000; font-style: normal; font-variant: normal;">Carly has a large family.<br /><span style="color: #000000; font-style: normal; font-variant: normal;">She lives with four people.<br /><span style="color: #000000; font-style: normal; font-variant: normal;">Carly also has two pets.<br /><span style="font-family: Arial; color: #000000; font-style: normal; font-variant: normal;">Carly&rsquo;s mom is a doctor. Carly&rsquo;s mom works<br /><span style="font-family: Arial; color: #000000; font-style: normal; font-variant: normal;">at the hospital. Carly&rsquo;s mom helps people who<br /><span style="color: #000000; font-style: normal; font-variant: normal;">are sick.<br /><span style="font-family: Arial; color: #000000; font-style: normal; font-variant: normal;">Carly&rsquo;s dad works at home. Carly&rsquo;s dad<br /><span style="font-family: Arial; color: #000000; font-style: normal; font-variant: normal;">cooks for the family. Carly&rsquo;s dad drives the kids<br /><span style="color: #000000; font-style: normal; font-variant: normal;">to soccer practice.<br /><span style="color: #000000; font-style: normal; font-variant: normal;">Carly has two brothers. James is ten years<br /><span style="color: #000000; font-style: normal; font-variant: normal;">old. Scott is fourteen years old.<br /><span style="color: #000000; font-style: normal; font-variant: normal;">Carly has two pets. Jinx is a small, black cat.<br /><span style="color: #000000; font-style: normal; font-variant: normal;">Diego is a large, brown dog.<br /><span style="color: #000000; font-style: normal; font-variant: normal;">Carly loves her family!</span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>', '<p><span style="font-size: 14pt;">How many people are in Carly''s family?</span></p>', 2, 'Four', 'Five', 'Six', NULL, '', 'Five', NULL, '', NULL, '1461581801', 'Mon 25th Apr, 2016 - 12:56 41 PM', NULL, NULL, 'admin', NULL),
(415, 'EDU 113', '2016', '100', 'Exam', 5, 'typeIn', 13, '', '<p>Governor _____________ is the governor of kwara state</p>', 2, '', '', '', '', '', '', 'abdulfatai', '', NULL, '1462626421', 'Sat 7th May, 2016 - 3:07 01 PM', '1465321929', 'Tue 7th Jun, 2016 - 7:52 09 PM', 'admin', 'admin'),
(416, 'EDU 114', '2016', '100', 'Test', 4, 'choice', 1, '', '<p><span style=\\"font-size: 14pt;\\">Which of these numbers is <strong>not</strong> a prime number</span></p>', 3, '17', '91', '67', '11', NULL, '91', '', '', NULL, '1465151587', 'Sun 5th Jun, 2016 - 8:33 07 PM', NULL, NULL, 'admin', NULL);

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
  `sn` int(10) NOT NULL,
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

INSERT INTO `users` (`sn`, `user_id`, `password`, `enc_psw`, `surname`, `firstname`, `midname`, `sex`, `dob`, `day`, `month`, `year`, `email`, `faculty`, `department`, `level`, `homeaddress`, `phone`, `passport`, `datereg`, `timereg`, `scheduledate`, `batch`, `logtime`, `logdate`, `logstatus`, `pc_name`, `pc_ip`) VALUES
(1, 'KWCOETL/AP2016/0001', 'abubakar', '34d302424ba0733ebaa8327fb13f12e8', 'ABUBAKAR ', 'Fatima ', 'Bana', 'M', '01/01/1985', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567890', 'AP2016_0001.jpeg', NULL, NULL, NULL, NULL, '1465321014', 'Tue 7th Jun, 2016 - 7:36 54 PM', 'lout', 'DESKTOP-Q2QT61F', NULL),
(2, 'KWCOETL/AP2016/0002', 'oseni', '0f0656ce098f3541c257314a1c2e5f82', 'OSENI', 'Saheed', NULL, 'M', '01/01/1986', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567891', 'AP2016_0002.jpeg', NULL, NULL, NULL, NULL, '1465361440', 'Wed 8th Jun, 2016 - 6:50 40 AM', 'lout', 'DESKTOP-Q2QT61F', NULL),
(3, 'KWCOETL/AP2016/0003', 'mohammed', 'd79cd06799863224b7324d969c1e2084', 'MOHAMMED', 'Hawawu', 'Haja', 'F', '01/01/1987', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567892', 'AP2016_0003.jpeg', NULL, NULL, NULL, NULL, '1465361236', 'Wed 8th Jun, 2016 - 6:47 16 AM', 'lout', 'DESKTOP-Q2QT61F', NULL),
(4, 'KWCOETL/AP2016/0004', 'jimoh', '827e7b89978c2d7867caa6d264861911', 'JIMOH', 'Muhinat', NULL, 'F', '01/01/1988', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567893', 'AP2016_0004.jpeg', NULL, NULL, NULL, NULL, '1465363689', 'Wed 8th Jun, 2016 - 7:28 09 AM', 'lout', 'DESKTOP-Q2QT61F', NULL),
(5, 'KWCOETL/AP2016/0005', 'abubakar', '34d302424ba0733ebaa8327fb13f12e8', 'ABUBAKAR ', 'Ndaman', NULL, 'M', '01/01/1989', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567894', 'AP2016_0001.jpeg', NULL, NULL, NULL, NULL, '1465361880', 'Wed 8th Jun, 2016 - 6:58 00 AM', 'lout', 'DESKTOP-Q2QT61F', NULL),
(6, 'KWCOETL/AP2016/0006', 'yakubu', 'd226742d4715dd70100150ebf63dfa94', NULL, 'YAKUBU', 'Joy', 'F', '01/01/1990', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567895', 'AP2016_0002.jpeg', NULL, NULL, NULL, NULL, '1465320402', 'Tue 7th Jun, 2016 - 7:26 42 PM', 'lout', 'DESKTOP-Q2QT61F', NULL),
(7, 'KWCOETL/AP2016/0007', 'usman', '2f1fed5365c79d8fea7859dcc8788d77', 'USMAN ', 'Soliu', 'Olarewaju', 'M', '01/01/1991', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567896', 'AP2016_0003.jpeg', NULL, NULL, NULL, NULL, '1465362153', 'Wed 8th Jun, 2016 - 7:02 33 AM', 'lout', 'DESKTOP-Q2QT61F', NULL),
(8, 'KWCOETL/AP2016/0008', 'babagbemi', '2b5d0b995c48a6939f5150706726d6af', 'BABAGBEMI', 'Feyishayo', NULL, 'M', '01/01/1992', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567897', 'AP2016_0004.jpeg', NULL, NULL, NULL, NULL, '1465363601', 'Wed 8th Jun, 2016 - 7:26 41 AM', 'lout', 'DESKTOP-Q2QT61F', NULL),
(9, 'KWCOETL/AP2016/0009', 'ogunniyi', 'a32d9efd7ef36b22d14134c2f5ec67cb', 'OGUNNIYI', 'Adenike', 'Bilikis', 'M', '01/01/1993', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567898', 'AP2016_0001.jpeg', NULL, NULL, NULL, NULL, '1465362644', 'Wed 8th Jun, 2016 - 7:10 44 AM', 'lout', 'DESKTOP-Q2QT61F', NULL),
(10, 'KWCOETL/AP2016/0010', 'mathias', '534ba0736a590a84e4140f3457a7a626', 'MATHIAS', 'Wisdom', NULL, 'F', '01/01/1994', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567899', 'AP2016_0002.jpeg', NULL, NULL, NULL, NULL, '1465374182', 'Wed 8th Jun, 2016 - 10:23 02 AM', 'lout', 'DESKTOP-Q2QT61F', NULL),
(11, 'KWCOETL/AP2016/0011', 'friday', 'f6f7fec07f372b7bd5eb196bbca0f3f4', 'FRIDAY', 'Joseph', 'Anu', 'F', '01/01/1995', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567900', 'AP2016_0003.jpeg', NULL, NULL, NULL, NULL, '1465362876', 'Wed 8th Jun, 2016 - 7:14 36 AM', 'lout', 'DESKTOP-Q2QT61F', NULL),
(12, '56149087CJ', 'ishola', '19b4c6c95a51c83ff787e7636f0a4e3b', 'ISHOLA', 'Blessing', 'Oluwakem', 'F', '01/01/1996', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567901', 'AP2016_0004.jpeg', NULL, NULL, NULL, NULL, '1465322552', 'Tue 7th Jun, 2016 - 8:02 32 PM', 'lout', 'DESKTOP-Q2QT61F', NULL),
(13, '56299321IG', 'ogundipe', '11e945fa5b6f9d7a07edbac2f5411f65', 'OGUNDIPE', 'Andrew', 'Tosin', 'F', '01/01/1997', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567902', 'AP2016_0001.jpeg', NULL, NULL, NULL, NULL, '1465360911', 'Wed 8th Jun, 2016 - 6:41 51 AM', 'lout', 'DESKTOP-Q2QT61F', NULL);

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

--
-- Dumping data for table `users_course_reg`
--

INSERT INTO `users_course_reg` (`sn`, `session`, `status`, `startime`, `endtime`, `start`, `stop`) VALUES
(1, '2015/2016', 'normal', '15-01-31, 08:00', '15-02-04, 08:00', '1422687600', '1423033200');

-- --------------------------------------------------------

--
-- Table structure for table `users_courses`
--

CREATE TABLE `users_courses` (
  `sn` int(8) NOT NULL,
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
  `sn` int(10) NOT NULL,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `scheduledate` varchar(100) DEFAULT NULL,
  `currently` varchar(50) DEFAULT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  `qtype` varchar(25) NOT NULL,
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

INSERT INTO `users_result` (`sn`, `user_id`, `scheduledate`, `currently`, `code`, `qtype`, `year`, `total_qtn`, `level`, `totalmark`, `unitmark`, `totalscore`, `unitscore`, `point`, `grade`, `paperlogintime`, `paperlogouttime`, `paper_signal`, `percent`, `total_sec`, `sec_used`, `bus_stop`, `department`) VALUES
(1, '56149087CJ', '07 - Jun - 2016', 'off', 'EDU 121', 'TEST', '2016', 10, 'NCE1', 0, 0, 0, NULL, 0, '', NULL, NULL, 'normal', NULL, 300, NULL, NULL, NULL),
(2, '56299321IG', '07 - Jun - 2016', 'off', 'EDU 121', 'TEST', '2016', 10, 'NCE1', 0, 0, 0, NULL, 0, '', NULL, NULL, 'normal', NULL, 300, NULL, NULL, NULL),
(3, 'KWCOETL/AP2016/0001', '07 - Jun - 2016', 'off', 'EDU 121', 'TEST', '2016', 10, 'NCE1', 22, 0, 20, 9, 0, '', 'Tue 7th Jun, 2016 - 7:01 59 PM', 'Tue 7th Jun, 2016 - 7:04 56 PM', 'done', 91, 300, 173, 3, NULL),
(4, 'KWCOETL/AP2016/0002', '07 - Jun - 2016', 'off', 'EDU 121', 'TEST', '2016', 10, 'NCE1', 0, 0, 0, NULL, 0, '', NULL, NULL, 'normal', NULL, 300, NULL, NULL, NULL),
(5, 'KWCOETL/AP2016/0003', '07 - Jun - 2016', 'off', 'EDU 121', 'TEST', '2016', 10, 'NCE1', 0, 0, 0, NULL, 0, '', NULL, NULL, 'normal', NULL, 300, NULL, NULL, NULL),
(6, 'KWCOETL/AP2016/0004', '07 - Jun - 2016', 'off', 'EDU 121', 'TEST', '2016', 10, 'NCE1', 0, 0, 0, NULL, 0, '', NULL, NULL, 'normal', NULL, 300, NULL, NULL, NULL),
(7, 'KWCOETL/AP2016/0005', '07 - Jun - 2016', 'off', 'EDU 121', 'TEST', '2016', 10, 'NCE1', 0, 0, 0, NULL, 0, '', NULL, NULL, 'normal', NULL, 300, NULL, NULL, NULL),
(8, 'KWCOETL/AP2016/0006', '07 - Jun - 2016', 'off', 'EDU 121', 'TEST', '2016', 10, 'NCE1', 22, 0, 14, 6, 0, '', 'Tue 7th Jun, 2016 - 6:57 42 PM', 'Tue 7th Jun, 2016 - 7:01 07 PM', 'done', 64, 300, 201, 10, NULL),
(9, 'KWCOETL/AP2016/0007', '07 - Jun - 2016', 'off', 'EDU 121', 'TEST', '2016', 10, 'NCE1', 0, 0, 0, NULL, 0, '', NULL, NULL, 'normal', NULL, 300, NULL, NULL, NULL),
(10, 'KWCOETL/AP2016/0008', '07 - Jun - 2016', 'off', 'EDU 121', 'TEST', '2016', 10, 'NCE1', 0, 0, 0, NULL, 0, '', NULL, NULL, 'normal', NULL, 300, NULL, NULL, NULL),
(11, 'KWCOETL/AP2016/0009', '07 - Jun - 2016', 'off', 'EDU 121', 'TEST', '2016', 10, 'NCE1', 0, 0, 0, NULL, 0, '', NULL, NULL, 'normal', NULL, 300, NULL, NULL, NULL),
(12, 'KWCOETL/AP2016/0010', '07 - Jun - 2016', 'off', 'EDU 121', 'TEST', '2016', 10, 'NCE1', 0, 0, 0, NULL, 0, '', NULL, NULL, 'normal', NULL, 300, NULL, NULL, NULL),
(13, 'KWCOETL/AP2016/0011', '07 - Jun - 2016', 'off', 'EDU 121', 'TEST', '2016', 10, 'NCE1', 0, 0, 0, NULL, 0, '', NULL, NULL, 'normal', NULL, 300, NULL, NULL, NULL),
(14, '56149087CJ', '07 - Jun - 2016', 'off', 'EDU 113', 'Exam', '2016', 12, 'NCE1', 27, 0, 10, 5, 0, '', 'Tue 7th Jun, 2016 - 7:56 04 PM', 'Tue 7th Jun, 2016 - 8:01 05 PM', 'done', 37, 360, 284, 12, NULL),
(15, '56299321IG', '07 - Jun - 2016', 'off', 'EDU 113', 'Exam', '2016', 12, 'NCE1', 25, 0, 19, 9, 0, '', 'Wed 8th Jun, 2016 - 6:35 34 AM', 'Wed 8th Jun, 2016 - 6:41 37 AM', 'done', 76, 360, 361, 12, NULL),
(16, 'KWCOETL/AP2016/0001', '07 - Jun - 2016', 'off', 'EDU 113', 'Exam', '2016', 12, 'NCE1', 31, 0, 18, 7, 0, '', 'Tue 7th Jun, 2016 - 7:31 36 PM', 'Tue 7th Jun, 2016 - 7:36 45 PM', 'done', 58, 360, 308, 1, NULL),
(17, 'KWCOETL/AP2016/0002', '07 - Jun - 2016', 'off', 'EDU 113', 'Exam', '2016', 12, 'NCE1', 28, 0, 24, 10, 0, '', 'Wed 8th Jun, 2016 - 6:47 50 AM', 'Wed 8th Jun, 2016 - 6:50 32 AM', 'done', 86, 360, 160, 11, NULL),
(18, 'KWCOETL/AP2016/0003', '07 - Jun - 2016', 'off', 'EDU 113', 'Exam', '2016', 12, 'NCE1', 61, 0, 20, 7, 0, '', 'Wed 8th Jun, 2016 - 6:44 01 AM', 'Wed 8th Jun, 2016 - 6:47 08 AM', 'done', 33, 360, 185, 1, NULL),
(19, 'KWCOETL/AP2016/0004', '07 - Jun - 2016', 'off', 'EDU 113', 'Exam', '2016', 12, 'NCE1', 58, 0, 28, 11, 0, '', 'Wed 8th Jun, 2016 - 7:27 00 AM', 'Wed 8th Jun, 2016 - 7:28 02 AM', 'done', 48, 360, 61, 4, NULL),
(20, 'KWCOETL/AP2016/0005', '07 - Jun - 2016', 'off', 'EDU 113', 'Exam', '2016', 12, 'NCE1', 63, 0, 17, 7, 0, '', 'Wed 8th Jun, 2016 - 6:51 15 AM', 'Wed 8th Jun, 2016 - 6:57 17 AM', 'done', 27, 360, 360, 1, NULL),
(21, 'KWCOETL/AP2016/0006', '07 - Jun - 2016', 'off', 'EDU 113', 'Exam', '2016', 12, 'NCE1', 31, 0, 11, 4, 0, '', 'Tue 7th Jun, 2016 - 7:20 19 PM', 'Tue 7th Jun, 2016 - 7:26 20 PM', 'done', 35, 360, 360, 9, NULL),
(22, 'KWCOETL/AP2016/0007', '07 - Jun - 2016', 'off', 'EDU 113', 'Exam', '2016', 12, 'NCE1', 58, 0, 26, 10, 0, '', 'Wed 8th Jun, 2016 - 7:00 03 AM', 'Wed 8th Jun, 2016 - 7:02 11 AM', 'done', 45, 360, 128, 2, NULL),
(23, 'KWCOETL/AP2016/0008', '07 - Jun - 2016', 'off', 'EDU 113', 'Exam', '2016', 12, 'NCE1', 58, 0, 16, 7, 0, '', 'Wed 8th Jun, 2016 - 7:17 47 AM', 'Wed 8th Jun, 2016 - 7:23 49 AM', 'done', 28, 360, 360, 12, NULL),
(24, 'KWCOETL/AP2016/0009', '07 - Jun - 2016', 'off', 'EDU 113', 'Exam', '2016', 12, 'NCE1', 41, 0, 9, 3, 0, '', 'Wed 8th Jun, 2016 - 7:03 46 AM', 'Wed 8th Jun, 2016 - 7:04 40 AM', 'done', 22, 360, 55, 1, NULL),
(25, 'KWCOETL/AP2016/0010', '07 - Jun - 2016', 'off', 'EDU 113', 'Exam', '2016', 12, 'NCE1', 28, 0, 24, 10, 0, '', 'Wed 8th Jun, 2016 - 7:14 58 AM', 'Wed 8th Jun, 2016 - 7:16 30 AM', 'done', 86, 360, 88, 12, NULL),
(26, 'KWCOETL/AP2016/0011', '07 - Jun - 2016', 'off', 'EDU 113', 'Exam', '2016', 12, 'NCE1', 28, 0, 22, 9, 0, '', 'Wed 8th Jun, 2016 - 7:12 17 AM', 'Wed 8th Jun, 2016 - 7:13 45 AM', 'done', 79, 360, 83, 12, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userslogs`
--

CREATE TABLE `userslogs` (
  `sn` int(10) NOT NULL,
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
(56, 'kwcoetl/ap2016/0010', '1465374182', 'Wed 8th Jun, 2016 - 10:23 02 AM', 'lout', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`sn`,`user_id`);

--
-- Indexes for table `course_schedule`
--
ALTER TABLE `course_schedule`
  ADD PRIMARY KEY (`sn`,`code`);

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
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`sn`,`code`);

--
-- Indexes for table `qtn_remind`
--
ALTER TABLE `qtn_remind`
  ADD PRIMARY KEY (`sn`,`user_id`,`qtype`,`code`);

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
  ADD PRIMARY KEY (`sn`,`user_id`,`code`);

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
-- AUTO_INCREMENT for table `course_schedule`
--
ALTER TABLE `course_schedule`
  MODIFY `sn` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `sn` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `sn` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `sn` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `qtn_remind`
--
ALTER TABLE `qtn_remind`
  MODIFY `sn` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1730;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `sn` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=417;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `sn` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `users_course_reg`
--
ALTER TABLE `users_course_reg`
  MODIFY `sn` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users_courses`
--
ALTER TABLE `users_courses`
  MODIFY `sn` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `users_result`
--
ALTER TABLE `users_result`
  MODIFY `sn` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `userslogs`
--
ALTER TABLE `userslogs`
  MODIFY `sn` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
