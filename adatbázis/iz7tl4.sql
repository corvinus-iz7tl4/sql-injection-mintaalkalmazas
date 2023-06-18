-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Máj 19. 18:08
-- Kiszolgáló verziója: 5.7.17
-- PHP verzió: 7.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `iz7tl4`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `gyogyszer`
--

CREATE TABLE `gyogyszer` (
  `id` int(11) NOT NULL,
  `nev` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `adagolas` varchar(15) COLLATE utf8_hungarian_ci NOT NULL,
  `venykotelezett-e` tinyint(1) NOT NULL,
  `betegseg` varchar(25) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `gyogyszer`
--

INSERT INTO `gyogyszer` (`id`, `nev`, `adagolas`, `venykotelezett-e`, `betegseg`) VALUES
(1, 'algoflex', 'napi max 3', 0, 'fájdalomcsillapító'),
(2, 'neocitran', 'napi 3x1 tasak', 0, 'megfázás'),
(5, 'ibuprofen', '1-2szem/4-6óra', 0, 'gyulladáscsökkentés'),
(6, 'aszpirin', 'napi 3x1', 0, 'lázcsillapító'),
(7, 'penicillin', 'vénásan orvos', 1, 'baktériumok ok fertőzések'),
(8, 'guaifenesin', 'napi 15mlx6', 0, 'köhögéscsillapító'),
(9, 'budesonid', 'napi 2', 1, 'inhalátor, köhögés ellen'),
(10, 'c vitamin', 'napi 2', 0, 'vitaminadagolás'),
(11, 'lopedium', 'napi max 4', 0, 'hasi problémák ellen'),
(12, 'cetrizin', 'napi 1', 1, 'allergia ellen'),
(13, 'digoxin', '1 szem/6-8óra', 1, 'szívelégtelenség ellen'),
(14, 'loratadin', 'napi 1', 1, 'bőrproblémák ellen'),
(15, 'cataflam', 'napi 3x1', 0, 'fájdalomcsillapító'),
(16, 'clotrimazole', 'betegség függő', 0, 'fertőzések kezelése'),
(17, 'metoprolol', '25-200mg/nap', 1, 'szívbetegségek kezelése');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orvos`
--

CREATE TABLE `orvos` (
  `id` int(11) NOT NULL,
  `nev` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `szakkepzes` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `pecsetszam` int(5) NOT NULL,
  `telefonszam` varchar(11) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `orvos`
--

INSERT INTO `orvos` (`id`, `nev`, `szakkepzes`, `pecsetszam`, `telefonszam`) VALUES
(1, 'Balázs Katalin', 'gasztroenterológia', 26690, '06375771878'),
(2, 'Pataki Dorina', 'tüdőgyógyászat', 88012, '0669697585'),
(3, 'Gulyás Zsolt', 'bőrgyógyászat', 2477, '06623401778'),
(4, 'Major Ildikó', 'gyerekneurológia', 78522, '06504395194'),
(5, 'Gábor Péter', 'kardiológia', 63741, '06501403114');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `paciens`
--

CREATE TABLE `paciens` (
  `id` int(11) NOT NULL,
  `nev` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `szul_ido` date NOT NULL,
  `tajSzam` int(9) NOT NULL,
  `szemelyi` varchar(8) COLLATE utf8_hungarian_ci NOT NULL,
  `email` varchar(35) COLLATE utf8_hungarian_ci NOT NULL,
  `jelszo` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `orvosID` int(11) NOT NULL,
  `gyogyszerID` int(11) NOT NULL,
  `vizsgalatID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `paciens`
--

INSERT INTO `paciens` (`id`, `nev`, `szul_ido`, `tajSzam`, `szemelyi`, `email`, `jelszo`, `orvosID`, `gyogyszerID`, `vizsgalatID`) VALUES
(1, 'Vágó Blanka', '2000-07-25', 111222333, '123456AB', 'blanka@email.com', '123asd', 1, 5, 2),
(3, 'Gipsz Jakab', '1999-03-05', 123654887, '124578AB', 'jakab.gipsz@gmail.com', 'nagyonTitkos', 3, 13, 6),
(4, 'Faragó István', '1964-03-12', 26122923, '041925BI', 'farago.istvan@gmail.com', 'szuperErős', 2, 2, 3),
(5, 'Juhász Ottó', '1958-12-20', 11454887, '225513HG', 'ajuhasz@yahoo.com', 'JuhaszJelszo12', 1, 15, 1),
(6, 'Hajdú Marietta', '2009-06-27', 504632711, '546631LS', 'mari.hajdu@freemail.com', 'marijdu ', 4, 6, 8),
(7, 'Tóth Boglárka', '1983-05-31', 301257941, '120684MD', 'toth.boglarka@hotmail.com', 'randomPW', 5, 1, 9),
(8, 'Borbély Maja', '1992-05-12', 748320611, '493027PH', 'majaemail@gmail.com', 'orvosJelszo', 3, 13, 5),
(9, 'Kovács Szilvia', '1985-03-12', 980212452, '850312AB', 'kovacs.szilvia@freemail.hu', 'Jelszo123', 4, 16, 3),
(10, 'Nagy Gábor', '1990-04-22', 900725324, '900725GH', 'nagy.gabor@gmail.com', 'Gabor1985', 5, 10, 2),
(11, 'Kovácsné Tóth Éva', '1978-01-03', 780033657, '780103KL', 'totheva@citromail.hu', 'Eva1978!', 2, 6, 9),
(12, 'Horváth János', '1982-09-18', 820918445, '820918OP', 'janos.horvath@gmail.com', 'J@nos1982', 3, 17, 7),
(13, 'Szabó Anna', '1995-12-07', 951207569, '951207QR', 'anna12@gmail.com', 'Anna95@', 4, 14, 7);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vizsgalatok`
--

CREATE TABLE `vizsgalatok` (
  `id` int(11) NOT NULL,
  `nev` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `datum` date NOT NULL,
  `eredmeny` varchar(45) COLLATE utf8_hungarian_ci NOT NULL,
  `szakterület` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `vizsgalatok`
--

INSERT INTO `vizsgalatok` (`id`, `nev`, `datum`, `eredmeny`, `szakterület`) VALUES
(1, 'hasi ultrahang', '2022-11-26', 'májon észlelt ciszta ', 'gasztro'),
(2, 'gyomortükrözés', '2022-12-26', 'normális eredmények, nincs elváltozás', 'gasztro'),
(3, 'mellkas röntgen', '2022-08-17', 'pozítiv tüdődaganat eredmény', 'tüdőgyógyászat'),
(4, 'légzés funkció vizsgálat', '2023-01-03', 'asztma ', 'tüdőgyógyászat'),
(5, 'allergia vizsgálat', '2023-04-04', 'negatív eredmény a vizsgált tesztekre', 'bőrgyógyászat'),
(6, 'HIV szűrés', '2023-02-10', 'negatív teszt', 'bőrgyógyászat'),
(7, 'EEG', '2023-05-07', 'jól müködő alapvető agyi aktivitás', 'gy-neurológia'),
(8, 'reflexvizsgálat', '2022-10-11', 'aszimmetrikus reflexek', 'gy-neurológia'),
(9, 'szív ultrahang', '2022-12-03', 'normális, negatív eredmények', 'kardiológia'),
(10, 'EKG', '2023-03-21', 'szívvezetési rendelleneség', 'kardiológia');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `gyogyszer`
--
ALTER TABLE `gyogyszer`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `orvos`
--
ALTER TABLE `orvos`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `paciens`
--
ALTER TABLE `paciens`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `vizsgalatok`
--
ALTER TABLE `vizsgalatok`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `gyogyszer`
--
ALTER TABLE `gyogyszer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT a táblához `orvos`
--
ALTER TABLE `orvos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT a táblához `paciens`
--
ALTER TABLE `paciens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT a táblához `vizsgalatok`
--
ALTER TABLE `vizsgalatok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
