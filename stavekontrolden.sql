-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Vært: localhost
-- Genereringstid: 14. 04 2020 kl. 00:36:05
-- Serverversion: 8.0.19-0ubuntu0.19.10.3
-- PHP-version: 7.3.11-0ubuntu0.19.10.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `crossproduct` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `affixclass` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `affixrule`
--

CREATE TABLE `affixrule` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `affixclassid` int UNSIGNED NOT NULL,
  `stripchars` varchar(25) DEFAULT '0',
  `affix` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `condition` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `replacement` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `morphdescrid` int UNSIGNED NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `affixrule_to_affixclass`
--

CREATE TABLE `affixrule_to_affixclass` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `affixruleid` int UNSIGNED NOT NULL,
  `affixclassid` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `fugeelement`
--

CREATE TABLE `fugeelement` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `fugeelement` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
('da_DK', 13, 'Konsonantfordobling+er');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `fugeelement_to_affixclass`
--

CREATE TABLE `fugeelement_to_affixclass` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `fugeelementid` int UNSIGNED NOT NULL,
  `affixclassid` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `morphdescr`
--

CREATE TABLE `morphdescr` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `morphdescr` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
('da_DK', 15, 'Min streo flotte morfklasse'),
('da_DK', 16, 'Mun nye'),
('da_DK', 17, 'Min fjerde forsøg'),
('da_DK', 18, 'En ny mere'),
('da_DK', 19, 'Hejsa');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `start_definitions`
--

CREATE TABLE `start_definitions` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `start_definitions` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `start_definitions`
--

INSERT INTO `start_definitions` (`lang`, `id`, `start_definitions`) VALUES
('da_DK', 49, '#Til sammensætninger: Bindestreg er et ord i sammensætninger\r\nCOMPOUNDMIN 1\r\nCOMPOUNDWORDMAX 2\r\nWORDCHARS -.'),
('da_DK', 59, '#Stavekontrolden version ___VERSION___\n#Denne fil er en del af Stavekontrolden - et softwareprodukt, der gør det muligt at stavekontrollere på dansk.\n\n#Copyright (C) ___YEAR___ Foreningen for frit tilgængelige sprogværktøjer\n#Website: http://www.stavekontrolden.dk\n#E-mail: info@stavekontrolden.dk\n\n#License\n\n#GPL 2.0/LGPL 2.1/MPL 1.1 tri-license\n\n#This library is free software; you can redistribute it and/or modify it under the terms of one or more of the following, the GNU Lesser General Public License as published by the Free Software Foundation; version 2.1 of the License, GNU General Public License as published by the Free Software Foundation; version 2.0 of the License, and Mozilla Public License as published by the The Mozilla Foundation; version 1.1 of the License.\n\n#This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License, GNU General Public License, and Mozilla Public License for more details.\n\n#You should have received a copy of the GNU Lesser General Public License and  GNU General Public along with this library; if not, write to the:\n\n#Free Software Foundation, Inc.\n#51 Franklin Street, Fifth Floor\n#Boston\n#MA  02110-1301  USA\n\n#You should have received a copy of the Mozilla Public License along with this library; if not, visit http://www.mozilla.org/MPL/MPL-1.1.html\n'),
('da_DK', 60, 'SET UTF-8\r\nTRY esrntliadkogmufbvphæøyjåcSMAKBHTLzRNEGéJVFDCwPIxOZ\'.UWqØYÅüXQöèóáúðëÆíÖäÜÁàôïêÞÓÿîçãÒÍ.\r\nFLAG num\r\nKEY qwertyuiopå|asdfghjklæø|zxcvbnm'),
('da_DK', 70, '#Undlad at foreslå opdeling af ord - opdeling vil forårsage flere fejl end det vil afhjælpe\r\nNOSPLITSUGS\r\n\r\n#Max. antal sammensatte ord i forslagslisten (0 switches off - n)\r\nMAXCPDSUGS 0\r\n\r\n#Tillad at der ingen forslag kommer\r\nONLYMAXDIFF\r\n \r\nNOSUGGEST 1111\r\n\r\nREP 115\r\nREP ^allesammen$ alle_sammen\r\nREP ^altsammen$ alt_sammen\r\nREP ^forlængst$ for_længst\r\nREP ^fremfor$ frem_for\r\nREP ^påny$ på_ny\r\nREP ^nutildags$ nu_til_dags\r\nREP ^vedlige$ ved_lige #vedlige -> ved lige\r\nREP k g #Enkeltbogstaver folk tit bytter om på, som herved kommer højere op på listen \r\nREP g k\r\nREP b p\r\nREP p b\r\nREP o å\r\nREP å o\r\nREP m n\r\nREP n m\r\nREP s c\r\nREP c s\r\nREP æ e\r\nREP e æ\r\nREP i e\r\nREP e i\r\nREP a e\r\nREP e a\r\nREP j g\r\nREP g j\r\nREP d t\r\nREP t d\r\nREP o u\r\nREP u o\r\nREP d g\r\nREP v hv #hv problematikken. vilket -> hvilket \r\nREP hv v #hvores -> vores \r\nREP sj ti\r\nREP ti j\r\nREP j ti\r\nREP t ss\r\nREP f ph\r\nREP ph f\r\nREP nn nd\r\nREP nd nn\r\nREP ll ld\r\nREP ld ll\r\nREP k ch\r\nREP ch k\r\nREP ch sj\r\nREP ch j\r\nREP kk gg #Dobbelt bogstaver folk tit bytter om på \r\nREP gg kk\r\nREP mm nn\r\nREP nn mm\r\nREP bb pp\r\nREP pp bb\r\nREP n nn #Dobbelt bogstave eller ej \r\nREP nn n\r\nREP l ll\r\nREP ll l\r\nREP k kk\r\nREP kk k\r\nREP g gg\r\nREP gg g\r\nREP m mm\r\nREP mm m\r\nREP p pp\r\nREP pp p\r\nREP s ss\r\nREP ss s\r\nREP f ff\r\nREP ff f\r\nREP d dd\r\nREP dd d\r\nREP t tt\r\nREP tt t\r\nREP mang ment #varesortimanget -> varesortimentet\r\nREP ch tj #chekke -> tjekke\r\nREP aks acc #aksepter -> accepter #vaksine -> vaccine\r\nREP and an #andgriber -> angriber\r\nREP t s #invation -> invasion\r\nREP t ed\r\nREP in ind\r\nREP ind in\r\nREP ud u #overdreven brug af stumt d. udsædvanlig -> usædvanlig\r\nREP ud uden\r\nREP rd r\r\nREP dt t #virkefeldt -> virkefelt\r\nREP dt d\r\nREP e um #akvarie -> akvarium #jubilæe -> jubilæum\r\nREP ene$ erne #sygeplejerskene -> sygeplejerskerne #lærene -> lærerne\r\nREP ene ende\r\nREP ende ene\r\nREP erer ere\r\nREP e en\r\nREP x ks #syntax -> syntaks\r\nREP e de\r\nREP sj ch\r\nREP øv eu #øvforisk -> euforisk\r\nREP ø eu #øforisk -> euforisk\r\nREP y ud\r\nREP sj g\r\nREP ds c\r\nREP ^u in #ueffektiv -> ineffektiv\r\nREP ^in u #inkorrekte -> ukorrekt\r\nREP ^ind u #indkorrekte -> ukorrekt\r\nREP je æ #kjekke -> kække\r\nREP le ti #stalestikkerne -> statistikkerne\r\nREP ^op efter #opfølgeren -> efterfølgeren\r\nREP ede$ te #låsede -> låste\r\nREP ^i i_ #iaften -> i aften\r\nREP ^hen hen_ #henover -> hen over\r\nREP ^inden inden_ #indendøre -> inden døre\r\nREP ss$ s\' #Genetiv\r\nREP xs$ x\' #faxs -> fax\'\r\nREP zs$ z\' #jazzs -> jazz\'\r\nREP aa å #Intet dansk keyboard\r\nREP ae æ\r\nREP oe ø');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `technical_term`
--

CREATE TABLE `technical_term` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `technical_term` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `technical_term`
--

INSERT INTO `technical_term` (`lang`, `id`, `technical_term`) VALUES
('da_DK', 27, 'Medicin'),
('da_DK', 28, 'Jura'),
('da_DK', 29, 'Teknik/håndværk'),
('da_DK', 30, 'IT/elektronik'),
('da_DK', 31, 'Naturvidenskab'),
('da_DK', 32, 'Filosofi/humaniora/sociologi'),
('da_DK', 33, 'Handel/forretningsliv');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `unaccepted_word`
--

CREATE TABLE `unaccepted_word` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `unaccepted_word` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Data dump for tabellen `unaccepted_word`
--

INSERT INTO `unaccepted_word` (`lang`, `id`, `unaccepted_word`) VALUES
('da_DK', 1, 'afskedstagen'),
('da_DK', 2, 'amatørartig'),
('da_DK', 3, 'amatørartigt'),
('da_DK', 4, 'barrak,barraks'),
('da_DK', 5, 'billed,billeddet,bileddene,billeds,billeddets,bileddenes'),
('da_DK', 6, 'bortfalle,bortfaller,bortfallen,bortfallens,bortfallene,bortfallenes'),
('da_DK', 7, 'burte'),
('da_DK', 8, 'edssvoren'),
('da_DK', 9, 'endering,enderingen,enderinger,enderingerne,enderings,enderingens,enderingers,enderingernes'),
('da_DK', 10, 'fonto'),
('da_DK', 11, 'grobundfor'),
('da_DK', 12, 'grundlovsgivende'),
('da_DK', 13, 'håndlag,håndlags,håndlaget,håndlagets'),
('da_DK', 14, 'håndoprækning,håndopræknings,håndoprækningen,håndoprækningens,håndoprækninger,håndoprækningers,håndoprækningerne,håndoprækningernes'),
('da_DK', 15, 'håndrækning,håndræknings,håndrækningen,håndrækningens,håndrækninger,håndrækningers,håndrækningerne,håndrækningernes'),
('da_DK', 16, 'håndvending,håndvendings,håndvendingen,håndvendingens,håndvendinger,håndvendingers,håndvendingerne,håndvendingernes'),
('da_DK', 17, 'hestefolk,hestefolket,hestefolks,hestefolkets'),
('da_DK', 18, 'hestegarde,hestegarden,hestegarder,hestegarderne,hestegardes,hestegardens,hestegarders,hestegardernes'),
('da_DK', 19, 'indefor,indefors,indeforen'),
('da_DK', 20, 'kokkemat,kokkematen,kokkemater,kokkematerne,kokkemats,kokkematens,kokkematers,kokkematernes'),
('da_DK', 21, 'landskap,landskaps'),
('da_DK', 22, 'legemsløs,legemsløst,legemsløse,legemsløsere,legemsløsest'),
('da_DK', 23, 'læreranstalt,læreranstalten,læreranstalter,læreranstalterne,læreranstalts,læreranstaltens,læreranstalters,læreranstalternes'),
('da_DK', 24, 'løgnehals, løgnehalsen, løgnehalse, løgnehalsene, løgnehals\', løgnehalsens, løgnehalses, løgnehalsenes'),
('da_DK', 25, 'medlemsskab,medlemsskabet,medlemsskaber,medlemsskaberne,medlemsskabs,medlemsskabets,medlemsskabers,medlemsskabernes'),
('da_DK', 26, 'monto'),
('da_DK', 27, 'omkap'),
('da_DK', 28, 'overfalle,overfaller,overfallen,overfallens,overfallene,overfallenes'),
('da_DK', 29, 'potion,potionen,potioner,potionerne,potions,potionens,potioners,potionernes'),
('da_DK', 30, 'premiereminister,premiereministeren,premiereministre,premiereministrene,premiereministers,premiereministerens,premiereministres,premiereministrenes'),
('da_DK', 31, 'prinsegemal,prinsegemalen,prinsegemaler,prinsegemalerne,prinsegemals,prinsegemalens,prinsegemalers,prinsegemalernes'),
('da_DK', 32, 'prinseregent,prinseregenten,prinseregenter,prinseregenterne,prinseregents,prinseregentens,prinseregenters,prinseregenternes'),
('da_DK', 33, 'retshaver,retshaveren,retshavere,retshavererne,retshavers,retshaverens,retshaveres,retshaverernes'),
('da_DK', 34, 'retshaveri,retshaveriet,retshaverier,retshaverierne,retshaveris,retshaveriets,retshaveriers,retshaveriernes'),
('da_DK', 35, 'ringapparat,ringapparatet,ringapparater,ringapparaterne,ringapparats,ringapparatets,ringapparaters,ringapparaternes'),
('da_DK', 36, 'ringklokke,ringklokken,ringklokker,ringklokkerne,ringklokkes,ringklokkens,ringklokkers,ringklokkernes'),
('da_DK', 37, 'ringtone,ringtonen,ringtoner,ringtonerne,ringtones,ringtonens,ringtoners,ringtonernes'),
('da_DK', 38, 'ryggrad,ryggraden,ryggrade,ryggradene,ryggrads,ryggradens,ryggrades,ryggradenes'),
('da_DK', 39, 'skadeerstatning,skadeerstatningen,skadeerstatninger,skadeerstatningens'),
('da_DK', 40, 'skadeløs,skadeløst,skadeløse'),
('da_DK', 41, 'skallering,skalleringen,skallerings,skalleringens'),
('da_DK', 42, 'skattekammer,skattekammeret,skattekamret,skattekamre,skattekamrene,skattekammers,skattekammerets,skattekamrets,skattekamres,skattekamrenes'),
('da_DK', 43, 'skattemester,skattemesteren,skattemestre,skattemestrene,skattemesters,skattemesterens,skattemestres,skattemestrenes'),
('da_DK', 44, 'skatteskyldig,skatteskyldige,skatteskyldigt'),
('da_DK', 45, 'skibsbrud,skibsbruddet,skibsbruddene'),
('da_DK', 46, 'slægtsled,slægtsleds,slægtsleddet,slægtsleddets,slægtsleddene,slægtsleddenes'),
('da_DK', 47, 'standpunktstagen'),
('da_DK', 48, 'stillingstagen'),
('da_DK', 49, 'suport,suporten,suporter,suporte,suporteren,suporterne,suportere,suports,suportens,suporters,suportes,suporterens,suporternes,suporteres'),
('da_DK', 50, 'udemærket,udemærkede'),
('da_DK', 51, 'velkone'),
('da_DK', 52, 'ægtefælde,ægtefælden,ægtefælder,ægtefælderne,ægtefældes,ægtefældens,ægtefælders,ægtefældernes');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `wordclass`
--

CREATE TABLE `wordclass` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `wordclass` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `wordclass_to_affixclass`
--

CREATE TABLE `wordclass_to_affixclass` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `wordclassid` int UNSIGNED NOT NULL,
  `affixclassid` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `words`
--

CREATE TABLE `words` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` int UNSIGNED NOT NULL,
  `word` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `wordclass` int UNSIGNED NOT NULL,
  `wordstatus` int NOT NULL DEFAULT '1',
  `alternatives` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastuser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contributor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `word_definition` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comments` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `technical_term` int UNSIGNED NOT NULL,
  `fugeelementid` int UNSIGNED NOT NULL,
  `strong_declension` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apostroph` tinyint(1) NOT NULL,
  `log` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastchange` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `wordstatus`
--

CREATE TABLE `wordstatus` (
  `lang` enum('da_DK') NOT NULL DEFAULT 'da_DK',
  `id` smallint NOT NULL,
  `wordstatus` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Indeks for tabel `morphdescr`
--
ALTER TABLE `morphdescr`
  ADD PRIMARY KEY (`lang`,`id`),
  ADD KEY `lang` (`lang`),
  ADD KEY `id` (`id`);

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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `affixrule`
--
ALTER TABLE `affixrule`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `affixrule_to_affixclass`
--
ALTER TABLE `affixrule_to_affixclass`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `fugeelement`
--
ALTER TABLE `fugeelement`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Tilføj AUTO_INCREMENT i tabel `fugeelement_to_affixclass`
--
ALTER TABLE `fugeelement_to_affixclass`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `morphdescr`
--
ALTER TABLE `morphdescr`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Tilføj AUTO_INCREMENT i tabel `start_definitions`
--
ALTER TABLE `start_definitions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- Tilføj AUTO_INCREMENT i tabel `technical_term`
--
ALTER TABLE `technical_term`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Tilføj AUTO_INCREMENT i tabel `unaccepted_word`
--
ALTER TABLE `unaccepted_word`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Tilføj AUTO_INCREMENT i tabel `wordclass`
--
ALTER TABLE `wordclass`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `wordclass_to_affixclass`
--
ALTER TABLE `wordclass_to_affixclass`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `affixrule_ibfk_1` FOREIGN KEY (`morphdescrid`) REFERENCES `morphdescr` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
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
  ADD CONSTRAINT `words_ibfk_1` FOREIGN KEY (`wordclass`) REFERENCES `wordclass` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
