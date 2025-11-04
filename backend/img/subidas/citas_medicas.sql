-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2022 a las 10:04:46
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
CREATE TABLE `archivo_base` (
  `id_archivo` int(11) NOT NULL,
  `nombre_archivo` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `archivo_base`
--

INSERT INTO `archivo_base` (`id_archivo`, `nombre_archivo`) VALUES
(1, 'citas_medicas.sql');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_carrito` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre_item` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `estado`, `fecha_registro`) VALUES
(2, 'Excipientes', '1', '2022-10-25 07:19:44'),
(3, 'Analgésicos', '1', '2022-10-25 07:28:01'),
(4, 'Antiinflamatorios', '1', '2022-10-25 07:19:58'),
(5, 'Antipiréticos', '1', '2022-10-25 07:20:04'),
(6, 'Laxantes', '1', '2022-10-25 07:27:56'),
(7, 'Antiinfecciosos', '1', '2022-10-25 07:20:18'),
(8, 'Antitusivos', '1', '2022-10-25 07:20:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id_consulta` int(11) NOT NULL,
  `motivo_consulta` text COLLATE utf8_unicode_ci NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `nombre_paciente` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctores`
--

CREATE TABLE `doctores` (
  `id_doctor` int(11) NOT NULL,
  `cedula_doctor` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_doctor` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `apellido_doctor` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_especialidad` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sexo` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` char(13) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `correo` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `usuario` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `contrasena` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rol` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `doctores`
--

INSERT INTO `doctores` (`id_doctor`, `cedula_doctor`, `nombre_doctor`, `apellido_doctor`, `nombre_especialidad`, `direccion`, `sexo`, `telefono`, `fecha_nacimiento`, `correo`, `usuario`, `contrasena`, `rol`, `estado`, `fecha_registro`) VALUES
(10, '09383353', 'RAMON RULEI', 'NUÑEZ VALENCIA', 'Cardiología', 'CALLE LAS APLOMINAS', 'Masculino', '+51 998747477', '1993-08-12', 'aacaad@gmail.com', 'ddvf', '3b593cffbd70aefca6fbdc2b1563bf1e', '3', '1', '2022-10-25 06:03:08'),
(11, '86577567', 'Benito', 'Cabrera', 'Endocrinología', 'calle las monteros', 'Masculino', '+51 998382323', '1992-04-12', '', '', '', '', '1', '2022-10-25 05:13:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id_documento` int(11) NOT NULL,
  `nombre_archivo` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `ruta_archivo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `nombre_paciente` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`id_documento`, `nombre_archivo`, `ruta_archivo`, `id_paciente`, `nombre_paciente`, `estado`, `fecha_registro`) VALUES
(1, 'radigrafia', '764173.jpeg', 2, 'Manuel Javier', '1', '2022-10-25 21:35:56'),
(2, 'otro ejemplo', '526177.png', 2, 'Manuel Javier', '1', '2022-10-25 21:41:34'),
(3, 'otro ejemplo', '426110.png', 2, 'Manuel Javier', '1', '2022-10-25 21:41:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas_medicas`
--

CREATE TABLE `citas_medicas` (
  `id_cita` int(11) NOT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_doctor` int(11) NOT NULL,
  `id_laboratorio` int(11) NOT NULL,
  `color` char(14) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inicio` datetime NOT NULL,
  `fin` datetime DEFAULT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `confirmado` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `citas_medicas`
--

INSERT INTO `citas_medicas` (`id_cita`, `titulo`, `id_paciente`, `id_doctor`, `id_laboratorio`, `color`, `inicio`, `fin`, `estado`, `monto`, `confirmado`, `fecha_registro`) VALUES
(1, 'CITA 1', 1, 10, 5, '#CD5C5C', '2022-10-27 01:04:00', '2022-10-27 01:04:00', '1', '30.00', '1', '2022-10-27 06:04:51'),
(2, 'CITA 2', 2, 11, 4, '#FFC0CB', '2022-10-28 02:43:00', '2022-10-28 02:43:00', '1', '50.00', '1', '2022-10-27 06:43:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genograma`
--

CREATE TABLE `genograma` (
  `id_genograma` int(11) NOT NULL,
  `detalles_genograma` text COLLATE utf8_unicode_ci NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `nombre_paciente` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

CREATE TABLE `idiomas` (
  `id_idioma` int(11) NOT NULL,
  `nombre_idioma` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `idiomas`
--

INSERT INTO `idiomas` (`id_idioma`, `nombre_idioma`) VALUES
(1, 'Español');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorios`
--

CREATE TABLE `laboratorios` (
  `id_laboratorio` int(11) NOT NULL,
  `nombre_laboratorio` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `laboratorios`
--

INSERT INTO `laboratorios` (`id_laboratorio`, `nombre_laboratorio`, `estado`, `fecha_registro`) VALUES
(2, 'Pediatría', '1', '2022-10-25 06:48:26'),
(3, 'Rehabilitación', '1', '2022-10-25 06:48:44'),
(4, 'Endocrinología', '1', '2022-10-25 06:48:51'),
(5, 'Cardiología', '1', '2022-10-25 07:00:52'),
(6, 'Dermatología', '1', '2022-10-25 06:49:11'),
(7, 'Gastroenterología', '1', '2022-10-25 06:49:17'),
(8, 'Psiquiatría', '1', '2022-10-25 06:49:25'),
(9, 'Neurología', '1', '2022-10-25 06:49:37'),
(10, 'Neumología', '1', '2022-10-25 06:49:45'),
(12, 'Hematología', '1', '2022-10-25 06:49:59'),
(13, 'Oncología', '1', '2022-10-25 06:50:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermeras`
--

CREATE TABLE `enfermeras` (
  `id_enfermera` int(11) NOT NULL,
  `numero_identificacion` char(14) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_enfermera` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `apellido_enfermera` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nacimiento_enfermera` date NOT NULL,
  `sexo` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `enfermeras`
--

INSERT INTO `enfermeras` (`id_enfermera`, `numero_identificacion`, `nombre_enfermera`, `apellido_enfermera`, `fecha_nacimiento_enfermera`, `sexo`, `estado`, `fecha_registro`) VALUES
(5, '09453534534534', 'MANUEL LUCAS', 'PERES JARAMILLO', '1996-03-01', 'Femenino', '1', '2022-10-25 06:11:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre_cliente` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `metodo_pago` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `productos_totales` text COLLATE utf8_unicode_ci NOT NULL,
  `precio_total` decimal(10,2) NOT NULL,
  `fecha_pedido` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `estado_pago` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_comprobante` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_usuario`, `nombre_cliente`, `metodo_pago`, `productos_totales`, `precio_total`, `fecha_pedido`, `estado_pago`, `tipo_comprobante`) VALUES
(1, 1, 'Yuliana Sosa', 'Contado', ', MANTIXA 2.5 MG X 30 COMPRIMIDOS ( 2 )', '307.20', '28-Oct-2022', 'Aceptado', 'Boleta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_paciente` int(11) NOT NULL,
  `numero_historia_clinica` char(8) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_paciente` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `apellido_paciente` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sexo` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `grupo_sanguineo` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` char(13) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `correo` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `usuario` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `contrasena` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rol` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_paciente`, `numero_historia_clinica`, `nombre_paciente`, `apellido_paciente`, `direccion`, `sexo`, `grupo_sanguineo`, `telefono`, `fecha_nacimiento`, `correo`, `usuario`, `contrasena`, `rol`, `estado`, `fecha_registro`) VALUES
(1, '77458745', 'JAVIER MANUEL', 'SUAREZ BENITES', 'CALLE LAS MALVINAS', 'Masculino', 'A+', '+51 999875411', '1995-08-12', '', '', '', '', '1', '2022-10-21 20:02:26'),
(2, '76433434', 'Manuel Javier', 'Flores Mendoza', 'calle los tulipanes mz d7 lt 86', 'Masculino', 'A+', '+51 999764545', '1992-08-09', '', '', '', '', '1', '2022-10-22 12:11:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `codigo_producto` char(14) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_producto` text COLLATE utf8_unicode_ci NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `precio_producto` decimal(10,2) NOT NULL,
  `stock` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `codigo_producto`, `nombre_producto`, `id_categoria`, `precio_producto`, `stock`, `estado`, `fecha_registro`) VALUES
(1, 'AMF774FFBFBDBF', 'MANTIXA 2.5 MG X 30 COMPRIMIDOS', 5, '153.60', '90', '1', '2022-10-25 18:40:09'),
(2, 'SKU: 09434', 'Pomada Antiinflamatoria Lymphdiaral x 40 gr', 7, '45.00', '50', '1', '2022-10-25 18:58:17'),
(3, '09898978978978', 'cvcvcv', 3, '33.90', '99', '1', '2022-10-26 19:58:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id_configuracion` int(11) NOT NULL,
  `nombre_empresa` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id_configuracion`, `nombre_empresa`, `logo`) VALUES
(1, 'CLINICA SALUD', '704390.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamientos`
--

CREATE TABLE `tratamientos` (
  `id_tratamiento` int(11) NOT NULL,
  `nombre_tratamiento` text COLLATE utf8_unicode_ci NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `nombre_paciente` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `correo` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `contrasena` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rol` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `nombre`, `correo`, `contrasena`, `rol`, `fecha_creacion`) VALUES
(1, 'admin', 'Administrador', 'adrianlujam91@gmail.com', 'b0baee9d279d34fa1dfd71aadb908c3f', '1', '2022-10-28 07:12:48');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivo_base`
--
ALTER TABLE `archivo_base`
  ADD PRIMARY KEY (`id_archivo`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_carrito`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id_consulta`);

--
-- Indices de la tabla `doctores`
--
ALTER TABLE `doctores`
  ADD PRIMARY KEY (`id_doctor`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id_documento`);

--
-- Indices de la tabla `citas_medicas`
--
ALTER TABLE `citas_medicas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_doctor` (`id_doctor`),
  ADD KEY `id_laboratorio` (`id_laboratorio`);

--
-- Indices de la tabla `genograma`
--
ALTER TABLE `genograma`
  ADD PRIMARY KEY (`id_genograma`);

--
-- Indices de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  ADD PRIMARY KEY (`id_idioma`);

--
-- Indices de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  ADD PRIMARY KEY (`id_laboratorio`);

--
-- Indices de la tabla `enfermeras`
--
ALTER TABLE `enfermeras`
  ADD PRIMARY KEY (`id_enfermera`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_paciente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id_configuracion`);

--
-- Indices de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD PRIMARY KEY (`id_tratamiento`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivo_base`
--
ALTER TABLE `archivo_base`
  MODIFY `id_archivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_carrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `doctores`
--
ALTER TABLE `doctores`
  MODIFY `id_doctor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id_documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `citas_medicas`
--
ALTER TABLE `citas_medicas`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `genograma`
--
ALTER TABLE `genograma`
  MODIFY `id_genograma` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  MODIFY `id_idioma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  MODIFY `id_laboratorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `enfermeras`
--
ALTER TABLE `enfermeras`
  MODIFY `id_enfermera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id_configuracion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  MODIFY `id_tratamiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas (clave foránea)
--

--
-- Relaciones para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_fk_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `carrito_fk_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Relaciones para la tabla `citas_medicas`
--
ALTER TABLE `citas_medicas`
  ADD CONSTRAINT `citas_fk_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  ADD CONSTRAINT `citas_fk_doctor` FOREIGN KEY (`id_doctor`) REFERENCES `doctores` (`id_doctor`),
  ADD CONSTRAINT `citas_fk_laboratorio` FOREIGN KEY (`id_laboratorio`) REFERENCES `laboratorios` (`id_laboratorio`);

--
-- Relaciones para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_fk_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
