-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2021 at 04:27 PM
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
CREATE DATABASE IF NOT EXISTS `class` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `class`;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(10) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `image` text DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chatroom`
--

DROP TABLE IF EXISTS `chatroom`;
CREATE TABLE `chatroom` (
  `id` int(10) NOT NULL,
  `message` int(10) NOT NULL,
  `from` int(10) NOT NULL,
  `to` int(10) NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `mute_noti` tinyint(1) NOT NULL DEFAULT 0,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `create_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chat_list`
--

DROP TABLE IF EXISTS `chat_list`;
CREATE TABLE `chat_list` (
  `id` int(10) NOT NULL,
  `account` int(10) NOT NULL,
  `chat` int(10) NOT NULL,
  `classchat` int(10) NOT NULL,
  `favorite` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int(10) NOT NULL,
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
  `update_by` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `classchat`
--

DROP TABLE IF EXISTS `classchat`;
CREATE TABLE `classchat` (
  `id` int(10) NOT NULL,
  `message` int(10) DEFAULT NULL,
  `class` int(10) NOT NULL,
  `to` int(10) NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `mute_noti` tinyint(1) NOT NULL DEFAULT 0,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `create_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `class_log`
--

DROP TABLE IF EXISTS `class_log`;
CREATE TABLE `class_log` (
  `id` int(10) NOT NULL,
  `class` int(10) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `create_by` int(10) NOT NULL,
  `update_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `class_member`
--

DROP TABLE IF EXISTS `class_member`;
CREATE TABLE `class_member` (
  `id` int(10) NOT NULL,
  `account` int(10) NOT NULL,
  `class` int(10) NOT NULL,
  `role_member` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(10) NOT NULL,
  `pic_url` text DEFAULT NULL,
  `text` text NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `create_by` int(10) NOT NULL,
  `update_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `id` int(10) NOT NULL,
  `topic_name` int(10) NOT NULL,
  `material_url` text NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `create_by` int(10) NOT NULL,
  `update_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `material_topic`
--

DROP TABLE IF EXISTS `material_topic`;
CREATE TABLE `material_topic` (
  `id` int(10) NOT NULL,
  `title` varchar(250) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `create_by` int(10) NOT NULL,
  `update_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(10) NOT NULL,
  `type` int(2) NOT NULL,
  `content` text NOT NULL,
  `pic_url` text DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `create_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `id` int(10) NOT NULL,
  `class_log` int(10) NOT NULL,
  `read` tinyint(1) NOT NULL,
  `delete` tinyint(1) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `create_by` int(10) NOT NULL,
  `update_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_temp`
--

DROP TABLE IF EXISTS `password_reset_temp`;
CREATE TABLE `password_reset_temp` (
  `email` varchar(250) NOT NULL,
  `key` varchar(250) NOT NULL,
  `expDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `poll`
--

DROP TABLE IF EXISTS `poll`;
CREATE TABLE `poll` (
  `id` int(10) NOT NULL,
  `option` int(10) DEFAULT NULL,
  `result` int(10) DEFAULT NULL,
  `title` varchar(250) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `expired` datetime DEFAULT NULL,
  `content` text DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `create_by` int(10) NOT NULL,
  `update_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `poll_option`
--

DROP TABLE IF EXISTS `poll_option`;
CREATE TABLE `poll_option` (
  `id` int(10) NOT NULL,
  `poll` int(10) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `content` text DEFAULT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `poll_result`
--

DROP TABLE IF EXISTS `poll_result`;
CREATE TABLE `poll_result` (
  `id` int(10) NOT NULL,
  `option` int(10) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `create_at` datetime DEFAULT current_timestamp(),
  `create_by` int(10) DEFAULT NULL,
  `update_at` datetime DEFAULT current_timestamp(),
  `update_by` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `poll_vote`
--

DROP TABLE IF EXISTS `poll_vote`;
CREATE TABLE `poll_vote` (
  `id` int(10) NOT NULL,
  `poll` int(10) NOT NULL,
  `poll_option` int(10) NOT NULL,
  `account` int(10) NOT NULL,
  `content` text DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `create_by` int(10) NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `update_by` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(10) NOT NULL,
  `class` int(10) NOT NULL,
  `poll` int(10) DEFAULT NULL,
  `comment` int(10) DEFAULT NULL,
  `announce` varchar(1) NOT NULL,
  `click_count` int(5) UNSIGNED NOT NULL DEFAULT 0,
  `pic_url` text DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `create_by` int(10) NOT NULL,
  `update_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`,`email`) USING BTREE;

--
-- Indexes for table `chatroom`
--
ALTER TABLE `chatroom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message` (`message`),
  ADD KEY `from` (`from`),
  ADD KEY `to` (`to`),
  ADD KEY `create_by` (`create_by`);

--
-- Indexes for table `chat_list`
--
ALTER TABLE `chat_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account` (`account`),
  ADD KEY `chat` (`chat`),
  ADD KEY `classchat` (`classchat`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `material` (`material`),
  ADD KEY `post` (`post`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `update_by` (`update_by`),
  ADD KEY `classchat` (`classchat`);

--
-- Indexes for table `classchat`
--
ALTER TABLE `classchat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class` (`class`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `message` (`message`),
  ADD KEY `to` (`to`);

--
-- Indexes for table `class_log`
--
ALTER TABLE `class_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `update_by` (`update_by`),
  ADD KEY `class` (`class`);

--
-- Indexes for table `class_member`
--
ALTER TABLE `class_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account` (`account`),
  ADD KEY `class` (`class`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `update_by` (`update_by`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_name` (`topic_name`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `update_by` (`update_by`);

--
-- Indexes for table `material_topic`
--
ALTER TABLE `material_topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `update_by` (`update_by`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `create_by` (`create_by`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `update_by` (`update_by`),
  ADD KEY `class_log` (`class_log`);

--
-- Indexes for table `poll`
--
ALTER TABLE `poll`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option` (`option`),
  ADD KEY `result` (`result`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `update_by` (`update_by`);

--
-- Indexes for table `poll_option`
--
ALTER TABLE `poll_option`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poll` (`poll`);

--
-- Indexes for table `poll_result`
--
ALTER TABLE `poll_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option` (`option`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `update_by` (`update_by`);

--
-- Indexes for table `poll_vote`
--
ALTER TABLE `poll_vote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account` (`account`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `poll` (`poll`),
  ADD KEY `poll_option` (`poll_option`),
  ADD KEY `update_by` (`update_by`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poll` (`poll`),
  ADD KEY `comment` (`comment`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `update_by` (`update_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chatroom`
--
ALTER TABLE `chatroom`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_list`
--
ALTER TABLE `chat_list`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classchat`
--
ALTER TABLE `classchat`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_log`
--
ALTER TABLE `class_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_member`
--
ALTER TABLE `class_member`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `material_topic`
--
ALTER TABLE `material_topic`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poll`
--
ALTER TABLE `poll`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poll_option`
--
ALTER TABLE `poll_option`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poll_result`
--
ALTER TABLE `poll_result`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poll_vote`
--
ALTER TABLE `poll_vote`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chatroom`
--
ALTER TABLE `chatroom`
  ADD CONSTRAINT `chatroom_ibfk_1` FOREIGN KEY (`message`) REFERENCES `message` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `chatroom_ibfk_2` FOREIGN KEY (`from`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `chatroom_ibfk_3` FOREIGN KEY (`to`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `chatroom_ibfk_4` FOREIGN KEY (`create_by`) REFERENCES `account` (`id`) ON UPDATE CASCADE;

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
  ADD CONSTRAINT `class_ibfk_4` FOREIGN KEY (`update_by`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `class_ibfk_5` FOREIGN KEY (`classchat`) REFERENCES `classchat` (`id`);

--
-- Constraints for table `classchat`
--
ALTER TABLE `classchat`
  ADD CONSTRAINT `classchat_ibfk_1` FOREIGN KEY (`class`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `classchat_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `classchat_ibfk_3` FOREIGN KEY (`message`) REFERENCES `message` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `classchat_ibfk_4` FOREIGN KEY (`to`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`update_by`) REFERENCES `account` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `material`
--
ALTER TABLE `material`
  ADD CONSTRAINT `material_ibfk_1` FOREIGN KEY (`topic_name`) REFERENCES `material_topic` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `material_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `material_ibfk_3` FOREIGN KEY (`update_by`) REFERENCES `account` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `material_topic`
--
ALTER TABLE `material_topic`
  ADD CONSTRAINT `material_topic_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `material_topic_ibfk_2` FOREIGN KEY (`update_by`) REFERENCES `account` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `account` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`class_log`) REFERENCES `class_log` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_3` FOREIGN KEY (`update_by`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_4` FOREIGN KEY (`class_log`) REFERENCES `class_log` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `poll`
--
ALTER TABLE `poll`
  ADD CONSTRAINT `poll_ibfk_1` FOREIGN KEY (`option`) REFERENCES `poll_option` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `poll_ibfk_2` FOREIGN KEY (`result`) REFERENCES `poll_result` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `poll_ibfk_3` FOREIGN KEY (`create_by`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `poll_ibfk_4` FOREIGN KEY (`update_by`) REFERENCES `account` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `poll_option`
--
ALTER TABLE `poll_option`
  ADD CONSTRAINT `poll_option_ibfk_1` FOREIGN KEY (`poll`) REFERENCES `poll` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `poll_result`
--
ALTER TABLE `poll_result`
  ADD CONSTRAINT `poll_result_ibfk_1` FOREIGN KEY (`option`) REFERENCES `poll_option` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `poll_result_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `poll_result_ibfk_3` FOREIGN KEY (`update_by`) REFERENCES `account` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `poll_vote`
--
ALTER TABLE `poll_vote`
  ADD CONSTRAINT `poll_vote_ibfk_1` FOREIGN KEY (`account`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `poll_vote_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `poll_vote_ibfk_3` FOREIGN KEY (`poll`) REFERENCES `poll` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `poll_vote_ibfk_4` FOREIGN KEY (`poll_option`) REFERENCES `poll_option` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `poll_vote_ibfk_5` FOREIGN KEY (`update_by`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`poll`) REFERENCES `poll` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`comment`) REFERENCES `comment` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `post_ibfk_3` FOREIGN KEY (`create_by`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `post_ibfk_4` FOREIGN KEY (`update_by`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `post_ibfk_5` FOREIGN KEY (`class`) REFERENCES `class` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
