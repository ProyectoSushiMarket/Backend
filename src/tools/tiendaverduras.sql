-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-12-2024 a las 17:54:15
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

SELECT id_usuario, id_producto, fecha_pedido, cantidad, unidad_de_medida, precio, caracteristicas FROM pedidos WHERE id_usuario = _ID_USUARIO;

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREAR_PRODUCTO` (IN `_NOMBRE` VARCHAR(100), IN `_UNIDADDEMEDIDA` VARCHAR(50), IN `_PRECIO` DECIMAL(10,3), IN `_DISPONIBILIDAD` VARCHAR(20), IN `_IMAGEN` TEXT)   BEGIN

INSERT INTO productos(nombre, unidad_de_medida, precio, disponibilidad, imagen) VALUES (_NOMBRE, _UNIDADDEMEDIDA, _PRECIO, _DISPONIBILIDAD, _IMAGEN);

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_PRODUCTO` (IN `_NOMBRE` VARCHAR(100), IN `_NOMBRE_NUEVO` VARCHAR(100), IN `_UNIDADMEDIDA` VARCHAR(50), IN `_PRECIO` DECIMAL(10,3), IN `_DISPONIBILIDAD` VARCHAR(20))   BEGIN
    UPDATE productos 
    SET 
        nombre = _NOMBRE_NUEVO, 
        unidad_de_medida = _UNIDADMEDIDA,
        precio = _PRECIO,
        disponibilidad = _DISPONIBILIDAD
    WHERE nombre = _NOMBRE;

    -- Devuelve explícitamente el número de filas afectadas
    SELECT ROW_COUNT() AS affectedRows;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_USUARIO` (IN `_ID_USUARIO` INT(10), IN `_NOMBRE` VARCHAR(100), IN `_USUARIO` VARCHAR(100), IN `_CONTRASENA` VARCHAR(500), IN `_ROl` VARCHAR(15))   BEGIN

UPDATE usuarios SET nombre = _NOMBRE, usuario = _USUARIO, contrasena = _CONTRASENA, rol = _ROL WHERE id_usuario = _ID_USUARIO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MOSTRAR_PRODUCTO` (IN `_ID_PRODUCTO` INT(10))   BEGIN

SELECT id_producto, nombre, unidad_de_medida, precio, disponibilidad, imagen FROM productos WHERE id_producto = _ID_PRODUCTO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MOSTRAR_USUARIO` (IN `_ID_USUARIO` INT(10))   BEGIN

SELECT id_usuario, usuario, contrasena, rol FROM usuarios WHERE id_usuario = _ID_USUARIO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_OBTENER_PEDIDOS_USUARIOS` (IN `p_rol` VARCHAR(15), IN `p_usuario` VARCHAR(100))   BEGIN
    -- Si el usuario es Cliente
    IF p_rol = 'Cliente' THEN
        SELECT 
            p.id_pedido,
            u.nombre AS nombre_usuario,  
            p.responsable,
            pr.nombre AS nombre_producto,  
            p.fecha_pedido, 
            p.cantidad, 
            p.unidad_de_medida,
            p.caracteristicas
        FROM 
            pedidos p
        JOIN 
            usuarios u ON p.id_usuario = u.id_usuario
        JOIN 
            productos pr ON p.id_producto = pr.id_producto  
        WHERE 
            u.id_usuario = p_usuario AND u.rol = p_rol;  

    -- Si el usuario es Proveedor
    ELSEIF p_rol = 'Proveedor' THEN
        SELECT 
            p.id_pedido,
            u.nombre AS nombre_usuario,  
            p.responsable,
            pr.nombre AS nombre_producto,  
            p.fecha_pedido, 
            p.cantidad, 
            p.unidad_de_medida,
            p.caracteristicas
        FROM 
            pedidos p
        JOIN 
            usuarios u ON p.id_usuario = u.id_usuario
        JOIN 
            productos pr ON p.id_producto = pr.id_producto;  

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
(93, 20, 'Prueba', 49, '2024-12-16 15:46:25', 9, 'KL', 'No aplica'),
(94, 12, 'Diciembre 2.0', 60, '2024-12-16 15:46:57', 8, 'GR', 'No aplica'),
(101, NULL, 'Julio', 43, '2024-12-17 15:09:08', 3, 'GR', 'No aplica'),
(105, 20, 'Jhoan Monsalve', 49, '2024-12-18 16:50:15', 1, 'KL', 'No aplica'),
(106, 20, 'Jhoan Monsalve', 49, '2024-12-18 16:51:42', 6, 'KL', 'Maduro'),
(107, 20, 'Jhoan Monsalve', 55, '2024-12-18 16:51:51', 5, 'GR', 'No aplica'),
(108, 20, 'Jhoan Monsalve', 59, '2024-12-18 16:52:00', 7, 'KL', 'No aplica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `unidad_de_medida` varchar(50) NOT NULL,
  `precio` decimal(10,3) NOT NULL,
  `disponibilidad` varchar(20) NOT NULL,
  `imagen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `unidad_de_medida`, `precio`, `disponibilidad`, `imagen`) VALUES
(43, 'Aji Dulce', 'GR', 0.000, 'AGOTADO', 'https://ricuracostena.com.co/wp-content/uploads/2022/06/112.jpg'),
(49, 'jhoan', 'KL', 15.000, 'DISPONIBLE', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSE_ZQVi0Q8Q2E5g-J4qn9hEu8fB4eeCpxb7Ew1J3c0YG014mNaf6NQy0GK2P9WIjjimPP-ZGCv2_T9K4Aa3G9QXeXHdgoA7anzRewvIog'),
(50, 'jhoan', 'KL', 15.000, 'AGOTADO', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSE_ZQVi0Q8Q2E5g-J4qn9hEu8fB4eeCpxb7Ew1J3c0YG014mNaf6NQy0GK2P9WIjjimPP-ZGCv2_T9K4Aa3G9QXeXHdgoA7anzRewvIog'),
(51, 'jhoan', 'KL', 15.000, 'DISPONIBLE', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSE_ZQVi0Q8Q2E5g-J4qn9hEu8fB4eeCpxb7Ew1J3c0YG014mNaf6NQy0GK2P9WIjjimPP-ZGCv2_T9K4Aa3G9QXeXHdgoA7anzRewvIog'),
(52, 'jhoan', 'KL', 15.000, 'AGOTADO', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSE_ZQVi0Q8Q2E5g-J4qn9hEu8fB4eeCpxb7Ew1J3c0YG014mNaf6NQy0GK2P9WIjjimPP-ZGCv2_T9K4Aa3G9QXeXHdgoA7anzRewvIog'),
(53, 'jhoan', 'KL', 15.000, 'DISPONIBLE', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSE_ZQVi0Q8Q2E5g-J4qn9hEu8fB4eeCpxb7Ew1J3c0YG014mNaf6NQy0GK2P9WIjjimPP-ZGCv2_T9K4Aa3G9QXeXHdgoA7anzRewvIog'),
(55, 'Manzana 2', 'GR', 20.000, 'DISPONIBLE', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSE_ZQVi0Q8Q2E5g-J4qn9hEu8fB4eeCpxb7Ew1J3c0YG014mNaf6NQy0GK2P9WIjjimPP-ZGCv2_T9K4Aa3G9QXeXHdgoA7anzRewvIog'),
(56, 'Cebolla Original 2.0', 'GR', 0.000, 'AGOTADO', 'qawsedr'),
(57, 'Manzana 2', 'GR', 20.000, 'DISPONIBLE', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSE_ZQVi0Q8Q2E5g-J4qn9hEu8fB4eeCpxb7Ew1J3c0YG014mNaf6NQy0GK2P9WIjjimPP-ZGCv2_T9K4Aa3G9QXeXHdgoA7anzRewvIog'),
(58, 'Banano', 'GR', 18.000, 'AGOTADO', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxASDxAQEBMQEBAQDxASDxAQEA8PEA8QFRIWFhURFhUYHSggGBolGxUVITEhJSkrLi4uFx8zODMsNygtLisBCgoKDg0OGhAQGy0lHR8tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLf/AABEIAOEA4QMBEQACEQEDEQH/xAAcAAEAAgMBAQEAAAAAAAAAAAAAAwUCBAYBBwj/xAA7EAACAQMBBQUGBAMJAQAAAAAAAQIDBBEFEiExQVEGE2FxkSIygaHB0UJSgrEjYnIHFBUzQ5Ky4fAW/8QAGgEBAAMBAQEAAAAAAAAAAAAAAAIDBAEFBv/EAC0RAQACAgEDBAAFBAMBAAAAAAABAgMRBBIhMQUTQVEUIjJhkXGBobFCwfEz/9oADAMBAAIRAxEAPwD7iAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADR1fUY29KVSSlJ8IQj705vhFdPN7kU589MNeq89kqUm86hraNqlSrHaqxhDPBQcpKPg5NLa88IxYPUa5J7xqFt8PSt8npbUB0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAOb7U1MyhD8sXJ+bf/XzPnfW77mtPru2cWPMtfSrnHs8n+54vGz9FumV+Wm+66oV2vse3g5dqT28MtqRLfp1E1lHuYstcleqGeYmJZlrgAAAAAAAAAAAAAAAAAAAAAAAAANHV9Up29PbntScpKMKcMOdST5RTaXDLbzuSbKs2amGvXeeyVKTadQ906/7yKco7Df4dra+GcFGDmUyzrx9JXxzVz3aKX8afhs/8'),
(59, 'Prueba2', 'KL', 17.000, 'DISPONIBLE', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxESEhMSEBIQFRASEBUQDw8PEA8QDxIVFRYWFhUVFRUYHSgiGBolGxUVITEhJikrLi4uFx8zODMsNygtLisBCgoKDg0OGxAQGi0lICUtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAKEBOQMBEQACEQEDEQH/xAAbAAEAAgMBAQAAAAAAAAAAAAAABAUCAwYBB//EADUQAAIBAgMFBgUDBAMAAAAAAAABAgMRBCExBRJBUXEGImGBkaETMrHR4UJiwQdSgvAUI5L/xAAZAQEAAwEBAAAAAAAAAAAAAAAAAgMEAQX/xAAvEQEAAgIBBAADBwQDAQAAAAAAAQIDESEEEjFBEyJRBTJhcYGR8EKhsdEVI8EU/9oADAMBAAIRAxEAPwD7iAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADGd7O1r2yvpfxOTvXDsa3yrcDtulNJSnCNTvKcN5d3dk43d+DaM2Dqq5I58+/waMvTWpPEcellCaejT6O5piYnwzzEx5ZHXAABhUqxj8zS6kbXrXzKVazbxCHU2pBaKUuisvczW6zHHjcr69LefPCHW261pBecrme32hPqrRXoY9yr6vaaov00/NS+5T/AMjk+kLY6Cn1ltw3a6N7VabX7oPeXoy2n2lH9cfshf7On+if3X+DxlOqt6nJSXG2q6rgehjy0yRus7YMmK+OdWjTeWKwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAfPO1nYSpOc8RhKi31eaotZt6tRlfU8nN9n+bV/Z6/T/aEcVv+7HYO06nw03vRqw7lSLupJrn+TBXJbHPy8S15MNbeeYdDhtvT0ajLr3X6rL2NeP7RyR5jf8AZjv0FPXCzp7UT/Q/VW9TbXrItH3WS3SzHsnjJPRW6'),
(60, 'Aji manzana', 'GR', 50.000, 'AGOTADO', 'https://lavaquita.co/cdn/shop/products/76b6170a-f1e1-4a92-8622-cee94a659b91_700x700.png?v=1622197616'),
(65, 'Manzana 2', 'GR', 20.000, 'DISPONIBLE', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSE_ZQVi0Q8Q2E5g-J4qn9hEu8fB4eeCpxb7Ew1J3c0YG014mNaf6NQy0GK2P9WIjjimPP-ZGCv2_T9K4Aa3G9QXeXHdgoA7anzRewvIog');

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
(8, 'pruebacrear', 'crear', '$2b$04$rLTuiyzCBn8KJ/dSMuvF8uRrUSzGjv0LPKuxCqZozlUlhJpmdqtwm', 'Proveedor'),
(10, 'pruebacrear', 'crear', '$2b$04$j4DEt/R8UVTzXH8P8rqNqeHKRXKZt6KzyV1IcfDVZvK9AG4UdGT9u', 'Proveedor'),
(12, 'Jhoan', 'Jhoan212', '$2b$04$OobhiHGwY62kOxv5EWJgjuyRBD.QAEywCEL6Mktnotxi0pxoTVISe', 'Cliente'),
(18, 'JhoanProveedor', 'Jhoan Monsalve Gallego', '$2b$04$j.cUipyCW7qieYJuiGOhYezHq6Aj4R87CpQg2jq4UpKX8RDPz3Ob.', 'Proveedor'),
(20, 'JhoanUsuario', 'Jhoan', '$2b$04$if5qfq0Mjeh2q1GrFpAqq.5SVoMI6rLlejJej.yVqgVfn3B2xl5Fi', 'Cliente');

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
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
