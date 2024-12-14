-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-12-2024 a las 01:23:30
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BUSCAR_PEDIDO` (IN `_ID_USUARIO` INT(11))   BEGIN

SELECT id_usuario, id_producto, fecha_pedido, cantidad, unidad_de_medida, caracteristicas FROM pedidos WHERE id_usuario = _ID_USUARIO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BUSCAR_USUARIO` (IN `_USUARIO` VARCHAR(100))   BEGIN

SELECT id_usuario, usuario, contrasena, rol FROM usuarios WHERE usuario = _USUARIO LIMIT 1;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONTADOR_PEDIDO` ()   BEGIN
	SELECT COUNT(*) id_pedido FROM pedidos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_PEDIDO` (IN `_ID_USUARIO` INT(11), IN `_RESPONSABLE` VARCHAR(20), IN `_ID_PRODUCTO` INT(11), IN `_FECHA_PEDIDO` DATETIME, IN `_CANTIDAD` INT(11), IN `_UNIDADMEDIDA` VARCHAR(50), IN `_CARACTERISTICAS` VARCHAR(100))   BEGIN

INSERT INTO pedidos(id_usuario, responsable, id_producto, fecha_pedido, cantidad, unidad_de_medida, caracteristicas) VALUES
(_ID_USUARIO, _RESPONSABLE, _ID_PRODUCTO, _FECHA_PEDIDO, _CANTIDAD, _UNIDADMEDIDA, _CARACTERISTICAS);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_PRODUCTO` (IN `_NOMBRE` VARCHAR(100), IN `_UNIDADDEMEDIDA` VARCHAR(50), IN `_IMAGEN` TEXT)   BEGIN

INSERT INTO productos(nombre, unidad_de_medida, imagen) VALUES (_NOMBRE, _UNIDADDEMEDIDA, _IMAGEN);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_USUARIO` (IN `_NOMBRE` VARCHAR(100), IN `_USUARIO` VARCHAR(100), IN `_CONTRASENA` VARCHAR(500), IN `_ROL` VARCHAR(15))   BEGIN

INSERT INTO usuarios(nombre, usuario, contrasena, rol) VALUES (_NOMBRE, _USUARIO, _CONTRASENA, _ROL);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_PEDIDO` (IN `_ID_PEDIDO` INT(10))   BEGIN
	DELETE FROM pedidos WHERE id_pedido = _ID_PEDIDO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_PRODUCTO` (IN `_NOMBRE` VARCHAR(100))   BEGIN

DELETE FROM productos WHERE nombre = _NOMBRE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_USUARIO` (IN `_ID_USUARIO` INT(10))   BEGIN

DELETE FROM usuarios WHERE id_usuario = _ID_USUARIO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PEDIDO` ()   BEGIN

SELECT 
    p.id_pedido,
    u.nombre AS nombre_usuario,
    p.responsable,
    prod.nombre AS nombre_producto,
    p.fecha_pedido,
    p.cantidad,
    p.unidad_de_medida,
    p.caracteristicas
FROM 
    pedidos p
LEFT JOIN 
    usuarios u ON p.id_usuario = u.id_usuario
LEFT JOIN 
    productos prod ON p.id_producto = prod.id_producto;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PRODUCTO` ()   BEGIN

SELECT * FROM productos;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_USUARIO` ()   BEGIN

SELECT * FROM usuarios;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_PRODUCTO` (IN `_NOMBRE` VARCHAR(100), IN `_NOMBRE_NUEVO` VARCHAR(100), IN `_UNIDADMEDIDA` VARCHAR(20), IN `_IMAGEN` TEXT)   BEGIN
    UPDATE productos 
    SET 
     nombre = _NOMBRE_NUEVO, 
     unidad_de_medida = _UNIDADMEDIDA, 
     imagen = _IMAGEN
    WHERE nombre = _NOMBRE;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_OBTENER_PEDIDOS_USUARIOS` (IN `p_rol` VARCHAR(15), IN `p_usuario` VARCHAR(100))   BEGIN
    -- Si el usuario es Cliente
    IF p_rol = 'Cliente' THEN
        SELECT 
            p.id_pedido,
            u.nombre AS nombre_usuario,  -- Mostramos el nombre real del usuario
            p.responsable,
            p.id_producto, 
            p.fecha_pedido, 
            p.cantidad, 
            p.unidad_de_medida, 
            p.caracteristicas
        FROM 
            pedidos p
        JOIN 
            usuarios u ON p.id_usuario = u.id_usuario
        WHERE 
            u.id_usuario = p_usuario AND u.rol = p_rol;  -- Usamos id_usuario para filtrar el cliente

    -- Si el usuario es Proveedor
    ELSEIF p_rol = 'Proveedor' THEN
        SELECT 
            p.id_pedido,
            u.nombre AS nombre_usuario,  -- Mostramos el nombre real del usuario
            p.responsable,
            p.id_producto, 
            p.fecha_pedido, 
            p.cantidad, 
            p.unidad_de_medida, 
            p.caracteristicas
        FROM 
            pedidos p
        JOIN 
            usuarios u ON p.id_usuario = u.id_usuario;

    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Rol no válido. Use Cliente o Proveedor.';
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VERIFICAR_ROLES` (IN `_USUARIO` VARCHAR(100))   BEGIN

SELECT id_usuario, usuario, rol FROM usuarios WHERE usuario = _USUARIO;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `responsable` varchar(20) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `fecha_pedido` datetime DEFAULT current_timestamp(),
  `cantidad` int(11) NOT NULL,
  `unidad_de_medida` varchar(50) DEFAULT NULL,
  `caracteristicas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_usuario`, `responsable`, `id_producto`, `fecha_pedido`, `cantidad`, `unidad_de_medida`, `caracteristicas`) VALUES
(63, 17, '', 43, '2024-12-13 22:50:31', 2, 'GR', 'No aplica'),
(64, 17, 'Jhoan Monsalve', 43, '2024-12-13 22:55:15', 2, 'GR', 'Maduro'),
(65, 17, 'Jhoan Gallego', 43, '2024-12-13 23:03:55', 4, 'GR', 'No aplica'),
(66, 7, 'Jhoan Gallego', 43, '2024-12-13 23:31:49', 4, 'GR', 'Maduro'),
(67, 21, 'VIva Palmas', 43, '2024-12-13 23:41:19', 5, 'GR', 'No aplica'),
(68, 17, 'Jhoan Monsalve', 49, '2024-12-13 23:45:46', 4, 'GR', 'No aplica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `unidad_de_medida` varchar(50) NOT NULL,
  `imagen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `unidad_de_medida`, `imagen`) VALUES
(43, 'Aji Dulce', 'GR', 'https://ricuracostena.com.co/wp-content/uploads/2022/06/112.jpg'),
(49, 'Jhoan', 'GR', 'www');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(10) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `contrasena` varchar(500) NOT NULL,
  `rol` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `nombre`, `contrasena`, `rol`) VALUES
(2, 'Prueba', 'Prueba1', '$2b$04$8CCG9DO7C1uTyhtZnrkO9e0urCWaO2hkbSAnBVkJSeA.cVf0cNuMW', 'Cliente'),
(4, 'PruebaCliente', 'Cliente', '$2b$04$Sn6dd1Bitv0r2ePrWYhgTOoBP8hsKppslY58/DJBZbXENnmGcYobi', 'Cliente'),
(5, 'PruebaClienteconsumirfrontend', 'frontend', '$2b$04$dTqGgTqnLb0ESVHcRubI2.HYapnpN2PVKT7K8Q/PvWMoqOxdTOazO', 'Cliente'),
(6, 'Jhoan', 'Jhoan2', '$2b$04$ZFNWx16n6gYlUuaaF1nZg.Pdtqf9w6wg30Dz31kEcNSKbzELJ/qdO', 'Cliente'),
(7, 'Jhoan', 'JhoanPrueba', '$2b$04$UdU.X.5HuHblm47MkOSzHOZJDauf2kSzAyGTDNdMgOA9.cPxmWGxO', 'Cliente'),
(8, 'pruebacrear', 'crear', '$2b$04$rLTuiyzCBn8KJ/dSMuvF8uRrUSzGjv0LPKuxCqZozlUlhJpmdqtwm', 'Proveedor'),
(9, 'pruebacrear', 'wewww', '$2b$04$Pz1CE9MoX8L8C1HVTdZYCecpsBezkM/mX5ULBQO4epaChXYj9XWWi', 'Cliente'),
(10, 'pruebacrear', 'crear', '$2b$04$j4DEt/R8UVTzXH8P8rqNqeHKRXKZt6KzyV1IcfDVZvK9AG4UdGT9u', 'Proveedor'),
(11, 'Jhoan', 'wewww', '$2b$04$fTvxfMTqg9uXgvDgQcN9RO/pGnHHQkAF3vpUCxE3QCs90mDEIUtXa', 'Proveedor'),
(12, 'Jhoan', 'Jhoan212', '$2b$04$OobhiHGwY62kOxv5EWJgjuyRBD.QAEywCEL6Mktnotxi0pxoTVISe', 'Cliente'),
(17, 'JhoanCliente', 'Jhoan Monsalve', '$2b$04$vqXHHmc0a12TMZ3aMUYcB.iUnAphb2SlVgMpxIpDV5ogJ4qwlmJVm', 'Cliente'),
(18, 'JhoanProveedor', 'Jhoan Monsalve Gallego', '$2b$04$j.cUipyCW7qieYJuiGOhYezHq6Aj4R87CpQg2jq4UpKX8RDPz3Ob.', 'Proveedor'),
(20, 'JhoanUsuario', 'Jhoan', '$2b$04$if5qfq0Mjeh2q1GrFpAqq.5SVoMI6rLlejJej.yVqgVfn3B2xl5Fi', 'Cliente'),
(21, 'Nose2.0', 'Jhoan Monsalve', '$2b$04$DnGpwyNI9hA7hluUFtGTs.Zz4AHhg92xAIbQqqbruWSupBRMrtUzi', 'Cliente');

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
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
