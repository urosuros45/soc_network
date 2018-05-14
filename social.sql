-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2018 at 01:51 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social`
--

-- --------------------------------------------------------

--
-- Table structure for table `friends_users`
--

CREATE TABLE `friends_users` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `friend_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `friends_users`
--

INSERT INTO `friends_users` (`user_id`, `friend_id`) VALUES
(1, 2),
(2, 1),
(2, 3),
(3, 2),
(3, 4),
(3, 5),
(3, 7),
(4, 3),
(5, 3),
(5, 6),
(5, 7),
(5, 10),
(5, 11),
(6, 5),
(15, 14),
(14, 13),
(14, 15),
(7, 3),
(7, 5),
(7, 12),
(7, 8),
(16, 18),
(16, 20),
(17, 18),
(17, 20);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `surname` varchar(255) NOT NULL DEFAULT '',
  `age` int(10) UNSIGNED DEFAULT NULL,
  `gender` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `surname`, `age`, `gender`, `created_at`, `updated_at`) VALUES
(1, 'Paul', 'Crowe', 28, 'male', '2018-05-09 22:06:25', '2018-05-09 22:06:38'),
(2, 'Rob', 'Fitz', 23, 'male', '2018-05-09 22:06:25', '2018-05-09 22:06:38'),
(3, 'Ben', 'O\'Carolan', NULL, 'male', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Victor', '', 28, 'male', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Peter', 'Mac', 29, 'male', '2018-05-09 22:55:26', '2018-05-09 22:55:26'),
(6, 'John', 'Barry', 18, 'male', '2018-05-09 22:56:00', '2018-05-09 22:56:00'),
(7, 'Sarah', 'Lane', 30, 'female', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Susan', 'Downe', 28, 'female', NULL, NULL),
(9, 'Jack', 'Stam', 28, 'male', NULL, NULL),
(10, 'Amy', 'Lane', 24, 'female', NULL, NULL),
(11, 'Sandra', 'Phelan', 28, 'female', '2018-05-10 19:16:24', '2018-05-10 19:16:24'),
(12, 'Laura', 'Murphy', 33, 'female', '2018-05-10 19:16:18', '2018-05-10 19:16:18'),
(13, 'Lisa', 'Daly', 28, 'female', NULL, NULL),
(14, 'Mark', 'Johnson', 28, 'male', NULL, NULL),
(15, 'Seamus', 'Crowe', 24, 'male', NULL, NULL),
(16, 'Daren', 'Slater', 28, 'male', NULL, NULL),
(17, 'Dara', 'Zoltan', 48, 'male', NULL, NULL),
(18, 'Marie', 'D', 28, 'female', NULL, NULL),
(19, 'Catriona', 'Long', 28, 'female', NULL, NULL),
(20, 'Katy', 'Couch', 28, 'female', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `friends_users`
--
ALTER TABLE `friends_users`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `friend_id` (`friend_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `friends_users`
--
ALTER TABLE `friends_users`
  ADD CONSTRAINT `friends_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `friends_users_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
