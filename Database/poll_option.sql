DROP TABLE IF EXISTS `poll_option`;

CREATE TABLE `poll_option` (
`id` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`voted_count` int(10) NOT NULL,
`description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;