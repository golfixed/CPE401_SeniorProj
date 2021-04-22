-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2021 at 06:46 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `class`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `image` text DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chatroom`
--

DROP TABLE IF EXISTS `chatroom`;
CREATE TABLE IF NOT EXISTS `chatroom` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `message` int(10) NOT NULL,
  `to` int(10) NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `mute_noti` tinyint(1) NOT NULL DEFAULT 0,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `message` (`message`),
  KEY `to` (`to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chat_list`
--

DROP TABLE IF EXISTS `chat_list`;
CREATE TABLE IF NOT EXISTS `chat_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account` int(10) NOT NULL,
  `chat` int(10) DEFAULT NULL,
  `classchat` int(10) DEFAULT NULL,
  `favorite` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `account` (`account`),
  KEY `chat` (`chat`),
  KEY `classchat` (`classchat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `class_code` varchar(10) NOT NULL,
  `class_name` varchar(100) NOT NULL,
  `class_desc` text DEFAULT NULL,
  `class_pic` text DEFAULT NULL,
  `section` varchar(10) NOT NULL,
  `join_code` varchar(6) DEFAULT '0',
  `classchat` int(10) DEFAULT NULL,
  `material` int(10) DEFAULT NULL,
  `post` int(10) DEFAULT NULL,
  `mute_noti` tinyint(1) NOT NULL DEFAULT 0,
  `favorite` tinyint(1) NOT NULL DEFAULT 0,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `create_by` int(10) NOT NULL,
  `update_at` datetime DEFAULT current_timestamp(),
  `update_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `material` (`material`),
  KEY `post` (`post`),
  KEY `create_by` (`create_by`),
  KEY `update_by` (`update_by`),
  KEY `classchat` (`classchat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `classchat`
--

DROP TABLE IF EXISTS `classchat`;
CREATE TABLE IF NOT EXISTS `classchat` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `message` int(10) DEFAULT NULL,
  `class` int(10) NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `mute_noti` tinyint(1) NOT NULL DEFAULT 0,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `message` (`message`),
  KEY `classchat_ibfk_1` (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `class_log`
--

DROP TABLE IF EXISTS `class_log`;
CREATE TABLE IF NOT EXISTS `class_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `class` int(10) NOT NULL,
  `type` int(2) NOT NULL DEFAULT 0,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `create_by` int(10) NOT NULL,
  `update_at` datetime DEFAULT current_timestamp(),
  `update_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `create_by` (`create_by`),
  KEY `update_by` (`update_by`),
  KEY `class` (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `class_member`
--

DROP TABLE IF EXISTS `class_member`;
CREATE TABLE IF NOT EXISTS `class_member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account` int(10) NOT NULL,
  `class` int(10) NOT NULL,
  `role_member` varchar(20) NOT NULL,
  `mem_count` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account` (`account`),
  KEY `class` (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` int(2) NOT NULL,
  `content` text NOT NULL,
  `pic_url` text DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `create_by` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `create_by` (`create_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `class_log` int(10) NOT NULL,
  `read` tinyint(1) NOT NULL,
  `delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_ibfk_1` (`class_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_temp`
--

DROP TABLE IF EXISTS `password_reset_temp`;
CREATE TABLE IF NOT EXISTS `password_reset_temp` (
  `email` varchar(250) NOT NULL,
  `key` varchar(250) NOT NULL,
  `expDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chatroom`
--
ALTER TABLE `chatroom`
  ADD CONSTRAINT `chatroom_ibfk_1` FOREIGN KEY (`message`) REFERENCES `message` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `chatroom_ibfk_3` FOREIGN KEY (`to`) REFERENCES `account` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `chat_list`
--
ALTER TABLE `chat_list`
  ADD CONSTRAINT `chat_list_ibfk_1` FOREIGN KEY (`account`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_list_ibfk_2` FOREIGN KEY (`chat`) REFERENCES `chatroom` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_list_ibfk_3` FOREIGN KEY (`classchat`) REFERENCES `classchat` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`material`) REFERENCES `material` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`post`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `class_ibfk_3` FOREIGN KEY (`create_by`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `class_ibfk_4` FOREIGN KEY (`update_by`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `classchat`
--
ALTER TABLE `classchat`
  ADD CONSTRAINT `classchat_ibfk_1` FOREIGN KEY (`class`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `classchat_ibfk_3` FOREIGN KEY (`message`) REFERENCES `message` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `class_log`
--
ALTER TABLE `class_log`
  ADD CONSTRAINT `class_log_ibfk_1` FOREIGN KEY (`class`) REFERENCES `class` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `class_log_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `class_log_ibfk_3` FOREIGN KEY (`update_by`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `class_log_ibfk_4` FOREIGN KEY (`class`) REFERENCES `class` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `class_member`
--
ALTER TABLE `class_member`
  ADD CONSTRAINT `class_member_ibfk_1` FOREIGN KEY (`account`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `class_member_ibfk_2` FOREIGN KEY (`class`) REFERENCES `class` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `class_member_ibfk_3` FOREIGN KEY (`class`) REFERENCES `class` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `account` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`class_log`) REFERENCES `class_log` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
