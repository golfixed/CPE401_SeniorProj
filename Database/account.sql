-- Delete Table If Exists
DROP TABLE IF EXISTS `account`;

CREATE TABLE IF NOT EXISTS `account` (
  `id` int(10) NOT NULL auto_increment PRIMARY KEY,
  `username` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `gender` varchar(10),
  `phone` int(10),
  `create_at` DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `update_at` DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

-- Insert users data
-- INSERT INTO users (
	-- username,
	-- email,
	-- password,
	-- role,
-- ) VALUES (
-- );
-- 
-- password = Haha.555



