-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2021 at 06:48 PM
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

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `firstname`, `lastname`, `email`, `password`, `role`, `image`, `gender`, `phone`, `create_at`, `update_at`) VALUES
(1, 'Nithiwadee', 'Wangviboonkij', 'mindddk@gmail.com', 'mindddk', 'student', NULL, 'Female', '0809424208', '2021-04-22 21:33:21', NULL),
(2, 'Bhaksiree', 'Tongtago', 'volktgod@gmail.com', 'volkswgn', 'student', NULL, 'Female', NULL, '2021-04-22 21:34:25', NULL),
(3, 'Peerapong', 'Thammakaew', 'golf.prptmk@gmail.com', 'golfixed', 'student', NULL, 'Male', NULL, '2021-04-22 21:36:06', NULL),
(4, 'Naruemon', 'Wattanapongsakorn', 'ajnaruemon@gmail.com', 'advisor', 'teacher', NULL, 'Female', NULL, '2021-04-22 21:38:59', NULL),
(5, 'Sally', 'Goldin', 'ajsally@gmail.com', 'ajsally', 'teacher', NULL, 'Female', NULL, '2021-04-22 21:38:59', NULL),
(6, 'Thanin', 'Srithai', 'pnin@gmail.com', 'pthanin', 'teacher assistant', NULL, 'Male', NULL, '2021-04-22 21:41:45', NULL);

--
-- Dumping data for table `chatroom`
--

INSERT INTO `chatroom` (`id`, `message`, `to`, `read`, `mute_noti`, `create_at`) VALUES
(2, 1, 2, 0, 0, '2021-04-22 22:57:46'),
(3, 3, 1, 0, 0, '2021-04-22 22:57:46'),
(4, 4, 3, 0, 0, '2021-04-22 22:58:07');

--
-- Dumping data for table `chat_list`
--

INSERT INTO `chat_list` (`id`, `account`, `chat`, `classchat`, `favorite`) VALUES
(1, 1, 2, 1, 1),
(2, 2, 2, 1, 1),
(3, 4, 4, 1, 0);

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `class_code`, `class_name`, `class_desc`, `class_pic`, `section`, `join_code`, `classchat`, `material`, `post`, `mute_noti`, `favorite`, `create_at`, `create_by`, `update_at`, `update_by`) VALUES
(1, 'CPE401', 'Senior Project', NULL, NULL, '1', 'CPE401', 0, NULL, NULL, 0, 0, '2021-04-22 21:51:53', 4, '2021-04-22 21:51:53', NULL),
(2, 'CPE100', 'Basic Programming', NULL, NULL, '2', '0', NULL, NULL, NULL, 0, 0, '2021-04-22 21:53:02', 5, '2021-04-22 21:53:02', NULL),
(3, 'LNG321', 'English for Engineer', NULL, NULL, '22', '0', NULL, NULL, NULL, 0, 0, '2021-04-22 21:54:55', 5, NULL, NULL),
(4, 'GEN351', 'Optimization Design and Reliability', NULL, NULL, '1', '0', NULL, NULL, NULL, 0, 0, '2021-04-22 21:54:55', 4, NULL, NULL);

--
-- Dumping data for table `classchat`
--

INSERT INTO `classchat` (`id`, `message`, `class`, `read`, `mute_noti`, `create_at`) VALUES
(1, 2, 2, 1, 0, '2021-04-22 22:14:48'),
(2, 5, 1, 0, 0, '2021-04-22 22:16:00');

--
-- Dumping data for table `class_log`
--

INSERT INTO `class_log` (`id`, `class`, `type`, `create_at`, `create_by`, `update_at`, `update_by`) VALUES
(1, 2, 0, '2021-04-22 22:01:45', 5, '2021-04-22 22:01:45', NULL),
(2, 1, 1, '2021-04-22 22:01:45', 4, '2021-04-22 22:01:45', NULL),
(3, 4, 1, '2021-04-22 22:02:53', 4, '2021-04-22 22:02:53', NULL),
(4, 3, 1, '2021-04-22 22:02:53', 5, NULL, NULL);

--
-- Dumping data for table `class_member`
--

INSERT INTO `class_member` (`id`, `account`, `class`, `role_member`, `mem_count`) VALUES
(1, 2, 1, 'student', NULL),
(2, 4, 1, 'teacher', NULL),
(3, 1, 1, 'student', NULL),
(4, 3, 1, 'student', NULL),
(5, 5, 2, 'teacher', NULL),
(6, 6, 1, 'teacher assistant', NULL),
(7, 4, 4, 'teacher', NULL),
(8, 5, 3, 'teacher', NULL);

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `type`, `content`, `pic_url`, `create_at`, `create_by`) VALUES
(1, 1, 'Hello', NULL, '2021-04-22 21:56:11', 1),
(2, 0, 'This is my message.', NULL, '2021-04-22 21:56:11', 1),
(3, 1, 'How are you?', NULL, '2021-04-22 21:57:41', 2),
(4, 1, 'I\'m fine.', NULL, '2021-04-22 21:57:41', 3),
(5, 0, 'How about your project?', NULL, '2021-04-22 21:58:23', 4);

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `class_log`, `read`, `delete`) VALUES
(1, 1, 0, 0),
(2, 2, 0, 0),
(3, 3, 1, 0),
(4, 4, 1, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
