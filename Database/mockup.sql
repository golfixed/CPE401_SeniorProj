-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2021 at 09:43 AM
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

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `firstname`, `lastname`, `email`, `password`, `role`, `image`, `gender`, `phone`, `create_at`, `update_at`) VALUES
(1, 'Kellina', 'Metzel', 'kmetzel0@yandex.ru', 'FI9HAdAHJLj', 'Automation Specialis', 'https://robohash.org/eumcorporiseos.bmp?size=50x50&set=set1', 'Male', '602-198-2840', '2020-11-23 21:57:18', '2020-03-29 02:12:34'),
(1, 'Nithiwadee', 'Wangviboonkij', 'nithiwadee.my@mail.kmutt.ac.th', '-mindddk0106-', 'student', 'https://picsum.photos/200/300?random=2', 'Female', '0809424208', '2021-04-06 16:21:03', '2021-04-06 16:21:03'),
(2, 'Ax', 'Sherrott', 'asherrott1@independent.co.uk', 'UXsNSMS', 'Administrative Offic', 'https://robohash.org/molestiasminusodio.bmp?size=50x50&set=set1', 'Male', '474-836-7011', '2020-12-18 00:06:57', '2020-11-17 23:11:51'),
(2, 'Bhaksiree', 'Tongtago', 'bhaksiree.v@kmutt.ac.th', 'volkvolk', 'student', NULL, 'Female', '', '2021-04-10 14:22:24', NULL),
(3, 'Maryjane', 'Brockhurst', 'mbrockhurst2@buzzfeed.com', 'OalMJfQyM', 'Community Outreach S', 'https://robohash.org/etlaudantiumut.jpg?size=50x50&set=set1', 'Male', '413-889-2175', '2020-08-17 10:49:56', '2020-04-08 10:08:38'),
(4, 'Aubrie', 'Siemons', 'asiemons3@wsj.com', 'w7BVd2H', 'Quality Control Spec', 'https://robohash.org/quoquicupiditate.png?size=50x50&set=set1', 'Female', '348-344-9753', '2020-12-26 12:43:36', '2020-10-09 09:19:13'),
(5, 'Roderich', 'Yelden', 'ryelden4@reference.com', 'z6YpbtKE', 'Project Manager', 'https://robohash.org/velitexpeditaquo.png?size=50x50&set=set1', 'Female', '603-654-6633', '2020-10-18 09:41:44', '2020-07-24 21:25:53'),
(6, 'Chrissy', 'Gildersleeve', 'cgildersleeve5@ifeng.com', 'hN9wLnLkQAn', 'Technical Writer', 'https://robohash.org/inciduntetodio.bmp?size=50x50&set=set1', 'Female', '349-822-2996', '2020-08-28 03:00:37', '2020-04-17 12:46:47'),
(7, 'Ilyssa', 'Veall', 'iveall6@shutterfly.com', 'lUE5nQLp6', 'Social Worker', 'https://robohash.org/ipsametunde.jpg?size=50x50&set=set1', 'Female', '646-676-1087', '2020-04-27 10:58:12', '2021-03-03 11:28:33'),
(8, 'Codie', 'O\'Halloran', 'cohalloran7@wordpress.org', 'TudJNIxsz', 'Programmer Analyst I', 'https://robohash.org/utodiolaudantium.png?size=50x50&set=set1', 'Female', '863-289-2756', '2020-11-25 03:22:07', '2021-02-04 04:55:02'),
(9, 'Danette', 'Jelk', 'djelk8@pagesperso-orange.fr', 'XRZAQMq', 'Automation Specialis', 'https://robohash.org/minimaullamet.jpg?size=50x50&set=set1', 'Female', '389-327-1783', '2021-02-16 19:33:30', '2020-04-20 17:12:03'),
(10, 'Joelynn', 'Copcutt', 'jcopcutt9@usgs.gov', 'e6A47G9zkFfM', 'Internal Auditor', 'https://robohash.org/veromollitiasaepe.png?size=50x50&set=set1', 'Male', '411-175-5545', '2021-02-24 21:15:02', '2020-10-04 19:11:51'),
(11, 'Deva', 'Beacroft', 'dbeacrofta@berkeley.edu', 'mrzyUwHX9DHU', 'Administrative Offic', 'https://robohash.org/minussitin.jpg?size=50x50&set=set1', 'Male', '836-929-0783', '2021-03-12 13:15:26', '2020-10-19 19:11:18'),
(12, 'Isa', 'Albinson', 'ialbinsonb@phoca.cz', '0aADQIh', 'Statistician I', 'https://robohash.org/ipsaatiste.png?size=50x50&set=set1', 'Female', '720-937-6844', '2020-12-24 09:19:43', '2020-08-31 05:02:18'),
(13, 'Cordey', 'Bertlin', 'cbertlinc@hp.com', 'OStWtAkaVB', 'Analyst Programmer', 'https://robohash.org/temporibuseteveniet.png?size=50x50&set=set1', 'Female', '470-683-2514', '2020-12-04 13:25:29', '2021-02-16 20:12:18'),
(14, 'Cornell', 'Wimp', 'cwimpd@reverbnation.com', 'DbuUbCmMkfz', 'Human Resources Mana', 'https://robohash.org/animivoluptatemaliquid.bmp?size=50x50&set=set1', 'Male', '880-672-8051', '2020-03-18 09:35:14', '2020-04-11 08:33:42'),
(15, 'Merle', 'Fick', 'mficke@constantcontact.com', 'rU0IzY', 'Food Chemist', 'https://robohash.org/accusantiumcorruptieos.png?size=50x50&set=set1', 'Female', '834-798-8503', '2020-08-02 12:42:30', '2020-07-15 19:04:26'),
(16, 'Galven', 'Spratley', 'gspratleyf@pbs.org', 'spfxVEN', 'Developer III', 'https://robohash.org/autdolorquia.png?size=50x50&set=set1', 'Male', '610-380-1416', '2020-08-15 19:53:45', '2020-07-12 01:56:59'),
(17, 'Arron', 'Washbrook', 'awashbrookg@domainmarket.com', 'sFmzi0J', 'Data Coordiator', 'https://robohash.org/eligendidebitisofficia.png?size=50x50&set=set1', 'Female', '921-409-7276', '2020-12-26 12:46:16', '2021-01-31 02:20:41'),
(18, 'Janka', 'Rubenovic', 'jrubenovich@prweb.com', 'sXh6HQ1ukBtg', 'Structural Analysis ', 'https://robohash.org/ducimusutquia.jpg?size=50x50&set=set1', 'Male', '920-586-5565', '2020-08-23 13:19:42', '2021-02-22 17:46:07'),
(19, 'Gussie', 'Luxton', 'gluxtoni@com.com', 'MMgpc5AXxn', 'General Manager', 'https://robohash.org/reruminfacilis.bmp?size=50x50&set=set1', 'Female', '684-831-0116', '2020-09-28 14:13:51', '2020-06-11 05:30:09'),
(20, 'Olivia', 'Eggins', 'oegginsj@imdb.com', 'zULnncr2U', 'Associate Professor', 'https://robohash.org/cupiditatevoluptatempossimus.bmp?size=50x50&set=set1', 'Male', '955-165-7204', '2021-03-03 12:15:29', '2020-03-19 12:55:25'),
(21, 'Wash', 'Mirfin', 'wmirfink@umn.edu', '8QpXA6qdK', 'Food Chemist', 'https://robohash.org/voluptatemevenietrerum.bmp?size=50x50&set=set1', 'Male', '486-842-7719', '2020-08-05 00:25:44', '2020-12-06 13:06:26'),
(22, 'Glenda', 'O\'Hannay', 'gohannayl@mayoclinic.com', '0DYlNTqa9h0', 'Product Engineer', 'https://robohash.org/earumminuslaudantium.png?size=50x50&set=set1', 'Female', '150-576-6330', '2020-08-27 04:42:14', '2021-01-12 06:14:53'),
(23, 'Abbi', 'Toms', 'atomsm@digg.com', 'iibuzP', 'Account Executive', 'https://robohash.org/assumendaautodit.jpg?size=50x50&set=set1', 'Female', '845-149-7428', '2020-04-21 23:50:11', '2020-05-08 10:14:42'),
(24, 'Frederik', 'Jakubovitch', 'fjakubovitchn@vkontakte.ru', 'ZHVMdRz2kid', 'Statistician II', 'https://robohash.org/molestiaequidemrecusandae.bmp?size=50x50&set=set1', 'Male', '113-250-8630', '2021-01-11 11:58:26', '2021-01-01 15:19:52'),
(25, 'Haskel', 'Hoyte', 'hhoyteo@comsenz.com', 'cIuM5iCHyJU', 'Research Nurse', 'https://robohash.org/estcupiditateea.png?size=50x50&set=set1', 'Male', '243-575-4667', '2021-01-14 11:46:49', '2020-09-30 14:27:25'),
(26, 'Lissa', 'Carbonell', 'lcarbonellp@weibo.com', '1wkh6075SY', 'Clinical Specialist', 'https://robohash.org/quoddignissimosnesciunt.png?size=50x50&set=set1', 'Female', '614-238-2624', '2020-11-28 00:00:52', '2020-10-02 08:04:16'),
(27, 'Penelopa', 'Aldwinckle', 'paldwinckleq@smh.com.au', 'PXeqIl6h', 'Biostatistician I', 'https://robohash.org/recusandaesitlaudantium.bmp?size=50x50&set=set1', 'Female', '609-730-6092', '2020-10-06 07:01:49', '2020-07-17 08:37:46'),
(28, 'Adriano', 'De Laci', 'adelacir@facebook.com', 'ba8C6VU', 'Environmental Specia', 'https://robohash.org/utsintautem.bmp?size=50x50&set=set1', 'Female', '242-311-0965', '2020-05-19 20:01:03', '2020-05-12 05:58:45'),
(29, 'Bobina', 'D\'Angeli', 'bdangelis@technorati.com', 'lQ0ety1N', 'Registered Nurse', 'https://robohash.org/aliquamdictalaboriosam.jpg?size=50x50&set=set1', 'Female', '815-556-0596', '2021-02-07 00:28:43', '2021-01-08 10:05:16'),
(30, 'Sondra', 'Daniell', 'sdaniellt@printfriendly.com', 'WTK3RAlR', 'Office Assistant IV', 'https://robohash.org/minimasitquasi.png?size=50x50&set=set1', 'Female', '533-460-8493', '2021-03-10 06:39:22', '2020-06-01 09:43:09'),
(31, 'Win', 'Pipworth', 'wpipworthu@360.cn', 'zST8HTa', 'Analog Circuit Desig', 'https://robohash.org/doloreexat.png?size=50x50&set=set1', 'Male', '925-515-4434', '2020-06-27 02:03:06', '2020-11-10 18:12:17'),
(32, 'Zachary', 'Tomashov', 'ztomashovv@sciencedirect.com', 'Qbeyq0o', 'Graphic Designer', 'https://robohash.org/cumvoluptatemratione.jpg?size=50x50&set=set1', 'Male', '738-602-5892', '2020-03-23 06:15:38', '2020-05-13 01:02:21'),
(33, 'Dulcinea', 'Malyj', 'dmalyjw@jimdo.com', 'HrfFJw', 'Chemical Engineer', 'https://robohash.org/sedfacereconsequatur.bmp?size=50x50&set=set1', 'Male', '223-942-3474', '2020-10-08 09:18:36', '2020-05-29 09:00:54'),
(34, 'Cecile', 'Huyton', 'chuytonx@cbsnews.com', 'xqGtlmP7u', 'Software Engineer II', 'https://robohash.org/omnisnumquamdoloremque.jpg?size=50x50&set=set1', 'Male', '425-411-9328', '2020-09-15 00:03:11', '2020-05-04 17:56:42'),
(35, 'Trenton', 'Pickaver', 'tpickavery@china.com.cn', 'wgw9crzTCDPh', 'Director of Sales', 'https://robohash.org/reiciendismaioressequi.png?size=50x50&set=set1', 'Female', '795-606-2404', '2020-05-24 10:46:06', '2020-07-02 02:40:39'),
(36, 'Claude', 'Walewski', 'cwalewskiz@berkeley.edu', 'Y42ualpSwVIJ', 'Accountant IV', 'https://robohash.org/dolornihilet.png?size=50x50&set=set1', 'Male', '167-976-9602', '2020-12-21 07:50:42', '2020-04-26 16:38:06'),
(37, 'Aleksandr', 'Kerman', 'akerman10@fotki.com', 'v546q6T', 'Staff Scientist', 'https://robohash.org/consequaturquamminima.bmp?size=50x50&set=set1', 'Female', '404-656-9774', '2021-03-16 22:56:21', '2020-06-10 13:25:09'),
(38, 'Nickolas', 'Bill', 'nbill11@gov.uk', 'Xi2elvzyK', 'Marketing Assistant', 'https://robohash.org/corruptiminusdolor.jpg?size=50x50&set=set1', 'Male', '225-458-0043', '2020-08-04 10:32:03', '2021-02-16 09:16:54'),
(39, 'Ari', 'Sebley', 'asebley12@yahoo.co.jp', 'X31TjR', 'Desktop Support Tech', 'https://robohash.org/nemoetporro.jpg?size=50x50&set=set1', 'Male', '847-544-3640', '2020-03-26 03:03:57', '2020-07-21 06:21:58'),
(40, 'Annora', 'Rizzetti', 'arizzetti13@paypal.com', 'MEbzgazl', 'Internal Auditor', 'https://robohash.org/autabdolor.png?size=50x50&set=set1', 'Male', '860-955-9229', '2021-03-01 21:54:30', '2020-11-24 04:42:50'),
(41, 'Pieter', 'Zanardii', 'pzanardii14@studiopress.com', 'mDjMJe', 'VP Marketing', 'https://robohash.org/veritatisatqui.png?size=50x50&set=set1', 'Female', '741-493-7340', '2020-12-01 06:25:25', '2020-11-16 08:30:21'),
(42, 'Modesta', 'Wanell', 'mwanell15@shinystat.com', 'Tuq6xJww', 'Executive Secretary', 'https://robohash.org/estlaudantiumneque.jpg?size=50x50&set=set1', 'Male', '599-806-7541', '2020-10-29 12:06:44', '2020-07-17 12:38:17'),
(43, 'Elyn', 'Edmonds', 'eedmonds16@npr.org', '7WVkavg', 'Librarian', 'https://robohash.org/idsequiet.bmp?size=50x50&set=set1', 'Male', '329-147-0548', '2020-06-08 22:06:43', '2020-11-08 23:54:00'),
(44, 'Jasen', 'Randell', 'jrandell17@cnbc.com', '297YADe', 'Database Administrat', 'https://robohash.org/solutadoloreexpedita.jpg?size=50x50&set=set1', 'Female', '664-100-5377', '2020-10-06 09:40:57', '2020-08-24 07:12:04'),
(45, 'Gloria', 'Rousby', 'grousby18@google.com.br', '275VolcFebN', 'Computer Systems Ana', 'https://robohash.org/dolorpariaturquos.jpg?size=50x50&set=set1', 'Male', '491-715-3502', '2020-06-23 23:25:11', '2020-11-18 20:32:07'),
(46, 'Cecilio', 'MacAlpin', 'cmacalpin19@google.com', 'G0SOKU93', 'Accountant IV', 'https://robohash.org/delectuspariaturexcepturi.bmp?size=50x50&set=set1', 'Male', '516-274-1754', '2020-08-02 21:39:23', '2020-12-19 13:38:17'),
(47, 'Bartlet', 'Simco', 'bsimco1a@sakura.ne.jp', 'CLT5lPiZFu', 'Payment Adjustment C', 'https://robohash.org/doloremquealiquidet.jpg?size=50x50&set=set1', 'Female', '236-797-9621', '2020-11-14 02:17:14', '2021-01-26 09:24:10'),
(48, 'Holmes', 'Dickin', 'hdickin1b@forbes.com', 'AkCR84', 'Web Designer IV', 'https://robohash.org/laboriosamquaequo.bmp?size=50x50&set=set1', 'Female', '884-769-7815', '2020-09-12 03:36:50', '2020-06-22 10:26:59'),
(49, 'Lilah', 'Caldera', 'lcaldera1c@flavors.me', 'AEo072c', 'Geological Engineer', 'https://robohash.org/eaqueiustosit.bmp?size=50x50&set=set1', 'Female', '888-377-8753', '2020-05-08 07:24:46', '2021-02-11 02:56:32'),
(50, 'Marigold', 'Kilroy', 'mkilroy1d@house.gov', 'llg5Ifwxs', 'Product Engineer', 'https://robohash.org/estnonsed.jpg?size=50x50&set=set1', 'Female', '299-341-9825', '2020-04-09 02:58:36', '2020-03-23 19:06:12'),
(51, 'Adolph', 'McCardle', 'amccardle1e@skyrock.com', 'g55VmoCl', 'Developer II', 'https://robohash.org/explicaboexercitationemadipisci.bmp?size=50x50&set=set1', 'Male', '208-444-3186', '2021-03-16 02:16:35', '2020-04-05 13:04:02'),
(52, 'Massimiliano', 'Wickman', 'mwickman1f@nbcnews.com', 'NaElNzyhnlA', 'Help Desk Operator', 'https://robohash.org/velexplicaboassumenda.bmp?size=50x50&set=set1', 'Male', '499-778-7009', '2020-06-19 23:28:56', '2020-10-31 02:33:24'),
(53, 'Yasmin', 'Gronowe', 'ygronowe1g@indiatimes.com', 'qBUoYTeu8', 'Developer II', 'https://robohash.org/noneumanimi.bmp?size=50x50&set=set1', 'Male', '951-847-1630', '2020-06-03 15:51:49', '2020-06-30 08:49:48'),
(54, 'Roderigo', 'Paschek', 'rpaschek1h@hibu.com', '86RA5APSQPO', 'Editor', 'https://robohash.org/consequaturdoloremtempora.bmp?size=50x50&set=set1', 'Male', '118-388-8751', '2020-07-18 10:08:36', '2020-11-10 16:33:58'),
(55, 'Kailey', 'Donnel', 'kdonnel1i@skyrock.com', 'Yo8PGWUXFJJN', 'Analog Circuit Desig', 'https://robohash.org/sapienteconsequunturenim.bmp?size=50x50&set=set1', 'Female', '279-228-6308', '2020-10-03 14:00:30', '2020-12-12 06:38:03'),
(56, 'Remington', 'Kurten', 'rkurten1j@netlog.com', '1HjespNINPV', 'Operator', 'https://robohash.org/maximequisut.bmp?size=50x50&set=set1', 'Female', '732-383-3057', '2020-12-18 05:17:13', '2020-04-20 18:13:12'),
(57, 'Caresse', 'Gillyett', 'cgillyett1k@timesonline.co.uk', 'WyboIBFW8q84', 'Marketing Assistant', 'https://robohash.org/velitetquia.bmp?size=50x50&set=set1', 'Male', '840-590-5363', '2020-09-21 06:21:22', '2020-10-21 14:58:07'),
(58, 'Nevsa', 'Ruste', 'nruste1l@tuttocitta.it', '1Rhzn65CR', 'Database Administrat', 'https://robohash.org/doloremdolorequia.bmp?size=50x50&set=set1', 'Female', '718-733-8260', '2020-11-15 19:43:52', '2020-11-29 15:18:42'),
(59, 'Barby', 'Walkling', 'bwalkling1m@gnu.org', '44cE4E6', 'Human Resources Assi', 'https://robohash.org/velpariaturrecusandae.png?size=50x50&set=set1', 'Male', '468-325-2911', '2020-12-05 08:39:00', '2020-10-17 15:09:17'),
(60, 'Caesar', 'Sawyers', 'csawyers1n@ft.com', 'ywjxT5Swp', 'Web Developer II', 'https://robohash.org/delectusadoloribus.png?size=50x50&set=set1', 'Female', '679-678-4114', '2020-08-06 09:54:51', '2020-10-04 11:53:23'),
(61, 'Dillon', 'Waugh', 'dwaugh1o@geocities.com', 'WO8O9S5U', 'Software Test Engine', 'https://robohash.org/modirepellendussit.jpg?size=50x50&set=set1', 'Female', '318-563-9013', '2020-06-19 03:43:20', '2020-09-18 03:05:44'),
(62, 'Eveleen', 'Rome', 'erome1p@umn.edu', 'z6isk6mEGA', 'Structural Analysis ', 'https://robohash.org/ipsumquivoluptas.bmp?size=50x50&set=set1', 'Female', '713-686-8325', '2020-05-23 17:10:07', '2020-06-14 16:38:26'),
(63, 'Tod', 'Sear', 'tsear1q@bluehost.com', 'N8N0F1C8J', 'Food Chemist', 'https://robohash.org/etfugasit.jpg?size=50x50&set=set1', 'Female', '818-293-8913', '2021-02-14 11:13:34', '2020-10-12 11:32:55'),
(64, 'Byran', 'Eddison', 'beddison1r@timesonline.co.uk', 'bYDcD8', 'Statistician III', 'https://robohash.org/voluptatesminusquia.png?size=50x50&set=set1', 'Male', '432-907-3835', '2020-04-24 21:44:27', '2020-04-28 14:43:55'),
(65, 'Sharia', 'Coward', 'scoward1s@myspace.com', 'mkFrrUDvQ1sR', 'Analyst Programmer', 'https://robohash.org/illodistinctioqui.bmp?size=50x50&set=set1', 'Male', '819-832-5211', '2020-06-08 07:22:33', '2020-11-11 11:06:49'),
(66, 'Sharleen', 'Patkin', 'spatkin1t@google.fr', '2LSWtaKU', 'VP Accounting', 'https://robohash.org/doloretincidunt.bmp?size=50x50&set=set1', 'Male', '734-589-0791', '2020-06-01 20:39:50', '2020-05-10 23:12:55'),
(67, 'Ogdon', 'Beadon', 'obeadon1u@goo.gl', '7mqeY3onM6x', 'Administrative Offic', 'https://robohash.org/omnissunttempora.jpg?size=50x50&set=set1', 'Male', '924-112-0169', '2020-09-01 18:06:27', '2021-03-04 07:18:35'),
(68, 'Corenda', 'Lofty', 'clofty1v@miitbeian.gov.cn', 'HKejn6Q3a', 'Graphic Designer', 'https://robohash.org/voluptatumaliasdistinctio.bmp?size=50x50&set=set1', 'Male', '982-442-0810', '2020-12-09 00:25:35', '2021-03-13 06:42:17'),
(69, 'Pepe', 'Licas', 'plicas1w@umich.edu', 'kvag8LxAQevp', 'Computer Systems Ana', 'https://robohash.org/quosaliquidpraesentium.bmp?size=50x50&set=set1', 'Female', '714-984-3831', '2020-11-23 09:06:05', '2020-10-05 20:15:19'),
(70, 'Ezequiel', 'Parrett', 'eparrett1x@privacy.gov.au', 'Z1sbOCBOEME', 'Web Designer IV', 'https://robohash.org/reiciendisnatuseius.png?size=50x50&set=set1', 'Female', '674-191-2510', '2021-01-31 18:46:06', '2020-12-25 16:03:36'),
(71, 'Jessalyn', 'Attock', 'jattock1y@t-online.de', 'Y8UBGf5K', 'Assistant Media Plan', 'https://robohash.org/facerequaeoptio.bmp?size=50x50&set=set1', 'Female', '733-653-1893', '2020-08-27 02:57:39', '2021-03-11 02:16:32'),
(72, 'Dewie', 'Chevin', 'dchevin1z@youtube.com', 'xNQcaV4RuMg9', 'Human Resources Mana', 'https://robohash.org/aperiamaliquamnatus.jpg?size=50x50&set=set1', 'Male', '609-425-9158', '2021-01-07 10:31:20', '2021-02-15 09:44:43'),
(73, 'Shirlee', 'Scouse', 'sscouse20@msu.edu', 'bpX630iTDptt', 'Tax Accountant', 'https://robohash.org/minimavitaerepellendus.png?size=50x50&set=set1', 'Female', '334-804-9777', '2021-02-26 09:13:31', '2020-11-25 20:11:07'),
(74, 'Bertrand', 'Lincke', 'blincke21@mlb.com', '0kCYgntLfp', 'Marketing Manager', 'https://robohash.org/earumplaceatnecessitatibus.bmp?size=50x50&set=set1', 'Female', '735-116-0948', '2020-04-17 06:24:55', '2020-03-20 05:04:12'),
(75, 'Myriam', 'Sommerlin', 'msommerlin22@boston.com', '3ExW6lPAXhRX', 'Technical Writer', 'https://robohash.org/officiisquidemvoluptas.jpg?size=50x50&set=set1', 'Female', '242-845-4659', '2020-08-09 04:18:07', '2020-09-14 00:59:23'),
(76, 'Rosco', 'Calver', 'rcalver23@artisteer.com', '58LgAUDhkBqF', 'Structural Analysis ', 'https://robohash.org/dolorliberodoloribus.bmp?size=50x50&set=set1', 'Male', '980-937-4920', '2021-03-14 15:03:02', '2021-01-09 13:49:47'),
(77, 'Lorry', 'Lownds', 'llownds24@ft.com', 'lJ0BuQbGY', 'Sales Associate', 'https://robohash.org/quaeratofficiasit.bmp?size=50x50&set=set1', 'Male', '369-233-4093', '2021-02-01 14:47:17', '2020-06-19 09:24:46'),
(78, 'Melvin', 'Libbie', 'mlibbie25@spiegel.de', 'da74PJM6cll', 'Civil Engineer', 'https://robohash.org/velitnostrumconsequatur.bmp?size=50x50&set=set1', 'Male', '962-752-0798', '2020-06-26 00:11:11', '2020-07-11 01:15:15'),
(79, 'Trixy', 'Letrange', 'tletrange26@auda.org.au', 'qjIaZha8k', 'Professor', 'https://robohash.org/officiisistenon.png?size=50x50&set=set1', 'Male', '910-633-6958', '2021-03-11 21:40:57', '2020-11-07 02:45:21'),
(80, 'Drugi', 'Gyer', 'dgyer27@macromedia.com', 'lFh43EaLR', 'Food Chemist', 'https://robohash.org/voluptatemillovel.png?size=50x50&set=set1', 'Male', '944-599-2660', '2020-05-04 22:19:14', '2020-09-24 21:05:36'),
(81, 'Jessee', 'Desaur', 'jdesaur28@sitemeter.com', 'qkDWpsP7i', 'Software Test Engine', 'https://robohash.org/magniquiet.jpg?size=50x50&set=set1', 'Female', '665-272-6472', '2020-05-30 13:25:06', '2020-11-24 19:56:56'),
(82, 'Sibilla', 'Leven', 'sleven29@va.gov', 'PHRy0dCWfAH', 'Project Manager', 'https://robohash.org/quaeiustoillum.png?size=50x50&set=set1', 'Male', '792-886-2994', '2021-02-01 05:07:53', '2020-09-02 10:24:28'),
(83, 'Thorin', 'De Lasci', 'tdelasci2a@simplemachines.org', '31nxREREx', 'Mechanical Systems E', 'https://robohash.org/repellatsaepeconsequatur.png?size=50x50&set=set1', 'Male', '822-336-8393', '2020-04-23 00:34:00', '2020-03-22 01:33:02'),
(84, 'Pietrek', 'Carnell', 'pcarnell2b@nasa.gov', 'EETQQ3uF', 'Structural Engineer', 'https://robohash.org/ineanecessitatibus.jpg?size=50x50&set=set1', 'Male', '634-956-8471', '2020-11-27 09:23:33', '2021-02-16 05:23:23'),
(85, 'Aldus', 'Baldock', 'abaldock2c@phoca.cz', 'f2bNZWulxhaF', 'Database Administrat', 'https://robohash.org/autemvoluptaterepudiandae.jpg?size=50x50&set=set1', 'Male', '397-647-4862', '2020-11-07 16:43:21', '2020-10-02 20:23:12'),
(86, 'Bobbee', 'Rizziello', 'brizziello2d@home.pl', '6YiirgK', 'Human Resources Mana', 'https://robohash.org/numquamsintet.bmp?size=50x50&set=set1', 'Female', '886-637-4256', '2021-02-15 10:21:14', '2020-09-01 16:45:18'),
(87, 'Neely', 'Fain', 'nfain2e@ed.gov', 'eCvXqr', 'Environmental Tech', 'https://robohash.org/fugiatetaccusamus.bmp?size=50x50&set=set1', 'Female', '842-712-4111', '2020-05-11 04:03:51', '2020-05-11 09:47:22'),
(88, 'Janot', 'Stanbridge', 'jstanbridge2f@blogtalkradio.com', 'xvirtDyR', 'Graphic Designer', 'https://robohash.org/fugaadperferendis.jpg?size=50x50&set=set1', 'Female', '863-949-3180', '2020-06-22 08:41:21', '2020-06-19 06:22:01'),
(89, 'Malvin', 'Zarfat', 'mzarfat2g@alexa.com', 'v2QbJB', 'Accountant III', 'https://robohash.org/doloremullamenim.png?size=50x50&set=set1', 'Female', '585-363-8036', '2020-09-22 06:52:05', '2021-03-15 07:40:49'),
(90, 'Henrie', 'Dri', 'hdri2h@biglobe.ne.jp', 'mbOPBI', 'VP Sales', 'https://robohash.org/ullamabratione.jpg?size=50x50&set=set1', 'Female', '277-522-0832', '2020-04-04 03:55:59', '2020-04-18 09:33:16'),
(91, 'Mariel', 'Witten', 'mwitten2i@woothemes.com', 'kWT89pes', 'Environmental Tech', 'https://robohash.org/praesentiumvoluptateexcepturi.jpg?size=50x50&set=set1', 'Male', '118-273-9194', '2021-03-01 16:49:10', '2020-04-06 22:08:24'),
(92, 'Dorita', 'MacAlpine', 'dmacalpine2j@shop-pro.jp', 'tQJ6VFsUj', 'Senior Financial Ana', 'https://robohash.org/sapientedoloremquo.jpg?size=50x50&set=set1', 'Male', '213-506-5531', '2020-12-22 17:47:08', '2021-01-28 11:41:35'),
(93, 'Rusty', 'Oxberry', 'roxberry2k@umich.edu', '3UzCSiZ18aJH', 'Senior Financial Ana', 'https://robohash.org/esterrorquos.jpg?size=50x50&set=set1', 'Male', '762-471-5131', '2021-01-12 22:07:16', '2020-07-02 13:04:29'),
(94, 'Jojo', 'Rudgard', 'jrudgard2l@indiatimes.com', 'kxmEfqAdNTa', 'Sales Representative', 'https://robohash.org/blanditiisaliquamperspiciatis.png?size=50x50&set=set1', 'Male', '622-500-1295', '2021-01-29 11:57:56', '2020-09-11 10:14:55'),
(95, 'Thomasina', 'Millican', 'tmillican2m@people.com.cn', 'BQwced', 'Community Outreach S', 'https://robohash.org/quosutinventore.png?size=50x50&set=set1', 'Female', '719-100-7293', '2021-01-29 12:20:01', '2020-09-12 12:09:59'),
(96, 'Alyosha', 'Mordon', 'amordon2n@domainmarket.com', 'CSj0g4mKcO8', 'Civil Engineer', 'https://robohash.org/consequaturminusvoluptatem.png?size=50x50&set=set1', 'Female', '432-614-5178', '2020-12-02 17:55:29', '2020-12-11 07:31:15'),
(97, 'Ginger', 'Van Rembrandt', 'gvanrembrandt2o@t-online.de', 'H34bFJMTNb', 'Media Manager II', 'https://robohash.org/etveldoloribus.jpg?size=50x50&set=set1', 'Male', '158-771-3036', '2021-02-03 13:33:18', '2020-11-18 02:26:58'),
(98, 'Garland', 'Pranger', 'gpranger2p@typepad.com', 'iPaLnPuKt', 'Legal Assistant', 'https://robohash.org/isteeteum.png?size=50x50&set=set1', 'Male', '717-337-3897', '2020-03-22 18:16:37', '2021-02-20 17:58:59'),
(99, 'Abie', 'Bridges', 'abridges2q@cornell.edu', 'EFsDLe', 'Senior Sales Associa', 'https://robohash.org/sintquibeatae.jpg?size=50x50&set=set1', 'Female', '272-424-6630', '2020-05-08 12:38:51', '2020-04-28 08:59:54'),
(100, 'Ava', 'Ticksall', 'aticksall2r@acquirethisname.com', 'ZK55ZCR', 'Geologist IV', 'https://robohash.org/doloresquimaiores.bmp?size=50x50&set=set1', 'Female', '476-944-0195', '2021-01-27 17:16:31', '2020-10-05 07:52:44');

-- --------------------------------------------------------

--
-- Table structure for table `chatroom`
--

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

--
-- Dumping data for table `chatroom`
--

INSERT INTO `chatroom` (`id`, `message`, `from`, `to`, `read`, `mute_noti`, `create_at`, `create_by`) VALUES
(401, 401, 1, 2, 0, 0, '2021-04-08 15:49:59', 1);

-- --------------------------------------------------------

--
-- Table structure for table `chat_list`
--

CREATE TABLE `chat_list` (
  `id` int(10) NOT NULL,
  `account` int(10) NOT NULL,
  `chat` int(10) NOT NULL,
  `classchat` int(10) NOT NULL,
  `favorite` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chat_list`
--

INSERT INTO `chat_list` (`id`, `account`, `chat`, `classchat`, `favorite`) VALUES
(1, 1, 401, 401, 1);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

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

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `class_code`, `class_name`, `class_desc`, `class_pic`, `section`, `join_code`, `classchat`, `material`, `post`, `mute_noti`, `favorite`, `create_at`, `create_by`, `update_at`, `update_by`) VALUES
(100, 'CPE100', 'Basic Computer Programming', NULL, NULL, '1', 'CPE100', NULL, NULL, NULL, 0, 0, '2021-04-10 14:27:30', 1, NULL, NULL),
(401, 'CPE401', 'Senior Project', NULL, NULL, 'AB', '0', NULL, NULL, NULL, 0, 0, '2021-04-10 14:25:32', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `classchat`
--

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

--
-- Dumping data for table `classchat`
--

INSERT INTO `classchat` (`id`, `message`, `class`, `to`, `read`, `mute_noti`, `create_at`, `create_by`) VALUES
(1, 1, 401, 2, 0, 0, '2021-04-10 14:28:26', 1),
(2, 6, 100, 1, 0, 0, '2021-04-10 14:29:18', 2);

-- --------------------------------------------------------

--
-- Table structure for table `class_log`
--

CREATE TABLE `class_log` (
  `id` int(10) NOT NULL,
  `class` int(10) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `create_by` int(10) NOT NULL,
  `update_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class_log`
--

INSERT INTO `class_log` (`id`, `class`, `type`, `create_at`, `create_by`, `update_at`, `update_by`) VALUES
(1, 401, 1, '2021-04-08 17:44:27', 1, '2021-04-08 17:44:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `class_member`
--

CREATE TABLE `class_member` (
  `id` int(10) NOT NULL,
  `account` int(10) NOT NULL,
  `class` int(10) NOT NULL,
  `role_member` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class_member`
--

INSERT INTO `class_member` (`id`, `account`, `class`, `role_member`) VALUES
(401, 1, 401, 'student'),
(402, 2, 401, 'teacher');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(10) NOT NULL,
  `pic_url` text DEFAULT NULL,
  `text` text NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `create_by` int(10) NOT NULL,
  `update_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `pic_url`, `text`, `create_at`, `create_by`, `update_at`, `update_by`) VALUES
(1, NULL, 'Hello', '2021-04-02 16:27:22', 1, '2021-04-02 16:27:22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `id` int(10) NOT NULL,
  `topic_name` int(10) NOT NULL,
  `material_url` text NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `create_by` int(10) NOT NULL,
  `update_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`id`, `topic_name`, `material_url`, `create_at`, `create_by`, `update_at`, `update_by`) VALUES
(401, 401, 'This is my first material.', '2021-04-06 16:31:11', 1, '2021-04-06 16:31:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `material_topic`
--

CREATE TABLE `material_topic` (
  `id` int(10) NOT NULL,
  `title` varchar(250) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `create_by` int(10) NOT NULL,
  `update_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `material_topic`
--

INSERT INTO `material_topic` (`id`, `title`, `create_at`, `create_by`, `update_at`, `update_by`) VALUES
(401, 'Senior post', '2021-04-06 16:28:07', 1, '2021-04-06 16:28:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(10) NOT NULL,
  `type` int(2) NOT NULL,
  `content` text NOT NULL,
  `pic_url` text DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `create_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `type`, `content`, `pic_url`, `create_at`, `create_by`) VALUES
(1, 2, 'cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel', 'http://dummyimage.com/124x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 1),
(2, 2, 'nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl', 'http://dummyimage.com/222x100.png/dddddd/000000', '0000-00-00 00:00:00', 2),
(3, 1, 'non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus', 'http://dummyimage.com/246x100.png/dddddd/000000', '0000-00-00 00:00:00', 3),
(4, 1, 'mauris vulputate elementum nullam varius nulla facilisi cras non velit nec', 'http://dummyimage.com/128x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 4),
(5, 2, 'sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie', 'http://dummyimage.com/202x100.png/dddddd/000000', '0000-00-00 00:00:00', 5),
(6, 1, 'erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec', 'http://dummyimage.com/132x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 6),
(7, 1, 'aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce', 'http://dummyimage.com/182x100.png/5fa2dd/ffffff', '0000-00-00 00:00:00', 7),
(8, 2, 'a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa', 'http://dummyimage.com/221x100.png/5fa2dd/ffffff', '0000-00-00 00:00:00', 8),
(9, 2, 'elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis', 'http://dummyimage.com/167x100.png/5fa2dd/ffffff', '0000-00-00 00:00:00', 9),
(10, 2, 'sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac', 'http://dummyimage.com/154x100.png/5fa2dd/ffffff', '0000-00-00 00:00:00', 10),
(11, 2, 'tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non', 'http://dummyimage.com/117x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 11),
(12, 2, 'vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis', 'http://dummyimage.com/199x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 12),
(13, 2, 'duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla', 'http://dummyimage.com/154x100.png/5fa2dd/ffffff', '0000-00-00 00:00:00', 13),
(14, 2, 'venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend', 'http://dummyimage.com/155x100.png/dddddd/000000', '0000-00-00 00:00:00', 14),
(15, 2, 'phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi', 'http://dummyimage.com/196x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 15),
(16, 1, 'sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero', 'http://dummyimage.com/219x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 16),
(17, 2, 'libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque', 'http://dummyimage.com/167x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 17),
(18, 1, 'ac leo pellentesque ultrices mattis odio donec vitae nisi nam', 'http://dummyimage.com/247x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 18),
(19, 1, 'sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed', 'http://dummyimage.com/153x100.png/5fa2dd/ffffff', '0000-00-00 00:00:00', 19),
(20, 2, 'ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac', 'http://dummyimage.com/136x100.png/dddddd/000000', '0000-00-00 00:00:00', 20),
(21, 2, 'volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper', 'http://dummyimage.com/122x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 21),
(22, 1, 'cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit', 'http://dummyimage.com/157x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 22),
(23, 1, 'turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis', 'http://dummyimage.com/133x100.png/dddddd/000000', '0000-00-00 00:00:00', 23),
(24, 1, 'in sagittis dui vel nisl duis ac nibh fusce lacus', 'http://dummyimage.com/220x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 24),
(25, 2, 'vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin', 'http://dummyimage.com/231x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 25),
(26, 2, 'duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla', 'http://dummyimage.com/172x100.png/5fa2dd/ffffff', '0000-00-00 00:00:00', 26),
(27, 2, 'rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam', 'http://dummyimage.com/130x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 27),
(28, 1, 'magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc', 'http://dummyimage.com/234x100.png/dddddd/000000', '0000-00-00 00:00:00', 28),
(29, 2, 'venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in', 'http://dummyimage.com/203x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 29),
(30, 2, 'quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum', 'http://dummyimage.com/215x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 30),
(31, 2, 'nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean', 'http://dummyimage.com/211x100.png/dddddd/000000', '0000-00-00 00:00:00', 31),
(32, 2, 'quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi', 'http://dummyimage.com/159x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 32),
(33, 1, 'nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac', 'http://dummyimage.com/177x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 33),
(34, 1, 'convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam', 'http://dummyimage.com/117x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 34),
(35, 2, 'augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede', 'http://dummyimage.com/150x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 35),
(36, 2, 'tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus', 'http://dummyimage.com/190x100.png/5fa2dd/ffffff', '0000-00-00 00:00:00', 36),
(37, 1, 'massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst', 'http://dummyimage.com/125x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 37),
(38, 2, 'quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat', 'http://dummyimage.com/100x100.png/dddddd/000000', '0000-00-00 00:00:00', 38),
(39, 2, 'rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque', 'http://dummyimage.com/201x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 39),
(40, 1, 'imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna', 'http://dummyimage.com/218x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 40),
(41, 1, 'sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam', 'http://dummyimage.com/193x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 41),
(42, 2, 'pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus', 'http://dummyimage.com/227x100.png/5fa2dd/ffffff', '0000-00-00 00:00:00', 42),
(43, 1, 'vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum', 'http://dummyimage.com/150x100.png/dddddd/000000', '0000-00-00 00:00:00', 43),
(44, 1, 'magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet', 'http://dummyimage.com/226x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 44),
(45, 2, 'diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus', 'http://dummyimage.com/140x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 45),
(46, 2, 'justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget', 'http://dummyimage.com/116x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 46),
(47, 1, 'vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue', 'http://dummyimage.com/104x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 47),
(48, 1, 'leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac', 'http://dummyimage.com/114x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 48),
(49, 2, 'id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate', 'http://dummyimage.com/103x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 49),
(50, 1, 'nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit', 'http://dummyimage.com/177x100.png/5fa2dd/ffffff', '0000-00-00 00:00:00', 50),
(51, 1, 'vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin', 'http://dummyimage.com/104x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 51),
(52, 1, 'eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec', 'http://dummyimage.com/135x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 52),
(53, 2, 'quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras', 'http://dummyimage.com/221x100.png/dddddd/000000', '0000-00-00 00:00:00', 53),
(54, 1, 'porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam', 'http://dummyimage.com/193x100.png/5fa2dd/ffffff', '0000-00-00 00:00:00', 54),
(55, 2, 'iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis', 'http://dummyimage.com/147x100.png/5fa2dd/ffffff', '0000-00-00 00:00:00', 55),
(56, 2, 'elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat', 'http://dummyimage.com/110x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 56),
(57, 2, 'eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id', 'http://dummyimage.com/198x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 57),
(58, 1, 'ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam', 'http://dummyimage.com/148x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 58),
(59, 1, 'risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero', 'http://dummyimage.com/163x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 59),
(60, 1, 'est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis', 'http://dummyimage.com/250x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 60),
(61, 1, 'lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc', 'http://dummyimage.com/131x100.png/5fa2dd/ffffff', '0000-00-00 00:00:00', 61),
(62, 2, 'phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin', 'http://dummyimage.com/146x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 62),
(63, 1, 'ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus', 'http://dummyimage.com/247x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 63),
(64, 1, 'sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras', 'http://dummyimage.com/106x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 64),
(65, 2, 'id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie', 'http://dummyimage.com/222x100.png/dddddd/000000', '0000-00-00 00:00:00', 65),
(66, 1, 'posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam', 'http://dummyimage.com/178x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 66),
(67, 2, 'nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor', 'http://dummyimage.com/130x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 67),
(68, 1, 'platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque', 'http://dummyimage.com/212x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 68),
(69, 1, 'cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie', 'http://dummyimage.com/170x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 69),
(70, 1, 'dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat', 'http://dummyimage.com/151x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 70),
(71, 2, 'erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor', 'http://dummyimage.com/161x100.png/5fa2dd/ffffff', '0000-00-00 00:00:00', 71),
(72, 2, 'in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum', 'http://dummyimage.com/164x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 72),
(73, 2, 'justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum', 'http://dummyimage.com/209x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 73),
(74, 1, 'lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend', 'http://dummyimage.com/123x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 74),
(75, 1, 'felis sed interdum venenatis turpis enim blandit mi in porttitor pede', 'http://dummyimage.com/110x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 75),
(76, 2, 'id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi', 'http://dummyimage.com/118x100.png/dddddd/000000', '0000-00-00 00:00:00', 76),
(77, 1, 'integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu', 'http://dummyimage.com/111x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 77),
(78, 1, 'nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id', 'http://dummyimage.com/112x100.png/dddddd/000000', '0000-00-00 00:00:00', 78),
(79, 2, 'nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a', 'http://dummyimage.com/195x100.png/dddddd/000000', '0000-00-00 00:00:00', 79),
(80, 2, 'venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl', 'http://dummyimage.com/244x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 80),
(81, 2, 'ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris', 'http://dummyimage.com/146x100.png/5fa2dd/ffffff', '0000-00-00 00:00:00', 81),
(82, 1, 'aliquam non mauris morbi non lectus aliquam sit amet diam in', 'http://dummyimage.com/124x100.png/5fa2dd/ffffff', '0000-00-00 00:00:00', 82),
(83, 2, 'vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in', 'http://dummyimage.com/161x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 83),
(84, 1, 'hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo', 'http://dummyimage.com/186x100.png/5fa2dd/ffffff', '0000-00-00 00:00:00', 84),
(85, 2, 'mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit', 'http://dummyimage.com/103x100.png/dddddd/000000', '0000-00-00 00:00:00', 85),
(86, 2, 'posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede', 'http://dummyimage.com/183x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 86),
(87, 1, 'hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', 'http://dummyimage.com/149x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 87),
(88, 1, 'odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc', 'http://dummyimage.com/166x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 88),
(89, 1, 'eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla', 'http://dummyimage.com/224x100.png/dddddd/000000', '0000-00-00 00:00:00', 89),
(90, 1, 'praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices', 'http://dummyimage.com/141x100.png/dddddd/000000', '0000-00-00 00:00:00', 90),
(91, 2, 'hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed', 'http://dummyimage.com/149x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 91),
(92, 1, 'luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor', 'http://dummyimage.com/132x100.png/dddddd/000000', '0000-00-00 00:00:00', 92),
(93, 2, 'non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue', 'http://dummyimage.com/162x100.png/cc0000/ffffff', '0000-00-00 00:00:00', 93),
(94, 1, 'morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque', 'http://dummyimage.com/213x100.png/5fa2dd/ffffff', '0000-00-00 00:00:00', 94),
(95, 1, 'felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac', 'http://dummyimage.com/245x100.png/5fa2dd/ffffff', '0000-00-00 00:00:00', 95),
(96, 1, 'vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus', 'http://dummyimage.com/195x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 96),
(97, 1, 'rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed', 'http://dummyimage.com/142x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 97),
(98, 2, 'neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean', 'http://dummyimage.com/108x100.png/5fa2dd/ffffff', '0000-00-00 00:00:00', 98),
(99, 2, 'dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor', 'http://dummyimage.com/140x100.png/ff4444/ffffff', '0000-00-00 00:00:00', 99),
(100, 2, 'sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris', 'http://dummyimage.com/129x100.png/dddddd/000000', '0000-00-00 00:00:00', 100),
(401, 1, 'Hello', 'https://picsum.photos/200', '2021-04-06 16:24:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

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

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `class_log`, `read`, `delete`, `create_at`, `create_by`, `update_at`, `update_by`) VALUES
(401, 1, 0, 0, '2021-04-08 17:46:11', 1, '2021-04-08 17:46:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_temp`
--

CREATE TABLE `password_reset_temp` (
  `email` varchar(250) NOT NULL,
  `key` varchar(250) NOT NULL,
  `expDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `poll`
--

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

--
-- Dumping data for table `poll`
--

INSERT INTO `poll` (`id`, `option`, `result`, `title`, `published`, `expired`, `content`, `create_at`, `create_by`, `update_at`, `update_by`) VALUES
(1, NULL, NULL, 'Vote here', 0, '2021-04-12 14:39:54', 'This is the first poll.', '2021-04-10 14:40:30', 1, '2021-04-10 14:40:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `poll_option`
--

CREATE TABLE `poll_option` (
  `id` int(10) NOT NULL,
  `poll` int(10) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `content` text DEFAULT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `poll_option`
--

INSERT INTO `poll_option` (`id`, `poll`, `active`, `content`, `create_at`) VALUES
(1, 1, 1, 'Test', '2021-04-10 14:40:36');

-- --------------------------------------------------------

--
-- Table structure for table `poll_result`
--

CREATE TABLE `poll_result` (
  `id` int(10) NOT NULL,
  `option` int(10) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `create_at` datetime DEFAULT current_timestamp(),
  `create_by` int(10) DEFAULT NULL,
  `update_at` datetime DEFAULT current_timestamp(),
  `update_by` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `poll_result`
--

INSERT INTO `poll_result` (`id`, `option`, `active`, `create_at`, `create_by`, `update_at`, `update_by`) VALUES
(1, 1, 1, '2021-04-10 14:42:22', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `poll_vote`
--

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

--
-- Dumping data for table `poll_vote`
--

INSERT INTO `poll_vote` (`id`, `poll`, `poll_option`, `account`, `content`, `create_at`, `create_by`, `update_at`, `update_by`) VALUES
(1, 1, 1, 1, NULL, '2021-04-10 14:42:50', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

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
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `class`, `poll`, `comment`, `announce`, `click_count`, `pic_url`, `detail`, `create_at`, `create_by`, `update_at`, `update_by`) VALUES
(401, 401, NULL, NULL, '0', 0, NULL, NULL, '2021-04-08 17:48:54', 1, '2021-04-08 17:48:54', 1);

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `chatroom`
--
ALTER TABLE `chatroom`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- AUTO_INCREMENT for table `chat_list`
--
ALTER TABLE `chat_list`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- AUTO_INCREMENT for table `classchat`
--
ALTER TABLE `classchat`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `class_log`
--
ALTER TABLE `class_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `class_member`
--
ALTER TABLE `class_member`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=403;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- AUTO_INCREMENT for table `material_topic`
--
ALTER TABLE `material_topic`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- AUTO_INCREMENT for table `poll`
--
ALTER TABLE `poll`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `poll_option`
--
ALTER TABLE `poll_option`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `poll_result`
--
ALTER TABLE `poll_result`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `poll_vote`
--
ALTER TABLE `poll_vote`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

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
