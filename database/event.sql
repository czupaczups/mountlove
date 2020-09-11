-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 11 Wrz 2020, 18:09
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `event`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `event`
--

CREATE TABLE `event` (
  `id_event` int(4) NOT NULL,
  `ename` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `date` date NOT NULL,
  `add_date` date NOT NULL,
  `location` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `description` varchar(350) COLLATE utf8_polish_ci NOT NULL,
  `id_whoadd` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `eventq`
--

CREATE TABLE `eventq` (
  `id_event` int(4) NOT NULL,
  `ename` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `date` date NOT NULL,
  `add_date` date NOT NULL,
  `location` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `description` varchar(350) COLLATE utf8_polish_ci NOT NULL,
  `id_whoadd` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `eventq`
--

INSERT INTO `eventq` (`id_event`, `ename`, `date`, `add_date`, `location`, `description`, `id_whoadd`) VALUES
(5, 'Cyklokarpaty Bieszczady Roadtrip', '2020-10-10', '2020-09-07', 'Ustrzyki Górne', '10 października - sobota - BIESZCZADY ROADTRIP\r\n✔️ zakończenie sezonu w ?jesiennej scenerii\r\n✔️? ~100 km wokół Jeziora Solińskiego\r\n✔️? ~150 km wokół bieszczadzkich połonin\r\nℹ️ https://cyklokarpaty.pl/roadtrip', 4);

--
-- Wyzwalacze `eventq`
--
DELIMITER $$
CREATE TRIGGER `eventdatetrigger` BEFORE INSERT ON `eventq` FOR EACH ROW BEGIN
    SET NEW.add_date= CURDATE();
 END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `eventy`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `eventy` (
`ename` varchar(40)
,`date` date
,`location` varchar(40)
,`description` varchar(350)
,`username` varchar(30)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `format`
--

CREATE TABLE `format` (
  `id_format` int(4) NOT NULL,
  `ftype` varchar(20) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `format`
--

INSERT INTO `format` (`id_format`, `ftype`) VALUES
(1, 'CD'),
(2, 'Vinyl'),
(3, 'Digital');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `muzyka`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `muzyka` (
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `muzykaq`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `muzykaq` (
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `role`
--

CREATE TABLE `role` (
  `id_role` int(5) NOT NULL,
  `rola` varchar(20) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `role`
--

INSERT INTO `role` (`id_role`, `rola`) VALUES
(1, 'Administrator'),
(2, 'User');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id_user` int(4) NOT NULL,
  `username` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_polish_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `id_role` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `name`, `surname`, `email`, `id_role`) VALUES
(7, 'arletawojtas', '6c0e3f6058179fb59c3a92c68c42c53f', 'Arleta', 'Wojtas', 'arleta.wojtas1995@poczta.com', 1),
(8, 'michalkowalski', 'b8255bacd9b951e42817dc836203ad4a', 'Michał', 'Kowalski', 'michalkowalski@poczta.com', 2);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `uzytkownicy`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `uzytkownicy` (
`username` varchar(30)
,`name` varchar(50)
,`surname` varchar(50)
,`email` varchar(50)
,`rola` varchar(20)
);

-- --------------------------------------------------------

--
-- Struktura widoku `eventy`
--
DROP TABLE IF EXISTS `eventy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `eventy`  AS  select `ename` AS `ename`,`date` AS `date`,`location` AS `location`,`description` AS `description`,`user`.`username` AS `username` from (`event` join `user` on(`id_whoadd` = `user`.`id_user`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `muzyka`
--
DROP TABLE IF EXISTS `muzyka`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `muzyka`  AS  select `music`.`performer` AS `performer`,`music`.`title` AS `title`,`music`.`year` AS `year`,`format`.`ftype` AS `ftype`,`genre`.`gname` AS `gname` from ((`music` join `genre` on(`music`.`id_genre` = `genre`.`id_genre`)) join `format` on(`music`.`id_format` = `format`.`id_format`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `muzykaq`
--
DROP TABLE IF EXISTS `muzykaq`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `muzykaq`  AS  select `musicq`.`id_music` AS `id_music`,`musicq`.`performer` AS `performer`,`musicq`.`title` AS `title`,`musicq`.`year` AS `year`,`format`.`ftype` AS `ftype`,`genre`.`gname` AS `gname`,`musicq`.`add_date` AS `add_date`,`user`.`username` AS `username` from (((`musicq` join `genre` on(`musicq`.`id_genre` = `genre`.`id_genre`)) join `format` on(`musicq`.`id_format` = `format`.`id_format`)) join `user` on(`musicq`.`id_whoadd` = `user`.`id_user`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `uzytkownicy`
--
DROP TABLE IF EXISTS `uzytkownicy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `uzytkownicy`  AS  select `user`.`username` AS `username`,`user`.`name` AS `name`,`user`.`surname` AS `surname`,`user`.`email` AS `email`,`role`.`rola` AS `rola` from (`user` join `role` on(`user`.`id_role` = `role`.`id_role`)) ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id_event`),
  ADD KEY `id_whoadd` (`id_whoadd`);

--
-- Indeksy dla tabeli `eventq`
--
ALTER TABLE `eventq`
  ADD PRIMARY KEY (`id_event`),
  ADD KEY `id_whoadd` (`id_whoadd`);

--
-- Indeksy dla tabeli `format`
--
ALTER TABLE `format`
  ADD PRIMARY KEY (`id_format`);

--
-- Indeksy dla tabeli `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`),
  ADD UNIQUE KEY `rola` (`rola`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_role` (`id_role`);

--
-- AUTO_INCREMENT dla tabel zrzutów
--

--
-- AUTO_INCREMENT dla tabeli `event`
--
ALTER TABLE `event`
  MODIFY `id_event` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `eventq`
--
ALTER TABLE `eventq`
  MODIFY `id_event` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `format`
--
ALTER TABLE `format`
  MODIFY `id_format` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`id_whoadd`) REFERENCES `user` (`id_user`);

--
-- Ograniczenia dla tabeli `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
