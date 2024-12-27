-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 24-12-2024 a las 16:28:52
-- Versión del servidor: 10.11.10-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u427794148_siembrafresca`
--

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
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
