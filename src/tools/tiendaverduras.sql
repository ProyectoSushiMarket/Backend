-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2024 a las 21:57:22
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
-- Base de datos: `tiendaverduras`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_PEDIDO` (IN `_ID_PEDIDO` INT(10), IN `_ESTADO` ENUM('pendiente','procesado','enviado','cancelado'))   BEGIN
	UPDATE `pedidos` SET estado = _ESTADO WHERE _ID_PEDIDO = id_pedido;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BUSCAR_PROVEEDOR` (IN `_PROVEEDOR` VARCHAR(100))   BEGIN

SELECT usuario, contrasena, rol from proveedor WHERE usuario = _PROVEEDOR;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONTADOR_PEDIDOS` ()   BEGIN
	SELECT COUNT(*) id_pedido FROM pedidos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_CLIENTE` (IN `_USUARIO` VARCHAR(100), IN `_CONTRASENA` VARCHAR(500), IN `_ROL` ENUM("Cliente"))   BEGIN

INSERT INTO clientes(usuario, contrasena, rol) VALUES (_USUARIO, _CONTRASENA, _ROL);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_PEDIDO` (IN `_ID_CLIENTE` INT(10), IN `_FECHA_PEDIDO` TIMESTAMP, IN `_ESTADO` ENUM('pendiente','procesado','enviado','cancelado'), IN `_CANTIDAD` INT(20))   BEGIN

INSERT INTO pedidos(id_cliente, fecha_pedido, estado, cantidad) VALUES (_ID_CLIENTE, _FECHA_PEDIDO, _ESTADO, _CANTIDAD); 

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_PRODUCTO` (IN `_NOMBRE` VARCHAR(100), IN `_IMAGEN` TEXT)   BEGIN

INSERT INTO productos(nombre, imagen) VALUES (_NOMBRE, _IMAGEN);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_PROVEEDOR` (IN `_NOMBRE` VARCHAR(100), IN `_USUARIO` VARCHAR(100), IN `_CONTRASENA` VARCHAR(500), IN `_ROL` VARCHAR(15))   BEGIN

INSERT INTO proveedor(nombre, usuario, contrasena, rol) VALUES (_NOMBRE, _USUARIO, _CONTRASENA, _ROL);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_CLIENTE` (IN `_ID_CLIENTE` INT(10))   BEGIN

DELETE FROM clientes WHERE id_cliente = _ID_CLIENTE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_PEDIDO` (IN `_ID_PEDIDO` INT(10))   BEGIN
	DELETE FROM pedidos WHERE id_pedido = _ID_PEDIDO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_PRODUCTO` (IN `_ID_PRODUCTO` INT(10))   BEGIN

DELETE FROM productos WHERE id_producto = _ID_PRODUCTO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_PROVEEDOR` (IN `_ID_PROVEEDOR` INT(10))   BEGIN

DELETE FROM proveedor WHERE id_proveedor = _ID_PROVEEDOR;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_CLIENTE` ()   BEGIN

SELECT * FROM clientes;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PEDIDO` ()   BEGIN

SELECT * FROM pedidos;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PRODUCTO` ()   BEGIN

SELECT * FROM productos;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PROVEEDOR` ()   BEGIN

SELECT * FROM proveedor;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_CLIENTE` (IN `_ID_CLIENTE` INT(10), IN `_USUARIO` VARCHAR(100), IN `_CONTRASENA` VARCHAR(500))   BEGIN

UPDATE clientes SET usuario = _USUARIO, contrasena = _CONTRASENA WHERE id_cliente = _ID_CLIENTE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_PRODUCTO` (IN `_ID_PRODUCTO` INT(10), IN `_NOMBRE` VARCHAR(100), IN `_IMAGEN` VARCHAR(100))   BEGIN

UPDATE productos SET nombre = _NOMBRE, imagen = _IMAGEN WHERE id_producto = _ID_PRODUCTO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_PROVEEDOR` (IN `_ID_PROVEEDOR` INT(10), IN `_NOMBRE` VARCHAR(100), IN `_USUARIO` VARCHAR(100), IN `_CONTRASENA` VARCHAR(500), IN `_ROL` VARCHAR(15))   BEGIN

UPDATE proveedor SET nombre = _NOMBRE, usuario = _USUARIO, contrasena = _CONTRASENA, ROL = _ROL WHERE id_proveedor = _ID_PROVEEDOR;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MOSTRAR_CLIENTE` (IN `_ID_CLIENTE` INT(10))   BEGIN

SELECT id_cliente, usuario, contrasena, rol FROM clientes WHERE id_cliente = _ID_CLIENTE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MOSTRAR_PRODUCTO` (IN `_ID_PRODUCTO` INT(10))   BEGIN

SELECT id_producto, nombre, imagen FROM productos WHERE id_producto = _ID_PRODUCTO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MOSTRAR_PROVEEDOR` (IN `_ID_PROVEEDOR` INT(10))   BEGIN

SELECT id_proveedor, usuario, contrasena, rol FROM proveedor WHERE id_proveedor = _ID_PROVEEDOR;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VERIFICAR_ROLES` (IN `_USUARIO` VARCHAR(100))   BEGIN

SELECT usuario, rol FROM usuarios WHERE usuario = _USUARIO;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(10) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `contrasena` varchar(500) NOT NULL,
  `rol` enum('Cliente') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `usuario`, `contrasena`, `rol`) VALUES
(1, 'SushiMarketVivaEnvigado', '$2b$04$dHLTqaAQ8ydVscGDcFxrqu3yN5hsX6KY34vox8WL1f.jncmX0waHK', 'Cliente'),
(2, 'SushiMarketElTesoro', '$2b$04$G5IoK82A8BqbbQ5ar2MM4Oiiw2GjQmgxmtro5EsVuxes0fU9YQWbi', 'Cliente'),
(4, 'SushiMarketZona2', '$2b$04$vpoh4hmk6DEhqCjBUIJcx.8HIIUJp6QD51q1JDPSzSP1LzhNTGU5q', 'Cliente'),
(5, 'SushiMarketAmsterdam', '$2b$04$GIhsFMsuGCPIzZ0UaNZTeOUGTwXsAuETwz/Fo3nE.xPJ8LcKeP266', 'Cliente'),
(6, 'SushiMarketSanLucas', '$2b$04$jVdNKStuC3LCJUcRq8eb6eo7NRhkioSWo3JnpCwKz.P0pPNWg.CM6', 'Cliente'),
(7, 'SushiMarketCityPlaza', '$2b$04$xF2TO5xPU6/FGOaYwtSrteuR3NUJydvvN3vwHhbwZlgseRdRi7s4S', 'Cliente'),
(8, 'SushiMarketVivaPalmas', '$2b$04$CvOIsgbPvtnzzqLLdsu5pOFM6vndkAYy40KH5LVTAJlBYFRtbyeq.', 'Cliente'),
(11, 'SushiMarketContenedores', '$2b$04$t4qMIYnFIGKMhCY8aXs5M.a3oPMJOSYhYDNU6UHiOMQcU4Wbt9RJe', 'Cliente'),
(12, 'SushiMarketLaureles', '$2b$04$pK5uFN.nZUamNgVaFEjYhOpwXtXhjSOVK6FCV.hL1yRXqgYL6ItfK', 'Cliente'),
(13, 'SushiMarketColores', '$2b$04$I24qpidfFZtGiBLoNzBv4OUoZg41BSw/P2nDUjjJpQNGVvQh2dcBa', 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(10) NOT NULL,
  `id_cliente` int(10) NOT NULL,
  `fecha_pedido` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` enum('pendiente','procesado','enviado','cancelado') DEFAULT 'pendiente',
  `cantidad` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_cliente`, `fecha_pedido`, `estado`, `cantidad`) VALUES
(1, 2, '2024-12-06 18:48:50', 'pendiente', 10000),
(6, 2, '2024-12-09 18:48:45', 'enviado', 10000),
(7, 1, '2024-12-31 18:48:41', 'procesado', 10000),
(8, 2, '2024-12-18 18:48:35', 'procesado', 10000),
(11, 1, '0000-00-00 00:00:00', 'enviado', 10000),
(12, 1, '2024-12-04 18:56:35', 'cancelado', 15000),
(16, 2, '2024-12-04 19:12:11', 'enviado', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `imagen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `imagen`) VALUES
(1, 'papa', 'https://media.istockphoto.com/id/157430678/es/foto/tres-de-papas.jpg?s=612x612&w=0&k=20&c=Tasc5CqTXRdkiAHZNI2XSZfesh_ovnjgbes1QuoRscs='),
(4, 'Aji Dulce', 'https://media.istockphoto.com/id/1130564105/es/foto/pimiento-dulce-p%C3%A1prika-aislado-sobre-fondo-blanco-trazado-de-recorte-de-completa-profundidad.jpg?s=612x612&w=0&k=20&c=r7KPYME424dbB3WyhaAQwljNf36sVh9mzuGhWLm1iJg='),
(5, 'Aguacate Verde', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSE_ZQVi0Q8Q2E5g-J4qn9hEu8fB4eeCpxb7Ew1J3c0YG01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `contrasena` varchar(500) NOT NULL,
  `rol` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre`, `usuario`, `contrasena`, `rol`) VALUES
(1, 'Jhoan', 'Xweet', '1', 'Administrador'),
(2, 'PRUEBA', 'PRUEBA5', '2', 'Proveedor');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_cliente` (`id_cliente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
