-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-12-2024 a las 17:08:02
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
(15, 'Prueba', 2, 'KL', 'Maduro', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSuyPsPC1z11hsOAA_qJWph-h_tq7BSagzHH8jwS6v_yeqp-GWnVJqQyVL4qX0R94w4aoMqaz2EwDo25NcIuFa7Hw'),
(16, 'Prueba2', 2, 'KL', 'Maduro', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSuyPsPC1z11hsOAA_qJWph-h_tq7BSagzHH8jwS6v_yeqp-GWnVJqQyVL4qX0R94w4aoMqaz2EwDo25NcIuFa7Hw');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
