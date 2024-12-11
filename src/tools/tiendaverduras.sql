-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-12-2024 a las 19:02:29
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BUSCAR_USUARIO` (IN `_USUARIO` VARCHAR(100))   BEGIN

SELECT usuario, contrasena, rol FROM usuarios WHERE usuario = _USUARIO LIMIT 1;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONTADOR_PEDIDO` ()   BEGIN
	SELECT COUNT(*) id_pedido FROM pedidos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_PEDIDO` (IN `_ID_USUARIO` INT(11), IN `_ID_PRODUCTO` INT(11), IN `_FECHA_PEDIDO` DATETIME, IN `_CANTIDAD` INT(11), IN `_UNIDADMEDIDA` VARCHAR(50), IN `_CARACTERISTICAS` VARCHAR(100))   BEGIN

INSERT INTO pedidos(id_usuario, id_producto, fecha_pedido, cantidad, unidad_de_medida, caracteristicas) VALUES
(_ID_USUARIO, _ID_PRODUCTO, _FECHA_PEDIDO, _CANTIDAD, _UNIDADMEDIDA, _CARACTERISTICAS);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_PRODUCTO` (IN `_NOMBRE` VARCHAR(100), IN `_IMAGEN` TEXT)   BEGIN

INSERT INTO productos(nombre, imagen) VALUES (_NOMBRE, _IMAGEN);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_USUARIO` (IN `_NOMBRE` VARCHAR(100), IN `_USUARIO` VARCHAR(100), IN `_CONTRASENA` VARCHAR(500), IN `_ROL` VARCHAR(15))   BEGIN

INSERT INTO usuarios(nombre, usuario, contrasena, rol) VALUES (_NOMBRE, _USUARIO, _CONTRASENA, _ROL);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_PEDIDO` (IN `_ID_PEDIDO` INT(10))   BEGIN
	DELETE FROM pedidos WHERE id_pedido = _ID_PEDIDO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_PRODUCTO` (IN `_ID_PRODUCTO` INT(10))   BEGIN

DELETE FROM productos WHERE id_producto = _ID_PRODUCTO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_USUARIO` (IN `_ID_USUARIO` INT(10))   BEGIN

DELETE FROM usuarios WHERE id_usuario = _ID_USUARIO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PEDIDO` ()   BEGIN

SELECT * FROM pedidos;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PRODUCTO` ()   BEGIN

SELECT * FROM productos;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_USUARIO` ()   BEGIN

SELECT * FROM usuarios;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_PRODUCTO` (IN `_ID_PRODUCTO` INT(10), IN `_NOMBRE` VARCHAR(100), IN `_IMAGEN` TEXT)   BEGIN

UPDATE productos SET nombre = _NOMBRE, imagen = _IMAGEN WHERE id_producto = _ID_PRODUCTO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_USUARIO` (IN `_ID_USUARIO` INT(10), IN `_NOMBRE` VARCHAR(100), IN `_USUARIO` VARCHAR(100), IN `_CONTRASENA` VARCHAR(500), IN `_ROl` VARCHAR(15))   BEGIN

UPDATE usuarios SET nombre = _NOMBRE, usuario = _USUARIO, contrasena = _CONTRASENA, rol = _ROL WHERE id_usuario = _ID_USUARIO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MOSTRAR_PRODUCTO` (IN `_ID_PRODUCTO` INT(10))   BEGIN

SELECT id_producto, nombre, imagen FROM productos WHERE id_producto = _ID_PRODUCTO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MOSTRAR_USUARIO` (IN `_ID_USUARIO` INT(10))   BEGIN

SELECT id_usuario, usuario, contrasena, rol FROM usuarios WHERE id_usuario = _ID_USUARIO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VERIFICAR_ROLES` (IN `_USUARIO` VARCHAR(100))   BEGIN

SELECT usuario, rol FROM usuarios WHERE usuario = _USUARIO;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `fecha_pedido` datetime DEFAULT current_timestamp(),
  `cantidad` int(11) DEFAULT NULL,
  `unidad_de_medida` varchar(50) DEFAULT NULL,
  `caracteristicas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_usuario`, `id_producto`, `fecha_pedido`, `cantidad`, `unidad_de_medida`, `caracteristicas`) VALUES
(2, 1, 5, '2024-12-10 12:44:15', 5, 'KL', ''),
(3, 2, 1, '2024-12-10 13:02:38', 5, 'KL', ''),
(6, 2, 4, '2024-12-10 13:02:38', 20, 'KL', 'Maduro');

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
(5, 'Aguacate Verde', 'https://mercadobecampo.com/cdn/shop/products/aguacate_Mesadetrabajo1_d8da4441-130b-4f68-916b-949bae6b5c10.jpg?v=1649210167&width=1946'),
(6, 'Sushi Aguacate', 'https://www.cocinavital.mx/wp-content/uploads/2017/08/sushi-de-camaron-asado-con-chipotle-y-aguacate.jpg'),
(7, 'Zanahoria', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnF-aRG-w8zPIfXez0Rsqn1ylKnN6b3L7arQ&s'),
(10, 'Aguacate', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSuyPsPC1z11hsOAA_qJWph-h_tq7BSagzHH8jwS6v_yeqp-GWnVJqQyVL4qX0R94w4aoMqaz2EwDo25NcIuFa7Hw'),
(24, 'Aguacate Verde', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSE_ZQVi0Q8Q2E5g-J4qn9hEu8fB4eeCpxb7Ew1J3c0YG014mNaf6NQy0GK2P9WIjjimPP-ZGCv2_T9K4Aa3G9QXeXHdgoA7anzRewvIog'),
(25, 'Banano', 'https://lavaquita.co/cdn/shop/products/76b6170a-f1e1-4a92-8622-cee94a659b91_700x700.png?v=1622197616');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `contrasena` varchar(500) NOT NULL,
  `rol` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `usuario`, `contrasena`, `rol`) VALUES
(1, 'Jhoan Monsalve', 'Jhoan', '$2b$04$7GfunNIACwQ8FkZxbUn5U.a7F36I4bfX2Cibk9vhQHIxKX.sddmFC', 'Proveedor'),
(2, 'Prueba', 'Prueba1', '$2b$04$8CCG9DO7C1uTyhtZnrkO9e0urCWaO2hkbSAnBVkJSeA.cVf0cNuMW', 'Cliente'),
(4, 'PruebaCliente', 'Cliente', '$2b$04$Sn6dd1Bitv0r2ePrWYhgTOoBP8hsKppslY58/DJBZbXENnmGcYobi', 'Cliente'),
(5, 'PruebaClienteconsumirfrontend', 'frontend', '$2b$04$dTqGgTqnLb0ESVHcRubI2.HYapnpN2PVKT7K8Q/PvWMoqOxdTOazO', 'Cliente'),
(6, 'Jhoan', 'Jhoan2', '$2b$04$ZFNWx16n6gYlUuaaF1nZg.Pdtqf9w6wg30Dz31kEcNSKbzELJ/qdO', 'Cliente'),
(7, 'Jhoan', 'JhoanPrueba', '$2b$04$UdU.X.5HuHblm47MkOSzHOZJDauf2kSzAyGTDNdMgOA9.cPxmWGxO', 'Cliente'),
(8, 'pruebacrear', 'crear', '$2b$04$rLTuiyzCBn8KJ/dSMuvF8uRrUSzGjv0LPKuxCqZozlUlhJpmdqtwm', 'Proveedor'),
(9, 'pruebacrear', 'wewww', '$2b$04$Pz1CE9MoX8L8C1HVTdZYCecpsBezkM/mX5ULBQO4epaChXYj9XWWi', 'Cliente'),
(10, 'pruebacrear', 'crear', '$2b$04$j4DEt/R8UVTzXH8P8rqNqeHKRXKZt6KzyV1IcfDVZvK9AG4UdGT9u', 'Proveedor'),
(11, 'Jhoan', 'wewww', '$2b$04$fTvxfMTqg9uXgvDgQcN9RO/pGnHHQkAF3vpUCxE3QCs90mDEIUtXa', 'Proveedor'),
(12, 'Jhoan', 'JhoanPrueba', '$2b$04$m1O8EmZWvthP4zHDhoypR.F96OMMlUqpc72jXMcq2.HHX1nrAm7CG', 'Cliente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
