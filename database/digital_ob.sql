-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2023 at 12:45 PM
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

--
-- Dumping data for table `cases`
--

INSERT INTO `cases` (`id`, `ob_number`, `crime_type`, `date_reported`, `recorded_by`, `station`, `statement`, `investigator`, `status`, `date_completed`, `report`) VALUES
(1, '22/1/27/04/2023', 'Theft', '2021-04-27 11:46:24', 22001, 'Central Police Station', 'Victim was walking out of the supermarket and was attacked by thieves and stolen from.', 22006, 'Completed', '2023-04-29 21:59:14', 'The thieves were apprehended and jailed awaiting judicial trial.'),
(2, '33/1/27/04/2023', 'Fraud', '2021-04-27 11:49:06', 33001, 'Kasarani Police Station', 'Victim received fraudulent emails requesting personal information.', 33008, 'Ongoing', NULL, ''),
(3, '66/1/27/04/2023', 'Vandalism', '2022-04-27 11:51:01', 66002, 'Kilimani Police Station', 'Back window was broken and several items were stolen.', 66003, 'Ongoing', NULL, ''),
(4, '11/1/27/04/2023', 'Burglary', '2023-04-27 11:53:00', 11002, 'Langata Police Station', 'A laptop was stolen from the victim\'s car.', 11003, 'Completed', '2023-05-12 11:57:55', 'After gathering information from nearby civilians in the area of the crime, 1 suspect was added to the case for investigation. Brian Mumo, the suspect was taken into questioning and was found to be guilty through surveillance footage.'),
(5, '22/2/27/04/2023', 'Robbery', '2023-05-27 11:57:54', 22005, 'Central Police Station', 'Victim was robbed at knifepoint while withdrawing money from an ATM at Shell Petrol Station.', NULL, 'Ongoing', NULL, ''),
(6, '33/2/27/04/2023', 'Theft', '2023-04-27 12:01:30', 33004, 'Kasarani Police Station', 'Victim\'s phone was stolen while leaving the mall.', NULL, 'Ongoing', NULL, ''),
(7, '66/2/27/04/2023', 'Fraud', '2023-04-27 12:03:52', 66001, 'Kilimani Police Station', 'Victim received a fraudulent call from someone posing as a bank representative.', NULL, 'Ongoing', NULL, ''),
(8, '101/1/27/04/2023', 'Defilement', '2023-04-27 12:05:32', 101001, 'Dandora Police Station', 'Victim was defiled by a man in a mask and left beaten.', NULL, 'Ongoing', NULL, ''),
(9, '22/3/27/04/2023', 'Vandalism', '2023-04-27 12:07:27', 22007, 'Central Police Station', 'Graffiti was found on the back side of the house.', NULL, 'Ongoing', NULL, ''),
(10, '77/1/27/04/2023', 'Domestic Violence', '2023-04-27 12:09:02', 77001, 'Buruburu Police Station', 'Victim\'s husband came home drank and attacked the wife.', NULL, 'Ongoing', NULL, ''),
(11, '11/2/27/04/2023', 'Assault', '2023-04-27 12:10:47', 11005, 'Langata Police Station', 'Victim was attacked while leaving her hostel to attend her morning class.', 11003, 'Ongoing', NULL, ''),
(12, '22/4/27/04/2023', 'Fraud', '2023-04-27 12:13:03', 22001, 'Central Police Station', 'Victim was cheated by online fraudsters.', NULL, 'Ongoing', NULL, ''),
(13, '33/3/27/04/2023', 'Road Accident', '2023-04-27 13:16:28', 33001, 'Kasarani Police Station', 'Victim was involved in a hit and run by a motorcycle driver.', NULL, 'Ongoing', NULL, ''),
(14, '11/3/27/04/2023', 'Robbery', '2023-04-27 13:18:25', 11001, 'Langata Police Station', 'Unknown men in masks robbed the Chase bank and the clients in the bank at that time.', 11008, 'Ongoing', NULL, ''),
(15, '11/4/27/04/2023', 'Theft', '2023-04-27 13:20:17', 11001, 'Langata Police Station', 'Victim was robbed in her store at around 7pm in the evening by 3 men at gunpoint.', 11006, 'Ongoing', NULL, ''),
(16, '202/1/27/04/2023', 'Fraud', '2023-04-27 13:21:59', 202001, 'Kahawa West Police Station', 'Victim clicked on fraud emails and his personal information was taken without his permission.', NULL, 'Ongoing', NULL, ''),
(17, '33/4/27/04/2023', 'Vandalism', '2023-04-27 13:24:31', 33004, 'Kasarani Police Station', 'Some boys broke windows of the hotel entry side and ran away.', NULL, 'Ongoing', NULL, ''),
(18, '55/1/27/04/2023', 'Burglary', '2023-04-27 13:26:12', 55004, 'Embakasi Police Station', 'Victim was robbed at gunpoint.', NULL, 'Ongoing', NULL, ''),
(19, '11/5/27/04/2023', 'Robbery', '2023-04-27 13:28:57', 11007, 'Langata Police Station', 'Victim returned home and found the front door had been knocked down with forced entry into the house and some items were missing.', 11008, 'Ongoing', NULL, ''),
(20, '22/5/27/04/2023', 'Robbery', '2023-04-27 13:35:01', 22005, 'Central Police Station', 'Cooperative Bank was robbed by men in masks.', NULL, 'Ongoing', NULL, ''),
(21, '11/6/27/04/2023', 'Robbery', '2023-04-27 13:38:11', 11004, 'Langata Police Station', 'Victims car window was broken and valuables stolen.', 11006, 'Ongoing', NULL, ''),
(22, '11/7/27/04/2023', 'Fraud', '2023-04-27 13:39:49', 11001, 'Langata Police Station', 'Victim reported false unauthorized transactions in her card account.', 11006, 'Ongoing', NULL, ''),
(23, '202/1/28/04/2023', 'Burglary', '2023-04-28 07:57:18', 202005, 'Kahawa West Police Station', 'Victim came home and found his windows were broken and items were missing.', NULL, 'Ongoing', NULL, ''),
(24, '404/1/28/04/2023', 'Theft', '2023-04-28 07:59:49', 404001, 'Kibera Police Station', 'Masked men came into the pharmacy and stole money from the cash register.', NULL, 'Ongoing', NULL, ''),
(25, '88/1/28/04/2023', 'Other', '2023-04-28 08:04:24', 88003, 'Parklands Police Station', 'Victim was walking on the street and a man violated her rights.', NULL, 'Ongoing', NULL, ''),
(26, '22/1/28/04/2023', 'Rape', '2023-04-28 09:39:57', 22004, 'Central Police Station', 'Victim was violated by a woman forcefully.', NULL, 'Ongoing', NULL, ''),
(27, '909/1/29/04/2023', 'Rape', '2023-04-29 12:13:52', 909003, 'Westlands Police Station', 'Victim was raped when left alone with her masseuse.', NULL, 'Ongoing', NULL, ''),
(28, '11/1/02/05/2023', 'Road Accident', '2023-05-02 13:32:13', 11001, 'Langata Police Station', 'A lorry hit and run the victim in the CBD.', NULL, 'Ongoing', NULL, ''),
(29, '11/2/02/05/2023', 'Rape', '2023-05-02 14:02:03', 11001, 'Langata Police Station', 'Victim was raped in her house by an intruder who had come to steal and found her alone.', NULL, 'Ongoing', NULL, ''),
(30, '44/1/02/05/2023', 'Vandalism', '2023-05-02 20:20:55', 44001, 'South B Police Station', 'House of victim was covered in several rolls of tissue paper.', NULL, 'Ongoing', NULL, ''),
(31, '11/3/12/05/2023', 'Road Accident', '2023-05-12 09:36:46', 11001, 'Langata Police Station', 'The victim was driving on the highway and a red Toyota Harrier came speeding from the other side trying to overtake a lorry not knowing if the other lane of the road was clear leading to an accident.', NULL, 'Ongoing', NULL, ''),
(32, '11/4/13/05/2023', 'Domestic Violence', '2023-05-13 10:31:36', 11001, 'Langata Police Station', 'Husband of the victim found messages on the victim\'s phone that implied she was cheating hence causing problems in the house.', NULL, 'Ongoing', NULL, '');

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

--
-- Dumping data for table `complainants`
--

INSERT INTO `complainants` (`id`, `ob_number`, `comp_name`, `tel`, `occupation`, `age`, `address`, `region`, `gender`, `crime_type`, `location`, `station_reported`, `date_added`) VALUES
(1, '22/1/27/04/2023', 'Jane Smith', '071235555', 'Teacher', 35, '123 Main St', 'Nairobi', 'Female', 'Theft', 'Supermarket', 'Central Police Station', '2023-04-27 11:45:24'),
(2, '33/1/27/04/2023', 'John Doe', '071234567', 'Nurse', 28, '456 Elm St', 'Nairobi', 'Male', 'Fraud', 'Bank', 'Kasarani Police Station', '2023-04-27 11:48:08'),
(3, '66/1/27/04/2023', 'Bob Johnson', '079876543', 'Engineer', 42, '111 Maple St', 'Nairobi', 'Male', 'Vandalism', 'House', 'Kilimani Police Station', '2023-04-27 11:50:28'),
(4, '11/1/27/04/2023', 'Lisa Brown', '075551111', 'Lawyer', 50, '789 Oak St', 'Nairobi', 'Female', 'Burglary', 'Park', 'Langata Police Station', '2023-04-27 11:52:30'),
(5, '22/2/27/04/2023', 'Mike Wilson', '074443333', 'Accountant', 37, '222 Pine St', 'Nairobi', 'Male', 'Robbery', 'Gas Station', 'Central Police Station', '2023-04-27 11:57:14'),
(6, '33/2/27/04/2023', 'Julie Davis', '072221111', 'Doctor', 31, '333 Cedar St', 'Nairobi', 'Female', 'Theft', 'Mall', 'Kasarani Police Station', '2023-04-27 11:59:43'),
(7, '66/2/27/04/2023', 'Tom Smith', '077778888', 'Teacher', 54, '444 Elm st', 'Nairobi', 'Male', 'Fraud', 'Store', 'Kilimani Police Station', '2023-04-27 12:02:53'),
(8, '101/1/27/04/2023', 'Emily Jackson', '076665555', 'Nurse', 25, '555 Oak St', 'Nairobi', 'Female', 'Defilement', 'Gym', 'Dandora Police Station', '2023-04-27 12:05:12'),
(9, '22/3/27/04/2023', 'Steve Brown', '071112222', 'Engineer', 45, '666 Maple St', 'Nairobi', 'Male', 'Vandalism', 'House', 'Central Police Station', '2023-04-27 12:06:55'),
(10, '77/1/27/04/2023', 'Jennifer Lee', '073332222', 'Lawyer', 38, '777 Pine St', 'Nairobi', 'Female', 'Domestic Violence', 'House', 'Buruburu Police Station', '2023-04-27 12:08:44'),
(11, '11/2/27/04/2023', 'Cindy Johnson', '077773333', 'Student', 21, '999 Elm St', 'Nairobi', 'Female', 'Assault', 'Hostels', 'Langata Police Station', '2023-04-27 12:10:23'),
(12, '22/4/27/04/2023', 'Mark Davis', '076664444', 'Butcher', 33, '111 Oak St', 'Nairobi', 'Male', 'Fraud', 'Online', 'Central Police Station', '2023-04-27 12:12:45'),
(13, '33/3/27/04/2023', 'Lisa Jones', '075552222', 'Nurse', 27, '222 Maple St', 'Nairobi', 'Female', 'Road Accident', 'Highway', 'Kasarani Police Station', '2023-04-27 13:16:04'),
(14, '11/3/27/04/2023', 'Mike Thompson', '074442222', 'Technician', 32, '333 Pine St', 'Nairobi', 'Male', 'Robbery', 'Bank', 'Langata Police Station', '2023-04-27 13:17:54'),
(15, '11/4/27/04/2023', 'Samantha Lee', '073331111', 'Food Vendor', 43, '444 Cedar St', 'Nairobi', 'Female', 'Theft', 'Store', 'Langata Police Station', '2023-04-27 13:19:53'),
(16, '202/1/27/04/2023', 'Alex Brown', '078889999', 'Accountant', 36, '555 Oak St', 'Nairobi', 'Male', 'Fraud', 'Online', 'Kahawa West Police Station', '2023-04-27 13:21:24'),
(17, '33/4/27/04/2023', 'Olivia Wilson', '077776666', 'Security Guard', 37, '666 Elm St', 'Nairobi', 'Female', 'Vandalism', 'Hotel', 'Kasarani Police Station', '2023-04-27 13:23:54'),
(18, '55/1/27/04/2023', 'Jack Johnson', '072221111', 'Teacher', 50, '777 Maple St', 'Nairobi', 'Male', 'Burglary', 'Office', 'Embakasi Police Station', '2023-04-27 13:25:47'),
(19, '11/5/27/04/2023', 'Amanda Smith', '071114444', 'Cashier', 28, '888 Pine St', 'Nairobi', 'Female', 'Robbery', 'House', 'Langata Police Station', '2023-04-27 13:28:23'),
(20, '22/5/27/04/2023', 'Tyler Davis', '075554444', 'Engineer', 39, '333 Pine St', 'Nairobi', 'Male', 'Robbery', 'Bank', 'Central Police Station', '2023-04-27 13:34:44'),
(21, '11/6/27/04/2023', 'Sara Brown', '073337777', 'Businesswoman', 38, '111 Elm St', 'Nairobi', 'Female', 'Robbery', 'Office', 'Langata Police Station', '2023-04-27 13:37:41'),
(22, '11/7/27/04/2023', 'Jessica Johnson', '072223333', 'Student', 21, '333 Maple St', 'Nairobi', 'Female', 'Fraud', 'Bank', 'Langata Police Station', '2023-04-27 13:39:31'),
(23, '202/1/28/04/2023', 'Andrew Lee', '075557777', 'Accountant', 38, '333 Maple St', 'Nairobi', 'Male', 'Burglary', 'House', 'Kahawa West Police Station', '2023-04-28 07:56:44'),
(24, '404/1/28/04/2023', 'Emily Davis', '076662222', 'Teacher', 26, '555 Cedar St', 'Nairobi', 'Female', 'Theft', 'Pharmacy', 'Kibera Police Station', '2023-04-28 07:59:22'),
(25, '88/1/28/04/2023', 'Sophia Wilson', '074442222', 'Student', 23, '777 Oak St', 'Nairobi', 'Female', 'Other', 'Street', 'Parklands Police Station', '2023-04-28 08:03:42'),
(26, '22/1/28/04/2023', 'William Johnson', '073335555', 'Student', 21, '888 Maple St', 'Nairobi', 'Male', 'Rape', 'Hostels', 'Central Police Station', '2023-04-28 09:39:20'),
(27, '909/1/29/04/2023', 'Stacy Wachira', '0716435672', 'Student', 25, '433 Pine St', 'Nairobi', 'Female', 'Rape', 'Mall', 'Westlands Police Station', '2023-04-29 12:13:21'),
(28, '11/1/02/05/2023', 'Gilbert Munene', '072221212', 'Journalist', 25, '212 Maple St', 'Nairobi', 'Male', 'Road Accident', 'Street', 'Langata Police Station', '2023-05-02 13:31:44'),
(30, '11/2/02/05/2023', 'Pauline Inembe', '073331111', 'Violinist', 34, '563 Pine St', 'Nairobi', 'Female', 'Rape', 'House', 'Langata Police Station', '2023-05-02 14:01:41'),
(31, '44/1/02/05/2023', 'Benard Muuo', '078826262', 'Teacher', 39, '777 Pine St', 'Nairobi', 'Male', 'Vandalism', 'House', 'South B Police Station', '2023-05-02 20:19:24'),
(32, '11/3/12/05/2023', 'Shemeji Shemester', '0712928199', 'Student', 20, '213 Maple St', 'Nairobi', 'Male', 'Road Accident', 'Highway', 'Langata Police Station', '2023-05-12 09:35:29'),
(33, '11/4/13/05/2023', 'Mariah Carey', '078883131', 'Singer', 43, '777 Pine St', 'Nairobi', 'Male', 'Domestic Violence', 'House', 'Langata Police Station', '2023-05-13 10:30:42');

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

INSERT INTO `crimes` (`id`, `crime_type`) VALUES
(3, 'Assault'),
(10, 'Burglary'),
(11, 'Corruption'),
(5, 'Defilement'),
(1, 'Domestic Violence'),
(8, 'Fraud'),
(2, 'Murder Case'),
(12, 'Other'),
(13, 'Rape'),
(7, 'Road Accident'),
(6, 'Robbery'),
(4, 'Theft'),
(9, 'Vandalism');

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
(21, 'Head of Police', 'N/A', 'N/A', 0, '2023-04-27 08:24:35');

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

--
-- Dumping data for table `suspects`
--

INSERT INTO `suspects` (`id`, `ob_number`, `crime_suspected`, `name`, `national_id`, `dob`, `address`, `phone_num`, `gender`, `date_added`) VALUES
(1, '11/4/27/04/2023', 'Theft', 'Ibrahim Rashid', 3998231, '1998-03-16', '981 Lee St', 7282111, 'Male', '2023-05-02 14:22:27'),
(2, '11/4/27/04/2023', 'Theft', 'Abdi Manish', 131412, '1987-09-21', '872 Lee St', 78481212, 'Male', '2023-05-02 14:43:04'),
(3, '11/1/27/04/2023', 'Burglary', 'Brian Mumo', 892773, '2000-06-13', '811 Maple St', 76661123, 'Male', '2023-05-02 14:44:40'),
(4, '11/2/02/05/2023', 'Rape', 'Ojing Ochieng', 6235222, '1982-10-18', '772 Pine St', 78828121, 'Male', '2023-05-02 15:05:40');

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
(1, 'Elvis', 'Head of Police', 'Inspector General', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Admin', '2023-04-27 08:24:35'),
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
(11007, 'Jacob Martin', 'Langata Police Station', 'Sergeant', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(11008, 'Ava Hernandez', 'Langata Police Station', 'Corporal', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
(11009, 'Manu Muuo', 'Langata Police Station', 'Constable', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-05-12 20:12:47'),
(22001, 'Paul Brown', 'Central Police Station', 'Sergeant', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(22002, 'Maria Hernandez', 'Central Police Station', 'Senior Sergeant', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
(22003, 'Kevin Lee', 'Central Police Station', 'Senior Inspector', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
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
(33008, 'Emma Hernandez', 'Kasarani Police Station', 'Inspector', 'Female', '81dc9bdb52d04dc20036dbd8313ed055', 'Investigating Officer', '2023-04-27 08:24:35'),
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
(55004, 'Liam Perez', 'Embakasi Police Station', 'Constable', 'Male', '81dc9bdb52d04dc20036dbd8313ed055', 'Police', '2023-04-27 08:24:35'),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `complainants`
--
ALTER TABLE `complainants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `crimes`
--
ALTER TABLE `crimes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `stations`
--
ALTER TABLE `stations`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `suspects`
--
ALTER TABLE `suspects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
