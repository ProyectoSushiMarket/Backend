-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-12-2024 a las 19:47:08
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_PEDIDO` (IN `_ID_USUARIO` INT(11), IN `_ID_PRODUCTO` INT(11), IN `_FECHA_PEDIDO` DATETIME, IN `_CANTIDAD` INT(11), IN `_UNIDADMEDIDA` VARCHAR(50))   BEGIN

INSERT INTO pedidos(id_usuario, id_producto, fecha_pedido, cantidad, unidad_de_medida) VALUES
(_ID_USUARIO, _ID_PRODUCTO, _FECHA_PEDIDO, _CANTIDAD, _UNIDADMEDIDA);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_PRODUCTO` (IN `_NOMBRE` VARCHAR(100), IN `_CANTIDAD` INT(10), IN `_UNIDADMEDIDA` VARCHAR(10), IN `_CARACTERISTICAS` VARCHAR(100), IN `_IMAGEN` TEXT)   BEGIN

INSERT INTO productos(nombre, cantidad, unidadmedida, caracteristicas, imagen) VALUES (_NOMBRE, _CANTIDAD, _UNIDADMEDIDA, _CARACTERISTICAS, _IMAGEN);

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_PRODUCTO` (IN `_ID_PRODUCTO` INT(10), IN `_NOMBRE` VARCHAR(100), IN `_CANTIDAD` INT(10), IN `_UNIDADMEDIDA` VARCHAR(10), IN `_CARACTERISTICAS` VARCHAR(100), IN `_IMAGEN` TEXT)   BEGIN

UPDATE productos SET nombre = _NOMBRE, cantidad = _CANTIDAD, unidadmedida = _UNIDADMEDIDA, caracteristicas = _CARACTERISTICAS, imagen = _IMAGEN WHERE id_producto = _ID_PRODUCTO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_USUARIO` (IN `_ID_USUARIO` INT(10), IN `_NOMBRE` VARCHAR(100), IN `_USUARIO` VARCHAR(100), IN `_CONTRASENA` VARCHAR(500), IN `_ROL` VARCHAR(15))   BEGIN

UPDATE usuarios SET nombre = _NOMBRE, usuario = _USUARIO, contrasena = _CONTRASENA, ROL = _ROL WHERE id_usuario = _ID_USUARIO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MOSTRAR_PRODUCTO` (IN `_ID_PRODUCTO` INT(10))   BEGIN

SELECT id_producto, nombre, cantidad, unidadmedida, caracteristicas,  imagen FROM productos WHERE id_producto = _ID_PRODUCTO;

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
  `unidad_de_medida` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_usuario`, `id_producto`, `fecha_pedido`, `cantidad`, `unidad_de_medida`) VALUES
(1, 1, 5, '0000-00-00 00:00:00', 5, 'KL'),
(2, 1, 5, '2024-12-10 12:44:15', 5, 'KL'),
(3, 2, 1, '2024-12-10 13:02:38', 5, 'KL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `unidadmedida` varchar(10) NOT NULL,
  `caracteristicas` varchar(100) NOT NULL,
  `imagen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `cantidad`, `unidadmedida`, `caracteristicas`, `imagen`) VALUES
(1, 'papa', 0, '0', '', 'https://media.istockphoto.com/id/157430678/es/foto/tres-de-papas.jpg?s=612x612&w=0&k=20&c=Tasc5CqTXRdkiAHZNI2XSZfesh_ovnjgbes1QuoRscs='),
(4, 'Aji Dulce', 0, '0', '', 'https://media.istockphoto.com/id/1130564105/es/foto/pimiento-dulce-p%C3%A1prika-aislado-sobre-fondo-blanco-trazado-de-recorte-de-completa-profundidad.jpg?s=612x612&w=0&k=20&c=r7KPYME424dbB3WyhaAQwljNf36sVh9mzuGhWLm1iJg='),
(5, 'Aguacate Verde', 0, '0', '', 'https://mercadobecampo.com/cdn/shop/products/aguacate_Mesadetrabajo1_d8da4441-130b-4f68-916b-949bae6b5c10.jpg?v=1649210167&width=1946'),
(6, 'Sushi Aguacate', 0, '0', '', 'https://www.cocinavital.mx/wp-content/uploads/2017/08/sushi-de-camaron-asado-con-chipotle-y-aguacate.jpg'),
(7, 'Zanahoria', 0, '0', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnF-aRG-w8zPIfXez0Rsqn1ylKnN6b3L7arQ&s'),
(10, 'Aguacate', 2, 'KL', 'maduro', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSuyPsPC1z11hsOAA_qJWph-h_tq7BSagzHH8jwS6v_yeqp-GWnVJqQyVL4qX0R94w4aoMqaz2EwDo25NcIuFa7Hw'),
(21, 'Cebolla', 3, 'KL', 'Maduro', 'data:image/jpeg;base64,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');

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
(4, 'PruebaCliente', 'Cliente', '$2b$04$Sn6dd1Bitv0r2ePrWYhgTOoBP8hsKppslY58/DJBZbXENnmGcYobi', 'Cliente');

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
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
