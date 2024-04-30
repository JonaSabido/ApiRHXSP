-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-04-2024 a las 09:15:28
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rhxsp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `absences`
--

CREATE TABLE `absences` (
  `id` int(11) NOT NULL,
  `id_type_absence` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `id_job` int(11) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) NOT NULL,
  `path` varchar(200) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `antidopings`
--

CREATE TABLE `antidopings` (
  `id` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Administrativo', NULL, NULL),
(2, 'Operativo', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contracts`
--

CREATE TABLE `contracts` (
  `id` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `departments`
--

INSERT INTO `departments` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'TI', NULL, NULL),
(2, 'YCC', NULL, NULL),
(3, 'IKA', NULL, NULL),
(4, 'CANCUN', NULL, NULL),
(5, 'EKO', NULL, NULL),
(6, 'HARBOR', NULL, NULL),
(7, 'PLAYA', NULL, NULL),
(8, 'HARBOR(IKA)', NULL, NULL),
(9, 'SOC', NULL, NULL),
(10, 'TULUM', NULL, NULL),
(11, 'XSP', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diseases`
--

CREATE TABLE `diseases` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `diseases`
--

INSERT INTO `diseases` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Alergia al polvo', NULL, NULL),
(2, 'Alergia a la butiliosina inyectable', NULL, NULL),
(3, 'Alergia a la penicilina', NULL, NULL),
(4, 'Hipertensión', NULL, NULL),
(5, 'Alergia al paracetamol', NULL, NULL),
(6, 'Cuenta con una operación que le dificulta estar de pie por largas jornadas', NULL, NULL),
(7, 'Diabetes tipo 1', NULL, NULL),
(8, 'Diabetes tipo 2', NULL, NULL),
(9, 'Ninguna', NULL, NULL),
(10, 'Alergia a la piña', NULL, NULL),
(11, 'Ansiedad', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emergencies`
--

CREATE TABLE `emergencies` (
  `id` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `reference_name` varchar(255) NOT NULL,
  `type` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `id_department` int(11) NOT NULL,
  `id_job` int(11) NOT NULL,
  `id_recruitment_method` int(11) DEFAULT NULL,
  `code` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `sure_name` varchar(100) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `entry_date` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `nss` varchar(11) NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `curp` varchar(18) NOT NULL,
  `ssp` tinyint(1) NOT NULL,
  `natal_date` date NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `shirt_size` varchar(5) DEFAULT NULL,
  `pants_size` int(11) DEFAULT NULL,
  `shoe_size` int(11) DEFAULT NULL,
  `has_children` tinyint(1) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cp` varchar(5) DEFAULT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`id`, `id_department`, `id_job`, `id_recruitment_method`, `code`, `name`, `sure_name`, `last_name`, `entry_date`, `status`, `gender`, `nss`, `rfc`, `curp`, `ssp`, `natal_date`, `email`, `phone`, `shirt_size`, `pants_size`, `shoe_size`, `has_children`, `address`, `cp`, `comments`, `createdAt`, `updatedAt`) VALUES
(1, 2, 22, 1, 603, 'Carlos Waldemar', 'Perez', 'Alamilla', '2023-12-28', 0, 'Male', '27169515106', 'PEAC951121G11', 'PEAC951121HYNRLR04', 0, '1995-11-21', 'perezalamillacarlos68@gmail.com', '9992920212', 'G', 36, 29, 0, 'Calle 24A, No. 25B, Ext. 342, Fraccionamiento Vergel IV, Mérida, Yucatán, C.P. 97173', '97173', 'null', '0000-00-00 00:00:00', '2024-04-29 12:48:16'),
(2, 2, 16, 1, 38, 'Grecia de la Cruz', 'Diaz', 'Lizama', '2015-09-26', 1, 'Femen', '84139211993', 'DILG920307HV0', 'DILG920307MYNZZR09', 1, '1992-03-07', 'gress.92@hotmail.com', '9999915237', 'CH', 30, 4, 0, 'Calle 46B 1 No. 888 por 137 y 139, Villa Magaña Sur, Mérida, Yucatán. C.P. 97285', '97285', 'ninguno', '2024-04-29 12:54:20', '2024-04-29 12:54:20'),
(3, 1, 19, 1, 1, 'Marco Antonio', 'Freyre', 'Zumbardo', '2020-01-01', 1, 'Male', '03168530644', 'FEZM850118KI2', 'FEZM850118HYNRMR05', 1, '1985-01-18', 'mfreyre@xsp.mx', '999 1915734', '2EG', 42, 0, 0, 'Calle 29C No. 718B por 88 y 90, Viva Caucel, Mérida Yucatán. C.P. 97314', '97314', 'ninguno', '2024-04-29 20:11:30', '2024-04-29 20:11:30'),
(4, 1, 19, 4, 1, 'Marco Antonio', 'Freyre', 'Zumbardo', '2020-01-01', 1, 'Male', '03168530644', 'FEZM850118KI2', 'FEZM850118HYNRMR05', 0, '1985-01-18', 'mfreyre@xsp.mx', '999 1915734', '2EG', 42, 0, 0, 'Calle 29C No. 718B por 88 y 90, Viva Caucel, Mérida Yucatán. C.P. 97314', ' 9731', '', '2024-04-30 04:40:32', '2024-04-30 04:40:32'),
(5, 1, 30, 15, 2, 'Maria Elena', 'Bates', 'Martin', '2021-09-06', 1, 'Femen', '84128608167', 'BAME8611079R2', 'BAME861107MTCTRL01', 1, '1986-11-07', 'elebain@icloud.com', '999 9004013', '2EG', 42, 0, 0, 'Calle 44 No. 282 por 31 y 33, Dzodzil Norte, Mérida, Yucatán. C.P. 97115', '97115', '', '2024-04-30 04:45:06', '2024-04-30 04:45:06'),
(6, 2, 22, 15, 14, 'Taurino', 'Broca', 'De Dios', '2017-03-02', 1, 'Male', '02166802443', 'BODT680911B94', 'BODT680911HTCRSR05', 0, '1968-09-11', 'broca18@hotmail.com', '999 3555954', 'M', 36, 26, 1, 'Calle 59C No. 558A por 54 y 58, Fracc Reparto Granjas, Kanasin, Yucatán. C.P. 97379', '97379', '', '2024-04-30 04:46:55', '2024-04-30 04:46:55'),
(7, 2, 22, 15, 16, 'Juan Bautista', 'Cabañas', 'Chan', '2012-06-19', 1, 'Male', '84126900293', 'CACJ690523CJ8', 'CACJ690523HCCBHN00', 1, '1969-05-23', 'cabanasjuan247@gmail.com', '999 2359224', 'G', 40, 26, 1, 'Calle 137 No. 262 por 46 y 48, San Nicolás Sur, Mérida, Yucatán. C.P. 97289', '97289', '', '2024-04-30 04:48:42', '2024-04-30 04:48:42'),
(8, 3, 22, 15, 18, 'Vicente Rafael', 'Canche', 'Pech', '2014-05-15', 1, 'Male', '84866708179', 'CAPV6711309QA', 'CAPV671130HYNNCC10', 0, '1967-11-30', 'canchevrcp1245@gmail.com', '999 4193710', 'EG', 42, 27, 1, 'Calle 60A No. 607 por 73 y 75, Fracc. Santa Isabel, Kanasin, Yucatán. C.P. 97370', ' 9737', '', '2024-04-30 04:52:47', '2024-04-30 04:52:47'),
(9, 2, 22, 15, 20, 'Cecilia Guadalupe', 'Canto ', 'Dzul', '2022-12-27', 1, 'Femen', '03188446433', 'CADC8411226Y8', 'CADC841122MYNNZC07', 1, '1984-11-22', 'ceci-canto@hotmail.com', '999 3239753', 'G', 36, 25, 1, 'Calle 63 No. 546 I por 58 y 62, Las Granjas, Kanasin, Yucatán. C.P. ', '0', '', '2024-04-30 04:55:50', '2024-04-30 04:55:50'),
(10, 2, 22, 15, 22, 'Sergio Alberto', 'Canul', 'Tamay', '2011-09-04', 1, 'Male', '84117100150', 'CATS710728S65', 'CATS710728HCCNMR00', 0, '1971-07-28', 'canulsergio28@gmail.com', '9996373987', 'G', 38, 26, 1, 'Calle 57 No. 283, Fracc del Sur, Serapio Rendón, Mérida, Yucatán. C.P. 97285', '97285', '', '2024-04-30 04:57:51', '2024-04-30 04:57:51'),
(11, 3, 22, 15, 26, 'Fernando Antonio', 'Ceballos ', 'Canseco ', '2016-03-17', 1, 'Male', '84897131755', 'CECF711007ME8', 'CECF711007HDFBNR05', 1, '1971-10-07', 'ferceballoscanseco@hotmail.com', '999 9914199', 'EG', 38, 27, 1, 'Calle 93 No. 407 A por 40 y 42 A, Santa Rosa, Mérida, Yucatán. C.P. 97279', '97279', '', '2024-04-30 05:06:34', '2024-04-30 05:06:34'),
(12, 3, 22, 15, 29, 'Jose Antonio', 'Chable', 'Moo', '2011-12-14', 1, 'Male', '81877105353', 'CAMA7101246GA', 'CAMA710124HCCHXN02', 0, '1971-01-24', 'chmooantonio71@gmail.com', '999 6159747', 'G', 36, 26, 1, 'Calle 35 No. 450 por 26A y 28, Fracc. Graciano Ricalde. Mérida, Yucatán. C.P. 97256', '97256', '', '2024-04-30 05:08:30', '2024-04-30 05:08:30'),
(13, 2, 22, 15, 31, 'Mario Enrique', 'Che', 'Cruz', '2018-07-16', 1, 'Male', '30906950495', 'CECM691010G23', 'CECM691010HCCHRR08', 1, '1969-10-10', 'mariochebbh1@gmail.com', '999 5442758', 'EG', 42, 27, 1, 'Calle 71B No. 1115 por 132 y 136, Susula Xoclan, Mérida, Yucatán. C.P. 97249 ', '97249', '', '2024-04-30 05:28:42', '2024-04-30 05:28:42'),
(15, 2, 23, 15, 34, 'Eduardo Jose', 'Cruz', 'Solis', '2019-05-20', 1, 'Male', '84947728055', 'CUSE770821VCA', 'CUSE770821HYNRLD05', 1, '1977-08-21', 'eduardo.cruz210877@gmail.com', '999 1274899', 'M', 36, 27, 1, 'Calle 17 E No. 691por 72 C, Fracc. Cerradas de Gran Santa Fe, Mérida, Yucatán. C.P. 97314', '97314', '', '2024-04-30 05:31:11', '2024-04-30 05:31:11'),
(16, 2, 23, 15, 35, 'Jose Manuel', 'Cruz', 'Peraza', '2018-02-22', 1, 'Male', '84897019620', 'CUPM700702VC9', 'CUPM700702HYNRRN08', 0, '1970-07-02', 'jcruz4702@gmail.com', '999 3783475', 'CH', 30, 27, 1, 'Calle 47 No. 700 G por 94 y 94 A, Caucel, Mérida, Yucatán. C.P. 97314', '97314', '', '2024-04-30 05:33:46', '2024-04-30 05:33:46'),
(17, 3, 22, 15, 36, 'Raul Jesus', 'Cruz Y', 'Aviles', '2015-12-10', 1, 'Male', '84036400418', 'CUAR6401271W5', 'CUAR640127HYNRVL07', 0, '1964-01-27', 'cruzavilesraul@gmail.com', '991 1004798', 'EG', 38, 27, 1, 'Calle 21 No. 85 por 14 y 16, Centro, Mérida, Yucatán. C.P. 97470', '97470', '', '2024-04-30 05:35:33', '2024-04-30 05:35:33'),
(18, 2, 16, 15, 38, 'Grecia de la Cruz', 'Diaz', 'Lizama', '2015-09-26', 1, 'Femen', '84139211993', 'DILG920307HV0', 'DILG920307MYNZZR09', 1, '1992-03-07', 'gress.92@hotmail.com', '999 7471590', 'CH', 30, 4, 0, 'Calle 46B 1 No. 888 por 137 y 139, Villa Magaña Sur, Mérida, Yucatán. C.P. 97285', '97285', '', '2024-04-30 05:37:50', '2024-04-30 05:37:50'),
(19, 3, 22, 15, 41, 'Jorge Rageney', 'Erosa', 'Martin', '2022-12-20', 1, 'Male', '84947112763', 'EOMJ710213PI5', 'EOMJ710213HYNRRR01', 1, '1971-02-13', 'jerosa.malito@gmail.com', '999 2287754', 'M', 32, 26, 1, 'Calle 75 No. 748 entre 48A y 50, Col. Tixcacal-Opichen. C.P. 97239', '97239', '', '2024-04-30 05:39:31', '2024-04-30 05:39:31'),
(20, 2, 22, 15, 47, 'Evelia', 'Gomez', 'Matus', '2017-07-25', 1, 'Femen', 'GOME641202M', 'GOME641202VCA', 'GOME641202MOCMTV08', 1, '1964-12-02', 'egomezmatus@gmail.com', '999 2634190', '2EG', 38, 25, 1, 'Calle 43 No. 289 por 26 y 32, Fracc. Pensiones, Mérida, Yucatán. C.P. 97219', '97219', '', '2024-04-30 05:41:19', '2024-04-30 05:41:19'),
(21, 3, 22, 15, 49, 'Roger Armando', 'Gomez', 'Cocom', '2013-05-20', 1, 'Male', '84856708486', 'GOCR670131FC9', 'GOCR670131HYNMCG05', 0, '1967-01-31', 'argc151967@gmail.com', '999 7392211', 'G', 36, 8, 1, 'Calle 64H No. 701 Esq por 115, Castilla Cámara , Mérida, Yucatán. C.P. 97278', ' 9727', '', '2024-04-30 05:42:59', '2024-04-30 05:42:59'),
(22, 2, 25, 15, 53, 'Riquelme', 'Gonzalez', 'Hernandez', '2017-05-17', 1, 'Male', '02177754674', 'GOHR770414PD0', 'GOHR770414HVZNRQ02', 1, '1977-04-14', 'riky_gohe@hotmail.com', '999 2743341', 'CH', 32, 27, 1, 'Calle 165 No. 318 por 80 y 90, Emiliano Zapata Sur III, Mérida, Yucatán. C.P. 97297', '97297', '', '2024-04-30 05:44:40', '2024-04-30 05:44:40'),
(23, 2, 12, 15, 63, 'Gaspar Israel', 'Mena', 'Rosas', '2013-11-22', 1, 'Male', '84058609953', 'MERG860208I98', 'MERG860208HYNNSS07', 1, '1986-02-08', 'menagaspar5@gmail.com', '999 331 8531', 'G', 42, 29, 1, 'Calle 133 No. 837D por 46A y 46B, Villa Magna del Sur, Mérida, Yucatán. C.P. 97285', '97285', '', '2024-04-30 05:47:48', '2024-04-30 05:47:48'),
(24, 2, 22, 15, 67, 'Fernando Raul', 'Moguel', 'Perez', '2013-06-01', 1, 'Male', '84127200297', 'MOPF720621LQ8', 'MOPF720621HYNGRR04', 0, '1972-06-21', 'moguelfernando214@gmail.com', '999 2437521', 'G', 36, 27, 1, 'Calle 99 No. 560D por 64D, Col. Meliton Salazar, Mérida, Yucatán. C.P. 97269', '97269', '', '2024-04-30 05:49:33', '2024-04-30 05:49:33'),
(25, 3, 22, 15, 71, 'Florentino', 'Morato', 'Cruz', '2017-03-08', 1, 'Male', '84016000238', 'MOCF601124QDA', 'MOCF601124HVZRRL08', 0, '1960-11-24', 'barrazon60@gmail.com', '999 1524704', 'EG', 36, 10, 1, 'no tiene', '0', '', '2024-04-30 05:51:44', '2024-04-30 05:51:44'),
(26, 2, 22, 15, 72, 'Jose Jesus', 'Mugarte', 'Hoil', '2013-03-15', 1, 'Male', '84997904366', 'MUHJ790210J18', 'MUHJ790210HYNGLS11', 0, '1979-02-10', 'santamugarte@gmail.com', '999 1377006', 'M', 34, 26, 1, 'Calle 38 No. 397 por 17D diagonal y 17B diagonal, Fracc. Juan Pablo II, Mérida, Yucatán. C.P. 97246', ' 9724', '', '2024-04-30 05:54:21', '2024-04-30 05:54:21'),
(27, 3, 22, 15, 73, 'Jose Rodolfo', 'Muñoz', 'Gonzalez', '2019-02-18', 1, 'Male', '84987405531', 'MUGR740418B81', 'MUGR740418HYNXND05', 1, '1974-04-18', 'mgjrodolfo74@gmail.com', '999 5619817', 'EG', 38, 28, 1, 'Calle 37 No. 680A Lote 41 por 78 y 80. Fracc. Horizontes de Caucel, Mérida, Yucatán. C.P. 97314', '97314', '', '2024-04-30 05:56:29', '2024-04-30 05:56:29'),
(28, 3, 22, 15, 74, 'Gregorio Rodrigo', 'Noh', 'Rosales', '2014-05-26', 1, 'Male', '84967730569', 'NORG770312SA7', 'NORG770312HYNHSR09', 1, '1977-03-12', 'roderick77gisi@gmail.com', '999 3299083', 'M', 32, 27, 1, 'Calle 19 por 24 y 26, Hoctun, Yucatán. C.P. 97480', '97480', '', '2024-04-30 05:57:48', '2024-04-30 05:57:48'),
(29, 2, 22, 15, 75, 'Virginia de los Angeles', 'Noh', 'Cauich', '2016-05-09', 1, 'Femen', '84947502864', 'NOCV750802132', 'NOCV750802MYNHCR04', 1, '1975-08-02', 'Virginia.noh.765@gmail.com', '999 5690797', 'M', 32, 26, 1, 'Calle 48 No. 765R por 41 y 43A, Fracc. Piedra de Agua, Umán, Yucatán. C.P. 97392', ' 9739', '', '2024-04-30 05:59:27', '2024-04-30 05:59:27'),
(30, 2, 25, 15, 80, 'Jorge Antonio', 'Pam', 'Baas', '2014-03-24', 1, 'Male', '84088507953', 'PABJ850328UM0', 'PABJ850328HYNMSR00', 1, '1985-03-28', 'jorgepam@live.com.mx', '999 3401273', 'G', 38, 28, 1, 'Calle 23 No. 521 por 4C y 4D, Fracc. Victoria Kanasin, Kanasin, Yucatán. C.P. 97370 ', '97370', '', '2024-04-30 06:01:12', '2024-04-30 06:01:12'),
(31, 2, 27, 15, 82, 'Maria Argelia', 'Pech', 'May', '2017-02-22', 1, 'Femen', '84957705282', 'PEMA7707311W3', 'PEMA770731MQRCYR00', 0, '1977-07-31', 'mariaargeliapechmay@gmail.com', '999 6154168', 'M', 34, 25, 1, 'Calle 165 No. 307 por 50 y 52C, Fracc Plan de Ayala, Xmatkuil, Yucatán. C.P. 97390', '97390', '', '2024-04-30 06:02:59', '2024-04-30 06:02:59'),
(32, 2, 22, 15, 83, 'Martin Enrique', 'Pech', 'Castillo', '2016-01-09', 1, 'Male', '84987401027', 'PECM740522TF1', 'PECM740522HYNCSR00', 0, '1974-05-22', 'pechmartin24@gmail.com', '999 2985924', 'CH', 29, 25, 1, 'Calle 62 No. 379 por 81, Col. Mulchechen III, Kanasin Yucatán. C.P. 97370', '97370', '', '2024-04-30 06:04:38', '2024-04-30 06:04:38'),
(33, 2, 23, 15, 84, 'Martiniano David', 'Pech', 'Puc', '2019-08-14', 1, 'Male', '84038212803', 'PEPM820220UX4', 'PEPM820220HYNCCR07', 0, '1982-02-20', 'davidpechpuc@hotmail.com', '999 1446206', 'M', 34, 26, 1, 'Calle 26 No. 120 por 27 y 27A, Chicxulub Pueblo, Chicxulub, Yucatán. C.P. 97340', '97340', '', '2024-04-30 06:15:06', '2024-04-30 06:15:06'),
(34, 2, 18, 15, 88, 'Joel Emilio', 'Pool', 'Chuc', '2011-05-23', 1, 'Male', '84927606073', 'POCJ760409E20', 'POCJ760409HYNLHL04', 1, '1976-04-09', 'joelpoolc@gmail.com', '999 366565', 'CH', 32, 26, 1, 'Calle 12 S/N por 15 y 18, Loc. Sierra Papacal, Mérida, Yucatán. C.P. 97302', '97302', '', '2024-04-30 06:16:49', '2024-04-30 06:16:49'),
(35, 1, 26, 15, 92, 'Bladimir Alejandro', 'Ramirez', 'May', '2019-07-31', 1, 'Male', '63169543210', 'RAMB9508271BA', 'RAMB950827HYNMYL05', 0, '1995-08-27', 'alejandroramirez4715@gmail.com', '999 247 1550', 'G', 36, 7, 1, 'Calle 43 No. 410A por 36 y 38, Col. Lourdes Industrial, Mérida, Yucatán. C.P. 97155', '97155', '', '2024-04-30 06:20:16', '2024-04-30 06:20:16'),
(36, 9, 23, 15, 100, 'Daniel Alberto', 'Salazar', 'Perez', '2016-02-02', 1, 'Male', '84018002372', 'SAPD800112DT8', 'SAPD800112HYNLRN01', 0, '1980-01-12', 'Dang_salazar@hotmail.com', '999 1185421', 'M', 34, 26, 1, 'Calle 20D No. 555 por 97, Fracc. Dzoyola, Kanasin, Yucatán. C.P. 97373', '97373', '', '2024-04-30 06:22:53', '2024-04-30 06:22:53'),
(37, 3, 20, 15, 101, 'Hector', 'Sanchez', 'Nieto', '2019-10-18', 1, 'Male', '12027821490', 'SANH780529C15', 'SANH780529HDFNTC09', 0, '1978-05-29', 'hsanchez@xsp.mx', '999 2783737', 'EG', 38, 10, 1, 'Calle 37 No. 394 por 37 y 28, Fracc. Juan Pablo II, Mérida Yucatán. C.P. 97246', '97246', '', '2024-04-30 06:25:29', '2024-04-30 06:25:29'),
(38, 2, 28, 15, 111, 'Carlos Isai', 'Vazquez', 'Ramirez', '2018-09-12', 1, 'Male', '84109109334', 'VARC911024LI3', 'VARC911024HYNZMR08', 1, '1991-10-24', 'aguilavazquezcv24@gmail.com', '999 2629891', 'CH', 32, 30, 1, 'Calle 49A No. 459 por 24 y 26, Col. Juan Pablo II, Mérida, Yucatán. C.P. 97246', '97246', '', '2024-04-30 06:28:30', '2024-04-30 06:28:30'),
(39, 3, 22, 15, 112, 'Sergio Rene ', 'Ventura ', 'Escobedo ', '2015-12-17', 1, 'Male', '84876603733', 'VEES650730LJ7', 'VEES650730HYNNSR07', 0, '1965-07-30', 'serventura14@hotmail.com', '999 7391979', 'G', 36, 27, 1, 'Calle 48 No. 213 por 21 y 23, Col. Roma, Mérida, Yucatán. C.P. 97218', '97218', '', '2024-04-30 06:30:07', '2024-04-30 06:30:07'),
(40, 11, 1, 15, 114, 'Alma Pamela', 'Zapata', 'Leon', '2020-02-01', 1, 'Femen', '05169102604', 'ZALA910509KN8', 'ZALA910509MYNPNL07', 0, '1991-05-09', 'pamzapata6@gmail.com', '999 3880470', 'CH', 30, 5, 0, 'Calle 53E No. 405 por 56 y 58, Francisco de Montejo, Mérida, Yucatán. C.P. 97203', '97203', '', '2024-04-30 06:33:21', '2024-04-30 06:33:21'),
(41, 3, 22, 15, 125, 'Pedro Angel', 'Mejia', 'Segura', '2020-02-11', 1, 'Male', '84896925256', 'MESP691102H44', 'MESP691102HCCJGD00', 1, '1969-11-02', 'petermeseg@gmail.com', '999 3294126', 'CH', 29, 26, 1, 'Calle 18 No. 340 por 39 y 41 Col. Emiliano Zapata Oriente, Mérida, Yucatán. C.P. 97144', '97144', '', '2024-04-30 06:35:18', '2024-04-30 06:35:18'),
(42, 7, 24, 15, 135, 'Edmundo', 'Magaña', 'Rodulfo', '2020-05-16', 1, 'Male', '02196092080', 'MARE6006144H1', 'MARE600614HDFGDD02', 0, '1960-06-14', 'recnomxsp@gmail.com', '999 1466418', 'CH', 0, 0, 0, 'Calle 49A No. 444 por 58 y 60, Fracc. Francisco de Montejo, Mérida, Yucatán. C.P. 97203', '97203', '', '2024-04-30 06:38:56', '2024-04-30 06:38:56'),
(43, 9, 13, 15, 139, 'Mauricio Isaias', 'Duran', 'Galera', '2022-12-02', 1, 'Male', '84086901448', 'DUGM691006AL0', 'DUGM691006HYNRLR09', 0, '1969-10-06', 'angelnocturno6937@gmail.com', '999 3229055', 'EG', 36, 6, 1, 'Calle 129B No. 165 por 46 y 44, Col. Serapio Rendón 11, Mérida, Yucatán. C.P. 97285', '97285', '', '2024-04-30 06:43:53', '2024-04-30 06:43:53'),
(44, 11, 2, 15, 146, 'Jonathan Armin', 'Mijangos', 'Balam', '2020-04-09', 1, 'Male', '19159370626', 'MIBJ930824S85', 'MIBJ930824HYNJLN01', 0, '1993-08-24', 'jhony931407@hotmail.com', '999 2979124', 'CH', 32, 8, 0, 'Calle 17 No. 127 por 16 y 18. Col. Los Arcos, Umán, Yucatán. C.P. 97390', '97390', '', '2024-04-30 06:53:25', '2024-04-30 06:53:25'),
(45, 4, 29, 15, 154, 'Miguel', 'Lanzagorta', 'Mata', '2020-05-16', 1, 'Male', '03197033941', 'LAMM700430IXA', 'LAMM700430HPLNTG01', 0, '1970-04-30', 'recnomxsp@gmail.com', 'no tiene', 'CH', 0, 0, 0, 'Cto. Gallegos M 21 L 6, Sup. Mza. 323, Fracc. Gran Santa Fe III, Benito Juárez, Quintana Roo. C.P. 77535', '77535', '', '2024-04-30 06:55:22', '2024-04-30 06:55:22'),
(46, 2, 22, 15, 160, 'Felipe de Jesus', 'Pacheco', 'Chuc', '2020-07-10', 1, 'Male', '84068413917', 'PACF840205KY6', 'PACF840205HYNCHL04', 0, '1984-02-05', 'felipe18chuc@gmail.com', '999 5510638', 'G', 36, 27, 1, 'Calle 34 S/N por 15 y 13, Col. Santo Domingo, Hunucma, Yucatán. C.P. 97353', '97353', '', '2024-04-30 06:58:41', '2024-04-30 06:58:41'),
(47, 2, 22, 15, 177, 'Edwin Mizael', 'Pool', 'Moreno', '2020-11-03', 1, 'Male', '84078823063', 'POME880215M57', 'POME880215HYNLRD07', 0, '1988-02-15', 'mizaelpool88@gmail.com', '999 7380722', 'G', 34, 27, 1, 'Calle 32 No. 333-12 SM 37 Mz 0492, Lt. S/N, Niv. 03, Col. Villa Bonita, Mérida, Yucatán. C.P. 97285', ' 9728', '', '2024-04-30 07:00:19', '2024-04-30 07:00:19'),
(48, 2, 22, 15, 182, 'Julian', 'Perez', 'Martinez', '2020-11-25', 1, 'Male', '14047900908', 'PEMJ7908295D2', 'PEMJ790829HTCRRL00', 0, '1979-08-29', 'julianperezmartinez29@gmail.com', '999 1593354', 'G', 36, 7, 1, 'Calle 88L No. 8 por 165 y 167, Col. Emiliano Zapata Sur III, Mérida. C.P. 97297', '97297', '', '2024-04-30 07:02:03', '2024-04-30 07:02:03'),
(49, 9, 23, 15, 185, 'Mariela Jhoana', 'Uc', 'Escobar', '2021-01-06', 1, 'Femen', '84119313587', 'UEMA930624327', 'UXEM930624MYNCSR04', 1, '1993-06-24', 'ma.jhoana06@hotmail.com', '999 6415440', 'EG', 42, 24, 0, 'Calle 75B No. 444 por 28 y 28A, Col. Tixcacal-Opichen, Mérida, Yucatán. C.P. 97314', ' 9731', '', '2024-04-30 07:04:03', '2024-04-30 07:04:03'),
(50, 3, 22, 15, 190, 'Julio Alfredo', 'Perez', 'Ruiz', '2021-02-03', 1, 'Male', '38169422979', 'PERJ941117TA3', 'PERJ941117HMCRZL08', 0, '1994-11-17', 'chikitin942022@gmail.com', '999 2463280', 'M', 34, 45, 1, 'Calle 20-SR S/N LT-8 por 43 y 45, Col. Salvador Alvarado Sur, Mérida, Yucatán. C.P. 97196', ' 9719', '', '2024-04-30 07:06:08', '2024-04-30 07:06:08'),
(51, 2, 22, 15, 192, 'Jose Ernesto', 'Castillo', 'Basulto', '2021-02-03', 1, 'Male', '27159473266', 'CABE940326533', 'CABE940326HYNSSR09', 0, '1994-03-26', 'thosemdgicalgrernhgs@gmail.com', '990 2003388', 'M', 36, 45, 1, 'Calle 80 S/N por 129 y 131, Col. San Antonio Xluch, Mérida, Yucatán. C.P. 97290', '97290', '', '2024-04-30 07:07:48', '2024-04-30 07:07:48'),
(52, 11, 3, 15, 198, 'Javier de Jesus ', 'Calderon', 'Yam', '2008-03-16', 1, 'Male', '84906926021', 'CAYJ691015NU4', 'CAYJ691015HYNLMV03', 0, '1969-10-15', 'javiercalderon@me.com', '999 3349105', 'CH', 0, 0, 1, 'Calle 28 A No. 338 por 19A y 19B, Fracc. San Francisco Chuburna, Mérida, Yucatán. C.P. 97206', '97206', '', '2024-04-30 07:09:38', '2024-04-30 07:09:38'),
(53, 3, 22, 15, 201, 'Jose Alfredo', 'Gonzalez', 'Cocom', '2023-10-16', 1, 'Male', '84997401223', 'GOCA741206EY0', 'GOCA741206HYNNCL02', 1, '1974-12-06', 'jgonzalez_cocom@hotmail.com', '999 2740273', 'G', 36, 27, 1, 'Calle 17 No. 826 por 68, Col. Jardines de Mérida, Mérida, Yucatán. C.P. 97135', '97135', '', '2024-04-30 07:11:02', '2024-04-30 07:11:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee_diseases`
--

CREATE TABLE `employee_diseases` (
  `id` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `id_disease` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee_leaves`
--

CREATE TABLE `employee_leaves` (
  `id` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `leave_date` date NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee_reentries`
--

CREATE TABLE `employee_reentries` (
  `id` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `reentry_date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee_vacations`
--

CREATE TABLE `employee_vacations` (
  `id` int(11) NOT NULL,
  `id_vacation_time` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `available_days` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `extra_times`
--

CREATE TABLE `extra_times` (
  `id` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `date` date NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `birth_certificate` varchar(200) NOT NULL,
  `identification` varchar(200) NOT NULL,
  `curp` varchar(200) NOT NULL,
  `nss` varchar(200) NOT NULL,
  `address_certification` varchar(200) NOT NULL,
  `studies_certification` varchar(200) DEFAULT NULL,
  `type_studies_certification` varchar(20) DEFAULT NULL,
  `tax_certificate` varchar(200) NOT NULL,
  `smn` varchar(200) DEFAULT NULL,
  `no_criminal_certificate` varchar(200) DEFAULT NULL,
  `health_certificate` varchar(200) DEFAULT NULL,
  `sv` varchar(200) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `id_area` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `jobs`
--

INSERT INTO `jobs` (`id`, `id_area`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Gerente Administrativo', NULL, NULL),
(2, 1, 'Coordinador de Nominas', NULL, NULL),
(3, 1, 'Director de Cyber Y Seguridad Electrónica', NULL, NULL),
(4, 1, 'Auxiliar de limpieza', NULL, NULL),
(5, 1, 'Director de operaciones', NULL, NULL),
(6, 1, 'Administración Eko', NULL, NULL),
(7, 1, 'Auxiliar de Recursos Humanos', NULL, NULL),
(8, 1, 'Gerente de Recursos Humanos', NULL, NULL),
(9, 1, 'Auxiliar de Finanzas', NULL, NULL),
(10, 1, 'Coordinadora de Recursos Humanos', NULL, NULL),
(11, 2, 'Coordinador de Servicio (Harbor)', NULL, NULL),
(12, 2, 'Coordinador de SOC', NULL, NULL),
(13, 2, 'Coordinador de Validación de Riesgos', NULL, NULL),
(14, 2, 'Coordinador de IKA', NULL, NULL),
(15, 2, 'Coordinador Operativo', NULL, NULL),
(16, 2, 'Coordinadora de Procesos', NULL, NULL),
(17, 2, 'Director General', NULL, NULL),
(18, 2, 'EKOGOLF', NULL, NULL),
(19, 2, 'Gerente de Seguridad Electrónica', NULL, NULL),
(20, 2, 'Gerente Operativo IKA', NULL, NULL),
(21, 2, 'Gerente Operativo YCC', NULL, NULL),
(22, 2, 'Guardia de Seguridad', NULL, NULL),
(23, 2, 'Monitorista', NULL, NULL),
(24, 2, 'Operativo de Seguridad', NULL, NULL),
(25, 2, 'Patrullero', NULL, NULL),
(26, 2, 'Soporte de Seguridad Electrónica', NULL, NULL),
(27, 2, 'Supervisor', NULL, NULL),
(28, 2, 'Supervisor Casa Club', NULL, NULL),
(29, 2, 'Supervisor de Seguridad', NULL, NULL),
(30, 2, 'Técnico de Seguridad Electrónica', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recommendations`
--

CREATE TABLE `recommendations` (
  `id` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `id_recommended_employee` int(11) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recommendation_payments`
--

CREATE TABLE `recommendation_payments` (
  `id` int(11) NOT NULL,
  `id_recommendation` int(11) NOT NULL,
  `id_paying_employee` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `status` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recruitment_methods`
--

CREATE TABLE `recruitment_methods` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `recruitment_methods`
--

INSERT INTO `recruitment_methods` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Facebook', NULL, NULL),
(2, 'Cambio de empresa a XSP', NULL, NULL),
(3, 'Computrabajo', NULL, NULL),
(4, 'Facebook', NULL, NULL),
(5, 'Feria de empleo en Maxcanú', NULL, NULL),
(6, 'Feria de empleo', NULL, NULL),
(7, 'Guardia en Harbor', NULL, NULL),
(8, 'Página de empleo', NULL, NULL),
(9, 'Posteo en Maxcanu', NULL, NULL),
(10, 'Recomendación', NULL, NULL),
(11, 'Recomendación familiar', NULL, NULL),
(12, 'Recomandación lanzagorta', NULL, NULL),
(13, 'Referido', NULL, NULL),
(14, 'Reingreso', NULL, NULL),
(15, 'Ninguno', '2024-04-30 04:40:59', '2024-04-30 04:40:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trainings`
--

CREATE TABLE `trainings` (
  `id` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_absences`
--

CREATE TABLE `type_absences` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `type_absences`
--

INSERT INTO `type_absences` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Vacaciones', NULL, NULL),
(2, 'Permiso sin Goce', NULL, NULL),
(3, 'Incapacidad', NULL, NULL),
(4, 'Retardo', NULL, NULL),
(5, 'Nuevo Ingreso', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'gabriela', 'gabriela@rhxsp.com', '12345', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacation_times`
--

CREATE TABLE `vacation_times` (
  `id` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_year` date NOT NULL,
  `days` int(11) NOT NULL,
  `available_days` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `absences`
--
ALTER TABLE `absences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type_absence` (`id_type_absence`),
  ADD KEY `id_employee` (`id_employee`),
  ADD KEY `id_job` (`id_job`);

--
-- Indices de la tabla `antidopings`
--
ALTER TABLE `antidopings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employee` (`id_employee`);

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employee` (`id_employee`);

--
-- Indices de la tabla `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `emergencies`
--
ALTER TABLE `emergencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employee` (`id_employee`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_department` (`id_department`),
  ADD KEY `id_job` (`id_job`),
  ADD KEY `id_recruitment_method` (`id_recruitment_method`);

--
-- Indices de la tabla `employee_diseases`
--
ALTER TABLE `employee_diseases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employee` (`id_employee`),
  ADD KEY `id_disease` (`id_disease`);

--
-- Indices de la tabla `employee_leaves`
--
ALTER TABLE `employee_leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employee` (`id_employee`);

--
-- Indices de la tabla `employee_reentries`
--
ALTER TABLE `employee_reentries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employee` (`id_employee`);

--
-- Indices de la tabla `employee_vacations`
--
ALTER TABLE `employee_vacations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_vacation_time` (`id_vacation_time`);

--
-- Indices de la tabla `extra_times`
--
ALTER TABLE `extra_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employee` (`id_employee`);

--
-- Indices de la tabla `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employee` (`id_employee`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_area` (`id_area`);

--
-- Indices de la tabla `recommendations`
--
ALTER TABLE `recommendations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employee` (`id_employee`),
  ADD KEY `id_recommended_employee` (`id_recommended_employee`);

--
-- Indices de la tabla `recommendation_payments`
--
ALTER TABLE `recommendation_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_recommendation` (`id_recommendation`),
  ADD KEY `id_paying_employee` (`id_paying_employee`);

--
-- Indices de la tabla `recruitment_methods`
--
ALTER TABLE `recruitment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trainings`
--
ALTER TABLE `trainings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employee` (`id_employee`);

--
-- Indices de la tabla `type_absences`
--
ALTER TABLE `type_absences`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `vacation_times`
--
ALTER TABLE `vacation_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employee` (`id_employee`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `absences`
--
ALTER TABLE `absences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `antidopings`
--
ALTER TABLE `antidopings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `diseases`
--
ALTER TABLE `diseases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `emergencies`
--
ALTER TABLE `emergencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `employee_diseases`
--
ALTER TABLE `employee_diseases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `employee_leaves`
--
ALTER TABLE `employee_leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `employee_reentries`
--
ALTER TABLE `employee_reentries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `employee_vacations`
--
ALTER TABLE `employee_vacations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `extra_times`
--
ALTER TABLE `extra_times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `recommendations`
--
ALTER TABLE `recommendations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recommendation_payments`
--
ALTER TABLE `recommendation_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recruitment_methods`
--
ALTER TABLE `recruitment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `trainings`
--
ALTER TABLE `trainings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `type_absences`
--
ALTER TABLE `type_absences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `vacation_times`
--
ALTER TABLE `vacation_times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `absences`
--
ALTER TABLE `absences`
  ADD CONSTRAINT `absences_ibfk_1` FOREIGN KEY (`id_type_absence`) REFERENCES `type_absences` (`id`),
  ADD CONSTRAINT `absences_ibfk_2` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `absences_ibfk_3` FOREIGN KEY (`id_job`) REFERENCES `jobs` (`id`);

--
-- Filtros para la tabla `antidopings`
--
ALTER TABLE `antidopings`
  ADD CONSTRAINT `antidopings_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`);

--
-- Filtros para la tabla `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`);

--
-- Filtros para la tabla `emergencies`
--
ALTER TABLE `emergencies`
  ADD CONSTRAINT `emergencies_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`);

--
-- Filtros para la tabla `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`id_job`) REFERENCES `jobs` (`id`),
  ADD CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`id_recruitment_method`) REFERENCES `recruitment_methods` (`id`);

--
-- Filtros para la tabla `employee_diseases`
--
ALTER TABLE `employee_diseases`
  ADD CONSTRAINT `employee_diseases_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `employee_diseases_ibfk_2` FOREIGN KEY (`id_disease`) REFERENCES `diseases` (`id`);

--
-- Filtros para la tabla `employee_leaves`
--
ALTER TABLE `employee_leaves`
  ADD CONSTRAINT `employee_leaves_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`);

--
-- Filtros para la tabla `employee_reentries`
--
ALTER TABLE `employee_reentries`
  ADD CONSTRAINT `employee_reentries_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`);

--
-- Filtros para la tabla `employee_vacations`
--
ALTER TABLE `employee_vacations`
  ADD CONSTRAINT `employee_vacations_ibfk_1` FOREIGN KEY (`id_vacation_time`) REFERENCES `vacation_times` (`id`);

--
-- Filtros para la tabla `extra_times`
--
ALTER TABLE `extra_times`
  ADD CONSTRAINT `extra_times_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`);

--
-- Filtros para la tabla `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`);

--
-- Filtros para la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id`);

--
-- Filtros para la tabla `recommendations`
--
ALTER TABLE `recommendations`
  ADD CONSTRAINT `recommendations_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `recommendations_ibfk_2` FOREIGN KEY (`id_recommended_employee`) REFERENCES `employees` (`id`);

--
-- Filtros para la tabla `recommendation_payments`
--
ALTER TABLE `recommendation_payments`
  ADD CONSTRAINT `recommendation_payments_ibfk_1` FOREIGN KEY (`id_recommendation`) REFERENCES `recommendations` (`id`),
  ADD CONSTRAINT `recommendation_payments_ibfk_2` FOREIGN KEY (`id_paying_employee`) REFERENCES `employees` (`id`);

--
-- Filtros para la tabla `trainings`
--
ALTER TABLE `trainings`
  ADD CONSTRAINT `trainings_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`);

--
-- Filtros para la tabla `vacation_times`
--
ALTER TABLE `vacation_times`
  ADD CONSTRAINT `vacation_times_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

CREATE TABLE uniforms (
    id INT AUTO_INCREMENT NOT NULL,
    id_employee INT NOT NULL,
    type int NOT NULL,
    delivered_date date NOT NULL,
    comments varchar(255) NULL,
    createdAt TIMESTAMP NULL DEFAULT NULL,
    updatedAt TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(id_employee) REFERENCES employees(id)
);

ALTER TABLE absences DROP COLUMN path;