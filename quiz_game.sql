-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2023 at 06:38 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz_game`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `username`, `password`) VALUES
(1, 'marco gador', 'mgador@gmail.com', 'mgador', 'marco'),
(2, 'Ralph Salimbagat', 'ralph@gmail.com', 'ram', 'ram123');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `score` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `name`, `score`) VALUES
(1, 'marco', 2),
(2, 'jerome', 3),
(3, 'jeffer', 2),
(6, 'asd', 10),
(7, 'marco', 3),
(8, 'Marco Jerome Gador', 1),
(9, 'asd', 5),
(10, 'marco', 3),
(11, 'asda', 5),
(12, 'marcookie', 9),
(13, 'marcogador', 8),
(14, 'adsa', 7),
(15, 'nikke', 10);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `a` varchar(255) NOT NULL,
  `b` varchar(255) NOT NULL,
  `c` varchar(255) NOT NULL,
  `d` varchar(255) NOT NULL,
  `correctAnswer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `a`, `b`, `c`, `d`, `correctAnswer`) VALUES
(1, 'What does PHP stand for???', 'Personal Hypertext Processor', 'Predefined Hypertext Programming', 'PHP: Hypertext Preprocessor', 'Programming Hypertext Pages', 3),
(2, 'Who originally developed PHP?', 'Microsoft', 'Apple', 'Rasmus Lerdorf', 'Google', 3),
(3, 'What is the correct way to start a PHP script?', '<php>', '<?php>', '{php}', '[php]', 2),
(4, 'Which symbol is used to comment a single line in PHP?', '//', '#', '/*', ';;', 1),
(5, 'Which function is used to output data in PHP?', 'print()', 'read()', 'echo()', 'write()', 3),
(6, 'What is the file extension for PHP files?', '.php', '.html', '.txt', '.css', 1),
(7, 'Which of the following is a valid PHP variable name?', '$myVar', '$_variable', '123abc', '$my-var', 1),
(8, 'What is the correct way to include an external PHP file in another PHP file?', 'import ', 'require ', 'include ', 'load ', 3),
(9, 'Which function is used to connect PHP with a MySQL database?', 'mysqli_connect()', 'mysql_connect()', 'sql_connect()', 'sqli_connect()', 2),
(10, 'Is PHP a server-side scripting language?', 'Yes', 'No', 'Maybe', 'Maybe not', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
