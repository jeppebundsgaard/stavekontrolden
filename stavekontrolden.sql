-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Vært: localhost:3306
-- Genereringstid: 21. 04 2020 kl. 12:09:17
-- Serverversion: 5.7.29-0ubuntu0.18.04.1
-- PHP-version: 7.2.29-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stavekontrolden`
--
CREATE DATABASE IF NOT EXISTS `stavekontrolden` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `stavekontrolden`;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `affixclass`
--

CREATE TABLE `affixclass` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int(10) UNSIGNED NOT NULL,
  `crossproduct` varchar(1) NOT NULL DEFAULT 'Y',
  `description` varchar(255) NOT NULL,
  `affixclass` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `affixrule`
--

CREATE TABLE `affixrule` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int(10) UNSIGNED NOT NULL,
  `affixclassid` int(10) UNSIGNED NOT NULL,
  `stripchars` varchar(25) DEFAULT '0',
  `affix` varchar(30) NOT NULL,
  `condition` varchar(30) NOT NULL,
  `replacement` varchar(255) NOT NULL DEFAULT '',
  `morphdescrid` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `affixrule_to_affixclass`
--

CREATE TABLE `affixrule_to_affixclass` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int(10) UNSIGNED NOT NULL,
  `affixruleid` int(10) UNSIGNED NOT NULL,
  `affixclassid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `fugeelement`
--

CREATE TABLE `fugeelement` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int(10) UNSIGNED NOT NULL,
  `fugeelement` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `fugeelement_to_affixclass`
--

CREATE TABLE `fugeelement_to_affixclass` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int(10) UNSIGNED NOT NULL,
  `fugeelementid` int(10) UNSIGNED NOT NULL,
  `affixclassid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `ip2location_db1`
--

CREATE TABLE `ip2location_db1` (
  `ip_from` int(10) UNSIGNED DEFAULT NULL,
  `ip_to` int(10) UNSIGNED DEFAULT NULL,
  `country_code` char(2) COLLATE utf8_bin DEFAULT NULL,
  `country_name` varchar(64) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `morphdescr`
--

CREATE TABLE `morphdescr` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int(10) UNSIGNED NOT NULL,
  `morphdescr` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `organizations`
--

CREATE TABLE `organizations` (
  `lang` enum('da_DK','en_US') NOT NULL,
  `org_id` int(10) UNSIGNED NOT NULL,
  `orgname` varchar(255) NOT NULL,
  `orgslogan` varchar(255) NOT NULL DEFAULT '',
  `orgurl` varchar(32) NOT NULL DEFAULT '',
  `settings` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `start_definitions`
--

CREATE TABLE `start_definitions` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int(10) UNSIGNED NOT NULL,
  `start_definitions` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `technical_term`
--

CREATE TABLE `technical_term` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int(10) UNSIGNED NOT NULL,
  `technical_term` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `unaccepted_word`
--

CREATE TABLE `unaccepted_word` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int(10) UNSIGNED NOT NULL,
  `unaccepted_word` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `org_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `permissions` set('baseuser','wordedit','affix','admin') NOT NULL DEFAULT 'baseuser',
  `lastchange` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `wordclass`
--

CREATE TABLE `wordclass` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int(10) UNSIGNED NOT NULL,
  `wordclass` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `wordclass_to_affixclass`
--

CREATE TABLE `wordclass_to_affixclass` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int(10) UNSIGNED NOT NULL,
  `wordclassid` int(10) UNSIGNED NOT NULL,
  `affixclassid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `words`
--

CREATE TABLE `words` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int(10) UNSIGNED NOT NULL,
  `word` varchar(255) NOT NULL,
  `wordclass` int(10) UNSIGNED NOT NULL,
  `wordstatus` int(11) NOT NULL DEFAULT '1',
  `alternatives` varchar(255) NOT NULL,
  `lastuser` varchar(255) NOT NULL,
  `contributor` varchar(255) NOT NULL,
  `word_definition` mediumtext NOT NULL,
  `comments` mediumtext NOT NULL,
  `technical_term` int(10) UNSIGNED NOT NULL,
  `fugeelementid` int(10) UNSIGNED NOT NULL,
  `strong_declension` varchar(500) NOT NULL,
  `omitsuggestion` tinyint(1) DEFAULT '0',
  `apostroph` tinyint(1) NOT NULL DEFAULT '0',
  `misspellings` varchar(255) NOT NULL,
  `log` mediumtext NOT NULL,
  `lastchange` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `wordstatus`
--

CREATE TABLE `wordstatus` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` smallint(6) NOT NULL,
  `wordstatus` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `affixclass`
--
ALTER TABLE `affixclass`
  ADD PRIMARY KEY (`lang`,`id`),
  ADD KEY `id` (`id`),
  ADD KEY `lang` (`lang`);

--
-- Indeks for tabel `affixrule`
--
ALTER TABLE `affixrule`
  ADD PRIMARY KEY (`lang`,`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `lang` (`lang`),
  ADD KEY `morphdescrid` (`morphdescrid`),
  ADD KEY `affixclassid` (`affixclassid`);

--
-- Indeks for tabel `affixrule_to_affixclass`
--
ALTER TABLE `affixrule_to_affixclass`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang` (`lang`),
  ADD KEY `affixrule_to_affixclass_ibfk_1` (`affixclassid`),
  ADD KEY `affixrule_to_affixclass_ibfk_2` (`affixruleid`);

--
-- Indeks for tabel `fugeelement`
--
ALTER TABLE `fugeelement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `lang` (`lang`);

--
-- Indeks for tabel `fugeelement_to_affixclass`
--
ALTER TABLE `fugeelement_to_affixclass`
  ADD PRIMARY KEY (`id`,`lang`) USING BTREE,
  ADD KEY `word_class` (`fugeelementid`),
  ADD KEY `lang` (`lang`),
  ADD KEY `wordclass_to_affixclass_ibfk_1` (`affixclassid`);

--
-- Indeks for tabel `ip2location_db1`
--
ALTER TABLE `ip2location_db1`
  ADD KEY `idx_ip_from` (`ip_from`),
  ADD KEY `idx_ip_to` (`ip_to`),
  ADD KEY `idx_ip_from_to` (`ip_from`,`ip_to`);

--
-- Indeks for tabel `morphdescr`
--
ALTER TABLE `morphdescr`
  ADD PRIMARY KEY (`lang`,`id`),
  ADD KEY `lang` (`lang`),
  ADD KEY `id` (`id`);

--
-- Indeks for tabel `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`org_id`),
  ADD UNIQUE KEY `orgurl` (`orgurl`),
  ADD UNIQUE KEY `lang` (`lang`);

--
-- Indeks for tabel `start_definitions`
--
ALTER TABLE `start_definitions`
  ADD PRIMARY KEY (`lang`,`id`),
  ADD KEY `lang` (`lang`),
  ADD KEY `id` (`id`);

--
-- Indeks for tabel `technical_term`
--
ALTER TABLE `technical_term`
  ADD PRIMARY KEY (`lang`,`id`),
  ADD KEY `id` (`id`),
  ADD KEY `lang` (`lang`);

--
-- Indeks for tabel `unaccepted_word`
--
ALTER TABLE `unaccepted_word`
  ADD PRIMARY KEY (`lang`,`id`),
  ADD KEY `id` (`id`),
  ADD KEY `lang` (`lang`);

--
-- Indeks for tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks for tabel `wordclass`
--
ALTER TABLE `wordclass`
  ADD PRIMARY KEY (`id`,`lang`) USING BTREE,
  ADD KEY `lang` (`lang`);

--
-- Indeks for tabel `wordclass_to_affixclass`
--
ALTER TABLE `wordclass_to_affixclass`
  ADD PRIMARY KEY (`id`,`lang`) USING BTREE,
  ADD KEY `word_class` (`wordclassid`),
  ADD KEY `lang` (`lang`),
  ADD KEY `wordclass_to_affixclass_ibfk_1` (`affixclassid`);

--
-- Indeks for tabel `words`
--
ALTER TABLE `words`
  ADD PRIMARY KEY (`id`,`lang`) USING BTREE,
  ADD KEY `word` (`word`),
  ADD KEY `status` (`wordstatus`),
  ADD KEY `lastuser` (`lastuser`),
  ADD KEY `contributor` (`contributor`),
  ADD KEY `wordclass` (`wordclass`) USING BTREE,
  ADD KEY `lang` (`lang`);

--
--
-- Indeks for tabel `wordstatus`
--
ALTER TABLE `wordstatus`
  ADD PRIMARY KEY (`lang`,`id`),
  ADD KEY `lang` (`lang`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `affixclass`
--
ALTER TABLE `affixclass`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- Tilføj AUTO_INCREMENT i tabel `affixrule`
--
ALTER TABLE `affixrule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- Tilføj AUTO_INCREMENT i tabel `affixrule_to_affixclass`
--
ALTER TABLE `affixrule_to_affixclass`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- Tilføj AUTO_INCREMENT i tabel `fugeelement`
--
ALTER TABLE `fugeelement`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- Tilføj AUTO_INCREMENT i tabel `fugeelement_to_affixclass`
--
ALTER TABLE `fugeelement_to_affixclass`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- Tilføj AUTO_INCREMENT i tabel `morphdescr`
--
ALTER TABLE `morphdescr`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- Tilføj AUTO_INCREMENT i tabel `organizations`
--
ALTER TABLE `organizations`
  MODIFY `org_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- Tilføj AUTO_INCREMENT i tabel `start_definitions`
--
ALTER TABLE `start_definitions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- Tilføj AUTO_INCREMENT i tabel `technical_term`
--
ALTER TABLE `technical_term`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- Tilføj AUTO_INCREMENT i tabel `unaccepted_word`
--
ALTER TABLE `unaccepted_word`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- Tilføj AUTO_INCREMENT i tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- Tilføj AUTO_INCREMENT i tabel `wordclass`
--
ALTER TABLE `wordclass`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- Tilføj AUTO_INCREMENT i tabel `wordclass_to_affixclass`
--
ALTER TABLE `wordclass_to_affixclass`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- Tilføj AUTO_INCREMENT i tabel `words`
--
ALTER TABLE `words`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `affixrule`
--
ALTER TABLE `affixrule`
  ADD CONSTRAINT `affixrule_ibfk_1` FOREIGN KEY (`morphdescrid`) REFERENCES `morphdescr` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `affixrule_ibfk_2` FOREIGN KEY (`affixclassid`) REFERENCES `affixclass` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrænsninger for tabel `affixrule_to_affixclass`
--
ALTER TABLE `affixrule_to_affixclass`
  ADD CONSTRAINT `affixrule_to_affixclass_ibfk_1` FOREIGN KEY (`affixclassid`) REFERENCES `affixclass` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `affixrule_to_affixclass_ibfk_2` FOREIGN KEY (`affixruleid`) REFERENCES `affixrule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrænsninger for tabel `fugeelement_to_affixclass`
--
ALTER TABLE `fugeelement_to_affixclass`
  ADD CONSTRAINT `fugeelement_to_affixclass_ibfk_1` FOREIGN KEY (`affixclassid`) REFERENCES `affixclass` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fugeelement_to_affixclass_ibfk_2` FOREIGN KEY (`fugeelementid`) REFERENCES `fugeelement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrænsninger for tabel `wordclass_to_affixclass`
--
ALTER TABLE `wordclass_to_affixclass`
  ADD CONSTRAINT `wordclass_to_affixclass_ibfk_1` FOREIGN KEY (`affixclassid`) REFERENCES `affixclass` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wordclass_to_affixclass_ibfk_2` FOREIGN KEY (`wordclassid`) REFERENCES `wordclass` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrænsninger for tabel `words`
--
ALTER TABLE `words`
  ADD CONSTRAINT `words_ibfk_1` FOREIGN KEY (`wordclass`) REFERENCES `wordclass` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
