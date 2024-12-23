-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-12-2024 a las 23:36:35
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
CREATE PROCEDURE `SP_ACTUALIZAR_PEDIDO` (IN `_ID_PEDIDO` INT(10), IN `_ESTADO` ENUM('pendiente','procesado','enviado','cancelado'))   BEGIN
	UPDATE `pedidos` SET estado = _ESTADO WHERE _ID_PEDIDO = id_pedido;
END$$

CREATE PROCEDURE `SP_BUSCAR_PEDIDO` (IN `_ID_USUARIO` INT(11))   BEGIN

SELECT id_usuario, id_producto, fecha_pedido, cantidad, unidad_de_medida, precio, caracteristicas FROM pedidos WHERE id_usuario = _ID_USUARIO;

END$$

CREATE PROCEDURE `SP_BUSCAR_USUARIO` (IN `_USUARIO` VARCHAR(100))   BEGIN

SELECT id_usuario, usuario, contrasena, rol FROM usuarios WHERE usuario = _USUARIO LIMIT 1;

END$$

CREATE PROCEDURE `SP_CONTADOR_PEDIDO` ()   BEGIN
	SELECT COUNT(*) id_pedido FROM pedidos;
END$$

CREATE PROCEDURE `SP_CREAR_PEDIDO` (IN `_ID_USUARIO` INT(11), IN `_RESPONSABLE` VARCHAR(20), IN `_ID_PRODUCTO` INT(11), IN `_FECHA_PEDIDO` DATETIME, IN `_CANTIDAD` INT(11), IN `_UNIDADMEDIDA` VARCHAR(50), IN `_CARACTERISTICAS` VARCHAR(100))   BEGIN

INSERT INTO pedidos(id_usuario, responsable, id_producto, fecha_pedido, cantidad, unidad_de_medida, caracteristicas) VALUES
(_ID_USUARIO, _RESPONSABLE, _ID_PRODUCTO, _FECHA_PEDIDO, _CANTIDAD, _UNIDADMEDIDA, _CARACTERISTICAS);

END$$

CREATE PROCEDURE `SP_CREAR_PRODUCTO` (IN `_NOMBRE` VARCHAR(100), IN `_UNIDADDEMEDIDA` VARCHAR(50), IN `_DISPONIBILIDAD` VARCHAR(20), IN `_IMAGEN` TEXT)   BEGIN

INSERT INTO productos(nombre, unidad_de_medida, disponibilidad, imagen) VALUES (_NOMBRE, _UNIDADDEMEDIDA, _DISPONIBILIDAD, _IMAGEN);

END$$

CREATE PROCEDURE `SP_CREAR_USUARIO` (IN `_NOMBRE` VARCHAR(100), IN `_USUARIO` VARCHAR(100), IN `_CONTRASENA` VARCHAR(500), IN `_ROL` VARCHAR(15))   BEGIN

INSERT INTO usuarios(nombre, usuario, contrasena, rol) VALUES (_NOMBRE, _USUARIO, _CONTRASENA, _ROL);

END$$

CREATE PROCEDURE `SP_ELIMINAR_PEDIDO` (IN `_ID_PEDIDO` INT(10))   BEGIN
	DELETE FROM pedidos WHERE id_pedido = _ID_PEDIDO;
END$$

CREATE PROCEDURE `SP_ELIMINAR_PRODUCTO` (IN `_NOMBRE` VARCHAR(100))   BEGIN

DELETE FROM productos WHERE nombre = _NOMBRE;

END$$

CREATE PROCEDURE `SP_ELIMINAR_USUARIO` (IN `_ID_USUARIO` INT(10))   BEGIN

DELETE FROM usuarios WHERE id_usuario = _ID_USUARIO;

END$$

CREATE PROCEDURE `SP_LISTAR_PEDIDO` ()   SELECT 
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
    productos prod ON p.id_producto = prod.id_producto
ORDER BY 
    p.fecha_pedido ASC, u.nombre ASC$$

CREATE PROCEDURE `SP_LISTAR_PRODUCTO` ()   BEGIN

SELECT * FROM productos;


END$$

CREATE PROCEDURE `SP_LISTAR_USUARIO` ()   BEGIN

SELECT * FROM usuarios;

END$$

CREATE PROCEDURE `SP_MODIFICAR_PRODUCTO` (IN `_NOMBRE` VARCHAR(100), IN `_NOMBRE_NUEVO` VARCHAR(100), IN `_UNIDADMEDIDA` VARCHAR(50), IN `_DISPONIBILIDAD` VARCHAR(20))   BEGIN
    UPDATE productos 
    SET 
        nombre = _NOMBRE_NUEVO, 
        unidad_de_medida = _UNIDADMEDIDA,
        disponibilidad = _DISPONIBILIDAD
    WHERE nombre = _NOMBRE;

    -- Devuelve explícitamente el número de filas afectadas
    SELECT ROW_COUNT() AS affectedRows;
END$$

CREATE PROCEDURE `SP_MODIFICAR_USUARIO` (IN `_ID_USUARIO` INT(10), IN `_NOMBRE` VARCHAR(100), IN `_USUARIO` VARCHAR(100), IN `_CONTRASENA` VARCHAR(500), IN `_ROl` VARCHAR(15))   BEGIN

UPDATE usuarios SET nombre = _NOMBRE, usuario = _USUARIO, contrasena = _CONTRASENA, rol = _ROL WHERE id_usuario = _ID_USUARIO;

END$$

CREATE PROCEDURE `SP_MOSTRAR_PRODUCTO` (IN `_ID_PRODUCTO` INT(10))   BEGIN

SELECT id_producto, nombre, unidad_de_medida, disponibilidad, imagen FROM productos WHERE id_producto = _ID_PRODUCTO;

END$$

CREATE PROCEDURE `SP_MOSTRAR_USUARIO` (IN `_ID_USUARIO` INT(10))   BEGIN

SELECT id_usuario, usuario, contrasena, rol FROM usuarios WHERE id_usuario = _ID_USUARIO;

END$$

CREATE PROCEDURE `SP_OBTENER_PEDIDOS_USUARIOS` (IN `p_rol` VARCHAR(15), IN `p_usuario` VARCHAR(100))   BEGIN
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
            u.id_usuario = p_usuario AND u.rol = p_rol
        ORDER BY 
            p.fecha_pedido ASC;  -- Ordena por fecha de pedido, más antiguos primero

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
            productos pr ON p.id_producto = pr.id_producto
        ORDER BY 
            p.fecha_pedido ASC;  -- Ordena por fecha de pedido, más antiguos primero

    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Rol no válido. Use Cliente o Proveedor.';
    END IF;
END$$

CREATE PROCEDURE `SP_VERIFICAR_ROLES` (IN `_USUARIO` VARCHAR(100))   BEGIN

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
(1, 4, 'Jhoan Monsalve', 4, '2024-12-20 13:35:10', 9, 'GR', 'No aplica'),
(2, 4, 'Jhoan Monsalve', 3, '2024-12-20 13:35:30', 9, 'GR', 'No aplica'),
(3, 3, 'Jhoan Monsalve', 5, '2024-12-20 13:36:15', 9, 'GR', 'No aplica'),
(4, 3, 'Jhoan Gallego', 66, '2024-12-20 13:36:26', 5, 'UND', 'No aplica'),
(5, 3, 'Jhoan Gallego', 64, '2024-12-20 13:36:35', 5, 'GR', 'No aplica'),
(6, 3, 'Jhoan Gallego', 59, '2024-12-20 13:36:43', 3, 'UND', 'No aplica'),
(7, 3, 'Jhoan Gallego', 61, '2024-12-20 13:36:50', 6, 'GR', 'No aplica'),
(8, 3, 'Jhoan Gallego', 48, '2024-12-20 13:37:03', 8, 'GR', 'No aplica'),
(9, 3, 'Jhoan Gallego', 54, '2024-12-20 13:37:11', 9, 'UND', 'No aplica'),
(10, 11, 'Prueba', 6, '2024-12-20 13:38:29', 8, 'UND', 'Maduro'),
(11, 11, 'Prueba', 1, '2024-12-20 13:38:41', 3, 'UND', 'No aplica'),
(12, 11, 'Prueba', 7, '2024-12-20 13:38:48', 1, 'GR', 'Pinton'),
(13, 11, 'Prueba', 18, '2024-12-20 13:38:57', 7, 'UND', 'Maduro'),
(14, 11, 'Prueba', 24, '2024-12-20 13:39:06', 8, 'UND', 'No aplica'),
(15, 11, 'Prueba', 26, '2024-12-20 13:39:14', 8, 'UND', 'No aplica'),
(16, 11, 'Prueba', 32, '2024-12-20 13:39:21', 6, 'UND', 'No aplica'),
(17, 11, 'Prueba', 35, '2024-12-20 13:39:30', 7, 'UND', 'No aplica'),
(18, 11, 'Prueba', 43, '2024-12-20 13:39:38', 5, 'UND', 'No aplica'),
(19, 11, 'Prueba', 56, '2024-12-20 13:39:45', 2, 'UND', 'No aplica'),
(20, 6, 'Prueba', 5, '2024-12-20 13:46:42', 7, 'GR', 'Maduro'),
(21, 6, 'Prueba', 6, '2024-12-20 13:47:50', 2, 'UND', 'Pinton'),
(22, 6, 'Prueba', 1, '2024-12-20 13:47:59', 2, 'UND', 'No aplica'),
(23, 6, 'Prueba', 7, '2024-12-20 13:48:07', 1, 'GR', 'No aplica'),
(24, 6, 'Prueba', 36, '2024-12-20 13:48:31', 1, 'GR', 'No aplica'),
(25, 6, 'Prueba', 6, '2024-12-20 14:10:49', 8, 'UND', 'Maduro'),
(26, 6, 'Prueba', 19, '2024-12-20 14:10:57', 7, 'GR', 'No aplica'),
(27, 6, 'Prueba', 15, '2024-12-20 14:11:07', 6, 'UND', 'No aplica'),
(28, 6, 'Prueba', 21, '2024-12-20 14:11:16', 1, 'UND', 'No aplica'),
(29, 12, 'Diciembre 2.0', 1, '2024-12-20 14:17:56', 2, 'UND', 'Pinton'),
(30, 12, 'Prueba', 10, '2024-12-20 14:18:06', 1, 'GR', 'No aplica'),
(31, 12, 'Prueba', 14, '2024-12-20 14:18:12', 1, 'UND', 'No aplica'),
(32, 12, 'Prueba', 18, '2024-12-20 14:18:19', 1, 'UND', 'No aplica'),
(33, 12, 'Jhoan', 64, '2024-12-20 14:18:26', 3, 'GR', 'No aplica'),
(34, 12, 'Prueba', 66, '2024-12-20 14:18:37', 7, 'UND', 'No aplica'),
(35, 12, 'Jhoan', 1, '2024-12-20 14:18:47', 5, 'UND', 'No aplica'),
(36, 12, 'Prueba', 5, '2024-12-20 14:18:58', 1, 'GR', 'No aplica'),
(37, 12, 'Prueba', 2, '2024-12-20 14:19:17', 1, 'GR', 'No aplica'),
(38, 12, 'Prueba', 6, '2024-12-20 14:19:55', 2, 'UND', 'No aplica'),
(39, 12, 'Jhoan Monsalve', 5, '2024-12-20 14:25:14', 1, 'GR', 'Maduro'),
(40, 5, 'Zona 2', 14, '2024-12-20 14:29:10', 1, 'UND', 'No aplica'),
(41, 5, 'Zona 2', 33, '2024-12-20 14:29:29', 8, 'UND', 'Maduro'),
(42, 5, 'Zona 2', 64, '2024-12-20 14:29:38', 9, 'GR', 'No aplica'),
(43, 5, 'Zona 2', 66, '2024-12-20 14:29:44', 7, 'UND', 'No aplica'),
(44, 5, 'Zona 2', 65, '2024-12-20 14:29:49', 1, 'UND', 'Maduro'),
(45, 5, 'Zona 2', 62, '2024-12-20 14:29:56', 1, 'UND', 'No aplica'),
(46, 5, 'Zona 2', 60, '2024-12-20 14:30:02', 8, 'UND', 'Maduro'),
(47, 5, 'Zona 2', 61, '2024-12-20 14:30:44', 2, 'GR', 'Maduro'),
(48, 5, 'Zona 2', 63, '2024-12-20 14:30:49', 1, 'GR', 'Maduro'),
(49, 5, 'Zona 2', 4, '2024-12-20 14:31:08', 2, 'GR', 'Pinton'),
(50, 5, 'Zona 2', 1, '2024-12-20 14:31:20', 2, 'UND', 'Maduro'),
(51, 2, 'amsterdam', 9, '2024-12-20 14:42:23', 2, 'GR', 'Maduro'),
(52, 2, 'amsterdam', 20, '2024-12-20 14:42:51', 2, 'UND', 'Pinton'),
(53, 2, 'amsterdam', 7, '2024-12-20 14:43:06', 1, 'GR', 'No aplica'),
(54, 2, 'amsterdam', 40, '2024-12-20 14:43:13', 1, 'UND', 'No aplica'),
(55, 2, 'amsterdam', 55, '2024-12-20 14:43:19', 1, 'GR', 'Maduro'),
(56, 2, 'amsterdam', 60, '2024-12-20 14:43:24', 1, 'UND', 'Maduro'),
(57, 2, 'amsterdam', 61, '2024-12-20 14:43:30', 1, 'GR', 'No aplica'),
(58, 2, 'amsterdam', 63, '2024-12-20 14:43:35', 2, 'GR', 'No aplica'),
(59, 2, 'amsterdam', 64, '2024-12-20 14:43:40', 2, 'GR', 'Maduro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `unidad_de_medida` varchar(50) NOT NULL,
  `disponibilidad` varchar(20) NOT NULL,
  `imagen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `unidad_de_medida`, `disponibilidad`, `imagen`) VALUES
(1, 'Aguacate', 'UND', 'DISPONIBLE', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbY4XScUa4Jhno5r1L6pgRMJXLPg4dWb7n6g&s'),
(2, 'Albahaca', 'GR', 'DISPONIBLE', 'https://cdn.portalfruticola.com/2020/04/7e2db098-albahaca-basil-adobestock_81129315-scaled.jpeg'),
(3, 'Ají Dulce', 'GR', 'DISPONIBLE', 'https://mrbatatacolombia.com/wp-content/uploads/2022/02/dulce-1-1.jpg'),
(4, 'Ají Rocoto', 'GR', 'DISPONIBLE', 'https://villavoexpress.com/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsiZGF0YSI6MzAxNjAsInB1ciI6ImJsb2JfaWQifX0=--36f6f3d2ff77ea60c59a485de800c89b40498d5f/eyJfcmFpbHMiOnsiZGF0YSI6eyJmb3JtYXQiOiJqcGciLCJyZXNpemVfdG9fZml0IjpbODAwLDgwMF19LCJwdXIiOiJ2YXJpYXRpb24ifX0=--1420d7fd3d20057726f0ef3c0043db24ca0403be/aji-ricoto.jpg?locale=es'),
(5, 'Ajo Importado', 'GR', 'DISPONIBLE', 'https://acdn.mitiendanube.com/stores/001/252/117/products/ajo1-1b3c562cd1c2a15de215939057774345-640-0.png'),
(6, 'Brocoli', 'UND', 'DISPONIBLE', 'https://mercadomadrid.com.co/11082-superlarge_default_2x/brocoli-kilo.jpg'),
(7, 'Cebolla Puerro', 'GR', 'DISPONIBLE', 'https://lavaquita.co/cdn/shop/products/2ea7df90-f8d4-4412-8d9a-1f6658253876_700x700.png?v=1622197623'),
(9, 'Cebolla Blanca', 'GR', 'DISPONIBLE', 'https://lavaquita.co/cdn/shop/products/a2be3a55-f2da-4708-8461-ff66b3d2a659_700x700.png?v=1622197621'),
(10, 'Cebolla Morada', 'GR', 'DISPONIBLE', 'https://distribuidoractcpanama.com/wp-content/uploads/2020/09/cebolla-morada-450x450-1.jpg'),
(11, 'Cebolla Rama', 'GR', 'DISPONIBLE', 'https://supermercadolaestacion.com/36027-thickbox_default/cebolla-rama.jpg'),
(13, 'Cebollin', 'GR', 'DISPONIBLE', 'https://imagedelivery.net/4fYuQyy-r8_rpBpcY7lH_A/tottusCL/05014124_1/w=800,h=800,fit=pad'),
(14, 'Champiñones bandeja X500', 'UND', 'DISPONIBLE', 'https://maxitenjo.com.co/cdn/shop/products/1435529_800x.jpg?v=1597421569'),
(15, 'Champiñones bandeja X1000', 'UND', 'DISPONIBLE', 'https://vaquitaexpress.com.co/media/catalog/product/cache/e89ece728e3939ca368b457071d3c0be/2/0/20700041_33.jpg'),
(16, 'Cilantro', 'GR', 'DISPONIBLE', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPCm2Y0HgHSSsXy92KoyZiBay4Hw-cqUzBCQ&s'),
(17, 'Coliflor', 'UND', 'DISPONIBLE', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7z3TzwWCvS3W2LRsT0CuIKl1QYg9GjdO2Fw&s'),
(18, 'Colchina', 'UND', 'DISPONIBLE', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjMNuSWtA7121sBdrDvUp6sYV4L1o3Pp6eWQ&s'),
(19, 'Esparragos', 'GR', 'DISPONIBLE', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1enXlbVLMOTAXnlBmwHB8wEWTKYuNLY57Fg&s'),
(20, 'Fresa Bandeja X500 GRS', 'UND', 'DISPONIBLE', 'https://mercaldas.vtexassets.com/arquivos/ids/230337/fresas-x500-g_4644.jpg?v=637840665070730000'),
(21, 'Germinado de alfalfa X200 GRS', 'UND', 'DISPONIBLE', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzg3F3OJl3KVPouUp9ok5a51HjVWMz2vWUmw&s'),
(22, 'Guisantes X200 GRS', 'UND', 'DISPONIBLE', 'https://exitocol.vtexassets.com/arquivos/ids/25416854/Guisantes-X-200gr-626713_a.jpg?v=638657253367700000'),
(23, 'Jengibre', 'GR', 'DISPONIBLE', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO5c-pvrFChz2TFkdQTIcE3E9VmynHGNeWSg&s'),
(24, 'Kiwi', 'UND', 'DISPONIBLE', 'https://imag.bonviveur.com/un-kiwi-entero-y-corte-transversal-de-un-kiwi.jpg'),
(25, 'Lechuga Morada', 'UND', 'DISPONIBLE', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7KoxmAOuyBqt19talf1qxf9Ai828krHqqrA&s'),
(26, 'Lechuga Verde', 'UND', 'DISPONIBLE', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQKVwlzhfLab2Z_BsxwY5bdXd-vFPISr0lFw&s'),
(27, 'Limón tahiti', 'GR', 'DISPONIBLE', 'https://sembrandoconfianza.com/wp-content/uploads/2022/04/Limon-Tahiti.jpg'),
(28, 'Limón Pajarito', 'GR', 'DISPONIBLE', 'https://tienda.comersano.co/162-large_default/limon-pajarito.jpg'),
(29, 'Limón Mandarino', 'GR', 'DISPONIBLE', 'https://vaquitaexpress.com.co/media/catalog/product/cache/e89ece728e3939ca368b457071d3c0be/1/8/189_32.jpg'),
(30, 'Limonaria', 'GR', 'DISPONIBLE', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgjY_mGOYitlRAxe9G3IqOOir7o2ET2tiQKg&s'),
(31, 'Maíz Blanco', 'GR', 'DISPONIBLE', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwpDQ4c6deCcMRY8EeLjghLerL2QU13CnMoA&s'),
(32, 'Mango Tommy', 'UND', 'DISPONIBLE', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQ9DCPX4sr-0VOliuG2DP7ux5MQOfoLnrxjw&s'),
(33, 'Maracuyá', 'UND', 'DISPONIBLE', 'https://5aldia.cl/wp-content/uploads/2021/11/maracuya.webp'),
(34, 'Murrapo', 'UND', 'DISPONIBLE', 'https://exitocol.vtexassets.com/arquivos/ids/25416142/MURRAPO-UNIDAD-1601872_a.jpg?v=638657245962500000'),
(35, 'Naranja Tangelo', 'UND', 'DISPONIBLE', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCxlJLWQkTchK25ZucwI8CCcBsRBwsN4tl5g&s'),
(36, 'Papa Capira', 'GR', 'DISPONIBLE', 'https://carulla.vtexassets.com/arquivos/ids/14872376/PAPA-CAPIRA-990013_a.jpg?v=638457950893870000'),
(38, 'Pepino', 'UND', 'DISPONIBLE', 'https://agroactivocol.com/wp-content/uploads/2020/08/PEPINO-POINSETT.jpg.webp'),
(39, 'Perejil', 'GR', 'DISPONIBLE', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZSOBy-AVmV9D2zh1Fzl5OrVeK_6PzgWCx5Q&s'),
(40, 'Pimentón Rojo', 'UND', 'DISPONIBLE', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTj__4iKTJhMppvk5_tOXh0yuOrR-bYaWGw4A&s'),
(41, 'Pimentón Amarillo', 'UND', 'DISPONIBLE', 'https://fruverhome.co/wp-content/uploads/2020/08/AMARILLO-1024x1024.jpg.webp'),
(42, 'Piña oro miel', 'UND', 'DISPONIBLE', 'https://vaquitaexpress.com.co/media/catalog/product/cache/e89ece728e3939ca368b457071d3c0be/2/5/255_32.jpg'),
(43, 'Mezclon', 'UND', 'DISPONIBLE', 'https://cdn.pixabay.com/photo/2015/11/29/11/35/vegetables-1068592_640.jpg'),
(44, 'Plátano Maduro', 'UND', 'DISPONIBLE', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm8toDAZfka4k7NseEzsf8f2EJzjUYzlV4Cw&s'),
(46, 'Plátano Verde', 'UND', 'DISPONIBLE', 'https://terrabad.co/wp-content/uploads/2020/09/platano-verde.jpg'),
(48, 'Remolacha', 'GR', 'DISPONIBLE', 'https://maxitenjo.com.co/cdn/shop/products/Remolacha-Por-Kg-1-236660_1024x.png?v=1597775398'),
(49, 'Rabano', 'GR', 'DISPONIBLE', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjRvIiFaqFezoHW9Ye8d9W0mxo4tfXkTT7Sw&s'),
(51, 'Repollo Morado', 'UND', 'DISPONIBLE', 'https://megatiendas.vtexassets.com/arquivos/ids/164234-800-450?v=638284928615330000&width=800&height=450&aspect=true'),
(54, 'Raíz China', 'UND', 'DISPONIBLE', 'https://eurosuper.vtexassets.com/arquivos/ids/172971-800-800?v=638316072865500000&width=800&height=800&aspect=true'),
(55, 'Romero', 'GR', 'DISPONIBLE', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4lN7IeYTYsQ-LsTv0iK9aDwbhnS8rmKtZWA&s'),
(56, 'Sandia Baby', 'UND', 'DISPONIBLE', 'https://yomercofacil.com/wp-content/uploads/2018/06/sandia.jpg'),
(59, 'Huevos X30 AA', 'UND', 'DISPONIBLE', 'https://villavoexpress.com/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsiZGF0YSI6NDI2MiwicHVyIjoiYmxvYl9pZCJ9fQ==--086a00c5a4502742d805d622aaae2da49dbdc37c/eyJfcmFpbHMiOnsiZGF0YSI6eyJmb3JtYXQiOiJqcGciLCJyZXNpemVfdG9fZml0IjpbODAwLDgwMF19LCJwdXIiOiJ2YXJpYXRpb24ifX0=--1420d7fd3d20057726f0ef3c0043db24ca0403be/huevos.jpg?locale=es'),
(60, 'Huevos X15 AA', 'UND', 'DISPONIBLE', 'https://mistiendas.com.co/23348-large_default/huevos-fresquesitos-huevos-tipo-aa-rojo-x15.jpg'),
(61, 'Yacón', 'GR', 'DISPONIBLE', 'https://comedelahuerta.com/wp-content/uploads/2020/10/Yacon-Ecologico.jpg'),
(62, 'Uchuva X250', 'UND', 'DISPONIBLE', 'https://carulla.vtexassets.com/arquivos/ids/17385916/UCHUVA-BANDEJA-1623_a.jpg?v=638609265332500000'),
(63, 'Yerbabuena', 'GR', 'DISPONIBLE', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNT994-VpgK1IAIvA09IHwNUOYy_K01ErwcQ&s'),
(64, 'Zanahoria', 'GR', 'DISPONIBLE', 'https://mistiendas.com.co/4-large_default/zanahoria-selecta-kilo.jpg'),
(65, 'Zuccini', 'UND', 'DISPONIBLE', 'https://lavaquita.co/cdn/shop/products/9a50415c-2c1b-4b4f-8965-522634fbd588_1024x1024.png?v=1622197531'),
(66, 'Apio', 'UND', 'DISPONIBLE', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM8RNPbHzp7M1sTTnzcmW3JlM6ukaxWTEN5A&s');

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
(1, 'JaiberJM', 'Jaiber', '$2b$04$4JstMM5QTNBJWvIXdhkYgOpg/tOtslDHb7gc1OGf61E13Gg5EHBEa', 'Proveedor'),
(2, 'AmsterdamSM', 'Sushi Market Amsterdam', '$2b$04$8f.I89/zkdgDfs.aFtimNesXkeNAYD/FzcfBmaeVhkvKmtJ/0/YhC', 'Cliente'),
(3, 'TesoroSM', 'Sushi Market Tesoro', '$2b$04$EOP2QLQRBPuJbfpGyHEv2euXRcl7Lj.PhlYBqaMzYm8SjduK2S.cG', 'Cliente'),
(4, 'SanlucasSM', 'Sushi Market San Lucas', '$2b$04$KGIHJgKl2zACXoZ7Guf9N.C9Do73L/Dq2kXEBrfDuJLxqLFwwDJC2', 'Cliente'),
(5, 'Zona2SM', 'Sushi Market Zona 2', '$2b$04$obIdkGnaf2jjxuUVwGG2pey5Z19BiKNu0EeQmADNPuVJlxP7vf3/2', 'Cliente'),
(6, 'VivaenvigadoSM', 'Sushi Market Viva Envigado', '$2b$04$4VDX0UyzVxTm1yZHMyl5q.HZdgzFbAzUQxuq3O.1yb/qowCf4EYgK', 'Cliente'),
(7, 'ContenedoresSM', 'Sushi Market Contenedores', '$2b$04$RrUY18dKXZ9bZpuES5rBdumeQ/eu5IVbo94ux2dtltl5KKiNBl6om', 'Cliente'),
(8, 'CityplazaSM', 'Sushi Market City Plaza', '$2b$04$/Q//V8REzMfyzFfXTrcbJ.tbAK7IdPlK2gOgIsqmq/Wjkm4eEhAvm', 'Cliente'),
(9, 'LaurelesSM', 'Sushi Market Laureles ', '$2b$04$15F11HCyHjRkupcb2IeyfuosPj1kBF0KKyMJuhWu/daCTV6rRVtHm', 'Cliente'),
(10, 'ColoresSM', 'Sushi Market Colores', '$2b$04$oNcv70QTSviHPIx1BGl9luYX6AmyzzSPZCfKU0yEHA78WK4kQ6RYK', 'Cliente'),
(11, 'VivapalmasSM', 'Sushi Market Viva Palmas', '$2b$04$iyoNN3nEd1bGbuMafNF0hegGtE2WPZ9rHwMXD2Zt6IDhbA1HsAAAG', 'Cliente'),
(12, 'JardinesSM', 'Sushi Market Jardines', '$2b$04$tsJazZpYvMX3F86Us/B.3urCG8p05DN5T0APuQfhm2QgUxfPjAm4a', 'Cliente');

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
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
