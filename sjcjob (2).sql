-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2023 at 07:47 PM
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
(50, 'muthood', 'Manager', 'BSC', 'Valayapatti', 78456456, 'Emmployee', '2', '2024-03-12'),
(51, 'CTS', 'Developer', 'BSC', 'Chennai', 98898478, 'TTTT', '89', '2022-12-09');

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
(107, 22, 36, 'resume_uploads/document.pdf', '2023-09-17'),
(109, 22, 37, 'resume_uploads/22PCA159_resume.pdf', '2023-09-17'),
(110, 22, 38, 'resume_uploads/22PCA159_resume.pdf', '2023-09-17'),
(111, 36, 36, 'resume_uploads/22pca111_resume.pdf', '2023-09-18'),
(112, 36, 35, 'resume_uploads/22pca111_resume.pdf', '2023-09-18'),
(113, 36, 35, 'resume_uploads/22pca111_resume.pdf', '2023-09-18'),
(114, 36, 39, 'resume_uploads/22pca111_resume.pdf', '2023-09-18'),
(115, 37, 50, 'resume_uploads/22pca106_resume.pdf', '2023-09-18'),
(116, 38, 51, 'resume_uploads/22pca116_resume.pdf', '2023-09-19'),
(117, 38, 36, 'resume_uploads/22pca116_resume.pdf', '2023-09-19'),
(118, 38, 35, 'resume_uploads/22pca116_resume.pdf', '2023-09-19'),
(119, 22, 51, 'resume_uploads/22PCA15951_resume.pdf', '2023-09-19'),
(120, 22, 40, 'resume_uploads/22PCA15940_resume.pdf', '2023-09-19');

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
(22, 'SURENDAR', '22PCA159', 'IT', '7094097739', 'surendhar1729@gmail.com', 'UG', '2nd year', 'PYTHON, JAVA', '97', '67', '89', '89', '98', '89', '90', '99', '', 'profile_photo/22PCA159_profile.jpg'),
(25, 'HASHWAR', '22PCA138', 'COMPUTER SCIENCE', '7094097739', 'surendhar1729@gmail.com', 'PG', '2nd year', 'JAVA', '80', '78', '54', '98', '87', '65', '100', '100', '', 'profile_photo/WhatsApp Image 2022-07-30 at 20.28.39 copy.jpg'),
(23, 'PRATYUSH', '22PCA154', 'COMPUTER SCIENCE', '7094097739', 'surendhar1729@gmail.com', 'PG', '2nd year', 'PYTHON', '78', '70', '80', '79', '74', '70', '', '', '', 'profile_photo/1693142339947.jpg'),
(26, 'ANAND', '22PCA163', 'COMPUTER SCIENCE', '1234567890', 'surendhar1729@gmail.com', 'PG', '2nd year', 'JAVA', '79', '80', '78', '77', '87', '67', '78', '', '', 'profile_photo/WhatsApp Image 2023-08-24 at 12.19.32 AM.jpeg'),
(27, 'JOSHUVA', '22PCA117', 'COMPUTER SCIENCE', '7094097739', 'surendhar1729@gmail.com', 'PG', '2nd year', 'JAVA', '70', '72', '87', '77', '78', '70', '', '', '', 'profile_photo/WhatsApp Image 2023-08-24 at 12.21.07 AM (1).jpeg'),
(21, 'MUKESH', '22PCA156', 'COMPUTER SCIENCE', '12334567', 'surendhar1729@gmail.com', 'PG', '2nd year', 'JAVA', '87', '74', '67', '54', '77', '54', '', '', '', 'profile_photo/WhatsApp Image 2023-08-24 at 12.19.32 AM (1).jpeg'),
(29, 'JHONSON', '22PCA125', 'MCA', '7094097739', 'surendhar1729@gmail.com', 'PG', '3rd year', 'PYTHON', '66', '78', '67', '89', '99', '98', '67', '89', '', 'profile_photo/WhatsApp Image 2023-08-24 at 12.19.30 AM.jpeg'),
(36, 'Sathish', '22pca111', 'MBA', '878746', 'mohanmani.nkl@gmail.com', 'PG', '2nd year', 'Python', '56', '99', '56', '56', '78', '89', '99', '41', '', 'profile_photo/22pca111_profile.jpg'),
(37, 'SurenFire', '22pca106', 'BSC', '78794655', 'surendran2929@gmail.com', 'PG', '3rd year', 'Javva', '78', '78', '96', '96', '89', '55', '96', '78', '', 'profile_photo/22pca106_profile.jpg'),
(38, 'Vijay', '22pca116', 'MBA', '989898478', 'aceragavanmech36@gmail.com', 'PG', '2nd year', 'Testing', '96', '78', '78', '85', '99', '56', '52', '89', '', 'profile_photo/22pca116_profile.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `stud_select`
--

CREATE TABLE `stud_select` (
  `s_id` int(100) NOT NULL,
  `c_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `dno` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(35, 'SHYAM', '22PCA151', '1234'),
(36, 'Sathish', '22pca111', '12345678'),
(37, 'SurenFire', '22pca106', 'suren'),
(38, 'Vijay', '22pca116', 'vijay');

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
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `pdf`
--
ALTER TABLE `pdf`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
