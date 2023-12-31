-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2023 at 10:31 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sjcjob`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(100) NOT NULL,
  `uname` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `uname`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `newplacement`
--

CREATE TABLE `newplacement` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `contact` int(100) NOT NULL,
  `details` varchar(100) NOT NULL,
  `vacancy` varchar(100) NOT NULL,
  `lastdate` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newplacement`
--

INSERT INTO `newplacement` (`id`, `name`, `title`, `qualification`, `location`, `contact`, `details`, `vacancy`, `lastdate`) VALUES
(35, 'TCS', 'REACT DEVELOPER', 'MCA,Msc IT,CS,BCA', 'CHENNAI', 2147483647, 'We are seeking a skilled Front-End Web Developer to join our team. ', '4', '2023-08-24'),
(36, 'WIPRO', 'JAVA DEVELOPER', 'MCA,Msc IT,CS,BCA', 'BANGLORE', 2147483647, 'We are seeking a skilled Front-End Web Developer to join our team. ', '5', '2023-08-25'),
(37, 'HCL', 'PYTHON DEVELOPER', 'MCA,Msc IT,CS,BCA', 'MUMBAI', 2147483647, 'Join our dynamic team as a Back-End Developer specializing in Node.js', '4', '2023-08-31'),
(38, 'MINDTREE', 'DATA ANALYST', 'MCA,Msc IT,CS,BCA', 'CHENNAI', 2147483647, 'Join our dynamic team as a Back-End Developer specializing in Node.js', '7', '2023-08-23'),
(39, 'ASIAN PAINTS', 'BACKEND DEVELOPER', 'MCA,Msc IT,CS,BCA', 'MUMBAI', 2147483647, 'Join our dynamic team as a Back-End Developer specializing in Node.js', '4', '2023-08-08'),
(40, 'CTS', 'FRONT-END DEVELOPER', 'MCA,CS', 'CHENNAI', 2147483647, 'Join our dynamic team as a Back-End Developer specializing in Node.js', '2', '2023-08-11'),
(41, 'MAHENDRA', 'DJANGO DEVELOPER', 'MCA,CS', 'CHENNAI', 2147483647, 'Join our dynamic team as a Back-End Developer specializing in Node.js', '4', '2023-08-18'),
(42, 'MRF TYRES', 'BACKEND DEVELOPER', 'MCA,Msc IT,CS,BCA', 'CHENNAI', 2147483647, 'Join our dynamic team as a Back-End Developer specializing in Node.js', '6', '2023-08-12'),
(43, 'DELLOITE', 'PHP DEVELOPER', 'MCA,BCA', 'BANGLORE', 2147483647, 'Join our dynamic team as a Back-End Developer specializing in Node.js', '1', '2023-08-08'),
(44, 'RAMCO CEMENTS', 'UI/UX DESIGNER', 'MCA,CS', 'BANGLORE', 2147483647, 'Join our dynamic team as a Back-End Developer specializing in Node.js', '6', '2023-08-15');

-- --------------------------------------------------------

--
-- Table structure for table `pdf`
--

CREATE TABLE `pdf` (
  `id` int(100) NOT NULL,
  `s_id` int(100) NOT NULL,
  `c_id` int(100) NOT NULL,
  `resume` varchar(200) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pdf`
--

INSERT INTO `pdf` (`id`, `s_id`, `c_id`, `resume`, `date`) VALUES
(106, 22, 35, 'resume_uploads/document.pdf', '2023-09-17'),
(107, 22, 36, 'resume_uploads/document.pdf', '2023-09-17');

-- --------------------------------------------------------

--
-- Table structure for table `studentdetail`
--

CREATE TABLE `studentdetail` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `dno` varchar(100) NOT NULL,
  `major` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `degree` varchar(100) NOT NULL,
  `year` varchar(100) NOT NULL,
  `skill` varchar(200) NOT NULL,
  `10th` varchar(100) NOT NULL,
  `12th` varchar(100) NOT NULL,
  `1st` varchar(100) NOT NULL,
  `2nd` varchar(100) NOT NULL,
  `3rd` varchar(100) NOT NULL,
  `4th` varchar(100) NOT NULL,
  `5th` varchar(100) NOT NULL,
  `6th` varchar(100) NOT NULL,
  `resume` varchar(200) NOT NULL,
  `profile_photo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studentdetail`
--

INSERT INTO `studentdetail` (`id`, `name`, `dno`, `major`, `phone`, `email`, `degree`, `year`, `skill`, `10th`, `12th`, `1st`, `2nd`, `3rd`, `4th`, `5th`, `6th`, `resume`, `profile_photo`) VALUES
(20, 'BAGIO', '22PCA155', 'COMPUTER SCIENCE', '7094097739', 'surendhar1729@gmail.com', 'UG', '3rd year', 'PYTHON, JAVA', '88', '67', '98', '78', '98', '68', '89', '67', '', 'profile_photo/WhatsApp Image 2023-08-24 at 12.21.03 AM.jpeg'),
(22, 'SURENDAR', '22PCA159', 'IT', '7094097739', 'surendhar1729@gmail.com', 'UG', '2nd year', 'PYTHON, JAVA', '97', '67', '89', '89', '98', '89', '90', '99', '', 'profile_photo/WhatsApp Image 2022-07-30 at 20.28.39 copy.jpg'),
(25, 'HASHWAR', '22PCA138', 'COMPUTER SCIENCE', '7094097739', 'surendhar1729@gmail.com', 'PG', '2nd year', 'JAVA', '80', '78', '54', '98', '87', '65', '100', '100', '', 'profile_photo/WhatsApp Image 2022-07-30 at 20.28.39 copy.jpg'),
(23, 'PRATYUSH', '22PCA154', 'COMPUTER SCIENCE', '7094097739', 'surendhar1729@gmail.com', 'PG', '2nd year', 'PYTHON', '78', '70', '80', '79', '74', '70', '', '', '', 'profile_photo/1693142339947.jpg'),
(26, 'ANAND', '22PCA163', 'COMPUTER SCIENCE', '1234567890', 'surendhar1729@gmail.com', 'PG', '2nd year', 'JAVA', '79', '80', '78', '77', '87', '67', '78', '', '', 'profile_photo/WhatsApp Image 2023-08-24 at 12.19.32 AM.jpeg'),
(27, 'JOSHUVA', '22PCA117', 'COMPUTER SCIENCE', '7094097739', 'surendhar1729@gmail.com', 'PG', '2nd year', 'JAVA', '70', '72', '87', '77', '78', '70', '', '', '', 'profile_photo/WhatsApp Image 2023-08-24 at 12.21.07 AM (1).jpeg'),
(21, 'MUKESH', '22PCA156', 'COMPUTER SCIENCE', '12334567', 'surendhar1729@gmail.com', 'PG', '2nd year', 'JAVA', '87', '74', '67', '54', '77', '54', '', '', '', 'profile_photo/WhatsApp Image 2023-08-24 at 12.19.32 AM (1).jpeg'),
(29, 'JHONSON', '22PCA125', 'MCA', '7094097739', 'surendhar1729@gmail.com', 'PG', '3rd year', 'PYTHON', '66', '78', '67', '89', '99', '98', '67', '89', '', 'profile_photo/WhatsApp Image 2023-08-24 at 12.19.30 AM.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `dno` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `dno`, `pass`) VALUES
(20, 'BAGIO', '22PCA155', '1234'),
(21, 'MUKESH', '22PCA156', '1234'),
(22, 'SURENDAR', '22PCA159', '1234'),
(23, 'PRATYUSH', '22PCA154', '1234'),
(24, 'SANJAY', '22PCA148', '1234'),
(25, 'HASHWAR', '22PCA138', '1234'),
(26, 'ANAND', '22PCA163', '1234'),
(27, 'JOSHUVA', '22PCA117', '1234'),
(28, 'GAINS', '22PCA122', '1234'),
(29, 'JHONSON', '22PCA125', '1234'),
(30, 'PRINCE', '22PCA119', '1234'),
(31, 'VIKRAM', '22PCA141', '1234'),
(32, 'LAKSHMNAN', '22PCA107', '1234'),
(33, 'SREENATH', '22PCA152', '1234'),
(34, 'ABISHEK', '22PCA153', '1234'),
(35, 'SHYAM', '22PCA151', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newplacement`
--
ALTER TABLE `newplacement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pdf`
--
ALTER TABLE `pdf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `newplacement`
--
ALTER TABLE `newplacement`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `pdf`
--
ALTER TABLE `pdf`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
