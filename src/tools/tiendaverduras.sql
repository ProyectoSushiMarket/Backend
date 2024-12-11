-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-12-2024 a las 22:47:54
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
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"snap_to_grid\":\"off\",\"angular_direct\":\"direct\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"tiendaverduras\",\"table\":\"usuarios\"},{\"db\":\"tiendaverduras\",\"table\":\"pedidos\"},{\"db\":\"tiendaverduras\",\"table\":\"productos\"},{\"db\":\"tiendaverduras\",\"table\":\"clientes\"},{\"db\":\"tiendaverduras\",\"table\":\"proveedor\"},{\"db\":\"surprise\",\"table\":\"pedido\"},{\"db\":\"surprise\",\"table\":\"usuarios\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-12-11 21:47:52', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `surprise`
--
CREATE DATABASE IF NOT EXISTS `surprise` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `surprise`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idfacturas` int(10) NOT NULL,
  `idpedido` int(10) NOT NULL,
  `idusuario` int(10) NOT NULL,
  `idproducto` int(10) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `idmetodopago` int(10) NOT NULL,
  `total` int(100) NOT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idfacturas`, `idpedido`, `idusuario`, `idproducto`, `fecha`, `idmetodopago`, `total`, `estado`) VALUES
(68, 2, 31, 49, '2024-06-20 16:27:02', 2, 20000, 'Pagado'),
(71, 5, 28, 8, '2024-06-20 18:35:20', 1, 15000, 'Pagado'),
(76, 10, 29, 54, '2024-06-27 02:08:12', 2, 266664000, 'Pagado'),
(77, 11, 44, 15, '2024-06-27 03:28:16', 2, 800, 'Pagado'),
(78, 12, 29, 49, '2024-06-27 04:17:12', 2, 2000, 'Pagado'),
(81, 15, 36, 10, '2024-06-27 04:23:34', 2, 30000, 'Pagado'),
(82, 16, 36, 10, '2024-06-27 04:24:20', 2, 30000, 'Pagado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodopago`
--

CREATE TABLE `metodopago` (
  `idmetodopago` int(10) NOT NULL,
  `tipopago` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metodopago`
--

INSERT INTO `metodopago` (`idmetodopago`, `tipopago`) VALUES
(1, 'Efectivo'),
(2, 'Transferencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `Id_pedido` int(10) NOT NULL,
  `idusuario` int(10) NOT NULL,
  `idproducto` int(10) NOT NULL,
  `idmetodopago` int(10) NOT NULL,
  `hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cantidad` int(11) NOT NULL,
  `total` int(15) NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'Pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`Id_pedido`, `idusuario`, `idproducto`, `idmetodopago`, `hora`, `cantidad`, `total`, `estado`) VALUES
(2, 31, 49, 2, '2024-06-26 18:48:42', 1, 2, 'Pagado'),
(5, 28, 8, 1, '2024-06-26 16:02:25', 1, 0, 'Pagado'),
(10, 29, 54, 2, '2024-06-27 02:50:33', 22222, 2222, 'Pagado'),
(11, 44, 15, 2, '2024-06-27 04:02:03', 1, 20000, 'Pagado'),
(12, 29, 49, 2, '2024-06-27 04:18:00', 2, 10000, 'Pagado'),
(15, 36, 10, 2, '2024-06-27 04:23:57', 2, 22000000, 'Pagado'),
(16, 36, 10, 2, '2024-06-27 04:24:33', 2, 22000000, 'Pagado');

--
-- Disparadores `pedido`
--
DELIMITER $$
CREATE TRIGGER `generar_factura_despues_insert` AFTER INSERT ON `pedido` FOR EACH ROW BEGIN
	DECLARE valor_unitario int(100);
    DECLARE total_pedido int(100);
    
    -- Obtener el valor unitario del producto del pedido
    SELECT preciou INTO valor_unitario
    FROM productos
    WHERE idproducto = NEW.idproducto;
    
    -- Calcular el total del pedido
    SET total_pedido = NEW.cantidad * valor_unitario;
    
    -- Insertar un registro en la tabla facturas
    INSERT INTO facturas (idpedido, idusuario, idproducto, idmetodopago, estado, total)
    VALUES (NEW.Id_pedido, NEW.idusuario, NEW.idproducto, NEW.idmetodopago, 'Pendiente', total_pedido);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` int(10) NOT NULL,
  `producto` varchar(150) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `preciou` int(11) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `imagen` text NOT NULL,
  `stock` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `producto`, `categoria`, `preciou`, `descripcion`, `imagen`, `stock`) VALUES
(8, 'Pasta Alfredo con Camarones', 'Almuerzo', 15000, 'Pasta fettuccine al dente en una salsa cremosa de queso parmesano y mantequilla, con camarones jugosos y espolvoreada con perejil fresco', 'https://editorialtelevisa.brightspotcdn.com/wp-content/uploads/2019/09/pasta-alfredo-con-camarones-1.jpg', 80),
(10, 'Filete de Salmón a la Parrilla', 'Almuerzo', 15000, 'Filete de salmón fresco a la parrilla, marinado en hierbas y limón, acompañado de arroz             pilaf y espárragos al vapor', 'https://es.cravingsjournal.com/wp-content/uploads/2022/09/pescado-a-la-parrilla-6.jpg', 100),
(13, 'Refresco de Cola', 'Tienda', 2500, 'Lata de refresco de cola, refrescante y burbujeante', 'https://www.eluniversal.com.mx/resizer/OLuA3mQxIk74kykokIDaUvNKPlU=/1100x666/cloudfront-us-east-1.images.arcpublishing.com/eluniversal/3DKOA3GI7VHYDPXL7WHW64INXU.jpg', 100),
(15, 'Huevos Frescos', 'Tienda', 800, 'Docena de huevos frescos, excelentes para cocinar y hornear', 'https://estaticosgn-cdn.deia.eus/clip/c9af31ca-07af-4bfe-aa8b-f14fd05a9069_16-9-discover-aspect-ratio_default_0.jpg', 60),
(16, 'Queso Cheddar', 'Tienda', 3000, 'Bloque de queso cheddar, delicioso y cremoso, ideal para sándwiches y aperitivos', 'https://comosefabrica.com/img/entradas/queso-cheddar.jpg', 100),
(17, 'Yogur Natural', 'Tienda', 1700, 'Envase de yogur natural sin sabor, rico en probióticos y calcio', 'https://i0.wp.com/www.pasionthermomix.co/wp-content/uploads/2020/02/yogur-para-bowl.jpg?fit=768%2C480&ssl=1', 100),
(18, 'Manzanas Granny Smith', 'Tienda', 1600, 'Bolsa de manzanas Granny Smith frescas y crujientes', 'https://greenandfresh.com.co/wp-content/uploads/2018/12/manzana-granny-smith.jpg', 100),
(20, 'Tomates Frescos', 'Tienda', 1000, 'Paquete de tomates frescos y jugosos, perfectos para ensaladas y salsas', 'https://cdn.businessinsider.es/sites/navi.axelspringer.es/public/media/image/2020/11/tomates-frescos-2130325.jpg?tf=3840x', 70),
(21, 'Cereal de Chocolate', 'Tienda', 2600, 'Caja de cereal de chocolate, crujiente y delicioso', 'https://s.libertaddigital.com/2022/03/01/1920/1080/fit/chocolate-breakfast-cereala-hrefhttpsccnulldefotografmarco-verch-relnoreferrer-nofollowprofessional-photographeraa-hrefhttptwitchtvwue.jpg', 90),
(22, 'Helado de Vainilla', 'Tienda', 3000, 'Envase de helado de vainilla cremoso y suave', 'https://www.recetasnestle.com.do/sites/default/files/srh_recipes/62099096785a3c939a1a1eefb06bf358.jpg', 90),
(24, 'Aceitunas Verdes', 'Tienda', 5000, 'Frascos de aceitunas verdes marinadas, perfectas como aperitivo o en ensaladas', 'https://mercantilmx.com/v1/wp-content/uploads/2023/09/aceitunas-verdes-en-plato.webp', 50),
(28, 'pollo', 'tienda', 1200, 'pollo muy rico', 'https://www.elespectador.com/resizer/qnmcZB28733ovmkLlBjlcnCiLPc=/arc-anglerfish-arc2-prod-elespectador/public/BF5ZMLR24NHKJHJJ3L23WDFF7Q.jpg', 100),
(29, 'pollo de tercera', 'tienda', 10000, 'pollo asado de segunda', 'https://estaticos-cdn.prensaiberica.es/clip/ef0f2855-f04b-464a-b26f-b62a1d069657_16-9-aspect-ratio_default_0.jpg', 100),
(31, 'Bandeja Paisa', 'Almuerzo', 1000, 'Bandeja Paisa 100% natural', 'https://cdn.colombia.com/gastronomia/2011/08/02/bandeja-paisa-1616.gif', 70),
(49, 'Curry', 'Almuerzo', 1000, 'Curry rico', 'https://www.kitchensanctuary.com/wp-content/uploads/2022/09/Air-Fryer-Chicken-Curry-square-FS-36.jpg', 10),
(54, 'Ensalada Rusa', 'Almuerzo', 12000, 'De Rusia', 'https://www.comedera.com/wp-content/uploads/2018/05/ensalada-rusa-1.jpg', 5),
(59, 'Pollo Asado', 'Almuerzo', 25000, 'Pollo bien bueno', 'https://cdn2.cocinadelirante.com/sites/default/files/styles/gallerie/public/images/2023/06/recetapolloasado.jpg', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idproveedor` int(10) NOT NULL,
  `proveedor` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idproveedor`, `proveedor`) VALUES
(34, 'Proveedor 2'),
(36, 'Yupi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(10) NOT NULL,
  `identificacion` int(10) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `contrasena` varchar(500) NOT NULL,
  `rol` varchar(15) NOT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `identificacion`, `nombres`, `telefono`, `correo`, `contrasena`, `rol`, `estado`) VALUES
(4, 45678901, 'Pedro Antonio Rodríguez González', '330 345 67', 'pedrogonzalez@gmail.com', '$2b$04$KZsgcQfcEta6e.YA1vCXguNPuuB8L9PfyC1oN/cuP8tCy.QdmAUvi', 'Cliente', 'Pagado'),
(5, 567890123, 'Isabella Valentina Restrepo Díaz', '340 456 78', 'isarestrepo@gmail.com', '$2b$04$DRrLDWVibQil/kRv1InZp.WwZbpyXz2D4eLqF1NpxnqFxfrjuJJi6', 'Cliente', 'Pagado'),
(6, 83648839, 'Andres Restrepo Villa', '304 728769', 'andres56783@gmail.com', '$2b$04$tALvHybKCrkTr77j8XCl5eDfG7dmRe3CSFNJHlJ7w.OvusnwQYZem', 'Cliente', 'Pendiente'),
(27, 1234567890, 'María García', '555-1234', 'maria.garcia@example.com', '$2b$04$pJyjWkigNzsaOjpg1OyPc.npT4qorRjUJo5DM3vVHTiJdnF1DKvTS', 'Cliente', 'Pagado'),
(28, 2147483647, 'Juan Pérez', '555-5678', 'juan.perez@example.com', '$2b$04$v0bC5fpC60rwbccoZasR9e/bz4ThzaqIutttGyerOBeX.fyZ46J1a', 'Cliente', 'Pagado'),
(29, 2147483647, 'Ana Martínez', '555-9876', 'ana.martinez@example.com', '$2b$04$dnoO4jljSz7GKmtf7DU1neLsj.wF1B0OSmrYt862mWlxcZ5o2RMfW', 'Cliente', 'Pagado'),
(30, 2147483647, 'Luis Rodríguez', '555-4321', 'luis.rodriguez@example.com', '$2b$04$QnxCPERhzngq.CQzsBWzZuHvvM5YsjbDPTfOFRaAK2.HbtHI4m0B.', 'Cliente', 'Pagado'),
(31, 2147483647, 'Carmen López', '555-8763', 'carmen.lopez@example.com', '$2b$04$90u.v/6vNzTjdG/0.w4D4.rDMhl74QCFcwRSQ4uZIJiaWznIhuQsO', 'Cliente', 'Pagado'),
(32, 2147483647, 'Roberto Sánchez', '555-2468', 'roberto.sanchez@example.com', '$2b$04$AMxj5.6S03uObIrteLz.KuImbekA1YrMsfAtZGw2Jmupx.7MXF4IK', 'Cliente', 'Pagado'),
(33, 2147483647, 'Julia Fernández', '555-1357', 'julia.fernandez@example.com', '$2b$04$wEHvVy/HJ2wdpviwc17tu.pPkllknm6KI9u6STBHVb3OCaX.ewIVq', 'Cliente', 'Pagado'),
(34, 2147483647, 'Pablo Gómez', '555-3698', 'pablo.gomez@example.com', '$2b$04$PiIFWrOJg/4hQnK7ZubncOE2x6sEN0ASVIXpL2z9U0MbYVPpVppCO', 'Cliente', 'Pagado'),
(35, 2147483647, 'Laura Díaz', '555-7532', 'laura.diaz@example.com', '$2b$04$ZdSHkCL5L3TciICtwwKX5e33TDKlzhK84AU2a0hCOUVapJdiJpq6O', 'Cliente', 'Pagado'),
(36, 123456789, 'Diego Ramírez', '555-6842', 'diego.ramirez@example.com', '$2b$04$FqkG0PN7dX2bNi7c48tPhOEjauA22kW7UZ6I.uGopbRnLd50kbMIq', 'Cliente', 'Pagado'),
(37, 1234509876, 'Sara Sánchez', '555-9870', 'sara.sanchez@example.com', '$2b$04$X0JPkKtt10/WKB0npfDyk.xqsFMlkaFQoEuKu8aRO1g2QoT3Ccw9C', 'Cliente', 'Pagado'),
(38, 2147483647, 'Manuel García', '555-6789', 'manuel.garcia@example.com', '$2b$04$5zU5PTbslyJIw.gulnaa.urZyy4VFdp.A80fxFYjkAh9hJtHcSveu', 'Cliente', 'Pagado'),
(39, 2147483647, 'Elena Martínez', '555-0987', 'elena.martinez@example.com', '$2b$04$0vLFl3vFDpuKkTRqrDu0ZOv/NzDZw03lUEqxUU3.VoB6BXF7lqB.u', 'Cliente', 'Pagado'),
(40, 2147483647, 'Pedro Pérez', '555-8901', 'pedro.perez@example.com', '$2b$04$GN4Wghk70FkxtzE35jcz0OYX9GmN1BOH4x9wFI7T3gvT/H7qQvw6i', 'Cliente', 'Pagado'),
(41, 2147483647, 'Ana López', '555-5432', 'ana.lopez@example.com', '$2b$04$lJ8w6D2KKdnyiqyCYILf5eRa3F1KkzC9ZDkUHnA/iKLD04x3M.3ZG', 'Cliente', 'Pagado'),
(42, 2147483647, 'Juan García', '555-2345', 'juan.garcia@example.com', '$2b$04$WkwsIUlP2QzdDC16NitMRud1SZIa.0iW/lYE39dxikOUz7ayjTCDi', 'Cliente', 'Pagado'),
(43, 2147483647, 'María Martínez', '555-4567', 'maria.martinez@example.com', '$2b$04$.FGU/OV2LHTUrOTeN3.WMO.t1vWBGO6iSK4ZaAW63JRVRlVnhD7yC', 'Cliente', 'Pagado'),
(44, 2147483647, 'Carlos Rodríguez', '555-7890', 'carlos.rodriguez@example.com', '$2b$04$ZSAJxJJx39wiL2ZCU0Ou7.Pz0ggrwrIz5AF9uEkb1THzfULFBjQhW', 'Cliente', 'Pagado'),
(45, 2147483647, 'Laura Sánchez', '555-2109', 'laura.sanchez@example.com', '$2b$04$EtVBQHebqWIf7HHQIPCP.u/ZoRVh5uEPY0u8rLGutDH/G2xn8bMHa', 'Cliente', 'Pagado'),
(47, 1040521345, 'Jhoan Monsalve', '123456789', 'jhoanmonsalve121@gmail.com', '$2b$04$VTH7QnUqbDNCSx6wrrCKU.b2xBWsuBO6pM4cQNA.98lbkMzn7eOMa', 'Programador', 'Fiado'),
(48, 1231234567, 'Esneider Giraldo', '123454321', 'esneidergiraldo@gmail.com', '$2b$04$/keqvfBF/P3U7C.XprA9Cu5j5h8Eb5AfQg9rRWR/ZUC4pXuf4F6VS', 'Programador', 'Pendiente'),
(73, 12, 'Jhoangerente', '318834212', 'jhoanmonsalve@gmail.com', '$2b$04$QGC/w30kOX/gjngSV.pMk.4U3CAK2HBxyzWMWsy3UgoWYJu3/edUG', 'Programador', 'Pendiente'),
(76, 10, 'Jhoan', '3188342121', 'jhoanpruebatoken@gmail.com', '$2b$04$JO427rGMZPnpF4JaV568fuQzL7ZWjI1RG6tUVUJhU5vUrwj0tWhZS', 'Programador', 'Fiado'),
(85, 12, 'PRUEBA', '2123412362', 'pruebatoken@gmail.com', '$2b$04$3q1l8N95pFZF.kJf5XFbgeesttkq1elskrPUYsMo6OkDe/n1I2Roi', 'Gerente', 'Fiado'),
(86, 12, 'Klimber Barret', '23233', 'klimber@gmail.com', '$2b$04$.PSFllDPsKkTTKskIruq9uzt0KpXo6uLom.uMt9tQaaYj8Mcrljwi', 'Cliente', 'Pagado'),
(87, 123, 'esme', '213', 'esneider@gmail.com', '$2b$04$T5lnAWRbKx29VQr8AT.D5eStZzjN1yooOdXiAWtuRax8rE2IWJiCS', 'Gerente', 'Pagado'),
(88, 111, 'es', '111', 'esnei@gmail.com', '$2b$04$YlliJ4rkZMsqUO/tfijqw.kl.DW6D3V.vlmoyYA2ij9K5cY7hCF6O', 'Cajero', 'Pagado'),
(90, 1, 'esneud', '1233', 'i@gmail.com', '$2b$04$AHC.Z2wS/6siQnstF/gmvu27hCh5QTDCbaEJZ1bkaA7/dEecw2QqO', 'Gerente', 'Pagado'),
(92, 1234, '.fgddg', '14567', 'e@gmail.com', '$2b$04$WrhBRRGVNXbnq8nJ01MvtenrjhxgpwPiBkYkIFVWsO94DsyzU//ra', 'Cajero', 'Pagado'),
(100, 1212, 'Shrek', '2', 'shrek@gmail.com', '$2b$04$lTPVtLo525khsxLJxM1DruGP4lwWReyQoLEldRXPOiOSwG8Sp12he', 'Cliente', 'Pagado'),
(105, 1, 'Esneider', '1', 'o@gmail.com', '$2b$04$xK9UQsku8OTx.XKQkJyEROtrMzoE3LYGizSLWyRafMZAgs/n6.SXe', 'Cliente', 'Pagado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idfacturas`),
  ADD KEY `facturas_ibfk_1` (`idmetodopago`),
  ADD KEY `facturas_ibfk_2` (`idusuario`),
  ADD KEY `fk_factura_idproducto` (`idproducto`) USING BTREE,
  ADD KEY `facturas_ibfk_4` (`idpedido`);

--
-- Indices de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  ADD PRIMARY KEY (`idmetodopago`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`Id_pedido`),
  ADD KEY `fk_pedido_idusuario` (`idusuario`) USING BTREE,
  ADD KEY `fk_metodopago_idmetodopago` (`idmetodopago`) USING BTREE,
  ADD KEY `fk_pedido_idproducto` (`idproducto`) USING BTREE;

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproducto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idproveedor`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD UNIQUE KEY `telefono` (`telefono`),
  ADD KEY `identificacion` (`identificacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idfacturas` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  MODIFY `idmetodopago` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `Id_pedido` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproducto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idproveedor` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`idmetodopago`) REFERENCES `metodopago` (`idmetodopago`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `facturas_ibfk_3` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `facturas_ibfk_4` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`Id_pedido`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`idmetodopago`) REFERENCES `metodopago` (`idmetodopago`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`) ON DELETE CASCADE;
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Base de datos: `tiendaverduras`
--
CREATE DATABASE IF NOT EXISTS `tiendaverduras` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tiendaverduras`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `fecha_pedido` datetime DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `unidad_de_medida` varchar(50) DEFAULT NULL,
  `caracteristicas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_usuario`, `id_producto`, `fecha_pedido`, `cantidad`, `unidad_de_medida`, `caracteristicas`) VALUES
(1, 12, 10, '0000-00-00 00:00:00', 5, 'KL', 'Maduro'),
(2, 2, 4, '2024-12-10 13:02:38', 20, 'KL', 'Maduro');

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
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
