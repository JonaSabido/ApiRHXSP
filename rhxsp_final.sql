-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-07-2024 a las 17:58:53
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rhxsp_final`
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
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `antidopings`
--

CREATE TABLE `antidopings` (
  `id` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `result` varchar(15) NOT NULL,
  `comments` varchar(500) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `type` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `emergencies`
--

INSERT INTO `emergencies` (`id`, `id_employee`, `reference_name`, `type`, `phone`, `createdAt`, `updatedAt`) VALUES
(1, 4, 'Nanci Díaz', 'Esposa/o', '9991500008', '2024-05-22 02:51:58', '2024-05-22 02:51:58'),
(2, 5, 'Deysi Zavala Trujillo', 'Esposa/o', '9994478168', '2024-05-22 02:52:16', '2024-05-22 02:52:16'),
(3, 6, 'Deysi Zavala Trujillo ', 'Esposa/o', '9994478168', '2024-05-22 02:52:32', '2024-05-22 02:52:32'),
(4, 7, 'Landi Maria Chi', 'Esposa/o', '9995473125', '2024-05-22 02:52:56', '2024-05-22 02:52:56'),
(5, 8, 'Rosa Maria Chanche Pech', 'Hermano/a', '9996183309', '2024-05-22 02:53:57', '2024-05-22 03:06:26'),
(6, 9, 'Rafael Flores Vega', 'Conyugue', '9994557398', '2024-05-22 02:55:24', '2024-05-22 02:55:24'),
(7, 10, 'Maria Sonia Gregoria Naal Dzul', 'Esposa/o', '0', '2024-05-22 02:56:09', '2024-05-22 02:56:09'),
(8, 11, 'Rocio de los A. Chable Uchim', 'Esposa/o', '9811019324', '2024-05-22 02:56:31', '2024-05-22 02:56:31'),
(9, 12, 'José Manuel Chable Moo ', 'Hermano/a', '0', '2024-05-22 02:57:00', '2024-05-22 03:06:34'),
(10, 13, 'Esteban Che Palma', 'Hermano/a', '9993610947', '2024-05-22 02:57:17', '2024-05-22 03:06:39'),
(11, 15, 'Analy Zapata Cab', 'Esposa/o', '9991484649', '2024-05-22 02:57:38', '2024-05-22 02:57:38'),
(12, 16, 'Laura Patricia Chan Garcia', 'Esposa/o', '9992923462', '2024-05-22 02:58:05', '2024-05-22 03:06:46'),
(13, 17, 'Rita Canto ', 'Pareja', '9993567649', '2024-05-22 02:58:43', '2024-05-22 03:08:07'),
(14, 18, 'Genny Lizama', 'Madre', '9999915237', '2024-05-22 02:59:41', '2024-05-22 02:59:41'),
(15, 19, 'Elia Isabel Pool ', 'Esposa/o', '9992666889', '2024-05-22 03:00:12', '2024-05-22 03:06:50'),
(16, 20, 'Eva Margarita Gomez ', 'Hijo/a', '9711592679', '2024-05-22 03:00:24', '2024-05-22 03:06:53'),
(17, 21, 'Ana Laura Valle Aguilar ', 'Esposa/o', '9994495007', '2024-05-22 03:00:45', '2024-05-22 03:06:57'),
(18, 22, 'Ana Laura Valle Aguilar ', 'Esposa/o', '9994495007', '2024-05-22 03:01:00', '2024-05-22 03:07:02'),
(19, 23, 'Azuzena Asunción Garrido ', 'Esposa/o', '9992318270', '2024-05-22 03:01:24', '2024-05-22 03:07:07'),
(20, 24, 'Rosa Tuz May ', 'Conyugue', '9994314523', '2024-05-22 03:01:57', '2024-05-22 03:07:13'),
(21, 25, 'Magdalena Montejo Trinidad ', 'Esposa/o', '9997394501', '2024-05-22 03:02:11', '2024-05-22 03:07:19'),
(22, 26, 'Santa Mendez ', 'Esposa/o', '9994241629', '2024-05-22 03:02:37', '2024-05-22 03:07:22'),
(23, 27, 'Yenni Hernandez Martinez ', 'Esposa/o', '9993953230', '2024-05-22 03:03:03', '2024-05-22 03:07:25'),
(24, 28, 'Julia del Socorro Che chalé ', 'Esposa/o', '9995093558', '2024-05-22 03:03:17', '2024-05-22 03:07:29'),
(25, 29, 'José Cornelio Pool Chim ', 'Esposa/o', '9996175104', '2024-05-22 03:03:38', '2024-05-22 03:07:32'),
(26, 30, 'Victor Alfonso Pam Baas ', 'Hermano/a', '9996101947', '2024-05-22 03:04:09', '2024-05-22 03:07:37'),
(27, 31, 'Cinthia Aracely Pech ', 'Hermano/a', '9994175176', '2024-05-22 03:04:36', '2024-05-22 03:07:41'),
(28, 32, 'Maria Chan May ', 'Esposa/o', '9991292586', '2024-05-22 03:04:59', '2024-05-22 03:07:51'),
(29, 33, 'Sharon Pech Pech ', 'Hijo/a', '9992416729', '2024-05-22 03:05:15', '2024-05-22 03:07:53'),
(30, 34, 'Maria Magdalena ', 'Esposa/o', '9991254809', '2024-05-22 03:05:38', '2024-05-22 03:07:57'),
(31, 35, 'Jorge Alberto Ramirez (Papá)', 'Padre', '9993293304', '2024-05-23 00:45:36', '2024-05-23 00:45:36'),
(32, 36, 'Maria Fernanda Uribe (Pareja)', 'Pareja', '9991141146', '2024-05-23 00:45:53', '2024-05-23 00:45:53'),
(33, 37, 'Sulemy Gonzales (Esposa)', 'Esposa/o', '9992667699', '2024-05-23 00:46:10', '2024-05-23 00:46:10'),
(34, 38, 'María Isabel Ramirez (Mamá)', 'Madre', '9995089663', '2024-05-23 00:46:26', '2024-05-23 00:46:26'),
(35, 39, 'Elda Mercedes Chan Romero (Esposa)', 'Esposa/o', '9991747068', '2024-05-23 00:46:38', '2024-05-23 00:46:38'),
(36, 40, 'Luis Ricardo Arturo Zapata (Papá)', 'Padre', '9991298423', '2024-05-23 00:46:51', '2024-05-23 00:46:51'),
(37, 41, 'Socorro Gutierrez Pech (Esposa)', 'Esposa/o', '9992637505', '2024-05-23 00:47:04', '2024-05-23 00:47:04'),
(38, 43, 'Aida Alcocer Aguilar (Esposa)', 'Esposa/o', '9991737679', '2024-05-23 00:47:19', '2024-05-23 00:47:19'),
(39, 44, 'Ana Maria Balam (Mamá)', 'Madre', '9993020718', '2024-05-23 00:47:32', '2024-05-23 00:47:32'),
(40, 46, 'Ithali Berenice Pacheco (hija)', 'Hijo/a', '9881050743', '2024-05-23 00:47:49', '2024-05-23 00:47:49'),
(41, 47, 'Cinthia Segovia hernandez (Esposa)', 'Esposa/o', '9992804929', '2024-05-23 00:48:01', '2024-05-23 00:48:01'),
(42, 48, 'Guadalupe Pérez Moreno (Papá)', 'Padre', '9992204033', '2024-05-23 00:48:17', '2024-05-23 00:48:17'),
(43, 49, 'Addy Escobar (Mamá)', 'Madre', '9841354627', '2024-05-23 00:48:27', '2024-05-23 00:48:27'),
(44, 50, '\"Isidro Perez (Papá) Carolina\"', 'Padre', '9.992365243999165e19', '2024-05-23 00:48:51', '2024-05-23 00:48:51'),
(45, 51, 'Leticia Castillo (Mamá)', 'Madre', '9995629390', '2024-05-23 00:49:03', '2024-05-23 00:49:03'),
(46, 53, 'Leticia Gonzalez (Hermana)', 'Hermano/a', '9993562575', '2024-05-23 00:49:17', '2024-05-23 00:49:17'),
(47, 54, 'Braulio chable (papa)', 'Padre', '9971248849', '2024-05-23 00:49:29', '2024-05-23 00:49:29'),
(48, 55, 'Braulio chable (papa)', 'Padre', '9971248849', '2024-05-23 00:49:44', '2024-05-23 00:49:44'),
(49, 56, 'María Pereira (esposa)', 'Esposa/o', '9991978756', '2024-05-23 00:49:56', '2024-05-23 00:49:56'),
(50, 57, 'Rosa Ferraez (mamá)', 'Madre', '9991193622', '2024-05-23 00:52:48', '2024-05-23 00:52:48'),
(51, 58, 'Claudia Garcia', 'Esposa/o', '9841915115', '2024-05-23 00:53:17', '2024-05-23 00:53:17'),
(52, 59, 'Reyna Pech', 'Esposa/o', '9996365673', '2024-05-23 00:53:37', '2024-05-23 00:53:37'),
(53, 61, 'Maricela Torre', 'Esposa/o', '9332104295', '2024-05-23 00:53:56', '2024-05-23 00:53:56'),
(54, 62, 'Emilia Perez', 'Esposa/o', '9612721650', '2024-05-23 00:54:18', '2024-05-23 00:54:18'),
(55, 63, 'Claudia Noemi (Esposa)', 'Esposa/o', '9841355496', '2024-05-23 00:54:30', '2024-05-23 00:54:30'),
(56, 64, 'Leonardo Médica (papá)', 'Padre', '9995911177', '2024-05-23 00:54:43', '2024-05-23 00:54:43'),
(57, 67, 'Claudia Garcia', 'Hermano/a', '9841915115', '2024-05-23 00:55:59', '2024-05-23 00:55:59'),
(58, 68, 'wiliam de jesus canche cauich (hermano)', 'Hermano/a', '9961444612', '2024-05-23 00:56:11', '2024-05-23 00:56:11'),
(59, 69, 'Osiris Chan Uicab (Esposo)', 'Esposa/o', '9995763748', '2024-05-23 00:56:23', '2024-05-23 00:56:23'),
(60, 70, 'Maria Sanchez (pareja)', 'Pareja', '9995071980', '2024-05-23 00:56:34', '2024-05-23 00:56:34'),
(61, 71, 'Silvia Marisol Chi (esposa)', 'Esposa/o', '9995842517', '2024-05-23 00:56:48', '2024-05-23 00:56:48'),
(62, 72, 'Carlos Daniel Castillo Baas (esposo)', 'Esposa/o', '9991216663', '2024-05-23 00:56:59', '2024-05-23 00:56:59'),
(63, 73, 'Maria Aniluz May Chi (madre)', 'Madre', '9971106062', '2024-05-23 00:57:11', '2024-05-23 00:57:11'),
(64, 74, 'Reyna Maria Ruiz Aguilar (madre)', 'Madre', '9992501486', '2024-05-23 00:57:21', '2024-05-23 00:57:21'),
(65, 75, 'Cristina Jimenez', 'Esposa/o', '9371084723', '2024-05-23 00:57:37', '2024-05-23 00:57:37'),
(66, 77, 'Sergio Rafael (hermano)', 'Hermano/a', '9961083910', '2024-05-23 00:57:50', '2024-05-23 00:57:50'),
(67, 78, 'Mildred Caamal ( pareja)', 'Pareja', '9992322395', '2024-05-23 00:58:01', '2024-05-23 00:58:01'),
(68, 79, 'Maria Elizabeth', 'Madre', '9841427366', '2024-05-23 01:04:12', '2024-05-23 01:04:12'),
(69, 81, 'Georgina Canche (madre)', 'Madre', '9999922863', '2024-05-23 01:04:23', '2024-05-23 01:04:23'),
(70, 82, 'Gloria Noh', 'Hermano/a', '9999906140', '2024-05-23 01:04:36', '2024-05-23 01:04:36'),
(71, 83, 'Maria Aveline Tuc Dzib (esposa)', 'Esposa/o', '9961111512', '2024-05-23 01:04:49', '2024-05-23 01:04:49'),
(72, 84, 'Maria del Socorro (esposa)', 'Esposa/o', '9991486155', '2024-05-23 01:05:01', '2024-05-23 01:05:01'),
(73, 86, 'Alejandra Bota Gonzalez (hija)', 'Hijo/a', '9994404901', '2024-05-23 01:05:11', '2024-05-23 01:05:11'),
(74, 87, 'Delta Pech Pech', 'Madre', '9991434854', '2024-05-23 01:05:35', '2024-05-23 01:05:35'),
(75, 88, 'Daniela Cristina de la Cruz Rendon', 'Esposa/o', '9837527640', '2024-05-23 01:05:59', '2024-05-23 01:05:59'),
(76, 89, 'Gloria juarez ', 'Esposa/o', '9711516818', '2024-05-23 01:06:19', '2024-05-23 01:06:19'),
(77, 90, 'Iselma Echeverria (pareja)', 'Pareja', '9341035501', '2024-05-23 01:06:38', '2024-05-23 01:06:38'),
(78, 92, 'José Gaspar Cruz Kuk (papa)', 'Padre', '9995681543', '2024-05-23 01:06:52', '2024-05-23 01:06:52'),
(79, 96, 'Lubia Gomez', 'Esposa/o', '919131284', '2024-05-23 01:07:09', '2024-05-23 01:07:09'),
(80, 97, 'Alberto Almeida', 'Hermano/a', '9995992768', '2024-05-23 01:07:28', '2024-05-23 01:07:28'),
(81, 98, 'Monica Lugo', 'Hermano/a', '9382431356', '2024-05-23 01:07:45', '2024-05-23 01:07:45'),
(82, 100, 'Leydi Dzul Chan (esposa)', 'Esposa/o', '9994491640', '2024-05-23 01:08:00', '2024-05-23 01:08:00'),
(83, 101, 'Alicia Sanchez Garcia (Conyugue)', 'Conyugue', '9961046880', '2024-05-23 01:08:21', '2024-05-23 01:08:21'),
(84, 102, 'LucellyherreraHerreralopez@gmail.com', 'Hermano/a', '0', '2024-05-23 01:08:36', '2024-05-23 01:08:36'),
(85, 103, 'Alejandra Manzano Lara (madre)', 'Madre', '9993347205', '2024-05-23 01:08:47', '2024-05-23 01:08:47'),
(86, 104, 'Mateos Jimenez Gutierrez', 'Padre', '9191940453', '2024-05-23 01:09:05', '2024-05-23 01:09:05'),
(87, 109, 'Pascual Cime Mukul (papá)', 'Padre', '9911086878', '2024-05-23 01:09:18', '2024-05-23 01:09:18'),
(88, 110, 'Berta alicia Pool Cutz', 'Esposa/o', '9911021751', '2024-05-23 01:09:29', '2024-05-23 01:09:29'),
(89, 111, 'Pedro Camas Perez (conyugue)', 'Conyugue', '9991125196', '2024-05-23 01:09:40', '2024-05-23 01:09:40'),
(90, 114, 'Petrona de la Cruz Lopez (Madre)', 'Madre', '9141379973', '2024-05-23 01:09:51', '2024-05-23 01:09:51'),
(91, 115, 'Arian (prima)', 'Primo/a', '9991447373', '2024-05-23 01:16:21', '2024-05-23 01:16:21'),
(92, 117, 'Lucrecia Rebolledo ', 'Hermano/a', '9212661825', '2024-05-23 01:16:40', '2024-05-23 01:16:40'),
(93, 118, 'Milca canche (esposa)', 'Esposa/o', '9995710556', '2024-05-23 01:16:51', '2024-05-23 01:16:51'),
(94, 119, 'Jose Gomez (mamá) ', 'Madre', '9811785042', '2024-05-23 01:17:02', '2024-05-23 01:17:02'),
(95, 120, 'Sandra Sanchez Mora (Madre)', 'Madre', '8991054703', '2024-05-23 01:17:13', '2024-05-23 01:17:13'),
(96, 124, 'Jesus Díaz', 'Hermano/a', '8713718321', '2024-05-23 01:17:29', '2024-05-23 01:17:29'),
(97, 125, 'Elver Lara Lopez', 'Padre', '9191111562', '2024-05-23 01:18:03', '2024-05-23 01:18:03'),
(98, 126, 'Javier Perez', 'Padre', '9191715188', '2024-05-23 01:18:15', '2024-05-23 01:18:15'),
(99, 127, 'Deonicia Santiago. ', 'Madre', '9842055956', '2024-05-23 01:18:29', '2024-05-23 01:18:29'),
(100, 128, 'Esther Ek Chan (mamá)', 'Madre', '9991978269', '2024-05-23 01:18:39', '2024-05-23 01:18:39'),
(101, 134, 'Geydi Eb Gallegos (hija)', 'Hijo/a', '9992609248', '2024-05-23 01:18:52', '2024-05-23 01:18:52'),
(102, 135, ' (David sobrino)', 'Sobrino/a', '9999032749', '2024-05-23 01:25:39', '2024-05-23 01:25:39'),
(103, 136, 'Rita Joaquina Martin Vazquez (Tía)', 'Tío/a', '9911116341', '2024-05-23 01:33:17', '2024-05-23 01:33:17'),
(104, 137, 'Maria Agustina Canul Chuc (madre)', 'Madre', '9961123230', '2024-05-23 01:33:28', '2024-05-23 01:33:28'),
(105, 138, 'Ester Ek Chan (Madre )', 'Madre', '9991978269', '2024-05-23 01:33:38', '2024-05-23 01:33:38'),
(106, 139, 'Maria Jose Romero Ceballos (hija)', 'Hijo/a', '9881050793', '2024-05-23 01:33:50', '2024-05-23 01:33:50'),
(107, 140, 'Alejandro Hernandez Antonio (pareja)', 'Pareja', '9993809526', '2024-05-23 01:34:07', '2024-05-23 01:34:07'),
(108, 141, 'Margarita Judith Mezquita Lopez (madre)', 'Madre', '9991049831', '2024-05-23 01:34:16', '2024-05-23 01:34:16'),
(109, 142, 'Elide Sanchez  (comadre)', 'Compadre/Comadre', '9994471723', '2024-05-23 01:44:53', '2024-05-23 01:44:53'),
(110, 143, 'Diana Lucia Colli Rubio (madre)', 'Madre', '0', '2024-05-23 01:45:08', '2024-05-23 01:45:08'),
(111, 144, 'Shirley Irelice Gomez Moreno (hija)', 'Hijo/a', '9994136674', '2024-05-23 01:45:21', '2024-05-23 01:45:21'),
(112, 147, 'Maria Angelica Escalante Tec (madre)', 'Madre', '9999604280', '2024-05-23 01:45:33', '2024-05-23 01:45:33'),
(113, 148, 'Kari Isabel Lopez Mota (hermana)', 'Hermano/a', '9996486882', '2024-05-23 01:45:46', '2024-05-23 01:45:46'),
(114, 149, 'Yolidavey Torres Suarez (pareja)', 'Pareja', '9996476302', '2024-05-23 01:46:00', '2024-05-23 01:46:00'),
(115, 150, 'Omar Trejo (novio)', 'Pareja', '5533352895', '2024-05-23 01:46:16', '2024-05-23 01:46:16'),
(116, 151, 'Anuav Azcorra (hermano)', 'Hermano/a', '9993655082', '2024-05-23 01:46:28', '2024-05-23 01:46:28'),
(117, 152, 'Ana Amalia Martinez Pasos (hermana)', 'Hermano/a', '9997488575', '2024-05-23 01:46:40', '2024-05-23 01:46:40'),
(118, 153, 'Maria Lucy Cocon', 'Madre', '9981055261', '2024-05-23 01:47:05', '2024-05-23 01:47:05'),
(119, 154, 'Elizabeth Hernandez Loprz', 'Hermano/a', '9995125185', '2024-05-23 01:47:31', '2024-05-23 01:47:31'),
(120, 156, 'Brenda Aldana Coj (hermana) ', 'Hermano/a', '9812240317', '2024-05-23 01:49:30', '2024-05-23 01:49:30'),
(121, 157, 'Ana Bety Yan Contreras (madre)', 'Madre', '9361170330', '2024-05-23 01:49:41', '2024-05-23 01:49:41'),
(122, 158, 'Patricia Canche Ku (esposa)', 'Esposa/o', '9961053572', '2024-05-23 01:49:55', '2024-05-23 01:49:55'),
(123, 160, 'Gloriana Magaly Duran Ku (hermana)', 'Hermano/a', '9991852753', '2024-05-23 01:50:09', '2024-05-23 01:50:09'),
(124, 161, 'Maria Magdalena Pech (Tia)', 'Tío/a', '9994353255', '2024-05-23 01:50:21', '2024-05-23 01:50:21'),
(125, 162, 'Rafael A. Montejo Canche (sobrino)', 'Sobrino/a', '9991271576', '2024-05-23 01:50:35', '2024-05-23 01:50:35'),
(126, 163, 'Jose Saul Uicab Canche (padre)', 'Padre', '9994137495', '2024-05-23 01:50:48', '2024-05-23 01:50:48'),
(127, 164, 'Ruselvy Ita Aguilar (madre)', 'Madre', '9992972203', '2024-05-23 01:51:01', '2024-05-23 01:51:01'),
(128, 165, 'Manuel Bautista Sanchez (hermano)', 'Hermano/a', '9995646472', '2024-05-23 01:51:12', '2024-05-23 01:51:12'),
(129, 166, 'Margarita Alejandra Pech (suegra)', 'Suegro/a', '9994381635', '2024-05-23 01:51:24', '2024-05-23 01:51:24'),
(130, 168, 'Jose Enrique Puc Ek (hermano)', 'Hermano/a', '9994518229', '2024-05-23 01:51:36', '2024-05-23 01:51:36'),
(131, 171, 'Jenny Castillo Soberanis (pareja)', 'Pareja', '9995021161', '2024-05-23 01:51:48', '2024-05-23 01:51:48'),
(132, 172, 'Irma Matos Euan (amiga)', 'Compadre/Comadre', '9991128791', '2024-05-23 01:52:07', '2024-05-23 01:52:07'),
(133, 173, 'Greysi Lucely Castillo (hija)', 'Hijo/a', '9811319584', '2024-05-23 01:52:24', '2024-05-23 01:52:24'),
(134, 174, 'Angelica Maria Couoh Moguel (madre)', 'Madre', '9997809030', '2024-05-29 01:37:17', '2024-05-29 01:37:17'),
(135, 175, 'Jatziry Paola Lopez Lopez (pareja)', 'Pareja', '9341058562', '2024-05-29 01:37:29', '2024-05-29 01:37:29'),
(136, 176, 'Jhanet Piña Herrera (pareja)', 'Pareja', '9991531420', '2024-05-29 01:37:41', '2024-05-29 01:37:41'),
(137, 178, 'Jeny Angelica Tuz Ochoa (madre)', 'Madre', '9851012553', '2024-05-29 01:37:53', '2024-05-29 01:37:53'),
(138, 179, 'Laura Isela Castillo Salazar (esposa)', 'Esposa/o', '8115148565', '2024-05-29 01:39:37', '2024-05-29 01:39:37'),
(139, 180, 'Jael Dzul Rueda (hija)', 'Hijo/a', '9999693916', '2024-05-29 01:39:47', '2024-05-29 01:39:47'),
(140, 181, 'Dianet Novelo Caballerro (pareja)', 'Pareja', '9994109510', '2024-05-29 01:39:59', '2024-05-29 01:39:59'),
(141, 182, 'Rossana Noh (tia)', 'Tío/a', '9996422716', '2024-05-29 01:40:10', '2024-05-29 01:40:10'),
(142, 183, 'Teresa Agustina Campos Perez (Madre)', 'Madre', '9995086863', '2024-05-29 01:40:21', '2024-05-29 01:40:21'),
(143, 232, 'Carlos Daniel Campos Barrios (esposo)', 'Esposa/o', '9811824410', '2024-05-29 01:40:34', '2024-05-29 01:40:34'),
(144, 187, 'Nilda Rosado Rodriguez (amiga)', 'Amigo/a', '9992082990', '2024-05-29 01:42:34', '2024-05-29 01:42:34'),
(145, 241, 'Debora Lopez Perez (novia)', 'Pareja', '9191110906', '2024-05-29 01:42:49', '2024-05-29 01:42:49'),
(146, 189, 'Wendy Gabriela Colli Ucan (mama)', 'Madre', '9991099075', '2024-05-29 01:43:01', '2024-05-29 01:43:01'),
(147, 190, 'Maria Matilda Dominguez Ferraez (madre)', 'Madre', '9992675286', '2024-05-29 01:43:11', '2024-05-29 01:43:11'),
(148, 191, 'Jose Efrain Dzib Ek (papa)', 'Padre', '9991972406', '2024-05-29 01:43:22', '2024-05-29 01:43:22'),
(149, 193, 'Carolina Guadalupe Llanez (hermana)', 'Hermano/a', '9993969323', '2024-05-29 01:43:32', '2024-05-29 01:43:32'),
(150, 194, 'Ramon Benjamin Noh Garcia (padre)', 'Padre', '9999471129', '2024-05-29 01:43:41', '2024-05-29 01:43:41'),
(151, 196, 'Teresita Neftali Morato Maya (hermana)', 'Hermano/a', '9992752731', '2024-05-29 01:43:49', '2024-05-29 01:43:49'),
(152, 197, 'Elvira del Socorro Cruz Che (pareja)', 'Pareja', '9996487410', '2024-05-29 01:43:59', '2024-05-29 01:43:59'),
(153, 199, 'Alicia Teresa Romeo Rodriguez (hermana)', 'Hermano/a', '5516979476', '2024-05-29 01:44:10', '2024-05-29 01:44:10'),
(154, 200, 'Lizbeth Noemi Dzul Colli (pareja)', 'Pareja', '9971790770', '2024-05-29 01:44:21', '2024-05-29 01:44:21'),
(155, 201, 'Didier Ariel Alonzo Pacheco (hijo)', 'Hijo/a', '9993937349', '2024-05-29 01:44:30', '2024-05-29 01:44:30'),
(156, 203, 'Yaneli de Jesus Canul Puc (hija)', 'Hijo/a', '9993608699', '2024-05-29 01:44:41', '2024-05-29 01:44:41'),
(157, 204, 'Yennffer Estivaliz Gonzalez Hipolito (madre)', 'Madre', '5537309552', '2024-05-29 01:44:50', '2024-05-29 01:44:50'),
(158, 205, 'Landy Eugenia Tamayo Briceño (esposa)', 'Esposa/o', '9991755302', '2024-05-29 01:45:08', '2024-05-29 01:45:08'),
(159, 206, 'Natanael Arcos Vasquez (amigo)', 'Amigo/a', '9991588561', '2024-05-29 01:45:21', '2024-05-29 01:45:21'),
(160, 208, 'Adrian Omar Solis Arevalo (Amigo)', 'Amigo/a', '9992665849', '2024-05-29 01:45:32', '2024-05-29 01:45:32'),
(161, 209, 'Nidia Angelica Perez (mama)', 'Padre', '9991574458', '2024-05-29 01:45:49', '2024-05-29 01:45:49'),
(162, 210, 'Rosa Vazquez (hermana)', 'Hermano/a', '9999552285', '2024-05-29 01:46:00', '2024-05-29 01:46:00'),
(163, 211, 'Jose Cornelio (suegro)', 'Suegro/a', '9996175104', '2024-05-29 01:46:10', '2024-05-29 01:46:10'),
(164, 212, 'Guadalupe Verenic Salinas (hija)', 'Hijo/a', '9992216620', '2024-05-29 01:46:19', '2024-05-29 01:46:19'),
(165, 213, 'Maria Calderon Perez(esposa)', 'Esposa/o', '9994153897', '2024-05-29 01:46:30', '2024-05-29 01:46:30'),
(166, 214, 'Genny Cordova Moguel (prima)', 'Primo/a', '9999585767', '2024-05-29 01:46:43', '2024-05-29 01:46:43'),
(167, 215, 'Isabel Velasquez Maldonado (mama)', 'Madre', '9992612155', '2024-05-29 01:46:56', '2024-05-29 01:46:56'),
(168, 217, 'Adolfo Sosa (vecino)', 'Vecino/a', '9991356734', '2024-05-29 01:47:09', '2024-05-29 01:47:09'),
(169, 218, 'Linda Sinahi Perez Vadillo (esposa)', 'Esposa/o', '9993186186', '2024-05-29 01:47:23', '2024-05-29 01:47:23'),
(170, 219, 'Blanca Estela Rosas (esposa)', 'Esposa/o', '5614809973', '2024-05-29 01:47:41', '2024-05-29 01:47:41'),
(171, 220, 'Jorge Koyoc Cauich (hermano)', 'Hermano/a', '9999181144', '2024-05-29 01:47:51', '2024-05-29 01:47:51'),
(172, 221, 'Emy Quintal (esposa) ', 'Esposa/o', '9992182576', '2024-05-29 01:47:59', '2024-05-29 01:47:59'),
(173, 222, 'Jesus Gerardo Basto Canche (esposo)', 'Esposa/o', '9911045915', '2024-05-29 01:48:10', '2024-05-29 01:48:10'),
(174, 223, 'Maria Argelia Pech (Mama)', 'Madre', '9996154168', '2024-05-29 01:48:19', '2024-05-29 01:48:19'),
(175, 224, 'Brenda Aldana Coj (hermana) ', 'Hermano/a', '9812240317', '2024-05-29 01:48:30', '2024-05-29 01:48:30'),
(176, 225, 'Lourdes Perez Alamilla', 'Hermano/a', '9995071359', '2024-05-30 11:12:21', '2024-05-30 11:12:21'),
(177, 226, 'Jennifer Quiñones (hija)', 'Hijo/a', '5523324457', '2024-05-30 11:12:30', '2024-05-30 11:12:30'),
(178, 227, 'Iselma Echeverria (pareja)', 'Pareja', '9341035501', '2024-05-30 11:12:39', '2024-05-30 11:12:39'),
(179, 228, 'Benito Martinez Rodriguez (hermano)', 'Hermano/a', '9993245404', '2024-05-30 11:12:49', '2024-05-30 11:12:49'),
(180, 229, 'Marco Lopez Torres (Tio)', 'Tío/a', '9991381095', '2024-05-30 11:13:00', '2024-05-30 11:13:00'),
(181, 230, 'Olga Hernandez (pareja)', 'Pareja', '9995660217', '2024-05-30 11:13:15', '2024-05-30 11:13:15'),
(182, 231, 'Sara Duperon Ek (mama)', 'Madre', '9993635374', '2024-05-30 11:13:27', '2024-05-30 11:13:27'),
(183, 232, 'Carlos Daniel Campos Barrios (esposo)', 'Esposa/o', '9811824410', '2024-05-30 11:13:38', '2024-05-30 11:13:38'),
(184, 233, 'Esmeralda Cuxim (pareja)', 'Pareja', '9991938009', '2024-05-30 11:13:48', '2024-05-30 11:13:48'),
(185, 234, 'Maria Victoria Cante Uuh (madre)', 'Madre', '9992248272', '2024-05-30 11:13:58', '2024-05-30 11:13:58'),
(186, 236, 'Margarita Alejandra Pech (suegra)', 'Suegro/a', '9994381635', '2024-05-30 11:14:08', '2024-05-30 11:14:08'),
(187, 237, 'Dalila Can Iut (tia)', 'Tío/a', '9993252806', '2024-05-30 11:14:19', '2024-05-30 11:14:19'),
(188, 240, 'Gabriela del Rosario Aguilar ', 'Madre', '9994958878', '2024-05-30 11:15:10', '2024-05-30 11:15:10'),
(189, 242, 'Maria Guadalupe Estarda Ku ', 'Hermano/a', '9993803936', '2024-05-30 11:15:56', '2024-05-30 11:15:56'),
(190, 243, 'Rigel de Jesus Ek Canche (sobrino)', 'Sobrino/a', '9994124172', '2024-05-30 11:16:07', '2024-05-30 11:16:07'),
(191, 267, 'Martha Elena Calan Hau (esposa)', 'Esposa/o', '9991289823', '2024-05-30 11:16:23', '2024-05-30 11:16:23'),
(192, 245, 'Martha Patricia de la Caridad Coaña Canul (esposa)', 'Esposa/o', '9993104086', '2024-05-30 11:16:33', '2024-05-30 11:16:33'),
(193, 246, 'Gloria Zuleymi Morales Mendez (hermana)', 'Hermano/a', '9341309101', '2024-05-30 11:16:46', '2024-05-30 11:16:46'),
(194, 247, 'Angelica Martina Sanchez (madre)', 'Madre', '9341076920', '2024-05-30 11:16:56', '2024-05-30 11:16:56'),
(195, 248, 'Maria Eustaquia Martinez Gutierrez (madre)', 'Madre', '9996082010', '2024-05-30 11:17:06', '2024-05-30 11:17:06'),
(196, 249, 'Guadalupe Ruelas (madre)', 'Padre', '9992436016', '2024-05-30 11:17:16', '2024-05-30 11:17:16'),
(197, 250, 'Guadalupe Puc (madre)', 'Madre', '9997946909', '2024-05-30 11:17:26', '2024-05-30 11:17:26'),
(198, 252, 'Valois Antonio Toledo (Pareja)', 'Pareja', '9991652525', '2024-05-30 11:17:49', '2024-05-30 11:17:49'),
(199, 253, 'Ana Laura Alonzo Pech (cuñada)', 'Cuñado/a', '9911098429', '2024-05-30 11:18:02', '2024-05-30 11:18:02'),
(200, 255, 'Arnulfo Cortes (hermano)', 'Hermano/a', '9983072221', '2024-05-30 11:18:12', '2024-05-30 11:18:12'),
(201, 265, 'Silvia de Carmen Pech Estrella (madre)', 'Madre', '9991392247', '2024-05-30 11:18:25', '2024-05-30 11:18:25'),
(202, 266, 'Ana Laura Hau Dzib (hermana)', 'Hermano/a', '9997469897', '2024-05-30 11:18:34', '2024-05-30 11:18:34'),
(203, 267, 'Martha Elena Calan Hau (esposa)', 'Esposa/o', '9991289823', '2024-05-30 11:18:46', '2024-05-30 11:18:46'),
(204, 268, 'Julia del Socorro Che chalé (Esposa)', 'Esposa/o', '9992165641', '2024-05-30 11:21:12', '2024-05-30 11:21:12'),
(205, 269, 'Alejandro Hernandez Antonio (pareja)', 'Pareja', '9993809526', '2024-05-30 11:21:23', '2024-05-30 11:21:23'),
(206, 272, 'Alberto Morales Couoh (esposo)', 'Esposa/o', '9991281099', '2024-05-30 11:21:33', '2024-05-30 11:21:33'),
(207, 273, 'Maria Audil Cecilia Can Cahum (pareja)', 'Pareja', '5644883064', '2024-05-30 11:21:45', '2024-05-30 11:21:45'),
(208, 274, 'Fabiola Vera Moo (pareja)', 'Pareja', '5650091544', '2024-05-30 11:21:54', '2024-05-30 11:21:54'),
(209, 275, 'Lorenzo Rafael Brito Manzano (hermano)', 'Hermano/a', '9982039520', '2024-05-30 11:22:06', '2024-05-30 11:22:06'),
(210, 276, 'Maria Berenice Uicab May (hija)', 'Hijo/a', '9971453436', '2024-05-30 11:22:22', '2024-05-30 11:22:22'),
(211, 279, 'Guadalupe Dzul (esposa)', 'Esposa/o', '9993951274', '2024-05-30 11:22:35', '2024-05-30 11:22:35'),
(212, 280, 'William Vadillo (parde)', 'Padre', '9994347147', '2024-05-30 11:22:47', '2024-05-30 11:22:47'),
(213, 281, 'Elizabeth Perez hernandez', 'Madre', '9991055756', '2024-05-30 11:23:05', '2024-05-30 11:23:05');

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
  `has_birth_certificate` tinyint(1) NOT NULL DEFAULT 0,
  `has_identification` tinyint(1) NOT NULL DEFAULT 0,
  `has_curp` tinyint(1) NOT NULL DEFAULT 0,
  `has_nss` tinyint(1) NOT NULL DEFAULT 0,
  `has_address_certification` tinyint(1) NOT NULL DEFAULT 0,
  `has_studies_certification` tinyint(1) NOT NULL DEFAULT 0,
  `has_tax_certificate` tinyint(1) NOT NULL DEFAULT 0,
  `has_smn` tinyint(1) NOT NULL DEFAULT 0,
  `has_no_criminal_certificate` tinyint(1) NOT NULL DEFAULT 0,
  `has_health_certificate` tinyint(1) NOT NULL DEFAULT 0,
  `has_sv` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`id`, `id_department`, `id_job`, `id_recruitment_method`, `code`, `name`, `sure_name`, `last_name`, `entry_date`, `status`, `gender`, `nss`, `rfc`, `curp`, `ssp`, `natal_date`, `email`, `phone`, `shirt_size`, `pants_size`, `shoe_size`, `has_children`, `address`, `cp`, `comments`, `has_birth_certificate`, `has_identification`, `has_curp`, `has_nss`, `has_address_certification`, `has_studies_certification`, `has_tax_certificate`, `has_smn`, `has_no_criminal_certificate`, `has_health_certificate`, `has_sv`, `createdAt`, `updatedAt`) VALUES
(1, 2, 22, 1, 603, 'Carlos Waldemar', 'Perez', 'Alamilla', '2023-12-28', 0, 'Male', '27169515106', 'PEAC951121G11', 'PEAC951121HYNRLR04', 0, '1995-11-21', 'perezalamillacarlos68@gmail.com', '9992920212', 'G', 36, 29, 0, 'Calle 24A, No. 25B, Ext. 342, Fraccionamiento Vergel IV, Mérida, Yucatán, C.P. 97173', '97173', 'null', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2024-06-07 02:59:11'),
(2, 2, 16, 1, 38, 'Grecia de la Cruz', 'Diaz', 'Lizama', '2015-09-26', 1, 'Femen', '84139211993', 'DILG920307HV0', 'DILG920307MYNZZR09', 1, '1992-03-07', 'gress.92@hotmail.com', '9999915237', 'CH', 30, 4, 0, 'Calle 46B 1 No. 888 por 137 y 139, Villa Magaña Sur, Mérida, Yucatán. C.P. 97285', '97285', 'ninguno', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-29 18:54:20', '2024-04-29 18:54:20'),
(3, 1, 19, 1, 1, 'Marco Antonio', 'Freyre', 'Zumbardo', '2020-01-01', 1, 'Male', '03168530644', 'FEZM850118KI2', 'FEZM850118HYNRMR05', 1, '1985-01-18', 'mfreyre@xsp.mx', '999 1915734', '2EG', 42, 0, 0, 'Calle 29C No. 718B por 88 y 90, Viva Caucel, Mérida Yucatán. C.P. 97314', '97314', 'ninguno', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 02:11:30', '2024-04-30 02:11:30'),
(4, 1, 19, 1, 1, 'Marco Antonio', 'Freyre', 'Zumbardo', '2020-01-01', 1, 'Male', '03168530644', 'FEZM850118KI2', 'FEZM850118HYNRMR05', 0, '1985-01-18', 'mfreyre@xsp.mx', '999 1915734', '2EG', 42, 0, 0, 'Calle 29C No. 718B por 88 y 90, Viva Caucel, Mérida Yucatán. C.P. 97314', ' 9731', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 10:40:32', '2024-04-30 10:40:32'),
(5, 1, 30, 15, 2, 'Maria Elena', 'Bates', 'Martin', '2021-09-06', 1, 'Femen', '84128608167', 'BAME8611079R2', 'BAME861107MTCTRL01', 1, '1986-11-07', 'elebain@icloud.com', '999 9004013', '2EG', 42, 0, 0, 'Calle 44 No. 282 por 31 y 33, Dzodzil Norte, Mérida, Yucatán. C.P. 97115', '97115', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 10:45:06', '2024-04-30 10:45:06'),
(6, 2, 22, 15, 14, 'Taurino', 'Broca', 'De Dios', '2017-03-02', 1, 'Male', '02166802443', 'BODT680911B94', 'BODT680911HTCRSR05', 0, '1968-09-11', 'broca18@hotmail.com', '999 3555954', 'M', 36, 26, 1, 'Calle 59C No. 558A por 54 y 58, Fracc Reparto Granjas, Kanasin, Yucatán. C.P. 97379', '97379', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 10:46:55', '2024-04-30 10:46:55'),
(7, 2, 22, 15, 16, 'Juan Bautista', 'Cabañas', 'Chan', '2012-06-19', 1, 'Male', '84126900293', 'CACJ690523CJ8', 'CACJ690523HCCBHN00', 1, '1969-05-23', 'cabanasjuan247@gmail.com', '999 2359224', 'G', 40, 26, 1, 'Calle 137 No. 262 por 46 y 48, San Nicolás Sur, Mérida, Yucatán. C.P. 97289', '97289', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 10:48:42', '2024-04-30 10:48:42'),
(8, 3, 22, 15, 18, 'Vicente Rafael', 'Canche', 'Pech', '2014-05-15', 1, 'Male', '84866708179', 'CAPV6711309QA', 'CAPV671130HYNNCC10', 0, '1967-11-30', 'canchevrcp1245@gmail.com', '999 4193710', 'EG', 42, 27, 1, 'Calle 60A No. 607 por 73 y 75, Fracc. Santa Isabel, Kanasin, Yucatán. C.P. 97370', ' 9737', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 10:52:47', '2024-04-30 10:52:47'),
(9, 2, 22, 15, 20, 'Cecilia Guadalupe', 'Canto ', 'Dzul', '2022-12-27', 1, 'Femen', '03188446433', 'CADC8411226Y8', 'CADC841122MYNNZC07', 1, '1984-11-22', 'ceci-canto@hotmail.com', '999 3239753', 'G', 36, 25, 1, 'Calle 63 No. 546 I por 58 y 62, Las Granjas, Kanasin, Yucatán. C.P. ', '0', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 10:55:50', '2024-04-30 10:55:50'),
(10, 2, 22, 15, 22, 'Sergio Alberto', 'Canul', 'Tamay', '2011-09-04', 1, 'Male', '84117100150', 'CATS710728S65', 'CATS710728HCCNMR00', 0, '1971-07-28', 'canulsergio28@gmail.com', '9996373987', 'G', 38, 26, 1, 'Calle 57 No. 283, Fracc del Sur, Serapio Rendón, Mérida, Yucatán. C.P. 97285', '97285', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 10:57:51', '2024-04-30 10:57:51'),
(11, 3, 22, 15, 26, 'Fernando Antonio', 'Ceballos ', 'Canseco ', '2016-03-17', 1, 'Male', '84897131755', 'CECF711007ME8', 'CECF711007HDFBNR05', 1, '1971-10-07', 'ferceballoscanseco@hotmail.com', '999 9914199', 'EG', 38, 27, 1, 'Calle 93 No. 407 A por 40 y 42 A, Santa Rosa, Mérida, Yucatán. C.P. 97279', '97279', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 11:06:34', '2024-04-30 11:06:34'),
(12, 3, 22, 15, 29, 'Jose Antonio', 'Chable', 'Moo', '2011-12-14', 1, 'Male', '81877105353', 'CAMA7101246GA', 'CAMA710124HCCHXN02', 0, '1971-01-24', 'chmooantonio71@gmail.com', '999 6159747', 'G', 36, 26, 1, 'Calle 35 No. 450 por 26A y 28, Fracc. Graciano Ricalde. Mérida, Yucatán. C.P. 97256', '97256', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 11:08:30', '2024-04-30 11:08:30'),
(13, 2, 22, 15, 31, 'Mario Enrique', 'Che', 'Cruz', '2018-07-16', 1, 'Male', '30906950495', 'CECM691010G23', 'CECM691010HCCHRR08', 1, '1969-10-10', 'mariochebbh1@gmail.com', '999 5442758', 'EG', 42, 27, 1, 'Calle 71B No. 1115 por 132 y 136, Susula Xoclan, Mérida, Yucatán. C.P. 97249 ', '97249', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 11:28:42', '2024-04-30 11:28:42'),
(15, 2, 23, 15, 34, 'Eduardo Jose', 'Cruz', 'Solis', '2019-05-20', 1, 'Male', '84947728055', 'CUSE770821VCA', 'CUSE770821HYNRLD05', 1, '1977-08-21', 'eduardo.cruz210877@gmail.com', '999 1274899', 'M', 36, 27, 1, 'Calle 17 E No. 691por 72 C, Fracc. Cerradas de Gran Santa Fe, Mérida, Yucatán. C.P. 97314', '97314', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 11:31:11', '2024-04-30 11:31:11'),
(16, 2, 23, 15, 35, 'Jose Manuel', 'Cruz', 'Peraza', '2018-02-22', 1, 'Male', '84897019620', 'CUPM700702VC9', 'CUPM700702HYNRRN08', 0, '1970-07-02', 'jcruz4702@gmail.com', '999 3783475', 'CH', 30, 27, 1, 'Calle 47 No. 700 G por 94 y 94 A, Caucel, Mérida, Yucatán. C.P. 97314', '97314', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 11:33:46', '2024-04-30 11:33:46'),
(17, 3, 22, 15, 36, 'Raul Jesus', 'Cruz Y', 'Aviles', '2015-12-10', 1, 'Male', '84036400418', 'CUAR6401271W5', 'CUAR640127HYNRVL07', 0, '1964-01-27', 'cruzavilesraul@gmail.com', '991 1004798', 'EG', 38, 27, 1, 'Calle 21 No. 85 por 14 y 16, Centro, Mérida, Yucatán. C.P. 97470', '97470', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 11:35:33', '2024-04-30 11:35:33'),
(18, 2, 16, 15, 38, 'Grecia de la Cruz', 'Diaz', 'Lizama', '2015-09-26', 1, 'Femen', '84139211993', 'DILG920307HV0', 'DILG920307MYNZZR09', 1, '1992-03-07', 'gress.92@hotmail.com', '999 7471590', 'CH', 30, 4, 0, 'Calle 46B 1 No. 888 por 137 y 139, Villa Magaña Sur, Mérida, Yucatán. C.P. 97285', '97285', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 11:37:50', '2024-04-30 11:37:50'),
(19, 3, 22, 15, 41, 'Jorge Rageney', 'Erosa', 'Martin', '2022-12-20', 0, 'Male', '84947112763', 'EOMJ710213PI5', 'EOMJ710213HYNRRR01', 1, '1971-02-13', 'jerosa.malito@gmail.com', '999 2287754', 'M', 32, 26, 1, 'Calle 75 No. 748 entre 48A y 50, Col. Tixcacal-Opichen. C.P. 97239', '97239', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 11:39:31', '2024-06-07 01:32:15'),
(20, 2, 22, 15, 47, 'Evelia', 'Gomez', 'Matus', '2017-07-25', 1, 'Femen', 'GOME641202M', 'GOME641202VCA', 'GOME641202MOCMTV08', 1, '1964-12-02', 'egomezmatus@gmail.com', '999 2634190', '2EG', 38, 25, 1, 'Calle 43 No. 289 por 26 y 32, Fracc. Pensiones, Mérida, Yucatán. C.P. 97219', '97219', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 11:41:19', '2024-04-30 11:41:19'),
(21, 3, 22, 15, 49, 'Roger Armando', 'Gomez', 'Cocom', '2013-05-20', 1, 'Male', '84856708486', 'GOCR670131FC9', 'GOCR670131HYNMCG05', 0, '1967-01-31', 'argc151967@gmail.com', '999 7392211', 'G', 36, 8, 1, 'Calle 64H No. 701 Esq por 115, Castilla Cámara , Mérida, Yucatán. C.P. 97278', ' 9727', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 11:42:59', '2024-04-30 11:42:59'),
(22, 2, 25, 15, 53, 'Riquelme', 'Gonzalez', 'Hernandez', '2017-05-17', 1, 'Male', '02177754674', 'GOHR770414PD0', 'GOHR770414HVZNRQ02', 1, '1977-04-14', 'riky_gohe@hotmail.com', '999 2743341', 'CH', 32, 27, 1, 'Calle 165 No. 318 por 80 y 90, Emiliano Zapata Sur III, Mérida, Yucatán. C.P. 97297', '97297', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 11:44:40', '2024-04-30 11:44:40'),
(23, 2, 12, 15, 63, 'Gaspar Israel', 'Mena', 'Rosas', '2013-11-22', 1, 'Male', '84058609953', 'MERG860208I98', 'MERG860208HYNNSS07', 1, '1986-02-08', 'menagaspar5@gmail.com', '999 331 8531', 'G', 42, 29, 1, 'Calle 133 No. 837D por 46A y 46B, Villa Magna del Sur, Mérida, Yucatán. C.P. 97285', '97285', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 11:47:48', '2024-04-30 11:47:48'),
(24, 2, 22, 15, 67, 'Fernando Raul', 'Moguel', 'Perez', '2013-06-01', 1, 'Male', '84127200297', 'MOPF720621LQ8', 'MOPF720621HYNGRR04', 0, '1972-06-21', 'moguelfernando214@gmail.com', '999 2437521', 'G', 36, 27, 1, 'Calle 99 No. 560D por 64D, Col. Meliton Salazar, Mérida, Yucatán. C.P. 97269', '97269', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 11:49:33', '2024-04-30 11:49:33'),
(25, 3, 22, 15, 71, 'Florentino', 'Morato', 'Cruz', '2017-03-08', 0, 'Male', '84016000238', 'MOCF601124QDA', 'MOCF601124HVZRRL08', 0, '1960-11-24', 'barrazon60@gmail.com', '999 1524704', 'EG', 36, 10, 1, 'no tiene', '0', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 11:51:44', '2024-06-07 01:32:37'),
(26, 2, 22, 15, 72, 'Jose Jesus', 'Mugarte', 'Hoil', '2013-03-15', 1, 'Male', '84997904366', 'MUHJ790210J18', 'MUHJ790210HYNGLS11', 0, '1979-02-10', 'santamugarte@gmail.com', '999 1377006', 'M', 34, 26, 1, 'Calle 38 No. 397 por 17D diagonal y 17B diagonal, Fracc. Juan Pablo II, Mérida, Yucatán. C.P. 97246', ' 9724', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 11:54:21', '2024-04-30 11:54:21'),
(27, 3, 22, 15, 73, 'Jose Rodolfo', 'Muñoz', 'Gonzalez', '2019-02-18', 1, 'Male', '84987405531', 'MUGR740418B81', 'MUGR740418HYNXND05', 1, '1974-04-18', 'mgjrodolfo74@gmail.com', '999 5619817', 'EG', 38, 28, 1, 'Calle 37 No. 680A Lote 41 por 78 y 80. Fracc. Horizontes de Caucel, Mérida, Yucatán. C.P. 97314', '97314', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 11:56:29', '2024-04-30 11:56:29'),
(28, 3, 22, 15, 74, 'Gregorio Rodrigo', 'Noh', 'Rosales', '2014-05-26', 0, 'Male', '84967730569', 'NORG770312SA7', 'NORG770312HYNHSR09', 1, '1977-03-12', 'roderick77gisi@gmail.com', '999 3299083', 'M', 32, 27, 1, 'Calle 19 por 24 y 26, Hoctun, Yucatán. C.P. 97480', '97480', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 11:57:48', '2024-06-07 01:32:58'),
(29, 2, 22, 15, 75, 'Virginia de los Angeles', 'Noh', 'Cauich', '2016-05-09', 1, 'Femen', '84947502864', 'NOCV750802132', 'NOCV750802MYNHCR04', 1, '1975-08-02', 'Virginia.noh.765@gmail.com', '999 5690797', 'M', 32, 26, 1, 'Calle 48 No. 765R por 41 y 43A, Fracc. Piedra de Agua, Umán, Yucatán. C.P. 97392', ' 9739', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 11:59:27', '2024-04-30 11:59:27'),
(30, 2, 25, 15, 80, 'Jorge Antonio', 'Pam', 'Baas', '2014-03-24', 1, 'Male', '84088507953', 'PABJ850328UM0', 'PABJ850328HYNMSR00', 1, '1985-03-28', 'jorgepam@live.com.mx', '999 3401273', 'G', 38, 28, 1, 'Calle 23 No. 521 por 4C y 4D, Fracc. Victoria Kanasin, Kanasin, Yucatán. C.P. 97370 ', '97370', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 12:01:12', '2024-04-30 12:01:12'),
(31, 2, 27, 15, 82, 'Maria Argelia', 'Pech', 'May', '2017-02-22', 1, 'Femen', '84957705282', 'PEMA7707311W3', 'PEMA770731MQRCYR00', 0, '1977-07-31', 'mariaargeliapechmay@gmail.com', '999 6154168', 'M', 34, 25, 1, 'Calle 165 No. 307 por 50 y 52C, Fracc Plan de Ayala, Xmatkuil, Yucatán. C.P. 97390', '97390', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 12:02:59', '2024-04-30 12:02:59'),
(32, 2, 22, 15, 83, 'Martin Enrique', 'Pech', 'Castillo', '2016-01-09', 1, 'Male', '84987401027', 'PECM740522TF1', 'PECM740522HYNCSR00', 0, '1974-05-22', 'pechmartin24@gmail.com', '999 2985924', 'CH', 29, 25, 1, 'Calle 62 No. 379 por 81, Col. Mulchechen III, Kanasin Yucatán. C.P. 97370', '97370', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 12:04:38', '2024-04-30 12:04:38'),
(33, 2, 23, 15, 84, 'Martiniano David', 'Pech', 'Puc', '2019-08-14', 1, 'Male', '84038212803', 'PEPM820220UX4', 'PEPM820220HYNCCR07', 0, '1982-02-20', 'davidpechpuc@hotmail.com', '999 1446206', 'M', 34, 26, 1, 'Calle 26 No. 120 por 27 y 27A, Chicxulub Pueblo, Chicxulub, Yucatán. C.P. 97340', '97340', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 12:15:06', '2024-04-30 12:15:06'),
(34, 2, 18, 15, 88, 'Joel Emilio', 'Pool', 'Chuc', '2011-05-23', 1, 'Male', '84927606073', 'POCJ760409E20', 'POCJ760409HYNLHL04', 1, '1976-04-09', 'joelpoolc@gmail.com', '999 366565', 'CH', 32, 26, 1, 'Calle 12 S/N por 15 y 18, Loc. Sierra Papacal, Mérida, Yucatán. C.P. 97302', '97302', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 12:16:49', '2024-04-30 12:16:49'),
(35, 1, 26, 15, 92, 'Bladimir Alejandro', 'Ramirez', 'May', '2019-07-31', 1, 'Male', '63169543210', 'RAMB9508271BA', 'RAMB950827HYNMYL05', 0, '1995-08-27', 'alejandroramirez4715@gmail.com', '999 247 1550', 'G', 36, 7, 1, 'Calle 43 No. 410A por 36 y 38, Col. Lourdes Industrial, Mérida, Yucatán. C.P. 97155', '97155', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 12:20:16', '2024-04-30 12:20:16'),
(36, 9, 23, 15, 100, 'Daniel Alberto', 'Salazar', 'Perez', '2016-02-02', 1, 'Male', '84018002372', 'SAPD800112DT8', 'SAPD800112HYNLRN01', 0, '1980-01-12', 'Dang_salazar@hotmail.com', '999 1185421', 'M', 34, 26, 1, 'Calle 20D No. 555 por 97, Fracc. Dzoyola, Kanasin, Yucatán. C.P. 97373', '97373', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 12:22:53', '2024-04-30 12:22:53'),
(37, 3, 20, 15, 101, 'Hector', 'Sanchez', 'Nieto', '2019-10-18', 1, 'Male', '12027821490', 'SANH780529C15', 'SANH780529HDFNTC09', 0, '1978-05-29', 'hsanchez@xsp.mx', '999 2783737', 'EG', 38, 10, 1, 'Calle 37 No. 394 por 37 y 28, Fracc. Juan Pablo II, Mérida Yucatán. C.P. 97246', '97246', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 12:25:29', '2024-04-30 12:25:29'),
(38, 2, 28, 15, 111, 'Carlos Isai', 'Vazquez', 'Ramirez', '2018-09-12', 1, 'Male', '84109109334', 'VARC911024LI3', 'VARC911024HYNZMR08', 1, '1991-10-24', 'aguilavazquezcv24@gmail.com', '999 2629891', 'CH', 32, 30, 1, 'Calle 49A No. 459 por 24 y 26, Col. Juan Pablo II, Mérida, Yucatán. C.P. 97246', '97246', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 12:28:30', '2024-04-30 12:28:30'),
(39, 3, 22, 15, 112, 'Sergio Rene ', 'Ventura ', 'Escobedo ', '2015-12-17', 1, 'Male', '84876603733', 'VEES650730LJ7', 'VEES650730HYNNSR07', 0, '1965-07-30', 'serventura14@hotmail.com', '999 7391979', 'G', 36, 27, 1, 'Calle 48 No. 213 por 21 y 23, Col. Roma, Mérida, Yucatán. C.P. 97218', '97218', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 12:30:07', '2024-04-30 12:30:07'),
(40, 11, 1, 15, 114, 'Alma Pamela', 'Zapata', 'Leon', '2020-02-01', 1, 'Femen', '05169102604', 'ZALA910509KN8', 'ZALA910509MYNPNL07', 0, '1991-05-09', 'pamzapata6@gmail.com', '999 3880470', 'CH', 30, 5, 0, 'Calle 53E No. 405 por 56 y 58, Francisco de Montejo, Mérida, Yucatán. C.P. 97203', '97203', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 12:33:21', '2024-04-30 12:33:21'),
(41, 3, 22, 15, 125, 'Pedro Angel', 'Mejia', 'Segura', '2020-02-11', 1, 'Male', '84896925256', 'MESP691102H44', 'MESP691102HCCJGD00', 1, '1969-11-02', 'petermeseg@gmail.com', '999 3294126', 'CH', 29, 26, 1, 'Calle 18 No. 340 por 39 y 41 Col. Emiliano Zapata Oriente, Mérida, Yucatán. C.P. 97144', '97144', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 12:35:18', '2024-04-30 12:35:18'),
(42, 7, 24, 15, 135, 'Edmundo', 'Magaña', 'Rodulfo', '2020-05-16', 1, 'Male', '02196092080', 'MARE6006144H1', 'MARE600614HDFGDD02', 0, '1960-06-14', 'recnomxsp@gmail.com', '999 1466418', 'CH', 0, 0, 0, 'Calle 49A No. 444 por 58 y 60, Fracc. Francisco de Montejo, Mérida, Yucatán. C.P. 97203', '97203', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 12:38:56', '2024-04-30 12:38:56'),
(43, 9, 13, 15, 139, 'Mauricio Isaias', 'Duran', 'Galera', '2022-12-02', 1, 'Male', '84086901448', 'DUGM691006AL0', 'DUGM691006HYNRLR09', 0, '1969-10-06', 'angelnocturno6937@gmail.com', '999 3229055', 'EG', 36, 6, 1, 'Calle 129B No. 165 por 46 y 44, Col. Serapio Rendón 11, Mérida, Yucatán. C.P. 97285', '97285', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 12:43:53', '2024-04-30 12:43:53'),
(44, 11, 2, 15, 146, 'Jonathan Armin', 'Mijangos', 'Balam', '2020-04-09', 1, 'Male', '19159370626', 'MIBJ930824S85', 'MIBJ930824HYNJLN01', 0, '1993-08-24', 'jhony931407@hotmail.com', '999 2979124', 'CH', 32, 8, 0, 'Calle 17 No. 127 por 16 y 18. Col. Los Arcos, Umán, Yucatán. C.P. 97390', '97390', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 12:53:25', '2024-04-30 12:53:25'),
(45, 4, 29, 15, 154, 'Miguel', 'Lanzagorta', 'Mata', '2020-05-16', 1, 'Male', '03197033941', 'LAMM700430IXA', 'LAMM700430HPLNTG01', 0, '1970-04-30', 'recnomxsp@gmail.com', 'no tiene', 'CH', 0, 0, 0, 'Cto. Gallegos M 21 L 6, Sup. Mza. 323, Fracc. Gran Santa Fe III, Benito Juárez, Quintana Roo. C.P. 77535', '77535', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 12:55:22', '2024-04-30 12:55:22'),
(46, 2, 22, 15, 160, 'Felipe de Jesus', 'Pacheco', 'Chuc', '2020-07-10', 1, 'Male', '84068413917', 'PACF840205KY6', 'PACF840205HYNCHL04', 0, '1984-02-05', 'felipe18chuc@gmail.com', '999 5510638', 'G', 36, 27, 1, 'Calle 34 S/N por 15 y 13, Col. Santo Domingo, Hunucma, Yucatán. C.P. 97353', '97353', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 12:58:41', '2024-04-30 12:58:41'),
(47, 2, 22, 15, 177, 'Edwin Mizael', 'Pool', 'Moreno', '2020-11-03', 1, 'Male', '84078823063', 'POME880215M57', 'POME880215HYNLRD07', 0, '1988-02-15', 'mizaelpool88@gmail.com', '999 7380722', 'G', 34, 27, 1, 'Calle 32 No. 333-12 SM 37 Mz 0492, Lt. S/N, Niv. 03, Col. Villa Bonita, Mérida, Yucatán. C.P. 97285', ' 9728', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 13:00:19', '2024-04-30 13:00:19'),
(48, 2, 22, 15, 182, 'Julian', 'Perez', 'Martinez', '2020-11-25', 0, 'Male', '14047900908', 'PEMJ7908295D2', 'PEMJ790829HTCRRL00', 0, '1979-08-29', 'julianperezmartinez29@gmail.com', '999 1593354', 'G', 36, 7, 1, 'Calle 88L No. 8 por 165 y 167, Col. Emiliano Zapata Sur III, Mérida. C.P. 97297', '97297', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 13:02:03', '2024-06-07 01:33:16'),
(49, 9, 23, 15, 185, 'Mariela Jhoana', 'Uc', 'Escobar', '2021-01-06', 1, 'Femen', '84119313587', 'UEMA930624327', 'UXEM930624MYNCSR04', 1, '1993-06-24', 'ma.jhoana06@hotmail.com', '999 6415440', 'EG', 42, 24, 0, 'Calle 75B No. 444 por 28 y 28A, Col. Tixcacal-Opichen, Mérida, Yucatán. C.P. 97314', ' 9731', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 13:04:03', '2024-04-30 13:04:03'),
(50, 3, 22, 15, 190, 'Julio Alfredo', 'Perez', 'Ruiz', '2021-02-03', 1, 'Male', '38169422979', 'PERJ941117TA3', 'PERJ941117HMCRZL08', 0, '1994-11-17', 'chikitin942022@gmail.com', '999 2463280', 'M', 34, 45, 1, 'Calle 20-SR S/N LT-8 por 43 y 45, Col. Salvador Alvarado Sur, Mérida, Yucatán. C.P. 97196', ' 9719', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 13:06:08', '2024-04-30 13:06:08'),
(51, 2, 22, 15, 192, 'Jose Ernesto', 'Castillo', 'Basulto', '2021-02-03', 1, 'Male', '27159473266', 'CABE940326533', 'CABE940326HYNSSR09', 0, '1994-03-26', 'thosemdgicalgrernhgs@gmail.com', '990 2003388', 'M', 36, 45, 1, 'Calle 80 S/N por 129 y 131, Col. San Antonio Xluch, Mérida, Yucatán. C.P. 97290', '97290', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 13:07:48', '2024-04-30 13:07:48'),
(52, 11, 3, 15, 198, 'Javier de Jesus ', 'Calderon', 'Yam', '2008-03-16', 1, 'Male', '84906926021', 'CAYJ691015NU4', 'CAYJ691015HYNLMV03', 0, '1969-10-15', 'javiercalderon@me.com', '999 3349105', 'CH', 0, 0, 1, 'Calle 28 A No. 338 por 19A y 19B, Fracc. San Francisco Chuburna, Mérida, Yucatán. C.P. 97206', '97206', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 13:09:38', '2024-04-30 13:09:38'),
(53, 3, 22, 15, 201, 'Jose Alfredo', 'Gonzalez', 'Cocom', '2023-10-16', 1, 'Male', '84997401223', 'GOCA741206EY0', 'GOCA741206HYNNCL02', 1, '1974-12-06', 'jgonzalez_cocom@hotmail.com', '999 2740273', 'G', 36, 27, 1, 'Calle 17 No. 826 por 68, Col. Jardines de Mérida, Mérida, Yucatán. C.P. 97135', '97135', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-04-30 13:11:02', '2024-04-30 13:11:02'),
(54, 8, 22, 15, 220, 'Oswaldo Javier', 'Chable', 'Gil', '2021-05-24', 1, 'Male', '45169755217', 'CAGX970312C72', 'CXGO970312HYNHLS02', 1, '1997-03-12', 'oswaldocg46@gmail.com', '997 1450549', 'G', 34, 26, 0, 'Calle 19 S/N por 20 y 22, Col. Mejorada, Tekit, Yucatán. C.P. 97680', '97680', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 03:35:56', '2024-05-02 03:35:56'),
(55, 3, 22, 15, 241, 'Abraham Jesus', 'Chable', 'Gil', '2021-06-30', 1, 'Male', '09160102415', 'CAGX010211MG5', 'CXGA010211HYNHLBA5', 1, '2001-02-11', 'essabraham8@gmail.com', '997 1450551', 'M', 32, 25, 0, 'Calle 23H No. 409 por 2C y 2D, Col. Encimos II, Mérida, Yucatán. C.P. 97370', '97370', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 03:37:25', '2024-05-02 03:37:25'),
(56, 2, 15, 15, 243, 'Leopoldo de Jesus', 'Aguilar', 'Coral', '2021-07-07', 1, 'Male', '82118204278', 'AUCL820430IU2', 'AUCL820430HQRGRP01', 1, '1982-04-30', 'famaguicor@gmail.com', '999 1163350', 'M', 34, 27, 1, 'Calle 51B No. 781 por 98 y 100, Fracc. Americas II, Mérida, Yucatán. C.P. 97302', '97302', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 03:39:03', '2024-05-02 03:39:03'),
(57, 3, 22, 15, 247, 'Edwin Misael', 'Solis', 'Ferraez', '2021-07-21', 1, 'Male', '84008236204', 'SOFE820419NKA', 'SOFE820419HYNLRD05', 1, '1982-04-19', 'ferraez_1982@hotmail.com', '999 6685344', '2EG', 44, 30, 1, 'Calle 65A No. 896 B por 36 y 38, Col. Mulsay, Mérida, Yucatán. C.P. 97249', '97249', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 03:40:49', '2024-05-02 03:40:49'),
(58, 2, 25, 15, 249, 'David', 'Gomez', 'Castillo', '2022-11-01', 1, 'Male', '65887000365', 'GOCD7012014I9', 'GOCD701201HVZMSV01', 0, '1970-12-01', 'recnomxsp@gmail.com', '984 2780015', 'M', 34, 26, 1, 'Cerrada 122, Puerta Maya, 77734', '77734', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 03:42:22', '2024-05-02 03:42:22'),
(59, 10, 22, 15, 271, 'Juan Carlos', 'Tinal', 'Canche', '2021-10-25', 1, 'Male', '82927419737', 'TICJ740603T3A', 'TICJ740603HYNNNN09', 1, '1974-06-03', 'juantinal@gmail.com', '999 7469640', 'G', 36, 28, 1, 'Calle 14 No. 104 B por 19 y 21, Col. Centro, Conkal, Yucatán. C.P. 97345', '97345', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 03:43:45', '2024-05-02 03:43:45'),
(60, 2, 22, 15, 288, 'Tilo Fernando', 'Diaz', 'Mosqueda', '2022-01-01', 1, 'Male', '83068526264', 'DIMT850530GL3', 'DIMT850530HTCZSL09', 0, '1985-05-30', 'fmstudiotenosique@gmail.com', '984 1851282', 'CH', 28, 25, 0, 'Calle 55 S/N, Col. La Tirnchera, Tenosique, Tabasco. C.P. 86901', '86901', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 03:45:07', '2024-05-02 03:45:07'),
(61, 10, 22, 15, 290, 'Jose Alfredo', 'Osorio', 'Dominguez', '2022-01-03', 0, 'Male', '83917426260', 'OODA741104EX9', 'OODA741104HTCSML04', 0, '1974-11-04', 'osoriodominguezj019@gmail.com', 'no tiene', 'G', 38, 45, 1, 'Calle Nicolás Bravo 3era Secc. S/N, Paraíso, Tabasco', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 03:47:08', '2024-06-07 01:33:38'),
(62, 10, 22, 15, 299, 'Manuel', 'Gutierrez', 'Hernandez', '2022-01-14', 0, 'Male', '67028102886', 'GUHM810416BM2', 'GUHM810416HCSTRN05', 0, '1981-04-16', 'recnomxsp@gmail.com', 'no tiene', 'M', 36, 28, 1, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 03:48:28', '2024-06-07 01:33:59'),
(63, 2, 25, 15, 306, 'Jose Antonio', 'Matu', 'Esparza', '2022-02-18', 1, 'Male', '84089008662', 'MAEA9004105Q8', 'MAEA900410HYNTSN06', 1, '1990-04-10', 'recnomxsp@gmail.com', '999 2344722', 'G', 34, 27, 1, 'Calle 24 por 27 S/N, Loc. Chicxulub Pueblo, Mérida, Yucatán. C.P. 97340', '97340', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 03:55:20', '2024-05-02 03:55:20'),
(64, 2, 22, 15, 310, 'Leonardo Ezequiel', 'Medina', 'Gil', '2022-03-07', 0, 'Male', '62149543969', 'MEGL950405U88', 'MEGL950405HYNDLN08', 0, '1995-04-04', 'Lmedinagil2022@gmail.com', '981 1930453', 'G', 36, 27, 1, 'sn', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 04:46:40', '2024-06-07 01:34:17'),
(65, 2, 22, 15, 313, 'Rafael Felipe', 'Gonzalez', 'Remedios', '2022-04-01', 0, 'Male', '02226017347', 'GORR600526I40', 'GORR600526HNENMF07', 0, '1960-05-26', 'recnomxsp@gmail.com', '990 2071760', 'G', 34, 27, 1, 'Calle 54 No. 525 por 63D y 63C, Col, Las Magnolias, Mérida, Yucatán. C.P. 97208', '97208', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 05:22:23', '2024-06-07 01:34:34'),
(66, 2, 22, 15, 317, 'Antonio de la Cruz', 'Escobedo', 'Puc', '2022-03-17', 1, 'Male', '84796204976', 'EOPA620504MKA', 'EOPA620504HYNSCN05', 0, '1962-05-04', 'antoniopuc91111546@gmail.com', '999 3905044', 'CH', 32, 26, 1, 'Calle 59L No. 564D por 110 y 112, Col. Bojorquez, Mérida, Yucatán. C.P. 97230', '97230', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 05:23:41', '2024-05-02 05:23:41'),
(67, 10, 22, 15, 324, 'Paul Giovanny', 'Gomez', 'Garcia', '2022-03-24', 1, 'Male', '17149458253', 'GOGP940126NC9', 'GOGP940126HVZMRL07', 0, '1994-01-26', 'recnomxsp@gmail.com', '811 0235814', 'G', 36, 29, 1, 'Calle Emilio Leysegui No. 8, Col. El Mirador, Xalapa, Veracruz. C.P. 91170', '91170', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 05:24:50', '2024-05-02 05:24:50'),
(68, 3, 14, 15, 333, 'Walter Yiovanny', 'Canche', 'Cauich', '2022-05-05', 1, 'Male', '16078931348', 'CACW890613KC4', 'CACW890613HCCNCL07', 1, '1989-06-13', 'lic.wy.canche@gmail.com', '996 1122665', 'G', 40, 28, 0, 'Calle 15 S/N por 16 y 18, Col. Alameda, Dzitbalche, Campeche. C.P. 24920', '24920', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 05:26:58', '2024-05-02 05:26:58'),
(69, 2, 22, 15, 334, 'Julia Marisol', 'Benitez', 'Tec', '2022-05-05', 1, 'Femen', '84057902607', 'BETJ791101UB2', 'BETJ791101MYNNCL07', 1, '1979-11-01', 'juliabenitez0179@gmail.com', '999 1128449', 'EG', 36, 25, 1, 'Calle 55 No. 689 por 62B y 64, Col. Flamboyanes, Progreso, Yucatán. C.P. 97324', '97324', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 05:28:12', '2024-05-02 05:28:12'),
(70, 2, 22, 15, 335, 'Jorge Alberto', 'Borges', 'Santana', '2022-05-06', 1, 'Male', '84977840010', 'BOSJ7804234I4', 'BOSJ780423HYNRNR00', 1, '1978-04-23', 'jorgeborges476@gmail.com', '999 9583317', 'EG', 38, 27, 1, 'Calle 66 No. 43 por 149 y 151, Col. San José Tecoh II, Mérida, Yucatán. C.P. 97290', '97290', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 05:35:16', '2024-05-02 05:35:16'),
(71, 2, 22, 15, 338, 'Manuel Alberto', 'Rodriguez', 'Dzul', '2022-05-19', 1, 'Male', '84957606365', 'RODM760630MG0', 'RODM760630HYNDZN04', 0, '1976-06-30', 'manuelalbertorodriguezdzul@gmail.com', '999 3805332', 'G', 36, 27, 1, 'Calle 37 No. 98, Loc. Seye, Seye, Yucatán. C.P. 97500', '97500', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 05:36:32', '2024-05-02 05:36:32'),
(72, 9, 23, 15, 339, 'Mariana Guadalupe', 'Puc', 'Moreno', '2023-08-30', 1, 'Femen', '11139515362', 'PUMM950119D66', 'PUMM950119MYNCRR05', 0, '1995-01-19', 'marianaguadalupepucmoreno@gmail.com ', '999 3099697', 'G', 42, 25, 1, 'Calle 167 No. 345 por 88 y 86, Col. Emiliano Zapata Sur 3, Mérida, Yucatán. C.P. 97297', '97297', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 05:38:04', '2024-05-02 05:38:04'),
(73, 3, 22, 15, 342, 'Erika Virginia', 'Castillo', 'May', '2022-05-23', 1, 'Femen', '31169613044', 'CAME960613HC9', 'CAME960613MYNSYR07', 1, '1996-06-13', 'e132virg_0696@hotmail.com', '999 5280599', 'G', 36, 24, 0, 'Calle 10 No. 494, Depto. 101 Condominio Roma II, Fracc. Portal San Pedro, Mérida, Yucatán. C.P. 97370', '97370', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 05:41:54', '2024-05-02 05:41:54'),
(74, 2, 22, 15, 344, 'Miguel Antonio', 'Tun ', 'Ruiz ', '2023-08-03', 0, 'Male', '2160241473', 'TURM021116LB8', 'TURM021116HYNNZGA6', 0, '2002-11-16', 'mikepavo34@gmail.com', '999 6389300', 'M', 34, 7, 0, 'no tiene', 'no ti', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:08:19', '2024-06-07 01:34:53'),
(75, 10, 22, 15, 347, 'Rigoberto', 'Aquino', 'Hernandez', '2022-06-01', 1, 'Male', '56159667882', 'AUHR960924GH5', 'AUHR960924HTCQRG09', 0, '1996-09-24', 'recnomxsp@gmail.com', '937 1395267', 'G', 38, 28, 1, 'Calle 8 No. 210, Loc. Pob C20, Miguel Hgo y Costilla, Cárdenas, Tabasco.', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:09:48', '2024-05-02 11:09:48'),
(76, 2, 21, 15, 350, 'Hermes Daniel', 'Galvan', 'Gomez', '2022-06-01', 1, 'Male', '02228065989', 'GAGH8001165FA', 'GAGH800116HDFLMR00', 0, '1980-01-16', 'hectorenroma1980@gmail.com', '999 9005653 ', 'G', 0, 0, 1, 'Calle Lago de Yuriria NO. 121, Col. Lagos, Celaya, Guanajuato. C.P. 38060', '38060', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:11:35', '2024-05-02 11:11:35'),
(77, 3, 22, 15, 352, 'Carlos Ivan', 'Canche', 'Cauich', '2022-06-04', 1, 'Male', '03169755422', 'CACC970726BH6', 'CACC970726HCCNCR05', 0, '1997-07-26', 'carlosivancanchecauich67@gmail.com', '996 1050894', 'G', 38, 27, 0, 'Calle 15 S/N Barr. Alameda Dzitblache, Calkini, Campeche. C.P. 24920', '24920', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:14:35', '2024-05-02 11:14:35'),
(78, 2, 22, 15, 353, 'Said Gerardo', 'Lopez', 'Avila', '2022-06-07', 1, 'Male', '96098843525', 'LOAS880725QU7', 'LOAS880725HOCPVD04', 0, '1988-07-25', 'linkrk25@gmail.com', '954 1492955', 'EG', 36, 28, 0, 'Calle Domicilio Conocido, Chunchumil, Maxcanú, Yucatán. C.P. 97805', '97805', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:16:18', '2024-05-02 11:16:18'),
(79, 10, 22, 15, 366, 'Victor Manuel', 'Garcia', 'Gomez', '2022-07-01', 1, 'Male', '02210042806', 'GAGV000922D43', 'GAGV000922HCCRMCA3', 0, '2000-09-22', 'recnomxsp@gmail.com', 'sn', 'M', 34, 27, 1, 'Calle Sin Nombre S/N, Loc. San Miguel, Candelaria, Campeche. C.P. 24347', '24347', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:17:54', '2024-05-02 11:17:54'),
(80, 11, 4, 15, 371, 'Apolonia', 'May', 'Dzul', '2022-07-12', 1, 'Femen', '84996702696', 'MADA6703074AA', 'MADA670307MYNYZP09', 0, '1967-03-07', 'recnomxsp@gmail.com', '999 1971916', 'M', 34, 4, 1, 'Calle 28 No. 113 por 27 y 29, Col. San Miguel, Tixkokob, Yucatán. C.P. 97470', '97470', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:19:20', '2024-05-02 11:19:20'),
(81, 3, 22, 15, 372, 'Jorge Israel', 'Canche', 'Ceballos', '2022-07-15', 0, 'Male', '84068622517', 'CACJ860518MI4', 'CACJ860518HYNNBR08', 1, '1986-05-18', 'jorgejicc@gmail.com', '999 5757935', 'G', 34, 28, 1, 'Calle 21 No. 125, Col. Chuburná, Mérida, Yucatán. C.P. 97204', '97204', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:22:31', '2024-06-07 01:35:10'),
(82, 2, 22, 15, 374, 'Graciela Beatriz', 'Chi', 'Noh', '2022-07-18', 0, 'Femen', '35220428979', 'CING040508RA7', 'CING040508MYNHHRA5', 0, '2004-05-08', 'gracibeatriz66@gmail.com', '999 2748041', '2EG', 34, 5, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:23:51', '2024-06-07 01:35:27'),
(83, 2, 22, 15, 379, 'Eric Saul', 'Jesus', 'Gamboa', '2022-08-02', 1, 'Male', '84088500313', 'JEGE850523KC0', 'JEGE850523HYNSMR09', 0, '1985-05-23', 'ericsauljesu@gmail.com', '996 1097312', 'CH', 32, 30, 1, 'Calle 24 S/N por 25, Barr. Carlos Rivas Becal, Calkini, Campeche. C.P. ', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:25:25', '2024-05-02 11:25:25'),
(84, 3, 22, 15, 382, 'Bruno Gaspar', 'Cerda', 'Ojeda', '2022-08-16', 1, 'Male', '84877010920', 'CEOB701006C67', 'CEOB701006HYNRJR08', 0, '1970-10-06', 'golfo061070@gmail.com', '999 5494241', 'M', 32, 28, 1, 'Calle 8 No. 282 por 25 y 27, Chichi Suárez, Mérida, Yucatán. C.P. 97306', '97306', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:27:56', '2024-05-02 11:27:56'),
(85, 2, 22, 15, 384, 'Oswaldo ', 'Tec', 'Kantun', '2022-08-17', 0, 'Male', '10199465336', 'TEKO940112DI8', 'TEKO940112HCCCNS09', 0, '1994-01-12', 'oswaldokantun76@gmail.com', '999 7067245', 'CH', 30, 6, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:30:19', '2024-06-07 01:35:45'),
(86, 3, 22, 15, 385, 'Romana Virginia', 'Gonzalez', 'Mendez', '2022-08-17', 0, 'Femen', '84937331530', 'GOMR7308236N3', 'GOMR730823MCCNNM08', 0, '1973-08-23', 'brunoacostasc1234@gmail.com', '999 1002328', 'CH', 28, 23, 1, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:32:25', '2024-06-07 01:36:00'),
(87, 9, 23, 15, 390, 'Jose Antonio', 'Pat', 'Pech', '2022-08-24', 1, 'Male', '84129104596', 'PAPA9107161M5', 'PAPA910716HYNTCN00', 0, '1991-07-16', 'antonio_pat@live.com', '999 2102377', 'G', 36, 28, 0, 'Calle 60 No. 679 por 85 y 87, Col. Centro, Mérida, Yucatán. C.P. 97000', '97000', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:33:47', '2024-05-02 11:33:47'),
(88, 1, 30, 15, 391, 'Javier ', 'Martinez', 'Carrillo', '2022-08-24', 1, 'Male', '55169872722', 'MACJ981006KB4', 'MACJ981006HQRRRV00', 0, '1998-10-06', 'javiermcarrillo@hotmail.com', '983 1054159', 'M', 34, 26, 0, 'Calle Naranjo B No. 63 por 42, Fracc. Vega del Mayab, Conkal, Yucatán. C.P. 97346', '97346', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:35:07', '2024-05-02 11:35:07'),
(89, 10, 22, 15, 400, 'Jose', 'Segura', 'Perez', '2022-09-09', 1, 'Male', '03158845978', 'SEPJ880320380', 'SEPJ880320HOCGRS08', 0, '1988-03-20', 'recnomxsp@gmail.com', '998 4050886', 'EG', 42, 37, 1, 'Calle And Sin Nombre S/N, Col. El Mirador, Zihuatanejo de Azueta, Guerrero. C.P. 40880', '40880', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:36:26', '2024-05-02 11:36:26'),
(90, 2, 22, 15, 404, 'Luis Gustavo ', 'Guzman ', 'Jimenez', '2022-09-12', 0, 'Male', '10160131214', 'GUJL0105064I2', 'GUJL010506HTCZMSA1', 0, '2001-05-06', 'ijimene780@gmail.com', '9992302841', 'M', 32, 8, 1, 'C. S/N 73 X 39 EJ. Adolfo Lopez 86900', '86900', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:37:52', '2024-06-07 01:36:19'),
(91, 10, 29, 15, 407, 'Manuel', 'Osorio', 'Cordova', '2022-09-16', 1, 'Male', '83048900720', 'OOCM890109TR0', 'OOCM890109HVZSRN00', 0, '1989-01-09', 'recnomxsp@gmail.com', '984 1682821', 'CH', 0, 0, 0, 'Mza. 23, Lte. 16, Sol Ote/Beta Sur/Orion Sur, Col Centro Sur, Tulum, Quintana Roo.', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:39:16', '2024-05-02 11:39:16'),
(92, 2, 22, 15, 409, 'Jose Alejandro', 'Cruz', 'Amaya', '2022-09-19', 0, 'Male', '07160432550', 'CUAA040822MJ6', 'CUAA040822HYNRMLA9', 0, '2004-08-22', 'cruz2004amaya@hotmail.com ', '983 3081464', 'CH', 29, 26, 1, 'Calle 15 por 22 y 24, Col. La Ermita, Chicxulub Pueblo, Yucatán. C.P. 97340', '97340', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:41:01', '2024-06-07 01:36:38'),
(93, 11, 5, 15, 412, 'Hector Antonio', 'Diaz', 'Tirado', '2022-09-26', 0, 'Male', '90047301578', 'DITH731011HR5', 'DITH731011HSLZRC04', 0, '1973-10-11', 'hdiaz@xsp.mx', '55 54090887', 'G', 0, 0, 1, 'Calle 36a No. 297 por 37, Col. Benito Juárez Norte, Mérida, Yucatán. C.P. 97119', '97119', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:42:12', '2024-06-07 01:36:52'),
(94, 10, 22, 15, 413, 'Jose Carlos', 'Chan', 'Cerino', '2022-10-01', 1, 'Male', '83018700118', 'CACC870317E42', 'CACC870317HCCHRR00', 0, '1987-03-17', 'recnomxsp@gmail.com', '938 1082074', 'M', 34, 27, 1, 'Calle Poseidón 87, Loc. Isla Aguada, Carmen, Campeche. C.P. 24327', '24327', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:43:37', '2024-05-02 11:43:37'),
(95, 10, 22, 15, 419, 'Anacor', 'Gomez', 'Sanchez', '2022-10-15', 1, 'Male', '10189103921', 'GOSA910525AP8', 'GOSA910525HVZMNN07', 0, '1991-05-25', 'recnomxsp@gmail.com', '984 2547501', 'M', 34, 25, 0, 'CSC. Ote/Orion y Beta Sur, Mz. 13, Lte 7, Col, Centro, Tulum, Quintana Roo. C.P. 77760', '77760', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:44:53', '2024-05-02 11:44:53'),
(96, 10, 22, 15, 420, 'Genaro', 'Gutierrez', 'Morales', '2022-10-17', 1, 'Male', '82088516073', 'GUMG851013V31', 'GUMG851013HCSTRN02', 0, '1985-10-13', 'recnomxsp@gmail.com', '919 1312988', 'M', 28, 27, 1, 'Calle Prol. Av. Norte Oriente S/N, Barrio Bonampak, Ocosingo, Chiapas. C.P. 29950', '29950', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:48:01', '2024-05-02 11:48:01'),
(97, 3, 22, 15, 424, 'Marcos Javier', 'Almeida', 'Carrillo', '2022-10-24', 1, 'Male', '81967402629', 'AECM740425GS8', 'AECM740425HYNLRR01', 0, '1974-05-25', 'javiermarcoscarrilloalmeida@gmail', 'sn', '2EG', 44, 28, 0, 'Calle 63C No. 246 A por 10 y 8, Col. Sarmiento, Mérida, Yucatán. C.P.', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:49:11', '2024-05-02 11:49:11'),
(98, 10, 22, 15, 426, 'Manuel Jesus', 'Lugo', 'Palmer', '2022-10-25', 0, 'Male', '81038607750', 'LUPM860827CL6', 'LUPM860827HCCGLN03', 0, '1986-08-27', 'recnomxsp@gmail.com', '999 2311446', 'EG', 38, 11, 1, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:50:25', '2024-06-07 01:37:10'),
(99, 10, 22, 15, 427, 'Luis Alberto', 'Pool', 'Chan', '2022-10-25', 0, 'Male', '84018309876', 'POCL830916FU1', 'POCL830916HYNLHS01', 0, '1983-09-16', 'recnomxsp@gmail.com', 'sn', 'CH', 0, 0, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:52:31', '2024-06-07 01:51:55'),
(100, 2, 22, 15, 433, 'Carlos', 'Ruiz', 'Osorio', '2022-11-11', 1, 'Male', '82876900984', 'RUOC6905247C6', 'RUOC690524HOCZSR04', 0, '1969-05-24', 'recnomxsp@gmail.com', '999 3551260', 'CH', 30, 27, 1, 'Calle 8 No. 109a por 37 y 39, Col. Mejorada, Seye, Yucatán. C.P. 97570', '97570', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:53:43', '2024-05-02 11:53:43'),
(101, 2, 22, 15, 434, 'Carmen Amado', 'Diaz', 'Perez', '2022-11-11', 1, 'Male', '81937603124', 'DIPC760216JD8', 'DIPC760216HCCZRR04', 0, '1976-02-16', 'amado74@gmail.com', '996 1049363', 'G', 40, 29, 1, 'Calle Cesar Lujan Arcilla Mezquita Mz 1, Lt 4, Fracc. Fervor Patrio, Calkini, Campeche. C.P. 24902', '24902', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:55:24', '2024-05-02 11:55:24'),
(102, 3, 22, 15, 435, 'Chintia Lucelly', 'Herrera', 'Lopez', '2023-08-08', 0, 'Femen', '2158158150', 'HELC811014H46', 'HELC811014MYNRPH03', 0, '1981-10-14', 'Separación voluntaria', '999 2220860', 'G', 36, 25, 0, 'Calle 64 A No. 439D 75B, Fracc. Los Manzanos, Cerrito Mulchechen, Yucatán. C.P. 97370', '97370', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:57:34', '2024-06-07 01:37:40'),
(103, 3, 22, 15, 436, 'Melba Patricia', 'Molina', 'Manzano', '2023-07-26', 1, 'Femen', '85169781920', 'MOMM970421AY8', 'MOMM970421MYNLNL08', 1, '1997-04-21', 'patriciamanzano896@gmail.com', '999 5699714', 'G', 36, 25, 0, 'Calle 143 No. 386 por 48 y 50, Cinco Colonias, Mérida, Yucatán. C.P. 97280', '97280', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 11:58:50', '2024-05-02 11:58:50'),
(104, 10, 22, 15, 438, 'Rubicel', 'Jimenez', 'Jimenez', '2022-11-18', 0, 'Male', '31169836546', 'JIJR9806289B8', 'JIJR980628HCSMMB05', 0, '1998-06-28', 'recnomxsp@gmail.com', '919 1225387', 'CH', 28, 6, 1, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 12:00:51', '2024-06-07 01:37:55'),
(105, 5, 17, 15, 439, 'Ernesto', 'Velasco', 'Tellez', '2022-11-01', 1, 'Male', '37896820208', 'VETE680817GM8', 'VETE680817HDFLLR07', 0, '1968-08-17', 'evelasco@vivecountry.com', 'sn', 'CH', 0, 0, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 12:04:02', '2024-05-02 12:04:02'),
(106, 5, 6, 15, 441, 'Raul ', 'Benavides', 'Hernandez', '2022-11-01', 1, 'Male', '39927623064', 'BEHR760824TW3', 'BEHR760824HDFNRL05', 0, '1976-08-24', 'rbenavides@vivecountry.com', 'sn', 'CH', 0, 0, 0, 'Calle 21 No. 358 por 28 y 30, Col. San Pedro Cholul, Mérida, Yucatán. C.P. 97136', '97136', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 12:06:03', '2024-05-02 12:06:03'),
(107, 5, 6, 15, 442, 'Carlos Jose de Jesus', 'Lizarraga', 'Solis', '2022-11-01', 1, 'Male', '84957507464', 'LISC750127J36', 'LISC750127HYNZLR16', 0, '1975-01-27', 'clizarraga@vivecountry.com', 'sn', 'CH', 0, 0, 0, 'Calle 31 No. 175 F por 16 y 18, Col. Francisco I. Madero, Mérida, Yucatán. C.P. 97240', '97240', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 12:07:23', '2024-05-02 12:07:23'),
(108, 5, 6, 15, 443, 'Martha Cecilia', 'Gutierrez', 'Grayeb', '2022-11-01', 1, 'Femen', '02159180161', 'GUGM910128QK9', 'GUGM910128MVZTRR05', 0, '1991-01-28', 'cgrayeb@vivecountry.com', 'sn', 'CH', 0, 0, 0, 'Calle 1 E No. 320 A, Dep. 8 por 42 y 44, Col. Campestre, Mérida, Yucatán. C.P. 97120', '97120', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 12:10:12', '2024-05-02 12:10:12'),
(109, 11, 7, 15, 444, 'Angela Aylin', 'Cime', 'Cauich', '2022-12-01', 1, 'Femen', '23169905074', 'CICA9912156Z0', 'CICA991215MYNMCN08', 1, '1999-12-15', 'aylin15cime@gmail.com', '991 1145755', 'CH', 30, 5, 0, 'Calle 12 No. 301 por 21 y 23, Col. Maria Luisa, Mérida, Yucatán. C.P. 97199', '97199', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 12:11:25', '2024-05-02 12:11:25'),
(110, 2, 22, 3, 448, 'Orquidea Maricruz', 'Matos', 'Pool', '2022-12-19', 0, 'Femen', '84129403832', 'MAPO940620K80', 'MAPO940620MYNTLR02', 0, '1994-06-20', 'matostacha@gmail.com', '991 1183515', 'G', 34, 5, 1, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 12:12:36', '2024-06-07 01:38:12'),
(111, 2, 22, 1, 449, 'Crisol Asuncion', 'Manzanero', 'Herrera', '2022-12-22', 1, 'Femen', '84018409619', 'MAHC840211D38', 'MAHC840211MYNNRR07', 0, '1984-02-11', 'solmanzanero778@gmail.com', '999 2311237', 'M', 36, 27, 0, 'Calle 61X No. 549C por 38 y 40, Fracc. Reparto Granjas, Mérida, Yucatán. C.P. 97270', '97270', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 12:13:47', '2024-05-02 12:16:34'),
(112, 3, 22, 1, 450, 'Jesus Adrian', 'Can', 'Dzib', '2023-06-14', 0, 'Male', '44200219101', 'CADJ020507PY5', 'CADJ020507HYNNZSA2', 0, '2002-05-07', 'jesusadriancandzib@gmail.com', 'sn', 'CH', 0, 0, 0, 'Calle 109 No. 288 por 40 y 42, Col. Canto, Mérida, Yucatán. C.P. 97189', '97189', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 12:17:48', '2024-06-07 01:38:32'),
(113, 2, 22, 1, 451, 'Christian Alejandro ', 'Medina', 'Basto', '2023-06-26', 0, 'Male', '04130277512', 'MEBC020324J88', 'MEBC020324HYNDSHA4', 0, '2002-03-24', 'cb937841@gmail.com', '999 7375927', 'EG', 36, 0, 0, 'Calle 14 No. 230 por 27 y 25, Ixil, Yucatán', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 12:23:23', '2024-06-07 01:38:51'),
(114, 3, 22, 1, 454, 'Sebastian', 'Contreras', 'Lopez', '2022-12-27', 1, 'Male', '83139420539', 'COLS9401203N5', 'COLS940120HTCNPB09', 1, '1994-01-20', 'recnomxsp@gmail.com', '914 1072727', 'G', 40, 28, 0, 'Calle Reforma S/N, Col Ejido del Carmen, Jalpa de Mendez, Tabasco. C.P. 86208', '86208', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 12:27:31', '2024-05-02 12:27:31'),
(115, 2, 22, 1, 457, 'Lucelly del Carmen', 'Ortegon', '', '2023-01-03', 1, 'Femen', '02218602643', 'ORLU8603269I4', 'OEXL860326MYNRXC05', 0, '1986-03-26', 'pinto26johana@gmail.com', '999 3780127', 'G', 32, 24, 1, 'Calle 24 No. 7375 por 19 y 21, Col. Maria Luisa, Mérida, Yucatán. C.P. 97199', '97199', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 12:28:51', '2024-05-02 12:28:51'),
(116, 11, 8, 10, 460, 'Gabriela', 'Loyo', 'Solis', '2023-01-09', 1, 'Femen', '02199638764', 'LOSG9609129W1', 'LOSG960912MMNYLB02', 1, '1996-09-12', 'gabrielaloyo12@hotmail.com', '999 3349046', 'G', 0, 0, 0, 'Calle 5 No. 125 22, Diag. 24, Cholul, Yucatán.', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 12:34:52', '2024-05-02 12:34:52'),
(117, 10, 22, 15, 463, 'Gretel', 'Rebolledo', 'Cardenas', '2023-01-12', 0, 'Male', '67067802388', 'RECG781213MP6', 'RECG781213HYNBRR03', 0, '1978-12-13', 'recnomxsp@gmail.com', '922 2831820', 'CH', 30, 8, 1, 'Calle Rtno 2a1, M 94, E1 D1, Región 93, Benito Juárez, Quintana Roo. C.P. 77517', '77517', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 12:37:01', '2024-06-07 01:39:05'),
(118, 2, 22, 1, 465, 'Angel Jesus', 'Perez', 'Peniche', '2023-01-17', 1, 'Male', '43048551493', 'PEPA8509111E2', 'PEPA850911HYNRNN03', 1, '1985-09-11', 'angelpeniche406@gmail.com', '999 5710524', 'EG', 40, 29, 1, 'Calle 4 Sur No. 344 por 33 y 35, Col. Salvador Alvarado Sur, Mérida, Yucatán. C.P. 97196', '97196', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 12:38:35', '2024-05-02 12:38:35'),
(119, 2, 22, 8, 467, 'Karen Alejandra', 'Garcia', 'Gomez', '2023-01-19', 1, 'Femen', '19159329515', 'GAGK930610199', 'GAGK930610MCCRMR01', 0, '1993-06-10', 'alexdemorato85@gmail.com', '999 3724717', '2EG', 38, 26, 1, 'Calle 5C No. 24 y 91 por 76 y 78, Fracc. Santa Ana, Kanasin, Yucatán. C.P. 97000', '97000', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 12:40:04', '2024-05-02 12:40:04'),
(120, 3, 22, 15, 473, 'Luis Giovanny', 'Sanchez', 'Mora', '2023-02-01', 1, 'Male', '43139532204', 'SAML951009QU9', 'SAML951009HTSNRS03', 0, '1995-10-09', 'luisgiovannysanchezmora7@gmail.com', '831 1132331', 'M', 32, 27, 1, 'Calle 21 No. 183 por 26a y 26b, Col, Centro, Hunucma , Yucatán. C.P. 97350', '97350', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 12:44:05', '2024-05-02 12:44:05'),
(121, 11, 9, 1, 478, 'Joel Alberto', 'Herrera', 'Dzib', '2023-02-13', 1, 'Male', '59169912827', 'HEDJ990520CI3', 'HEDJ990520HYNRZL09', 0, '1999-05-20', 'joelalbertoherreradzib9@gmail.com', '999 4387907', 'M', 0, 0, 0, 'Calle 23A No. 459 por 54 y 56, Fracc. Paseos de Itzincab, Uman, Yucatán. C.P. 97390', '97390', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 12:48:16', '2024-05-02 12:48:16'),
(122, 10, 22, 15, 479, 'Jonny de Jesus', 'Lara', 'Rodriguez', '2023-06-16', 0, 'Male', '3220398204', 'LARJ030830362', 'LARJ030830HCSRDNA7', 0, '2003-08-30', 'recnomxsp@gmail.com', '222 5113438', 'CH', 0, 29, 0, 'Calle del Panteon S/N, Barr. Guadalupe, Chilon, Chiapas. C.P. 29940', '29940', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 12:49:35', '2024-06-07 01:39:43'),
(123, 3, 22, 1, 480, 'Nestor  Fabian', 'Hernandez', 'Martinez', '2023-02-14', 0, 'Male', '9169413946', 'HEMN940911NX3', 'HEMN940911HCSRRS00', 0, '1994-09-11', 'sheldonyuyis@hotmail.com', '999 1218225', 'CH', 0, 2, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-02 12:50:39', '2024-06-07 02:55:58'),
(124, 10, 22, 15, 481, 'Adrian', 'Diaz ', 'Garcia', '2023-02-20', 0, 'Male', '70180468236', 'DIGA040212J81', 'DIGA040212HCSZRDA7', 0, '2004-02-12', 'recnomxsp@gmail.com', '56 34718121', 'M', 30, 8, 0, 'Calle Av. 2a Sur Poniente S/N, Barr. Centro, Tapachula, Chiapas. C.P. 29730', '29730', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 00:26:06', '2024-06-07 01:40:17'),
(125, 10, 22, 15, 489, 'Francisco Javier', 'Lara', 'Perez', '2023-03-03', 0, 'Male', '2179636333', 'LAPF961221H11', 'LAPF961221HCSRRR04', 0, '1996-12-21', 'recnomxsp@gmail.com', '637 1001271', 'M', 32, 7, 1, 'Calle Ave. Eugenio Garcia S/N, Valle de Guadalupe, Chiapas', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 00:27:22', '2024-06-07 01:40:38'),
(126, 10, 22, 15, 490, 'Carmelino', 'Perez', 'Alvaro', '2023-03-04', 0, 'Male', '2237016221', 'PEAC7012045I6', 'PEAC701204HCSRLR04', 0, '1970-12-04', 'recnomxsp@gmail.com', '916 1203663', 'CH', 28, 6, 1, 'Calle Allende S/N, Barr. Guadalupe, Chilon, Chiapas', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 00:28:38', '2024-06-07 01:40:58'),
(127, 10, 22, 15, 491, 'Daniel Alberto', 'Cruz', 'Santiago', '2023-03-07', 0, 'Male', '15130135864', 'CUSD011115H12', 'CUSD011115HQRRNNA3', 0, '2001-11-15', 'recnomxsp@gmail.com', '984 2050716', 'CH', 30, 6, 0, 'Calle Emiliano Zapata S/N, Loc. Lomas de Tacamichapan, Jaltipan, Veracruz. C.P. 96201', '96201', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 00:34:10', '2024-06-07 01:41:14'),
(128, 3, 22, 15, 492, 'Martin Ernesto', 'Ku', 'Ek', '2023-03-13', 1, 'Male', '2230270692', 'KUEM0209159J5', 'KUEM020915HYNXKRA6', 0, '2002-09-15', 'ernestoackerman4@gmail.com', '999 4163945', 'M', 36, 26, 0, 'Calle 45 por 6 y 6a, Col Gran Roble Agricola, Mérida, Yucatán. C.P. 97295 ', '97295', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 00:35:24', '2024-05-03 00:35:24'),
(129, 10, 22, 15, 495, 'Edwin Jordany', 'Perez', 'Jimenez', '2023-03-19', 1, 'Male', '19200324283', 'PEJE030907AD6', 'PEJE030907HCSRMDA8', 0, '2003-09-07', 'no tiene', '919 1949195', 'M', 36, 28, 0, 'Calle San Martin S/N Loc. Bachajon, Barrio 20 de Noviembre, Chilon, Chiapas. C.P. 29943', '29943', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 00:36:46', '2024-05-03 00:36:46'),
(130, 2, 22, 1, 499, 'Fredy Alberto', 'Chi', 'Baas', '2023-08-08', 0, 'Male', '84109119754', 'CIBF9110122NA', 'CIBF911012HYNHSR04', 0, '1991-10-12', 'recnomxsp@gmail.com', '999 2510546', 'M', 32, 0, 0, 'Calle 12 S/N por 21 y 23, Col. San Jose Tzal, Uman, Yucatán. C.P. 97394', '97394', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 00:37:57', '2024-06-07 01:41:38'),
(131, 3, 22, 1, 502, 'Maribel Guadalupe', 'Segura', 'Roque', '2023-09-13', 0, 'Femen', '84998229839', 'SERM820430344', 'SERM820430MMCGQR06', 0, '1982-04-30', 'maribel1982segura@gmail.com', '999 1806313', 'CH', 0, 0, 0, 'C. 187M No 621 x 108 y 110 Fracc Santa Cruz Palomeque ', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 00:39:02', '2024-06-07 01:41:59'),
(132, 10, 22, 15, 504, 'Isaias', 'Cruz', 'Sanchez', '2023-04-01', 0, 'Male', '82069106209', 'CUSI910319C69', 'CUSI910319HQRRNS08', 0, '1991-03-19', 'no tiene', '984 1279499', 'CH', 0, 0, 1, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 00:40:20', '2024-06-07 01:42:15'),
(133, 10, 22, 1, 505, 'Timoteo', 'Cabrera', 'Chable', '2023-04-08', 1, 'Male', '83067000048', 'CACT7012053Y2', 'CACT701205HTCBHM08', 0, '1970-12-05', 'no tiene', '936 1012223', 'M', 34, 27, 0, 'C. Jon 10 de mayo S/N Col. Florida 86700 Macuspana, Tabasco ', '86700', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 00:41:48', '2024-05-03 00:41:48');
INSERT INTO `employees` (`id`, `id_department`, `id_job`, `id_recruitment_method`, `code`, `name`, `sure_name`, `last_name`, `entry_date`, `status`, `gender`, `nss`, `rfc`, `curp`, `ssp`, `natal_date`, `email`, `phone`, `shirt_size`, `pants_size`, `shoe_size`, `has_children`, `address`, `cp`, `comments`, `has_birth_certificate`, `has_identification`, `has_curp`, `has_nss`, `has_address_certification`, `has_studies_certification`, `has_tax_certificate`, `has_smn`, `has_no_criminal_certificate`, `has_health_certificate`, `has_sv`, `createdAt`, `updatedAt`) VALUES
(134, 3, 22, 1, 508, 'Manuel Jesus', 'Eb', 'Lopez', '2023-04-11', 1, 'Male', '84876713284', 'ELMA6612241W9', 'EXLM661224HYNBPN05', 0, '1966-12-24', 'meb297762@gmail.com', '999 5122975', 'M', 30, 25, 1, 'C. 16 No 87F x 13 y 15 Cacalchen C.P. 97460', '97460', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 00:43:24', '2024-05-03 00:43:24'),
(135, 3, 22, 1, 511, 'Martin Eduardo', 'Canul ', 'Piste ', '2023-05-04', 0, 'Male', '84956503928', 'CAPM6510127R6', 'CAPM651012HYNNSR05', 0, '1965-10-12', 'no tiene', '999 2411368', 'M', 28, 6, 0, 'C. 39 No 339 x 14 y 16 Col. Mlechor Ocampo 1, Mérida', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 00:44:58', '2024-06-07 01:42:36'),
(136, 2, 22, 10, 513, 'Vanessa Estebany', 'Palacios ', 'Martin', '2023-05-15', 0, 'Femen', '2160288995', 'PAMV021127P1A', 'PAMV021127MYNLRNA3', 0, '2002-11-27', 'palaciosvanessa071@gmail.com', '999 1601237', 'M', 30, 23, 1, 'C. 23A x 16 y 18 Mococha C.P. 97454', '97454', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 00:46:27', '2024-06-07 01:42:55'),
(137, 3, 22, 10, 514, 'Osvan Jared', 'Canche ', 'Canul', '2023-05-16', 1, 'Male', '5160238324', 'CACX020701PN1', 'CXCO020701HCCNNSA1', 0, '2002-07-01', 'ocanchecanul@gmail.com', '996 1087590', 'M', 32, 26, 0, 'C. 15 S/N x  Via del Tren Dzitbalche, Campeche ', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 00:47:47', '2024-05-03 00:47:47'),
(138, 3, 22, 10, 515, 'Karen Aracely', 'Ku', 'Ek', '2023-05-23', 1, 'Femen', '19230480220', 'KUEK041226BU0', 'KUEK041226MYNXKRA6', 1, '2004-12-26', 'amparoaracely26@gmail.com', '999 6132686', 'G', 34, 25, 0, 'C. 45 No 185 x 6 y 6A Roble Agricola, Mérida C.P. 97255', '97255', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 00:48:58', '2024-05-03 00:48:58'),
(139, 3, 22, 1, 516, 'Maria Isabel', 'Ceballos ', 'Vazquez ', '2023-05-24', 1, 'Femen', '84977900483', 'CEVI790608KE8', 'CEVI790608MYNBZS06', 1, '1979-06-08', 'no tiene', '999 2145502', 'M', 30, 24, 1, 'C. 13 No 118 x 26 y 26A San Juan, Hunucma ', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 00:50:16', '2024-05-03 00:50:16'),
(140, 2, 22, 1, 517, 'Martha Leticia', 'Espinosa ', 'Pech ', '2023-05-29', 0, 'Femen', '3168637001', 'EIPM860106CE4', 'EIPM860106MYNSCR05', 0, '1986-01-06', 'malignadehernandez@gmail.com', '999 5699028', 'M', 28, 3, 1, 'C. 13A No 77 x 6 Tulipanes, Kanasin C.P. 97000', '97000', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 00:51:33', '2024-06-07 01:43:12'),
(141, 2, 22, 1, 518, 'Julian Francisco', 'Duran ', 'Mezquita ', '2023-05-29', 0, 'Male', '3190051643', 'DUMJ001216GE3', 'DUMJ001216HYNRZLA8', 0, '2000-12-16', 'duranjulian141@gmail. com', '999 9708336', 'M', 32, 8, 0, 'C. 13 S7N x 32 y 34  Santo Domingo, Hunucma ', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 00:52:54', '2024-06-07 01:43:29'),
(142, 2, 22, 1, 519, 'Rogelio Rodolfo', 'De la cruz ', 'Balam ', '2023-05-29', 1, 'Male', '3218775181', 'CUBR870308314', 'CUBR870308HYNRLG02', 0, '1987-03-08', 'rogerdelacruz180@gmail.com', '999 1036850', 'M', 32, 27, 1, 'C. 21A No 345 x 24 y 26 San Pedro Cholul C.P. 97138 ', '97138', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 00:54:00', '2024-05-03 00:54:00'),
(143, 2, 22, 1, 521, 'Moises Guadalupe', 'Colli ', 'Rubio', '2023-05-30', 0, 'Male', '18230415111', 'CORM041230LD5', 'CORM041230HYNLBSA0', 0, '2004-12-30', 'ositopolarsitos12@gmail.com', '999 3880324', 'M', 28, 7, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 00:55:26', '2024-06-07 01:44:01'),
(144, 2, 22, 1, 523, 'Iliana Victoria', 'Moreno ', 'Vera ', '2023-06-07', 0, 'Femen', '81128101052', 'MOVI811220PJA', 'MOVI811220MCCRRL09', 1, '1981-12-20', 'ilianamorenovela@gmail.com ', '999 5513856', 'M', 28, 3, 1, 'C. 83 No 1128 No 136 y 136B Susula Xoclan C.P. 97314', '97314', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 01:54:35', '2024-06-07 01:44:21'),
(145, 10, 22, 10, 524, 'Ricardo', 'Ruiz', 'Tadeo', '2023-06-01', 0, 'Male', '67967854844', 'RUTR780303FB3', 'RUTR780303HVZZDC03', 0, '1978-03-03', 'recnomxsp@gmail.com', '932 1155953', 'CH', 0, 2, 1, 'C. Jose Victor Jimenez S/N INT Col. Centro 86800 Teapa, Tabasco  ', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 01:56:16', '2024-06-07 01:45:03'),
(146, 10, 22, 15, 525, 'Agustin', 'Ramirez', 'Espinosa', '2023-06-10', 0, 'Male', '67886990448', 'RAEA690423Q26', 'RAEA690423HVZMSG00', 0, '1969-04-23', 'recnomxsp@gmail.com', '984 1298293', 'CH', 0, 0, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 01:57:26', '2024-06-07 01:45:18'),
(147, 2, 22, 1, 526, 'Francisco Javier', 'Rivero ', 'Escalante ', '2023-06-20', 0, 'Male', '24160437950', 'RIEF040918GE6', 'RIEF040918HYNVSRA9', 0, '2004-09-18', 'riverofrancisco574@gmail.com', '999 1325299', 'CH', 32, 7, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 01:58:50', '2024-06-07 01:45:34'),
(148, 3, 22, 1, 529, 'Paula Marisol', 'Lopez', 'Mota ', '2023-06-27', 0, 'Femen', '2239598168', 'LOMP9512301D6', 'LOMP951230MYNPTL08', 0, '1995-12-30', 'paula_marisol_mdas@outlook.es', '999 2360328', 'M', 30, 5, 1, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 02:00:01', '2024-06-07 01:45:49'),
(149, 3, 22, 1, 531, 'Emir Antonio', 'Gonzalez ', 'Garcia ', '2023-07-04', 0, 'Male', '44149695809', 'GOGE9610029N4', 'GOGE961002HQRNRM01', 0, '1996-10-02', 'gonzalezemir227@gmail.com ', '998 2321675', 'M', 34, 9, 1, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 02:03:06', '2024-06-07 01:46:03'),
(150, 11, 10, 10, 532, 'Veronica', 'Villegas ', 'Rubio ', '2023-07-04', 1, 'Femen', '39018004422', 'VIRV8009096J7', 'VIRV800909MDFLBR08', 1, '1980-09-09', 'veronica.villegas.rubio@gmail.com', '55 18494281', 'M', 0, 0, 0, 'C. 49B No 846 x 82 y 82A Real Montejo Libelulas C.P. 97302', '97302', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 02:04:14', '2024-05-03 02:04:14'),
(151, 3, 22, 1, 534, 'Nicolas Martin', 'Azcorra ', 'Ruelas ', '2023-07-06', 0, 'Male', '18159810458', 'sn', 'AORN980130HYNZLCO2', 0, '1998-01-30', 'no tiene', '999 7377151', 'G', 36, 8, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 02:07:28', '2024-06-07 02:57:48'),
(152, 3, 22, 10, 535, 'Jorge Reyes', 'Martinez', 'Pasos ', '2023-07-07', 1, 'Male', '82078303318', 'MAPJ8301061D8', 'MAPJ830106HYNRSR08', 0, '1983-01-06', 'jorge160216reyes@gmail.com', '999 3297072', 'G', 32, 26, 1, 'C. 38 No 270A x 25A y 25 Chenkú, Mérida C,P. 97219', '97219', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 02:08:42', '2024-05-03 02:08:42'),
(153, 3, 22, 1, 536, 'Jesus Michel', 'Couoh', 'Cocon', '2023-07-19', 0, 'Male', '56190379869', 'COCJ031202', 'COCJ031202HQRHCSA8', 0, '2003-12-02', 'cocomjesus453@gmail.com', '999 6449996', 'G', 36, 26, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 02:09:53', '2024-06-07 01:46:36'),
(154, 2, 22, 1, 537, 'Omar', 'Santiago', 'Hernández', '2023-07-19', 1, 'Male', '81128911732', 'SAHO890725RY5', 'SAHO890725HOCNRM04', 0, '1989-07-25', 'omarstghdz@gmail.com', '971 1459819', 'CH', 30, 24, 0, 'C. 113 No 336 x 42A y 44 Cinco Colonias, Mérida C.P. 97199', '97199', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 12:08:30', '2024-05-03 12:08:30'),
(155, 10, 22, 1, 539, 'Samuel David', 'De la cruz ', 'Reyes', '2023-07-17', 0, 'Male', '74169892713', 'CURS9804219L8', 'CURS980421HTCRYM07', 0, '1998-04-21', 'reyessami2504@gmail.com', '984 2095927', 'CH', 0, 0, 0, 'C. Prol Alatorre S/N Col. Centro 86706 Macuspana, Tabasco', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 14:06:12', '2024-06-07 01:46:51'),
(156, 3, 22, 1, 540, 'Carlos Enrique', 'Aldana ', 'Coj', '2023-07-21', 0, 'Male', '81956900096', 'AACC690504PD3', 'AACC690504HCCLJR09', 0, '1969-05-04', 'carlos_2017@outlook.es', 'sn', 'M', 32, 6, 1, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 14:11:34', '2024-06-07 02:52:58'),
(157, 2, 22, 1, 541, 'Alex Manuel', 'Cuevas ', 'Yan ', '2023-07-21', 0, 'Male', '38149261612', 'CUYA920517U77', 'CUYA920517HCCVNL00', 0, '1992-05-17', 'alexcuevas17@outlook.com', '999 3926801', 'M', 32, 7, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 14:14:13', '2024-06-07 01:47:20'),
(158, 2, 22, 1, 542, 'Jose Alejandro', 'Chan ', 'Tzel ', '2023-07-21', 0, 'Male', '81048613509', 'CATA870123732', 'CATA870123HCCHZL09', 0, '1987-01-23', 'alejandrokk23@gmail.com', '981 1427785', 'EG', 40, 29, 1, 'C. 24 S/N Barrio San Feliciano, Campeche C.P. 24920', '24920', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 14:16:50', '2024-06-07 01:47:35'),
(159, 10, 22, 1, 543, 'William', 'Aleman', 'Hernandez', '2023-07-22', 0, 'Male', '6169709786', 'AEHW970806PH8', 'AEHW970806HVZLRL00', 0, '1997-08-06', 'no tiene', 'sn', 'CH', 0, 0, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 14:18:29', '2024-06-07 01:47:54'),
(160, 10, 22, 1, 544, 'Efrain Ruben', 'Duran ', 'Ku ', '2023-07-27', 0, 'Male', '84998103513', 'DUKE810722E14', 'DUKE810722HYNRXF09', 0, '1981-07-22', 'no tiene', '999 2654915', 'M', 32, 27, 1, 'C. 73A No 485A x 50 y 52 Centro, Mérida C.P. 97000', '97000', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 14:22:12', '2024-06-07 01:48:08'),
(161, 2, 22, 10, 545, 'Patricia', 'Chuc ', 'Flores ', '2023-07-31', 0, 'Femen', '6139212549', 'sn', 'CUFP920910MYNHLT08', 0, '1992-09-10', 'chucp71@gmail.com', '999 4167757', 'G', 36, 6, 1, 'C. 20 No 112 x 25 y 27 Loc. Chicxulub C.P. 97340', '97340', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 14:26:01', '2024-06-07 01:48:34'),
(162, 2, 22, 10, 546, 'Filiberto', 'Canche ', 'Irabien ', '2023-08-01', 0, 'Male', '84887201113', 'CAIF720204TZ9', 'CAIF720204HYNNRL00', 0, '1972-02-04', 'filibertocanche93@gmail.com', '999 2600825', 'G', 34, 7, 1, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 14:27:43', '2024-06-07 01:48:47'),
(163, 3, 22, 1, 547, 'Saul Ivan', 'Uicab ', 'Koo', '2023-08-15', 0, 'Male', '56170372173', 'UIKS030918ET7', 'UIKS030918HYNCXLA3', 0, '2003-09-18', 'uicabsaul974@gmail.com ', '999 2317296', 'G', 36, 28, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-03 14:30:09', '2024-06-07 01:49:04'),
(164, 2, 22, 1, 548, 'Rusell Daniel', 'Villalobos ', 'Ita ', '2023-08-16', 0, 'Male', '84139327971', 'VIIR930707BX0', 'VIIR930707HYNLTS04', 0, '1993-07-07', 'sia.c4.leyenda@gmail.com', '999 2637123', 'CH', 32, 7, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 06:58:00', '2024-06-07 01:49:56'),
(165, 2, 22, 1, 549, 'Pedro Anastacio', 'Bautista ', 'Sanchez', '2023-08-16', 0, 'Male', '81018211201', 'BASP831007KE6', 'BASP831007HCCTND09', 0, '1983-10-07', 'pedrobautistasanchez037@gmail.com ', '999 1543736', 'EG', 40, 7, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:00:22', '2024-06-07 01:50:20'),
(166, 2, 22, 1, 550, 'Jahzeel Hefer', 'Ramirez ', 'Hernandez ', '2023-08-23', 0, 'Male', '2200105498', 'RAHJ010906U48', 'RAHJ010906HYNMRHA1', 0, '2001-09-06', 'jahzeelramirez685@gmail.com', '986 1003139', 'CH', 32, 7, 1, 'C. Domicilio conocido Xcucul Sur, cerca de Úman C.P. 97394', '97394', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:01:26', '2024-06-07 01:50:39'),
(167, 2, 22, 1, 551, 'Jesus Emilio', 'Tun', 'Dzay', '2023-04-20', 0, 'Male', '81038606224', 'TUDJ861111H69', 'TUDJ861111HCCNZS00', 0, '1986-11-11', 'Emilio.dzay@hotmail.com', 'sn', 'CH', 0, 0, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:03:03', '2024-06-07 01:50:56'),
(168, 3, 22, 10, 552, 'Maria Cecilia', 'Puc ', 'Ek ', '2023-08-23', 0, 'Femen', 'sn', 'sn', 'PUEC930320MYNCKC08', 0, '1993-03-20', 'no tiene', '999 3943710', 'EG', 36, 3, 1, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:04:48', '2024-06-07 01:51:14'),
(169, 10, 22, 1, 553, 'Juan Pablo', 'Herrera', 'Rosas', '2023-08-17', 0, 'Male', '82008118133', 'HERJ810923NZ4', 'HERJ810923HYNRSN08', 0, '1981-09-23', 'no tiene', 'sn', 'CH', 0, 0, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:06:02', '2024-06-07 01:51:33'),
(170, 10, 22, 15, 554, 'Luis Alberto', 'Pool', 'Chan', '2023-08-24', 1, 'Male', '84018309876', 'POCL830916FUA', 'POCL830916HYNLHS07', 0, '1983-09-16', 'no tiene', 'sn', 'CH', 0, 0, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:07:38', '2024-05-06 07:07:38'),
(171, 2, 22, 10, 555, 'Ruby Alejandrina', 'Cruz  ', 'Lope ', '2023-08-30', 0, 'Femen', '84139203016', 'CULR9211157U8', 'CULR921115MYNRPB05', 0, '1992-11-15', 'alelope041@gmail.com ', '999 2638698', 'EG', 36, 4, 1, 'C. 17D Diag. No 517U x 58A y 60 Gran calzada, Mérida C.P. 97390 ', '97390', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:09:32', '2024-06-07 01:52:12'),
(172, 3, 22, 1, 556, 'Sofia Nallely', 'Reyes ', 'Perez ', '2023-09-04', 0, 'Femen', '61129312593', 'REPS930930G79', 'REPS930930MTLYRF09', 0, '1993-09-30', 'floresita45-@hotmail.com     ', '999 1554134', 'G', 34, 25, 1, 'C. 23B No 444 MZ 12 Fracc. Los encinos Kanasin, Mérida C.P. 97370', '97370', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:11:26', '2024-06-07 01:52:30'),
(173, 3, 22, 10, 557, 'Ruben Noe', 'Castillo ', 'Quen', '2023-09-06', 0, 'Male', '81976600577', 'CAQR660913M16', 'CAQR660913HCCSNB02', 0, '1996-09-13', 'rubennoecastilloQuen@gmail.com', '981 1046159', 'M', 34, 27, 1, 'no tieen', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:13:05', '2024-06-07 01:52:44'),
(174, 2, 22, 1, 558, 'Beker Asbel', 'Lopez ', 'Couoh', '2023-09-07', 0, 'Male', '50190389218', 'LOCB031028EA7', 'LOCB031028HYNPHKA0', 0, '2003-10-28', 'couohasbel28@gmail.com', '999 2609983', 'M', 32, 28, 1, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:14:41', '2024-06-07 01:52:58'),
(175, 2, 22, 10, 559, 'Juan Carlos', 'Mendoza', 'Zetina ', '2023-09-08', 0, 'Male', '50170304989', 'MEZJ0308249E6', 'MEZJ030824HTCNTNA0', 0, '2003-08-24', 'jmendozazetina@icloud.com ', '934 1262932', 'CH', 28, 5, 1, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:15:59', '2024-06-07 01:53:12'),
(176, 2, 22, 1, 560, 'Conrado', 'Couhtiño ', 'Cruz ', '2023-09-08', 1, 'Male', '82079125926', 'COCC911202CR8', 'COCC911202HCSHRN06', 0, '1991-12-02', 'conradocouhti@gmail.com', '999 6155333', 'CH', 28, 26, 1, 'C. 167 x 70 y 72 Nuevo Renacimiento, Mérida', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:16:55', '2024-05-06 07:16:55'),
(177, 10, 22, 10, 561, 'Jesus Manuel', 'Mateo', 'Chan', '2023-11-13', 0, 'Male', '49210251143', 'MACJ021224MG4', 'MACJ021224HTCTHSA8', 0, '2002-12-24', 'no tiene', 'sn', 'CH', 0, 0, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:17:56', '2024-06-07 01:53:39'),
(178, 3, 22, 10, 562, 'Laissa Aranza Jennifer', 'Mex ', 'Tuz ', '2023-09-12', 0, 'Femen', '40169944424', 'METL990908SI8', 'METL990908MYNXZS07', 0, '1999-09-08', 'larissa00477@gmail.com ', '986 1191019', 'CH', 29, 23, 0, 'C. 25 No 469 x 44D y 44C Chenku Linda Vista C.P. 97219', '97219', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:19:40', '2024-06-07 01:54:00'),
(179, 2, 22, 10, 563, 'Ismael', 'Pascual ', 'Sanchez ', '2023-09-12', 1, 'Male', '2178971202', 'PASI891010UI1', 'PASI891010HPLSNS09', 1, '1989-10-10', 'ismaelpascualsanchez@gmail.com ', '990 2035639', 'CH', 32, 27, 1, 'C. 100 No 658 x 183 y 185 Fracc. San Marcos Sustentable, Mérida C.P. 97296', '97296', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:20:38', '2024-05-06 07:20:38'),
(180, 3, 22, 10, 564, 'Rosana', 'Rueda ', 'Edgar', '2023-09-15', 0, 'Femen', '84016902599', 'RUER691216NJ1', 'RUER691216MCSDDS08', 0, '1969-12-16', 'roselinrueda@gmail.com', '999 1725977', '2EG', 38, 26, 1, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:23:02', '2024-06-07 01:54:18'),
(181, 3, 22, 1, 565, 'Jose Ricardo', 'Cetz', 'Uc', '2023-09-15', 0, 'Male', '84068507700', 'CEUR850226156', 'CEUR850226HYNTCC04', 0, '1985-02-26', 'josericardo.cetzux@gmail.com', '999 6499239', 'CH', 30, 27, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:24:07', '2024-06-07 01:54:37'),
(182, 9, 23, 1, 566, 'Ana Gabriela', 'Bravo', 'Lopez ', '2023-09-18', 1, 'Femen', '2209592647', 'BALA950811HY9', 'BALA950811MVZRPN09', 0, '1995-08-11', 'gab-ana2009@live.com', '999 2730511', 'EG', 38, 26, 0, 'C. 50A No 685 x 77 Y 75D Tixcacal opichen, Mérida C.P. 97312', '97312', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:25:13', '2024-05-06 07:25:13'),
(183, 3, 22, 1, 567, 'Josmar Jesus', 'Magaña', 'Jimenez', '2023-09-18', 0, 'Male', '69170297001', 'MACJ0201314RA', 'MACJ020131HYNGMSA7', 0, '2002-01-31', 'josmarmagana33@gmail.com', '999 1078835', 'CH', 30, 26, 1, 'C. 33 No 224 x 36 y 38 Revolución, Progreso C.P. 97320', '97320', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:26:16', '2024-06-07 01:54:50'),
(184, 10, 22, 10, 568, 'Jesus del Carmen', 'Diaz', 'Lagunas', '2023-09-14', 0, 'Male', '82027707924', 'DILJ770715PP0', 'DILJ770715HCSZGS03', 0, '1977-07-15', 'no tiene', '871 3718321', 'M', 34, 26, 0, 'C. 1A Poniente sur 253 barr. centro 29730 Tapilula, Chiapas ', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:27:34', '2024-06-07 01:55:07'),
(185, 2, 22, 10, 569, 'Selina Mercedes', 'Perez ', 'Reyes ', '2023-09-25', 0, 'Femen', '319952351', 'PERS951115QGA', 'PERS951115MCCRYL07', 0, '1995-11-15', 'pselinamercedes@gmail.com ', '981 2282413', 'G', 32, 23, 1, 'C. 21 No 208 x 38 D y 40 Fracc. Santa Cecilia C.P. 97370', '97370', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:28:48', '2024-06-07 02:54:14'),
(186, 10, 22, 1, 570, 'Jose Valdemar', 'Torres', 'Decena', '2023-09-26', 0, 'Male', '81886900315', 'TODV690319QQ1', 'TODV690319HCCRCL09', 0, '1969-03-19', 'recnomxsp@gmail.com', '982 1218042', 'M', 34, 27, 0, 'C. Gariton MZ 4 LT 10 Fracc. paseos de campeche 24088, Campeche, Campeche ', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:29:50', '2024-06-07 01:55:40'),
(187, 2, 22, 1, 571, 'Fatima del Rosario', 'Estrella ', 'Couoh', '2023-10-10', 0, 'Femen', '84058707732', 'EECF8705319U4', 'EECF870531MYNSHT04', 0, '1987-05-31', 'estrellita87.frec@gmail.com ', '999 3924918', '2EG', 44, 26, 1, 'C. 133 No 566 x 66 y 68 San Antonio Xluch 1, Mérida C.P. 97290', ' 9729', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:30:49', '2024-06-07 01:56:02'),
(188, 2, 22, 10, 572, 'Jose Armando', 'Gomez ', 'Nuñez ', '2023-10-10', 0, 'Male', '3200201584', 'GONA0206094V9', 'GONA020609HCSMXRA2', 0, '2002-06-09', 'josearmandogomeznunez594@gmail.com', '999 1777212', 'M', 32, 26, 0, 'C. 22 y 27 S/N Chablekal C.P. 97302', ' 9730', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:32:15', '2024-06-07 02:56:28'),
(189, 9, 23, 10, 573, 'Guadalupe Concepcion', 'Colli ', 'Ucan ', '2023-10-10', 1, 'Femen', '23169957802', 'COUG990315FL3', 'COUG990315MYNLCD01', 0, '1999-03-15', 'guadalupecolliucan@gmail.com ', '991 1111718', 'CH', 29, 23, 0, 'C. 19A x 20 y 22 Bokoba C.P. 97466', '97466', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:33:12', '2024-05-06 07:33:12'),
(190, 2, 22, 1, 574, 'Luis Fernando', 'Gonzalez ', 'Dominguez ', '2023-10-12', 0, 'Male', '84058717830', 'GODL870422FX0', 'GODL870422HYNNMS00', 0, '1987-04-22', 'fg4151680@hoitmail.com', '999 1463620', 'M', 32, 26, 1, 'C.23 x 10 y 12 Soyola Mérida C.P. 97030', '97030', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:34:17', '2024-06-07 01:56:37'),
(191, 9, 23, 6, 575, 'Jose Javier', 'Dzib', 'Yah ', '2023-10-16', 0, 'Male', '17170089464', 'DIYJ000209292', 'DIY000209HYNZHVA9', 0, '2000-02-09', 'jdzib024@gmail.com', '999 4096992', 'M', 34, 28, 0, 'C. 20 No 97 x 19 y 21 Chichen Itza, Mérida C.P. 97170', '97170', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:35:32', '2024-06-07 01:56:52'),
(192, 10, 22, 1, 576, 'Yaneth Danahi', 'Serrano ', 'Caamal ', '2023-10-10', 1, 'Male', '3189659562', 'SECY960201GF4', 'SECY960201MYNRMN02', 0, '1996-02-01', 'yanetdanahiserranocaamal@hotmail.com ', '984 1140440', 'G', 35, 25, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:36:48', '2024-05-06 07:36:48'),
(193, 2, 22, 1, 577, 'Daniel Eduardo', 'Llanez ', 'Cahum ', '2023-10-19', 0, 'Male', '84988106658', 'LACD810221QB0', 'LACD810121HYNLHN09', 0, '1981-01-21', 'llanez775@gmail.com', '999 2726555', 'G', 34, 26, 0, 'C. 35 No 420 x 30 y 34 lopez mateos,Mérida C.P. 97140', '97140', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:37:55', '2024-06-07 01:57:30'),
(194, 3, 22, 10, 578, 'Julian  Benjamin', 'Noh ', 'Benitez ', '2023-10-23', 1, 'Male', '30230435395', 'NOBJ04031243A', 'NOBJ040312HYNHNLA8', 0, '2004-03-12', 'jbenjaminnoh12@gmail.com ', '999 9032851', 'M', 32, 29, 0, 'C. 55 No 689 X 62b Y 64 Fracc. campestre flamboyanes, Progreso ', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:39:01', '2024-05-06 07:39:01'),
(195, 10, 22, 1, 579, 'Efrain', 'Camacho', 'Alvarez', '2023-10-24', 0, 'Male', '71876402745', 'CAAE640216CU8', 'CAAE640216HCSMLF09', 0, '1969-03-19', 'recnomxsp@gmail.com', 'sn', 'CH', 0, 0, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:40:01', '2024-06-07 01:57:50'),
(196, 2, 22, 10, 580, 'Erick Gabriel ', 'Morato ', 'May ', '2023-10-30', 0, 'Male', '21160269243', 'MOME020724NH0', 'MOME020724HYNRYRA5', 0, '2002-07-24', 'erickmomay14@gmail.com ', '9995552656', 'CH', 29, 26, 1, 'C. 41 No 352 x 12 y 14 Salvador Alvadaro Sur C.P. 97196', '97196', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:41:06', '2024-06-07 02:47:20'),
(197, 3, 22, 1, 581, 'Sergio Abraham ', 'Can ', 'Ku ', '2023-11-07', 0, 'Male', '84048410264', 'sn', 'CAKS840327HYNNXR05', 0, '1984-03-27', 'abrahaamcanku2@gmail.com ', '9911051481', 'M', 34, 27, 1, 'C. 27 S/N x 28 y 30 San diego Tekanto, Yuctán C.P. 97520', '97520', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:42:14', '2024-06-07 02:47:41'),
(198, 3, 22, 1, 480, 'Nestor  Fabian', 'Hernandez', 'Martinez', '2023-11-08', 1, 'Male', '9169413946', 'HEMN940911NX3', 'HEMN940911HCSRRS00', 0, '1994-09-11', 'sheldonyuyis@hotmail.com', '999 1218225', 'CH', 0, 0, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:43:17', '2024-05-06 07:43:17'),
(199, 2, 22, 1, 582, 'Henry Luis ', 'Romeo ', 'Rodriguez', '2023-11-09', 0, 'Male', '3237500784', 'RORH7511062U3', 'RORH751106HNEMDN06', 0, '1975-11-06', 'hromeo540@gmail.com', '9932626973', 'CH', 28, 26, 1, 'C. 47 N 316 DEP 4 x 48 y 50 Benito Juarez Norte, Mérida, Yucatan C.P. 97119', '97119', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 07:59:25', '2024-06-07 02:48:51'),
(200, 2, 22, 1, 583, 'Angel del Carmen ', 'Can ', 'Fuentes ', '2023-11-09', 1, 'Male', '82018224210', 'CAFA820802HV3', 'CAFA820802HYNNNN05', 0, '1982-08-02', 'angelcan29@gmail.com', '9971790770', 'M', 32, 5, 1, 'C. 61 S/N x 46 y 48 Venustiano Carranza, Oxkutzcab, Yucatán', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:01:33', '2024-05-06 08:01:33'),
(201, 3, 22, 10, 584, 'Lilia de Rosario ', 'Pacheco ', 'Rosado ', '2023-11-10', 1, 'Femen', '42027502006', 'PARL7505174H0', 'PARL750517MYNCSL00', 0, '1975-05-17', 'liliapr7505@gmail.com', '9991096920', 'M', 30, 24, 1, 'C. 28 No 351 x 39 y 41 Emiliano Zapata Oriente, Mérida, Yucatán C.P. 97144', '97144', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:04:07', '2024-05-06 08:04:07'),
(202, 10, 22, 13, 585, 'Alejandro', 'Mendez', 'Pablo', '2023-11-10', 0, 'Male', '27170079019', 'MEPA0004244J6', 'MEPA000424HTCNBLA0', 0, '2000-04-24', 'zuritamendezalejandro24@gmail.com', '9831111998', 'CH', 28, 5, 1, 'C. Magdalena Canche Santos (Enfrente del mini super Crisly)', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:05:19', '2024-06-07 02:49:06'),
(203, 3, 22, 10, 586, 'Juana Maria ', 'Puc ', 'Pomol ', '2023-11-14', 1, 'Femen', '84997500735', 'PUPJ750209250', 'PUPJ750209MYNCMN02', 0, '1975-02-09', 'juanitapuc04@gmail.com ', '9991286893', 'G', 36, 25, 1, 'C. 26 S/N x 19 y 21 San Juan Hunucma, Yucatan, C.P. 97350', '97350', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:06:26', '2024-05-06 08:06:26'),
(204, 2, 22, 1, 587, 'Jennifer Adriana ', 'Quiñones ', 'Gonzalez ', '2023-11-15', 1, 'Femen', 'sn', 'QUGJ000105DK5', 'QUGJ000105MPLXNNA5', 0, '1999-01-05', 'jennyalphaescarlata@gmail.com', '5523324457', 'G', 36, 26, 0, 'C. 22 No 196A x 19 y 21 Col. Maria Luisa Mérida, Yucatán C.P. 97199', '97199', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:07:37', '2024-05-06 08:07:37'),
(205, 8, 11, 10, 588, 'Jorge ', 'Martinez ', 'Carrillo', '2023-11-17', 1, 'Male', '84987601113', 'MACJ760414IB8', 'MACJ760414HTSRRR05', 1, '1976-04-14', 'carrillogeorge72@gmail.com ', '9993093603', 'G', 36, 5, 1, 'C. 30 No 198C x 33 y 35 Col. Francisco I. Madero, Mérida, Yucatán C.P. 97340', '97340', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:09:30', '2024-05-06 08:09:30'),
(206, 2, 22, 1, 589, 'Biridiana ', 'Carrera ', 'Ramirez ', '2023-11-21', 0, 'Femen', '2158365268', 'CARB830208RC4', 'CARB830208MGRRMR08', 0, '1983-02-08', 'biricarrera08@gmail.com ', '9994745141', 'G', 34, 25, 1, 'C. 15B LOTE 74 CASA 12, Arcos Kanisin, Mérida,Yucatán C.P. 97000', '97000', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:13:38', '2024-06-07 02:49:20'),
(207, 10, 22, 13, 590, 'Juan de Dios', 'Tejeda', 'Heredia', '2023-11-15', 0, 'Male', '31139912690', 'TEHJ990526925', 'TEHJ990526HVZJRN01', 0, '1999-05-26', 'no tiene', '999 231 1446', 'CH', 32, 28, 0, 'no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:14:38', '2024-06-07 02:49:32'),
(208, 3, 22, 1, 591, 'Sergio Alejandro ', 'Magaña', 'Ramos ', '2023-11-24', 0, 'Male', '84119105116', 'MARS910725249', 'MARS910725HYNGMR09', 0, '1991-07-25', 'thedarwinsgame@gmail.com ', '9993634323', 'M', 34, 28, 0, 'C. 48 LT 6 X 185 Y 187 Plan de Ayala Sur Mérida, Yucatán C.P. 97285', '97285', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:15:44', '2024-06-07 02:49:45'),
(209, 2, 22, 1, 592, 'Sergio Daniel ', 'Morales ', 'Perez ', '2023-11-28', 0, 'Male', '95160086427', 'MOPS001226NS0', 'MOPS001226HYNRRRA5', 0, '2000-12-25', 'sergiomorales7742@gmail.com ', '9993255161', 'M', 34, 28, 0, 'C. 25 No 124 x 22 y 24 Kinchil, Yucatán C.P. 97360', '97360', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:16:48', '2024-06-07 02:49:59'),
(210, 3, 22, 10, 593, 'Irma Concepción ', 'Vazquez ', 'Vadillo', '2023-11-29', 0, 'Femen', '34866809795', 'VAVI691210216', 'VAVI691210MYNZDR02', 0, '1969-12-10', 'virma1747@gmail.com ', '9995053026', 'M', 34, 0, 1, 'C. 47 LT 34 x 6 y 8 Col. Leandro del Valle Mérida, Yucatan C.P. 97143', ' 9714', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:19:44', '2024-06-07 02:50:19'),
(211, 2, 22, 1, 383, 'Samuel  ', 'Soberano ', 'Caamal ', '2023-11-30', 0, 'Male', '84129506295', 'SOCS950301F35', 'SOCS950301HYNBMM05', 0, '1995-03-01', 'samuelcaamal352@gmail,com', '9999094039', 'EG', 42, 28, 0, 'C. 107 No 363-B X 48B Y 48-C Col. Santa Rosa Mérida Yucatán C.P. 97279', '97279', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:26:25', '2024-06-07 02:50:34'),
(212, 8, 22, 1, 594, 'Melody Alicia Guadalupe ', 'Cabrieles ', 'Islas ', '2023-11-30', 0, 'Femen', '82937549283', 'CAIM751020DB5', 'CAIM751020MQRBSL04', 0, '1975-10-20', 'magci2075@gmail.com ', '9994332784', 'G', 34, 25, 1, 'C. 181 No 183 D-401 X 30 Y 30E Col. Cielo Alto Kanasin, Yucatan C.P. 97370', '97370', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:27:30', '2024-06-07 02:50:49'),
(213, 8, 22, 10, 595, 'Jose Arturo ', 'Ayala ', 'Aguayo', '2023-12-01', 1, 'Male', '84835802087', 'AAAA583225TR7', 'AAAA580325HYNYGR06', 1, '1958-03-25', 'no tiene', '9991028995', 'M', 34, 27, 1, 'C. 123A No 529 X 42D Y 44 Ampliación hacienda San Antonio del Sur Mérida, Yucatan C.P. 97289', '97289', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:28:56', '2024-05-06 08:28:56'),
(214, 8, 22, 7, 596, 'Carlos Roberto ', 'Patron ', 'Cordova', '2023-12-01', 0, 'Male', '84917345989', 'PACC731013JG3', 'PACC731013HYNTRR09', 0, '1973-10-13', 'cordovapatron.roberto@gmail.com', '9999016310', 'M', 34, 27, 1, 'C. 61 No 263 X 8 y 10 Col. Esperanza Mérida, Yucatán C.P. 97169', '97169', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:29:57', '2024-06-07 02:51:12'),
(215, 8, 22, 7, 597, 'Juanita Bautista ', 'Pool ', 'Velasquez', '2023-12-01', 1, 'Femen', '2188074401', 'POVJ800624HF2', 'POVJ800624MYNLLN17', 1, '1980-06-24', 'joana-pv@outlook.com', '9993348877', 'CH', 32, 24, 0, 'C. 181-E No 183 X 30-C DPTO 18 Col. Cielo Alto Kanasin, Yucatán C.P. 97370', '97370', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:32:17', '2024-05-06 08:32:17'),
(216, 8, 22, 7, 598, 'Gelmy Guadalupe ', 'Koh ', 'Ciau', '2023-12-01', 1, 'Femen', '2208747390', 'KOCG870203CP8', 'KOCG870203MYNHXL08', 1, '1987-02-03', 'kohgelmy5@gmail.com ', '9997484438', 'CH', 30, 22, 1, 'C. 91 No 545-H X 64-C Y 66 Col. Centro Mérida, Yucatán C.P. 97000', '97000', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:33:22', '2024-05-06 08:33:22'),
(217, 8, 22, 7, 599, 'Jesus Fernando ', 'Cortes ', 'Barredo ', '2023-12-01', 1, 'Male', '84937106825', 'COBJ7112230Z', 'COBJ711223HYNRRS08', 1, '1971-12-23', 'fercotez231271@gmail.com', '9991119675', 'M', 34, 27, 1, 'C. 67 No 687A x 86 y 88 Col. Almendros Caucel C.P. 97314', '97314', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:34:24', '2024-05-06 08:34:24'),
(218, 3, 22, 1, 600, 'Carlos Santana ', 'Alfaro ', 'Lara ', '2023-12-01', 1, 'Male', '83099312850', 'AALC9303049I0', 'AALC930304HYNLRR00', 0, '1993-03-04', 'levi_pitt@hotmail.com', '9993867324', 'CH', 32, 27, 1, 'C. 4-C No 444 X 63 Y 63-A Flor de Mayo Mérida, Yucatán C.P. 97370', '97370', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:35:22', '2024-05-06 08:35:22'),
(219, 8, 22, 7, 601, 'Jorge ', 'Gozalez ', 'Cruzaley ', '2023-12-02', 0, 'Male', '53927524362', 'GOCJ750718U9A', 'GOCJ750718HVZNRR01', 0, '1975-07-18', 'jorgegonzalezcruzaley@gmail.com', '9995853072', 'CH', 34, 26, 1, 'C. 22 No 241 X 63 Y 67 Col. Montes de Ame Mérida, Yucatán C.P. 97115', ' 9711', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:36:30', '2024-06-07 02:51:34'),
(220, 2, 22, 1, 0, 'Angel David', 'Koyoc ', 'Cauich ', '2023-12-06', 0, 'Femen', '10190152735', 'KOCA010307966', 'KOCA010307HYNYCNA3', 0, '2001-03-07', 'angel07cauich03@gmail.com ', '9911113100', 'M', 32, 27, 0, 'C. 5 S/N x 20 y 22 Col. San Francisco, Tixkokob, Yucatán C.P. 97470', '97470', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:40:02', '2024-06-07 02:51:57'),
(221, 2, 22, 1, 602, 'Pedro Feliciano ', 'Gongora ', 'Gongora ', '2023-12-15', 0, 'Male', '39017200781', 'GOGP730629QJ0', 'GOGP730629HYNNND02', 0, '1973-06-29', 'gongora.pedro @gmail.com ', '9997430675', 'G', 34, 27, 1, 'C. 65 No 690 x 90 y 92 Col. Centro, Mérida Yucatán C.P. 97000', '97000', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:41:01', '2024-06-07 02:52:11'),
(222, 2, 22, 1, 107, 'Maria Isabel de los Angeles ', 'Tun ', 'Uc ', '2023-12-20', 0, 'Femen', '82937229092', 'TUUI7205144R4', 'TUUI720514MYNNCS03', 0, '1972-05-14', 'marytun1972@gmail.com ', '9994180386', 'M', 32, 23, 1, 'C. 19 No 75 x 8 y 10 Col. Montereal Baca, Yucatan C.P. 97450', '97450', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:42:01', '2024-06-07 02:52:29'),
(223, 3, 22, 10, 234, 'Jhonathan Erubey ', 'Pech ', 'May ', '2023-12-22', 0, 'Male', '5210075783', 'PEMJ000204TS8', 'PEMJ000204HYNCYHA9', 0, '2000-02-04', 'pechjhonathan234@gmail.com ', '9996178379', 'EG', 40, 29, 0, 'C. 165 No 307 50-C Y 52 Plan de Ayala Sur Mérida, Yucatán C.P. 97285', '97285', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-06 08:43:00', '2024-06-07 02:52:42'),
(224, 3, 22, 14, 540, 'Carlos Enrique', 'Aldana ', 'Coj', '2023-12-26', 1, 'Male', '81956900096', 'AACC690504PD3', 'AACC690504HCCLJR09', 0, '1969-05-04', 'carlos_2017@outlook.es', 'sn', 'M', 32, 26, 1, 'Calle Campeche Mz 66, Lte 5, Colonial Campeche. C.P. 24087', '24087', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 11:45:18', '2024-05-08 11:45:18'),
(225, 2, 22, 1, 603, 'Carlos Waldemar', 'Perez', 'Alamilla', '2023-12-28', 1, 'Male', '27169515106', 'PEAC951121G11', 'PEAC951121HYNRLR04', 0, '1995-11-21', 'perezalamillacarlos68@gmail.com', '9992920212', 'G', 36, 29, 0, 'Calle 24A, No. 25B, Ext. 342, Fraccionamiento Vergel IV, Mérida, Yucatán, C.P. 97173', '97173', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 11:46:20', '2024-05-08 11:46:20'),
(226, 2, 22, 11, 604, 'Yenniffer Estibaliz', 'Gonzalez ', 'Hipolito', '2023-12-29', 0, 'Femen', 'no tiene', 'GOHY761007', 'GOHY761007MYNNPN02', 0, '1976-10-07', 'gonzalezyenniffer904@gmail.com', '5537309552', 'M', 36, 26, 1, 'Calle 22, No. 196A x 19 y 21 Col. Maria Luisa. C.P. 97199', '97199', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 11:47:34', '2024-06-07 02:53:34'),
(227, 2, 22, 1, 404, 'Luis Gustavo ', 'Guzman ', 'Jimenez', '2024-01-03', 1, 'Male', '10160131214', 'GUJL0105064I2', 'GUJL010506HTCZMSA1', 0, '2001-05-06', 'ijimene780@gmail.com', '9992302841', 'M', 32, 28, 1, 'C. S/N 73 X 39 EJ. Adolfo Lopez 86900', '86900', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 11:48:34', '2024-05-08 11:48:34'),
(228, 2, 22, 1, 605, 'Sergio Ricardo ', 'Martinez ', 'Rodriguez', '2024-01-09', 1, 'Male', '96088618986', 'MARS8604036A1', 'MARS860403HMCRDR02', 0, '1986-04-03', 'sergio141586@gmail.com', '5623260758', 'CH', 32, 27, 1, 'Calle 94A x 79C y 79B Col. Sambula, Mérida, Yucatán C.P. 97250', '97250', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 11:49:40', '2024-05-08 11:49:40'),
(229, 2, 22, 1, 606, 'Blanca Azucena ', 'Jimenez ', 'Lopez ', '2024-01-11', 1, 'Femen', '86200566916', 'JILB050505FA9', 'JILB050505MCCMPLA7', 0, '2005-05-05', 'jimenezlopezblanca436@gmail.com ', '9821036272', 'M', 28, 24, 0, 'Calle 32 No 658 x 75A Y 75B Col. Tixcacal Opichen Mérida, Yucatán ', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 11:50:38', '2024-05-08 11:50:38'),
(230, 2, 22, 1, 607, 'Sergio ', 'Tadeo ', 'Hernandez ', '2024-01-17', 0, 'Male', '82109118115', 'TAHS910803QN2', 'TAHS910803HVZDRR02', 0, '1991-08-03', 'figo__789@hotmail.com ', '9994137362', 'M', 32, 28, 1, 'Calle 29A S/N 60 Y 62 Col. Ismael Garcia Progreso, Yucatán ', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 11:51:42', '2024-06-07 02:55:41'),
(231, 2, 22, 1, 608, 'Fernando Jesus ', 'Martinez ', 'Duperon ', '2024-01-23', 1, 'Male', '84028328288', 'MADF831214R56', 'MADF831214HYNRPR03', 0, '1983-12-14', 'jmdfernando 375@gmail.com ', '9992311312', 'CH', 34, 27, 1, 'Calle 39B No 50C X 18 Col. Privada La Joya, Kanasin C.P. 97370', '97370', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 11:54:11', '2024-05-08 11:54:11'),
(232, 3, 22, 14, 569, 'Selina Mercedes', 'Perez ', 'Reyes ', '2024-01-26', 1, 'Femen', '319952351', 'PERS951115QGA', 'PERS951115MCCRYL07', 0, '1995-11-15', 'pselinamercedes@gmail.com ', '981 2282413', 'G', 32, 23, 1, 'C. 21 No 208 x 38 D y 40 Fracc. Santa Cecilia C.P. 97370', '97370', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 11:55:07', '2024-05-08 11:55:07'),
(233, 2, 22, 1, 609, 'Roque Salvador ', 'Pellegrini ', 'Perez ', '2024-01-29', 1, 'Male', '84947608695', 'PEPR7612166A7', 'PEPR761216HYNLRQ07', 0, '1976-12-16', 'roquesalvadorpellegriniperez@gmail.com ', '9995449808', 'M', 34, 26, 1, 'Calle 109A No 574 x 66 y 64L Col. Meliton Salazar C.P. 97269', '97269', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 11:56:43', '2024-05-08 11:56:43'),
(234, 9, 23, 1, 610, 'Jesica Anahi ', 'Chan ', 'Cante ', '2024-01-30', 1, 'Femen', '20169852819', 'CACJ980508C65', 'CACJ980508MYNHNS07', 0, '1998-05-08', 'jesicante08@gmail.com', '9992690606', 'M', 34, 24, 0, 'Calle 20 S/N X 23 Y 25 Col. San Jose Tzal, Mérida, Yucatán C.P. 97315', '97315', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 11:57:44', '2024-05-08 11:57:44'),
(235, 2, 22, 1, 611, 'Armando Cristobal ', 'Catzin ', 'Pech ', '2024-01-30', 0, 'Male', '84058616354', 'CAPA860827H72', 'CAPA860827HYNTCR06', 0, '1986-08-27', 'no tiene', '9994576541', 'M', 30, 27, 1, 'Calle 18 S/N X 23 Timucuy C.P. 97377', '97377', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 11:58:59', '2024-06-07 02:54:28'),
(236, 3, 22, 1, 550, 'Jahzeel Hefer', 'Ramirez ', 'Hernandez ', '2024-01-31', 1, 'Male', '2200105498', 'RAHJ010906U48', 'RAHJ010906HYNMRHA1', 0, '2001-09-06', 'jahzeelramirez685@gmail.com', '986 1003139', 'CH', 32, 27, 1, 'C. Domicilio conocido Xcucul Sur, cerca de Úman C.P. 97394', ' 9739', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:00:15', '2024-05-08 12:00:15'),
(237, 3, 22, 1, 450, 'Jesus Adrian', 'Can', 'Dzib', '2024-02-07', 1, 'Male', '44200219101', 'CADJ020507PY5', 'CADJ020507HYNNZSA2', 0, '2002-05-07', 'jesusadriancandzib@gmail.com', 'sn', 'M', 30, 30, 0, 'Calle 109 No. 288 por 40 y 42, Col. Canto, Mérida, Yucatán. C.P. 97189', '97189', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:01:26', '2024-05-08 12:01:26'),
(238, 2, 22, 1, 607, 'Sergio ', 'Tadeo ', 'Hernandez ', '2024-02-14', 1, 'Male', '82109118115', 'TAHS910803QN2', 'TAHS910803HVZDRR02', 0, '1991-08-03', 'figo__789@hotmail.com ', '9994137362', 'CH', 32, 28, 1, 'Calle 29A S/N 60 Y 62 Col. Ismael Garcia Progreso, Yucatán ', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:02:53', '2024-05-08 12:02:53'),
(239, 3, 22, 1, 480, 'Nestor  Fabian', 'Hernandez', 'Martinez', '2023-02-14', 1, 'Male', '9169413946', 'HEMN940911NX3', 'HEMN940911HCSRRS00', 0, '1994-09-11', 'fabian.ya72210216@hotmail.com', '999 1218225', 'EG', 38, 28, 0, 'Calle 41B No 423 x 14 Y 20 Col. Industrial Mérida, Yucatán', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:04:05', '2024-05-08 12:04:05'),
(240, 2, 22, 1, 612, 'Marcos Manuel ', 'Quintal ', 'Aguilar ', '2024-02-14', 0, 'Male', '27190051642', 'QUAM001118MT3', 'QUAM001118HYNNGRA0', 0, '2000-11-18', 'quintalmarcosmanuel@gmail.com', '9996697508', 'EG', 42, 29, 0, 'Calle 100 No 661 por 183 y 185 Colonia San Marcos Sustentable C.P. 97296', '97296', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:05:20', '2024-06-07 02:56:17'),
(241, 2, 22, 10, 572, 'Jose Armando', 'Gomez ', 'Nuñez ', '2024-02-19', 1, 'Male', '3200201584', 'GONA0206094V9', 'GONA020609HCSMXRA2', 0, '2002-06-09', 'josearmandogomeznunez594@gmail.com', '999 1777212', 'M', 32, 26, 0, 'C. 22 y 27 S/N Chablekal C.P. 97302', '97302', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:06:20', '2024-05-08 12:06:20'),
(242, 3, 22, 10, 613, 'Maria del Socorro ', 'Estrada', 'Kú ', '2024-02-22', 1, 'Femen', '84028214199', 'EAKS820731678', 'EAKS820731MYNSXC03', 0, '1982-07-31', 'estradamaricruz.3107@gmail.com ', '9995039167', 'M', 32, 23, 1, 'Calle 31b No 352 por 20 y 22 col. Lopez Mateo Mérida, Yucatán C.P. 97159', '97159', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:07:23', '2024-05-08 12:07:23'),
(243, 3, 22, 10, 614, 'Maria Jesus', 'Ek ', 'Canche ', '2024-02-22', 1, 'Femen', '84088919141', 'ECJE890311D22', 'EXCJ890311MYNKNS04', 0, '1989-03-11', 'mariajesusekcanche089@gmail.com ', '9995918147', 'CH', 28, 23, 1, 'Calle 104 No 644 Edificio 4 Departamiento 6 San Marcos Sustentable ', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:08:20', '2024-05-08 12:08:20'),
(244, 8, 22, 10, 615, 'José Isidro ', 'Angulo ', 'Uc ', '2024-02-26', 0, 'Male', '84877015846', 'AUUI700510C41', 'AUUI700510HYNNCS05', 0, '1970-05-10', 'mmtauroang70@gmail.com ', '9993239983', 'M', 34, 27, 1, 'Calle 14-A No 89-D POR 19 Y 12 Col. La Mejorada Uman, Yucatán C.P. 97390', '97390', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:09:32', '2024-06-07 02:58:54'),
(245, 3, 22, 1, 618, 'Eustaquio ', 'Ku ', 'Narvaez ', '2024-02-27', 0, 'Male', '84826310876', 'KUNE630413PJ5', 'KUNE630413HYNXRS03', 0, '1963-04-13', 'kunarvaeze766qgmail.com', '9997395729', 'M', 34, 25, 1, 'Calle 47 x 50 y 52 Fracc. Piedra de Agua, Uman Yucatán C.P. 97392', '97392', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:10:50', '2024-06-07 02:57:04'),
(246, 2, 22, 10, 616, 'Blanca Soany ', 'Morales ', 'Mendez ', '2024-02-29', 0, 'Femen', 'sn', 'sn', 'MOMB031130MTCRNLA7', 0, '2003-11-30', 'moralesmendezblancasoany@gmail.com ', '9341172974', 'M', 36, 25, 1, 'Calle 21 Número 11 por 38 y 40 Col. Pacabtún Mérida, Yucatán C.P. 97159', '97159', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:12:22', '2024-06-07 02:57:21'),
(247, 2, 22, 10, 617, 'Juan Manuel ', 'Aguilar ', 'Sanchez ', '2024-02-29', 0, 'Male', '19230360554', 'sn', 'AUSJ030816HTCGNNA4', 0, '2003-08-16', 'Ja2816931@gmail.com', '9996440924', 'M', 30, 27, 1, 'Calle 21 Número 11 por 38 y 40 Col. Pacabtún Mérida, Yucatán C.P. 97159', '97159', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:13:44', '2024-06-07 02:57:35'),
(248, 3, 22, 14, 131, 'Jesus Antonio ', 'Torres ', 'Martinez ', '2024-03-04', 1, 'Male', '74159733802', 'TOMJ971028LC2', 'TOMJ971028HYNRRS09', 0, '1997-10-28', 'jesus1997tm26@gmail.com', '9997487009', 'M', 34, 28, 1, 'Calle 34C No 386 por 41 y 43 Col. Emiliano Zapata Oriente Mérida, Yucatán C.P. 97144', '97144', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:14:46', '2024-05-08 12:14:46'),
(249, 3, 22, 14, 534, 'Nicolas Martin', 'Azcorra ', 'Ruelas ', '2024-03-04', 1, 'Male', '18159810458', 'AORN9801305T1', 'AORN980130HYNZLC02', 0, '1998-01-30', 'nicolasazcorra91@gmail.com ', '9997377151', 'G', 36, 28, 0, 'Calle 70 por 147 y 149 S/N Col. San Jose Tecoh ll Mérida, Yucatán C.P. 97299', '97299', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:16:10', '2024-05-08 12:16:10'),
(250, 2, 22, 1, 619, 'Luis Armando ', 'Uc ', 'Puc ', '2024-03-06', 1, 'Male', '19189937154', 'UPLU990819QR4', 'UXPL990819HYNCCS07', 0, '1999-08-19', 'auc52873@gmail.com ', '9991612977', 'M', 30, 27, 0, 'Calle 24 No 94 por 17 y 15 Chablekal C.P. 97345', ' 9734', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:17:56', '2024-05-08 12:17:56'),
(251, 10, 22, 1, 620, 'Pedro Luis ', 'Rousell ', 'Cano ', '2024-03-05', 1, 'Male', '2158980439', 'ROCP890815585', 'ROCP890815HTCSND11', 0, '1989-08-15', 'no tiene', 'sn', 'M', 40, 27, 0, 'Calle Dionisio zurita Belches 5 INT Col. Pueblo Nuevo Tacotalpa, Tabasco.', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:19:05', '2024-05-08 12:19:05'),
(252, 3, 22, 10, 621, 'Maria Tatiana ', 'Chi ', 'Cox ', '2024-03-11', 1, 'Femen', '2249230513', 'CICT920112NXA', 'CICT920112MYNHXT05', 0, '1991-01-12', 'chim85935@gmail.com ', '9881057710', 'G', 34, 25, 1, 'Calle 79 No 548E Por 78 Y 80 Centro Mérida, Yucatán, C.P. 97000', '97000', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:20:09', '2024-05-08 12:20:09'),
(253, 2, 22, 1, 622, 'Juan Diego ', 'Pech ', 'Pech ', '2024-03-15', 1, 'Male', '17189302270', 'PEPJ930829G54', 'PEPJ930829HYNCCN03', 0, '1993-08-29', 'juandiegopech2908@gmail.com ', '9994645768', 'CH', 30, 27, 1, 'Calle 33 y No 101 entre 32 Kini, Motul, Yucatán C.P. 97437', '97437', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:21:09', '2024-05-08 12:21:09'),
(254, 4, 22, 12, 623, 'Juan ', 'Sanchez ', 'Morales ', '2024-03-16', 1, 'Male', '2217824404', 'SAMJ780711QK4', 'SAMJ780711HDFNRN00', 0, '1978-07-11', 'elipsrev@hotmail.com ', '9984895385', 'CH', 0, 0, 0, 'Calle 9 No 827 M1381 Gran Santa Fe Caucel, Yucatán ', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:23:30', '2024-05-08 12:23:30'),
(255, 4, 22, 2, 624, 'Aurelio', 'Cortes ', 'Gutierrez', '2024-03-16', 1, 'Male', '02967243391', 'COGA720924AH2', 'COGA720924HPLRTR06', 0, '1972-09-24', 'aureliocortez20@gmail.com', '998 153 7384', 'G', 38, 27, 0, 'SM 251 M 87 L 6 Av. Galaxias del Sol Edificio Q No. Int 301 Fracc. Paseos del Mar C.P. 77519 ', '77519', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:24:44', '2024-05-08 12:24:44'),
(256, 4, 22, 12, 625, 'Jorge', 'Garcia ', 'Guzman ', '2024-03-16', 1, 'Male', '65856716264', 'GAGJ6708149X0', 'GAGJ670814HVZRZR08', 0, '1967-08-14', 'jorgekalimangarcia@gmail.com', '999 272 0060', 'CH', 0, 0, 0, 'Calle 115 Sian Kaan II, Mérida Yucatán', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:25:53', '2024-05-08 12:25:53'),
(257, 4, 22, 1, 626, 'Emilio ', 'Lopez ', 'Lazaro ', '2024-03-16', 1, 'Male', '82097903692', 'LOLE791025NV5', 'LOLE791025HTCPZM01', 0, '1979-10-25', 'e16020817@gmail.com', '9983562306', 'M', 34, 26, 1, 'Calle SM 260 MZ26 LT3 01 Q 06 calle machiche prado norte, CancunC.P. 77500', '77500', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:27:11', '2024-05-08 12:27:11'),
(258, 4, 22, 12, 627, 'Constantino', 'Ojeda', 'Cruz ', '2024-03-19', 0, 'Male', '84018338511', 'OECC831204TD9', 'OECC831204HQRJRN00', 0, '1983-12-04', 'ojedacruz.coc@gmail.com', '984 167 4856', 'G', 36, 28, 0, 'Av. del Agua 1505 Fracc. Jardines del Bosque 32537, Juarez, Chih.', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:28:40', '2024-06-07 02:58:00'),
(259, 4, 22, 10, 628, 'Jorge ', 'Zurita ', 'Felix ', '2024-03-16', 0, 'Male', '83957510874', 'ZUFJ751120SB0', 'ZUFJ751120HVZRLR00', 0, '1975-11-20', 'no tiene', '9983539864', 'M', 36, 27, 0, 'SM 259 M 18 L1 Calle Palma Roebellini Fracc. Paseo de las Palmas C.P. 77518 Cancún ', '77518', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:29:55', '2024-06-07 02:58:17'),
(260, 4, 22, 2, 629, 'Angel Darvin', 'Canul ', 'Lopez', '2024-03-16', 1, 'Male', '82099203323', 'CALA920613UJ3', 'CALA920613HQRNPN02', 0, '1992-06-13', 'angelcanul920613@gmail.com', '998 733 0690', '3EG', 36, 27, 0, 'Calle Trinidad y Tobago 369 Fracc. Caribe 77086 Othon P. Blanco, Q. Roo', '77086', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:31:18', '2024-05-08 12:31:18'),
(261, 4, 22, 10, 630, 'Luis Eduardo', 'Perez', 'Ovando ', '2024-03-16', 1, 'Male', '71139429683', 'PEOL940104FM6', 'PEOL940104HCSRVS05', 0, '1994-01-04', 'luis_38k@hotmail.com', '998 315 9385', 'G', 34, 29, 1, 'SM 249 MZ 136 LT 1 6 E9 D70 AV ITZA REAL VAELENCIA F C.P. 77500 Cancun. Qroo.', '77500', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:32:32', '2024-05-08 12:32:32'),
(262, 4, 22, 2, 631, 'Raul Felipe ', 'Bautista ', 'Santos ', '2024-03-16', 1, 'Male', '81836703124', 'BASR6705261N4', 'BASR670526HCCTNL07', 0, '1967-05-26', 'rb703074@gmail.com', '998 354 9678', 'G', 38, 27, 0, 'Calle Av Santa Cecilia L 37 77500 Benito Juarez, Q,Roo', '77500', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:33:48', '2024-05-08 12:33:48'),
(263, 4, 22, 1, 632, 'Leonel ', 'Ferrer ', 'Garcia ', '2024-03-16', 1, 'Male', '3178068007', 'FEGL800824', 'FEGL800824HTCRRN06', 0, '1980-08-24', 'ferrergarcialeonel@gmail.com', '998 396 2181', 'G', 38, 28, 1, 'Calle Isla Dodecaneso Edificio J1 Fracc Paseos del Mar, Cancún, C.P. 77517', '77517', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-08 12:34:47', '2024-05-08 12:34:47'),
(264, 4, 22, 1, 633, 'Ernesto', 'De Dios', 'Dominguez ', '2024-03-16', 0, 'Male', '83907001768', 'DIDE701028BLX', 'DIDE701028HTCSMR05', 0, '1970-10-28', 'no tiene', '998 402 7998', 'G', 34, 25, 0, ' no tiene', 'sn', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-21 01:27:56', '2024-06-07 02:58:34'),
(265, 2, 23, 3, 634, 'Maria Jose ', 'Otoloza ', 'Pech ', '2024-03-19', 1, 'Femen', '4199465255', 'OOPJ940329BF1', 'OOPJ940329MYNTCS08', 0, '1994-03-29', 'majo_291410@hotmail.es', '9995031030', 'CH', 32, 26, 1, 'Calle 90 No 164 por 35 y 37 Col. Centro Progreso, Yucatán C.P. 97320', '97320', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-21 01:29:00', '2024-05-21 01:29:00'),
(266, 2, 22, 1, 635, 'Andrea Guadalupe ', 'Hau ', 'Dzib ', '2024-03-19', 1, 'Femen', '60160015511', 'HADA001123HH0', 'HADA001123MYNXZNA4', 0, '2000-11-23', 'andreadzib04@gmail.com ', '9992615327', 'G', 36, 25, 1, 'Calle 24 s/n por 17 y 19 Bokoba, Yucatán C.P. 97466', '97466', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-21 01:30:11', '2024-05-21 01:30:11'),
(267, 8, 22, 10, 615, 'José Isidro ', 'Angulo ', 'Uc ', '2024-03-21', 1, 'Male', '84877015846', 'AUUI700510C41', 'AUUI700510HYNNCS05', 0, '1970-05-10', 'mmtauroang70@gmail.com ', '9993239983', 'M', 34, 27, 1, 'Calle 14-A No 89-D POR 19 Y 12 Col. La Mejorada Uman, Yucatán C.P. 97390', '97390', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-21 01:31:18', '2024-05-21 01:31:18'),
(268, 8, 22, 14, 74, 'Gregorio Rodrigo', 'Noh', 'Rosales', '2024-03-25', 1, 'Male', '84967730569', 'NORG770312SA7', 'NORG770312HYNHSR09', 1, '1977-03-12', 'roderick77gisi@gmail.com', '999 3299083', 'M', 32, 27, 1, 'Calle 24 por 17 y 19, Hoctun, Yucatán. C.P. 97480', '97480', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-21 01:34:13', '2024-05-21 01:34:13'),
(269, 2, 22, 14, 517, 'Martha Leticia', 'Espinosa ', 'Pech ', '2024-03-26', 1, 'Femen', '3168637001', 'EIPM860106CE4', 'EIPM860106MYNSCR05', 0, '1986-01-06', 'malignadehernandez@gmail.com', '999 5699028', 'M', 28, 23, 1, 'C. 13A No 77 x 6 Tulipanes, Kanasin C.P. 97000', '97000', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-21 01:35:12', '2024-05-21 01:35:12'),
(270, 2, 22, 14, 521, 'Moises Guadalupe', 'Colli ', 'Rubio ', '2024-03-29', 1, 'Male', '1823045111', 'CORM041230LD5', 'CORM041230HYNLBSA0', 0, '2004-12-30', 'ositopolarsitos12@gmail.com ', '9993880324', 'M', 29, 26, 0, 'C. 113 No 377A x 64L Y 66 Col. Castilla Camara C.P. 97278', '97278', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-21 01:36:47', '2024-05-21 01:36:47'),
(271, 4, 22, 10, 636, 'Adin', 'Hernandez', 'Bautista', '2024-03-31', 1, 'Male', '82058018241', 'HEBA800914ML4', 'HEBA800914HCSRTD00', 0, '0000-00-00', 'no tiene', '998 763 8503', 'M', 36, 28, 0, 'SM 520 MZ 17 LT2 CASA 1068 LIBELULA BARRONES REG 520 VILLAS DL CARIBE  C.P. 77536', '77536', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-21 01:40:24', '2024-05-21 01:40:24'),
(272, 2, 22, 10, 637, 'Julisa Guadalupe ', 'Molina ', 'Castillo ', '2024-04-01', 1, 'Femen', '84927510085', 'MOCJ741226ID8', 'MOCJ741226MYNLSL01', 0, '1974-12-26', 'julissagmcmolina74@gmail.com ', '9993741683', 'G', 42, 26, 1, 'C. 47 No 278 6 sur y 8 sur Col. Salvador Alvarado Sur Mérida, Yucatán C.P. 97196', '97196', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-21 01:41:27', '2024-05-21 01:41:27');
INSERT INTO `employees` (`id`, `id_department`, `id_job`, `id_recruitment_method`, `code`, `name`, `sure_name`, `last_name`, `entry_date`, `status`, `gender`, `nss`, `rfc`, `curp`, `ssp`, `natal_date`, `email`, `phone`, `shirt_size`, `pants_size`, `shoe_size`, `has_children`, `address`, `cp`, `comments`, `has_birth_certificate`, `has_identification`, `has_curp`, `has_nss`, `has_address_certification`, `has_studies_certification`, `has_tax_certificate`, `has_smn`, `has_no_criminal_certificate`, `has_health_certificate`, `has_sv`, `createdAt`, `updatedAt`) VALUES
(273, 2, 22, 9, 638, 'Armando Alejandro ', 'Koh ', 'Uc ', '2024-04-01', 1, 'Male', '38159582303', 'KOUA950527416', 'KOUA950527HYNHCR04', 0, '1995-04-27', 'alejandrokoh950527@gmail.com ', '9993662691', 'CH', 34, 26, 1, 'C. 21 No 96 X 18 y 20 Col. Centro Maxcanú Yucatan C.P. 97800', '97800', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-21 01:42:42', '2024-05-21 01:42:42'),
(274, 6, 22, 10, 639, 'Alex Renan ', 'Esquivel ', 'Rosado ', '2024-04-08', 1, 'Male', '45048218379', 'EURA821025J35', 'EURA821025HDFSSL07', 0, '1982-10-25', 'alex25@gmail.com ', '9993335482', 'G', 38, 28, 1, 'C. 181C x 180 Departamiento 402 Col. Cielo Alto Kanasin, Yucatan C.P. 93790', ' 9379', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-21 01:43:59', '2024-05-21 01:48:05'),
(275, 6, 22, 10, 12, 'Alfredo Jesus ', 'Brito ', 'Manzano ', '2024-04-08', 1, 'Male', '67866420269', 'BIMA641013C19', 'BIMA641013HYNRNL05', 0, '1964-10-13', 'alfrebriman@gmail.com ', '9999035937', 'M', 34, 27, 0, 'C. 73 No 424 x 30B y 32 Col. Vicente Solis C.P. 97180', '97180', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-21 01:49:20', '2024-05-21 01:49:20'),
(276, 2, 22, 5, 640, 'Mildred del Rosario ', 'May ', 'May ', '2024-04-11', 1, 'Femen', '84018418792', 'MAMM840722CA1', 'MAMM840722MYNYYL06', 0, '1984-07-22', 'mmildreddelrosario@gmail.com ', '9971023700', 'G', 46, 26, 1, 'Calle 13 No 125A Cruzamientos 28 y 30 Col. Lazaro Cardenas Maxcanú, Yucatán C.P. 97800', '97800', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-21 01:51:56', '2024-05-21 01:51:56'),
(277, 4, 22, 15, 641, 'Gustavo Alejandro ', 'Merlin ', 'Herrera ', '2024-04-11', 1, 'Male', '46170274677', 'MEHG021021MS6', 'MEHG021021HDFRRSA1', 0, '2002-10-21', 'no tiene', '9983088083', 'CH', 0, 0, 0, 'MS 094 M 106 L3 Calle 113 Zona Urbana Cancún C.P 77520', '77520', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-21 01:52:55', '2024-05-21 01:52:55'),
(278, 2, 22, 5, 642, 'Abraham de Jesus ', 'May ', 'Huh', '2024-04-15', 1, 'Male', '17220395358', 'MAHA031220TJ6', 'MAHA0031220HQRYHBA', 0, '2003-12-20', 'no tiene', '5652967666', 'CH', 32, 26, 1, 'Calle 27 No 92 entre 18 y 20 Col. Saragoza, Maxcanú, Yucatán C.P. 97800', '97800', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-21 02:00:38', '2024-05-21 02:00:38'),
(279, 2, 22, 10, 643, 'Manuel Jesus ', 'Calderon ', 'Can ', '2024-04-16', 1, 'Male', '9516984670', 'CACM9805096B1', 'CACM980509HYNLNN01', 0, '1998-05-09', 'manueljesuscalderon361@gmail.com ', '9997827772', 'G', 36, 28, 1, 'Calle 20 No 67 por 13 Col. San Roman Maxcanu, Yucatán C.P. 97800', '97800', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-21 02:01:32', '2024-05-21 02:01:32'),
(280, 2, 22, 10, 644, 'Marvin Orlando ', 'Vadillo ', 'Salazar ', '2024-04-17', 1, 'Male', 'no tiene', 'VASM060408SN8', 'VASM060408HYNDLRA4', 0, '2006-04-08', 'marvinvadillo68@gmail.com ', '9994928400', 'CH', 29, 27, 0, 'Calle 95 No interior 523A x 64A y 64B Col. Centro C.P. 97000', '97000', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-21 02:02:33', '2024-05-21 02:02:33'),
(281, 3, 22, 1, 645, 'Gustavo Emiliano ', 'Villalobos ', 'Perez ', '2024-04-18', 1, 'Male', '02189604552', 'VIPG961115RM2', 'VIPG961115HYNLRS07', 0, '1996-11-15', 'no tiene', '9999082424', 'G', 38, 8, 0, 'Calle 28 A No 346 x 19 y 21 Col. San Francisco Chuburna C.P. 97300', '97300', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-21 02:03:39', '2024-05-21 02:03:39'),
(282, 4, 22, 15, 646, 'Alberto ', 'Reyes ', 'Tapia ', '2024-04-18', 1, 'Male', '82069027850', 'RETA9004196V9', 'RETA900419HVZYPL09', 0, '1990-04-19', 'albertoreyespuma@gmail.com', '9988979211', 'CH', 0, 0, 1, 'SM 249 MZ555 LT3 ED D202 Col, Cielo Nuevo Cancún, QROO C.P. 77518', '77518', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-05-21 02:04:36', '2024-05-21 02:04:36');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `employee_diseases`
--

INSERT INTO `employee_diseases` (`id`, `id_employee`, `id_disease`, `createdAt`, `updatedAt`) VALUES
(3, 4, 4, '2024-05-22 00:41:51', '2024-05-22 00:41:51'),
(4, 9, 3, '2024-05-22 00:44:41', '2024-05-22 00:44:41'),
(5, 11, 3, '2024-05-22 00:44:55', '2024-05-22 00:44:55'),
(6, 11, 4, '2024-05-22 00:45:14', '2024-05-22 00:45:14'),
(7, 13, 4, '2024-05-22 00:45:28', '2024-05-22 00:45:28'),
(8, 18, 2, '2024-05-22 00:45:45', '2024-05-22 00:45:45'),
(9, 29, 8, '2024-05-22 00:46:09', '2024-05-22 00:46:09'),
(10, 33, 8, '2024-05-22 00:46:42', '2024-05-22 00:46:42'),
(11, 33, 4, '2024-05-22 00:46:54', '2024-05-22 00:46:54'),
(12, 38, 5, '2024-05-22 00:47:19', '2024-05-22 00:47:19'),
(13, 49, 10, '2024-05-22 00:47:35', '2024-05-22 00:47:35'),
(14, 74, 11, '2024-05-22 00:47:48', '2024-05-22 00:47:48'),
(15, 111, 6, '2024-05-22 00:48:00', '2024-05-22 00:48:00'),
(16, 279, 4, '2024-05-22 00:48:30', '2024-05-22 00:48:30'),
(17, 135, 8, '2024-05-22 00:48:45', '2024-05-22 00:48:45'),
(18, 145, 8, '2024-05-22 00:48:55', '2024-05-22 00:48:55'),
(19, 162, 8, '2024-05-22 00:49:06', '2024-05-22 00:49:06'),
(20, 162, 4, '2024-05-22 00:49:13', '2024-05-22 00:49:13'),
(21, 165, 4, '2024-05-22 00:49:40', '2024-05-22 00:49:40'),
(22, 1, 1, '2024-05-22 00:50:26', '2024-05-22 00:50:26');

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
  `updatedAt` timestamp NULL DEFAULT NULL,
  `id_type_leave` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `employee_leaves`
--

INSERT INTO `employee_leaves` (`id`, `id_employee`, `leave_date`, `description`, `createdAt`, `updatedAt`, `id_type_leave`) VALUES
(1, 19, '2024-04-15', 'Separación voluntaria', '2024-06-07 01:32:15', '2024-06-07 01:32:15', 1),
(2, 25, '2023-08-21', 'Separación voluntaria\n', '2024-06-07 01:32:37', '2024-06-07 01:32:37', 1),
(3, 28, '2024-01-19', 'Sin motivo\n', '2024-06-07 01:32:58', '2024-06-07 01:32:58', 3),
(4, 48, '2024-02-07', 'Sin motivo\n', '2024-06-07 01:33:16', '2024-06-07 01:33:16', 3),
(5, 61, '2024-02-13', 'Sin motivo\n', '2024-06-07 01:33:38', '2024-06-07 01:33:38', 3),
(6, 62, '2022-01-14', 'Ausentismo\n', '2024-06-07 01:33:59', '2024-06-07 01:33:59', 2),
(7, 64, '2023-08-07', 'Ausentismo\n', '2024-06-07 01:34:17', '2024-06-07 01:34:17', 2),
(8, 65, '2024-03-15', 'Sin motivo\n', '2024-06-07 01:34:34', '2024-06-07 01:34:34', 3),
(9, 74, '2023-09-18', 'Ausentismo\n', '2024-06-07 01:34:53', '2024-06-07 01:34:53', 2),
(10, 81, '2024-02-26', 'Sin motivo\n', '2024-06-07 01:35:10', '2024-06-07 01:35:10', 3),
(11, 82, '2023-08-20', 'Separación voluntaria\n', '2024-06-07 01:35:27', '2024-06-07 01:35:27', 1),
(12, 85, '2023-08-20', 'Separación voluntaria\n', '2024-06-07 01:35:45', '2024-06-07 01:35:45', 1),
(13, 86, '2023-09-28', 'Separación voluntaria\n', '2024-06-07 01:36:00', '2024-06-07 01:36:00', 1),
(14, 90, '2023-06-05', 'Separación voluntaria\n', '2024-06-07 01:36:19', '2024-06-07 01:36:19', 1),
(15, 92, '2024-03-28', 'Sin motivo\n', '2024-06-07 01:36:38', '2024-06-07 01:36:38', 3),
(16, 93, '2024-01-12', 'Sin motivo\n', '2024-06-07 01:36:52', '2024-06-07 01:36:52', 3),
(17, 98, '2023-08-16', 'Separación voluntaria\n', '2024-06-07 01:37:10', '2024-06-07 01:37:10', 1),
(18, 99, '2023-05-01', 'Separación voluntaria\n', '2024-06-07 01:37:26', '2024-06-07 01:37:26', 1),
(19, 102, '2024-01-01', 'Separación voluntaria\n', '2024-06-07 01:37:40', '2024-06-07 01:37:40', 1),
(20, 104, '2023-08-16', 'Separación voluntaria\n', '2024-06-07 01:37:55', '2024-06-07 01:37:55', 1),
(21, 110, '2023-09-07', 'Separación voluntaria\n', '2024-06-07 01:38:12', '2024-06-07 01:38:12', 1),
(22, 112, '2023-10-19', 'Separación voluntaria\n', '2024-06-07 01:38:32', '2024-06-07 01:38:32', 1),
(23, 113, '2024-02-19', 'Sin motivo\n', '2024-06-07 01:38:51', '2024-06-07 01:38:51', 3),
(24, 117, '2023-12-30', 'Separación voluntaria\n', '2024-06-07 01:39:05', '2024-06-07 01:39:05', 1),
(25, 122, '2023-12-15', 'Sin motivo\n', '2024-06-07 01:39:43', '2024-06-07 01:39:43', 3),
(26, 123, '2023-09-25', 'Separación voluntaria\n', '2024-06-07 01:40:02', '2024-06-07 01:40:02', 1),
(27, 124, '2023-11-04', 'Sin motivo\n', '2024-06-07 01:40:17', '2024-06-07 01:40:17', 3),
(28, 125, '2023-12-08', 'Separación voluntaria\n', '2024-06-07 01:40:38', '2024-06-07 01:40:38', 1),
(29, 126, '2023-10-23', 'Separación voluntaria\n', '2024-06-07 01:40:58', '2024-06-07 01:40:58', 1),
(30, 127, '2023-03-07', 'Separación voluntaria\n', '2024-06-07 01:41:14', '2024-06-07 01:41:14', 1),
(31, 130, '2024-02-04', 'Sin motivo\n', '2024-06-07 01:41:38', '2024-06-07 01:41:38', 3),
(32, 131, '2023-12-18', 'Ausentismo\n', '2024-06-07 01:41:59', '2024-06-07 01:41:59', 2),
(33, 132, '2023-08-19', 'Ausentismo\n', '2024-06-07 01:42:15', '2024-06-07 01:42:15', 2),
(34, 135, '2023-10-31', 'Separación voluntaria\n', '2024-06-07 01:42:36', '2024-06-07 01:42:36', 1),
(35, 136, '2024-01-26', 'Sin motivo\n', '2024-06-07 01:42:55', '2024-06-07 01:42:55', 3),
(36, 140, '2024-02-04', 'Sin motivo\n', '2024-06-07 01:43:12', '2024-06-07 01:43:12', 3),
(37, 141, '2024-02-19', 'Sin motivo\n', '2024-06-07 01:43:29', '2024-06-07 01:43:29', 3),
(38, 143, '2023-09-18', 'Separación voluntaria\n', '2024-06-07 01:44:01', '2024-06-07 01:44:01', 1),
(39, 144, '2023-01-01', 'Ausentismo\n', '2024-06-07 01:44:21', '2024-06-07 01:44:21', 2),
(40, 145, '2024-01-31', 'Sin motivo\n', '2024-06-07 01:45:03', '2024-06-07 01:45:03', 3),
(41, 146, '2023-08-19', 'Sin motivo\n', '2024-06-07 01:45:18', '2024-06-07 01:45:18', 3),
(42, 147, '2023-09-04', 'Sin motivo\n', '2024-06-07 01:45:34', '2024-06-07 01:45:34', 3),
(43, 148, '2023-08-28', 'Separación voluntaria\n', '2024-06-07 01:45:49', '2024-06-07 01:45:49', 1),
(44, 149, '2023-08-07', 'Separación voluntaria\n', '2024-06-07 01:46:03', '2024-06-07 01:46:03', 1),
(45, 151, '2023-10-03', 'Sin motivo\n', '2024-06-07 01:46:20', '2024-06-07 01:46:20', 3),
(46, 153, '2023-09-04', 'Separación voluntaria\n', '2024-06-07 01:46:36', '2024-06-07 01:46:36', 1),
(47, 155, '2023-12-19', 'Separación voluntaria\n', '2024-06-07 01:46:51', '2024-06-07 01:46:51', 1),
(48, 156, '2023-10-12', 'Ausentismo\n', '2024-06-07 01:47:06', '2024-06-07 01:47:06', 2),
(49, 157, '2024-01-22', 'Separación voluntaria\n', '2024-06-07 01:47:20', '2024-06-07 01:47:20', 1),
(50, 158, '2024-04-08', 'Separación voluntaria\n', '2024-06-07 01:47:35', '2024-06-07 01:47:35', 1),
(51, 159, '2023-08-17', 'Ausentismo\n', '2024-06-07 01:47:54', '2024-06-07 01:47:54', 2),
(52, 160, '2024-04-08', 'Separación voluntaria\n', '2024-06-07 01:48:08', '2024-06-07 01:48:08', 1),
(53, 161, '2024-03-25', 'Sin motivo\n', '2024-06-07 01:48:34', '2024-06-07 01:48:34', 3),
(54, 162, '2023-08-21', 'Ausentismo\n', '2024-06-07 01:48:47', '2024-06-07 01:48:47', 2),
(55, 163, '2023-08-28', 'Sin motivo\n', '2024-06-07 01:49:04', '2024-06-07 01:49:04', 3),
(56, 164, '2023-08-21', 'Sin motivo\n', '2024-06-07 01:49:56', '2024-06-07 01:49:56', 3),
(57, 165, '2023-08-27', 'Sin motivo\n', '2024-06-07 01:50:20', '2024-06-07 01:50:20', 3),
(58, 166, '2024-01-15', 'Sin motivo\n', '2024-06-07 01:50:39', '2024-06-07 01:50:39', 3),
(59, 167, '2023-06-05', 'Sin motivo\n', '2024-06-07 01:50:56', '2024-06-07 01:50:56', 3),
(60, 168, '2023-08-28', 'Sin motivo\n', '2024-06-07 01:51:14', '2024-06-07 01:51:14', 3),
(61, 169, '2023-09-07', 'Sin motivo\n', '2024-06-07 01:51:33', '2024-06-07 01:51:33', 3),
(62, 99, '2024-02-06', 'Sin motivo\n', '2024-06-07 01:51:55', '2024-06-07 01:51:55', 3),
(63, 171, '2023-11-01', 'Sin motivo\n', '2024-06-07 01:52:12', '2024-06-07 01:52:12', 3),
(64, 172, '2024-02-23', 'Sin motivo\n', '2024-06-07 01:52:30', '2024-06-07 01:52:30', 3),
(65, 173, '2023-10-23', 'Sin motivo\n', '2024-06-07 01:52:44', '2024-06-07 01:52:44', 3),
(66, 174, '2023-10-02', 'Sin motivo\n', '2024-06-07 01:52:58', '2024-06-07 01:52:58', 3),
(67, 175, '2023-09-18', 'Sin motivo\n', '2024-06-07 01:53:12', '2024-06-07 01:53:12', 3),
(68, 177, '2023-12-31', 'Sin motivo\n', '2024-06-07 01:53:39', '2024-06-07 01:53:39', 3),
(69, 178, '2024-04-17', 'Sin motivo\n', '2024-06-07 01:54:00', '2024-06-07 01:54:00', 3),
(70, 180, '2023-10-09', 'Sin motivo\n', '2024-06-07 01:54:18', '2024-06-07 01:54:18', 3),
(71, 181, '2023-09-25', 'Sin motivo\n', '2024-06-07 01:54:37', '2024-06-07 01:54:37', 3),
(72, 183, '2024-04-08', 'Sin motivo\n', '2024-06-07 01:54:50', '2024-06-07 01:54:50', 3),
(73, 184, '2023-12-30', 'Sin motivo\n', '2024-06-07 01:55:07', '2024-06-07 01:55:07', 3),
(74, 185, '2023-12-12', 'Sin motivo\n', '2024-06-07 01:55:25', '2024-06-07 01:55:25', 3),
(75, 186, '2023-11-04', 'Sin motivo\n', '2024-06-07 01:55:40', '2024-06-07 01:55:40', 3),
(76, 187, '2023-11-02', 'Sin motivo\n', '2024-06-07 01:56:02', '2024-06-07 01:56:02', 3),
(77, 188, '2024-01-15', 'Sin motivo\n', '2024-06-07 01:56:22', '2024-06-07 01:56:22', 3),
(78, 190, '2023-11-30', 'Sin motivo\n', '2024-06-07 01:56:37', '2024-06-07 01:56:37', 3),
(79, 191, '2024-01-15', 'Sin motivo', '2024-06-07 01:56:52', '2024-06-07 01:56:52', 3),
(80, 193, '2023-12-11', 'Sin motivo\n', '2024-06-07 01:57:06', '2024-06-07 01:57:06', 3),
(81, 193, '2023-12-11', 'Sin motivo\n', '2024-06-07 01:57:30', '2024-06-07 01:57:30', 3),
(82, 195, '2023-12-20', 'Sin motivo\n', '2024-06-07 01:57:50', '2024-06-07 01:57:50', 3),
(83, 196, '2024-04-15', 'Reingreso\n', '2024-06-07 02:47:20', '2024-06-07 02:47:20', 5),
(84, 197, '2024-04-05', 'Sin motivo\n', '2024-06-07 02:47:41', '2024-06-07 02:47:41', 3),
(85, 123, '2024-02-06', 'Separación voluntaria\n', '2024-06-07 02:47:59', '2024-06-07 02:47:59', 1),
(86, 199, '2023-12-26', 'Sin motivo\n', '2024-06-07 02:48:51', '2024-06-07 02:48:51', 3),
(87, 202, '2023-11-30', 'Sin motivo\n', '2024-06-07 02:49:06', '2024-06-07 02:49:06', 3),
(88, 206, '2023-11-23', 'Sin motivo\n', '2024-06-07 02:49:20', '2024-06-07 02:49:20', 3),
(89, 207, '2023-11-25', 'Sin motivo\n', '2024-06-07 02:49:32', '2024-06-07 02:49:32', 3),
(90, 208, '2024-03-25', 'Sin motivo\n', '2024-06-07 02:49:45', '2024-06-07 02:49:45', 3),
(91, 209, '2024-01-01', 'Sin motivo\n', '2024-06-07 02:49:59', '2024-06-07 02:49:59', 3),
(92, 210, '2024-03-11', 'Sin motivo\n', '2024-06-07 02:50:19', '2024-06-07 02:50:19', 3),
(93, 211, '2023-12-04', 'Ausentismo\n', '2024-06-07 02:50:34', '2024-06-07 02:50:34', 2),
(94, 212, '2023-12-04', 'Nuevo ingreso\n', '2024-06-07 02:50:49', '2024-06-07 02:50:49', 6),
(95, 214, '2024-02-04', 'Sin motivo\n', '2024-06-07 02:51:12', '2024-06-07 02:51:12', 3),
(96, 219, '2024-02-04', 'Sin motivo\n', '2024-06-07 02:51:33', '2024-06-07 02:51:33', 3),
(97, 220, '2023-12-06', 'Sin motivo\n', '2024-06-07 02:51:57', '2024-06-07 02:51:57', 3),
(98, 221, '2023-12-25', 'Sin motivo\n', '2024-06-07 02:52:11', '2024-06-07 02:52:11', 3),
(99, 222, '2024-03-18', 'Separación voluntaria\n', '2024-06-07 02:52:29', '2024-06-07 02:52:29', 1),
(100, 223, '2024-02-19', 'Separación voluntaria\n', '2024-06-07 02:52:42', '2024-06-07 02:52:42', 1),
(101, 156, '2024-01-09', 'Ausentismo\n', '2024-06-07 02:52:58', '2024-06-07 02:52:58', 2),
(102, 1, '2024-02-04', 'Sin motivo', '2024-06-07 02:53:17', '2024-06-07 02:53:17', 3),
(103, 226, '2024-04-22', 'Nuevo ingreso\n', '2024-06-07 02:53:34', '2024-06-07 02:53:34', 6),
(104, 230, '2024-01-28', 'Sin motivo\n', '2024-06-07 02:53:58', '2024-06-07 02:53:58', 3),
(105, 185, '2024-02-12', 'Sin motivo\n', '2024-06-07 02:54:14', '2024-06-07 02:54:14', 3),
(106, 235, '2024-02-19', 'Sin motivo\n', '2024-06-07 02:54:28', '2024-06-07 02:54:28', 3),
(107, 230, '2024-04-01', 'Sin motivo\n', '2024-06-07 02:55:41', '2024-06-07 02:55:41', 3),
(108, 123, '2024-04-01', 'Separación voluntaria\n', '2024-06-07 02:55:58', '2024-06-07 02:55:58', 1),
(109, 240, '2024-02-26', 'Sin motivo\n', '2024-06-07 02:56:17', '2024-06-07 02:56:17', 3),
(110, 188, '2024-04-01', 'Sin motivo\n', '2024-06-07 02:56:28', '2024-06-07 02:56:28', 3),
(111, 244, '2024-03-11', 'Sin motivo\n', '2024-06-07 02:56:40', '2024-06-07 02:56:40', 3),
(112, 245, '2024-03-18', 'Sin motivo\n', '2024-06-07 02:57:04', '2024-06-07 02:57:04', 3),
(113, 246, '2024-03-18', 'Sin motivo\n', '2024-06-07 02:57:21', '2024-06-07 02:57:21', 3),
(114, 247, '2024-03-18', 'Sin motivo\n', '2024-06-07 02:57:35', '2024-06-07 02:57:35', 3),
(115, 151, '2024-03-18', 'Sin motivo\n', '2024-06-07 02:57:48', '2024-06-07 02:57:48', 3),
(116, 258, '2024-04-16', 'Sin motivo\n', '2024-06-07 02:58:00', '2024-06-07 02:58:00', 3),
(117, 259, '2024-04-09', 'Sin motivo\n', '2024-06-07 02:58:17', '2024-06-07 02:58:17', 3),
(118, 264, '2024-04-05', 'Separación voluntaria\n', '2024-06-07 02:58:34', '2024-06-07 02:58:34', 1),
(119, 244, '2024-04-07', 'Sin motivo\n', '2024-06-07 02:58:54', '2024-06-07 02:58:54', 3),
(120, 1, '2024-04-15', 'Sin motivo\n', '2024-06-07 02:59:11', '2024-06-07 02:59:11', 3);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `id_notification_type` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notifications`
--

INSERT INTO `notifications` (`id`, `id_notification_type`, `title`, `description`, `date`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Erick Gabriel  Morato  May ', 'Próximo cumpleaños el 24 de julio de 2024  (14 días restantes)', '2024-07-10', '2024-07-10 15:48:43', '2024-07-10 15:48:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notification_types`
--

CREATE TABLE `notification_types` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notification_types`
--

INSERT INTO `notification_types` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Cumpleaños', NULL, NULL),
(2, 'Pago Recomendación', NULL, NULL),
(3, 'Finalización Contrato', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notification_users`
--

CREATE TABLE `notification_users` (
  `id` int(11) NOT NULL,
  `id_notification` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notification_users`
--

INSERT INTO `notification_users` (`id`, `id_notification`, `id_user`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, 1, '2024-07-10 15:48:43', '2024-07-10 15:57:16');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recruitment_methods`
--

CREATE TABLE `recruitment_methods` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `recruitment_methods`
--

INSERT INTO `recruitment_methods` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Facebook', NULL, NULL),
(2, 'Cambio de empresa a XSP', NULL, NULL),
(3, 'Computrabajo', NULL, NULL),
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
(15, 'Ninguno', '2024-04-30 10:40:59', '2024-04-30 10:40:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trainings`
--

CREATE TABLE `trainings` (
  `id` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_absences`
--

CREATE TABLE `type_absences` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Estructura de tabla para la tabla `type_leaves`
--

CREATE TABLE `type_leaves` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `type_leaves`
--

INSERT INTO `type_leaves` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Separación voluntaria', NULL, NULL),
(2, 'Ausentismo', NULL, NULL),
(3, 'Sin motivo', NULL, NULL),
(5, 'Reingreso', '2024-06-07 02:44:08', '2024-06-07 02:44:08'),
(6, 'Nuevo ingreso', '2024-06-07 02:44:12', '2024-06-07 02:44:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uniforms`
--

CREATE TABLE `uniforms` (
  `id` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `delivered_date` date NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  ADD KEY `id_employee` (`id_employee`),
  ADD KEY `id_type_leave` (`id_type_leave`);

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
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_notification_type` (`id_notification_type`);

--
-- Indices de la tabla `notification_types`
--
ALTER TABLE `notification_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notification_users`
--
ALTER TABLE `notification_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_notification` (`id_notification`),
  ADD KEY `id_user` (`id_user`);

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
-- Indices de la tabla `type_leaves`
--
ALTER TABLE `type_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `uniforms`
--
ALTER TABLE `uniforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employee` (`id_employee`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT de la tabla `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=283;

--
-- AUTO_INCREMENT de la tabla `employee_diseases`
--
ALTER TABLE `employee_diseases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `employee_leaves`
--
ALTER TABLE `employee_leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

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
-- AUTO_INCREMENT de la tabla `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `notification_types`
--
ALTER TABLE `notification_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `notification_users`
--
ALTER TABLE `notification_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT de la tabla `type_leaves`
--
ALTER TABLE `type_leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `uniforms`
--
ALTER TABLE `uniforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `employee_leaves_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `employee_leaves_ibfk_2` FOREIGN KEY (`id_type_leave`) REFERENCES `type_leaves` (`id`);

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
-- Filtros para la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`id_notification_type`) REFERENCES `notification_types` (`id`);

--
-- Filtros para la tabla `notification_users`
--
ALTER TABLE `notification_users`
  ADD CONSTRAINT `notification_users_ibfk_1` FOREIGN KEY (`id_notification`) REFERENCES `notifications` (`id`),
  ADD CONSTRAINT `notification_users_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

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
-- Filtros para la tabla `uniforms`
--
ALTER TABLE `uniforms`
  ADD CONSTRAINT `uniforms_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`);

--
-- Filtros para la tabla `vacation_times`
--
ALTER TABLE `vacation_times`
  ADD CONSTRAINT `vacation_times_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
