-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2023 at 12:48 PM
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
-- Database: `digital_ob`
--

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `id` int(11) NOT NULL,
  `ob_number` varchar(20) NOT NULL,
  `crime_type` varchar(50) NOT NULL,
  `date_reported` timestamp NOT NULL DEFAULT current_timestamp(),
  `recorded_by` int(20) NOT NULL,
  `station` varchar(50) NOT NULL,
  `statement` varchar(250) NOT NULL,
  `investigator` int(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Ongoing',
  `date_completed` datetime DEFAULT NULL,
  `report` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complainants`
--

CREATE TABLE `complainants` (
  `id` int(11) NOT NULL,
  `ob_number` varchar(20) NOT NULL,
  `comp_name` varchar(250) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `occupation` varchar(50) NOT NULL,
  `age` int(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `region` varchar(50) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `crime_type` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `station_reported` varchar(50) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crimes`
--

CREATE TABLE `crimes` (
  `id` int(11) NOT NULL,
  `crime_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crimes`
--

INSERT INTO `crimes` (`id`, `crime_type`) 
VALUES (1, 'Domestic Violence'),
(2, 'Murder Case'),
(3, 'Assault'),
(4, 'Theft'),
(5, 'Defilement'),
(6, 'Robbery'),
(7, 'Road Accident'),
(8, 'Fraud'),
(9, 'Vandalism'),
(10, 'Burglary'),
(11, 'Corruption'),
(12, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE `stations` (
  `id` int(20) NOT NULL,
  `station` varchar(50) NOT NULL,
  `address` varchar(250) NOT NULL,
  `location` varchar(50) NOT NULL,
  `phone` int(50) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stations`
--

INSERT INTO `stations` (`id`, `station`, `address`, `location`, `phone`, `date_added`) VALUES
(1, 'Central Police Station', 'Uhuru Highway, Nairobi', 'Nairobi', 712345678, '2023-04-27 08:24:35'),
(2, 'Kasarani Police Station', 'Kasarani Road, Nairobi', 'Nairobi', 723456789, '2023-04-27 08:24:35'),
(3, 'Kilimani Police Station', 'Argwings Kodhek Road, Nairobi', 'Nairobi', 734567890, '2023-04-27 08:24:35'),
(4, 'Embakasi Police Station', 'Embakasi, Nairobi', 'Nairobi', 745678901, '2023-04-27 08:24:35'),
(5, 'Parklands Police Station', 'Parklands Avenue, Nairobi', 'Nairobi', 756789012, '2023-04-27 08:24:35'),
(6, 'Langata Police Station', 'Langata Road, Nairobi', 'Nairobi', 767890123, '2023-04-27 08:24:35'),
(7, 'Buruburu Police Station', 'Buruburu Estate, Nairobi', 'Nairobi', 778901234, '2023-04-27 08:24:35'),
(8, 'Ruaraka Police Station', 'Ruaraka, Nairobi', 'Nairobi', 789012345, '2023-04-27 08:24:35'),
(9, 'South B Police Station', 'South B Estate, Nairobi', 'Nairobi', 790123456, '2023-04-27 08:24:35'),
(10, 'Gigiri Police Station', 'UN Avenue, Nairobi', 'Nairobi', 801234567, '2023-04-27 08:24:35'),
(11, 'Dandora Police Station', 'Dandora Estate, Nairobi', 'Nairobi', 812345678, '2023-04-27 08:24:35'),
(12, 'Kahawa West Police Station', 'Kahawa West, Nairobi', 'Nairobi', 823456789, '2023-04-27 08:24:35'),
(13, 'Ngara Police Station', 'Ngara Road, Nairobi', 'Nairobi', 834567890, '2023-04-27 08:24:35'),
(14, 'Kibera Police Station', 'Kibera Drive, Nairobi', 'Nairobi', 845678901, '2023-04-27 08:24:35'),
(15, 'Karen Police Station', 'Karen Road, Nairobi', 'Nairobi', 856789012, '2023-04-27 08:24:35'),
(16, 'Madaraka Police Station', 'Madaraka Estate, Nairobi', 'Nairobi', 867890123, '2023-04-27 08:24:35'),
(17, 'Kileleshwa Police Station', 'Kileleshwa, Nairobi', 'Nairobi', 878901234, '2023-04-27 08:24:35'),
(18, 'Starehe Police Station', 'Pangani, Nairobi', 'Nairobi', 889012345, '2023-04-27 08:24:35'),
(19, 'Westlands Police Station', 'Woodvale Grove, Nairobi', 'Nairobi', 890123456, '2023-04-27 08:24:35'),
(20, 'Njiru Police Station', 'Njiru, Nairobi', 'Nairobi', 901234567, '2023-04-27 08:24:35'),
(21, 'N/A', 'N/A', 'N/A', 0, '2023-04-27 08:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `suspects`
--

CREATE TABLE `suspects` (
  `id` int(11) NOT NULL,
  `ob_number` varchar(20) NOT NULL,
  `crime_suspected` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `national_id` int(50) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone_num` int(20) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `staff_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `station` varchar(50) NOT NULL,
  `rank` varchar(50) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `password` varchar(250) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`staff_id`, `name`, `station`, `rank`, `gender`, `password`, `status`, `date`) VALUES
(1, 'Elvis', 'N/A', 'Inspector General', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Admin', '2023-04-27 08:24:35'),
(11, 'Elvis Mutinda', 'Langata Police Station', 'Chief Inspector', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Incharge Officer', '2023-04-27 08:24:35'),
(22, 'Ryan Silu', 'Central Police Station', 'Chief Inspector', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Incharge Officer', '2023-04-27 08:24:35'),
(33, 'Ruai Dak', 'Kasarani Police Station', 'Chief Inspector', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Incharge Officer', '2023-04-27 08:24:35'),
(44, 'Dom Kimeu', 'South B Police Station', 'Assistant Superintendent', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Incharge Officer', '2023-04-27 08:24:35'),
(55, 'Neville Kalunda', 'Embakasi Police Station', 'Chief Inspector', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Incharge Officer', '2023-04-27 08:24:35'),
(66, 'Adrian Bikuri', 'Kilimani Police Station', 'Chief Inspector', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Incharge Officer', '2023-04-27 08:24:35'),
(77, 'Felista Njeri', 'Buruburu Police Station', 'Chief Inspector', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Incharge Officer', '2023-04-27 08:24:35'),
(88, 'Tania Waiganjo', 'Parklands Police Station', 'Chief Inspector', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Incharge Officer', '2023-04-27 08:24:35'),
(99, 'Paul Mwangi', 'Gigiri Police Station', 'Assistant Superintendent', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Incharge Officer', '2023-04-27 08:24:35'),
(101, 'Eric Muuo', 'Dandora Police Station', 'Assistant Superintendent', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Incharge Officer', '2023-04-27 08:24:35'),
(202, 'Terry Muthoni', 'Kahawa West Police Station', 'Chief Inspector', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Incharge Officer', '2023-04-27 08:24:35'),
(303, 'Kennedy Kithaka', 'Ngara Police Station', 'Assistant Superintendent', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Incharge Officer', '2023-04-27 08:24:35'),
(404, 'Wilberforce Ojuong', 'Kibera Police Station', 'Assistant Superintendent', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Incharge Officer', '2023-04-27 08:24:35'),
(505, 'Taylor Omondi', 'Karen Police Station', 'Chief Inspector', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Incharge Officer', '2023-04-27 08:24:35'),
(606, 'Hansel Ochieng', 'Madaraka Police Station', 'Chief Inspector', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Incharge Officer', '2023-04-27 08:24:35'),
(707, 'Sally Mueni', 'Kileleshwa Police Station', 'Assistant Superintendent', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Incharge Officer', '2023-04-27 08:24:35'),
(808, 'Anita Terry', 'Starehe Police Station', 'Chief Inspector', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Incharge Officer', '2023-04-27 08:24:35'),
(909, 'Shakeel Moez', 'Westlands Police Station', 'Chief Inspector', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Incharge Officer', '2023-04-27 08:24:35'),
(1001, 'Steve Ngui', 'Njiru Police Station', 'Assistant Superintendent', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Incharge Officer', '2023-04-27 08:24:35'),
(11001, 'John Smith', 'Langata Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(11002, 'Emily Johnson', 'Langata Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(11003, 'David Lee', 'Langata Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(11004, 'Olivia Davis', 'Langata Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(11005, 'William Wilson', 'Langata Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(11006, 'Emma Brown', 'Langata Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(11007, 'Jacob Martin', 'Langata Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(11008, 'Ava Hernandez', 'Langata Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(22001, 'Paul Brown', 'Central Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(22002, 'Maria Hernandez', 'Central Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(22003, 'Kevin Lee', 'Central Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(22004, 'Jenny Wilson', 'Central Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(22005, 'Eric Davis', 'Central Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(22006, 'Sophia Johnson', 'Central Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(22007, 'Thomas Martin', 'Central Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(22008, 'Linda Garcia', 'Central Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(33001, 'Michael Clark', 'Kasarani Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(33002, 'Samantha Anderson', 'Kasarani Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(33003, 'Robert Smith', 'Kasarani Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(33004, 'Isabella Davis', 'Kasarani Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(33005, 'Daniel Wilson', 'Kasarani Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(33006, 'Madison Brown', 'Kasarani Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(33007, 'Matthew Martin', 'Kasarani Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(33008, 'Emma Hernandez', 'Kasarani Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(44001, 'Ethan Martinez', 'South B Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(44002, 'Avery Cooper', 'South B Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(44003, 'Mason Lee', 'South B Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(44004, 'Olivia Taylor', 'South B Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(44005, 'Evelyn Jackson', 'South B Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(44006, 'Caleb Wright', 'South B Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(44007, 'Caroline Lee', 'South B Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(44008, 'Brandon Harris', 'South B Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(55001, 'Sofia Garcia', 'Embakasi Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(55002, 'Noah Martinez', 'Embakasi Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(55003, 'Isabella Scott', 'Embakasi Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(55004, 'Liam Perez', 'Embakasi Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(55005, 'Chloe Flores', 'Embakasi Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(55006, 'Jacob Allen', 'Embakasi Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(55007, 'Aria Parker', 'Embakasi Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(55008, 'Logan Ramirez', 'Embakasi Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(66001, 'Harper Collins', 'Kilimani Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(66002, 'William Cook', 'Kilimani Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(66003, 'Ella Kelly', 'Kilimani Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(66004, 'James Wood', 'Kilimani Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(66005, 'Victoria Powell', 'Kilimani Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(66006, 'Michael Lee', 'Kilimani Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(66007, 'Grace Torres', 'Kilimani Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(66008, 'Ethan Gonzales', 'Kilimani Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(77001, 'John Doe', 'Buruburu Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(77002, 'Jane Doe', 'Buruburu Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(77003, 'Peter Parker', 'Buruburu Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(77004, 'Mary Jane', 'Buruburu Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(77005, 'Clark Kent', 'Buruburu Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(77006, 'Lois Lane', 'Buruburu Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(77007, 'Bruce Wayne', 'Buruburu Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(77008, 'Selina Kyle', 'Buruburu Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(88001, 'James Smith', 'Parklands Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(88002, 'Sarah Johnson', 'Parklands Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(88003, 'Michael Davis', 'Parklands Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(88004, 'Emily Wilson', 'Parklands Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(88005, 'David Brown', 'Parklands Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(88006, 'Jennifer Lee', 'Parklands Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(88007, 'Matthew Johnson', 'Parklands Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(88008, 'Jessica Taylor', 'Parklands Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(99001, 'Oliver Queen', 'Gigiri Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(99002, 'Dinah Lance', 'Gigiri Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(99003, 'Barry Allen', 'Gigiri Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(99004, 'Iris West', 'Gigiri Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(99005, 'Hal Jordan', 'Gigiri Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(99006, 'Carol Ferris', 'Gigiri Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(101001, 'James Kimani', 'Dandora Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(101002, 'Grace Njeri', 'Dandora Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(101003, 'John Kamau', 'Dandora Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(101004, 'Ann Wambui', 'Dandora Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(101005, 'Peter Ngugi', 'Dandora Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(101006, 'Jane Wanjiku', 'Dandora Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(101007, 'David Njoroge', 'Dandora Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(101008, 'Mary Nduta', 'Dandora Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(202001, 'Brian Mwangi', 'Kahawa West Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(202002, 'Diana Akinyi', 'Kahawa West Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(202003, 'Michael Omondi', 'Kahawa West Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(202004, 'Lucy Achieng', 'Kahawa West Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(202005, 'Joshua Ochieng', 'Kahawa West Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(202006, 'Faith Njeri', 'Kahawa West Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(202007, 'Daniel Gichuru', 'Kahawa West Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(202008, 'Lydia Wanjiru', 'Kahawa West Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(303001, 'Eric Otieno', 'Ngara Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(303002, 'Joyce Muthoni', 'Ngara Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(303003, 'Vincent Ouma', 'Ngara Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(303004, 'Esther Chebet', 'Ngara Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(303005, 'Isaac Njoroge', 'Ngara Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(303006, 'Juliet Mueni', 'Ngara Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(404001, 'John Doe', 'Kibera Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(404002, 'Jane Smith', 'Kibera Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(404003, 'Peter Parker', 'Kibera Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(404004, 'Mary Jane', 'Kibera Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(505001, 'Bruce Wayne', 'Karen Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(505002, 'Clark Kent', 'Karen Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(505003, 'Diana Prince', 'Karen Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(505004, 'Barry Allen', 'Karen Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(606001, 'Tony Stark', 'Madaraka Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(606002, 'Steve Rogers', 'Madaraka Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(606003, 'Natasha Romanoff', 'Madaraka Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(606004, 'Wanda Maximoff', 'Madaraka Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(707001, 'Scott Lang', 'Kileleshwa Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(707002, 'Hope Van Dyne', 'Kileleshwa Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(707003, 'TChalla', 'Kileleshwa Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(707004, 'Peter Quill', 'Kileleshwa Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(808001, 'Sam Wilson', 'Starehe Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(808002, 'Bucky Barnes', 'Starehe Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(808003, 'Gamora', 'Starehe Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(808004, 'Nebula', 'Starehe Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(909001, 'Oliver Queen', 'Westlands Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(909002, 'Felicity Smoak', 'Westlands Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(909003, 'Barbara Gordon', 'Westlands Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(909004, 'Dick Grayson', 'Westlands Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(1001001, 'John Doe', 'Njiru Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(1001002, 'Jane Doe', 'Njiru Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(1001003, 'David Kim', 'Njiru Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(1001004, 'Grace Kinyua', 'Njiru Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(1001005, 'Robert Mwaura', 'Njiru Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(1001006, 'Winnie Ngugi', 'Njiru Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(1001007, 'Brian Kariuki', 'Njiru Police Station', 'Corporal', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(1001008, 'Samantha Muthoni', 'Njiru Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `status`) VALUES
(4, 'Admin'),
(1, 'Incharge Officer'),
(3, 'Investigating Officer'),
(2, 'Police');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recorded_by` (`recorded_by`),
  ADD KEY `investigator` (`investigator`),
  ADD KEY `ob_number` (`ob_number`);

--
-- Indexes for table `complainants`
--
ALTER TABLE `complainants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ob_number` (`ob_number`),
  ADD KEY `crime_type` (`crime_type`);

--
-- Indexes for table `crimes`
--
ALTER TABLE `crimes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `crime_type` (`crime_type`);

--
-- Indexes for table `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `station` (`station`);

--
-- Indexes for table `suspects`
--
ALTER TABLE `suspects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crime_suspected` (`crime_suspected`),
  ADD KEY `ob_number` (`ob_number`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `station` (`station`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status` (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cases`
--
ALTER TABLE `cases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complainants`
--
ALTER TABLE `complainants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crimes`
--
ALTER TABLE `crimes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `stations`
--
ALTER TABLE `stations`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `suspects`
--
ALTER TABLE `suspects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cases`
--
ALTER TABLE `cases`
  ADD CONSTRAINT `cases_ibfk_1` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`staff_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cases_ibfk_2` FOREIGN KEY (`investigator`) REFERENCES `users` (`staff_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cases_ibfk_3` FOREIGN KEY (`ob_number`) REFERENCES `complainants` (`ob_number`) ON DELETE CASCADE;

--
-- Constraints for table `complainants`
--
ALTER TABLE `complainants`
  ADD CONSTRAINT `complainants_ibfk_1` FOREIGN KEY (`crime_type`) REFERENCES `crimes` (`crime_type`) ON DELETE CASCADE;

--
-- Constraints for table `suspects`
--
ALTER TABLE `suspects`
  ADD CONSTRAINT `suspects_ibfk_1` FOREIGN KEY (`crime_suspected`) REFERENCES `crimes` (`crime_type`) ON UPDATE CASCADE,
  ADD CONSTRAINT `suspects_ibfk_2` FOREIGN KEY (`ob_number`) REFERENCES `cases` (`ob_number`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`station`) REFERENCES `stations` (`station`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`status`) REFERENCES `user_type` (`status`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
