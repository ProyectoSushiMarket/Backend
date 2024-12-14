-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-12-2024 a las 05:05:05
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
  `unidad_de_medida` varchar(50) NOT NULL,
  `precio` decimal(10,3) NOT NULL,
  `imagen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `unidad_de_medida`, `precio`, `imagen`) VALUES
(43, 'Aji Dulce', 'GR', 0.000, 'https://ricuracostena.com.co/wp-content/uploads/2022/06/112.jpg'),
(49, 'jhoan', 'KL', 15.000, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSE_ZQVi0Q8Q2E5g-J4qn9hEu8fB4eeCpxb7Ew1J3c0YG014mNaf6NQy0GK2P9WIjjimPP-ZGCv2_T9K4Aa3G9QXeXHdgoA7anzRewvIog'),
(50, 'jhoan', 'KL', 15.000, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSE_ZQVi0Q8Q2E5g-J4qn9hEu8fB4eeCpxb7Ew1J3c0YG014mNaf6NQy0GK2P9WIjjimPP-ZGCv2_T9K4Aa3G9QXeXHdgoA7anzRewvIog'),
(51, 'jhoan', 'KL', 15.000, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSE_ZQVi0Q8Q2E5g-J4qn9hEu8fB4eeCpxb7Ew1J3c0YG014mNaf6NQy0GK2P9WIjjimPP-ZGCv2_T9K4Aa3G9QXeXHdgoA7anzRewvIog'),
(52, 'jhoan', 'KL', 15.000, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSE_ZQVi0Q8Q2E5g-J4qn9hEu8fB4eeCpxb7Ew1J3c0YG014mNaf6NQy0GK2P9WIjjimPP-ZGCv2_T9K4Aa3G9QXeXHdgoA7anzRewvIog'),
(53, 'jhoan', 'KL', 15.000, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSE_ZQVi0Q8Q2E5g-J4qn9hEu8fB4eeCpxb7Ew1J3c0YG014mNaf6NQy0GK2P9WIjjimPP-ZGCv2_T9K4Aa3G9QXeXHdgoA7anzRewvIog'),
(54, 'Prueba', 'GR', 15.000, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSuyPsPC1z11hsOAA_qJWph-h_tq7BSagzHH8jwS6v_yeqp-GWnVJqQyVL4qX0R94w4aoMqaz2EwDo25NcIuFa7Hw'),
(55, 'Aguacate', 'GR', 17.000, 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxESEhMSEBIQFRASEBUQDw8PEA8QDxIVFRYWFhUVFRUYHSgiGBolGxUVITEhJikrLi4uFx8zODMsNygtLisBCgoKDg0OGxAQGi0lICUtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAKEBOQMBEQACEQEDEQH/xAAbAAEAAgMBAQAAAAAAAAAAAAAABAUCAwYBB//EADUQAAIBAgMFBgUDBAMAAAAAAAABAgMRBCExBRJBUXEGImGBkaETMrHR4UJiwQdSgvAUI5L/xAAZAQEAAwEBAAAAAAAAAAAAAAAAAgMEAQX/xAAvEQEAAgIBBAADBwQDAQAAAAAAAQIDESEEEjFBEyJRBTJhcYGR8EKhsdEVI8EU/9oADAMBAAIRAxEAPwD7iAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADGd7O1r2yvpfxOTvXDsa3yrcDtulNJSnCNTvKcN5d3dk43d+DaM2Dqq5I58+/waMvTWpPEcellCaejT6O5piYnwzzEx5ZHXAABhUqxj8zS6kbXrXzKVazbxCHU2pBaKUuisvczW6zHHjcr69LefPCHW261pBecrme32hPqrRXoY9yr6vaaov00/NS+5T/AMjk+kLY6Cn1ltw3a6N7VabX7oPeXoy2n2lH9cfshf7On+if3X+DxlOqt6nJSXG2q6rgehjy0yRus7YMmK+OdWjTeWKwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAfPO1nYSpOc8RhKi31eaotZt6tRlfU8nN9n+bV/Z6/T/aEcVv+7HYO06nw03vRqw7lSLupJrn+TBXJbHPy8S15MNbeeYdDhtvT0ajLr3X6rL2NeP7RyR5jf8AZjv0FPXCzp7UT/Q/VW9TbXrItH3WS3SzHsnjJPRW6'),
(56, 'Cebolla 2', 'KL', 0.000, 'qawsedr'),
(57, 'Aguacate', 'GR', 25.000, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSuyPsPC1z11hsOAA_qJWph-h_tq7BSagzHH8jwS6v_yeqp-GWnVJqQyVL4qX0R94w4aoMqaz2EwDo25NcIuFa7Hw');

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
  MODIFY `id_producto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
