-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Vært: localhost
-- Genereringstid: 21. 07 2025 kl. 07:46:04
-- Serverversion: 8.0.42-0ubuntu0.24.04.1
-- PHP-version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stavekontrolden`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `affixclass`
--

CREATE TABLE `affixclass` (
  `lang` enum('da_DK') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `crossproduct` varchar(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y',
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `affixclass` varchar(30) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Data dump for tabellen `affixclass`
--

INSERT INTO `affixclass` (`lang`, `id`, `crossproduct`, `description`, `affixclass`) VALUES
('da_DK', 1, 'Y', 'Verbum, svagt bøjet, -ede i datid', 'SFX'),
('da_DK', 2, 'Y', 'Substantiv, fælleskøn', 'SFX'),
('da_DK', 3, 'Y', 'Substantiv, konsonantfordobling, intetkøn, -er i flertal', 'SFX'),
('da_DK', 4, 'Y', 'Substantiv, intetkøn', 'SFX'),
('da_DK', 5, 'Y', 'Substantiv, flertal, med -e', 'SFX'),
('da_DK', 6, 'Y', 'Ulovligt ord', 'FORBIDDENWORD'),
('da_DK', 7, 'Y', 'Substantiv, konsonantfordobling, fælleskøn, -er i flertal', 'SFX'),
('da_DK', 8, 'Y', 'NeedAffix', 'NEEDAFFIX'),
('da_DK', 9, 'Y', 'Proprium', 'SFX'),
('da_DK', 10, 'Y', 'Genitiv', 'SFX'),
('da_DK', 11, 'Y', 'Substantiv, flertal, med -er', 'SFX'),
('da_DK', 12, 'Y', 'Adjektiv, ender på -en, bøjes med -ne', 'SFX'),
('da_DK', 13, 'Y', 'Substantiv, flertal, med -re, stamme -er fjernes', 'SFX'),
('da_DK', 14, 'Y', 'Substantiv, bekendt form fælleskøn med -eren', 'SFX'),
('da_DK', 15, 'Y', 'Substantiv, bekendt form intetkøn med -ret eller -eret', 'SFX'),
('da_DK', 18, 'Y', 'Substantiv, konsonantfordobling, intetkøn, -e i flertal', 'SFX'),
('da_DK', 19, 'Y', 'Substantiv, konsonantfordobling, fælleskøn, -e i flertal', 'SFX'),
('da_DK', 20, 'Y', 'Verbum, svagt bøjet, -te i datid', 'SFX'),
('da_DK', 21, 'Y', 'Verbum, svagt bøjet', 'SFX'),
('da_DK', 22, 'Y', 'Verbum, passiv', 'SFX'),
('da_DK', 23, 'Y', 'Adjektiv, svagt bøjet, komparation -st', 'SFX'),
('da_DK', 24, 'Y', 'Adjektiv, svagt bøjet uden komparation, ikke -e efter aeouæøå', 'SFX'),
('da_DK', 25, 'Y', 'Adjektiv, d erstatter t med komparation', 'SFX'),
('da_DK', 26, 'Y', 'Adjektiv, d erstatter t uden komparation', 'SFX'),
('da_DK', 27, 'Y', 'Adjektiv, ender på -ende', 'SFX'),
('da_DK', 28, 'Y', 'Adjektiv, ender på -sk', 'SFX'),
('da_DK', 29, 'Y', 'Sammensætning, fugeelement s', 'SFX'),
('da_DK', 30, 'Y', 'Sammensætning, fugeelement e', 'SFX'),
('da_DK', 31, 'Y', 'Sammensætning, fugeelement Ø', 'SFX'),
('da_DK', 32, 'Y', 'Sammensætning, start', 'COMPOUNDBEGIN'),
('da_DK', 33, 'Y', 'Sammensætning, midte', 'COMPOUNDMIDDLE'),
('da_DK', 34, 'Y', 'Sammensætning, slut', 'COMPOUNDEND'),
('da_DK', 35, 'Y', 'Sammensætning, tillad affix inde i sammensætning', 'COMPOUNDPERMITFLAG'),
('da_DK', 36, 'Y', 'Sammensætning, kun i sammensætninger', 'ONLYINCOMPOUND'),
('da_DK', 37, 'Y', 'Sammensætning, bindestreg', 'PFX'),
('da_DK', 38, 'Y', 'Adjektiv, svagt bøjet, komparation -est', 'SFX'),
('da_DK', 39, 'Y', 'Sammensætning, ord sidst i sammensætning', 'SFX'),
('da_DK', 40, 'Y', 'Adjektiv, dobbeltkonsonant (mm), -st', 'SFX'),
('da_DK', 41, 'Y', 'Adjektiv, ender på -er, bøjes med -re', 'SFX'),
('da_DK', 42, 'Y', 'Adjektiv, dobbeltkonsonant, -est', 'SFX'),
('da_DK', 43, 'Y', 'Substantiv, ender på -en, flertal -ner (stamme -en fjernes)', 'SFX'),
('da_DK', 44, 'Y', 'Substantiv, torso, fælleskøn', 'SFX'),
('da_DK', 45, 'Y', 'Substantiv, torso, intetkøn', 'SFX'),
('da_DK', 46, 'Y', 'Substantiv, flertal, med Ø', 'SFX'),
('da_DK', 47, 'Y', 'Substantiv, konsonantfordobling, intetkøn, -Ø i flertal', 'SFX'),
('da_DK', 48, 'Y', 'Substantiv, konsonantfordobling, fælleskøn, -Ø i flertal', 'SFX'),
('da_DK', 49, 'Y', 'Adjektiv, svagt bøjet, intetkøn, ikke efter -t eller aeouæø', 'SFX'),
('da_DK', 50, 'Y', 'Apostrof, fælleskøn', 'SFX'),
('da_DK', 51, 'Y', 'Apostrof, intetkøn', 'SFX'),
('da_DK', 52, 'Y', 'Apostrof NeedAffix', 'SFX'),
('da_DK', 53, 'Y', 'Sammensætning, fugeelement -', 'SFX'),
('da_DK', 54, 'Y', 'Proprium med mulighed for retning som præfiks', 'PFX'),
('da_DK', 55, 'Y', 'Sammensætning, fugeelement fjern e', 'SFX'),
('da_DK', 56, 'Y', 'Sammensætning, fugeelement fjern e tilføj s', 'SFX'),
('da_DK', 57, 'Y', 'Substantiv, konsonantfordobling, intetkøn, torso', 'SFX'),
('da_DK', 58, 'Y', 'Substantiv, konsonantfordobling, fælleskøn, torso', 'SFX'),
('da_DK', 59, 'Y', 'Adjektiv, svagt bøjet uden komparation, dobbeltkonsonant', 'SFX'),
('da_DK', 60, 'Y', 'Sammensætning, fugeelement er', 'SFX'),
('da_DK', 61, 'Y', 'Sammensætning, fugeelement kons.f.+e', 'SFX'),
('da_DK', 64, 'Y', 'Substantiv, ender på el, -ler i flertal', 'SFX'),
('da_DK', 65, 'Y', 'Substantiv, fælleskøn, ender på el, bekendt form ental, -el erstattes med -len', 'SFX'),
('da_DK', 66, 'Y', 'Substantiv, intetkøn, ender på el, bestemt form ental,  -el erstattes med -let', 'SFX'),
('da_DK', 68, 'Y', 'Sammensætning, fugeelement kons.f.+er', 'SFX'),
('da_DK', 69, 'Y', 'Sammensætning, fugeelement fjern um  tilføj e', 'SFX'),
('da_DK', 70, 'Y', 'Substantiv, intetkøn, ender på um, bestemt form ental, -um erstattes med -et', 'SFX'),
('da_DK', 71, 'Y', 'Substantiv, ender på um, flertal, -um erstattes med -er', 'SFX'),
('da_DK', 72, 'Y', 'Substantiv, ender på um, -um erstattes med -e i ental', 'SFX'),
('da_DK', 74, 'Y', 'Substantiv, kun flertal, bestemt form -ne (efter -e og -r) eller -ene (øvrige)', 'SFX'),
('da_DK', 75, 'Y', 'Apostrof før endelse, fælleskøn, torso', 'SFX'),
('da_DK', 76, 'Y', 'Substantiv med apostrof før endelse, intetkøn, torso', 'SFX'),
('da_DK', 77, 'Y', 'Adjektiv, -el og evt. dobbeltkonsonant erstattes med -le', 'SFX'),
('da_DK', 78, 'Y', 'Adjektiv, -el og evt. dobbeltkonsonant erstattes med -lere og -lest', 'SFX'),
('da_DK', 79, 'Y', 'Verbalsubstantiv', 'SFX'),
('da_DK', 81, 'Y', 'Præfiks uden bindestreg', 'SFX'),
('da_DK', 82, 'Y', 'Adjektiv, ender på -en, intetkøn -et', 'SFX'),
('da_DK', 83, 'Y', 'Sammensætning, fugeelement punktum', 'SFX'),
('da_DK', 84, 'Y', 'Substantiv, intetkøn, ender på -us, bestemt form ental, erstattes med -et', 'SFX'),
('da_DK', 85, 'Y', 'Substantiv, intetkøn, ender på -us, flertal, erstattes med -er og -erne', 'SFX'),
('da_DK', 86, 'Y', 'Foreslå ikke', 'NOSUGGEST'),
('da_DK', 87, 'Y', 'Substantiv, intetkøn, ender på -en, bestemt form -net (stamme -en fjernes)', 'SFX'),
('da_DK', 88, 'Y', 'Sammensætning, fugeelement t', 'SFX'),
('da_DK', 89, 'Y', 'Superlativ næst-', 'PFX'),
('da_DK', 90, 'Y', 'Superlativ aller-', 'PFX'),
('da_DK', 93, 'Y', 'Sammensætning, fugeelement fjern r', 'SFX'),
('da_DK', 95, 'Y', 'Sammensætning, fugeelement fjern er, tilføj re', 'SFX');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `affixrule`
--

CREATE TABLE `affixrule` (
  `lang` enum('da_DK') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `affixclassid` int UNSIGNED NOT NULL,
  `stripchars` varchar(25) COLLATE utf8mb4_general_ci DEFAULT '0',
  `affix` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `condition` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `replacement` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `morphdescrid` int UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Data dump for tabellen `affixrule`
--

INSERT INTO `affixrule` (`lang`, `id`, `affixclassid`, `stripchars`, `affix`, `condition`, `replacement`, `morphdescrid`, `description`) VALUES
('da_DK', 1, 3, '0', '#', '#', 'KONS', 9, 'Substantiv, konsonantfordobling, intetkøn, KONS'),
('da_DK', 7, 2, '0', 'ns', 'e', '', 1, 'Substantiv, bekendt form fælleskøn, ental efter e, genitiv'),
('da_DK', 17, 4, '0', 'et', '[^e]', '', 6, 'Substantiv, bekendt form intetkøn, ental'),
('da_DK', 19, 11, '0', 'r', 'e', '', 7, 'Substantiv, ubekendt form flertal, med r efter e'),
('da_DK', 20, 5, '0', 'es', '.', '', 1, 'Substantiv, ubekendt form flertal, med -e, genitiv'),
('da_DK', 21, 5, '0', 'ene', '[^r]', '', 8, 'Substantiv, bekendt form flertal, med -e'),
('da_DK', 22, 5, '0', 'e', '.', '', 7, 'Substantiv, ubekendt form flertal, med -e'),
('da_DK', 23, 4, '0', 't', 'e', '', 6, 'Substantiv, bekendt form ental, intetkøn efter e'),
('da_DK', 24, 11, '0', 'er', '[^e]', '', 7, 'Substantiv, ubekendt form flertal, med r'),
('da_DK', 25, 7, '0', '#', '#', 'KONS', 9, 'Substantiv, konsonantfordobling, KONS'),
('da_DK', 26, 2, '0', 'n', 'e', '', 6, 'Substantiv, bekendt form fælleskøn, ental, efter e'),
('da_DK', 30, 10, '0', 's', '[^sxz]', '', 1, 'Genitiv'),
('da_DK', 31, 11, '0', 'erne', '[^e]', '', 8, 'Substantiv, bekendt form flertal, med -er'),
('da_DK', 32, 11, '0', 'ernes', '[^e]', '', 1, 'Substantiv, bekendt form flertal, med -er, genitiv'),
('da_DK', 37, 11, '0', 'rne', 'e', '', 8, 'Substantiv, bekendt form flertal, med er efter e'),
('da_DK', 39, 5, '0', 'ne', 'er', '', 8, 'Substantiv, bekendt form flertal, med -e efter -er'),
('da_DK', 43, 12, 'en', 'ne', '[^#]#en', 'KONS', 0, 'Adjektiv, -en erstattes af ne, enkelt-KONS'),
('da_DK', 45, 2, '0', 'en', '[^e]', '', 6, 'Substantiv, bekendt form ental, fælleskøn'),
('da_DK', 48, 14, '0', 'en', '.', '', 6, 'Substantiv, bestemt form fælleskøn med -eren'),
('da_DK', 49, 15, '0', 'et', '.', '', 6, 'Substantiv, bestemt form intetkøn med -eret'),
('da_DK', 50, 15, 'er', 'ret', '[^fmtr]er', '', 6, 'Substantiv, bestemt form intetkøn med -ret'),
('da_DK', 51, 1, '0', 'de', 'e', '', 4, 'Verbum, svagt bøjet, -de i datid'),
('da_DK', 52, 21, '0', 'r', '.', '', 3, 'Verbum, svagt bøjet, -r'),
('da_DK', 53, 22, '0', 's', '[^s]', '', 2, 'Verbum, passiv'),
('da_DK', 54, 21, '0', 'nde', 'e', '', 5, 'Verbum, svagt bøjet, -nde'),
('da_DK', 55, 20, 'e', 'te', '[^#]#e', 'KONS', 4, 'Verbum, svagt bøjet, -te i datid, enkelt-KONS'),
('da_DK', 56, 20, 'e', 't', '[^#]#e', 'KONS', 10, 'Verbum, svagt bøjet, -t i perf.part., enkelt-KONS'),
('da_DK', 57, 21, '#e', '0', '##e', 'KONS', 11, 'Verbum, imperativ, dobbelt-KONS'),
('da_DK', 77, 21, 'e', '0', '[^#]#e', 'KONS', 11, 'Verbum, imperativ, enkelt-KONS'),
('da_DK', 114, 18, '0', '#', '#', 'KONS', 9, 'Substantiv, konsonantfordobling, intetkøn, KONS'),
('da_DK', 150, 19, '0', '#', '#', 'KONS', 9, 'Substantiv, konsonantfordobling, KONS'),
('da_DK', 182, 49, '0', 't', '[^taeouæø]', '', 6, 'Adjektiv, svagt bøjet, intetkøn, ikke efter -t eller aeouæø'),
('da_DK', 184, 23, '0', 'ere', '[^e]', '', 12, 'Adjektiv, svagt bøjet, komparativ'),
('da_DK', 185, 23, '0', 'st', '.', '', 13, 'Adjektiv, svagt bøjet, superlativ'),
('da_DK', 186, 23, '0', 'ste', '.', '', 14, 'Adjektiv, svagt bøjet, superlativ pluralis'),
('da_DK', 187, 24, '0', 'e', '[^aeouæøå]', '', 8, 'Adjektiv, svagt bøjet uden komparation, flertal, ender ikke på aeouæøå'),
('da_DK', 188, 27, '0', 's', '.', '', 1, 'Adjektiv, ender på -ende, genitiv'),
('da_DK', 189, 25, 't', 'de', '.', '', 8, 'Adjektiv, d erstatter t med komparation, pluralis'),
('da_DK', 190, 25, 't', 'dere', '.', '', 12, 'Adjektiv, d erstatter t med komparation, kompatativ'),
('da_DK', 191, 25, 't', 'dest', '.', '', 13, 'Adjektiv, d erstatter t med komparation, superlativ'),
('da_DK', 192, 25, 't', 'deste', '.', '', 14, 'Adjektiv, d erstatter t med komparation, superlativ pluralis'),
('da_DK', 193, 26, 't', 'de', '.', '', 8, 'Adjektiv, d erstatter t uden komparation, pluralis'),
('da_DK', 195, 28, '0', 'e', '.', '', 8, 'Adjektiv, ender på -sk, pluralis'),
('da_DK', 197, 9, '0', 's', '[^sxz]', '', 1, 'Proprium, genitiv'),
('da_DK', 198, 9, '0', '\'s', 's', '', 1, 'Proprium, genitiv efter s'),
('da_DK', 199, 37, '0', '-', '.', '', 15, 'Sammensætning, valgfri bindestreg i sammensætning'),
('da_DK', 200, 29, '0', 's', '.', '', 0, 'Sammensætning, fugeelement -s- i begyndelsen'),
('da_DK', 201, 29, '0', 's', '.', '', 0, 'Sammensætning, fugeelement -s- i midten'),
('da_DK', 203, 30, '0', 'e', '.', '', 0, 'Sammensætning, fugeelement e, i begyndelsen'),
('da_DK', 204, 30, '0', 'e', '.', '', 0, 'Sammensætning, fugeelement e i midten'),
('da_DK', 205, 41, 'er', 're', '[^#]#er', 'KONS', 0, 'Adjektiv, ender på -er, pluralis -re, enkelt-KONS'),
('da_DK', 206, 31, '0', '0', '.', '', 0, 'Sammensætning, fugeelement Ø - i begyndelsen'),
('da_DK', 207, 31, '0', '0', '.', '', 0, 'Sammensætning, fugeelement Ø - i midten'),
('da_DK', 208, 39, '0', '0', '.', '', 16, 'Sammensætning, ord sidst i sammensætning'),
('da_DK', 228, 41, 'er', 'res', '[^#]#er', 'KONS', 1, 'Adjektiv, ender på -er, pluralis genitiv -res, enkelt-KONS'),
('da_DK', 229, 41, 'er', 'rere', '[^#]#er', 'KONS', 12, 'Adjektiv, ender på -er, komparativ -rere, enkelt-KONS'),
('da_DK', 230, 41, 'er', 'reres', '[^#]#er', 'KONS', 1, 'Adjektiv, ender på -er, komparativ genitiv -reres, enkelt-KONS'),
('da_DK', 231, 38, '0', 'ere', '.', '', 12, 'Adjektiv, svagt bøjet, komparativ, -est'),
('da_DK', 233, 38, '0', 'est', '.', '', 13, 'Adjektiv, svagt bøjet, superlativ, -est'),
('da_DK', 234, 38, '0', 'este', '.', '', 14, 'Adjektiv, svagt bøjet, superlativ pluralis, -est'),
('da_DK', 235, 42, '0', '#', '#', 'KONS', 9, 'Adjektiv, dobbeltkonsonant, KONS -est'),
('da_DK', 256, 38, '0', 'estes', '.', '', 1, 'Adjektiv, svagt bøjet, superlativ pluralis genitiv, -est'),
('da_DK', 258, 38, '0', 'eres', '.', '', 1, 'Adjektiv, svagt bøjet, komparativ genitiv, -est'),
('da_DK', 261, 23, '0', 'eres', '[^e]', '', 1, 'Adjektiv, svagt bøjet, komparativ genitiv'),
('da_DK', 263, 23, '0', 'stes', '.', '', 1, 'Adjektiv, svagt bøjet, superlativ pluralis genitiv'),
('da_DK', 265, 44, '0', 'en', '[^e]', '', 6, 'Substantiv, torso, fælleskøn, bestemt form'),
('da_DK', 266, 44, '0', 'n', 'e', '', 6, 'Substantiv, torso, fælleskøn, bekendt -n'),
('da_DK', 267, 45, '0', 'et', '[^e]', '', 6, 'Substantiv, torso, intetkøn, bekendt'),
('da_DK', 268, 45, '0', 't', 'e', '', 6, 'Substantiv, torso, intetkøn, bekendt -t'),
('da_DK', 269, 2, '0', 'ens', '[^e]', '', 1, 'Substantiv, bekendt form ental, fælleskøn, genitiv'),
('da_DK', 270, 4, '0', 'ts', 'e', '', 1, 'Substantiv, bekendt form ental, intetkøn efter e, genitiv'),
('da_DK', 271, 14, '0', 'ens', '.', '', 1, 'Substantiv, bekendt form fælleskøn med -eren, genitiv'),
('da_DK', 273, 15, 'er', 'rets', '[^fmtr]er', '', 1, 'Substantiv, bekendt form intetkøn med -ret, genitiv'),
('da_DK', 274, 15, '0', 'ets', '.', '', 1, 'Substantiv, bekendt form intetkøn med -eret, genitiv'),
('da_DK', 275, 5, '0', 'enes', '[^r]', '', 8, 'Substantiv, bekendt form flertal, med -e, genitiv'),
('da_DK', 276, 5, '0', 'nes', 'er', '', 1, 'Substantiv, bekendt form flertal, med -e efter -er, genitiv'),
('da_DK', 277, 11, '0', 'ers', '[^e]', '', 1, 'Substantiv, ubekendt form flertal, med -r, genitiv'),
('da_DK', 278, 11, '0', 'rs', 'e', '', 1, 'Substantiv, ubekendt form flertal, med -r efter e, genitiv'),
('da_DK', 281, 13, 'er', 'rene', '[^bcdfghjklmnpqrstvwxz]er', '', 8, 'Substantiv, bekendt form flertal, med -re, stamme -er fjernes, ikke konsonant'),
('da_DK', 282, 13, 'er', 'renes', '[^bcdfghjklmnpqrstvwxz]er', '', 1, 'Substantiv, bekendt form flertal, med -re, stamme -er fjernes, ikke konsonant, genitiv'),
('da_DK', 283, 13, 'er', 're', '[^bcdfghjklmnpqrstvwxz]er', '', 7, 'Substantiv, ubekendt form flertal, med -re, stamme -er fjernes, ikke konsonant'),
('da_DK', 284, 13, 'er', 'res', '[^bcdfghjklmnpqrstvwxz]er', '', 1, 'Substantiv, ubekendt form flertal, med -re, stamme -er fjernes, ikke konsonant, genitiv'),
('da_DK', 285, 4, '0', 'ets', '[^e]', '', 1, 'Substantiv, bekendt form ental, intetkøn, genitiv'),
('da_DK', 288, 46, '0', 'ne', 'e', '', 8, 'Substantiv, bekendt form flertal, med -Ø, efter e'),
('da_DK', 289, 46, '0', 'ene', '[^er]', '', 8, 'Substantiv, bekendt form flertal, med -Ø'),
('da_DK', 290, 46, '0', 'enes', '[^er]', '', 1, 'Substantiv, bekendt form flertal, med -Ø, genitiv'),
('da_DK', 291, 48, '0', '#', '#', 'KONS', 9, 'Substantiv, konsonantfordobling, KONS'),
('da_DK', 310, 47, '0', '#', '#', 'KONS', 9, 'Substantiv, konsonantfordobling, KONS'),
('da_DK', 329, 21, '0', 'ende', '[^e]', '', 5, 'Verbum, svagt bøjet, -ende'),
('da_DK', 330, 1, '0', 'ede', '[^e]', '', 4, 'Verbum, svagt bøjet, -ede i datid'),
('da_DK', 331, 1, '0', 'et', '[^e]', '', 10, 'Verbum, svagt bøjet, -et'),
('da_DK', 332, 10, '0', '\'', '[sxz]', '', 1, 'Genitiv, -\' (sxz)'),
('da_DK', 335, 9, '0', '\'', '[sxz]', '', 1, 'Proprium, genitiv \' efter sxz'),
('da_DK', 339, 26, 't', 'des', '.', '', 1, 'Adjektiv, d erstatter t uden komparation bestemt genitiv -des'),
('da_DK', 340, 28, '0', 'es', '.', '', 1, 'Adjektiv, ender på -sk, genitiv es'),
('da_DK', 341, 9, '0', 'es', 's', '', 1, 'Proprium, genitiv es'),
('da_DK', 344, 50, '0', '\'', '.', '', 0, 'Apostrof, fælleskøn'),
('da_DK', 345, 51, '0', '\'', '.', '', 0, 'Apostrof, intetkøn'),
('da_DK', 346, 53, '0', '-', '.', '', 0, 'Sammensætning, fugeelement - i begyndelsen'),
('da_DK', 347, 53, '0', '-', '.', '', 0, 'Sammensætning, fugeelement - i midten'),
('da_DK', 349, 1, '0', 't', 'e', '', 10, 'Verbum, svagt bøjet, -t i perf. part. (ved -ede)'),
('da_DK', 350, 54, 'A', 'Norda', 'A', '', 0, 'Verdenshjørne, Norda'),
('da_DK', 351, 54, 'A', 'Syda', 'A', '', 0, 'Verdenshjørne, Syda'),
('da_DK', 352, 54, 'A', 'Vesta', 'A', '', 0, 'Verdenshjørne, Vesta'),
('da_DK', 353, 54, 'A', 'Østa', 'A', '', 0, 'Verdenshjørne, Østa'),
('da_DK', 354, 54, 'A', 'Nordvesta', 'A', '', 0, 'Verdenshjørne, Nordvesta'),
('da_DK', 355, 54, 'A', 'Nordøsta', 'A', '', 0, 'Verdenshjørne, Nordøsta'),
('da_DK', 356, 54, 'A', 'Sydvesta', 'A', '', 0, 'Verdenshjørne, Sydvesta'),
('da_DK', 357, 54, 'A', 'Sydøsta', 'A', '', 0, 'Verdenshjørne, Sydøsta'),
('da_DK', 358, 54, 'A', 'Midta', 'A', '', 0, 'Verdenshjørne, Midta'),
('da_DK', 359, 54, 'B', 'Nordb', 'B', '', 0, 'Verdenshjørne, Nordb'),
('da_DK', 360, 54, 'B', 'Sydb', 'B', '', 0, 'Verdenshjørne, Sydb'),
('da_DK', 361, 54, 'B', 'Vestb', 'B', '', 0, 'Verdenshjørne, Vestb'),
('da_DK', 362, 54, 'B', 'Østb', 'B', '', 0, 'Verdenshjørne, Østb'),
('da_DK', 363, 54, 'B', 'Nordvestb', 'B', '', 0, 'Verdenshjørne, Nordvestb'),
('da_DK', 364, 54, 'B', 'Nordøstb', 'B', '', 0, 'Verdenshjørne, Nordøstb'),
('da_DK', 365, 54, 'B', 'Sydvestb', 'B', '', 0, 'Verdenshjørne, Sydvestb'),
('da_DK', 366, 54, 'B', 'Sydøstb', 'B', '', 0, 'Verdenshjørne, Sydøstb'),
('da_DK', 367, 54, 'B', 'Midtb', 'B', '', 0, 'Verdenshjørne, Midtb'),
('da_DK', 368, 54, 'C', 'Nordc', 'C', '', 0, 'Verdenshjørne, Nordc'),
('da_DK', 369, 54, 'C', 'Sydc', 'C', '', 0, 'Verdenshjørne, Sydc'),
('da_DK', 370, 54, 'C', 'Vestc', 'C', '', 0, 'Verdenshjørne, Vestc'),
('da_DK', 371, 54, 'C', 'Østc', 'C', '', 0, 'Verdenshjørne, Østc'),
('da_DK', 372, 54, 'C', 'Nordvestc', 'C', '', 0, 'Verdenshjørne, Nordvestc'),
('da_DK', 373, 54, 'C', 'Nordøstc', 'C', '', 0, 'Verdenshjørne, Nordøstc'),
('da_DK', 374, 54, 'C', 'Sydvestc', 'C', '', 0, 'Verdenshjørne, Sydvestc'),
('da_DK', 375, 54, 'C', 'Sydøstc', 'C', '', 0, 'Verdenshjørne, Sydøstc'),
('da_DK', 376, 54, 'C', 'Midtc', 'C', '', 0, 'Verdenshjørne, Midtc'),
('da_DK', 377, 54, 'D', 'Nordd', 'D', '', 0, 'Verdenshjørne, Nordd'),
('da_DK', 378, 54, 'D', 'Sydd', 'D', '', 0, 'Verdenshjørne, Sydd'),
('da_DK', 379, 54, 'D', 'Vestd', 'D', '', 0, 'Verdenshjørne, Vestd'),
('da_DK', 380, 54, 'D', 'Østd', 'D', '', 0, 'Verdenshjørne, Østd'),
('da_DK', 381, 54, 'D', 'Nordvestd', 'D', '', 0, 'Verdenshjørne, Nordvestd'),
('da_DK', 382, 54, 'D', 'Nordøstd', 'D', '', 0, 'Verdenshjørne, Nordøstd'),
('da_DK', 383, 54, 'D', 'Sydvestd', 'D', '', 0, 'Verdenshjørne, Sydvestd'),
('da_DK', 384, 54, 'D', 'Sydøstd', 'D', '', 0, 'Verdenshjørne, Sydøstd'),
('da_DK', 385, 54, 'D', 'Midtd', 'D', '', 0, 'Verdenshjørne, Midtd'),
('da_DK', 386, 54, 'E', 'Norde', 'E', '', 0, 'Verdenshjørne, Norde'),
('da_DK', 387, 54, 'E', 'Syde', 'E', '', 0, 'Verdenshjørne, Syde'),
('da_DK', 388, 54, 'E', 'Veste', 'E', '', 0, 'Verdenshjørne, Veste'),
('da_DK', 389, 54, 'E', 'Øste', 'E', '', 0, 'Verdenshjørne, Øste'),
('da_DK', 390, 54, 'E', 'Nordveste', 'E', '', 0, 'Verdenshjørne, Nordveste'),
('da_DK', 391, 54, 'E', 'Nordøste', 'E', '', 0, 'Verdenshjørne, Nordøste'),
('da_DK', 392, 54, 'E', 'Sydveste', 'E', '', 0, 'Verdenshjørne, Sydveste'),
('da_DK', 393, 54, 'E', 'Sydøste', 'E', '', 0, 'Verdenshjørne, Sydøste'),
('da_DK', 394, 54, 'E', 'Midte', 'E', '', 0, 'Verdenshjørne, Midte'),
('da_DK', 395, 54, 'F', 'Nordf', 'F', '', 0, 'Verdenshjørne, Nordf'),
('da_DK', 396, 54, 'F', 'Sydf', 'F', '', 0, 'Verdenshjørne, Sydf'),
('da_DK', 397, 54, 'F', 'Vestf', 'F', '', 0, 'Verdenshjørne, Vestf'),
('da_DK', 398, 54, 'F', 'Østf', 'F', '', 0, 'Verdenshjørne, Østf'),
('da_DK', 399, 54, 'F', 'Nordvestf', 'F', '', 0, 'Verdenshjørne, Nordvestf'),
('da_DK', 400, 54, 'F', 'Nordøstf', 'F', '', 0, 'Verdenshjørne, Nordøstf'),
('da_DK', 401, 54, 'F', 'Sydvestf', 'F', '', 0, 'Verdenshjørne, Sydvestf'),
('da_DK', 402, 54, 'F', 'Sydøstf', 'F', '', 0, 'Verdenshjørne, Sydøstf'),
('da_DK', 403, 54, 'F', 'Midtf', 'F', '', 0, 'Verdenshjørne, Midtf'),
('da_DK', 404, 54, 'G', 'Nordg', 'G', '', 0, 'Verdenshjørne, Nordg'),
('da_DK', 405, 54, 'G', 'Sydg', 'G', '', 0, 'Verdenshjørne, Sydg'),
('da_DK', 406, 54, 'G', 'Vestg', 'G', '', 0, 'Verdenshjørne, Vestg'),
('da_DK', 407, 54, 'G', 'Østg', 'G', '', 0, 'Verdenshjørne, Østg'),
('da_DK', 408, 54, 'G', 'Nordvestg', 'G', '', 0, 'Verdenshjørne, Nordvestg'),
('da_DK', 409, 54, 'G', 'Nordøstg', 'G', '', 0, 'Verdenshjørne, Nordøstg'),
('da_DK', 410, 54, 'G', 'Sydvestg', 'G', '', 0, 'Verdenshjørne, Sydvestg'),
('da_DK', 411, 54, 'G', 'Sydøstg', 'G', '', 0, 'Verdenshjørne, Sydøstg'),
('da_DK', 412, 54, 'G', 'Midtg', 'G', '', 0, 'Verdenshjørne, Midtg'),
('da_DK', 413, 54, 'H', 'Nordh', 'H', '', 0, 'Verdenshjørne, Nordh'),
('da_DK', 414, 54, 'H', 'Sydh', 'H', '', 0, 'Verdenshjørne, Sydh'),
('da_DK', 415, 54, 'H', 'Vesth', 'H', '', 0, 'Verdenshjørne, Vesth'),
('da_DK', 416, 54, 'H', 'Østh', 'H', '', 0, 'Verdenshjørne, Østh'),
('da_DK', 417, 54, 'H', 'Nordvesth', 'H', '', 0, 'Verdenshjørne, Nordvesth'),
('da_DK', 418, 54, 'H', 'Nordøsth', 'H', '', 0, 'Verdenshjørne, Nordøsth'),
('da_DK', 419, 54, 'H', 'Sydvesth', 'H', '', 0, 'Verdenshjørne, Sydvesth'),
('da_DK', 420, 54, 'H', 'Sydøsth', 'H', '', 0, 'Verdenshjørne, Sydøsth'),
('da_DK', 421, 54, 'H', 'Midth', 'H', '', 0, 'Verdenshjørne, Midth'),
('da_DK', 422, 54, 'I', 'Nordi', 'I', '', 0, 'Verdenshjørne, Nordi'),
('da_DK', 423, 54, 'I', 'Sydi', 'I', '', 0, 'Verdenshjørne, Sydi'),
('da_DK', 424, 54, 'I', 'Vesti', 'I', '', 0, 'Verdenshjørne, Vesti'),
('da_DK', 425, 54, 'I', 'Østi', 'I', '', 0, 'Verdenshjørne, Østi'),
('da_DK', 426, 54, 'I', 'Nordvesti', 'I', '', 0, 'Verdenshjørne, Nordvesti'),
('da_DK', 427, 54, 'I', 'Nordøsti', 'I', '', 0, 'Verdenshjørne, Nordøsti'),
('da_DK', 428, 54, 'I', 'Sydvesti', 'I', '', 0, 'Verdenshjørne, Sydvesti'),
('da_DK', 429, 54, 'I', 'Sydøsti', 'I', '', 0, 'Verdenshjørne, Sydøsti'),
('da_DK', 430, 54, 'I', 'Midti', 'I', '', 0, 'Verdenshjørne, Midti'),
('da_DK', 431, 54, 'J', 'Nordj', 'J', '', 0, 'Verdenshjørne, Nordj'),
('da_DK', 432, 54, 'J', 'Sydj', 'J', '', 0, 'Verdenshjørne, Sydj'),
('da_DK', 433, 54, 'J', 'Vestj', 'J', '', 0, 'Verdenshjørne, Vestj'),
('da_DK', 434, 54, 'J', 'Østj', 'J', '', 0, 'Verdenshjørne, Østj'),
('da_DK', 435, 54, 'J', 'Nordvestj', 'J', '', 0, 'Verdenshjørne, Nordvestj'),
('da_DK', 436, 54, 'J', 'Nordøstj', 'J', '', 0, 'Verdenshjørne, Nordøstj'),
('da_DK', 437, 54, 'J', 'Sydvestj', 'J', '', 0, 'Verdenshjørne, Sydvestj'),
('da_DK', 438, 54, 'J', 'Sydøstj', 'J', '', 0, 'Verdenshjørne, Sydøstj'),
('da_DK', 439, 54, 'J', 'Midtj', 'J', '', 0, 'Verdenshjørne, Midtj'),
('da_DK', 440, 54, 'K', 'Nordk', 'K', '', 0, 'Verdenshjørne, Nordk'),
('da_DK', 441, 54, 'K', 'Sydk', 'K', '', 0, 'Verdenshjørne, Sydk'),
('da_DK', 442, 54, 'K', 'Vestk', 'K', '', 0, 'Verdenshjørne, Vestk'),
('da_DK', 443, 54, 'K', 'Østk', 'K', '', 0, 'Verdenshjørne, Østk'),
('da_DK', 444, 54, 'K', 'Nordvestk', 'K', '', 0, 'Verdenshjørne, Nordvestk'),
('da_DK', 445, 54, 'K', 'Nordøstk', 'K', '', 0, 'Verdenshjørne, Nordøstk'),
('da_DK', 446, 54, 'K', 'Sydvestk', 'K', '', 0, 'Verdenshjørne, Sydvestk'),
('da_DK', 447, 54, 'K', 'Sydøstk', 'K', '', 0, 'Verdenshjørne, Sydøstk'),
('da_DK', 448, 54, 'K', 'Midtk', 'K', '', 0, 'Verdenshjørne, Midtk'),
('da_DK', 449, 54, 'L', 'Nordl', 'L', '', 0, 'Verdenshjørne, Nordl'),
('da_DK', 450, 54, 'L', 'Sydl', 'L', '', 0, 'Verdenshjørne, Sydl'),
('da_DK', 451, 54, 'L', 'Vestl', 'L', '', 0, 'Verdenshjørne, Vestl'),
('da_DK', 452, 54, 'L', 'Østl', 'L', '', 0, 'Verdenshjørne, Østl'),
('da_DK', 453, 54, 'L', 'Nordvestl', 'L', '', 0, 'Verdenshjørne, Nordvestl'),
('da_DK', 454, 54, 'L', 'Nordøstl', 'L', '', 0, 'Verdenshjørne, Nordøstl'),
('da_DK', 455, 54, 'L', 'Sydvestl', 'L', '', 0, 'Verdenshjørne, Sydvestl'),
('da_DK', 456, 54, 'L', 'Sydøstl', 'L', '', 0, 'Verdenshjørne, Sydøstl'),
('da_DK', 457, 54, 'L', 'Midtl', 'L', '', 0, 'Verdenshjørne, Midtl'),
('da_DK', 458, 54, 'M', 'Nordm', 'M', '', 0, 'Verdenshjørne, Nordm'),
('da_DK', 459, 54, 'M', 'Sydm', 'M', '', 0, 'Verdenshjørne, Sydm'),
('da_DK', 460, 54, 'M', 'Vestm', 'M', '', 0, 'Verdenshjørne, Vestm'),
('da_DK', 461, 54, 'M', 'Østm', 'M', '', 0, 'Verdenshjørne, Østm'),
('da_DK', 462, 54, 'M', 'Nordvestm', 'M', '', 0, 'Verdenshjørne, Nordvestm'),
('da_DK', 463, 54, 'M', 'Nordøstm', 'M', '', 0, 'Verdenshjørne, Nordøstm'),
('da_DK', 464, 54, 'M', 'Sydvestm', 'M', '', 0, 'Verdenshjørne, Sydvestm'),
('da_DK', 465, 54, 'M', 'Sydøstm', 'M', '', 0, 'Verdenshjørne, Sydøstm'),
('da_DK', 466, 54, 'M', 'Midtm', 'M', '', 0, 'Verdenshjørne, Midtm'),
('da_DK', 467, 54, 'N', 'Nordn', 'N', '', 0, 'Verdenshjørne, Nordn'),
('da_DK', 468, 54, 'N', 'Sydn', 'N', '', 0, 'Verdenshjørne, Sydn'),
('da_DK', 469, 54, 'N', 'Vestn', 'N', '', 0, 'Verdenshjørne, Vestn'),
('da_DK', 470, 54, 'N', 'Østn', 'N', '', 0, 'Verdenshjørne, Østn'),
('da_DK', 471, 54, 'N', 'Nordvestn', 'N', '', 0, 'Verdenshjørne, Nordvestn'),
('da_DK', 472, 54, 'N', 'Nordøstn', 'N', '', 0, 'Verdenshjørne, Nordøstn'),
('da_DK', 473, 54, 'N', 'Sydvestn', 'N', '', 0, 'Verdenshjørne, Sydvestn'),
('da_DK', 474, 54, 'N', 'Sydøstn', 'N', '', 0, 'Verdenshjørne, Sydøstn'),
('da_DK', 475, 54, 'N', 'Midtn', 'N', '', 0, 'Verdenshjørne, Midtn'),
('da_DK', 476, 54, 'O', 'Nordo', 'O', '', 0, 'Verdenshjørne, Nordo'),
('da_DK', 477, 54, 'O', 'Sydo', 'O', '', 0, 'Verdenshjørne, Sydo'),
('da_DK', 478, 54, 'O', 'Vesto', 'O', '', 0, 'Verdenshjørne, Vesto'),
('da_DK', 479, 54, 'O', 'Østo', 'O', '', 0, 'Verdenshjørne, Østo'),
('da_DK', 480, 54, 'O', 'Nordvesto', 'O', '', 0, 'Verdenshjørne, Nordvesto'),
('da_DK', 481, 54, 'O', 'Nordøsto', 'O', '', 0, 'Verdenshjørne, Nordøsto'),
('da_DK', 482, 54, 'O', 'Sydvesto', 'O', '', 0, 'Verdenshjørne, Sydvesto'),
('da_DK', 483, 54, 'O', 'Sydøsto', 'O', '', 0, 'Verdenshjørne, Sydøsto'),
('da_DK', 484, 54, 'O', 'Midto', 'O', '', 0, 'Verdenshjørne, Midto'),
('da_DK', 485, 54, 'P', 'Nordp', 'P', '', 0, 'Verdenshjørne, Nordp'),
('da_DK', 486, 54, 'P', 'Sydp', 'P', '', 0, 'Verdenshjørne, Sydp'),
('da_DK', 487, 54, 'P', 'Vestp', 'P', '', 0, 'Verdenshjørne, Vestp'),
('da_DK', 488, 54, 'P', 'Østp', 'P', '', 0, 'Verdenshjørne, Østp'),
('da_DK', 489, 54, 'P', 'Nordvestp', 'P', '', 0, 'Verdenshjørne, Nordvestp'),
('da_DK', 490, 54, 'P', 'Nordøstp', 'P', '', 0, 'Verdenshjørne, Nordøstp'),
('da_DK', 491, 54, 'P', 'Sydvestp', 'P', '', 0, 'Verdenshjørne, Sydvestp'),
('da_DK', 492, 54, 'P', 'Sydøstp', 'P', '', 0, 'Verdenshjørne, Sydøstp'),
('da_DK', 493, 54, 'P', 'Midtp', 'P', '', 0, 'Verdenshjørne, Midtp'),
('da_DK', 494, 54, 'Q', 'Nordq', 'Q', '', 0, 'Verdenshjørne, Nordq'),
('da_DK', 495, 54, 'Q', 'Sydq', 'Q', '', 0, 'Verdenshjørne, Sydq'),
('da_DK', 496, 54, 'Q', 'Vestq', 'Q', '', 0, 'Verdenshjørne, Vestq'),
('da_DK', 497, 54, 'Q', 'Østq', 'Q', '', 0, 'Verdenshjørne, Østq'),
('da_DK', 498, 54, 'Q', 'Nordvestq', 'Q', '', 0, 'Verdenshjørne, Nordvestq'),
('da_DK', 499, 54, 'Q', 'Nordøstq', 'Q', '', 0, 'Verdenshjørne, Nordøstq'),
('da_DK', 500, 54, 'Q', 'Sydvestq', 'Q', '', 0, 'Verdenshjørne, Sydvestq'),
('da_DK', 501, 54, 'Q', 'Sydøstq', 'Q', '', 0, 'Verdenshjørne, Sydøstq'),
('da_DK', 502, 54, 'Q', 'Midtq', 'Q', '', 0, 'Verdenshjørne, Midtq'),
('da_DK', 503, 54, 'R', 'Nordr', 'R', '', 0, 'Verdenshjørne, Nordr'),
('da_DK', 504, 54, 'R', 'Sydr', 'R', '', 0, 'Verdenshjørne, Sydr'),
('da_DK', 505, 54, 'R', 'Vestr', 'R', '', 0, 'Verdenshjørne, Vestr'),
('da_DK', 506, 54, 'R', 'Østr', 'R', '', 0, 'Verdenshjørne, Østr'),
('da_DK', 507, 54, 'R', 'Nordvestr', 'R', '', 0, 'Verdenshjørne, Nordvestr'),
('da_DK', 508, 54, 'R', 'Nordøstr', 'R', '', 0, 'Verdenshjørne, Nordøstr'),
('da_DK', 509, 54, 'R', 'Sydvestr', 'R', '', 0, 'Verdenshjørne, Sydvestr'),
('da_DK', 510, 54, 'R', 'Sydøstr', 'R', '', 0, 'Verdenshjørne, Sydøstr'),
('da_DK', 511, 54, 'R', 'Midtr', 'R', '', 0, 'Verdenshjørne, Midtr'),
('da_DK', 512, 54, 'S', 'Nords', 'S', '', 0, 'Verdenshjørne, Nords'),
('da_DK', 513, 54, 'S', 'Syds', 'S', '', 0, 'Verdenshjørne, Syds'),
('da_DK', 514, 54, 'S', 'Vests', 'S', '', 0, 'Verdenshjørne, Vests'),
('da_DK', 515, 54, 'S', 'Østs', 'S', '', 0, 'Verdenshjørne, Østs'),
('da_DK', 516, 54, 'S', 'Nordvests', 'S', '', 0, 'Verdenshjørne, Nordvests'),
('da_DK', 517, 54, 'S', 'Nordøsts', 'S', '', 0, 'Verdenshjørne, Nordøsts'),
('da_DK', 518, 54, 'S', 'Sydvests', 'S', '', 0, 'Verdenshjørne, Sydvests'),
('da_DK', 519, 54, 'S', 'Sydøsts', 'S', '', 0, 'Verdenshjørne, Sydøsts'),
('da_DK', 520, 54, 'S', 'Midts', 'S', '', 0, 'Verdenshjørne, Midts'),
('da_DK', 521, 54, 'T', 'Nordt', 'T', '', 0, 'Verdenshjørne, Nordt'),
('da_DK', 522, 54, 'T', 'Sydt', 'T', '', 0, 'Verdenshjørne, Sydt'),
('da_DK', 523, 54, 'T', 'Vestt', 'T', '', 0, 'Verdenshjørne, Vestt'),
('da_DK', 524, 54, 'T', 'Østt', 'T', '', 0, 'Verdenshjørne, Østt'),
('da_DK', 525, 54, 'T', 'Nordvestt', 'T', '', 0, 'Verdenshjørne, Nordvestt'),
('da_DK', 526, 54, 'T', 'Nordøstt', 'T', '', 0, 'Verdenshjørne, Nordøstt'),
('da_DK', 527, 54, 'T', 'Sydvestt', 'T', '', 0, 'Verdenshjørne, Sydvestt'),
('da_DK', 528, 54, 'T', 'Sydøstt', 'T', '', 0, 'Verdenshjørne, Sydøstt'),
('da_DK', 529, 54, 'T', 'Midtt', 'T', '', 0, 'Verdenshjørne, Midtt'),
('da_DK', 530, 54, 'U', 'Nordu', 'U', '', 0, 'Verdenshjørne, Nordu'),
('da_DK', 531, 54, 'U', 'Sydu', 'U', '', 0, 'Verdenshjørne, Sydu'),
('da_DK', 532, 54, 'U', 'Vestu', 'U', '', 0, 'Verdenshjørne, Vestu'),
('da_DK', 533, 54, 'U', 'Østu', 'U', '', 0, 'Verdenshjørne, Østu'),
('da_DK', 534, 54, 'U', 'Nordvestu', 'U', '', 0, 'Verdenshjørne, Nordvestu'),
('da_DK', 535, 54, 'U', 'Nordøstu', 'U', '', 0, 'Verdenshjørne, Nordøstu'),
('da_DK', 536, 54, 'U', 'Sydvestu', 'U', '', 0, 'Verdenshjørne, Sydvestu'),
('da_DK', 537, 54, 'U', 'Sydøstu', 'U', '', 0, 'Verdenshjørne, Sydøstu'),
('da_DK', 538, 54, 'U', 'Midtu', 'U', '', 0, 'Verdenshjørne, Midtu'),
('da_DK', 539, 54, 'V', 'Nordv', 'V', '', 0, 'Verdenshjørne, Nordv'),
('da_DK', 540, 54, 'V', 'Sydv', 'V', '', 0, 'Verdenshjørne, Sydv'),
('da_DK', 541, 54, 'V', 'Vestv', 'V', '', 0, 'Verdenshjørne, Vestv'),
('da_DK', 542, 54, 'V', 'Østv', 'V', '', 0, 'Verdenshjørne, Østv'),
('da_DK', 543, 54, 'V', 'Nordvestv', 'V', '', 0, 'Verdenshjørne, Nordvestv'),
('da_DK', 544, 54, 'V', 'Nordøstv', 'V', '', 0, 'Verdenshjørne, Nordøstv'),
('da_DK', 545, 54, 'V', 'Sydvestv', 'V', '', 0, 'Verdenshjørne, Sydvestv'),
('da_DK', 546, 54, 'V', 'Sydøstv', 'V', '', 0, 'Verdenshjørne, Sydøstv'),
('da_DK', 547, 54, 'V', 'Midtv', 'V', '', 0, 'Verdenshjørne, Midtv'),
('da_DK', 548, 54, 'W', 'Nordw', 'W', '', 0, 'Verdenshjørne, Nordw'),
('da_DK', 549, 54, 'W', 'Sydw', 'W', '', 0, 'Verdenshjørne, Sydw'),
('da_DK', 550, 54, 'W', 'Vestw', 'W', '', 0, 'Verdenshjørne, Vestw'),
('da_DK', 551, 54, 'W', 'Østw', 'W', '', 0, 'Verdenshjørne, Østw'),
('da_DK', 552, 54, 'W', 'Nordvestw', 'W', '', 0, 'Verdenshjørne, Nordvestw'),
('da_DK', 553, 54, 'W', 'Nordøstw', 'W', '', 0, 'Verdenshjørne, Nordøstw'),
('da_DK', 554, 54, 'W', 'Sydvestw', 'W', '', 0, 'Verdenshjørne, Sydvestw'),
('da_DK', 555, 54, 'W', 'Sydøstw', 'W', '', 0, 'Verdenshjørne, Sydøstw'),
('da_DK', 556, 54, 'W', 'Midtw', 'W', '', 0, 'Verdenshjørne, Midtw'),
('da_DK', 557, 54, 'X', 'Nordx', 'X', '', 0, 'Verdenshjørne, Nordx'),
('da_DK', 558, 54, 'X', 'Sydx', 'X', '', 0, 'Verdenshjørne, Sydx'),
('da_DK', 559, 54, 'X', 'Vestx', 'X', '', 0, 'Verdenshjørne, Vestx'),
('da_DK', 560, 54, 'X', 'Østx', 'X', '', 0, 'Verdenshjørne, Østx'),
('da_DK', 561, 54, 'X', 'Nordvestx', 'X', '', 0, 'Verdenshjørne, Nordvestx'),
('da_DK', 562, 54, 'X', 'Nordøstx', 'X', '', 0, 'Verdenshjørne, Nordøstx'),
('da_DK', 563, 54, 'X', 'Sydvestx', 'X', '', 0, 'Verdenshjørne, Sydvestx'),
('da_DK', 564, 54, 'X', 'Sydøstx', 'X', '', 0, 'Verdenshjørne, Sydøstx'),
('da_DK', 565, 54, 'X', 'Midtx', 'X', '', 0, 'Verdenshjørne, Midtx'),
('da_DK', 566, 54, 'Y', 'Nordy', 'Y', '', 0, 'Verdenshjørne, Nordy'),
('da_DK', 567, 54, 'Y', 'Sydy', 'Y', '', 0, 'Verdenshjørne, Sydy'),
('da_DK', 568, 54, 'Y', 'Vesty', 'Y', '', 0, 'Verdenshjørne, Vesty'),
('da_DK', 569, 54, 'Y', 'Østy', 'Y', '', 0, 'Verdenshjørne, Østy'),
('da_DK', 570, 54, 'Y', 'Nordvesty', 'Y', '', 0, 'Verdenshjørne, Nordvesty'),
('da_DK', 571, 54, 'Y', 'Nordøsty', 'Y', '', 0, 'Verdenshjørne, Nordøsty'),
('da_DK', 572, 54, 'Y', 'Sydvesty', 'Y', '', 0, 'Verdenshjørne, Sydvesty'),
('da_DK', 573, 54, 'Y', 'Sydøsty', 'Y', '', 0, 'Verdenshjørne, Sydøsty'),
('da_DK', 574, 54, 'Y', 'Midty', 'Y', '', 0, 'Verdenshjørne, Midty'),
('da_DK', 575, 54, 'Z', 'Nordz', 'Z', '', 0, 'Verdenshjørne, Nordz'),
('da_DK', 576, 54, 'Z', 'Sydz', 'Z', '', 0, 'Verdenshjørne, Sydz'),
('da_DK', 577, 54, 'Z', 'Vestz', 'Z', '', 0, 'Verdenshjørne, Vestz'),
('da_DK', 578, 54, 'Z', 'Østz', 'Z', '', 0, 'Verdenshjørne, Østz'),
('da_DK', 579, 54, 'Z', 'Nordvestz', 'Z', '', 0, 'Verdenshjørne, Nordvestz'),
('da_DK', 580, 54, 'Z', 'Nordøstz', 'Z', '', 0, 'Verdenshjørne, Nordøstz'),
('da_DK', 581, 54, 'Z', 'Sydvestz', 'Z', '', 0, 'Verdenshjørne, Sydvestz'),
('da_DK', 582, 54, 'Z', 'Sydøstz', 'Z', '', 0, 'Verdenshjørne, Sydøstz'),
('da_DK', 583, 54, 'Z', 'Midtz', 'Z', '', 0, 'Verdenshjørne, Midtz'),
('da_DK', 584, 54, 'Æ', 'Nordæ', 'Æ', '', 0, 'Verdenshjørne, Nordæ'),
('da_DK', 585, 54, 'Æ', 'Sydæ', 'Æ', '', 0, 'Verdenshjørne, Sydæ'),
('da_DK', 586, 54, 'Æ', 'Vestæ', 'Æ', '', 0, 'Verdenshjørne, Vestæ'),
('da_DK', 587, 54, 'Æ', 'Østæ', 'Æ', '', 0, 'Verdenshjørne, Østæ'),
('da_DK', 588, 54, 'Æ', 'Nordvestæ', 'Æ', '', 0, 'Verdenshjørne, Nordvestæ'),
('da_DK', 589, 54, 'Æ', 'Nordøstæ', 'Æ', '', 0, 'Verdenshjørne, Nordøstæ'),
('da_DK', 590, 54, 'Æ', 'Sydvestæ', 'Æ', '', 0, 'Verdenshjørne, Sydvestæ'),
('da_DK', 591, 54, 'Æ', 'Sydøstæ', 'Æ', '', 0, 'Verdenshjørne, Sydøstæ'),
('da_DK', 592, 54, 'Æ', 'Midtæ', 'Æ', '', 0, 'Verdenshjørne, Midtæ'),
('da_DK', 593, 54, 'Ø', 'Nordø', 'Ø', '', 0, 'Verdenshjørne, Nordø'),
('da_DK', 594, 54, 'Ø', 'Sydø', 'Ø', '', 0, 'Verdenshjørne, Sydø'),
('da_DK', 595, 54, 'Ø', 'Vestø', 'Ø', '', 0, 'Verdenshjørne, Vestø'),
('da_DK', 596, 54, 'Ø', 'Østø', 'Ø', '', 0, 'Verdenshjørne, Østø'),
('da_DK', 597, 54, 'Ø', 'Nordvestø', 'Ø', '', 0, 'Verdenshjørne, Nordvestø'),
('da_DK', 598, 54, 'Ø', 'Nordøstø', 'Ø', '', 0, 'Verdenshjørne, Nordøstø'),
('da_DK', 599, 54, 'Ø', 'Sydvestø', 'Ø', '', 0, 'Verdenshjørne, Sydvestø'),
('da_DK', 600, 54, 'Ø', 'Sydøstø', 'Ø', '', 0, 'Verdenshjørne, Sydøstø'),
('da_DK', 601, 54, 'Ø', 'Midtø', 'Ø', '', 0, 'Verdenshjørne, Midtø'),
('da_DK', 602, 54, 'Å', 'Nordå', 'Å', '', 0, 'Verdenshjørne, Nordå'),
('da_DK', 603, 54, 'Å', 'Sydå', 'Å', '', 0, 'Verdenshjørne, Sydå'),
('da_DK', 604, 54, 'Å', 'Vestå', 'Å', '', 0, 'Verdenshjørne, Vestå'),
('da_DK', 605, 54, 'Å', 'Østå', 'Å', '', 0, 'Verdenshjørne, Østå'),
('da_DK', 606, 54, 'Å', 'Nordvestå', 'Å', '', 0, 'Verdenshjørne, Nordvestå'),
('da_DK', 607, 54, 'Å', 'Nordøstå', 'Å', '', 0, 'Verdenshjørne, Nordøstå'),
('da_DK', 608, 54, 'Å', 'Sydvestå', 'Å', '', 0, 'Verdenshjørne, Sydvestå'),
('da_DK', 609, 54, 'Å', 'Sydøstå', 'Å', '', 0, 'Verdenshjørne, Sydøstå'),
('da_DK', 610, 54, 'Å', 'Midtå', 'Å', '', 0, 'Verdenshjørne, Midtå'),
('da_DK', 611, 55, 'e', '0', 'e', '', 0, 'Sammensætning, fugeelement fjern e, i midten'),
('da_DK', 612, 56, 'e', 's', '.', '', 0, 'Sammensætning, fugeelement fjern e tilføj s, i begyndelsen'),
('da_DK', 613, 55, 'e', '0', 'e', '', 0, 'Sammensætning, fugeelement fjern e, i begyndelsen'),
('da_DK', 614, 56, 'e', 's', '.', '', 0, 'Sammensætning, fugeelement fjern e tilføj s, i midten'),
('da_DK', 615, 58, '0', '#en', '#', 'KONS', 9, 'Substantiv, konsonantfordobling, fælleskøn, torso, KONS'),
('da_DK', 635, 57, '0', '#et', '#', 'KONS', 9, 'Substantiv, konsonantfordobling, intetkøn, torso, KONS'),
('da_DK', 655, 59, '0', '#e', '#', 'KONS', 9, 'Adjektiv, uden komparation, dobbeltkonsonant, KONS'),
('da_DK', 675, 60, '0', 'er', '.', '', 0, 'Sammensætning, fugeelement er i begyndelsen'),
('da_DK', 676, 60, '0', 'er', '.', '', 0, 'Sammensætning, fugeelement er i midten'),
('da_DK', 677, 61, '0', '#e', '#', 'KONS', 0, 'Sammensætning, fugeelement kons.+e, i begyndelsen'),
('da_DK', 679, 61, '0', '#e', '#', 'KONS', 0, 'Sammensætning, fugeelement kons.+e, i midten'),
('da_DK', 697, 46, '0', 'nes', 'e', '', 1, 'Substantiv, bekendt form flertal, med -Ø, efter e, genitiv'),
('da_DK', 698, 5, '0', 'ene', '[^e]r', '', 8, 'Substantiv, bekendt form flertal, med -e, efter -r ikke -er'),
('da_DK', 699, 5, '0', 'enes', '[^e]r', '', 8, 'Substantiv, bekendt form flertal, med -e, efter -r ikke -er, genitiv'),
('da_DK', 700, 46, '0', 'ne', 'er', '', 8, 'Substantiv, bekendt form flertal, med Ø, efter er'),
('da_DK', 701, 46, '0', 'ene', '[^e]r', '', 8, 'Substantiv, bekendt form flertal, med Ø, efter r'),
('da_DK', 702, 46, '0', 'nes', 'er', '', 1, 'Substantiv, bekendt form flertal, med Ø, efter er, genitiv'),
('da_DK', 703, 46, '0', 'enes', '[^e]r', '', 1, 'Substantiv, bekendt form flertal, med Ø, efter r, genitiv'),
('da_DK', 704, 13, 'er', 're', '[^#]#er', 'KONS', 7, 'Substantiv, ubekendt form flertal, med -re, stamme -er fjernes, enkelt-KONS'),
('da_DK', 708, 13, 'er', 'res', '[^#]#er', 'KONS', 1, 'Substantiv, ubekendt form flertal, med -re, stamme -er fjernes, enkelt-KONS, genitiv'),
('da_DK', 709, 13, '#er', 're', '##er', 'KONS', 7, 'Substantiv, ubekendt form flertal, med -re, stamme -er fjernes, dobbelt-KONS'),
('da_DK', 712, 13, '#er', 'res', '##er', 'KONS', 1, 'Substantiv, ubekendt form flertal, med -re, stamme -er fjernes, dobbelt-KONS, genitiv'),
('da_DK', 714, 13, 'er', 'rene', '[^#]#er', 'KONS', 8, 'Substantiv, bekendt form flertal, med -re, stamme -er fjernes, enkelt-KONS'),
('da_DK', 718, 13, 'er', 'renes', '[^#]#er', 'KONS', 1, 'Substantiv, bekendt form flertal, med -re, stamme -er fjernes, enkelt-KONS, genitiv'),
('da_DK', 720, 64, 'el', 'ler', '[^bcdfghjklmnpqrstvwxz]el', '', 7, 'Substantiv, ender på el, bekendt form flertal, -el erstattes med -ler, ikke konsonant'),
('da_DK', 721, 64, 'el', 'lers', '[^bcdfghjklmnpqrstvwxz]el', '', 1, 'Substantiv, ender på el, bekendt form flertal, -el erstattes med -lers, ikke konsonant, genitiv'),
('da_DK', 722, 64, 'el', 'lerne', '[^bcdfghjklmnpqrstvwxz]el', '', 7, 'Substantiv, ender på el, ubekendt form flertal, -el erstattes med -lerne, ikke konsonant'),
('da_DK', 723, 64, 'el', 'lernes', '[^bcdfghjklmnpqrstvwxz]el', '', 1, 'Substantiv, ender på el, ubekendt form flertal, -el erstattes med -lernes, ikke konsonant, genitiv'),
('da_DK', 725, 65, 'el', 'len', '[^bcdfghjklmnpqrstvwxz]el', '', 6, 'Substantiv, fælleskøn, ender på el, bekendt form ental, -el erstattes med -len'),
('da_DK', 726, 65, 'el', 'lens', '[^bcdfghjklmnpqrstvwxz]el', '', 1, 'Substantiv, fælleskøn, ender på el, bekendt form ental, -el erstattes med -len, genitiv'),
('da_DK', 727, 66, 'el', 'let', '[^bcdfghjklmnpqrstvwxz]el', '', 6, 'Substantiv, intetkøn, ender på el, bekendt form ental, -el erstattes med -let, ikke konsonant'),
('da_DK', 728, 66, 'el', 'lets', '[^bcdfghjklmnpqrstvwxz]el', '', 1, 'Substantiv, intetkøn, ender på el, bekendt form ental, -el erstattes med -lets, ikke konsonant, genitiv'),
('da_DK', 729, 64, 'el', 'ler', '[^#]#el', 'KONS', 8, 'Substantiv, ender på el, bekendt form flertal, -el erstattes med -ler, enkelt KONS'),
('da_DK', 735, 64, '#el', 'ler', '##el', 'KONS', 8, 'Substantiv, ender på el, bekendt form flertal, -el erstattes med -ler, dobbelt KONS'),
('da_DK', 741, 64, 'el', 'lers', '[^#]#el', 'KONS', 1, 'Substantiv, ender på el, bekendt form flertal, -el erstattes med -lers, enkelt KONS, genitiv'),
('da_DK', 747, 64, '#el', 'lers', '##el', 'KONS', 1, 'Substantiv, ender på el, bekendt form flertal, -el erstattes med -lers, dobbelt KONS, genitiv'),
('da_DK', 753, 64, 'el', 'lerne', '[^#]#el', 'KONS', 7, 'Substantiv, ender på el, ubekendt form flertal, -el erstattes med -lerne, enkelt KONS'),
('da_DK', 759, 64, '#el', 'lerne', '##el', 'KONS', 7, 'Substantiv, ender på el, ubekendt form flertal, -el erstattes med -lerne, dobbelt KONS'),
('da_DK', 765, 64, 'el', 'lernes', '[^#]#el', 'KONS', 1, 'Substantiv, ender på el, ubekendt form flertal, -el erstattes med -lernes, enkelt KONS, genetiv'),
('da_DK', 771, 64, '#el', 'lernes', '##el', 'KONS', 1, 'Substantiv, ender på el, ubekendt form flertal, -el erstattes med -lernes, dobbelt KONS, genitiv'),
('da_DK', 777, 65, 'el', 'len', '[^#]#el', 'KONS', 6, 'Substantiv, fælleskøn, ender på el, bekendt form ental, -el erstattes med -len, enkelt KONS'),
('da_DK', 789, 65, 'el', 'lens', '[^#]#el', 'KONS', 1, 'Substantiv, fælleskøn, ender på el, bekendt form ental, -el erstattes med -len, genitiv, enkelt KONS'),
('da_DK', 801, 66, 'el', 'let', '[^#]#el', 'KONS', 6, 'Substantiv, intetkøn, ender på el, ubekendt form ental, -el erstattes med -let, enkelt KONS'),
('da_DK', 803, 66, '#el', 'let', '##el', 'KONS', 6, 'Substantiv, intetkøn, ender på el, ubekendt form ental, -el erstattes med -let, dobbelt KONS'),
('da_DK', 805, 66, 'el', 'lets', '[^#]#el', 'KONS', 1, 'Substantiv, intetkøn, ender på el, ubekendt form ental, -el erstattes med -lets, genitiv, enkelt KONS'),
('da_DK', 807, 66, '#el', 'lets', '##el', 'KONS', 1, 'Substantiv, intetkøn, ender på el, ubekendt form ental, -el erstattes med -lets, genitiv, dobbelt KONS'),
('da_DK', 809, 68, '0', '#er', '#', 'KONS', 0, 'Sammensætning, fugeelement kons.f.+er, i begyndelsen'),
('da_DK', 810, 68, '0', '#er', '#', 'KONS', 0, 'Sammensætning, fugeelement kons.f.+er, i midten'),
('da_DK', 830, 69, 'um', 'e', 'um', '', 15, 'Sammensætning, fugeelement fjern um tilføj e, i begyndelsen'),
('da_DK', 847, 65, '#el', 'len', '##el', 'KONS', 6, 'Substantiv, fælleskøn, ender på el, bekendt form ental, -el erstattes med -len, dobbelt KONS'),
('da_DK', 861, 65, '#el', 'lens', '##el', 'KONS', 1, 'Substantiv, fælleskøn, ender på el, bekendt form ental, -el erstattes med -len, genitiv, dobbelt KONS'),
('da_DK', 867, 13, '#er', 'rene', '##er', 'KONS', 8, 'Substantiv, bekendt form flertal, med -re, stamme -er fjernes, dobbelt-KONS'),
('da_DK', 869, 13, '#er', 'renes', '##er', 'KONS', 1, 'Substantiv, bekendt form flertal, med -re, stamme -er fjernes, dobbelt-KONS, genitiv'),
('da_DK', 883, 69, 'um', 'e', 'um', '', 15, 'Sammensætning, fugeelement fjern um tilføj e, i midten'),
('da_DK', 884, 70, 'um', 'et', 'um', '', 6, 'Substantiv, ender på um, bestemt form ental, -um erstattes med -et'),
('da_DK', 885, 70, 'um', 'ets', 'um', '', 1, 'Substantiv, ender på um, bestemt form ental, -um erstattes med -et, genitiv'),
('da_DK', 886, 71, 'um', 'er', 'um', '', 7, 'Substantiv, ender på um, ubekendt flertal, -um erstattes med -er'),
('da_DK', 887, 71, 'um', 'ers', 'um', '', 1, 'Substantiv, ender på um, ubekendt flertal, -um erstattes med -er, genitiv'),
('da_DK', 888, 71, 'um', 'erne', 'um', '', 8, 'Substantiv, ender på um, bekendt flertal, -um erstattes med -erne'),
('da_DK', 889, 71, 'um', 'ernes', 'um', '', 1, 'Substantiv, ender på um, bekendt flertal, -um erstattes med -erne, genitiv'),
('da_DK', 890, 72, 'um', 'e', 'um', '', 0, 'Substantiv, ender på um, ental -um erstattes med -e'),
('da_DK', 891, 72, 'um', 'es', 'um', '', 1, 'Substantiv, ender på um, ental -um erstattes med -e, genitiv'),
('da_DK', 892, 15, 'er', 'ret', '[^f]fer', '', 6, 'Substantiv, bestemt form intetkøn med -ret f'),
('da_DK', 893, 15, 'er', 'ret', '[^m]mer', '', 6, 'Substantiv, bestemt form intetkøn med -ret m'),
('da_DK', 894, 15, 'er', 'ret', '[^t]ter', '', 6, 'Substantiv, bestemt form intetkøn med -ret t'),
('da_DK', 895, 15, 'fer', 'ret', 'ffer', '', 6, 'Substantiv, bestemt form intetkøn med -ret ff'),
('da_DK', 896, 15, 'mer', 'ret', 'mmer', '', 6, 'Substantiv, bestemt form intetkøn med -ret mm'),
('da_DK', 897, 15, 'ter', 'ret', 'tter', '', 6, 'Substantiv, bestemt form intetkøn med -ret tt'),
('da_DK', 898, 15, 'er', 'rets', '[^f]fer', '', 1, 'Substantiv, bekendt form intetkøn med -ret, genitiv f'),
('da_DK', 899, 15, 'er', 'rets', '[^m]mer', '', 1, 'Substantiv, bekendt form intetkøn med -ret, genitiv m'),
('da_DK', 900, 15, 'er', 'rets', '[^t]ter', '', 1, 'Substantiv, bekendt form intetkøn med -ret, genitiv t'),
('da_DK', 901, 15, 'fer', 'rets', 'ffer', '', 1, 'Substantiv, bekendt form intetkøn med -ret, genitiv ff'),
('da_DK', 902, 15, 'mer', 'rets', 'mmer', '', 1, 'Substantiv, bekendt form intetkøn med -ret, genitiv mm'),
('da_DK', 903, 15, 'ter', 'rets', 'tter', '', 1, 'Substantiv, bekendt form intetkøn med -ret, genitiv tt'),
('da_DK', 904, 21, 'ere', 'ér', 'ere', '', 11, 'Verbum, svagt bøjet, ender på -ere, -ér imperativ'),
('da_DK', 913, 74, '0', 'ne', '[er]', '', 8, 'Substantiv flertal, bestemt form -ne efter e/r'),
('da_DK', 914, 74, '0', 'nes', '[er]', '', 1, 'Substantiv flertal, bestemt form -ne efter e/r, genitiv'),
('da_DK', 917, 74, '0', 'ene', '[^er]', '', 8, 'Substantiv flertal, bestemt form -ene, ikke efter e/r'),
('da_DK', 918, 74, '0', 'enes', '[^er]', '', 1, 'Substantiv flertal, bestemt form -ene, ikke efter e/r, genitiv'),
('da_DK', 919, 24, '0', 'es', '[^aeouæøå]', '', 1, 'Adjektiv, svagt bøjet uden komparation, flertal, ender ikke på aeouæøå, genitiv'),
('da_DK', 920, 9, '0', '\'s', '[ABCDEFGHIJKLMNOPQRSTUVWXYZÆØÅÖÄ]', '', 0, 'Proprium, genitiv \'s efter stort bogstav'),
('da_DK', 922, 75, '0', '\'en', '.', '', 6, 'Apostrof før endelse, fælleskøn, bestemt form'),
('da_DK', 923, 75, '0', '\'ens', '.', '', 1, 'Apostrof før endelse, fælleskøn, torso, bestemt form, genitiv'),
('da_DK', 924, 75, '0', '\'s', '.', '', 1, 'Apostrof før endelse, genitiv'),
('da_DK', 925, 76, '0', '\'et', '.', '', 6, 'Apostrof før endelse, intetkøn, bestemt form'),
('da_DK', 926, 76, '0', '\'ets', '.', '', 1, 'Apostrof før endelse, intetkøn, bestemt form, gentiv'),
('da_DK', 927, 76, '0', '\'s', '.', '', 1, 'Apostrof før endelse, gentiv'),
('da_DK', 928, 44, '0', 'ens', '[^e]', '', 1, 'Substantiv torso, fælleskøn, bestemt form, gentiv'),
('da_DK', 929, 44, '0', 'ns', 'e', '', 1, 'Substantiv, torso, fælleskøn, bestemt form -n, genitiv'),
('da_DK', 930, 77, 'el', 'le', '[^bcdfghjklmnpqrstvwxz]el', '', 0, 'Adjektiv, -el erstattes med -le, ikke konsonant'),
('da_DK', 931, 77, 'el', 'les', '[^bcdfghjklmnpqrstvwxz]el', '', 1, 'Adjektiv, -el erstattes med -le, ikke konsonant, gentiv'),
('da_DK', 932, 77, 'el', 'le', '[^#]#el', 'KONS', 0, 'Adjektiv, -el erstattes med -le, enkelt-KONS'),
('da_DK', 933, 77, 'el', 'les', '[^#]#el', 'KONS', 1, 'Adjektiv, -el erstattes med -le, enkelt-KONS, genitiv'),
('da_DK', 934, 77, '#el', 'le', '##el', 'KONS', 8, 'Adjektiv, -el erstattes med -le, dobbelt-KONS'),
('da_DK', 935, 77, '#el', 'les', '#el', 'KONS', 1, 'Adjektiv, -el erstattes med -le, dobbelt-KONS, genitiv'),
('da_DK', 936, 78, 'el', 'lere', '[^bcdfghjklmnpqrstvwxz]el', '', 12, 'Adjektiv, -el, komparation, ikke konsonant'),
('da_DK', 937, 78, 'el', 'leres', '[^bcdfghjklmnpqrstvwxz]el', '', 1, 'Adjektiv, -el, komparation, ikke konsonant, genitiv'),
('da_DK', 938, 78, 'el', 'lere', '[^#]#el', 'KONS', 12, 'Adjektiv, -el, komparation, enkelt-KONS'),
('da_DK', 939, 78, 'el', 'leres', '[^#]#el', 'KONS', 1, 'Adjektiv, -el, komparation, enkelt-KONS, genitiv'),
('da_DK', 940, 78, '#el', 'lere', '##el', 'KONS', 12, 'Adjektiv, -el, komparation, dobbelt-KONS'),
('da_DK', 941, 78, '#el', 'leres', '##el', 'KONS', 1, 'Adjektiv, -el, komparation, dobbelt-KONS, genitiv'),
('da_DK', 942, 78, 'el', 'lerest', '[^bcdfghjklmnpqrstvwxz]el', '', 13, 'Adjektiv, -el, superlativ, ikke konsonant'),
('da_DK', 944, 78, 'el', 'leste', '[^bcdfghjklmnpqrstvwxz]el', '', 14, 'Adjektiv, -el, superlativ flertal, ikke konsonant'),
('da_DK', 945, 78, 'el', 'lestes', '[^bcdfghjklmnpqrstvwxz]el', '', 1, 'Adjektiv, -el, superlativ flertal, ikke konsonant, genitiv'),
('da_DK', 946, 78, 'el', 'lest', '[^#]#', 'KONS', 13, 'Adjektiv, -el, superlativ, enkelt-KONS'),
('da_DK', 948, 78, 'el', 'leste', '[^#]#el', 'KONS', 14, 'Adjektiv, -el, superlativ pluralis, enkelt-KONS'),
('da_DK', 949, 78, 'el', 'lestes', '[^#]#el', 'KONS', 1, 'Adjektiv, -el, superlativ pluralis, enkelt-KONS, genitiv'),
('da_DK', 950, 78, '#el', 'lest', '##el', 'KONS', 13, 'Adjektiv, -el, superlativ, dobbelt-KONS'),
('da_DK', 952, 78, '#el', 'leste', '##el', 'KONS', 14, 'Adjektiv, -el, superlativ pluralis, dobbelt-KONS'),
('da_DK', 953, 78, '#el', 'lestes', '##el', 'KONS', 1, 'Adjektiv, -el, superlativ pluralis, dobbelt-KONS, genitiv'),
('da_DK', 954, 20, '#e', 'te', '##e', 'KONS', 4, 'Verbum, svagt bøjet, -te i datid, dobbelt-KONS'),
('da_DK', 955, 20, '#e', 't', '##e', 'KONS', 10, 'Verbum, svagt bøjet, -t i perf.part., dobbelt-KONS'),
('da_DK', 956, 79, '0', 'n', 'e', '', 0, 'Verbalsubtantiv, verbum ender på -e'),
('da_DK', 957, 79, '0', 'ns', 'e', '', 1, 'Verbalsubstantiv, verbum ender på -e, genitiv'),
('da_DK', 958, 79, '0', 'en', '[^e]', '', 0, 'Verbalsubstantiv, verbum ender ikke på -e'),
('da_DK', 959, 79, '0', 'ens', '[^e]', '', 1, 'Verbalsubstantiv, verbum under ikke på -e, genitiv'),
('da_DK', 963, 81, '-', '0', '-', '', 15, 'Præfiks frataget bindestreg'),
('da_DK', 966, 40, '0', 'mere', 'm', '', 12, 'Adjektiv, dobbeltkonsonant (mm), komparativ'),
('da_DK', 968, 40, '0', 'st', '.', '', 13, 'Adjektiv, dobbeltkonsonant (m), superlativ'),
('da_DK', 969, 40, '0', 'ste', '.', '', 14, 'Adjektiv, dobbeltkonsonant (m), superlativ pluralis'),
('da_DK', 971, 40, '0', 'meres', 'm', '', 1, 'Adjektiv, dobbeltkonsonant (mm), komparativ genitiv'),
('da_DK', 973, 40, '0', 'stes', '.', '', 1, 'Adjektiv, dobbeltkonsonant (m), superlativ pluralis genitiv'),
('da_DK', 975, 12, 'en', 'nes', '[^#]#en', 'KONS', 0, 'Adjektiv, -en erstattes af -ne, enkelt-KONS, genitiv'),
('da_DK', 976, 12, '#en', 'ne', '##en', 'KONS', 0, 'Adjektiv, -en erstattes af -ne, dobbelt-KONS'),
('da_DK', 977, 12, '#en', 'nes', '##en', 'KONS', 1, 'Adjektiv, -en erstattes af -ne, dobbelt-KONS, genitiv'),
('da_DK', 978, 82, 'en', 'et', 'en', '', 0, 'Adjektiv, ender på -en, -intetkøn -et'),
('da_DK', 979, 82, 'en', 'ets', 'en', '', 1, 'Adjektiv, ender på -en, intetkøn -et, genitiv'),
('da_DK', 984, 24, '0', 's', '[aeouæøå]', '', 1, 'Adjektiv, svagt bøjet uden komparation, flertal, genitiv, ender på aeouæøå'),
('da_DK', 985, 23, '0', 're', 'e', '', 12, 'Adjektiv, svagt bøjet, komparativ, ender på -e'),
('da_DK', 986, 23, '0', 'res', 'e', '', 1, 'Adjektiv, svagt bøjet, komparativ, ender på -e, genitiv'),
('da_DK', 987, 10, '0', '\'s', '[ABCDEFGHIJKLMNOPQRSTUVWXYZÆØÅÄÖ]', '', 1, 'Genitiv \'s efter stort bogstav'),
('da_DK', 989, 84, 'us', 'et', 'us', '', 6, 'Substantiv, intetkøn, ender på -us, bestemt form ental med -et'),
('da_DK', 994, 85, 'us', 'er', 'us', '', 7, 'Substantiv, intetkøn, ender på -us, ubestemt pluralis med -er'),
('da_DK', 995, 83, '0', 'x', '.', '', 15, 'Sammensætning, punktum - i begyndelsen'),
('da_DK', 996, 83, '0', 'x', '.', '', 15, 'Sammensætning, punktum - midte'),
('da_DK', 997, 41, 'er', 'rest', '[^#]#er', 'KONS', 13, 'Adjektiv, ender på -er, superlativ -rest, enkelt-KONS'),
('da_DK', 998, 41, 'er', 'reste', '[^#]#er', 'KONS', 14, 'Adjektiv, ender på -er, superlativ pluralis -reste, enkelt-KONS'),
('da_DK', 999, 41, 'er', 'restes', '[^#]#er', 'KONS', 1, 'Adjektiv, ender på -er, superlativ pluralis genitiv, -restes, enkelt-KONS'),
('da_DK', 1000, 41, '#er', 're', '##er', 'KONS', 0, 'Adjektiv, ender på -er, pluralis -re, dobbelt-KONS'),
('da_DK', 1001, 41, '#er', 'res', '##er', 'KONS', 1, 'Adjektiv, ender på -er, pluralis genitiv -res, dobbelt-KONS'),
('da_DK', 1002, 41, '#er', 'rere', '##er', 'KONS', 12, 'Adjektiv, ender på -er, komparativ -rere, dobbelt-KONS'),
('da_DK', 1003, 41, '#er', 'reres', '##er', 'KONS', 1, 'Adjektiv, ender på -er, komparativ genitiv -reres, dobbelt-KONS'),
('da_DK', 1004, 41, '#er', 'rest', '##er', 'KONS', 13, 'Adjektiv, ender på -er, superlativ -rest, dobbelt-KONS'),
('da_DK', 1005, 41, '#er', 'reste', '##er', 'KONS', 14, 'Adjektiv, ender på -er, superlativ pluralis -reste, dobbelt-KONS'),
('da_DK', 1007, 41, '#er', 'restes', '##er', 'KONS', 1, 'Adjektiv, ender på -er, superlativ pluralis genitiv -restes, dobbelt-KONS'),
('da_DK', 1008, 84, 'us', 'ets', 'us', '', 1, 'Substantiv, intetkøn, ender på -us, bestemt form ental med -et, genitiv'),
('da_DK', 1009, 85, 'us', 'ers', 'us', '', 1, 'Sustantiv, intetkøn, ender på -us, ubestemt pluralis genitiv med -ers'),
('da_DK', 1010, 85, 'us', 'erne', 'us', '', 8, 'Sustantiv, intetkøn, ender på -us, bestemt pluralis med -erne'),
('da_DK', 1011, 85, 'us', 'ernes', 'us', '', 1, 'Substantiv, intetkøn, ender på -us, bestemt pluralis genitiv med -ernes'),
('da_DK', 1014, 22, '0', 'es', '[iy]', '', 2, 'verbum passiv, ender på -i eller -y'),
('da_DK', 1015, 21, '0', 'er', '[iy]', '', 3, 'Verbum, svagt bøjet, -er efter i eller y'),
('da_DK', 1017, 11, '0', 'rnes', 'e', '', 1, 'Substantiv, bekendt form flertal, med r, genitiv'),
('da_DK', 1019, 21, 'e', '0', '[aeiouyæøå]e', '', 11, 'Verbum, imperativ, vokal'),
('da_DK', 1021, 43, 'en', 'ner', 'en', '', 7, 'Substantiv, ender på -en, flertal -ner, stamme -en fjernes'),
('da_DK', 1022, 43, 'en', 'ners', 'en', '', 1, 'Substantiv, ender på -en, flertal -ner, stamme -en fjernes, genitiv'),
('da_DK', 1023, 43, 'en', 'nerne', 'en', '', 8, 'Substantiv, ender på -en, flertal -ner, stamme -en fjernes, bestemt form'),
('da_DK', 1024, 43, 'en', 'nernes', 'en', '', 1, 'Substantiv, ender på -en, flertal -ner, stamme -en fjernes, bestemt form genitiv'),
('da_DK', 1025, 87, 'en', 'net', 'en', '', 6, 'Substantiv, intetkøn, ender på -en, bestemt form -net (stamme -en fjernes)'),
('da_DK', 1026, 87, 'en', 'nets', 'en', '', 1, 'Substantiv, intetkøn, ender på -en, bestemt form -net (stamme -en fjernes), genitiv'),
('da_DK', 1027, 89, '0', 'næst', '.', '', 0, 'Superlativ næst-'),
('da_DK', 1029, 88, '0', 't', '.', '', 0, 'Sammensætning, fugeelement -t- i begyndelsen'),
('da_DK', 1030, 88, '0', 't', '.', '', 0, 'Sammensætning, fugeelement -t- i midten'),
('da_DK', 1031, 90, '0', 'aller', '.', '', 0, 'Superlativ aller-'),
('da_DK', 1032, 30, '0', 'e-', '.', '', 0, 'Sammensætning, fugeelement e- i begyndelsen'),
('da_DK', 1033, 30, '0', 'e-', '.', '', 0, 'Sammensætning, fugeelement e- i midten'),
('da_DK', 1034, 61, '0', '#e-', '#', 'KONS', 0, 'Sammensætning, fugeelement kons.+e-, i begyndelsen'),
('da_DK', 1035, 61, '0', '#e-', '#', 'KONS', 0, 'Sammensætning, fugeelement kons.+e- i midten'),
('da_DK', 1036, 56, 'e', 's-', '.', '', 0, 'Sammensætning, fugeelement fjern e tilføj s-, i begyndelsen'),
('da_DK', 1037, 56, 'e', 's-', '.', '', 0, 'Sammensætning, fugeelement fjern e tilføj s-, i midten'),
('da_DK', 1038, 93, 'r', '0', 'r', '', 0, 'Sammensætning, fugeelement fjern r, i midten'),
('da_DK', 1039, 93, 'r', '0', 'r', '', 0, 'Sammensætning, fugeelement fjern r, i begyndelsen'),
('da_DK', 1040, 60, '0', 'er-', '.', '', 0, 'Sammensætning, fugeelement er- i begyndelsen'),
('da_DK', 1041, 61, '0', '#e-', '#', 'KONS', 0, 'Sammensætning, fugeelement kons.f.+e-, som afslutning'),
('da_DK', 1044, 68, '0', '#er-', '#', 'KONS', 0, 'Sammensætning, fugeelement kons.f.+er-, i begyndelsen'),
('da_DK', 1045, 55, 'e', '-', 'e', '', 0, 'Sammensætning, fugeelement fjern e, tilføj bindestreg, i begyndelsen'),
('da_DK', 1046, 93, 'r', '-', 'r', '', 0, 'Sammensætning, fugeelement fjern r, tilføj bindestreg, som afslutning'),
('da_DK', 1047, 69, 'um', 'e-', 'um', '', 0, 'Sammensætning, fugeelement fjern um tilføj e-, i begyndelsen'),
('da_DK', 1048, 30, '0', 'e-', '.', '', 0, 'Sammensætning, fugeelement e- som afslutning'),
('da_DK', 1049, 60, '0', 'er-', '.', '', 0, 'Sammensætning, fugeelement er- i midten'),
('da_DK', 1050, 60, '0', 'er-', '.', '', 0, 'Sammensætning, fugeelement er- som afslutning'),
('da_DK', 1051, 55, 'e', '-', 'e', '', 0, 'Sammensætning, fugeelement fjern e, tilføj bindestreg, i midten'),
('da_DK', 1052, 55, 'e', '-', 'e', '', 0, 'Sammensætning, fugeelement fjern e, tilføj bindestreg, som afslutning'),
('da_DK', 1053, 56, 'e', 's-', 'e', '', 0, 'Sammensætning, fugeelement fjern e tilføj s-, som afslutning'),
('da_DK', 1054, 69, 'um', 'e-', 'um', '', 0, 'Sammensætning, fugeelement fjern um tilføj e-, i midten'),
('da_DK', 1055, 69, 'um', 'e-', 'um', '', 0, 'Sammensætning, fugeelement fjern um, tilføj e-, som afslutning'),
('da_DK', 1056, 68, '0', '#er-', '#', 'KONS', 0, 'Sammensætning, fugeelement kons.f.+er-, i midten'),
('da_DK', 1057, 68, '0', '#er-', '#', 'KONS', 0, 'Sammensætning, fugeelement kons.f.+er-, som afslutning'),
('da_DK', 1058, 93, 'r', '-', 'r', '', 0, 'Sammensætning, fugeelement fjern r, tilføj bindestreg, i starten'),
('da_DK', 1059, 93, 'r', '-', 'r', '', 0, 'Sammensætning, fugeelement fjern r, tilføj bindestreg, i midten'),
('da_DK', 1060, 95, 'er', 're', 'er', '', 15, 'Sammensætning, fugeelement fjern er, tilføj re, i begyndelsen'),
('da_DK', 1061, 95, 'er', 're', 'er', '', 15, 'Sammensætning, fugeelement fjern er, tilføj re, i midten');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `affixrule_to_affixclass`
--

CREATE TABLE `affixrule_to_affixclass` (
  `lang` enum('da_DK') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `affixruleid` int UNSIGNED NOT NULL,
  `affixclassid` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Data dump for tabellen `affixrule_to_affixclass`
--

INSERT INTO `affixrule_to_affixclass` (`lang`, `id`, `affixruleid`, `affixclassid`) VALUES
('da_DK', 43, 54, 22),
('da_DK', 73, 150, 8),
('da_DK', 96, 114, 8),
('da_DK', 127, 114, 5),
('da_DK', 187, 1, 11),
('da_DK', 200, 25, 11),
('da_DK', 236, 150, 2),
('da_DK', 261, 25, 2),
('da_DK', 291, 114, 4),
('da_DK', 315, 1, 4),
('da_DK', 324, 1, 8),
('da_DK', 337, 25, 8),
('da_DK', 349, 150, 5),
('da_DK', 369, 190, 10),
('da_DK', 370, 189, 10),
('da_DK', 372, 191, 10),
('da_DK', 373, 192, 10),
('da_DK', 375, 199, 35),
('da_DK', 377, 200, 32),
('da_DK', 378, 201, 33),
('da_DK', 379, 200, 35),
('da_DK', 380, 201, 35),
('da_DK', 381, 200, 36),
('da_DK', 382, 201, 36),
('da_DK', 383, 203, 32),
('da_DK', 384, 204, 33),
('da_DK', 385, 208, 35),
('da_DK', 386, 203, 36),
('da_DK', 387, 204, 36),
('da_DK', 388, 22, 34),
('da_DK', 389, 203, 35),
('da_DK', 390, 204, 35),
('da_DK', 391, 206, 32),
('da_DK', 392, 206, 36),
('da_DK', 393, 206, 35),
('da_DK', 394, 207, 33),
('da_DK', 395, 207, 36),
('da_DK', 396, 207, 35),
('da_DK', 397, 208, 34),
('da_DK', 398, 45, 34),
('da_DK', 399, 43, 34),
('da_DK', 400, 24, 34),
('da_DK', 401, 19, 34),
('da_DK', 402, 23, 34),
('da_DK', 403, 270, 34),
('da_DK', 404, 21, 34),
('da_DK', 405, 39, 34),
('da_DK', 406, 31, 34),
('da_DK', 408, 37, 34),
('da_DK', 410, 26, 34),
('da_DK', 411, 17, 34),
('da_DK', 412, 48, 34),
('da_DK', 414, 49, 34),
('da_DK', 415, 50, 34),
('da_DK', 416, 53, 34),
('da_DK', 417, 51, 34),
('da_DK', 418, 54, 34),
('da_DK', 419, 52, 34),
('da_DK', 420, 55, 34),
('da_DK', 421, 56, 34),
('da_DK', 422, 190, 34),
('da_DK', 423, 189, 34),
('da_DK', 424, 191, 34),
('da_DK', 425, 192, 34),
('da_DK', 427, 188, 34),
('da_DK', 429, 195, 34),
('da_DK', 431, 187, 34),
('da_DK', 432, 182, 34),
('da_DK', 433, 184, 34),
('da_DK', 434, 185, 34),
('da_DK', 435, 186, 34),
('da_DK', 476, 228, 34),
('da_DK', 478, 229, 34),
('da_DK', 480, 230, 34),
('da_DK', 481, 205, 34),
('da_DK', 485, 231, 34),
('da_DK', 487, 234, 34),
('da_DK', 489, 233, 34),
('da_DK', 490, 235, 8),
('da_DK', 491, 235, 38),
('da_DK', 533, 267, 10),
('da_DK', 534, 268, 10),
('da_DK', 535, 271, 34),
('da_DK', 537, 274, 34),
('da_DK', 538, 273, 34),
('da_DK', 539, 276, 34),
('da_DK', 540, 275, 34),
('da_DK', 541, 20, 34),
('da_DK', 542, 32, 34),
('da_DK', 543, 277, 34),
('da_DK', 544, 278, 34),
('da_DK', 546, 281, 34),
('da_DK', 547, 282, 34),
('da_DK', 548, 283, 34),
('da_DK', 549, 284, 34),
('da_DK', 550, 7, 34),
('da_DK', 551, 269, 34),
('da_DK', 552, 285, 34),
('da_DK', 565, 288, 34),
('da_DK', 571, 310, 8),
('da_DK', 590, 291, 8),
('da_DK', 591, 291, 46),
('da_DK', 610, 310, 46),
('da_DK', 629, 310, 4),
('da_DK', 648, 291, 2),
('da_DK', 667, 330, 34),
('da_DK', 669, 329, 34),
('da_DK', 670, 329, 22),
('da_DK', 671, 289, 34),
('da_DK', 672, 290, 34),
('da_DK', 673, 331, 34),
('da_DK', 675, 30, 34),
('da_DK', 676, 332, 34),
('da_DK', 680, 339, 34),
('da_DK', 684, 340, 34),
('da_DK', 688, 261, 34),
('da_DK', 689, 258, 34),
('da_DK', 691, 263, 34),
('da_DK', 692, 256, 34),
('da_DK', 693, 265, 34),
('da_DK', 694, 266, 34),
('da_DK', 695, 267, 34),
('da_DK', 696, 268, 34),
('da_DK', 697, 344, 8),
('da_DK', 698, 345, 8),
('da_DK', 699, 344, 2),
('da_DK', 700, 344, 11),
('da_DK', 701, 345, 4),
('da_DK', 702, 345, 11),
('da_DK', 703, 344, 10),
('da_DK', 704, 345, 10),
('da_DK', 705, 346, 32),
('da_DK', 706, 346, 35),
('da_DK', 707, 347, 33),
('da_DK', 708, 347, 35),
('da_DK', 713, 349, 34),
('da_DK', 752, 150, 35),
('da_DK', 775, 114, 35),
('da_DK', 805, 1, 35),
('da_DK', 818, 25, 35),
('da_DK', 848, 235, 35),
('da_DK', 886, 310, 35),
('da_DK', 905, 291, 35),
('da_DK', 906, 344, 35),
('da_DK', 907, 345, 35),
('da_DK', 909, 350, 9),
('da_DK', 910, 351, 9),
('da_DK', 911, 352, 9),
('da_DK', 912, 353, 9),
('da_DK', 913, 354, 9),
('da_DK', 914, 355, 9),
('da_DK', 915, 356, 9),
('da_DK', 916, 357, 9),
('da_DK', 917, 358, 9),
('da_DK', 918, 359, 9),
('da_DK', 919, 360, 9),
('da_DK', 920, 361, 9),
('da_DK', 921, 362, 9),
('da_DK', 922, 363, 9),
('da_DK', 923, 364, 9),
('da_DK', 924, 365, 9),
('da_DK', 925, 366, 9),
('da_DK', 926, 367, 9),
('da_DK', 927, 368, 9),
('da_DK', 928, 369, 9),
('da_DK', 929, 370, 9),
('da_DK', 930, 371, 9),
('da_DK', 931, 372, 9),
('da_DK', 932, 373, 9),
('da_DK', 933, 374, 9),
('da_DK', 934, 375, 9),
('da_DK', 935, 376, 9),
('da_DK', 936, 377, 9),
('da_DK', 937, 378, 9),
('da_DK', 938, 379, 9),
('da_DK', 939, 380, 9),
('da_DK', 940, 381, 9),
('da_DK', 941, 382, 9),
('da_DK', 942, 383, 9),
('da_DK', 943, 384, 9),
('da_DK', 944, 385, 9),
('da_DK', 945, 386, 9),
('da_DK', 946, 387, 9),
('da_DK', 947, 388, 9),
('da_DK', 948, 389, 9),
('da_DK', 949, 390, 9),
('da_DK', 950, 391, 9),
('da_DK', 951, 392, 9),
('da_DK', 952, 393, 9),
('da_DK', 953, 394, 9),
('da_DK', 954, 395, 9),
('da_DK', 955, 396, 9),
('da_DK', 956, 397, 9),
('da_DK', 957, 398, 9),
('da_DK', 958, 399, 9),
('da_DK', 959, 400, 9),
('da_DK', 960, 401, 9),
('da_DK', 961, 402, 9),
('da_DK', 962, 403, 9),
('da_DK', 963, 404, 9),
('da_DK', 964, 405, 9),
('da_DK', 965, 406, 9),
('da_DK', 966, 407, 9),
('da_DK', 967, 408, 9),
('da_DK', 968, 409, 9),
('da_DK', 969, 410, 9),
('da_DK', 970, 411, 9),
('da_DK', 971, 412, 9),
('da_DK', 972, 413, 9),
('da_DK', 973, 414, 9),
('da_DK', 974, 415, 9),
('da_DK', 975, 416, 9),
('da_DK', 976, 417, 9),
('da_DK', 977, 418, 9),
('da_DK', 978, 419, 9),
('da_DK', 979, 420, 9),
('da_DK', 980, 421, 9),
('da_DK', 981, 422, 9),
('da_DK', 982, 423, 9),
('da_DK', 983, 424, 9),
('da_DK', 984, 425, 9),
('da_DK', 985, 426, 9),
('da_DK', 986, 427, 9),
('da_DK', 987, 428, 9),
('da_DK', 988, 429, 9),
('da_DK', 989, 430, 9),
('da_DK', 990, 431, 9),
('da_DK', 991, 432, 9),
('da_DK', 992, 433, 9),
('da_DK', 993, 434, 9),
('da_DK', 994, 435, 9),
('da_DK', 995, 436, 9),
('da_DK', 996, 437, 9),
('da_DK', 997, 438, 9),
('da_DK', 998, 439, 9),
('da_DK', 999, 440, 9),
('da_DK', 1000, 441, 9),
('da_DK', 1001, 442, 9),
('da_DK', 1002, 443, 9),
('da_DK', 1003, 444, 9),
('da_DK', 1004, 445, 9),
('da_DK', 1005, 446, 9),
('da_DK', 1006, 447, 9),
('da_DK', 1007, 448, 9),
('da_DK', 1008, 449, 9),
('da_DK', 1009, 450, 9),
('da_DK', 1010, 451, 9),
('da_DK', 1011, 452, 9),
('da_DK', 1012, 453, 9),
('da_DK', 1013, 454, 9),
('da_DK', 1014, 455, 9),
('da_DK', 1015, 456, 9),
('da_DK', 1016, 457, 9),
('da_DK', 1017, 458, 9),
('da_DK', 1018, 459, 9),
('da_DK', 1019, 460, 9),
('da_DK', 1020, 461, 9),
('da_DK', 1021, 462, 9),
('da_DK', 1022, 463, 9),
('da_DK', 1023, 464, 9),
('da_DK', 1024, 465, 9),
('da_DK', 1025, 466, 9),
('da_DK', 1026, 467, 9),
('da_DK', 1027, 468, 9),
('da_DK', 1028, 469, 9),
('da_DK', 1029, 470, 9),
('da_DK', 1030, 471, 9),
('da_DK', 1031, 472, 9),
('da_DK', 1032, 473, 9),
('da_DK', 1033, 474, 9),
('da_DK', 1034, 475, 9),
('da_DK', 1035, 476, 9),
('da_DK', 1036, 477, 9),
('da_DK', 1037, 478, 9),
('da_DK', 1038, 479, 9),
('da_DK', 1039, 480, 9),
('da_DK', 1040, 481, 9),
('da_DK', 1041, 482, 9),
('da_DK', 1042, 483, 9),
('da_DK', 1043, 484, 9),
('da_DK', 1044, 485, 9),
('da_DK', 1045, 486, 9),
('da_DK', 1046, 487, 9),
('da_DK', 1047, 488, 9),
('da_DK', 1048, 489, 9),
('da_DK', 1049, 490, 9),
('da_DK', 1050, 491, 9),
('da_DK', 1051, 492, 9),
('da_DK', 1052, 493, 9),
('da_DK', 1053, 494, 9),
('da_DK', 1054, 495, 9),
('da_DK', 1055, 496, 9),
('da_DK', 1056, 497, 9),
('da_DK', 1057, 498, 9),
('da_DK', 1058, 499, 9),
('da_DK', 1059, 500, 9),
('da_DK', 1060, 501, 9),
('da_DK', 1061, 502, 9),
('da_DK', 1062, 503, 9),
('da_DK', 1063, 504, 9),
('da_DK', 1064, 505, 9),
('da_DK', 1065, 506, 9),
('da_DK', 1066, 507, 9),
('da_DK', 1067, 508, 9),
('da_DK', 1068, 509, 9),
('da_DK', 1069, 510, 9),
('da_DK', 1070, 511, 9),
('da_DK', 1071, 512, 9),
('da_DK', 1072, 513, 9),
('da_DK', 1073, 514, 9),
('da_DK', 1074, 515, 9),
('da_DK', 1075, 516, 9),
('da_DK', 1076, 517, 9),
('da_DK', 1077, 518, 9),
('da_DK', 1078, 519, 9),
('da_DK', 1079, 520, 9),
('da_DK', 1080, 521, 9),
('da_DK', 1081, 522, 9),
('da_DK', 1082, 523, 9),
('da_DK', 1083, 524, 9),
('da_DK', 1084, 525, 9),
('da_DK', 1085, 526, 9),
('da_DK', 1086, 527, 9),
('da_DK', 1087, 528, 9),
('da_DK', 1088, 529, 9),
('da_DK', 1089, 530, 9),
('da_DK', 1090, 531, 9),
('da_DK', 1091, 532, 9),
('da_DK', 1092, 533, 9),
('da_DK', 1093, 534, 9),
('da_DK', 1094, 535, 9),
('da_DK', 1095, 536, 9),
('da_DK', 1096, 537, 9),
('da_DK', 1097, 538, 9),
('da_DK', 1098, 539, 9),
('da_DK', 1099, 540, 9),
('da_DK', 1100, 541, 9),
('da_DK', 1101, 542, 9),
('da_DK', 1102, 543, 9),
('da_DK', 1103, 544, 9),
('da_DK', 1104, 545, 9),
('da_DK', 1105, 546, 9),
('da_DK', 1106, 547, 9),
('da_DK', 1107, 548, 9),
('da_DK', 1108, 549, 9),
('da_DK', 1109, 550, 9),
('da_DK', 1110, 551, 9),
('da_DK', 1111, 552, 9),
('da_DK', 1112, 553, 9),
('da_DK', 1113, 554, 9),
('da_DK', 1114, 555, 9),
('da_DK', 1115, 556, 9),
('da_DK', 1116, 557, 9),
('da_DK', 1117, 558, 9),
('da_DK', 1118, 559, 9),
('da_DK', 1119, 560, 9),
('da_DK', 1120, 561, 9),
('da_DK', 1121, 562, 9),
('da_DK', 1122, 563, 9),
('da_DK', 1123, 564, 9),
('da_DK', 1124, 565, 9),
('da_DK', 1125, 566, 9),
('da_DK', 1126, 567, 9),
('da_DK', 1127, 568, 9),
('da_DK', 1128, 569, 9),
('da_DK', 1129, 570, 9),
('da_DK', 1130, 571, 9),
('da_DK', 1131, 572, 9),
('da_DK', 1132, 573, 9),
('da_DK', 1133, 574, 9),
('da_DK', 1134, 575, 9),
('da_DK', 1135, 576, 9),
('da_DK', 1136, 577, 9),
('da_DK', 1137, 578, 9),
('da_DK', 1138, 579, 9),
('da_DK', 1139, 580, 9),
('da_DK', 1140, 581, 9),
('da_DK', 1141, 582, 9),
('da_DK', 1142, 583, 9),
('da_DK', 1143, 584, 9),
('da_DK', 1144, 585, 9),
('da_DK', 1145, 586, 9),
('da_DK', 1146, 587, 9),
('da_DK', 1147, 588, 9),
('da_DK', 1148, 589, 9),
('da_DK', 1149, 590, 9),
('da_DK', 1150, 591, 9),
('da_DK', 1151, 592, 9),
('da_DK', 1152, 593, 9),
('da_DK', 1153, 594, 9),
('da_DK', 1154, 595, 9),
('da_DK', 1155, 596, 9),
('da_DK', 1156, 597, 9),
('da_DK', 1157, 598, 9),
('da_DK', 1158, 599, 9),
('da_DK', 1159, 600, 9),
('da_DK', 1160, 601, 9),
('da_DK', 1161, 602, 9),
('da_DK', 1162, 603, 9),
('da_DK', 1163, 604, 9),
('da_DK', 1164, 605, 9),
('da_DK', 1165, 606, 9),
('da_DK', 1166, 607, 9),
('da_DK', 1167, 608, 9),
('da_DK', 1168, 609, 9),
('da_DK', 1169, 610, 9),
('da_DK', 1170, 613, 36),
('da_DK', 1171, 675, 32),
('da_DK', 1172, 613, 35),
('da_DK', 1173, 611, 36),
('da_DK', 1174, 611, 33),
('da_DK', 1175, 612, 36),
('da_DK', 1176, 612, 32),
('da_DK', 1177, 612, 35),
('da_DK', 1178, 614, 36),
('da_DK', 1179, 614, 33),
('da_DK', 1180, 614, 35),
('da_DK', 1181, 613, 32),
('da_DK', 1182, 615, 34),
('da_DK', 1183, 615, 10),
('da_DK', 1222, 635, 34),
('da_DK', 1223, 635, 10),
('da_DK', 1262, 675, 35),
('da_DK', 1263, 675, 36),
('da_DK', 1264, 676, 36),
('da_DK', 1265, 676, 33),
('da_DK', 1266, 676, 35),
('da_DK', 1270, 679, 36),
('da_DK', 1271, 679, 33),
('da_DK', 1272, 679, 35),
('da_DK', 1275, 677, 36),
('da_DK', 1276, 677, 32),
('da_DK', 1277, 677, 35),
('da_DK', 1328, 697, 34),
('da_DK', 1329, 698, 34),
('da_DK', 1330, 699, 34),
('da_DK', 1349, 655, 10),
('da_DK', 1351, 700, 34),
('da_DK', 1352, 702, 34),
('da_DK', 1353, 701, 34),
('da_DK', 1354, 703, 34),
('da_DK', 1358, 718, 34),
('da_DK', 1362, 714, 34),
('da_DK', 1363, 709, 34),
('da_DK', 1365, 708, 34),
('da_DK', 1369, 704, 34),
('da_DK', 1370, 712, 34),
('da_DK', 1371, 720, 34),
('da_DK', 1372, 729, 34),
('da_DK', 1374, 735, 34),
('da_DK', 1376, 741, 34),
('da_DK', 1377, 747, 34),
('da_DK', 1397, 721, 34),
('da_DK', 1398, 777, 34),
('da_DK', 1402, 789, 34),
('da_DK', 1412, 728, 34),
('da_DK', 1413, 727, 34),
('da_DK', 1414, 726, 34),
('da_DK', 1415, 725, 34),
('da_DK', 1416, 723, 34),
('da_DK', 1431, 771, 34),
('da_DK', 1432, 765, 34),
('da_DK', 1433, 801, 34),
('da_DK', 1434, 803, 34),
('da_DK', 1435, 805, 34),
('da_DK', 1436, 807, 34),
('da_DK', 1449, 759, 34),
('da_DK', 1451, 722, 34),
('da_DK', 1454, 753, 34),
('da_DK', 1463, 611, 35),
('da_DK', 1480, 847, 34),
('da_DK', 1496, 861, 34),
('da_DK', 1500, 712, 34),
('da_DK', 1502, 867, 34),
('da_DK', 1504, 869, 34),
('da_DK', 1528, 830, 36),
('da_DK', 1529, 830, 32),
('da_DK', 1530, 830, 35),
('da_DK', 1531, 883, 36),
('da_DK', 1532, 883, 33),
('da_DK', 1533, 883, 35),
('da_DK', 1534, 884, 34),
('da_DK', 1535, 885, 34),
('da_DK', 1536, 888, 34),
('da_DK', 1537, 889, 34),
('da_DK', 1538, 886, 34),
('da_DK', 1539, 887, 34),
('da_DK', 1540, 890, 34),
('da_DK', 1541, 891, 34),
('da_DK', 1542, 898, 34),
('da_DK', 1543, 901, 34),
('da_DK', 1544, 899, 34),
('da_DK', 1545, 902, 34),
('da_DK', 1546, 900, 34),
('da_DK', 1547, 903, 34),
('da_DK', 1548, 892, 34),
('da_DK', 1549, 895, 34),
('da_DK', 1550, 893, 34),
('da_DK', 1551, 896, 34),
('da_DK', 1552, 897, 34),
('da_DK', 1553, 894, 34),
('da_DK', 1575, 809, 32),
('da_DK', 1576, 809, 35),
('da_DK', 1577, 809, 36),
('da_DK', 1578, 810, 36),
('da_DK', 1579, 810, 33),
('da_DK', 1580, 810, 35),
('da_DK', 1587, 917, 34),
('da_DK', 1589, 913, 34),
('da_DK', 1590, 914, 34),
('da_DK', 1591, 918, 34),
('da_DK', 1594, 150, 34),
('da_DK', 1595, 25, 34),
('da_DK', 1597, 291, 34),
('da_DK', 1598, 114, 34),
('da_DK', 1599, 1, 34),
('da_DK', 1601, 310, 34),
('da_DK', 1603, 919, 34),
('da_DK', 1610, 928, 34),
('da_DK', 1611, 929, 34),
('da_DK', 1612, 655, 34),
('da_DK', 1614, 235, 34),
('da_DK', 1615, 930, 34),
('da_DK', 1616, 931, 34),
('da_DK', 1617, 932, 34),
('da_DK', 1618, 933, 34),
('da_DK', 1619, 934, 34),
('da_DK', 1620, 935, 34),
('da_DK', 1621, 936, 34),
('da_DK', 1622, 937, 34),
('da_DK', 1623, 938, 34),
('da_DK', 1624, 939, 34),
('da_DK', 1625, 940, 34),
('da_DK', 1626, 941, 34),
('da_DK', 1627, 942, 34),
('da_DK', 1629, 944, 34),
('da_DK', 1630, 945, 34),
('da_DK', 1631, 946, 34),
('da_DK', 1633, 948, 34),
('da_DK', 1634, 949, 34),
('da_DK', 1635, 950, 34),
('da_DK', 1637, 952, 34),
('da_DK', 1638, 953, 34),
('da_DK', 1640, 954, 34),
('da_DK', 1642, 955, 34),
('da_DK', 1648, 963, 32),
('da_DK', 1651, 966, 34),
('da_DK', 1653, 968, 34),
('da_DK', 1654, 969, 34),
('da_DK', 1656, 971, 34),
('da_DK', 1658, 973, 34),
('da_DK', 1662, 975, 34),
('da_DK', 1663, 976, 34),
('da_DK', 1664, 977, 34),
('da_DK', 1665, 978, 34),
('da_DK', 1666, 979, 34),
('da_DK', 1670, 963, 35),
('da_DK', 1671, 963, 36),
('da_DK', 1673, 984, 34),
('da_DK', 1674, 985, 34),
('da_DK', 1676, 986, 34),
('da_DK', 1678, 989, 34),
('da_DK', 1693, 193, 34),
('da_DK', 1694, 994, 34),
('da_DK', 1698, 996, 33),
('da_DK', 1699, 996, 35),
('da_DK', 1700, 996, 36),
('da_DK', 1702, 997, 34),
('da_DK', 1703, 998, 34),
('da_DK', 1704, 999, 34),
('da_DK', 1705, 1000, 34),
('da_DK', 1706, 1001, 34),
('da_DK', 1707, 1002, 34),
('da_DK', 1708, 1003, 34),
('da_DK', 1709, 1004, 34),
('da_DK', 1710, 1005, 34),
('da_DK', 1712, 1007, 34),
('da_DK', 1714, 995, 32),
('da_DK', 1715, 995, 36),
('da_DK', 1716, 995, 35),
('da_DK', 1718, 1008, 34),
('da_DK', 1719, 1009, 34),
('da_DK', 1720, 1010, 34),
('da_DK', 1721, 1011, 34),
('da_DK', 1726, 1014, 34),
('da_DK', 1727, 1015, 34),
('da_DK', 1728, 51, 22),
('da_DK', 1729, 330, 22),
('da_DK', 1730, 331, 22),
('da_DK', 1731, 349, 22),
('da_DK', 1732, 55, 22),
('da_DK', 1733, 56, 22),
('da_DK', 1734, 954, 22),
('da_DK', 1735, 955, 22),
('da_DK', 1738, 987, 34),
('da_DK', 1740, 1017, 34),
('da_DK', 1745, 1021, 34),
('da_DK', 1746, 1022, 34),
('da_DK', 1747, 1023, 34),
('da_DK', 1748, 1024, 34),
('da_DK', 1749, 1025, 34),
('da_DK', 1750, 1026, 34),
('da_DK', 1758, 1029, 32),
('da_DK', 1759, 1029, 36),
('da_DK', 1760, 1029, 35),
('da_DK', 1761, 1030, 33),
('da_DK', 1762, 1030, 36),
('da_DK', 1763, 1030, 35),
('da_DK', 1764, 968, 89),
('da_DK', 1765, 969, 89),
('da_DK', 1767, 973, 89),
('da_DK', 1768, 968, 90),
('da_DK', 1769, 969, 90),
('da_DK', 1771, 973, 90),
('da_DK', 1772, 942, 90),
('da_DK', 1773, 942, 89),
('da_DK', 1774, 944, 90),
('da_DK', 1775, 944, 89),
('da_DK', 1776, 945, 90),
('da_DK', 1777, 945, 89),
('da_DK', 1778, 946, 90),
('da_DK', 1779, 946, 89),
('da_DK', 1780, 948, 90),
('da_DK', 1781, 948, 89),
('da_DK', 1782, 949, 90),
('da_DK', 1783, 949, 89),
('da_DK', 1784, 950, 90),
('da_DK', 1785, 950, 89),
('da_DK', 1786, 952, 90),
('da_DK', 1787, 952, 89),
('da_DK', 1788, 953, 90),
('da_DK', 1789, 953, 89),
('da_DK', 1790, 997, 90),
('da_DK', 1791, 997, 89),
('da_DK', 1792, 998, 90),
('da_DK', 1793, 998, 89),
('da_DK', 1794, 999, 90),
('da_DK', 1795, 999, 89),
('da_DK', 1802, 1004, 90),
('da_DK', 1803, 1004, 89),
('da_DK', 1804, 1005, 90),
('da_DK', 1805, 1005, 89),
('da_DK', 1806, 1007, 90),
('da_DK', 1807, 1007, 89),
('da_DK', 1808, 233, 90),
('da_DK', 1809, 233, 89),
('da_DK', 1810, 234, 90),
('da_DK', 1811, 234, 89),
('da_DK', 1812, 256, 90),
('da_DK', 1813, 256, 89),
('da_DK', 1814, 185, 90),
('da_DK', 1815, 185, 89),
('da_DK', 1816, 186, 90),
('da_DK', 1817, 186, 89),
('da_DK', 1818, 263, 90),
('da_DK', 1819, 263, 89),
('da_DK', 1822, 1032, 32),
('da_DK', 1823, 1032, 35),
('da_DK', 1825, 1033, 33),
('da_DK', 1826, 1033, 35),
('da_DK', 1829, 1034, 32),
('da_DK', 1830, 1034, 35),
('da_DK', 1831, 1035, 36),
('da_DK', 1832, 1035, 33),
('da_DK', 1833, 1035, 35),
('da_DK', 1835, 1036, 32),
('da_DK', 1836, 1036, 35),
('da_DK', 1838, 1037, 33),
('da_DK', 1839, 1037, 35),
('da_DK', 1840, 1038, 33),
('da_DK', 1841, 1038, 36),
('da_DK', 1842, 1038, 35),
('da_DK', 1843, 1039, 32),
('da_DK', 1844, 1039, 36),
('da_DK', 1845, 1039, 35),
('da_DK', 1850, 904, 34),
('da_DK', 1852, 1041, 34),
('da_DK', 1857, 1046, 34),
('da_DK', 1859, 1048, 34),
('da_DK', 1861, 1040, 32),
('da_DK', 1862, 1049, 33),
('da_DK', 1863, 1049, 35),
('da_DK', 1864, 1050, 34),
('da_DK', 1866, 1045, 32),
('da_DK', 1867, 1045, 35),
('da_DK', 1868, 1051, 33),
('da_DK', 1869, 1051, 35),
('da_DK', 1870, 1052, 34),
('da_DK', 1872, 1053, 34),
('da_DK', 1874, 1040, 35),
('da_DK', 1875, 1047, 32),
('da_DK', 1876, 1047, 35),
('da_DK', 1877, 1054, 33),
('da_DK', 1878, 1054, 39),
('da_DK', 1879, 1055, 34),
('da_DK', 1882, 1044, 32),
('da_DK', 1883, 1044, 35),
('da_DK', 1884, 1056, 33),
('da_DK', 1885, 1056, 35),
('da_DK', 1886, 1057, 34),
('da_DK', 1890, 1058, 32),
('da_DK', 1891, 1058, 35),
('da_DK', 1892, 1059, 33),
('da_DK', 1893, 1059, 35),
('da_DK', 1894, 1060, 32),
('da_DK', 1895, 1060, 36),
('da_DK', 1896, 1060, 35),
('da_DK', 1897, 1061, 33),
('da_DK', 1898, 1061, 35),
('da_DK', 1899, 1061, 36);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `fugeelement`
--

CREATE TABLE `fugeelement` (
  `lang` enum('da_DK') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `fugeelement` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Data dump for tabellen `fugeelement`
--

INSERT INTO `fugeelement` (`lang`, `id`, `fugeelement`) VALUES
('da_DK', 1, 'Ø'),
('da_DK', 2, 's'),
('da_DK', 3, 'e'),
('da_DK', 4, 'er'),
('da_DK', 5, 'Konsonantfordobling+e'),
('da_DK', 6, 'Ø el. kons.f.+e'),
('da_DK', 7, '-'),
('da_DK', 8, 'Fjern e'),
('da_DK', 9, 'Fjern e tilføj s'),
('da_DK', 11, 'Ø el. s'),
('da_DK', 12, 'Ø el. e'),
('da_DK', 13, 'Konsonantfordobling+er'),
('da_DK', 14, 'Fjern um tilføj e'),
('da_DK', 15, ' '),
('da_DK', 17, 'e el. s'),
('da_DK', 18, 't'),
('da_DK', 21, 'Fjern r'),
('da_DK', 22, 'Fjern er, tilføj re');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `fugeelement_to_affixclass`
--

CREATE TABLE `fugeelement_to_affixclass` (
  `lang` enum('da_DK') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `fugeelementid` int UNSIGNED NOT NULL,
  `affixclassid` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Data dump for tabellen `fugeelement_to_affixclass`
--

INSERT INTO `fugeelement_to_affixclass` (`lang`, `id`, `fugeelementid`, `affixclassid`) VALUES
('da_DK', 1, 7, 37),
('da_DK', 3, 3, 30),
('da_DK', 4, 4, 60),
('da_DK', 5, 8, 55),
('da_DK', 6, 9, 56),
('da_DK', 7, 5, 61),
('da_DK', 8, 13, 68),
('da_DK', 9, 2, 29),
('da_DK', 10, 1, 31),
('da_DK', 15, 14, 69),
('da_DK', 18, 17, 30),
('da_DK', 19, 17, 29),
('da_DK', 21, 18, 88),
('da_DK', 27, 21, 93),
('da_DK', 28, 12, 31),
('da_DK', 29, 12, 30),
('da_DK', 30, 6, 31),
('da_DK', 31, 6, 61),
('da_DK', 32, 11, 31),
('da_DK', 33, 11, 29),
('da_DK', 34, 22, 95);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `ip2location_db1`
--

CREATE TABLE `ip2location_db1` (
  `ip_from` int UNSIGNED DEFAULT NULL,
  `ip_to` int UNSIGNED DEFAULT NULL,
  `country_code` char(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `country_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `morphdescr`
--

CREATE TABLE `morphdescr` (
  `lang` enum('da_DK') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `morphdescr` varchar(30) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Data dump for tabellen `morphdescr`
--

INSERT INTO `morphdescr` (`lang`, `id`, `morphdescr`) VALUES
('da_DK', 0, ''),
('da_DK', 1, 'GENITIV'),
('da_DK', 2, 'PASSIV'),
('da_DK', 3, 'NUTID'),
('da_DK', 4, 'DATID'),
('da_DK', 5, 'PRÆSENS_PART'),
('da_DK', 6, 'BESTEMT_ENTAL'),
('da_DK', 7, 'PLUR_UBEK'),
('da_DK', 8, 'PLUR_BEK'),
('da_DK', 9, 'KONSONANT_FORDOBLING'),
('da_DK', 10, 'PERF_PART'),
('da_DK', 11, 'IMPERATIV'),
('da_DK', 12, 'KOMPARATIV'),
('da_DK', 13, 'SUPERLATIV'),
('da_DK', 14, 'SUPERLATIV_PLURALIS'),
('da_DK', 15, 'FUGNING'),
('da_DK', 16, 'ORD_SIDST');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `organizations`
--

CREATE TABLE `organizations` (
  `lang` enum('da_DK','en_US') NOT NULL,
  `org_id` int UNSIGNED NOT NULL,
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
  `lang` enum('da_DK') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `start_definitions` longtext COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Data dump for tabellen `start_definitions`
--

INSERT INTO `start_definitions` (`lang`, `id`, `start_definitions`) VALUES
('da_DK', 49, '#B. Ord-sammensætninger #########\n\n#Bindestreg og punktum kan indgå i ord (ifølge hunspell-manual kun vigtigt for kommandolinjetjek)\nWORDCHARS -.\n\n#Ord ned til 2 bogstaver kan indgå i sammensætning. Default er mindst 3 bogstaver.\n#Med et minimum på 2 bogstaver kan præfikser som af-, de-, ur- fungere,\n#og H.C. Andersen (snarere end H. C. Andersen med mellemrum mellem initialerne) kan accepteres\n#af stavekontrollen, når de enkelte initialer inkl. punktum (A., B., C., osv.) er lagt ind med mulighed for\n#sammenføjning.\n#Enkeltbogstav-præfikser som u-, og enkeltbogstav-ord som ø og å kan kun indgå i sammensætninger, \n#hvis minimum sættes til 1 bogstav, men prisen er så, at ethvert u, ø og å kan sættes foran ethvert ord,\n#og ø og å kan sættes efter ethvert ord.\nCOMPOUNDMIN 2\n\n#Op til 10 ord i sammensætninger.\nCOMPOUNDWORDMAX 10\n\n#Tjek ordsammensætninger mod REP-listen over erstatningsforslag. Hvis ordsammensætningen med en \n#erstatning kan blive til et ord, som findes i ordbogen, så er det sandsynligvis en stavefejl. \n#(Tjekket gælder kun nye sammensætninger, konstrueret ud fra ordbogens ord - hvis et sammensat ord \n#er lagt ind i ordbogen, så er det naturligvis et gyldigt ord.)\nCHECKCOMPOUNDREP'),
('da_DK', 59, '#A. Intro ##########\n#Stavekontrolden version ___VERSION___\n#Denne fil er en del af Stavekontrolden - et softwareprodukt, der gør det muligt at stavekontrollere på dansk.\n\n#Copyright (C) ___YEAR___ Foreningen for frit tilgængelige sprogværktøjer\n#Website: http://www.stavekontrolden.dk\n#E-mail: info@stavekontrolden.dk\n\n#License\n\n#GPL 2.0/LGPL 2.1/MPL 1.1 tri-license\n\n#This library is free software; you can redistribute it and/or modify it under the terms of one or more of the following:\n#   the GNU General Public License as published by the Free Software Foundation, version 2.0, https://www.gnu.org/licenses/gpl-2.0.html \n#   the GNU Lesser General Public License as published by the Free Software Foundation, version 2.1, https://www.gnu.org/licenses/lgpl-2.1.html \n#   and the Mozilla Public License as published by the The Mozilla Foundation, version 1.1, https://www.mozilla.org/en-US/MPL/1.1/\n\n#This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; \n#without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. \n#See the GNU General Public License, GNU Lesser General Public License, and Mozilla Public License for more details.\n\n#Tegnsæt UTF-8\nSET UTF-8\n\n'),
('da_DK', 60, '#F. Definitioner til selve ordbogslisten ##########\n\n#Flag til definitioner er tal, ikke bogstaver.\nFLAG num\n'),
('da_DK', 70, '#C. Ord-forslag, definitioner ##########\n\n#Undlad at foreslå opdeling af ord - opdeling vil forårsage flere fejl end det vil afhjælpe. Ord specifikt defineret \n#med mellemrum (i ordlisten eller i erstatningslisten længere nede) kan stadig forslås som opdeling.\nNOSPLITSUGS\n\n#Max. antal sammensatte ord i forslagslisten (0 switches off).\n#Slået fra, fordi forslag af sammensatte ord i alt for høj grad gav vrøvleforslag.\nMAXCPDSUGS 0\n\n#Max. antal ord foreslået ud fra ændringer i ordet (for lang en liste kan blive uoverskuelig og indeholde mange irrelevante ord).\n#Begrænsningen gælder vistnok ikke simple erstatninger ud fra TRY-listen, men \"n-grammer\", hvor ordet gradvis ændres mere\n#og mere med f.eks. sletninger, indsættelser af andre muligheder, andre affikser. I hvert fald kan der godt være mere end 10 forslag.\nMAXNGRAMSUGS 10\n\n#Tillad at der ingen forslag kommer\nONLYMAXDIFF\n\n#Enkeltbogstaver som kan forsøges udskiftet med et andet enkeltbogstav.\nTRY esrntliadkogmufbvphæøyjåcSMAKBHTLzRNEGéJVFDCwPIxOZ\'.-UWqØYÅüXQöèóáúðëÆíÖäÜÁàôïêÞÓÿîçãÒÍçńñłđžŽ\n\n#Enkelttegn som kan erstattes med nabotegn, f.eks. når man rammer den forkerte tast på tastaturet.\nKEY qwertyuiopå|asdfghjklæø|zxcvbnm\n\n'),
('da_DK', 71, '#D. Erstatningsliste til ordforslag #########\n\n#Liste med erstatningsforslag for at hjælpe systemet med at finde de rette forslag\n\nREP 126\nREP ^altsammen$ alt_sammen #altsammen -> alt sammen\nREP ^forlængst$ for_længst\nREP ^påny$ på_ny\nREP ^nutildags$ nu_til_dags\nREP ^vedlige$ ved_lige\nREP k g #Enkeltbogstaver folk tit bytter om på, som herved kommer højere op på listen \nREP g k\nREP b p\nREP p b\nREP o å\nREP å o\nREP m n\nREP n m\nREP s c\nREP c s\nREP k c\nREP c k\nREP s z\nREP z s\nREP æ e\nREP e æ\nREP i e\nREP e i\nREP a e\nREP e a\nREP j g\nREP g j\nREP d t\nREP t d\nREP o u\nREP u o\nREP d g\nREP y j #ved ord fra engelsk, f.eks. soya -> soja\nREP v hv #hv problematikken. vilket -> hvilket \nREP hv v #hvores -> vores \nREP ti j\nREP j ti\nREP si ti #aksion -> aktion\nREP ti si #invation -> invasion\nREP sj ti #aksjon -> aktion\nREP sj si #dimensjon -> dimension\nREP t ss\nREP f ph\nREP ph f\nREP nn nd\nREP nd nn\nREP ll ld\nREP ld ll\nREP k ch\nREP ch k\nREP ch sj\nREP ch j\nREP kk gg #Dobbelte bogstaver folk tit bytter om på \nREP gg kk\nREP mm nn\nREP nn mm\nREP bb pp\nREP pp bb\nREP n nn #Dobbelt bogstav eller ej \nREP nn n\nREP l ll\nREP ll l\nREP k kk\nREP kk k\nREP g gg\nREP gg g\nREP m mm\nREP mm m\nREP p pp\nREP pp p\nREP s ss\nREP ss s\nREP f ff\nREP ff f\nREP d dd\nREP dd d\nREP t tt\nREP tt t\nREP mang ment #varesortimanget -> varesortimentet\nREP ch tj #chekke -> tjekke\nREP aks acc #aksepter -> accepter #vaksine -> vaccine\nREP and an #andgriber -> angriber\nREP t ed\nREP in ind\nREP ind in\nREP ud u #overdreven brug af stumt d. udsædvanlig -> usædvanlig\nREP ud uden\nREP rd r\nREP dt t #virkefeldt -> virkefelt\nREP dt d\nREP e um #jubilæe -> jubilæum\nREP ene$ erne #sygeplejerskene -> sygeplejerskerne #lærene -> lærerne\nREP ene ende\nREP ende ene\nREP erer ere\nREP e en\nREP x ks #syntax -> syntaks\nREP e de\nREP sj ch\nREP øv eu #øvforisk -> euforisk\nREP ø eu #øforisk -> euforisk\nREP y j #ved ord fra fremmedsprog, hvor j på dansk ofte har stået som y i engelsk gengivelse\nREP sj g\nREP ds c\nREP ^u in #ueffektiv -> ineffektiv\nREP ^in u #inkorrekte -> ukorrekt\nREP ^ind u #indkorrekte -> ukorrekt\nREP je æ #kjekke -> kække\nREP le ti #stalestikkerne -> statistikkerne\nREP ^op efter #opfølgeren -> efterfølgeren\nREP ede$ te #låsede -> låste\nREP ^i i_ #iaften -> i aften\nREP ^hen hen_ #henover -> hen over\nREP ^inden inden_ #indendøre -> inden døre\nREP ss$ s\' #Genitiv\nREP xs$ x\' #faxs -> fax\'\nREP zs$ z\' #jazzs -> jazz\'\nREP aa å #Intet dansk keyboard\nREP ae æ\nREP oe ø\nREP å aa #navne med dobbelt-a, Grenå -> Grenaa\nREP ^Å Aa #navne som begynder med dobbelt-a, Ålborg -> Aalborg\nREP ation ering #karakterisation -> karakterisering\nREP ering ation #rotering -> rotation\nREP l$ el #engl -> engel\nREP $_ ._ #forkortelse med manglende afslutningspunktum, \"dvs \" -> \"dvs. \"\n'),
('da_DK', 73, '#E. Enkelttegn ##########\n\n#Enkelttegn som kan erstatte hinanden, også mere end én gang i samme ord.\n#Brugt her til en række accenter og ligaturer, også nogle som ikke bruges på dansk,\n#men som kan indgå i f.eks. navne og stednavne, såsom bynavnet Gdańsk.\nMAP 63\nMAP aáàâäãāăąǟǎǡȁȃȧ\nMAP AÁÀÂÄÃĀĂĄǍǞǠȀȂȦ\nMAP bƀƂƅ #Sidste: \"Latin small letter tone six\"\nMAP BƁƃƄ #Sidste: \"Latin capial letter tone six\"\nMAP cçćĉċčƈ\nMAP CÇĆĈĊČƇ\nMAP dðþđďđƋ\nMAP DÐÞĎƊƌ\nMAP (dz)ǆ\nMAP (DZ)Ǆ\nMAP (Dz)ǅ\nMAP eéèêëēĕėęěȅȇȩǝƏ\nMAP EÉÈÊËĒĔĖĘĚȄȆȨƎ\nMAP gĝğġģǥǧǵ\nMAP GĜĞĠĢǤǦǴ\nMAP hĥħȟ\nMAP HĤĦȞ\nMAP iíìîïĩīĭǐįȉȋɨı #Sidste: i uden prik, bl.a. i tyrkisk\nMAP IÍÌÎÏĨĪĬǏĮİȈȊƗ\nMAP (ij)ĳ\nMAP (IJ)Ĳ\nMAP jĵɉȷɟ #To sidste: \"Latin small letter dotless j\" og \"Latin small letter dotless j with stroke\"\nMAP JĴɈ\nMAP kķǩǩĸ # Sidste: \"Latin small letter kra\"\nMAP KĶǨǨ\nMAP lĺļľŀł\nMAP LĹĻĽĿŁ\nMAP (lj)ǉ\nMAP (Lj)ǈ\nMAP (LJ)Ǉ\nMAP nñńǹņŉň\nMAP NŃǸŅŇ\nMAP (nj)ǌ\nMAP (Nj)ǋ\nMAP (NJ)Ǌ\nMAP (ng)ŋ #\"Latin small letter eng\"\nMAP (NG)Ŋ #\"Latin capital letter eng\"\nMAP oóòôöõōŏǒőȍȏǫǭ #Næstsidste: \"Latin small letter o with ogonek\"\nMAP OÓÒÔÖÕǑŌŎŐȌȎǪǬƆ #Tredjesidste: \"Latin capital letter O with ogonek\". Sidste: \"Capital letter open O\"\nMAP (oe)œ\nMAP (OE)Œ\nMAP rŕŗřȑȓ\nMAP RŔŖŘȐȒ\nMAP sśŝşšșſ #Sidste: \"Latin small letter long s\"\nMAP SŚŜŞŠȘ\nMAP (ss)ß\nMAP tţťŧț\nMAP TŢŤŦȚ\nMAP uúùûüũūŭůűųǔǖǘǚǜȕȗ\nMAP UÚÙÛÜŨŪŬŮŰŲǓǕǗǙǛȔȖ\nMAP wŵ\nMAP WŴ\nMAP yýŷÿɏ\nMAP YÝŸŶɎ\nMAP zžźż\nMAP ZŽŹŻ\nMAP æǣǽ\nMAP ÆǢǼ\nMAP øǿ\nMAP ØǾ\nMAP åǻ\nMAP ÅǺ\nMAP µμ #mikro og græsk bogstav my. µ = MICRO SIGN (hex B5, decimal 181). μ = GREEK SMALL LETTER MU (hex 3BC, decimal 956).\n\n');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `technical_term`
--

CREATE TABLE `technical_term` (
  `lang` enum('da_DK') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `technical_term` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Data dump for tabellen `technical_term`
--

INSERT INTO `technical_term` (`lang`, `id`, `technical_term`) VALUES
('da_DK', 27, 'Medicin'),
('da_DK', 28, 'Jura/forvaltning'),
('da_DK', 29, 'Håndværk/teknik'),
('da_DK', 30, 'IT/elektronik'),
('da_DK', 31, 'Naturvidenskab/matematik'),
('da_DK', 32, 'Filosofi/humaniora/sociologi'),
('da_DK', 33, 'Kemi/biokemi/cellebiologi'),
('da_DK', 34, 'Teologi'),
('da_DK', 36, 'Geologi'),
('da_DK', 37, 'Lægemidler'),
('da_DK', 38, 'Biologisk taksonomi (latinske navne)'),
('da_DK', 39, 'Dinosaurer/fortidsdyr');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `unaccepted_word`
--

CREATE TABLE `unaccepted_word` (
  `lang` enum('da_DK') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `unaccepted_word` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `users`
--

CREATE TABLE `users` (
  `user_id` int UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `org_id` int UNSIGNED NOT NULL DEFAULT '0',
  `permissions` set('baseuser','wordedit','affix','admin') NOT NULL DEFAULT 'baseuser',
  `lastchange` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `wordclass`
--

CREATE TABLE `wordclass` (
  `lang` enum('da_DK') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `wordclass` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `providestem` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Data dump for tabellen `wordclass`
--

INSERT INTO `wordclass` (`lang`, `id`, `wordclass`, `providestem`) VALUES
('da_DK', 1, 'Ingen ordklasse', 0),
('da_DK', 2, 'Verbum, svagt bøjet, -te i datid', 0),
('da_DK', 3, 'Konjunktion', 0),
('da_DK', 4, 'Præfiks- (inkl. afsluttende bindestreg)', 0),
('da_DK', 5, 'Præposition', 0),
('da_DK', 6, 'Udråbsord', 0),
('da_DK', 7, 'Forkortelse', 0),
('da_DK', 8, 'Substantiv, fælleskøn, med konsonantfordobling, -e i flertal', 0),
('da_DK', 9, 'Substantiv, fælleskøn, -e i flertal', 0),
('da_DK', 10, 'Substantiv, intetkøn, -e i flertal', 0),
('da_DK', 11, 'Substantiv, intetkøn, med konsonantfordobling, -e i flertal', 0),
('da_DK', 12, 'Substantiv, intetkøn, med konsonantfordobling, -r/-er i flertal', 0),
('da_DK', 13, 'Substantiv, intetkøn, -r/-er i flertal', 0),
('da_DK', 14, 'Substantiv, fælleskøn, -r/-er i flertal', 0),
('da_DK', 15, 'Adjektiv, ender på -en, erstattes med -ne, intetkøn -ent (uden komparation)', 0),
('da_DK', 16, 'Adjektiv, ender på -en, erstattes med -ne, intetkøn -et (uden komparation)', 0),
('da_DK', 18, 'Substantiv, fælleskøn, ender på -el, stamme -el fjernes, flertal -ler, bestemt form -len eller -elen', 0),
('da_DK', 19, 'Adjektiv, svagt bøjet med komparation, -st', 0),
('da_DK', 20, 'Adverbium', 0),
('da_DK', 21, 'Lydord', 0),
('da_DK', 22, 'Pronomen', 0),
('da_DK', 23, 'Proprium', 0),
('da_DK', 24, 'Talord', 0),
('da_DK', 25, 'Uidentificeret', 0),
('da_DK', 26, 'Verbum, stærkt bøjet', 0),
('da_DK', 27, 'Verbum, svagt bøjet, -de/-ede i datid', 0),
('da_DK', 28, 'Substantiv, ubestemt (sprog, farver o.lign, som egennavne)', 0),
('da_DK', 29, 'Adjektiv, svagt bøjet uden komparation (-e kun efter slutvokaler iy, -t kun efter iyå)', 0),
('da_DK', 30, 'Adjektiv, ender på -el, erstattes med -le, bøjet med komparation (-lest)', 0),
('da_DK', 31, 'Adjektiv, d erstatter t uden komparation', 0),
('da_DK', 32, 'Adjektiv, ender på -sk (uden komparation)', 0),
('da_DK', 33, 'Adjektiv, ender på -ende', 0),
('da_DK', 34, 'Substantiv, fælleskøn, med konsonantfordobling, -r/-er i flertal', 0),
('da_DK', 35, 'Substantiv, stærkt bøjet', 0),
('da_DK', 36, 'Adjektiv, ender på -el, erstattes med -le, uden komparation', 0),
('da_DK', 37, 'Substantiv, intetkøn, -re i flertal, stamme -er fjernes', 0),
('da_DK', 38, 'Substantiv, fælleskøn, -re i flertal, stamme -er fjernes', 0),
('da_DK', 39, 'Substantiv, intetkøn, -re i flertal, stamme -er fjernes, bestemt form -ret eller -eret', 0),
('da_DK', 40, 'Adjektiv, stærkt bøjet', 0),
('da_DK', 41, 'Adjektiv, dobbeltkonsonant (mm) bøjet med komparation, -st', 0),
('da_DK', 42, 'Adjektiv, ender på -er, erstattes med -re, med komparation', 0),
('da_DK', 43, 'Adjektiv, svagt bøjet med komparation, -est', 0),
('da_DK', 44, 'Adjektiv, dobbeltkonsonant bøjet med komparation, -est', 0),
('da_DK', 45, 'Substantiv, torso, fælleskøn', 0),
('da_DK', 46, 'Substantiv, torso, intetkøn', 0),
('da_DK', 47, 'Substantiv, fælleskøn, -Ø i flertal', 0),
('da_DK', 48, 'Substantiv, intetkøn, -Ø i flertal', 0),
('da_DK', 49, 'Substantiv, intetkøn, med konsonantfordobling, -Ø i flertal', 0),
('da_DK', 50, 'Substantiv, fælleskøn, med konsonantfordobling, -Ø i flertal', 0),
('da_DK', 51, 'Substantiv med apostrof før endelse, fælleskøn', 0),
('da_DK', 52, 'Substantiv med apostrof før endelse, intetkøn', 0),
('da_DK', 53, 'Proprium med mulighed for verdenshjørneretning som præfiks', 0),
('da_DK', 54, 'Substantiv, torso med konsonantfordobling, intetkøn', 0),
('da_DK', 55, 'Substantiv, torso med konsonantfordobling, fælleskøn', 0),
('da_DK', 56, 'Adjektiv, dobbeltkonsonant uden komparation', 0),
('da_DK', 57, 'Adjektiv, ubøj.', 0),
('da_DK', 58, 'Substantiv, fælleskøn, ender på -el, stamme -el fjernes, flertal -ler, bestemt form -len', 0),
('da_DK', 59, 'Substantiv, intetkøn, ender på -el, stamme -el fjernes, flertal -ler, bestemt form -let', 0),
('da_DK', 60, 'Substantiv, fælleskøn, ender på -el, stamme -el fjernes, torso', 0),
('da_DK', 61, 'Substantiv, intetkøn, ender på -um/-us; erstattes i bøjninger, -et, -er, -erne', 0),
('da_DK', 62, 'Substantiv, intetkøn, ender på -um; erstattes i bøjninger, -et, -er, -erne; alternativ entalsform -e', 0),
('da_DK', 63, 'Substantiv, kun flertalsformer, bestemt form -ne (efter -e og -r) eller -ene (øvrige)', 1),
('da_DK', 64, 'Substantiv med apostrof før endelse, fælleskøn, torso', 0),
('da_DK', 65, 'Substantiv med apostrof før endelse, intetkøn, torso', 0),
('da_DK', 66, 'Adjektiv, fremmedord adjektiv efter objekt', 0),
('da_DK', 67, 'Substantiv, fælleskøn, ender på -en, flertal -ener eller -ner (stamme -en fjernes)', 0),
('da_DK', 68, 'Substantiv, intetkøn, ender på -en, bøjning -net, -ner, -nerne (stamme -en fjernes) eller som -er i flertal', 0);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `wordclass_to_affixclass`
--

CREATE TABLE `wordclass_to_affixclass` (
  `lang` enum('da_DK') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `wordclassid` int UNSIGNED NOT NULL,
  `affixclassid` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Data dump for tabellen `wordclass_to_affixclass`
--

INSERT INTO `wordclass_to_affixclass` (`lang`, `id`, `wordclassid`, `affixclassid`) VALUES
('da_DK', 1, 2, 20),
('da_DK', 2, 10, 4),
('da_DK', 3, 34, 7),
('da_DK', 4, 11, 10),
('da_DK', 5, 34, 10),
('da_DK', 6, 9, 5),
('da_DK', 7, 9, 2),
('da_DK', 8, 9, 10),
('da_DK', 9, 14, 10),
('da_DK', 10, 14, 11),
('da_DK', 11, 14, 2),
('da_DK', 13, 15, 12),
('da_DK', 15, 10, 10),
('da_DK', 16, 10, 5),
('da_DK', 17, 13, 10),
('da_DK', 18, 13, 4),
('da_DK', 19, 13, 11),
('da_DK', 26, 37, 10),
('da_DK', 27, 37, 13),
('da_DK', 28, 37, 4),
('da_DK', 29, 38, 14),
('da_DK', 30, 38, 10),
('da_DK', 31, 38, 13),
('da_DK', 32, 39, 10),
('da_DK', 33, 39, 15),
('da_DK', 34, 39, 13),
('da_DK', 35, 8, 10),
('da_DK', 37, 35, 10),
('da_DK', 39, 8, 19),
('da_DK', 41, 11, 18),
('da_DK', 43, 12, 10),
('da_DK', 44, 12, 3),
('da_DK', 45, 2, 21),
('da_DK', 46, 27, 1),
('da_DK', 47, 27, 21),
('da_DK', 48, 2, 22),
('da_DK', 49, 27, 22),
('da_DK', 51, 23, 9),
('da_DK', 52, 41, 40),
('da_DK', 54, 30, 10),
('da_DK', 55, 31, 10),
('da_DK', 56, 31, 26),
('da_DK', 57, 19, 10),
('da_DK', 58, 29, 24),
('da_DK', 59, 29, 10),
('da_DK', 61, 44, 42),
('da_DK', 62, 43, 10),
('da_DK', 64, 43, 38),
('da_DK', 65, 33, 27),
('da_DK', 66, 32, 28),
('da_DK', 67, 44, 10),
('da_DK', 69, 45, 44),
('da_DK', 70, 46, 45),
('da_DK', 71, 45, 10),
('da_DK', 72, 46, 10),
('da_DK', 73, 47, 10),
('da_DK', 74, 47, 2),
('da_DK', 75, 47, 46),
('da_DK', 76, 48, 10),
('da_DK', 77, 48, 46),
('da_DK', 78, 48, 4),
('da_DK', 79, 50, 10),
('da_DK', 80, 50, 48),
('da_DK', 81, 49, 10),
('da_DK', 82, 49, 47),
('da_DK', 83, 43, 49),
('da_DK', 86, 44, 49),
('da_DK', 87, 41, 49),
('da_DK', 88, 51, 50),
('da_DK', 89, 52, 51),
('da_DK', 90, 24, 10),
('da_DK', 91, 53, 54),
('da_DK', 92, 53, 9),
('da_DK', 95, 54, 10),
('da_DK', 96, 55, 58),
('da_DK', 97, 54, 57),
('da_DK', 98, 55, 10),
('da_DK', 99, 60, 34),
('da_DK', 100, 61, 34),
('da_DK', 101, 56, 59),
('da_DK', 102, 56, 10),
('da_DK', 103, 56, 49),
('da_DK', 104, 58, 64),
('da_DK', 105, 58, 65),
('da_DK', 106, 59, 64),
('da_DK', 107, 58, 10),
('da_DK', 108, 59, 10),
('da_DK', 109, 58, 34),
('da_DK', 110, 59, 34),
('da_DK', 111, 60, 65),
('da_DK', 112, 60, 10),
('da_DK', 113, 59, 66),
('da_DK', 114, 61, 70),
('da_DK', 115, 61, 71),
('da_DK', 116, 61, 10),
('da_DK', 117, 62, 72),
('da_DK', 118, 62, 71),
('da_DK', 119, 62, 70),
('da_DK', 120, 62, 10),
('da_DK', 121, 62, 34),
('da_DK', 124, 9, 39),
('da_DK', 125, 14, 39),
('da_DK', 127, 38, 39),
('da_DK', 128, 47, 39),
('da_DK', 129, 58, 39),
('da_DK', 130, 8, 39),
('da_DK', 131, 34, 39),
('da_DK', 133, 50, 39),
('da_DK', 134, 55, 39),
('da_DK', 136, 10, 39),
('da_DK', 137, 13, 39),
('da_DK', 139, 48, 39),
('da_DK', 140, 59, 39),
('da_DK', 141, 61, 39),
('da_DK', 142, 62, 39),
('da_DK', 143, 11, 39),
('da_DK', 144, 12, 39),
('da_DK', 146, 49, 39),
('da_DK', 147, 54, 39),
('da_DK', 148, 37, 39),
('da_DK', 149, 39, 39),
('da_DK', 150, 35, 39),
('da_DK', 151, 45, 39),
('da_DK', 152, 60, 39),
('da_DK', 153, 46, 39),
('da_DK', 164, 19, 39),
('da_DK', 168, 63, 74),
('da_DK', 169, 63, 10),
('da_DK', 171, 63, 39),
('da_DK', 172, 64, 75),
('da_DK', 174, 65, 76),
('da_DK', 176, 36, 10),
('da_DK', 177, 36, 49),
('da_DK', 178, 36, 77),
('da_DK', 180, 30, 49),
('da_DK', 181, 30, 77),
('da_DK', 182, 30, 78),
('da_DK', 184, 27, 79),
('da_DK', 185, 2, 79),
('da_DK', 186, 4, 81),
('da_DK', 187, 41, 10),
('da_DK', 190, 15, 49),
('da_DK', 191, 15, 10),
('da_DK', 193, 16, 12),
('da_DK', 195, 16, 82),
('da_DK', 196, 16, 10),
('da_DK', 199, 18, 64),
('da_DK', 200, 18, 65),
('da_DK', 201, 18, 44),
('da_DK', 202, 18, 10),
('da_DK', 204, 18, 39),
('da_DK', 205, 19, 24),
('da_DK', 206, 19, 23),
('da_DK', 207, 43, 24),
('da_DK', 208, 29, 49),
('da_DK', 209, 19, 49),
('da_DK', 210, 44, 59),
('da_DK', 215, 31, 39),
('da_DK', 216, 41, 39),
('da_DK', 217, 44, 39),
('da_DK', 218, 56, 39),
('da_DK', 219, 30, 39),
('da_DK', 220, 36, 39),
('da_DK', 221, 15, 39),
('da_DK', 222, 16, 39),
('da_DK', 223, 33, 39),
('da_DK', 224, 32, 39),
('da_DK', 225, 40, 39),
('da_DK', 226, 43, 39),
('da_DK', 227, 29, 39),
('da_DK', 230, 41, 59),
('da_DK', 232, 57, 39),
('da_DK', 236, 4, 32),
('da_DK', 240, 42, 41),
('da_DK', 241, 42, 49),
('da_DK', 242, 42, 10),
('da_DK', 243, 42, 39),
('da_DK', 246, 61, 84),
('da_DK', 247, 61, 85),
('da_DK', 252, 28, 10),
('da_DK', 255, 67, 10),
('da_DK', 256, 67, 11),
('da_DK', 257, 67, 2),
('da_DK', 258, 67, 43),
('da_DK', 259, 67, 39),
('da_DK', 260, 27, 39),
('da_DK', 261, 2, 39),
('da_DK', 262, 68, 10),
('da_DK', 263, 68, 4),
('da_DK', 264, 68, 11),
('da_DK', 265, 68, 87),
('da_DK', 267, 68, 43),
('da_DK', 268, 68, 39),
('da_DK', 269, 28, 39);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `words`
--

CREATE TABLE `words` (
  `lang` enum('da_DK') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `word` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `wordclass` int UNSIGNED NOT NULL,
  `stem` int UNSIGNED DEFAULT NULL,
  `wordstatus` int NOT NULL DEFAULT '1',
  `alternatives` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lastuser` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `contributor` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `word_definition` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `comments` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `technical_term` int UNSIGNED NOT NULL DEFAULT '0',
  `fugeelementid` int UNSIGNED NOT NULL,
  `strong_declension` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `omitsuggestion` tinyint(1) DEFAULT '0',
  `misspellings` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `log` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `lastchange` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `wordstatus`
--

CREATE TABLE `wordstatus` (
  `lang` enum('da_DK') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'da_DK',
  `id` smallint NOT NULL,
  `wordstatus` varchar(30) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Data dump for tabellen `wordstatus`
--

INSERT INTO `wordstatus` (`lang`, `id`, `wordstatus`) VALUES
('da_DK', 1, 'Oprettet'),
('da_DK', 2, 'Tildelt ordklasse'),
('da_DK', 3, 'Indstillet'),
('da_DK', 4, 'Godkendt'),
('da_DK', -1, 'Afvist'),
('da_DK', 0, 'Afvist ordklassetildeling'),
('da_DK', -2, 'Uplacerbar');

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
  ADD UNIQUE KEY `email` (`email`);

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
  ADD KEY `lang` (`lang`),
  ADD KEY `stem` (`stem`);

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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- Tilføj AUTO_INCREMENT i tabel `affixrule`
--
ALTER TABLE `affixrule`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1062;

--
-- Tilføj AUTO_INCREMENT i tabel `affixrule_to_affixclass`
--
ALTER TABLE `affixrule_to_affixclass`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1900;

--
-- Tilføj AUTO_INCREMENT i tabel `fugeelement`
--
ALTER TABLE `fugeelement`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Tilføj AUTO_INCREMENT i tabel `fugeelement_to_affixclass`
--
ALTER TABLE `fugeelement_to_affixclass`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Tilføj AUTO_INCREMENT i tabel `morphdescr`
--
ALTER TABLE `morphdescr`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Tilføj AUTO_INCREMENT i tabel `organizations`
--
ALTER TABLE `organizations`
  MODIFY `org_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `start_definitions`
--
ALTER TABLE `start_definitions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- Tilføj AUTO_INCREMENT i tabel `technical_term`
--
ALTER TABLE `technical_term`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Tilføj AUTO_INCREMENT i tabel `unaccepted_word`
--
ALTER TABLE `unaccepted_word`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `wordclass`
--
ALTER TABLE `wordclass`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Tilføj AUTO_INCREMENT i tabel `wordclass_to_affixclass`
--
ALTER TABLE `wordclass_to_affixclass`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;

--
-- Tilføj AUTO_INCREMENT i tabel `words`
--
ALTER TABLE `words`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `words_ibfk_1` FOREIGN KEY (`wordclass`) REFERENCES `wordclass` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `words_ibfk_2` FOREIGN KEY (`stem`) REFERENCES `words` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
