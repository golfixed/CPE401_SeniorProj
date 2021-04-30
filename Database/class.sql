DROP TABLE IF EXISTS `class`;

CREATE TABLE IF NOT EXISTS `class` (
`id` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`class_code` varchar(100) NOT NULL,
`class_name` varchar(100) NOT NULL,
`class_desc` text,
`class_pic` text,
`section` varchar(10) NOT NULL,
`class_chat` int(10) NOT NULL,
`material` int(10) NOT NULL,
`post` int(10) NOT NULL,
`mute_noti` boolean NOT NULL,
`favorite` boolean NOT NULL,
`create_at` DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
`create_by` int(10) NOT NULL,
`update_at` DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
`update_by` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `class` 
    ADD FOREIGN KEY (`class_chat`) REFERENCES `classchat`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    ADD FOREIGN KEY (`material`) REFERENCES `material`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    ADD FOREIGN KEY (`post`) REFERENCES `post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    ADD FOREIGN KEY (`create_by`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    ADD FOREIGN KEY (`update_by`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;