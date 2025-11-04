-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-11-2025 a las 17:58:59
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `consultorio_c`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base`
--

CREATE TABLE `base` (
  `idb` int(11) NOT NULL,
  `base` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `base`
--

INSERT INTO `base` (`idb`, `base`) VALUES
(1, 'citas_medicas.sql');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

CREATE TABLE `cart` (
  `idv` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `idprcd` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `idcat` int(11) NOT NULL,
  `nomcat` varchar(150) NOT NULL,
  `state` char(1) NOT NULL,
  `fere` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`idcat`, `nomcat`, `state`, `fere`) VALUES
(2, 'Medicamentos para el resfriado', '1', '2025-10-28 22:18:43'),
(3, 'Antiinflamatorios no esteroideos ', '1', '2025-10-28 22:18:15'),
(4, 'Antialérgicos', '1', '2025-10-28 22:17:22'),
(5, 'Broncodilatadores: ', '1', '2025-10-28 22:17:44'),
(6, 'Anticonvulsivos', '1', '2025-10-28 22:19:05'),
(7, 'Analgésicos', '1', '2025-10-28 22:16:50'),
(8, 'Antibióticos', '1', '2025-10-28 22:17:02'),
(9, 'Analgésicos y antiinflamatorios', '1', '2025-10-28 22:20:38'),
(10, 'Anestésicos tópicos', '1', '2025-10-28 22:21:23'),
(11, 'Agentes para el movimiento dental', '1', '2025-10-28 22:21:44'),
(12, 'Otros medicamentos', '1', '2025-10-28 22:25:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consult`
--

CREATE TABLE `consult` (
  `idconslt` int(11) NOT NULL,
  `mtcl` text NOT NULL,
  `idpa` int(11) NOT NULL,
  `nompa` varchar(35) NOT NULL,
  `state` char(1) NOT NULL,
  `fere` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor`
--

CREATE TABLE `doctor` (
  `idodc` int(11) NOT NULL,
  `ceddoc` varchar(15) NOT NULL,
  `nodoc` varchar(35) NOT NULL,
  `apdoc` varchar(35) NOT NULL,
  `nomesp` varchar(100) NOT NULL,
  `direcd` varchar(150) NOT NULL,
  `sexd` varchar(15) NOT NULL,
  `phd` char(13) NOT NULL,
  `nacd` date NOT NULL,
  `corr` varchar(30) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` char(1) NOT NULL,
  `state` char(1) NOT NULL,
  `fere` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `doctor`
--

INSERT INTO `doctor` (`idodc`, `ceddoc`, `nodoc`, `apdoc`, `nomesp`, `direcd`, `sexd`, `phd`, `nacd`, `corr`, `username`, `password`, `rol`, `state`, `fere`) VALUES
(10, '11804546', 'Sandra Melissa', 'Acosta Quiñonez', 'Odontologa', 'CALLE LAS APLOMINAS', 'Femenino', '+52 968129238', '1994-08-12', 'smaq1994@gmail.com', 'Dra. Melissa', '3b593cffbd70aefca6fbdc2b1563bf1e', '3', '1', '2025-10-25 06:03:08'),
(11, '11804546', 'Sandra ', 'Quiñonez', 'Pediatría', '1a  poniente entre 5a y 6a sur #90', 'Femenino', '968 129 2388', '1994-04-12', '', '', '', '', '1', '2025-10-25 00:57:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document`
--

CREATE TABLE `document` (
  `iddoc` int(11) NOT NULL,
  `nomfi` varchar(150) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `idpa` int(11) NOT NULL,
  `nompa` varchar(35) NOT NULL,
  `state` char(1) NOT NULL,
  `fere` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `idpa` int(11) NOT NULL,
  `idodc` int(11) NOT NULL,
  `idlab` int(11) NOT NULL,
  `color` char(14) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `state` char(1) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `chec` char(1) NOT NULL,
  `fere` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genogram`
--

CREATE TABLE `genogram` (
  `idge` int(11) NOT NULL,
  `detage` text NOT NULL,
  `idpa` int(11) NOT NULL,
  `nompa` varchar(35) NOT NULL,
  `state` char(1) NOT NULL,
  `fere` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiom`
--

CREATE TABLE `idiom` (
  `idoma` int(11) NOT NULL,
  `nomidi` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `idiom`
--

INSERT INTO `idiom` (`idoma`, `nomidi`) VALUES
(1, 'Spanish');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratory`
--

CREATE TABLE `laboratory` (
  `idlab` int(11) NOT NULL,
  `nomlab` varchar(150) NOT NULL,
  `state` char(1) NOT NULL,
  `fere` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `laboratory`
--

INSERT INTO `laboratory` (`idlab`, `nomlab`, `state`, `fere`) VALUES
(2, 'Pediatría', '1', '2025-10-25 06:48:26'),
(3, 'Ortodoncia ', '1', '2025-10-25 06:48:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nurse`
--

CREATE TABLE `nurse` (
  `idnur` int(11) NOT NULL,
  `numide` char(14) NOT NULL,
  `nomnur` varchar(35) NOT NULL,
  `apenur` varchar(35) NOT NULL,
  `nacinur` date NOT NULL,
  `sexnur` varchar(15) NOT NULL,
  `state` char(1) NOT NULL,
  `fere` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `idord` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nomcl` varchar(70) NOT NULL,
  `method` varchar(50) NOT NULL,
  `total_products` text NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `placed_on` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `tipc` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patients`
--

CREATE TABLE `patients` (
  `idpa` int(11) NOT NULL,
  `numhs` char(8) NOT NULL,
  `nompa` varchar(30) NOT NULL,
  `apepa` varchar(30) NOT NULL,
  `direc` varchar(150) NOT NULL,
  `sex` varchar(15) NOT NULL,
  `grup` varchar(15) NOT NULL,
  `phon` char(13) NOT NULL,
  `cump` date NOT NULL,
  `corr` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` char(1) NOT NULL,
  `state` char(1) NOT NULL,
  `fere` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `patients`
--

INSERT INTO `patients` (`idpa`, `numhs`, `nompa`, `apepa`, `direc`, `sex`, `grup`, `phon`, `cump`, `corr`, `username`, `password`, `rol`, `state`, `fere`) VALUES
(1, '77458745', 'JAVIER MANUEL', 'SUAREZ BENITES', 'CALLE LAS MALVINAS', 'Masculino', 'A+', '+51 999875411', '1995-08-12', '', '', '', '', '1', '2025-10-21 20:02:26'),
(2, '76433434', 'Manuel Javier', 'Flores Mendoza', 'calle los tulipanes mz d7 lt 86', 'Masculino', 'A+', '+51 999764545', '1992-08-09', '', '', '', '', '1', '2025-10-22 12:11:24'),
(3, '09018', 'Erick de Jesus', 'Santiago Santos', 'calle Comitán n250 entre 3a y 4a sur oriente', 'Masculino', 'O-', '968 106 21 32', '2003-04-12', 'pogbitasantiago@gmail.com', 'Ericksito', '0a05f1fb9fa99899f7243256e157a8eb', '2', '1', '2025-10-22 23:22:03'),
(4, 'pediente', 'Yurem', 'Vazquez', 'pendiente', 'Masculino', 'A+', 'pendiente2345', '2025-10-24', '', '', '', '', '1', '2025-10-24 16:56:52'),
(5, 'pendient', 'Fanny Meyli', 'Velázquez Natarén', 'pendiente', 'Femenino', 'A+', 'pendiente', '2025-10-24', '', '', '', '', '1', '2025-10-24 16:58:06'),
(6, '3456', 'Brandon', 'Soto', '45776', 'Masculino', 'A+', '5568596705005', '2025-10-25', '', '', '', '', '1', '2025-10-24 17:00:04'),
(7, '86765845', 'Alma Rosa', 'Lopez Montesinos', 'g4574747575757574574574574g', 'Femenino', 'O-', '4547486796807', '2025-10-09', '', '', '', '', '1', '2025-10-24 17:01:13'),
(8, '48594545', 'Alison', 'Valencia Lopez', 'htyuy678567t4rfes', 'Femenino', 'O-', 'hjk8798957465', '2025-10-07', '', '', '', '', '1', '2025-10-24 17:02:51'),
(9, '57458649', 'Ashley', 'Hernandez Moreno', 'dfg57567', 'Femenino', 'O-', '56468796543', '2025-10-20', '', '', '', '', '1', '2025-10-24 17:03:52'),
(10, '09876234', 'Monserrat', 'Montesinos Lopez', 'iyutytr4356', 'Femenino', 'O-', '9787656542243', '2025-10-25', '', '', '', '', '1', '2025-10-24 17:04:55'),
(11, '7654', 'Anacely', 'Lopez Galvez', 'io98765', 'Femenino', 'O-', '7654568970978', '2025-10-14', '', '', '', '', '1', '2025-10-24 17:05:48'),
(12, '6567890', 'Margarita', 'Velázquez Aragón', 'dfgtr546323', 'Femenino', 'O-', '635236479809\'', '2025-10-14', '', '', '', '', '1', '2025-10-24 17:06:57'),
(13, '87675645', 'Jorge Alberto Cruz Valencia', 'Cruz Valencia', 'rytrhtgfdsafdewt', 'Masculino', 'O-', '6545342312324', '2025-10-19', '', '', '', '', '1', '2025-10-24 17:07:55'),
(14, '0987654', 'Itzel Guadalupe', 'Cruz Hernández', 'fer564744687', 'Femenino', 'O-', '9687564534212', '2025-10-08', '', '', '', '', '1', '2025-10-24 17:08:53'),
(15, '5647538', 'Luis Gerardo', 'Morquecho López', 'kui78765reg', 'Masculino', 'A+', '6573852375656', '2025-11-21', '', '', '', '', '1', '2025-10-24 17:09:45'),
(16, '00987576', 'Renata', 'Salazar', 'gdfgy6787698', 'Femenino', 'O-', '5643532424357', '2025-10-07', 'Erick@gmail.com', 'erick', '3d2172418ce305c7d16d4b05597c6a59', '2', '1', '2025-10-31 19:05:18'),
(17, '59876523', 'Mercedes', 'Ríos López', 'ytu7654rwesfdfdghj', 'Femenino', 'O-', '9786756454235', '2025-10-10', '', '', '', '', '1', '2025-10-24 17:11:57'),
(18, '47546798', 'Dylan', 'Santos Calderón', 'dgtrewdsadfghjhk776534trty6', 'Masculino', 'A+', '2435675897089', '2025-08-15', '', '', '', '', '1', '2025-10-24 17:12:46'),
(19, '08979685', 'Galilea', 'Toledo Torrez', 'gdy54786thgdfg', 'Femenino', 'A+', '9877654321224', '2025-10-02', '', '', '', '', '1', '2025-10-24 17:13:36'),
(20, '97867564', 'Osvani', 'García Mota', '55734543dsvvxc', 'Masculino', 'A+', '3454657869708', '2025-08-13', '', '', '', '', '1', '2025-10-24 17:15:25'),
(21, '78900000', 'Gady', 'Chacón Caballero', 'hgty678798d', 'Femenino', 'A+', '6757897878657', '2025-10-09', '', '', '', '', '1', '2025-10-24 17:16:51'),
(22, '93545678', 'María Rebeca', 'Velázquez Vera', 'fdafsa3456758', 'Femenino', 'O-', '4546576879809', '2025-11-14', '', '', '', '', '1', '2025-10-24 17:17:45'),
(23, '543321', 'Gabriela', 'Montesinos Lopez', 'lloiu7654rf', 'Femenino', 'A+', '6787654323456', '2025-10-01', '', '', '', '', '1', '2025-10-24 17:18:50'),
(24, '67123456', 'Paulina Evelin', 'Lopez', 'vcgfvsdfeetw4365u', 'Femenino', 'A+', '1324354657687', '2025-10-02', '', '', '', '', '1', '2025-10-24 17:20:28'),
(25, '87657687', 'Aylin', 'Lopez Ruiz', 'asde2345678ujhgfd', 'Femenino', 'O-', '9454657687906', '2025-10-11', '', '', '', '', '1', '2025-10-24 17:21:23'),
(26, '09877899', 'Rosio', 'Escobar Rubio', 'weretry867545r', 'Femenino', 'A+', '1232435465768', '2025-08-06', '', '', '', '', '1', '2025-10-24 17:22:39'),
(27, '450987', 'Angeles', 'Valdez Salinas', 'sedfrtg56788uj', 'Femenino', 'O-', '1287654321876', '2025-06-12', '', '', '', '', '1', '2025-10-24 17:24:02'),
(28, '08876543', 'Nayeli', 'Zacarias MOreno', 'wewrtyoui98786756453', 'Femenino', 'O-', '2309876556789', '2025-03-13', '', '', '', '', '1', '2025-10-24 17:25:11'),
(29, '21345676', 'Kenneth Aron', 'valencia López', 'llokiuhy765rd', 'Masculino', 'A+', '2423465678890', '2025-08-13', '', '', '', '', '1', '2025-10-24 17:26:23'),
(30, '59876543', 'Ingridth Monserat', 'Meza Facundo', 'pendiente', 'Femenino', 'A+', '0945677654322', '2025-10-03', '', '', '', '', '1', '2025-10-24 17:27:13'),
(31, '23434670', 'Andres Adrian', 'Meza Facundo', 'srtehfj0897867564', 'Masculino', 'O-', '1234253675097', '2025-09-04', '', '', '', '', '1', '2025-10-24 17:28:08'),
(32, '43313658', 'Alejandro', 'López', 'pendiente', 'Masculino', 'O-', 'pendiente', '2025-10-04', '', '', '', '', '1', '2025-10-24 17:29:20'),
(33, '34309978', 'Martin', 'Figueroa Toledo', 'podemos pendiente', 'Masculino', 'O-', 'pendiente', '2025-10-06', '', '', '', '', '1', '2025-10-24 17:30:18'),
(34, '13497867', 'Paola Guadalupe', 'Tellez García', 'werttrytjj 57654', 'Femenino', 'A+', '1987654333456', '2025-06-18', '', '', '', '', '1', '2025-10-24 17:31:52'),
(35, '32211098', 'Mercedes', 'Aragón', 'dewahii87654rfv', 'Femenino', 'A+', 'pendiente', '2025-10-04', '', '', '', '', '1', '2025-10-24 17:32:43'),
(36, '90324546', 'Valeria Guadalupe', 'Ramos Valencia', 'ewreetyuihjhgfcdscvbv c', 'Femenino', 'A+', '1208978675645', '2025-10-09', '', '', '', '', '1', '2025-10-24 17:33:37'),
(37, '09876543', 'Monserrat', 'Rodríguez Guerrero', 'pendiente', 'Femenino', 'O-', 'pendiente', '2025-01-13', '', '', '', '', '1', '2025-10-24 17:34:31'),
(38, '29876546', 'Iker Alexandre', 'Flores Camacho', 'wepouiyuy0978675645', 'Masculino', 'O-', '0345465768798', '2025-10-11', '', '', '', '', '1', '2025-10-24 17:35:26'),
(39, '20987654', 'Estrella', 'ovando cal y mayor', 'pendiente', 'Femenino', 'O-', 'pendiente', '2025-10-24', '', '', '', '', '1', '2025-10-24 17:36:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `idprcd` int(11) NOT NULL,
  `codpro` char(14) NOT NULL,
  `nompro` text NOT NULL,
  `idcat` int(11) NOT NULL,
  `preprd` decimal(10,2) NOT NULL,
  `stock` char(3) NOT NULL,
  `state` char(1) NOT NULL,
  `fere` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`idprcd`, `codpro`, `nompro`, `idcat`, `preprd`, `stock`, `state`, `fere`) VALUES
(4, 'H02B', 'Corticosteroides', 11, 238.00, '5', '1', '2025-10-28 22:24:19'),
(5, 'J2003', 'lidocaína', 9, 50.00, '1', '1', '2025-10-28 22:30:57'),
(6, 'AINE', 'Paracetamol', 9, 14.00, '1', '1', '2025-10-28 22:32:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `idse` int(11) NOT NULL,
  `nomem` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`idse`, `nomem`, `foto`) VALUES
(1, 'CAL Y MAYOR-ACOSTA ESPECIALSTAS DENTALES', '818908.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `treatment`
--

CREATE TABLE `treatment` (
  `idtra` int(11) NOT NULL,
  `nomtra` text NOT NULL,
  `idpa` int(11) NOT NULL,
  `nompa` varchar(35) NOT NULL,
  `state` char(1) NOT NULL,
  `fere` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(35) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` char(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `email`, `password`, `rol`, `created_at`) VALUES
(1, 'Dra. Melissa', 'Administradora', ' smaq1994@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', '1', '2025-10-30 20:17:20');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `base`
--
ALTER TABLE `base`
  ADD PRIMARY KEY (`idb`);

--
-- Indices de la tabla `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`idv`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idprcd` (`idprcd`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idcat`);

--
-- Indices de la tabla `consult`
--
ALTER TABLE `consult`
  ADD PRIMARY KEY (`idconslt`);

--
-- Indices de la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`idodc`);

--
-- Indices de la tabla `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`iddoc`);

--
-- Indices de la tabla `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idpa` (`idpa`),
  ADD KEY `idodc` (`idodc`),
  ADD KEY `idlab` (`idlab`);

--
-- Indices de la tabla `genogram`
--
ALTER TABLE `genogram`
  ADD PRIMARY KEY (`idge`);

--
-- Indices de la tabla `idiom`
--
ALTER TABLE `idiom`
  ADD PRIMARY KEY (`idoma`);

--
-- Indices de la tabla `laboratory`
--
ALTER TABLE `laboratory`
  ADD PRIMARY KEY (`idlab`);

--
-- Indices de la tabla `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`idnur`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`idord`);

--
-- Indices de la tabla `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`idpa`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idprcd`),
  ADD KEY `idcat` (`idcat`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`idse`);

--
-- Indices de la tabla `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`idtra`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `base`
--
ALTER TABLE `base`
  MODIFY `idb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cart`
--
ALTER TABLE `cart`
  MODIFY `idv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `idcat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `consult`
--
ALTER TABLE `consult`
  MODIFY `idconslt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `doctor`
--
ALTER TABLE `doctor`
  MODIFY `idodc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `document`
--
ALTER TABLE `document`
  MODIFY `iddoc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `genogram`
--
ALTER TABLE `genogram`
  MODIFY `idge` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `idiom`
--
ALTER TABLE `idiom`
  MODIFY `idoma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `laboratory`
--
ALTER TABLE `laboratory`
  MODIFY `idlab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `nurse`
--
ALTER TABLE `nurse`
  MODIFY `idnur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `idord` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `patients`
--
ALTER TABLE `patients`
  MODIFY `idpa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `idprcd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `idse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `treatment`
--
ALTER TABLE `treatment`
  MODIFY `idtra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`idprcd`) REFERENCES `product` (`idprcd`);

--
-- Filtros para la tabla `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`idpa`) REFERENCES `patients` (`idpa`),
  ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`idodc`) REFERENCES `doctor` (`idodc`),
  ADD CONSTRAINT `events_ibfk_3` FOREIGN KEY (`idlab`) REFERENCES `laboratory` (`idlab`);

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`idcat`) REFERENCES `category` (`idcat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
