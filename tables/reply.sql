-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2024 at 01:36 PM
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
-- Database: `qadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `reply`
--

CREATE TABLE `reply` (
  `r_id` int(11) NOT NULL COMMENT 'Reply ID',
  `p_id` int(11) NOT NULL COMMENT 'Parent post ID',
  `u_id` int(11) NOT NULL,
  `r_content` varchar(1024) NOT NULL COMMENT 'Reply Content',
  `r_create_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reply`
--

INSERT INTO `reply` (`r_id`, `p_id`, `u_id`, `r_content`, `r_create_time`) VALUES
(1, 1, 2, 'This is a reply', '2024-04-19 11:56:42'),
(2, 1, 1, 'This is a reply from Admin.', '2024-04-19 11:57:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`r_id`),
  ADD KEY `Reply belong to post` (`p_id`),
  ADD KEY `User post reply` (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reply`
--
ALTER TABLE `reply`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Reply ID', AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reply`
--
ALTER TABLE `reply`
  ADD CONSTRAINT `Reply belong to post` FOREIGN KEY (`p_id`) REFERENCES `post` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `User post reply` FOREIGN KEY (`u_id`) REFERENCES `qa_user` (`u_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
