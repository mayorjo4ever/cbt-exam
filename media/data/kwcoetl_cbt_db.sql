-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2016 at 11:25 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kwcoetl_cbt`
--
CREATE DATABASE IF NOT EXISTS `kwcoetl_cbt` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `kwcoetl_cbt`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `sn` int(10) NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) DEFAULT NULL,
  `enc_psw` varchar(100) DEFAULT NULL,
  `picname` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`sn`, `username`, `password`, `enc_psw`, `picname`) VALUES
(1, 'admin@lafg.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', NULL),
(2, 'tunde@unilorin.edu.ng', '3745', '6d3a2d24eb109dddf78374fe5d0ee067', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_schedule`
--

CREATE TABLE `course_schedule` (
  `sn` int(10) NOT NULL,
  `user_id` varchar(100) NOT NULL DEFAULT '',
  `coursecode` varchar(30) DEFAULT NULL,
  `uniqueid` varchar(50) DEFAULT NULL,
  `year` varchar(10) DEFAULT NULL,
  `total_qtn` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_schedule`
--

INSERT INTO `course_schedule` (`sn`, `user_id`, `coursecode`, `uniqueid`, `year`, `total_qtn`) VALUES
(2, 'KWCOETL/AP2016/0001', 'GEST', 'bachB', '2015', 50),
(4, 'KWCOETL/AP2016/0003', 'GEST', 'bachB', '2015', 50),
(5, 'KWCOETL/AP2016/0004', 'GEST', 'bachB', '2015', 50),
(6, 'KWCOETL/AP2016/0006', 'GEST', 'bachB', '2015', 50),
(7, 'KWCOETL/AP2016/0002', 'GEST', 'bachB', '2015', 50),
(8, '15/55EC002', 'GEST', 'bachB', '2015', 50);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `sn` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL,
  `unit` int(2) NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  `faculty` varchar(100) DEFAULT NULL,
  `department` varchar(100) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`sn`, `name`, `code`, `unit`, `status`, `faculty`, `department`, `level`) VALUES
(27, 'Mathematics of Computing', 'MAT115', 2, 'E', NULL, '', 'NCE1'),
(28, 'Advanced Programming 2', 'CSC112', 3, 'C', NULL, '', 'NCE1'),
(30, 'Introduction to Fortran Programming', 'CSC225', 3, 'C', NULL, '', 'NCE2');

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
-- Table structure for table `passages`
--

CREATE TABLE `passages` (
  `sn` int(10) NOT NULL,
  `id` varchar(20) NOT NULL,
  `content` text,
  `code` varchar(30) DEFAULT NULL,
  `year` varchar(12) DEFAULT NULL,
  `level` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `qtn_remind`
--

CREATE TABLE `qtn_remind` (
  `sn` int(10) NOT NULL,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `year` varchar(12) DEFAULT NULL,
  `uniqueid` varchar(50) NOT NULL DEFAULT '0',
  `coursecode` varchar(50) NOT NULL DEFAULT '',
  `code_gen` varchar(100) NOT NULL,
  `qtnum` int(5) DEFAULT NULL,
  `tot_option` int(1) DEFAULT NULL,
  `question` text,
  `option1` varchar(255) DEFAULT NULL,
  `option2` varchar(255) DEFAULT NULL,
  `option3` varchar(255) DEFAULT NULL,
  `option4` varchar(255) DEFAULT NULL,
  `option5` varchar(255) DEFAULT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `picked` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qtn_remind`
--

INSERT INTO `qtn_remind` (`sn`, `user_id`, `year`, `uniqueid`, `coursecode`, `code_gen`, `qtnum`, `tot_option`, `question`, `option1`, `option2`, `option3`, `option4`, `option5`, `attachment`, `answer`, `picked`) VALUES
(61, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 12, 4, 'A hexagonal kite has --- sides', '5', '6', '4', '7', NULL, NULL, '6', '6'),
(62, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 9, 4, 'Choose the odd one among the followings,', 'Cougar', 'Hyena', 'Cheetah', 'Leopard', NULL, NULL, 'Hyena', 'Hyena'),
(63, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 1, 4, '<p>THE NAME OF A YOUNG LION IS CALLED</p>', 'KITTEN', 'KELVIN', 'CUB', 'CUDE', '', NULL, 'CUB', 'CUB'),
(64, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 19, 4, 'The earth is the ------ planet from the sun', '3rd', '4th', '2nd', '5th', NULL, NULL, '3rd', '3rd'),
(65, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 39, 4, 'In which of the following African countries will you find a confluence of two oceans', 'South Africa', 'Nigeria', 'Somalia', 'Senegal', NULL, NULL, 'South Africa', 'Nigeria'),
(66, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 49, 4, 'A forest is to a tree as a tree is to a', 'Leaf', 'Orchard', 'Jungle', 'Plant', NULL, NULL, 'Leaf', 'Plant'),
(67, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 4, 4, 'WHICH OF THE FOLLOWING IS NOT A MAMMAL', 'WHALE      ', 'DOG', 'CAT', 'SHARK', NULL, NULL, 'SHARK', 'DOG'),
(68, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 42, 4, 'The geographic equator passes through which of the following countries', 'Uganda', 'Zambia', 'Nigeria', 'Cameroon', NULL, NULL, 'Uganda', 'Nigeria'),
(69, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 20, 4, 'The following deceases are transmitted by mosquitoes except', 'Yellow fever', 'Dengue fever', 'West Nile fever', 'Hepatitis fever', NULL, NULL, 'Hepatitis fever', 'Yellow fever'),
(70, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 17, 4, 'The  -------------- originated the division of time as base of 60', 'Babylonians', 'Americans', 'Romans', 'Arabs', NULL, NULL, 'Babylonians', 'Romans'),
(71, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 8, 4, 'WHAT IS THE ANGLE IN DEGREES ON A STRAIGHT LINE', '90', '60', '180', '30', NULL, NULL, '180', '180'),
(72, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 23, 4, 'A retailer sells at a discount of 15% of the marked price, if a customer pays N16,700.00 for an item, what is the marked price of the item?', 'N 19,650.00', 'N 13,750.00', 'N 20,700.00', 'N 22,700.00', NULL, NULL, 'N 19,650.00', 'N 19,650.00'),
(73, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 14, 4, 'A man bought 100 eggs at N1500.00, 10 eggs were damaged. He sold the rest at N20.00 each. Calculate the percentage profit made.', '17', '15', '20', '12', NULL, NULL, '20', '12'),
(74, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 40, 4, 'Choose the odd one out among the followings:', 'Peru', 'Venezuela', 'Bolivia', 'Indonesia', NULL, NULL, 'Indonesia', 'Indonesia'),
(75, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 15, 4, 'In a leap year a baker baked 500,000 loaves of bread, how many loaves did the baker bake in February, if his working days are Mondays to Saturdays?', '1592', '39800', '38208', '46168', NULL, NULL, '38208', '1592'),
(76, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 37, 4, 'The Nigerian currency in use before the change to the Naira was the', 'Pound', 'Dollar', 'Riyal', 'CFA', NULL, NULL, 'Pound', 'CFA'),
(77, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 50, 4, 'A rancher plans to add a post between every two posts of an open-ended (straight) fence. If he currently has 10 posts in the fence, how many does he need to insert?', '5', '9', '10', '20', NULL, NULL, '9', '9'),
(78, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 35, 4, 'Nnamdi Azikwe International Airport is found in', 'Enugu', 'Port Harcourt', 'Abuja', 'Sokoto', NULL, NULL, 'Abuja', 'Abuja'),
(79, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 18, 4, 'In the computer browser address field, what does the abbreviation www stands for', 'world wide web', 'word wide web', 'web wide world', 'wide web world', NULL, NULL, 'world wide web', 'world wide web'),
(80, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 7, 4, 'WHICH OF THE FOLLOWING IS NOT AN EXCRETORY PRODUCT?', 'SWEAT', 'UREA', 'URINE', 'FAECES                                              ', NULL, NULL, 'FAECES                                              ', 'SWEAT'),
(81, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 32, 4, 'Kofi Annan is well known for his role as', 'President of Ghana', 'Secretary General of United Nations', 'Secretary General of the African Union', 'President of the United Nations', NULL, NULL, 'Secretary General of United Nations', 'Secretary General of United Nations'),
(82, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 5, 4, 'THE NAME OF AN EQUIPMENT FOR MEASURING PRESSURE IS CALLED', 'BAROMETER     ', 'THERMOMETER ', 'GAUGE ', 'HYGROMETER               ', NULL, NULL, 'BAROMETER     ', 'BAROMETER     '),
(83, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 34, 4, 'In which part of Nigeria will you find relics of groundnut pyramids', 'Kano', 'Jos', 'Sokoto', 'Maiduguri', NULL, NULL, 'Kano', 'Kano'),
(84, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 29, 4, 'The last military head of state in Nigeria was', 'Sanni Abacha', 'Ibrahim Babangida', 'Abubakar Abdulsalam ', 'Muritala Muhammed', NULL, NULL, 'Abubakar Abdulsalam ', 'Ibrahim Babangida'),
(85, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 16, 4, 'In Nigeria democracy day is marked on', '42167', '42153', '42184', '42151', NULL, NULL, '42153', '42167'),
(86, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 21, 4, 'In a coding system numbers 0 to 9 are coded a to j respectively, what will be the code for the number 4238', 'ebdj', 'fdei', 'ecdi', 'dbch', NULL, NULL, 'ecdi', 'fdei'),
(87, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 44, 4, 'Which of the followings is a star?', 'Earth', 'Sun', 'Moon', 'Nebula', NULL, NULL, 'Sun', 'Moon'),
(88, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 11, 4, ' In which part of Africa will you find Tanzania', 'West Africa', 'North Africa', 'Southern Africa', 'East Africa', NULL, NULL, 'East Africa', 'North Africa'),
(89, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 27, 4, 'Who was the head of state when Nigeria first won the African Cup of Nations,', 'Shehu Shagari', 'Muhammadu Buhari', 'Muritala Muhammed', 'Ibrahim Babangida', NULL, NULL, 'Shehu Shagari', 'Muritala Muhammed'),
(90, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 25, 4, 'Late Idi Amin Dada was from which of the following countries', 'Kenya', 'Tanzania', 'Uganda', 'Congo Brazzaville', NULL, NULL, 'Uganda', 'Congo Brazzaville'),
(91, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 41, 4, 'The capital city of Rwanda is ', 'Khartoum', 'Kabul', 'Kigali', 'Kingston', NULL, NULL, 'Kigali', 'Kingston'),
(92, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 43, 4, 'Which of the followings is not a planet', 'Pluto', 'Mercury', 'Venus', 'Moon', NULL, NULL, 'Moon', 'Moon'),
(93, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 33, 4, 'Complete the followings; Ooni and Osun, Sultan and Sokoto, Obi and Anambra, El Kanemi and  --------', 'Kaduna', 'Borno', 'Katsina', 'Yobe', NULL, NULL, 'Borno', 'Katsina'),
(94, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 30, 4, 'GSM telephony was introduced into Nigeria communication system during the regime of ', 'Ibrahim Babangida', 'Olusegun Obasanjo', 'Umaru Yarâ€™adua', 'Goodluck Jonathan', NULL, NULL, 'Olusegun Obasanjo', 'Olusegun Obasanjo'),
(95, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 2, 4, 'AVIAN FLU IS A DISEASE IN WHICH OF THE FOLLOWING', 'MAMMALS   ', 'BIRDS', 'PICES', 'AMPHIBIANS                                      ', NULL, NULL, 'BIRDS', 'BIRDS'),
(96, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 3, 4, 'WHAT O.005KILOGRAMMES TO GRAMMES', '5900', '500', '50', '5', NULL, NULL, '5', '5900'),
(97, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 10, 4, 'Which among the following does not belong to the group,', 'Brigadier', 'Colonel', 'Navy Captain', 'Group Captain', NULL, NULL, 'Brigadier', 'Group Captain'),
(98, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 46, 4, 'The earth is mainly covered with', 'Water', 'Land', 'Equal amount of land and water', 'Mountains', NULL, NULL, 'Water', 'Water'),
(99, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 28, 4, 'Which is the odd one out among the followings,', 'African National Congress', 'Social Democratic Party', 'National Republican Convention', 'All Peoples Party', NULL, NULL, 'African National Congress', 'National Republican Convention'),
(100, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 13, 4, 'The followings are true concerning a trapezium except', 'It does not have any line of symmetry', 'All the sides are of different lengths', 'All the angles are of different sizes', 'It has two angles equal but others different', NULL, NULL, 'It has two angles equal but others different', 'It does not have any line of symmetry'),
(101, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 47, 4, 'Car is to road as train is to', 'Wheels     ', 'Rails', 'Surface', 'Locomotive       ', NULL, NULL, 'Rails', 'Rails'),
(102, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 24, 4, 'Given that G is directly proportional to the square of H. If G is 5 when H is 3, Find H when G is 100', '150', '125', '180', '225', NULL, NULL, '180', '150'),
(103, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 45, 4, 'The River Niger has its source from', 'Fouta Djallon Island', 'Lake Guinea', 'Upper Volta', 'Timbuktu', NULL, NULL, 'Fouta Djallon Island', 'Upper Volta'),
(104, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 31, 4, 'The following Nigerian footballers have won the African Footballer Award except', 'Victor Ikpeba', 'Nwankwo Kanu', 'Rasheed Yekini', 'Austin Okocha', NULL, NULL, 'Austin Okocha', 'Victor Ikpeba'),
(105, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 22, 4, 'Obtain the missing number  in the following sequence:  2, 3, 5, 8, ----, 17, 23, 30', '13', '12', '11', '14', NULL, NULL, '12', '12'),
(106, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 36, 4, 'The rotation of the earth on its axis is used in the measurement of ', 'Time', 'Weather', 'Temperature', 'Pressure', NULL, NULL, 'Time', 'Temperature'),
(107, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 26, 4, 'River Nile has its source from', 'Lake Chad', 'Lake Victoria', 'Lake Tanganyika', 'Lake Albert', NULL, NULL, 'Lake Victoria', 'Lake Chad'),
(108, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 48, 4, 'Which is the odd one out?', 'Hockey', 'Exercise', 'Tennis', 'Football', NULL, NULL, 'Exercise', 'Exercise'),
(109, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 38, 4, 'An oncologist is a medical practitioner specialized in the treatment of', 'Tumours', 'Fibroids', 'Obesities', 'Ulcers', NULL, NULL, 'Tumours', 'Obesities'),
(110, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 'KWCOETL/AP2016/0002_single_1441047047', 6, 4, 'WHAT IS THE VALUE OF DCXL', '640', '504', '540', '600', NULL, NULL, '640', '540'),
(111, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 46, 4, 'The earth is mainly covered with', 'Water', 'Land', 'Equal amount of land and water', 'Mountains', NULL, NULL, 'Water', 'Water'),
(112, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 45, 4, 'The River Niger has its source from', 'Fouta Djallon Island', 'Lake Guinea', 'Upper Volta', 'Timbuktu', NULL, NULL, 'Fouta Djallon Island', 'Upper Volta'),
(113, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 10, 4, 'Which among the following does not belong to the group,', 'Brigadier', 'Colonel', 'Navy Captain', 'Group Captain', NULL, NULL, 'Brigadier', 'Group Captain'),
(114, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 18, 4, 'In the computer browser address field, what does the abbreviation www stands for', 'world wide web', 'word wide web', 'web wide world', 'wide web world', NULL, NULL, 'world wide web', 'world wide web'),
(115, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 17, 4, 'The  -------------- originated the division of time as base of 60', 'Babylonians', 'Americans', 'Romans', 'Arabs', NULL, NULL, 'Babylonians', 'Babylonians'),
(116, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 7, 4, 'WHICH OF THE FOLLOWING IS NOT AN EXCRETORY PRODUCT?', 'SWEAT', 'UREA', 'URINE', 'FAECES                                              ', NULL, NULL, 'FAECES                                              ', 'SWEAT'),
(117, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 21, 4, 'In a coding system numbers 0 to 9 are coded a to j respectively, what will be the code for the number 4238', 'ebdj', 'fdei', 'ecdi', 'dbch', NULL, NULL, 'ecdi', 'fdei'),
(118, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 41, 4, 'The capital city of Rwanda is ', 'Khartoum', 'Kabul', 'Kigali', 'Kingston', NULL, NULL, 'Kigali', 'Kingston'),
(119, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 15, 4, 'In a leap year a baker baked 500,000 loaves of bread, how many loaves did the baker bake in February, if his working days are Mondays to Saturdays?', '1592', '39800', '38208', '46168', NULL, NULL, '38208', '1592'),
(120, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 12, 4, 'A hexagonal kite has --- sides', '5', '6', '4', '7', NULL, NULL, '6', '4'),
(121, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 4, 4, 'WHICH OF THE FOLLOWING IS NOT A MAMMAL', 'WHALE      ', 'DOG', 'CAT', 'SHARK', NULL, NULL, 'SHARK', 'WHALE      '),
(122, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 49, 4, 'A forest is to a tree as a tree is to a', 'Leaf', 'Orchard', 'Jungle', 'Plant', NULL, NULL, 'Leaf', 'Orchard'),
(123, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 11, 4, ' In which part of Africa will you find Tanzania', 'West Africa', 'North Africa', 'Southern Africa', 'East Africa', NULL, NULL, 'East Africa', 'West Africa'),
(124, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 37, 4, 'The Nigerian currency in use before the change to the Naira was the', 'Pound', 'Dollar', 'Riyal', 'CFA', NULL, NULL, 'Pound', 'Dollar'),
(125, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 32, 4, 'Kofi Annan is well known for his role as', 'President of Ghana', 'Secretary General of United Nations', 'Secretary General of the African Union', 'President of the United Nations', NULL, NULL, 'Secretary General of United Nations', 'Secretary General of the African Union'),
(126, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 13, 4, 'The followings are true concerning a trapezium except', 'It does not have any line of symmetry', 'All the sides are of different lengths', 'All the angles are of different sizes', 'It has two angles equal but others different', NULL, NULL, 'It has two angles equal but others different', 'All the sides are of different lengths'),
(127, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 3, 4, 'WHAT O.005KILOGRAMMES TO GRAMMES', '5900', '500', '50', '5', NULL, NULL, '5', '5900'),
(128, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 25, 4, 'Late Idi Amin Dada was from which of the following countries', 'Kenya', 'Tanzania', 'Uganda', 'Congo Brazzaville', NULL, NULL, 'Uganda', 'Tanzania'),
(129, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 8, 4, 'WHAT IS THE ANGLE IN DEGREES ON A STRAIGHT LINE', '90', '60', '180', '30', NULL, NULL, '180', '180'),
(130, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 34, 4, 'In which part of Nigeria will you find relics of groundnut pyramids', 'Kano', 'Jos', 'Sokoto', 'Maiduguri', NULL, NULL, 'Kano', 'Sokoto'),
(131, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 24, 4, 'Given that G is directly proportional to the square of H. If G is 5 when H is 3, Find H when G is 100', '150', '125', '180', '225', NULL, NULL, '180', '180'),
(132, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 14, 4, 'A man bought 100 eggs at N1500.00, 10 eggs were damaged. He sold the rest at N20.00 each. Calculate the percentage profit made.', '17', '15', '20', '12', NULL, NULL, '20', '17'),
(133, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 28, 4, 'Which is the odd one out among the followings,', 'African National Congress', 'Social Democratic Party', 'National Republican Convention', 'All Peoples Party', NULL, NULL, 'African National Congress', 'All Peoples Party'),
(134, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 29, 4, 'The last military head of state in Nigeria was', 'Sanni Abacha', 'Ibrahim Babangida', 'Abubakar Abdulsalam ', 'Muritala Muhammed', NULL, NULL, 'Abubakar Abdulsalam ', 'Muritala Muhammed'),
(135, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 47, 4, 'Car is to road as train is to', 'Wheels     ', 'Rails', 'Surface', 'Locomotive       ', NULL, NULL, 'Rails', 'Rails'),
(136, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 42, 4, 'The geographic equator passes through which of the following countries', 'Uganda', 'Zambia', 'Nigeria', 'Cameroon', NULL, NULL, 'Uganda', 'Nigeria'),
(137, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 23, 4, 'A retailer sells at a discount of 15% of the marked price, if a customer pays N16,700.00 for an item, what is the marked price of the item?', 'N 19,650.00', 'N 13,750.00', 'N 20,700.00', 'N 22,700.00', NULL, NULL, 'N 19,650.00', 'N 19,650.00'),
(138, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 5, 4, 'THE NAME OF AN EQUIPMENT FOR MEASURING PRESSURE IS CALLED', 'BAROMETER     ', 'THERMOMETER ', 'GAUGE ', 'HYGROMETER               ', NULL, NULL, 'BAROMETER     ', 'BAROMETER     '),
(139, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 30, 4, 'GSM telephony was introduced into Nigeria communication system during the regime of ', 'Ibrahim Babangida', 'Olusegun Obasanjo', 'Umaru Yarâ€™adua', 'Goodluck Jonathan', NULL, NULL, 'Olusegun Obasanjo', 'Olusegun Obasanjo'),
(140, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 6, 4, 'WHAT IS THE VALUE OF DCXL', '640', '504', '540', '600', NULL, NULL, '640', '600'),
(141, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 9, 4, 'Choose the odd one among the followings,', 'Cougar', 'Hyena', 'Cheetah', 'Leopard', NULL, NULL, 'Hyena', 'Hyena'),
(142, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 2, 4, 'AVIAN FLU IS A DISEASE IN WHICH OF THE FOLLOWING', 'MAMMALS   ', 'BIRDS', 'PICES', 'AMPHIBIANS                                      ', NULL, NULL, 'BIRDS', 'PICES'),
(143, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 43, 4, 'Which of the followings is not a planet', 'Pluto', 'Mercury', 'Venus', 'Moon', NULL, NULL, 'Moon', 'Moon'),
(144, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 16, 4, 'In Nigeria democracy day is marked on', '42167', '42153', '42184', '42151', NULL, NULL, '42153', '42184'),
(145, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 33, 4, 'Complete the followings; Ooni and Osun, Sultan and Sokoto, Obi and Anambra, El Kanemi and  --------', 'Kaduna', 'Borno', 'Katsina', 'Yobe', NULL, NULL, 'Borno', 'Kaduna'),
(146, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 36, 4, 'The rotation of the earth on its axis is used in the measurement of ', 'Time', 'Weather', 'Temperature', 'Pressure', NULL, NULL, 'Time', 'Temperature'),
(147, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 31, 4, 'The following Nigerian footballers have won the African Footballer Award except', 'Victor Ikpeba', 'Nwankwo Kanu', 'Rasheed Yekini', 'Austin Okocha', NULL, NULL, 'Austin Okocha', 'Victor Ikpeba'),
(148, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 22, 4, 'Obtain the missing number  in the following sequence:  2, 3, 5, 8, ----, 17, 23, 30', '13', '12', '11', '14', NULL, NULL, '12', '12'),
(149, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 44, 4, 'Which of the followings is a star?', 'Earth', 'Sun', 'Moon', 'Nebula', NULL, NULL, 'Sun', 'Moon'),
(150, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 50, 4, 'A rancher plans to add a post between every two posts of an open-ended (straight) fence. If he currently has 10 posts in the fence, how many does he need to insert?', '5', '9', '10', '20', NULL, NULL, '9', '5'),
(151, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 40, 4, 'Choose the odd one out among the followings:', 'Peru', 'Venezuela', 'Bolivia', 'Indonesia', NULL, NULL, 'Indonesia', 'Indonesia'),
(152, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 35, 4, 'Nnamdi Azikwe International Airport is found in', 'Enugu', 'Port Harcourt', 'Abuja', 'Sokoto', NULL, NULL, 'Abuja', 'Abuja'),
(153, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 48, 4, 'Which is the odd one out?', 'Hockey', 'Exercise', 'Tennis', 'Football', NULL, NULL, 'Exercise', 'Hockey'),
(154, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 26, 4, 'River Nile has its source from', 'Lake Chad', 'Lake Victoria', 'Lake Tanganyika', 'Lake Albert', NULL, NULL, 'Lake Victoria', 'Lake Victoria'),
(155, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 19, 4, 'The earth is the ------ planet from the sun', '3rd', '4th', '2nd', '5th', NULL, NULL, '3rd', '3rd'),
(156, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 1, 4, '<p>THE NAME OF A YOUNG LION IS CALLED</p>', 'KITTEN', 'KELVIN', 'CUB', 'CUDE', '', NULL, 'CUB', 'CUB'),
(157, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 27, 4, 'Who was the head of state when Nigeria first won the African Cup of Nations,', 'Shehu Shagari', 'Muhammadu Buhari', 'Muritala Muhammed', 'Ibrahim Babangida', NULL, NULL, 'Shehu Shagari', 'Muritala Muhammed'),
(158, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 39, 4, 'In which of the following African countries will you find a confluence of two oceans', 'South Africa', 'Nigeria', 'Somalia', 'Senegal', NULL, NULL, 'South Africa', 'Nigeria'),
(159, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 38, 4, 'An oncologist is a medical practitioner specialized in the treatment of', 'Tumours', 'Fibroids', 'Obesities', 'Ulcers', NULL, NULL, 'Tumours', 'Obesities'),
(160, '15/55ec002', '2015', 'bachB', 'GEST', '15/55ec002_single_1441047444', 20, 4, 'The following deceases are transmitted by mosquitoes except', 'Yellow fever', 'Dengue fever', 'West Nile fever', 'Hepatitis fever', NULL, NULL, 'Hepatitis fever', 'Hepatitis fever');

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
  `optiontype` varchar(10) DEFAULT NULL,
  `num` int(10) DEFAULT NULL,
  `question` text,
  `passageid` varchar(30) DEFAULT NULL,
  `option1` varchar(255) DEFAULT NULL,
  `option2` varchar(255) DEFAULT NULL,
  `option3` varchar(255) DEFAULT NULL,
  `option4` varchar(255) DEFAULT NULL,
  `option5` varchar(255) DEFAULT NULL,
  `answer1` varchar(255) DEFAULT NULL,
  `answer2` varchar(255) DEFAULT NULL,
  `answer3` varchar(255) DEFAULT NULL,
  `attachment1` varchar(100) DEFAULT NULL,
  `attachment2` varchar(100) DEFAULT NULL,
  `attachment3` varchar(100) DEFAULT NULL,
  `attachment4` varchar(100) DEFAULT NULL,
  `recordtime` varchar(100) DEFAULT NULL,
  `recorddate` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`sn`, `code`, `year`, `level`, `qtype`, `tot_option`, `optiontype`, `num`, `question`, `passageid`, `option1`, `option2`, `option3`, `option4`, `option5`, `answer1`, `answer2`, `answer3`, `attachment1`, `attachment2`, `attachment3`, `attachment4`, `recordtime`, `recorddate`) VALUES
(1, 'MAT115', '2016', 'NCE1', 'Test', 5, 'radio', 1, '<h2 style="color: #000000;">Compute the sum of 23, 77, 65, 12 &nbsp;</h2>', NULL, '100', '177', '229', '214', '186', '229', '177', '', NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(2, 'MAT115', '2016', 'NCE1', 'Test', 5, 'radio', 2, '<h2 style="color: #000000;">Compute the sum of 23, 77, 35 and&nbsp;&nbsp; 40</h2>', NULL, '170', '200', '180', '175', '145', '175', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(3, 'MAT115', '2016', 'NCE1', 'Test', 5, 'radio', 3, '<h2 style="color: #000000;">What is the square root of 1296 ?</h2>', NULL, '76', '66', '36', '16', '46', '36', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(4, 'MAT115', '2016', 'NCE1', 'Test', 5, 'radio', 5, '<h2 style="color: #000000;">What is the product of 16 and 10</h2>', NULL, '1016', '016', '160', '610', '1610', '160', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(207, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 1, 'A labourer is paid N5,400:00k per month. What is his total salary in 1 3/4years?', NULL, 'N113,40:00', 'N64,800:00', 'N97,200:00', 'N129,600:00', NULL, 'N113,40:00', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(208, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 2, 'Which of the following will sink when placed on water?', NULL, 'Ball', 'Plastic Cup', 'Balloon', 'Eraser', NULL, 'Eraser', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(209, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 3, 'The following  are domestic birds except', NULL, 'Duck', 'Pigeon', 'Turkey', 'Vulture', NULL, 'Vulture', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(210, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 4, 'A boy buys a biscuit for N4 and sells it at a profit of 20%. Find the actual price and the selling price?', NULL, 'i =N1.00k, ii = N5.00k', 'i = 60k,      ii = N4.40k', 'i = 80k, ii = N4.80k', 'i = 50k,      ii = N4.50k', NULL, 'i = 80k, ii = N4.80k', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(211, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 5, 'A man buys recharge card for N500. He sells it for N430. What is the percentage loss?', NULL, '0.07', '0.09', '0.14', '0.2', NULL, '0.14', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(212, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 6, 'The title of the traditional ruler of Benin is called................................', NULL, 'Obi', 'Obong', 'Oba', 'Igwe', NULL, 'Oba', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(213, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 7, 'Which of these is not a method of preventing iron from rusting?', NULL, 'Lubrication ', 'Galvanization', 'Melting', 'Painting', NULL, 'Melting', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(214, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 8, 'Which of the following is not a rainbow colour?', NULL, 'Indigo ', 'Purple ', 'Orange', 'Green', NULL, 'Purple ', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(215, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 9, 'A person who flies an aircraft is called..........................', NULL, 'A captain', 'A craftologist', 'A pilot', 'An aeronautics engineer', NULL, 'A pilot', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(216, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 10, 'Kwame Nkrumah Museum is located in..................................', NULL, 'Tanzania ', 'Kenya', 'Mauritania', 'Ghana', NULL, 'Ghana', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(217, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 11, 'An example of confluence town in Nigeria is...................................', NULL, 'Onitsha ', 'Obudu ', 'Lokoja', 'PortHarcout', NULL, 'Lokoja', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(218, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 12, 'A trained person that specializes in the treatment of diseases and disorders of the teeth is called................', NULL, 'Cardiologist', 'Dermatologist', 'Physician', 'Dentist', NULL, 'Dentist', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(219, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 13, 'A bricklayer is Paid N1000:00k for 5days work. What is his pay for 22days work?', NULL, 'N22,000:00k', 'N50,000:00k', 'N4,400:00k', 'N5,000:00k', NULL, 'N4,400:00k', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(220, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 14, 'In parliamentary system of government, members of the parliament are required to report the proceedings of the house to their..............................', NULL, 'Local government chairman and governors', 'Constituencies', 'Political parties and party  stalwarts', 'Traditional rulers', NULL, 'Constituencies', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(221, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 15, 'One essential duty of a citizen to his/her state is to...........................', NULL, 'Vote and support the government in power', 'Recite the national anthem and the pledge', 'Pay his tax', 'Encourage other citizens to be loyal', NULL, 'Pay his tax', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(222, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 16, 'Under whose regime were Delta and Adamawa States created?', NULL, 'Gen Sanni Abacha', 'Gen yakubu Gowon', 'Gen Murtala Muhammed', 'Gen Ibrahim Babangida', NULL, 'Gen Ibrahim Babangida', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(223, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 17, 'The body charged with the responsibility of regulating and protecting consumers against illicit foods and drugs in Nigeria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(224, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 18, 'The senate president during the second republic was.........................', NULL, 'Dr. Joseph Wayas', 'Senator Anyim Pius Anyim', 'Senator Iyorchia Ayu', 'Chief Adopous Wabara', NULL, 'Dr. Joseph Wayas', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(225, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 19, 'We eat Carbohydrate food to give us..........................', NULL, 'Energy ', 'Good sight', 'Good teeth', 'Strong bones ', NULL, 'Energy ', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(226, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 20, 'President Barrack Obama is the.................. president of the United States of America and first African-American president of U.S.', NULL, '35th', '44th', '40th', '39th', NULL, '44th', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(227, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 21, 'A large area of water surrounded by land is called.......................................', NULL, 'A dam', 'An Island ', 'An Is berg', 'A lake', NULL, 'A lake', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(228, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 22, 'A written piece of paper which indicates that goods bought and services rendered have been paid for is called...............................', NULL, 'An Invoice', 'A receipt', 'A wage bill', 'A trade document', NULL, 'A receipt', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(229, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 23, 'The device for stepping up or down electricity voltage on transmission line is called......................', NULL, 'Electricity meter', 'Transmission station', 'Transformer', 'Step-down panel', NULL, 'Transformer', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(230, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 24, 'The major raw material for pottery is.............................', NULL, 'Metal', 'Ceramics', 'Cement', 'Clay', NULL, 'Clay', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(231, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 25, ' If the total sales for a bag shop in a certain year were #150, 000 What were sales in July, if July sales were half the monthly average?', NULL, '#6,250', '#8,650', '#12,500', '#7,550', NULL, '#6,250', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(232, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 26, 'In UITH, Dr Steve has worked more night shift than Dr. Greg who has worked five night shifts. Dr Okon has worked fifteen night shifts more than Dr. Steve and Dr. Greg combined. Dr. Uche has worked eight night shifts less than Dr. Steve. How many night shifts has Dr, Steve worked?', NULL, 'Ten', 'Nine', 'Eight', 'Seven', NULL, 'Nine', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(233, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 27, 'At a basket match, Roland was sitting in seat 356. Peter on the right of Roland in seat 355.  Samuel was on the left of Roland. Samson was by the left of Samuel. Which seat is Samson sitting?', NULL, '354', '357', '358', '353', NULL, '354', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(234, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 28, 'While preparing for the post jamb aptitude test, Felix read through pages 35 to 78 and 102 to 127 of an English text book. How many pages did he read altogether? ', NULL, '58', '70', '68', '64', NULL, '70', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(235, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 29, 'How many numbers between 1 and 60 begins or end with 5', NULL, '5', '8', '15', '18', NULL, '15', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(236, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 30, 'A researcher conducted in the laboratory showed that 55% rats died of liver disorder when exposed to sulphur dioxide but 96% of rats who died of liver disorder were not exposed to sulphur dioxide. This means that', NULL, 'Small portion of studied rats was exposed to Sulphur dioxide   ', 'There is only one cause of fatal liver disease in rats', 'Sulphur dioxide is not particularly dangerous to theliver of rats', 'Most rats will not suffer from exposure to low level of Sulphur dioxide.', NULL, 'Small portion of studied rats was exposed to Sulphur dioxide   ', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(237, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 31, 'Three people witnessed a lady who was robbed in a cyber cafÃ© and they were asked to    describe the mugger. Which of the following best described the mugger?', NULL, 'He was tall, of average weight and middle-aged ', 'He was tall, thin and young', 'He was average height, thin and middle-aged', 'He was tall, thin and middle-aged', NULL, 'He was tall, thin and middle-aged', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(238, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 32, 'If 15 cans of food are needed for seven adults for two days, the number of cans needed to       feed four adults for seven days is?', NULL, '25', '15', '20', '30', NULL, '30', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(239, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 33, 'Which one of the following key techniques is necessary for all the others to be effective?', NULL, 'Communication ', 'Teamwork', 'Leadership ', 'Technical know-how      ', NULL, 'Communication ', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(240, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 34, 'How many Lunar months make one year ', NULL, '13', '11', '12', '14', NULL, '13', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(241, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 35, 'Two-third of a class passed English Language as a subject. The number of students who       failed English Language will be?', NULL, '42007', '42006', '42008', '42067', NULL, '42007', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(242, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 36, ' â€œMy Heart Jumped into my mouthâ€ What is the meaning of the above statement?', NULL, 'To be confused      ', 'To be hungry      ', 'To be afraid ', 'To be discouraged   ', NULL, 'To be afraid ', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(243, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 37, 'It was Friday on Jan 1, 2010. What was the day of the week Jan 1, 2011? ', NULL, 'Sunday', 'Wednesday', 'Thursday', 'Saturday', NULL, 'Saturday', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(244, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 38, 'Today is Monday. After 63 days, it will be: ', NULL, 'Wednesday     ', 'Monday', 'Tuesday', 'Saturday', NULL, 'Monday', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(245, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 39, 'AT 10% DISCOUNT, AN ITEM VALUED AT N45000 NOW COST', NULL, '4050', '40500', '40505', '40550', NULL, '40550', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(246, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 40, 'IN WHICH COUNTRY IS MISSISSIPPI RIVER', NULL, 'USA', 'ARGENTINA       ', 'BRAZIL        ', 'CANADA', NULL, 'USA', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(247, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 41, 'ON A ROAD MAP, A LINE SEGMENT OF 4 INCHES LONG REPRESENTS A DISDANCE OF         12 MILES.  HOW MANY MILES LONG IS 4.5 INCHES.', NULL, '12.5', '13.5', '14.5', '15.5', NULL, '13.5', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(248, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 42, 'THE BREATH AND LENTH OF A RECTANGLE ARE L AND 2L RESPECTIVELY. WHAT IS THE       PERIMETER OF THE RECTANGLE?', NULL, 'L', '3L', '5L', '6L', NULL, '6L', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(249, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 43, 'THE PLACE WHERE WATER IS FOUND IN THE DESERT IS CALLED', NULL, 'LAKE', 'DAM', 'DIFF', 'OASIS', NULL, 'OASIS', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(250, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 44, 'WHICH OF THE FOLLOWING HAS THE HIGHEST POPULATION IN THE WORLD', NULL, 'INDIA   ', 'RUSSIA      ', 'CHINA     ', 'USA', NULL, 'CHINA     ', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(251, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 45, 'THE SCIENTIFIC WAY OF REFERRING TO THE ACTIVITY OF THE EAR IS', NULL, 'AUDIO VISUAL  ', 'AUDIO   ', 'VISUAL   ', 'CHEMORECEPTOR', NULL, 'AUDIO   ', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(252, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 46, 'THE UPPER LEGISLATIVE ARM OF GOVERNMENT IN NIGERIA IS HEADED BY ', NULL, 'SPEAKER             ', 'PRESIDENT   ', 'LEADER     ', 'SECRETARY                         ', NULL, 'PRESIDENT   ', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(253, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 47, 'THE DEGREE OF HOTNESS AND COLDNESS OF A PLACE IS CALLED', NULL, 'RAINFALL          ', 'HUMIDITY     ', 'TEMPERATURE     ', 'WEATHER            ', NULL, 'TEMPERATURE     ', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(254, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 48, 'A PLACE WHERE TWO RIVERS MEET IS CALLED', NULL, 'CONFLUENCE     ', 'JUNCTION     ', 'JOINT           ', 'DELTA                                 ', NULL, 'CONFLUENCE     ', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(255, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 49, 'THE PRIMARY SOURCE OF ENERGY IS CALLED                                                      ', NULL, 'SUNLIGHT      ', 'WATER      ', 'FOOD', 'HEAT', NULL, 'SUNLIGHT      ', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM'),
(256, 'CSC225', '2016', 'NCE2', 'Exam', 4, 'radio', 50, 'THE FIRST COLOUR OF THE RAINBOW IS CALLED', NULL, 'GREEN       ', 'VIOLET      ', 'INDIGO     ', 'RED', NULL, 'RED', NULL, NULL, NULL, NULL, NULL, NULL, '1457904424', 'Sun 13th Mar, 2016 - 10:27 04 PM');

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
-- Table structure for table `time_remind`
--

CREATE TABLE `time_remind` (
  `sn` int(10) NOT NULL,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `year` varchar(12) DEFAULT NULL,
  `uniqueid` varchar(50) NOT NULL DEFAULT '0',
  `coursecode` varchar(50) NOT NULL DEFAULT '',
  `mark` int(3) DEFAULT NULL,
  `total_qtn` int(3) DEFAULT NULL,
  `total_sec` int(20) DEFAULT NULL,
  `sec_used` int(20) DEFAULT NULL,
  `bus_stop` int(3) DEFAULT NULL,
  `code_gen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `time_remind`
--

INSERT INTO `time_remind` (`sn`, `user_id`, `year`, `uniqueid`, `coursecode`, `mark`, `total_qtn`, `total_sec`, `sec_used`, `bus_stop`, `code_gen`) VALUES
(1, 'KWCOETL/AP2016/0001', '2015', 'bachB', 'GEST', 30, 10, 240, 178, 10, 'KWCOETL/AP2016/0001_single_144'),
(3, 'KWCOETL/AP2016/0002', '2015', 'bachB', 'GEST', 250, 50, 4560, 351, 2, 'KWCOETL/AP2016/0002_single_1441047047'),
(4, '15/55ec002', '2015', 'bachB', 'GEST', 250, 50, 4500, 1024, 7, '15/55ec002_single_1441047444');

-- --------------------------------------------------------

--
-- Table structure for table `time_schedule`
--

CREATE TABLE `time_schedule` (
  `sn` int(10) NOT NULL,
  `user_id` varchar(30) NOT NULL DEFAULT '',
  `year` varchar(12) DEFAULT NULL,
  `total_sec` int(20) DEFAULT NULL,
  `mark` int(3) DEFAULT NULL,
  `paper_title` varchar(255) DEFAULT NULL,
  `template` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `time_schedule`
--

INSERT INTO `time_schedule` (`sn`, `user_id`, `year`, `total_sec`, `mark`, `paper_title`, `template`) VALUES
(2, 'KWCOETL/AP2016/0001', '2015', 4560, 5, NULL, 'single'),
(4, 'KWCOETL/AP2016/0003', '2015', 4560, 5, NULL, 'single'),
(5, 'KWCOETL/AP2016/0004', '2015', 4560, 5, NULL, 'single'),
(6, 'KWCOETL/AP2016/0006', '2015', 4560, 5, NULL, 'single'),
(7, 'KWCOETL/AP2016/0002', '2015', 4560, 5, NULL, 'single'),
(8, '15/55EC002', '2015', 4500, 5, NULL, 'single');

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
(14, 'KWCOETL/AP2016/0001', 'abubakar ', 'dd90d91477daee7b7f92004d0846f6f8', 'ABUBAKAR ', 'Fatima ', 'Bana', 'M', '01/01/1985', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567890', 'AP2016_0001.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, 'lout', NULL, NULL),
(15, 'KWCOETL/AP2016/0002', 'oseni', '0f0656ce098f3541c257314a1c2e5f82', 'OSENI', 'Saheed', NULL, 'M', '01/01/1986', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567891', 'AP2016_0002.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, 'lout', NULL, NULL),
(16, 'KWCOETL/AP2016/0003', 'mohammed', 'd79cd06799863224b7324d969c1e2084', 'MOHAMMED', 'Hawawu', 'Haja', 'F', '01/01/1987', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567892', 'AP2016_0003.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, 'lout', NULL, NULL),
(17, 'KWCOETL/AP2016/0004', 'jimoh', '827e7b89978c2d7867caa6d264861911', 'JIMOH', 'Muhinat', NULL, 'F', '01/01/1988', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567893', 'AP2016_0004.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, 'lout', NULL, NULL),
(18, 'KWCOETL/AP2016/0005', 'abubakar ', 'dd90d91477daee7b7f92004d0846f6f8', 'ABUBAKAR ', 'Ndaman', NULL, 'M', '01/01/1989', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567894', 'AP2016_0001.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, 'lout', NULL, NULL),
(19, 'KWCOETL/AP2016/0006', '', 'd41d8cd98f00b204e9800998ecf8427e', NULL, 'YAKUBU', 'Joy', 'F', '01/01/1990', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567895', 'AP2016_0002.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, 'lout', NULL, NULL),
(20, 'KWCOETL/AP2016/0007', 'usman ', '91ee53cbcfb0ffbf48251e60c8d63da3', 'USMAN ', 'Soliu', 'Olarewaju', 'M', '01/01/1991', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567896', 'AP2016_0003.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, 'lout', NULL, NULL),
(21, 'KWCOETL/AP2016/0008', 'babagbemi', '2b5d0b995c48a6939f5150706726d6af', 'BABAGBEMI', 'Feyishayo', NULL, 'M', '01/01/1992', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567897', 'AP2016_0004.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, 'lout', NULL, NULL),
(22, 'KWCOETL/AP2016/0009', 'ogunniyi', 'a32d9efd7ef36b22d14134c2f5ec67cb', 'OGUNNIYI', 'Adenike', 'Bilikis', 'M', '01/01/1993', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567898', 'AP2016_0001.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, 'lout', NULL, NULL),
(23, 'KWCOETL/AP2016/0010', 'mathias', '534ba0736a590a84e4140f3457a7a626', 'MATHIAS', 'Wisdom', NULL, 'F', '01/01/1994', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567899', 'AP2016_0002.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, 'lout', NULL, NULL),
(24, 'KWCOETL/AP2016/0011', 'friday', 'f6f7fec07f372b7bd5eb196bbca0f3f4', 'FRIDAY', 'Joseph', 'Anu', 'F', '01/01/1995', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567900', 'AP2016_0003.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, 'lout', NULL, NULL),
(25, '56149087CJ', 'ishola', '19b4c6c95a51c83ff787e7636f0a4e3b', 'ISHOLA', 'Blessing', 'Oluwakem', 'F', '01/01/1996', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567901', 'AP2016_0004.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, 'lout', NULL, NULL),
(26, '56299321IG', 'ogundipe', '11e945fa5b6f9d7a07edbac2f5411f65', 'OGUNDIPE', 'Andrew', 'Tosin', 'F', '01/01/1997', NULL, NULL, NULL, 'example@yahoo.com', 'AGRICULTURE', 'ECONOMICS', 'NCE1', NULL, '01234567902', 'AP2016_0001.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, 'lout', NULL, NULL);

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
-- Table structure for table `users_result`
--

CREATE TABLE `users_result` (
  `sn` int(10) NOT NULL,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `scheduledate` varchar(100) DEFAULT NULL,
  `batch` varchar(10) DEFAULT NULL,
  `currently` varchar(50) DEFAULT NULL,
  `coursecode` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(3) NOT NULL,
  `uniqueid` varchar(50) NOT NULL DEFAULT '0',
  `year` varchar(12) DEFAULT NULL,
  `unit` int(2) DEFAULT NULL,
  `totalmark` int(3) NOT NULL,
  `totalscore` int(3) NOT NULL,
  `point` int(2) NOT NULL,
  `grade` varchar(2) NOT NULL,
  `paperlogintime` varchar(50) DEFAULT NULL,
  `paperlogouttime` varchar(50) DEFAULT NULL,
  `paper_signal` varchar(50) DEFAULT NULL,
  `percent` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_result`
--

INSERT INTO `users_result` (`sn`, `user_id`, `scheduledate`, `batch`, `currently`, `coursecode`, `status`, `uniqueid`, `year`, `unit`, `totalmark`, `totalscore`, `point`, `grade`, `paperlogintime`, `paperlogouttime`, `paper_signal`, `percent`) VALUES
(1, 'KWCOETL/AP2016/0001', 'sep-07-2015', '1', 'off', 'GEST', '', 'bachB', '2015', NULL, 30, 3, 0, '', 'Thu 27th Aug, 2015 - 1:52 17 PM', 'Thu 27th Aug, 2015 - 1:57 06 PM', 'normal', 10),
(2, 'KWCOETL/AP2016/0002', 'sep-07-2015', '1', 'off', 'GEST', '', 'bachB', '2015', NULL, 250, 100, 0, '', 'Mon 31st Aug, 2015 - 8:50 47 PM', 'Mon 31st Aug, 2015 - 9:36 03 PM', 'done', 40),
(3, 'KWCOETL/AP2016/0003', 'sep-07-2015', '1', 'off', 'GEST', '', 'bachB', '2015', NULL, 0, 0, 0, '', NULL, NULL, 'normal', NULL),
(4, 'KWCOETL/AP2016/0004', 'sep-07-2015', '1', 'off', 'GEST', '', 'bachB', '2015', NULL, 0, 0, 0, '', NULL, NULL, 'normal', NULL),
(5, 'KWCOETL/AP2016/0006', 'sep-07-2015', '1', 'off', 'GEST', '', 'bachB', '2015', NULL, 0, 0, 0, '', NULL, NULL, 'normal', NULL),
(6, '15/55EC002', '42239', '1', 'off', 'GEST', '', 'bachB', '2015', NULL, 250, 90, 0, '', 'Mon 31st Aug, 2015 - 8:57 24 PM', 'Mon 31st Aug, 2015 - 9:26 26 PM', 'done', 36);

-- --------------------------------------------------------

--
-- Table structure for table `userslogs`
--

CREATE TABLE `userslogs` (
  `sn` int(10) NOT NULL,
  `user_id` varchar(30) NOT NULL DEFAULT '',
  `logtime` varchar(60) DEFAULT NULL,
  `logdate` varchar(60) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userslogs`
--

INSERT INTO `userslogs` (`sn`, `user_id`, `logtime`, `logdate`, `type`) VALUES
(1, 'joseph', '1412243990', '02 Thu Oct 2014201420142014', 'lin'),
(2, 'bayo', '1412244353', 'Thu 2nd Oct, 2014 - 12:05 53 PM', 'lin'),
(3, 'bayo', '1412244750', 'Thu 2nd Oct, 2014 - 12:12 30 PM', 'lin'),
(4, 'bayo', '1412244921', 'Thu 2nd Oct, 2014 - 12:15 21 PM', 'lout'),
(5, 'joseph', '1412245121', 'Thu 2nd Oct, 2014 - 12:18 41 PM', 'lout'),
(6, 'bayo', '1412246136', 'Thu 2nd Oct, 2014 - 12:35 36 PM', 'lout'),
(7, 'joseph', '1412246148', 'Thu 2nd Oct, 2014 - 12:35 48 PM', 'lin'),
(8, 'joseph', '1412246154', 'Thu 2nd Oct, 2014 - 12:35 54 PM', 'lout'),
(9, 'ibitoye', '1412246165', 'Thu 2nd Oct, 2014 - 12:36 05 PM', 'lin'),
(10, 'ibitoye', '1412246330', 'Thu 2nd Oct, 2014 - 12:38 50 PM', 'lout'),
(11, 'bayo', '1412246341', 'Thu 2nd Oct, 2014 - 12:39 01 PM', 'lin'),
(12, 'bayo', '1412246379', 'Thu 2nd Oct, 2014 - 12:39 39 PM', 'lout'),
(13, 'joseph', '1412246392', 'Thu 2nd Oct, 2014 - 12:39 52 PM', 'lin'),
(14, 'joseph', '1412246406', 'Thu 2nd Oct, 2014 - 12:40 06 PM', 'lout'),
(15, 'blessing', '1412246433', 'Thu 2nd Oct, 2014 - 12:40 33 PM', 'lin'),
(16, 'blessing', '1412246462', 'Thu 2nd Oct, 2014 - 12:41 02 PM', 'lout'),
(17, 'blessing', '1412246471', 'Thu 2nd Oct, 2014 - 12:41 11 PM', 'lin'),
(18, 'blessing', '1412246483', 'Thu 2nd Oct, 2014 - 12:41 23 PM', 'lout'),
(19, 'bayo', '1412246995', 'Thu 2nd Oct, 2014 - 12:49 55 PM', 'lin'),
(20, 'bayo', '1412247034', 'Thu 2nd Oct, 2014 - 12:50 34 PM', 'lout'),
(21, 'ibitoye', '1412248156', 'Thu 2nd Oct, 2014 - 1:09 16 PM', 'lin'),
(22, 'ibitoye', '1412248256', 'Thu 2nd Oct, 2014 - 1:10 56 PM', 'lout'),
(23, 'ibitoye', '1412248274', 'Thu 2nd Oct, 2014 - 1:11 14 PM', 'lin'),
(24, 'bayo', '1412253517', 'Thu 2nd Oct, 2014 - 2:38 37 PM', 'lin'),
(25, 'bayo', '1412275337', 'Thu 2nd Oct, 2014 - 8:42 17 PM', 'lout'),
(26, 'bayo', '1412331321', 'Fri 3rd Oct, 2014 - 12:15 21 PM', 'lin'),
(27, 'bayo', '1412339482', 'Fri 3rd Oct, 2014 - 2:31 22 PM', 'lin'),
(28, 'bayo', '1412339496', 'Fri 3rd Oct, 2014 - 2:31 36 PM', 'lout'),
(29, 'bayo', '1412340874', 'Fri 3rd Oct, 2014 - 2:54 34 PM', 'lout'),
(30, 'joseph', '1412428594', 'Sat 4th Oct, 2014 - 3:16 34 PM', 'lin'),
(31, 'joseph', '1412428695', 'Sat 4th Oct, 2014 - 3:18 15 PM', 'lout'),
(32, 'bayo', '1412429832', 'Sat 4th Oct, 2014 - 3:37 12 PM', 'lin'),
(33, 'joseph', '1412433261', 'Sat 4th Oct, 2014 - 4:34 21 PM', 'lin'),
(34, 'ibitoye', '1412434061', 'Sat 4th Oct, 2014 - 4:47 41 PM', 'lin'),
(35, 'bayo', '1412442222', 'Sat 4th Oct, 2014 - 7:03 42 PM', 'lout'),
(36, 'blessing', '1412442232', 'Sat 4th Oct, 2014 - 7:03 52 PM', 'lin'),
(37, 'blessing', '1412443637', 'Sat 4th Oct, 2014 - 7:27 17 PM', 'lout'),
(38, 'bayo', '1412443648', 'Sat 4th Oct, 2014 - 7:27 28 PM', 'lin'),
(39, 'bayo', '1412443666', 'Sat 4th Oct, 2014 - 7:27 46 PM', 'lout'),
(40, 'ibitoye', '1412444256', 'Sat 4th Oct, 2014 - 7:37 36 PM', 'lin'),
(41, 'ibitoye', '1412444377', 'Sat 4th Oct, 2014 - 7:39 37 PM', 'lout'),
(42, 'blessing', '1412444619', 'Sat 4th Oct, 2014 - 7:43 39 PM', 'lin'),
(43, 'blessing', '1412479511', 'Sun 5th Oct, 2014 - 5:25 11 AM', 'lout'),
(44, 'bayo', '1412479519', 'Sun 5th Oct, 2014 - 5:25 19 AM', 'lin'),
(45, 'bayo', '1412479616', 'Sun 5th Oct, 2014 - 5:26 56 AM', 'lout'),
(46, 'joseph', '1412479627', 'Sun 5th Oct, 2014 - 5:27 07 AM', 'lin'),
(47, 'ibitoye', '1412479736', 'Sun 5th Oct, 2014 - 5:28 56 AM', 'lout'),
(48, 'ibitoye', '1412479752', 'Sun 5th Oct, 2014 - 5:29 12 AM', 'lin'),
(49, 'joseph', '1412479836', 'Sun 5th Oct, 2014 - 5:30 36 AM', 'lout'),
(50, 'ibitoye', '1412479866', 'Sun 5th Oct, 2014 - 5:31 06 AM', 'lin'),
(51, 'ibitoye', '1412510835', 'Sun 5th Oct, 2014 - 2:07 15 PM', 'lout'),
(52, 'bayo', '1412510844', 'Sun 5th Oct, 2014 - 2:07 24 PM', 'lin'),
(53, 'joseph', '1412517071', 'Sun 5th Oct, 2014 - 3:51 11 PM', 'lout'),
(54, 'blessing', '1412519088', 'Sun 5th Oct, 2014 - 4:24 48 PM', 'lin'),
(55, 'blessing', '1412519099', 'Sun 5th Oct, 2014 - 4:24 59 PM', 'lout'),
(56, 'blessing', '1412519109', 'Sun 5th Oct, 2014 - 4:25 09 PM', 'lin'),
(57, 'blessing', '1412519150', 'Sun 5th Oct, 2014 - 4:25 50 PM', 'lout'),
(58, 'bayo', '1412519158', 'Sun 5th Oct, 2014 - 4:25 58 PM', 'lout'),
(59, 'bayo', '1412519168', 'Sun 5th Oct, 2014 - 4:26 08 PM', 'lin'),
(60, 'bayo', '1412519345', 'Sun 5th Oct, 2014 - 4:29 05 PM', 'lout'),
(61, 'blessing', '1412519358', 'Sun 5th Oct, 2014 - 4:29 18 PM', 'lin'),
(62, 'blessing', '1412519695', 'Sun 5th Oct, 2014 - 4:34 55 PM', 'lout'),
(63, 'blessing', '1412519709', 'Sun 5th Oct, 2014 - 4:35 09 PM', 'lin'),
(64, 'blessing', '1412520072', 'Sun 5th Oct, 2014 - 4:41 12 PM', 'lout'),
(65, 'ibitoye', '1412520089', 'Sun 5th Oct, 2014 - 4:41 29 PM', 'lin'),
(66, 'ibitoye', '1412520564', 'Sun 5th Oct, 2014 - 4:49 24 PM', 'lout'),
(67, 'joseph', '1412520578', 'Sun 5th Oct, 2014 - 4:49 38 PM', 'lin'),
(68, 'joseph', '1412520970', 'Sun 5th Oct, 2014 - 4:56 10 PM', 'lout'),
(69, 'ibitoye', '1412531646', 'Sun 5th Oct, 2014 - 7:54 06 PM', 'lin'),
(70, 'ibitoye', '1412531653', 'Sun 5th Oct, 2014 - 7:54 13 PM', 'lout'),
(71, 'joseph', '1412531674', 'Sun 5th Oct, 2014 - 7:54 34 PM', 'lin'),
(72, 'joseph', '1412531687', 'Sun 5th Oct, 2014 - 7:54 47 PM', 'lout'),
(73, 'bayo', '1412531745', 'Sun 5th Oct, 2014 - 7:55 45 PM', 'lin'),
(74, 'bayo', '1412540120', 'Sun 5th Oct, 2014 - 10:15 20 PM', 'lout'),
(75, 'blessing', '1412540129', 'Sun 5th Oct, 2014 - 10:15 29 PM', 'lin'),
(76, 'blessing', '1412540539', 'Sun 5th Oct, 2014 - 10:22 19 PM', 'lout'),
(77, 'blessing', '1412540579', 'Sun 5th Oct, 2014 - 10:22 59 PM', 'lin'),
(78, 'blessing', '1412540757', 'Sun 5th Oct, 2014 - 10:25 57 PM', 'lout'),
(79, 'joseph', '1412540868', 'Sun 5th Oct, 2014 - 10:27 48 PM', 'lin'),
(80, 'ibitoye', '1412541038', 'Sun 5th Oct, 2014 - 10:30 38 PM', 'lin'),
(81, 'ibitoye', '1412541232', 'Sun 5th Oct, 2014 - 10:33 52 PM', 'lin'),
(82, 'ibitoye', '1412542601', 'Sun 5th Oct, 2014 - 10:56 41 PM', 'lout'),
(83, 'joseph', '1412542613', 'Sun 5th Oct, 2014 - 10:56 53 PM', 'lin'),
(84, 'joseph', '1412544238', 'Sun 5th Oct, 2014 - 11:23 58 PM', 'lout'),
(85, 'blessing', '1412568450', 'Mon 6th Oct, 2014 - 6:07 30 AM', 'lin'),
(86, 'blessing', '1412568472', 'Mon 6th Oct, 2014 - 6:07 52 AM', 'lout'),
(87, 'joseph', '1412568490', 'Mon 6th Oct, 2014 - 6:08 10 AM', 'lin'),
(88, 'joseph', '1412568497', 'Mon 6th Oct, 2014 - 6:08 17 AM', 'lout'),
(89, 'ibitoye', '1412568511', 'Mon 6th Oct, 2014 - 6:08 31 AM', 'lin'),
(90, 'ibitoye', '1412568601', 'Mon 6th Oct, 2014 - 6:10 01 AM', 'lout'),
(91, 'ibitoye', '1412568636', 'Mon 6th Oct, 2014 - 6:10 36 AM', 'lin'),
(92, 'ibitoye', '1412568727', 'Mon 6th Oct, 2014 - 6:12 07 AM', 'lout'),
(93, 'ibitoye', '1412568741', 'Mon 6th Oct, 2014 - 6:12 21 AM', 'lin'),
(94, 'ibitoye', '1412568860', 'Mon 6th Oct, 2014 - 6:14 20 AM', 'lout'),
(95, 'blessing', '1412614441', 'Mon 6th Oct, 2014 - 6:54 01 PM', 'lin'),
(96, 'blessing', '1412618547', 'Mon 6th Oct, 2014 - 8:02 27 PM', 'lin'),
(97, 'blessing', '1412618608', 'Mon 6th Oct, 2014 - 8:03 28 PM', 'lout'),
(98, 'blessing', '1412618621', 'Mon 6th Oct, 2014 - 8:03 41 PM', 'lin'),
(99, 'blessing', '1412618681', 'Mon 6th Oct, 2014 - 8:04 41 PM', 'lout'),
(100, 'blessing', '1412618706', 'Mon 6th Oct, 2014 - 8:05 06 PM', 'lin'),
(101, 'blessing', '1412619323', 'Mon 6th Oct, 2014 - 8:15 23 PM', 'lout'),
(102, 'joseph', '1412619371', 'Mon 6th Oct, 2014 - 8:16 11 PM', 'lin'),
(103, 'ibitoye', '1412619692', 'Mon 6th Oct, 2014 - 8:21 32 PM', 'lin'),
(104, 'ibitoye', '1412619726', 'Mon 6th Oct, 2014 - 8:22 06 PM', 'lout'),
(105, 'joseph', '1412619736', 'Mon 6th Oct, 2014 - 8:22 16 PM', 'lout'),
(106, 'blessing', '1412619745', 'Mon 6th Oct, 2014 - 8:22 25 PM', 'lout'),
(107, 'bayo', '1412619809', 'Mon 6th Oct, 2014 - 8:23 29 PM', 'lin'),
(108, 'bayo', '1412619864', 'Mon 6th Oct, 2014 - 8:24 24 PM', 'lin'),
(109, 'bayo', '1412620205', 'Mon 6th Oct, 2014 - 8:30 05 PM', 'lout'),
(110, 'bayo', '1412620217', 'Mon 6th Oct, 2014 - 8:30 17 PM', 'lin'),
(111, 'bayo', '1412620493', 'Mon 6th Oct, 2014 - 8:34 53 PM', 'lout'),
(112, 'bayo', '1412620506', 'Mon 6th Oct, 2014 - 8:35 06 PM', 'lin'),
(113, 'bayo', '1412620713', 'Mon 6th Oct, 2014 - 8:38 33 PM', 'lout'),
(114, 'bayo', '1412620734', 'Mon 6th Oct, 2014 - 8:38 54 PM', 'lout'),
(115, 'ibitoye', '1412620749', 'Mon 6th Oct, 2014 - 8:39 09 PM', 'lin'),
(116, 'ibitoye', '1412620934', 'Mon 6th Oct, 2014 - 8:42 14 PM', 'lout'),
(117, 'joseph', '1412621530', 'Mon 6th Oct, 2014 - 8:52 10 PM', 'lin'),
(118, 'joseph', '1412621913', 'Mon 6th Oct, 2014 - 8:58 33 PM', 'lout'),
(119, 'blessing', '1412622322', 'Mon 6th Oct, 2014 - 9:05 22 PM', 'lin'),
(120, 'bayo', '1412622593', 'Mon 6th Oct, 2014 - 9:09 53 PM', 'lin'),
(121, 'bayo', '1412622844', 'Mon 6th Oct, 2014 - 9:14 04 PM', 'lout'),
(122, 'blessing', '1412623856', 'Mon 6th Oct, 2014 - 9:30 56 PM', 'lin'),
(123, 'blessing', '1412624090', 'Mon 6th Oct, 2014 - 9:34 50 PM', 'lout'),
(124, 'blessing', '1412628287', 'Mon 6th Oct, 2014 - 10:44 47 PM', 'lout'),
(125, 'joseph', '1412628312', 'Mon 6th Oct, 2014 - 10:45 12 PM', 'lin'),
(126, 'joseph', '1412628458', 'Mon 6th Oct, 2014 - 10:47 38 PM', 'lin'),
(127, 'joseph', '1412628582', 'Mon 6th Oct, 2014 - 10:49 42 PM', 'lout'),
(128, 'joseph', '1412628610', 'Mon 6th Oct, 2014 - 10:50 10 PM', 'lin'),
(129, 'joseph', '1412628728', 'Mon 6th Oct, 2014 - 10:52 08 PM', 'lout'),
(130, 'ibitoye', '1412629657', 'Mon 6th Oct, 2014 - 11:07 37 PM', 'lin'),
(131, 'ibitoye', '1412629773', 'Mon 6th Oct, 2014 - 11:09 33 PM', 'lin'),
(132, 'ibitoye', '1412630729', 'Mon 6th Oct, 2014 - 11:25 29 PM', 'lin'),
(133, 'ibitoye', '1412631203', 'Mon 6th Oct, 2014 - 11:33 23 PM', 'lout'),
(134, 'dare', '1412631453', 'Mon 6th Oct, 2014 - 11:37 33 PM', 'lin'),
(135, 'dare', '1412631493', 'Mon 6th Oct, 2014 - 11:38 13 PM', 'lout'),
(136, 'dare', '1412631565', 'Mon 6th Oct, 2014 - 11:39 25 PM', 'lin'),
(137, 'dare', '1412631578', 'Mon 6th Oct, 2014 - 11:39 38 PM', 'lout'),
(138, 'dare', '1412632066', 'Mon 6th Oct, 2014 - 11:47 46 PM', 'lin'),
(139, 'dare', '1412632189', 'Mon 6th Oct, 2014 - 11:49 49 PM', 'lout'),
(140, 'dare', '1412632220', 'Mon 6th Oct, 2014 - 11:50 20 PM', 'lin'),
(141, 'dare', '1412632341', 'Mon 6th Oct, 2014 - 11:52 21 PM', 'lin'),
(142, 'dare', '1412632345', 'Mon 6th Oct, 2014 - 11:52 25 PM', 'lout'),
(143, 'dare', '1412632354', 'Mon 6th Oct, 2014 - 11:52 34 PM', 'lin'),
(144, 'dare', '1412632979', 'Tue 7th Oct, 2014 - 12:02 59 AM', 'lout'),
(145, 'dare', '1412633026', 'Tue 7th Oct, 2014 - 12:03 46 AM', 'lin'),
(146, 'dare', '1412633348', 'Tue 7th Oct, 2014 - 12:09 08 AM', 'lout'),
(147, 'dare', '1412633356', 'Tue 7th Oct, 2014 - 12:09 16 AM', 'lin'),
(148, 'dare', '1412633622', 'Tue 7th Oct, 2014 - 12:13 42 AM', 'lin'),
(149, 'dare', '1412634111', 'Tue 7th Oct, 2014 - 12:21 51 AM', 'lout'),
(150, 'bayo', '1412634119', 'Tue 7th Oct, 2014 - 12:21 59 AM', 'lin'),
(151, 'bayo', '1412634253', 'Tue 7th Oct, 2014 - 12:24 13 AM', 'lout'),
(152, 'bayo', '1412634284', 'Tue 7th Oct, 2014 - 12:24 44 AM', 'lin'),
(153, 'bayo', '1412634308', 'Tue 7th Oct, 2014 - 12:25 08 AM', 'lout'),
(154, 'dare', '1412634316', 'Tue 7th Oct, 2014 - 12:25 16 AM', 'lin'),
(155, 'dare', '1412634727', 'Tue 7th Oct, 2014 - 12:32 07 AM', 'lout'),
(156, 'blessing', '1412634899', 'Tue 7th Oct, 2014 - 12:34 59 AM', 'lin'),
(157, 'blessing', '1412635418', 'Tue 7th Oct, 2014 - 12:43 38 AM', 'lout'),
(158, 'ibitoye', '1412635428', 'Tue 7th Oct, 2014 - 12:43 48 AM', 'lin'),
(159, 'ibitoye', '1412635670', 'Tue 7th Oct, 2014 - 12:47 50 AM', 'lin'),
(160, 'ibitoye', '1412635803', 'Tue 7th Oct, 2014 - 12:50 03 AM', 'lout'),
(161, 'joseph', '1412637343', 'Tue 7th Oct, 2014 - 1:15 43 AM', 'lin'),
(162, 'joseph', '1412637918', 'Tue 7th Oct, 2014 - 1:25 18 AM', 'lout'),
(163, 'bayo', '1412644620', 'Tue 7th Oct, 2014 - 3:17 00 AM', 'lin'),
(164, 'bayo', '1412644674', 'Tue 7th Oct, 2014 - 3:17 54 AM', 'lout'),
(165, 'blessing', '1412647263', 'Tue 7th Oct, 2014 - 4:01 03 AM', 'lin'),
(166, 'blessing', '1412647300', 'Tue 7th Oct, 2014 - 4:01 40 AM', 'lout'),
(167, 'ibitoye', '1412647326', 'Tue 7th Oct, 2014 - 4:02 06 AM', 'lin'),
(168, 'ibitoye', '1412647334', 'Tue 7th Oct, 2014 - 4:02 14 AM', 'lout'),
(169, 'kola', '1412647466', 'Tue 7th Oct, 2014 - 4:04 26 AM', 'lin'),
(170, 'kola', '1412647957', 'Tue 7th Oct, 2014 - 4:12 37 AM', 'lout'),
(171, 'blessing', '1412758636', 'Wed 8th Oct, 2014 - 10:57 16 AM', 'lin'),
(172, 'blessing', '1412758909', 'Wed 8th Oct, 2014 - 11:01 49 AM', 'lout'),
(173, 'joseph', '1412851023', 'Thu 9th Oct, 2014 - 12:37 03 PM', 'lin'),
(174, 'joseph', '1412851061', 'Thu 9th Oct, 2014 - 12:37 41 PM', 'lout'),
(175, 'joseph', '1412851114', 'Thu 9th Oct, 2014 - 12:38 34 PM', 'lin'),
(176, 'joseph', '1412897742', 'Fri 10th Oct, 2014 - 1:35 42 AM', 'lin'),
(177, 'kehinde', '1412924957', 'Fri 10th Oct, 2014 - 9:09 17 AM', 'lin'),
(178, 'kehinde', '1412925323', 'Fri 10th Oct, 2014 - 9:15 23 AM', 'lin'),
(179, 'kehinde', '1412925614', 'Fri 10th Oct, 2014 - 9:20 14 AM', 'lout'),
(180, 'kehinde', '1412925661', 'Fri 10th Oct, 2014 - 9:21 01 AM', 'lout'),
(181, 'joseph', '1412956286', 'Fri 10th Oct, 2014 - 5:51 26 PM', 'lout'),
(182, 'bayo', '1413178333', 'Mon 13th Oct, 2014 - 7:32 13 AM', 'lin'),
(183, 'bayo', '1413178486', 'Mon 13th Oct, 2014 - 7:34 46 AM', 'lout'),
(184, 'blessing', '1413209754', 'Mon 13th Oct, 2014 - 4:15 54 PM', 'lin'),
(185, 'blessing', '1413209812', 'Mon 13th Oct, 2014 - 4:16 52 PM', 'lout'),
(186, 'joseph', '1413222347', 'Mon 13th Oct, 2014 - 7:45 47 PM', 'lin'),
(187, 'joseph', '1413222416', 'Mon 13th Oct, 2014 - 7:46 56 PM', 'lout'),
(188, 'sadiq', '1413364354', 'Wed 15th Oct, 2014 - 11:12 34 AM', 'lin'),
(189, 'sadiq', '1413364628', 'Wed 15th Oct, 2014 - 11:17 08 AM', 'lout'),
(190, 'sadiq', '1413364858', 'Wed 15th Oct, 2014 - 11:20 58 AM', 'lin'),
(191, 'sadiq', '1413364974', 'Wed 15th Oct, 2014 - 11:22 54 AM', 'lout'),
(192, 'blessing', '1414062554', 'Thu 23rd Oct, 2014 - 1:09 14 PM', 'lin'),
(193, 'blessing', '1414072358', 'Thu 23rd Oct, 2014 - 3:52 38 PM', 'lout'),
(194, 'joseph', '1414072695', 'Thu 23rd Oct, 2014 - 3:58 15 PM', 'lin'),
(195, 'bayo', '1414073703', 'Thu 23rd Oct, 2014 - 4:15 02 PM', 'lin'),
(196, 'bayo', '1414078201', 'Thu 23rd Oct, 2014 - 5:30 01 PM', 'lout'),
(197, 'bayo', '1414078230', 'Thu 23rd Oct, 2014 - 5:30 30 PM', 'lin'),
(198, 'bayo', '1414078273', 'Thu 23rd Oct, 2014 - 5:31 13 PM', 'lout'),
(199, 'bayo', '1414179088', 'Fri 24th Oct, 2014 - 9:31 28 PM', 'lin'),
(200, 'bayo', '1414179994', 'Fri 24th Oct, 2014 - 9:46 34 PM', 'lin'),
(201, 'bayo', '1414193205', 'Sat 25th Oct, 2014 - 1:26 45 AM', 'lout'),
(202, 'bayo', '1414215272', 'Sat 25th Oct, 2014 - 7:34 32 AM', 'lout'),
(203, 'joseph', '1414216228', 'Sat 25th Oct, 2014 - 7:50 28 AM', 'lin'),
(204, 'joseph', '1414217218', 'Sat 25th Oct, 2014 - 8:06 58 AM', 'lout'),
(205, 'dele', '1414237347', 'Sat 25th Oct, 2014 - 1:42 27 PM', 'lin'),
(206, 'dele', '1414237547', 'Sat 25th Oct, 2014 - 1:45 47 PM', 'lout'),
(207, 'dele', '1414237574', 'Sat 25th Oct, 2014 - 1:46 14 PM', 'lin'),
(208, 'dele', '1414237707', 'Sat 25th Oct, 2014 - 1:48 27 PM', 'lout'),
(209, 'joseph', '1414265904', 'Sat 25th Oct, 2014 - 9:38 24 PM', 'lin'),
(210, 'joseph', '1414265942', 'Sat 25th Oct, 2014 - 9:39 02 PM', 'lout'),
(211, '13/55ek050', '1414266237', 'Sat 25th Oct, 2014 - 9:43 57 PM', 'lin'),
(212, '13/55ek050', '1414268563', 'Sat 25th Oct, 2014 - 10:22 43 PM', 'lout'),
(213, '13/55ek050', '1414268663', 'Sat 25th Oct, 2014 - 10:24 23 PM', 'lin'),
(214, '13/55ek050', '1414287118', 'Sun 26th Oct, 2014 - 2:31 58 AM', 'lin'),
(215, '13/55ek050', '1414291607', 'Sun 26th Oct, 2014 - 3:46 47 AM', 'lout'),
(216, 'joseph', '1414291625', 'Sun 26th Oct, 2014 - 3:47 05 AM', 'lin'),
(217, '13/55ek050', '1414292167', 'Sun 26th Oct, 2014 - 3:56 07 AM', 'lout'),
(218, 'blessing', '1414292180', 'Sun 26th Oct, 2014 - 3:56 20 AM', 'lin'),
(219, 'blessing', '1414292317', 'Sun 26th Oct, 2014 - 3:58 37 AM', 'lout'),
(220, 'joseph', '1414292373', 'Sun 26th Oct, 2014 - 3:59 33 AM', 'lout'),
(221, 'joseph', '1414340646', 'Sun 26th Oct, 2014 - 5:24 05 PM', 'lin'),
(222, 'joseph', '1414340880', 'Sun 26th Oct, 2014 - 5:28 00 PM', 'lout'),
(223, 'dele', '1414341847', 'Sun 26th Oct, 2014 - 5:44 07 PM', 'lin'),
(224, 'dele', '1414342667', 'Sun 26th Oct, 2014 - 5:57 47 PM', 'lout'),
(225, 'blessing', '1414342693', 'Sun 26th Oct, 2014 - 5:58 13 PM', 'lin'),
(226, '13/55ek050', '1414521301', 'Tue 28th Oct, 2014 - 7:35 01 PM', 'lin'),
(227, '13/55ek050', '1414521448', 'Tue 28th Oct, 2014 - 7:37 28 PM', 'lout'),
(228, 'SADIQ', '1414774344', 'Fri 31st Oct, 2014 - 5:52 24 PM', 'lin'),
(229, 'SADIQ', '1414775999', 'Fri 31st Oct, 2014 - 6:19 59 PM', 'lout'),
(230, 'sadiq', '1414776975', 'Fri 31st Oct, 2014 - 6:36 15 PM', 'lin'),
(231, 'SADIQ', '1414777388', 'Fri 31st Oct, 2014 - 6:43 08 PM', 'lin'),
(232, 'SADIQ', '1414777406', 'Fri 31st Oct, 2014 - 6:43 26 PM', 'lout'),
(233, 'bayo', '1414777415', 'Fri 31st Oct, 2014 - 6:43 35 PM', 'lin'),
(234, 'bayo', '1414778670', 'Fri 31st Oct, 2014 - 7:04 30 PM', 'lout'),
(235, 'bayo', '1414802543', 'Sat 1st Nov, 2014 - 1:42 23 AM', 'lin'),
(236, 'bayo', '1414802576', 'Sat 1st Nov, 2014 - 1:42 56 AM', 'lout'),
(237, 'sadiq', '1414802586', 'Sat 1st Nov, 2014 - 1:43 06 AM', 'lin'),
(238, 'sadiq', '1414803256', 'Sat 1st Nov, 2014 - 1:54 16 AM', 'lout'),
(239, 'sadiq', '1414845884', 'Sat 1st Nov, 2014 - 1:44 44 PM', 'lin'),
(240, 'sadiq', '1414936574', 'Sun 2nd Nov, 2014 - 2:56 14 PM', 'lout'),
(241, 'sadiq', '1415254415', 'Thu 6th Nov, 2014 - 7:13 35 AM', 'lin'),
(242, 'sadiq', '1415254811', 'Thu 6th Nov, 2014 - 7:20 11 AM', 'lout'),
(243, 'bayo', '1415254823', 'Thu 6th Nov, 2014 - 7:20 23 AM', 'lin'),
(244, 'bayo', '1415254874', 'Thu 6th Nov, 2014 - 7:21 14 AM', 'lout'),
(245, 'bayo', '1415300718', 'Thu 6th Nov, 2014 - 8:05 18 PM', 'lin'),
(246, 'bayo', '1415300841', 'Thu 6th Nov, 2014 - 8:07 21 PM', 'lin'),
(247, 'bayo', '1415301182', 'Thu 6th Nov, 2014 - 8:13 02 PM', 'lout'),
(248, 'kehinde', '1415329650', 'Fri 7th Nov, 2014 - 4:07 30 AM', 'lin'),
(249, 'kehinde', '1415362070', 'Fri 7th Nov, 2014 - 1:07 50 PM', 'lout'),
(250, 'ibitoye', '1415362159', 'Fri 7th Nov, 2014 - 1:09 19 PM', 'lin'),
(251, 'ibitoye', '1415362593', 'Fri 7th Nov, 2014 - 1:16 33 PM', 'lout'),
(252, 'blessing', '1415363094', 'Fri 7th Nov, 2014 - 1:24 54 PM', 'lin'),
(253, 'blessing', '1415363146', 'Fri 7th Nov, 2014 - 1:25 46 PM', 'lout'),
(254, 'bayo', '1415634166', 'Mon 10th Nov, 2014 - 4:42 46 PM', 'lin'),
(255, 'bayo', '1415634275', 'Mon 10th Nov, 2014 - 4:44 35 PM', 'lout'),
(256, 'sadiq', '1415634287', 'Mon 10th Nov, 2014 - 4:44 47 PM', 'lin'),
(257, 'bayo', '1417183090', 'Fri 28th Nov, 2014 - 2:58 10 PM', 'lout'),
(258, 'blessing', '1417183157', 'Fri 28th Nov, 2014 - 2:59 17 PM', 'lout'),
(259, '07/55EC136', '1417190148', 'Fri 28th Nov, 2014 - 4:55 48 PM', 'lout'),
(260, 'bayo', '1417190419', 'Fri 28th Nov, 2014 - 5:00 19 PM', 'lout'),
(261, 'joseph', '1417190494', 'Fri 28th Nov, 2014 - 5:01 34 PM', 'lout'),
(262, 'blessing', '1417190546', 'Fri 28th Nov, 2014 - 5:02 26 PM', 'lout'),
(263, 'Ibitoye', '1417190609', 'Fri 28th Nov, 2014 - 5:03 29 PM', 'lout'),
(264, '07/55EC136', '1417190672', 'Fri 28th Nov, 2014 - 5:04 32 PM', 'lout'),
(265, '07/55EC136', '1417191197', 'Fri 28th Nov, 2014 - 5:13 17 PM', 'lin'),
(266, '07/55EC136', '1417191238', 'Fri 28th Nov, 2014 - 5:13 58 PM', 'lin'),
(267, '07/55EC136', '1417191479', 'Fri 28th Nov, 2014 - 5:17 59 PM', 'lin'),
(268, 'joseph', '1417191546', 'Fri 28th Nov, 2014 - 5:19 06 PM', 'lin'),
(269, 'blessing', '1417191619', 'Fri 28th Nov, 2014 - 5:20 19 PM', 'lin'),
(270, '07/55EC136', '1417191935', 'Fri 28th Nov, 2014 - 5:25 35 PM', 'lin'),
(271, '07/55EC136', '1417192331', 'Fri 28th Nov, 2014 - 5:32 11 PM', 'lin'),
(272, '07/55EC136', '1417192414', 'Fri 28th Nov, 2014 - 5:33 34 PM', 'lin'),
(273, 'bayo', '1417192573', 'Fri 28th Nov, 2014 - 5:36 13 PM', 'lin'),
(274, 'dare', '1417199701', 'Fri 28th Nov, 2014 - 7:35 00 PM', 'lin'),
(275, 'dare', '1417275552', 'Sat 29th Nov, 2014 - 4:39 12 PM', 'lin'),
(276, '07/55EC136', '1417275769', 'Sat 29th Nov, 2014 - 4:42 49 PM', 'lin'),
(277, 'joseph', '1417275798', 'Sat 29th Nov, 2014 - 4:43 18 PM', 'lin'),
(278, 'joseph', '1417276123', 'Sat 29th Nov, 2014 - 4:48 43 PM', 'lin'),
(279, 'blessing', '1417277515', 'Sat 29th Nov, 2014 - 5:11 55 PM', 'lin'),
(280, '07/55EC136', '1417284259', 'Sat 29th Nov, 2014 - 7:04 19 PM', 'lin'),
(281, 'bayo', '1417284357', 'Sat 29th Nov, 2014 - 7:05 57 PM', 'lin'),
(282, 'dare', '1417290946', 'Sat 29th Nov, 2014 - 8:55 46 PM', 'lin'),
(283, '07/55EC112', '1417292556', 'Sat 29th Nov, 2014 - 9:22 36 PM', 'lin'),
(284, '07/55EC112', '1417292845', 'Sat 29th Nov, 2014 - 9:27 25 PM', 'lin'),
(285, '07/55EC112', '1417296482', 'Sat 29th Nov, 2014 - 10:28 02 PM', 'lin'),
(286, 'dare', '1417421311', 'Mon 1st Dec, 2014 - 9:08 31 AM', 'lin'),
(287, 'dare', '1417422996', 'Mon 1st Dec, 2014 - 9:36 36 AM', 'lin'),
(288, 'M.Tech/SSSE/2011/2894', '1417442571', 'Mon 1st Dec, 2014 - 3:02 51 PM', 'lin'),
(289, 'M.Tech/SSSE/2011/2894', '1417443205', 'Mon 1st Dec, 2014 - 3:13 25 PM', 'lin'),
(290, 'bayo', '1417443461', 'Mon 1st Dec, 2014 - 3:17 41 PM', 'lin'),
(291, 'dare', '1417443498', 'Mon 1st Dec, 2014 - 3:18 18 PM', 'lin'),
(292, '07/55EC136', '1417444934', 'Mon 1st Dec, 2014 - 3:42 14 PM', 'lin'),
(293, 'M.Tech/SSSE/2011/2894', '1417633307', 'Wed 3rd Dec, 2014 - 8:01 46 PM', 'lin'),
(294, '07/55EC112', '1417908681', 'Sun 7th Dec, 2014 - 12:31 21 AM', 'lout'),
(295, 'bayo', '1417908713', 'Sun 7th Dec, 2014 - 12:31 53 AM', 'lout'),
(296, 'kehinde', '1417908800', 'Sun 7th Dec, 2014 - 12:33 20 AM', 'lout'),
(297, 'kehinde', '1417908850', 'Sun 7th Dec, 2014 - 12:34 10 AM', 'lout'),
(298, 'blessing', '1417908855', 'Sun 7th Dec, 2014 - 12:34 15 AM', 'lout'),
(299, 'joseph', '1417908913', 'Sun 7th Dec, 2014 - 12:35 13 AM', 'lout'),
(300, 'joseph', '1417913366', 'Sun 7th Dec, 2014 - 1:49 26 AM', 'lout'),
(301, 'joseph', '1417950525', 'Sun 7th Dec, 2014 - 12:08 45 PM', 'lout'),
(302, 'joseph', '1417995722', 'Mon 8th Dec, 2014 - 12:42 02 AM', 'lout'),
(303, 'bayo', '1417995857', 'Mon 8th Dec, 2014 - 12:44 17 AM', 'lout'),
(304, 'blessing', '1417996021', 'Mon 8th Dec, 2014 - 12:47 01 AM', 'lout'),
(305, 'dayo', '1418291118', 'Thu 11th Dec, 2014 - 10:45 18 AM', 'lout'),
(306, 'dayo', '1418566154', 'Sun 14th Dec, 2014 - 3:09 14 PM', 'lout'),
(307, 'dayo', '1418568412', 'Sun 14th Dec, 2014 - 3:46 52 PM', 'lout'),
(308, 'shade', '1422611340', 'Fri 30th Jan, 2015 - 10:49 00 AM', 'lout'),
(309, 'shade', '1422611676', 'Fri 30th Jan, 2015 - 10:54 36 AM', 'lout'),
(310, 'shade', '1422612835', 'Fri 30th Jan, 2015 - 11:13 55 AM', 'lout'),
(311, 'shade', '1422612860', 'Fri 30th Jan, 2015 - 11:14 20 AM', 'lout'),
(312, 'shade', '1422612873', 'Fri 30th Jan, 2015 - 11:14 33 AM', 'lin'),
(313, 'shade', '1422612880', 'Fri 30th Jan, 2015 - 11:14 40 AM', 'lout'),
(314, 'shade', '1422614000', 'Fri 30th Jan, 2015 - 11:33 20 AM', 'lin'),
(315, 'shade', '1422614298', 'Fri 30th Jan, 2015 - 11:38 18 AM', 'lout'),
(316, 'juwon', '1422616615', 'Fri 30th Jan, 2015 - 12:16 55 PM', 'lin'),
(317, 'juwon', '1422617006', 'Fri 30th Jan, 2015 - 12:23 26 PM', 'lout'),
(318, 'juwon', '1422617010', 'Fri 30th Jan, 2015 - 12:23 30 PM', 'lout'),
(319, 'juwon', '1422617244', 'Fri 30th Jan, 2015 - 12:27 24 PM', 'lin'),
(320, 'juwon', '1422617262', 'Fri 30th Jan, 2015 - 12:27 42 PM', 'lout'),
(321, 'shade', '1422617310', 'Fri 30th Jan, 2015 - 12:28 30 PM', 'lin'),
(322, 'shade', '1422617322', 'Fri 30th Jan, 2015 - 12:28 42 PM', 'lout'),
(323, 'shade', '1422617326', 'Fri 30th Jan, 2015 - 12:28 46 PM', 'lout'),
(324, 'shade', '1422617350', 'Fri 30th Jan, 2015 - 12:29 10 PM', 'lin'),
(325, 'shade', '1422617355', 'Fri 30th Jan, 2015 - 12:29 15 PM', 'lout'),
(326, 'juwon', '1422617666', 'Fri 30th Jan, 2015 - 12:34 26 PM', 'lin'),
(327, 'juwon', '1422647002', 'Fri 30th Jan, 2015 - 8:43 22 PM', 'lin'),
(328, 'juwon', '1422647032', 'Fri 30th Jan, 2015 - 8:43 52 PM', 'lin'),
(329, 'juwon', '1422647140', 'Fri 30th Jan, 2015 - 8:45 40 PM', 'lout'),
(330, 'shade', '1422647223', 'Fri 30th Jan, 2015 - 8:47 03 PM', 'lin'),
(331, 'shade', '1422647305', 'Fri 30th Jan, 2015 - 8:48 25 PM', 'lout'),
(332, 'juwon', '1422650363', 'Fri 30th Jan, 2015 - 9:39 23 PM', 'lout'),
(333, 'shade', '1422650380', 'Fri 30th Jan, 2015 - 9:39 40 PM', 'lin'),
(334, 'shade', '1422650468', 'Fri 30th Jan, 2015 - 9:41 08 PM', 'lout'),
(335, 'juwon', '1422650488', 'Fri 30th Jan, 2015 - 9:41 28 PM', 'lin'),
(336, 'juwon', '1422650904', 'Fri 30th Jan, 2015 - 9:48 24 PM', 'lout'),
(337, 'shade', '1422650937', 'Fri 30th Jan, 2015 - 9:48 57 PM', 'lin'),
(338, 'shade', '1422651455', 'Fri 30th Jan, 2015 - 9:57 35 PM', 'lout'),
(339, 'juwon', '1422681189', 'Sat 31st Jan, 2015 - 6:13 09 AM', 'lin'),
(340, 'juwon', '1422681516', 'Sat 31st Jan, 2015 - 6:18 36 AM', 'lout'),
(341, 'joseph', '1422681526', 'Sat 31st Jan, 2015 - 6:18 46 AM', 'lin'),
(342, 'joseph', '1422687131', 'Sat 31st Jan, 2015 - 7:52 11 AM', 'lout'),
(343, 'shade', '1422687143', 'Sat 31st Jan, 2015 - 7:52 23 AM', 'lin'),
(344, 'shade', '1422688686', 'Sat 31st Jan, 2015 - 8:18 06 AM', 'lout'),
(345, 'kehinde', '1422688697', 'Sat 31st Jan, 2015 - 8:18 17 AM', 'lin'),
(346, 'kehinde', '1422719935', 'Sat 31st Jan, 2015 - 4:58 55 PM', 'lin'),
(347, 'kehinde', '1422720838', 'Sat 31st Jan, 2015 - 5:13 58 PM', 'lout'),
(348, 'juwon', '1422823463', 'Sun 1st Feb, 2015 - 9:44 23 PM', 'lin'),
(349, 'juwon', '1422823666', 'Sun 1st Feb, 2015 - 9:47 46 PM', 'lout'),
(350, 'juwon', '1422823762', 'Sun 1st Feb, 2015 - 9:49 22 PM', 'lin'),
(351, 'juwon', '1422824133', 'Sun 1st Feb, 2015 - 9:55 33 PM', 'lout'),
(352, 'shade', '1422824221', 'Sun 1st Feb, 2015 - 9:57 01 PM', 'lin'),
(353, 'shade', '1422825065', 'Sun 1st Feb, 2015 - 10:11 05 PM', 'lout'),
(354, 'juwon', '1423851077', 'Fri 13th Feb, 2015 - 7:11 17 PM', 'lin'),
(355, 'joseph', '1423911465', 'Sat 14th Feb, 2015 - 11:57 45 AM', 'lin'),
(356, 'joseph', '1423911735', 'Sat 14th Feb, 2015 - 12:02 15 PM', 'lout'),
(357, 'juwon', '1423911755', 'Sat 14th Feb, 2015 - 12:02 35 PM', 'lin'),
(358, 'juwon', '1423911819', 'Sat 14th Feb, 2015 - 12:03 39 PM', 'lout'),
(359, 'bayo', '1423936527', 'Sat 14th Feb, 2015 - 6:55 27 PM', 'lin'),
(360, 'blessing', '1423936648', 'Sat 14th Feb, 2015 - 6:57 28 PM', 'lin'),
(361, 'blessing', '1423937218', 'Sat 14th Feb, 2015 - 7:06 58 PM', 'lout'),
(362, 'bayo', '1423937222', 'Sat 14th Feb, 2015 - 7:07 02 PM', 'lout'),
(363, 'juwon', '1424061835', 'Mon 16th Feb, 2015 - 5:43 55 AM', 'lin'),
(364, 'juwon', '1424064934', 'Mon 16th Feb, 2015 - 6:35 34 AM', 'lout'),
(365, 'joseph', '1424291337', 'Wed 18th Feb, 2015 - 9:28 57 PM', 'lin'),
(366, 'bayo', '1435392353', 'Sat 27th Jun, 2015 - 10:05 53 AM', 'lin'),
(367, 'bayo', '1435394213', 'Sat 27th Jun, 2015 - 10:36 53 AM', 'lout'),
(368, 'bayo', '1435531363', 'Mon 29th Jun, 2015 - 12:42 43 AM', 'lin'),
(369, 'blessing', '1435531475', 'Mon 29th Jun, 2015 - 12:44 35 AM', 'lin'),
(370, 'blessing', '1435531513', 'Mon 29th Jun, 2015 - 12:45 13 AM', 'lout'),
(371, 'bayo', '1435930787', 'Fri 3rd Jul, 2015 - 3:39 47 PM', 'lin'),
(372, 'bayo', '1435930849', 'Fri 3rd Jul, 2015 - 3:40 49 PM', 'lout'),
(373, '11234ty', '1435931198', 'Fri 3rd Jul, 2015 - 3:46 38 PM', 'lin'),
(374, '11234ty', '1435931422', 'Fri 3rd Jul, 2015 - 3:50 22 PM', 'lout'),
(375, 'joseph', '1439139715', 'Sun 9th Aug, 2015 - 7:01 55 PM', 'lin'),
(376, 'dele', '1439139801', 'Sun 9th Aug, 2015 - 7:03 21 PM', 'lin'),
(377, 'shade', '1439140183', 'Sun 9th Aug, 2015 - 7:09 43 PM', 'lin'),
(378, 'shade', '1439140194', 'Sun 9th Aug, 2015 - 7:09 54 PM', 'lout'),
(379, 'joseph', '1439140211', 'Sun 9th Aug, 2015 - 7:10 11 PM', 'lin'),
(380, 'joseph', '1439140218', 'Sun 9th Aug, 2015 - 7:10 18 PM', 'lout'),
(381, 'dele', '1439140246', 'Sun 9th Aug, 2015 - 7:10 46 PM', 'lin'),
(382, 'dele', '1439140250', 'Sun 9th Aug, 2015 - 7:10 50 PM', 'lout'),
(383, 'blessing', '1439145057', 'Sun 9th Aug, 2015 - 8:30 57 PM', 'lin'),
(384, 'blessing', '1439145060', 'Sun 9th Aug, 2015 - 8:31 00 PM', 'lout'),
(385, 'bayo', '1439145103', 'Sun 9th Aug, 2015 - 8:31 43 PM', 'lin'),
(386, 'bayo', '1439145790', 'Sun 9th Aug, 2015 - 8:43 10 PM', 'lout'),
(387, 'ibitoye', '1439145935', 'Sun 9th Aug, 2015 - 8:45 35 PM', 'lin'),
(388, 'ibitoye', '1439145958', 'Sun 9th Aug, 2015 - 8:45 58 PM', 'lout'),
(389, 'dare', '1439146006', 'Sun 9th Aug, 2015 - 8:46 46 PM', 'lin'),
(390, 'dare', '1439146094', 'Sun 9th Aug, 2015 - 8:48 14 PM', 'lout'),
(391, 'sadiq', '1439146106', 'Sun 9th Aug, 2015 - 8:48 26 PM', 'lin'),
(392, 'sadiq', '1439146190', 'Sun 9th Aug, 2015 - 8:49 50 PM', 'lout'),
(393, 'bayo', '1439146588', 'Sun 9th Aug, 2015 - 8:56 28 PM', 'lout'),
(394, 'bayo', '1439146673', 'Sun 9th Aug, 2015 - 8:57 53 PM', 'lin'),
(395, 'bayo', '1439146687', 'Sun 9th Aug, 2015 - 8:58 07 PM', 'lout'),
(396, 'bayo', '1439146696', 'Sun 9th Aug, 2015 - 8:58 16 PM', 'lout'),
(397, 'dare', '1439147405', 'Sun 9th Aug, 2015 - 9:10 05 PM', 'lin'),
(398, 'dare', '1439147443', 'Sun 9th Aug, 2015 - 9:10 43 PM', 'lout'),
(399, 'ayodele', '1439147700', 'Sun 9th Aug, 2015 - 9:15 00 PM', 'lin'),
(400, 'ayodele', '1439147926', 'Sun 9th Aug, 2015 - 9:18 46 PM', 'lout'),
(401, 'ayodele', '1439149902', 'Sun 9th Aug, 2015 - 9:51 42 PM', 'lin'),
(402, 'ayodele', '1439150305', 'Sun 9th Aug, 2015 - 9:58 25 PM', 'lout'),
(403, 'dare', '1439150616', 'Sun 9th Aug, 2015 - 10:03 36 PM', 'lin'),
(404, 'bayo', '1439150799', 'Sun 9th Aug, 2015 - 10:06 39 PM', 'lout'),
(405, 'dare', '1439150868', 'Sun 9th Aug, 2015 - 10:07 48 PM', 'lin'),
(406, 'dare', '1439150873', 'Sun 9th Aug, 2015 - 10:07 53 PM', 'lout'),
(407, 'bayo', '1439203143', 'Mon 10th Aug, 2015 - 12:39 03 PM', 'lin'),
(408, 'bayo', '1439203276', 'Mon 10th Aug, 2015 - 12:41 16 PM', 'lout'),
(409, 'tosin', '1439203407', 'Mon 10th Aug, 2015 - 12:43 27 PM', 'lin'),
(410, 'tosin', '1439204042', 'Mon 10th Aug, 2015 - 12:54 02 PM', 'lout'),
(411, 'bayo', '1439205406', 'Mon 10th Aug, 2015 - 1:16 46 PM', 'lout'),
(412, 'tosin', '1439205418', 'Mon 10th Aug, 2015 - 1:16 58 PM', 'lin'),
(413, 'tosin', '1439205448', 'Mon 10th Aug, 2015 - 1:17 28 PM', 'lout'),
(414, 'juwon', '1439728622', 'Sun 16th Aug, 2015 - 2:37 02 PM', 'lout'),
(415, 'juwon', '1439728626', 'Sun 16th Aug, 2015 - 2:37 06 PM', 'lin'),
(416, 'juwon', '1439728668', 'Sun 16th Aug, 2015 - 2:37 48 PM', 'lout'),
(417, 'tosin', '1439728838', 'Sun 16th Aug, 2015 - 2:40 38 PM', 'lin'),
(418, 'shade', '1439728939', 'Sun 16th Aug, 2015 - 2:42 19 PM', 'lin'),
(419, 'shade', '1439729006', 'Sun 16th Aug, 2015 - 2:43 26 PM', 'lout'),
(420, 'tosin', '1439729018', 'Sun 16th Aug, 2015 - 2:43 38 PM', 'lout'),
(421, '55190592EG', '1439740018', 'Sun 16th Aug, 2015 - 5:46 58 PM', 'lin'),
(422, '55190592EG', '1439741907', 'Sun 16th Aug, 2015 - 6:18 27 PM', 'lout'),
(423, 'bayo', '1439743591', 'Sun 16th Aug, 2015 - 6:46 31 PM', 'lin'),
(424, 'bayo', '1439744091', 'Sun 16th Aug, 2015 - 6:54 51 PM', 'lin'),
(425, 'bayo', '1439745311', 'Sun 16th Aug, 2015 - 7:15 11 PM', 'lout'),
(426, 'joseph', '1439746505', 'Sun 16th Aug, 2015 - 7:35 05 PM', 'lin'),
(427, 'joseph', '1439746835', 'Sun 16th Aug, 2015 - 7:40 35 PM', 'lin'),
(428, 'joseph', '1439746890', 'Sun 16th Aug, 2015 - 7:41 30 PM', 'lin'),
(429, 'joseph', '1439746933', 'Sun 16th Aug, 2015 - 7:42 13 PM', 'lin'),
(430, 'joseph', '1439747360', 'Sun 16th Aug, 2015 - 7:49 20 PM', 'lout'),
(431, 'bayo', '1439747615', 'Sun 16th Aug, 2015 - 7:53 35 PM', 'lin'),
(432, 'bayo', '1439748167', 'Sun 16th Aug, 2015 - 8:02 47 PM', 'lout'),
(433, 'bayo', '1439748311', 'Sun 16th Aug, 2015 - 8:05 11 PM', 'lin'),
(434, 'bayo', '1439748315', 'Sun 16th Aug, 2015 - 8:05 15 PM', 'lout'),
(435, 'joseph', '1439748457', 'Sun 16th Aug, 2015 - 8:07 37 PM', 'lin'),
(436, 'bayo', '1439749547', 'Sun 16th Aug, 2015 - 8:25 47 PM', 'lin'),
(437, 'bayo', '1439749550', 'Sun 16th Aug, 2015 - 8:25 50 PM', 'lout'),
(438, 'ibitoye', '1439749628', 'Sun 16th Aug, 2015 - 8:27 08 PM', 'lin'),
(439, 'joseph', '1439749893', 'Sun 16th Aug, 2015 - 8:31 33 PM', 'lout'),
(440, 'ibitoye', '1439750394', 'Sun 16th Aug, 2015 - 8:39 54 PM', 'lin'),
(441, 'ibitoye', '1439750922', 'Sun 16th Aug, 2015 - 8:48 42 PM', 'lout'),
(442, 'ibitoye', '1439750924', 'Sun 16th Aug, 2015 - 8:48 44 PM', 'lout'),
(443, 'ibitoye', '1439750925', 'Sun 16th Aug, 2015 - 8:48 45 PM', 'lout'),
(444, 'ibitoye', '1439750926', 'Sun 16th Aug, 2015 - 8:48 46 PM', 'lout'),
(445, 'ibitoye', '1439750927', 'Sun 16th Aug, 2015 - 8:48 47 PM', 'lout'),
(446, 'ibitoye', '1439750928', 'Sun 16th Aug, 2015 - 8:48 48 PM', 'lout'),
(447, 'ibitoye', '1439750928', 'Sun 16th Aug, 2015 - 8:48 48 PM', 'lout'),
(448, 'ibitoye', '1439750931', 'Sun 16th Aug, 2015 - 8:48 51 PM', 'lout'),
(449, 'ibitoye', '1439750932', 'Sun 16th Aug, 2015 - 8:48 52 PM', 'lout'),
(450, 'ibitoye', '1439750934', 'Sun 16th Aug, 2015 - 8:48 54 PM', 'lout'),
(451, 'ibitoye', '1439750935', 'Sun 16th Aug, 2015 - 8:48 55 PM', 'lout'),
(452, 'ibitoye', '1439750936', 'Sun 16th Aug, 2015 - 8:48 56 PM', 'lout'),
(453, 'ibitoye', '1439750937', 'Sun 16th Aug, 2015 - 8:48 57 PM', 'lout'),
(454, 'ibitoye', '1439750938', 'Sun 16th Aug, 2015 - 8:48 58 PM', 'lout'),
(455, 'ibitoye', '1439750939', 'Sun 16th Aug, 2015 - 8:48 59 PM', 'lout'),
(456, 'ibitoye', '1439750940', 'Sun 16th Aug, 2015 - 8:49 00 PM', 'lout'),
(457, 'ibitoye', '1439750941', 'Sun 16th Aug, 2015 - 8:49 01 PM', 'lout'),
(458, 'ibitoye', '1439750942', 'Sun 16th Aug, 2015 - 8:49 02 PM', 'lout'),
(459, 'ibitoye', '1439750942', 'Sun 16th Aug, 2015 - 8:49 02 PM', 'lout'),
(460, 'dare', '1439752460', 'Sun 16th Aug, 2015 - 9:14 20 PM', 'lin'),
(461, 'dare', '1439752652', 'Sun 16th Aug, 2015 - 9:17 32 PM', 'lout'),
(462, 'dele', '1439759773', 'Sun 16th Aug, 2015 - 11:16 13 PM', 'lin'),
(463, 'dele', '1439760263', 'Sun 16th Aug, 2015 - 11:24 23 PM', 'lout'),
(464, '55190592EG', '1439760616', 'Sun 16th Aug, 2015 - 11:30 16 PM', 'lin'),
(465, '55190592EG', '1439762430', 'Mon 17th Aug, 2015 - 12:00 30 AM', 'lout'),
(466, '55190592EG', '1439762466', 'Mon 17th Aug, 2015 - 12:01 06 AM', 'lin'),
(467, '55190592EG', '1439762491', 'Mon 17th Aug, 2015 - 12:01 31 AM', 'lout'),
(468, 'ibitoye', '1439764205', 'Mon 17th Aug, 2015 - 12:30 05 AM', 'lin'),
(469, 'ibitoye', '1439764216', 'Mon 17th Aug, 2015 - 12:30 16 AM', 'lout'),
(470, 'ibitoye', '1439857727', 'Tue 18th Aug, 2015 - 2:28 47 AM', 'lin'),
(471, 'ibitoye', '1439857731', 'Tue 18th Aug, 2015 - 2:28 51 AM', 'lout'),
(472, 'ibitoye', '1439857735', 'Tue 18th Aug, 2015 - 2:28 55 AM', 'lin'),
(473, 'ibitoye', '1439857738', 'Tue 18th Aug, 2015 - 2:28 58 AM', 'lout'),
(474, 'juwon', '1439913208', 'Tue 18th Aug, 2015 - 5:53 28 PM', 'lin'),
(475, 'juwon', '1439913225', 'Tue 18th Aug, 2015 - 5:53 45 PM', 'lout'),
(476, 'ayodele', '1439941041', 'Wed 19th Aug, 2015 - 1:37 21 AM', 'lin'),
(477, 'ayodele', '1439941168', 'Wed 19th Aug, 2015 - 1:39 28 AM', 'lout'),
(478, 'ibitoye', '1439941471', 'Wed 19th Aug, 2015 - 1:44 31 AM', 'lin'),
(479, 'ibitoye', '1439941474', 'Wed 19th Aug, 2015 - 1:44 34 AM', 'lout'),
(480, 'tosin', '1439941485', 'Wed 19th Aug, 2015 - 1:44 45 AM', 'lin'),
(481, 'tosin', '1439942321', 'Wed 19th Aug, 2015 - 1:58 41 AM', 'lin'),
(482, 'tosin', '1439942721', 'Wed 19th Aug, 2015 - 2:05 21 AM', 'lout'),
(483, 'dayo', '1440159861', 'Fri 21st Aug, 2015 - 2:24 21 PM', 'lin'),
(484, 'dayo', '1440160052', 'Fri 21st Aug, 2015 - 2:27 32 PM', 'lout'),
(485, 'shade', '1440167445', 'Fri 21st Aug, 2015 - 4:30 45 PM', 'lin'),
(486, 'shade', '1440167481', 'Fri 21st Aug, 2015 - 4:31 21 PM', 'lout'),
(487, 'bayo', '1440226078', 'Sat 22nd Aug, 2015 - 8:47 58 AM', 'lin'),
(488, 'bayo', '1440226320', 'Sat 22nd Aug, 2015 - 8:52 00 AM', 'lout'),
(489, 'bayo', '1440427302', 'Mon 24th Aug, 2015 - 4:41 42 PM', 'lin'),
(490, 'bayo', '1440427328', 'Mon 24th Aug, 2015 - 4:42 08 PM', 'lout'),
(491, 'shade', '1440427353', 'Mon 24th Aug, 2015 - 4:42 33 PM', 'lin'),
(492, 'shade', '1440427756', 'Mon 24th Aug, 2015 - 4:49 16 PM', 'lout'),
(493, 'juwon', '1440583924', 'Wed 26th Aug, 2015 - 12:12 04 PM', 'lin'),
(494, 'juwon', '1440583955', 'Wed 26th Aug, 2015 - 12:12 35 PM', 'lout'),
(495, 'ibiyemi', '1440584152', 'Wed 26th Aug, 2015 - 12:15 52 PM', 'lin'),
(496, 'ibiyemi', '1440584458', 'Wed 26th Aug, 2015 - 12:20 58 PM', 'lout'),
(497, 'kwcoetl/ap2016/0002', '1440594343', 'Wed 26th Aug, 2015 - 3:05 43 PM', 'lin'),
(498, 'kwcoetl/ap2016/0002', '1440594583', 'Wed 26th Aug, 2015 - 3:09 43 PM', 'lout'),
(499, 'KWCOETL/AP2016/0002', '1440618316', 'Wed 26th Aug, 2015 - 9:45 16 PM', 'lin'),
(500, 'KWCOETL/AP2016/0002', '1440618343', 'Wed 26th Aug, 2015 - 9:45 43 PM', 'lout'),
(501, 'KWCOETL/AP2016/0003', '1440636452', 'Thu 27th Aug, 2015 - 2:47 32 AM', 'lin'),
(502, 'KWCOETL/AP2016/0003', '1440638539', 'Thu 27th Aug, 2015 - 3:22 19 AM', 'lin'),
(503, 'KWCOETL/AP2016/0003', '1440638671', 'Thu 27th Aug, 2015 - 3:24 31 AM', 'lin'),
(504, 'KWCOETL/AP2016/0003', '1440638904', 'Thu 27th Aug, 2015 - 3:28 24 AM', 'lout'),
(505, 'KWCOETL/AP2016/0004', '1440639463', 'Thu 27th Aug, 2015 - 3:37 43 AM', 'lin'),
(506, 'KWCOETL/AP2016/0004', '1440640108', 'Thu 27th Aug, 2015 - 3:48 28 AM', 'lin'),
(507, 'KWCOETL/AP2016/0004', '1440640224', 'Thu 27th Aug, 2015 - 3:50 24 AM', 'lout'),
(508, 'KWCOETL/AP2016/0005', '1440640285', 'Thu 27th Aug, 2015 - 3:51 25 AM', 'lin'),
(509, 'KWCOETL/AP2016/0005', '1440640364', 'Thu 27th Aug, 2015 - 3:52 44 AM', 'lin'),
(510, '56299321IG', '1440641020', 'Thu 27th Aug, 2015 - 4:03 40 AM', 'lin'),
(511, '56299321IG', '1440641156', 'Thu 27th Aug, 2015 - 4:05 56 AM', 'lout'),
(512, 'KWCOETL/AP2016/0006', '1440654525', 'Thu 27th Aug, 2015 - 7:48 45 AM', 'lin'),
(513, 'KWCOETL/AP2016/0007', '1440671453', 'Thu 27th Aug, 2015 - 12:30 53 PM', 'lin'),
(514, 'KWCOETL/AP2016/0007', '1440671537', 'Thu 27th Aug, 2015 - 12:32 17 PM', 'lin'),
(515, 'KWCOETL/AP2016/0007', '1440671581', 'Thu 27th Aug, 2015 - 12:33 01 PM', 'lout'),
(516, 'KWCOETL/AP2016/0002', '1440671685', 'Thu 27th Aug, 2015 - 12:34 45 PM', 'lin'),
(517, 'KWCOETL/AP2016/0002', '1440671753', 'Thu 27th Aug, 2015 - 12:35 53 PM', 'lout'),
(518, 'KWCOETL/AP2016/0008', '1440671834', 'Thu 27th Aug, 2015 - 12:37 14 PM', 'lin'),
(519, 'KWCOETL/AP2016/0008', '1440672085', 'Thu 27th Aug, 2015 - 12:41 25 PM', 'lout'),
(520, 'KWCOETL/AP2016/0001', '1440676326', 'Thu 27th Aug, 2015 - 1:52 06 PM', 'lin'),
(521, 'KWCOETL/AP2016/0001', '1440676437', 'Thu 27th Aug, 2015 - 1:53 57 PM', 'lin'),
(522, 'KWCOETL/AP2016/0001', '1440676626', 'Thu 27th Aug, 2015 - 1:57 06 PM', 'lout'),
(523, 'KWCOETL/AP2016/0001', '1441035046', 'Mon 31st Aug, 2015 - 5:30 46 PM', 'lin'),
(524, 'KWCOETL/AP2016/0001', '1441035789', 'Mon 31st Aug, 2015 - 5:43 09 PM', 'lout'),
(525, 'KWCOETL/AP2016/0005', '1441035888', 'Mon 31st Aug, 2015 - 5:44 48 PM', 'lin'),
(526, 'KWCOETL/AP2016/0005', '1441036448', 'Mon 31st Aug, 2015 - 5:54 08 PM', 'lout'),
(527, 'KWCOETL/AP2016/0005', '1441037300', 'Mon 31st Aug, 2015 - 6:08 20 PM', 'lin'),
(528, 'KWCOETL/AP2016/0005', '1441037328', 'Mon 31st Aug, 2015 - 6:08 48 PM', 'lout'),
(529, 'KWCOETL/AP2016/0006', '1441038374', 'Mon 31st Aug, 2015 - 6:26 14 PM', 'lin'),
(530, 'KWCOETL/AP2016/0006', '1441038388', 'Mon 31st Aug, 2015 - 6:26 28 PM', 'lout'),
(531, '15/55ec002', '1441044588', 'Mon 31st Aug, 2015 - 8:09 48 PM', 'lin'),
(532, '15/55ec002', '1441044613', 'Mon 31st Aug, 2015 - 8:10 13 PM', 'lout'),
(533, '15/55ec001', '1441044631', 'Mon 31st Aug, 2015 - 8:10 31 PM', 'lin'),
(534, '15/55ec001', '1441044710', 'Mon 31st Aug, 2015 - 8:11 50 PM', 'lout'),
(535, 'KWCOETL/AP2016/0002', '1441046659', 'Mon 31st Aug, 2015 - 8:44 19 PM', 'lin'),
(536, 'KWCOETL/AP2016/0002', '1441046704', 'Mon 31st Aug, 2015 - 8:45 04 PM', 'lout'),
(537, 'KWCOETL/AP2016/0002', '1441047042', 'Mon 31st Aug, 2015 - 8:50 42 PM', 'lin'),
(538, '15/55ec002', '1441047371', 'Mon 31st Aug, 2015 - 8:56 11 PM', 'lin'),
(539, '15/55ec002', '1441049015', 'Mon 31st Aug, 2015 - 9:23 35 PM', 'lin'),
(540, '15/55ec002', '1441049186', 'Mon 31st Aug, 2015 - 9:26 26 PM', 'lout'),
(541, '15/55ec002', '1441049209', 'Mon 31st Aug, 2015 - 9:26 49 PM', 'lin'),
(542, '15/55ec002', '1441049245', 'Mon 31st Aug, 2015 - 9:27 25 PM', 'lout'),
(543, 'kwcoetl/ap2016/0002', '1441049472', 'Mon 31st Aug, 2015 - 9:31 12 PM', 'lin'),
(544, 'kwcoetl/ap2016/0002', '1441049763', 'Mon 31st Aug, 2015 - 9:36 03 PM', 'lout'),
(545, 'kwcoetl/ap2016/0002', '1441140980', 'Tue 1st Sep, 2015 - 10:56 20 PM', 'lin'),
(546, 'kwcoetl/ap2016/0002', '1441141052', 'Tue 1st Sep, 2015 - 10:57 32 PM', 'lout');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`sn`,`username`);

--
-- Indexes for table `course_schedule`
--
ALTER TABLE `course_schedule`
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
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`sn`,`code`);

--
-- Indexes for table `passages`
--
ALTER TABLE `passages`
  ADD PRIMARY KEY (`sn`,`id`);

--
-- Indexes for table `qtn_remind`
--
ALTER TABLE `qtn_remind`
  ADD PRIMARY KEY (`sn`,`user_id`,`uniqueid`,`coursecode`);

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
-- Indexes for table `time_remind`
--
ALTER TABLE `time_remind`
  ADD PRIMARY KEY (`sn`,`user_id`,`uniqueid`,`coursecode`);

--
-- Indexes for table `time_schedule`
--
ALTER TABLE `time_schedule`
  ADD PRIMARY KEY (`sn`,`user_id`);

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
-- Indexes for table `users_result`
--
ALTER TABLE `users_result`
  ADD PRIMARY KEY (`sn`,`user_id`,`coursecode`,`uniqueid`);

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
  MODIFY `sn` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `sn` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
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
-- AUTO_INCREMENT for table `passages`
--
ALTER TABLE `passages`
  MODIFY `sn` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `qtn_remind`
--
ALTER TABLE `qtn_remind`
  MODIFY `sn` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `sn` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;
--
-- AUTO_INCREMENT for table `time_remind`
--
ALTER TABLE `time_remind`
  MODIFY `sn` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `time_schedule`
--
ALTER TABLE `time_schedule`
  MODIFY `sn` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `sn` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `users_course_reg`
--
ALTER TABLE `users_course_reg`
  MODIFY `sn` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users_result`
--
ALTER TABLE `users_result`
  MODIFY `sn` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `userslogs`
--
ALTER TABLE `userslogs`
  MODIFY `sn` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=547;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
