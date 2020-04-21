CREATE TABLE `organizations` (
  `org_id` int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `orgname` varchar(255) NOT NULL,
  `orgslogan` varchar(255) NOT NULL DEFAULT '',
  `orgurl` varchar(32) NOT NULL DEFAULT '' UNIQUE,
  `settings` json NOT NULL
);
INSERT INTO `organizations` (`org_id`, `orgname`, `orgslogan`, `orgurl`, `settings`) VALUES ('1', 'Main Orgainzation', 'Site administration', 'admin', '{}'); 

CREATE TABLE `users` (
  `user_id` int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `username` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255)  NOT NULL UNIQUE,
  `password` varchar(255)  NOT NULL,
  `org_id` int UNSIGNED NOT NULL DEFAULT '0',
  `permissions` SET('baseuser','admin') NOT NULL DEFAULT 'baseuser',
  `lastchange` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `org_id`, `permissions`, `lastchange`) VALUES ('1', 'admin', 'admin@admin.com', '21232f297a57a5a743894a0e4a801fc3', '1', 'admin', '0000-00-00 00:00:00.000000');
-- User admin@admin.com, Password: admin
