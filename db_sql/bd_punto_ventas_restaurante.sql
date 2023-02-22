-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-09-2019 a las 15:31:14
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_punto_ventas_restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonoscreditos`
--

CREATE TABLE `abonoscreditos` (
  `codabono` int(11) NOT NULL,
  `codventa` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcliente` int(11) NOT NULL,
  `montoabono` float(12,2) NOT NULL,
  `fechaabono` datetime NOT NULL,
  `codigo` int(11) NOT NULL,
  `codcaja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arqueocaja`
--

CREATE TABLE `arqueocaja` (
  `codarqueo` int(11) NOT NULL,
  `codcaja` int(11) NOT NULL,
  `montoinicial` float(12,2) NOT NULL,
  `ingresos` float(12,2) NOT NULL,
  `egresos` float(12,2) NOT NULL,
  `dineroefectivo` float(12,2) NOT NULL,
  `diferencia` float(12,2) NOT NULL,
  `comentarios` text COLLATE utf8_spanish_ci NOT NULL,
  `fechaapertura` datetime NOT NULL,
  `fechacierre` datetime NOT NULL,
  `statusarqueo` int(2) NOT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `arqueocaja`
--

INSERT INTO `arqueocaja` (`codarqueo`, `codcaja`, `montoinicial`, `ingresos`, `egresos`, `dineroefectivo`, `diferencia`, `comentarios`, `fechaapertura`, `fechacierre`, `statusarqueo`, `codigo`) VALUES
(1, 1, 0.00, 0.00, 0.00, 0.00, 0.00, '', '2019-09-09 10:23:51', '0000-00-00 00:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `codcaja` int(11) NOT NULL,
  `nrocaja` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombrecaja` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`codcaja`, `nrocaja`, `nombrecaja`, `codigo`) VALUES
(1, '00001', 'CAJA PRINCIPAL', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `codcategoria` int(11) NOT NULL,
  `nomcategoria` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`codcategoria`, `nomcategoria`) VALUES
(1, 'GASEOSAS'),
(2, 'CERVEZAS'),
(3, 'COMESTIBLES'),
(4, 'WHISKYS'),
(5, 'VINOS'),
(6, 'VODKA'),
(7, 'JUGOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `codcliente` int(11) NOT NULL,
  `cedcliente` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomcliente` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `direccliente` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tlfcliente` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emailcliente` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`codcliente`, `cedcliente`, `nomcliente`, `direccliente`, `tlfcliente`, `emailcliente`) VALUES
(1, '3300136', 'GERARDO JAVIER CAÑIZA LOPEZ', 'CAPIATA KM 17 RUTA 2 - BARRIO SAN MIGUEL', '(0981) - 268780', 'GERARDOCANIZA31@GMAIL.COM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idcompra` int(11) NOT NULL,
  `codcompra` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codseriec` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproveedor` int(11) NOT NULL,
  `subtotalivasic` float(12,2) NOT NULL,
  `subtotalivanoc` float(12,2) NOT NULL,
  `ivac` float(12,2) NOT NULL,
  `totalivac` float(12,2) NOT NULL,
  `descuentoc` float(12,2) NOT NULL,
  `totaldescuentoc` float(12,2) NOT NULL,
  `totalc` float(12,2) NOT NULL,
  `tipocompra` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `formacompra` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechavencecredito` date NOT NULL,
  `statuscompra` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechacompra` datetime NOT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idcompra`, `codcompra`, `codseriec`, `codproveedor`, `subtotalivasic`, `subtotalivanoc`, `ivac`, `totalivac`, `descuentoc`, `totaldescuentoc`, `totalc`, `tipocompra`, `formacompra`, `fechavencecredito`, `statuscompra`, `fechacompra`, `codigo`) VALUES
(1, '1', '333', 1, 0.00, 35000.00, 0.00, 0.00, 0.00, 0.00, 35000.00, 'CONTADO', '1', '0000-00-00', 'PAGADA', '2019-09-09 11:58:11', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `rifempresa` varchar(25) CHARACTER SET latin1 NOT NULL,
  `nomempresa` varchar(100) CHARACTER SET latin1 NOT NULL,
  `direcempresa` varchar(100) CHARACTER SET latin1 NOT NULL,
  `tlfempresa` varchar(20) CHARACTER SET latin1 NOT NULL,
  `correoempresa` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cedresponsable` varchar(25) CHARACTER SET latin1 NOT NULL,
  `nomresponsable` varchar(100) CHARACTER SET latin1 NOT NULL,
  `correoresponsable` varchar(70) CHARACTER SET latin1 NOT NULL,
  `tlfresponsable` varchar(20) CHARACTER SET latin1 NOT NULL,
  `ivac` float(12,2) NOT NULL,
  `ivav` float(12,2) NOT NULL,
  `simbolo` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `rifempresa`, `nomempresa`, `direcempresa`, `tlfempresa`, `correoempresa`, `cedresponsable`, `nomresponsable`, `correoresponsable`, `tlfresponsable`, `ivac`, `ivav`, `simbolo`) VALUES
(1, '0000000000000', 'URBAN CHIC CAFE', 'CAPITA KM 20 RUTA 2', '098 126 8780', 'URBAN@URBAN.COM', '123456789', 'ADMINISTRADOR GENERAL', 'ADMIN@ADMIN.COM', '098 126 8780', 0.00, 0.00, 'GS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecompras`
--

CREATE TABLE `detallecompras` (
  `coddetallecompra` int(11) NOT NULL,
  `codcompra` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `categoria` varchar(6) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cantcompra` float(5,2) NOT NULL,
  `precio1` float(12,2) NOT NULL,
  `precio2` float(12,2) NOT NULL,
  `ivaproductoc` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `importecompra` float(12,2) NOT NULL,
  `tipoentrada` varchar(35) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechadetallecompra` datetime NOT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `detallecompras`
--

INSERT INTO `detallecompras` (`coddetallecompra`, `codcompra`, `codproducto`, `producto`, `categoria`, `cantcompra`, `precio1`, `precio2`, `ivaproductoc`, `importecompra`, `tipoentrada`, `fechadetallecompra`, `codigo`) VALUES
(1, '1', '00004', 'COCA COLA DE 1/2', '1', 10.00, 3500.00, 5000.00, 'NO', 35000.00, 'PRODUCTO', '2019-09-09 11:58:11', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventas`
--

CREATE TABLE `detalleventas` (
  `coddetalleventa` int(11) NOT NULL,
  `codventa` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcliente` int(11) NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcategoria` int(11) NOT NULL,
  `cantventa` float(5,2) NOT NULL,
  `preciocompra` float(12,2) NOT NULL,
  `precioventa` float(12,2) NOT NULL,
  `ivaproducto` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `importe` float(12,2) NOT NULL,
  `importe2` float(12,2) NOT NULL,
  `fechadetalleventa` datetime NOT NULL,
  `statusdetalle` int(2) NOT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `idingrediente` int(11) NOT NULL,
  `codingrediente` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomingrediente` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cantingrediente` float(5,2) NOT NULL,
  `costoingrediente` float(12,2) NOT NULL,
  `unidadingrediente` varchar(6) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codproveedor` int(11) NOT NULL,
  `stockminimoingrediente` float(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`idingrediente`, `codingrediente`, `nomingrediente`, `cantingrediente`, `costoingrediente`, `unidadingrediente`, `codproveedor`, `stockminimoingrediente`) VALUES
(1, '00001', 'TOMATE Y QUESO', 65.00, 2000.00, 'UNID.', 1, 2.00),
(2, '00002', 'CARNE', 62.00, 5000.00, 'UNID.', 1, 1.00),
(3, '00003', 'HUEVOS', 23.00, 6000.00, 'UNID.', 1, 5.00),
(4, '00004', 'QUESO MUZARELLA', 20.00, 7000.00, 'UNID.', 1, 5.00),
(5, '00005', 'PEPERONNI', 50.00, 25000.00, 'UNID.', 1, 5.00),
(6, '00006', 'JAMON', 50.00, 10000.00, 'UNID.', 1, 5.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardexingredientes`
--

CREATE TABLE `kardexingredientes` (
  `codkardexing` int(11) NOT NULL,
  `codprocesoing` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `codresponsableing` int(11) NOT NULL,
  `codproducto` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `codingrediente` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `movimientoing` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `entradasing` float(5,2) NOT NULL,
  `salidasing` float(5,2) NOT NULL,
  `stockactualing` float(5,2) NOT NULL,
  `preciouniting` float(12,2) NOT NULL,
  `costototaling` float(12,2) NOT NULL,
  `documentoing` text COLLATE utf8_spanish_ci NOT NULL,
  `fechakardexing` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `kardexingredientes`
--

INSERT INTO `kardexingredientes` (`codkardexing`, `codprocesoing`, `codresponsableing`, `codproducto`, `codingrediente`, `movimientoing`, `entradasing`, `salidasing`, `stockactualing`, `preciouniting`, `costototaling`, `documentoing`, `fechakardexing`) VALUES
(1, 'jSZ0CvCp80', 0, '0', '', 'ENTRADAS', 10.00, 0.00, 10.00, 2000.00, 20000.00, 'INVENTARIO INICIAL', '2019-09-09'),
(2, 'dpE6AtsVLs', 0, '0', '', 'ENTRADAS', 10.00, 0.00, 10.00, 5000.00, 50000.00, 'INVENTARIO INICIAL', '2019-09-09'),
(3, 'yVL3jUEMmT', 0, '0', '', 'ENTRADAS', 25.00, 0.00, 25.00, 6000.00, 150000.00, 'INVENTARIO INICIAL', '2019-09-09'),
(4, 'hDaTfnDrRb', 0, '0', '', 'ENTRADAS', 20.00, 0.00, 20.00, 7000.00, 140000.00, 'INVENTARIO INICIAL', '2019-09-09'),
(5, 'BJefXaQsr7', 0, '0', '', 'ENTRADAS', 50.00, 0.00, 50.00, 25000.00, 1250000.00, 'INVENTARIO INICIAL', '2019-09-09'),
(24, 'VNFgO91sQz', 0, '0', '', 'ENTRADAS', 50.00, 0.00, 50.00, 10000.00, 500000.00, 'INVENTARIO INICIAL', '2019-09-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardexproductos`
--

CREATE TABLE `kardexproductos` (
  `codkardex` int(11) NOT NULL,
  `codproceso` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `codresponsable` int(11) NOT NULL,
  `codproducto` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `movimiento` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `entradas` float(5,2) NOT NULL,
  `salidas` float(5,2) NOT NULL,
  `devolucion` float(5,2) NOT NULL,
  `stockactual` float(5,2) NOT NULL,
  `preciom` float(12,2) NOT NULL,
  `costototal` float(12,2) NOT NULL,
  `documento` text COLLATE utf8_spanish_ci NOT NULL,
  `fechakardex` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `kardexproductos`
--

INSERT INTO `kardexproductos` (`codkardex`, `codproceso`, `codresponsable`, `codproducto`, `movimiento`, `entradas`, `salidas`, `devolucion`, `stockactual`, `preciom`, `costototal`, `documento`, `fechakardex`) VALUES
(1, 'qGj2GnqJ4c', 0, '00001', 'ENTRADAS', 15.00, 0.00, 0.00, 15.00, 30000.00, 450000.00, 'INVENTARIO INICIAL', '2019-09-09'),
(2, 'wP0mZXMO8Y', 0, '00002', 'ENTRADAS', 10.00, 0.00, 0.00, 10.00, 15000.00, 150000.00, 'INVENTARIO INICIAL', '2019-09-09'),
(3, 'u8qfh2c2VO', 0, '00003', 'ENTRADAS', 25.00, 0.00, 0.00, 25.00, 20000.00, 500000.00, 'INVENTARIO INICIAL', '2019-09-09'),
(12, 'Ivi0U13pMG', 0, '00004', 'ENTRADAS', 20.00, 0.00, 0.00, 20.00, 5000.00, 100000.00, 'INVENTARIO INICIAL', '2019-09-09'),
(13, 'fNocoqXeHy', 0, '00005', 'ENTRADAS', 100.00, 0.00, 0.00, 100.00, 5000.00, 500000.00, 'INVENTARIO INICIAL', '2019-09-09'),
(14, 'wbRXLDc0Pq', 0, '00006', 'ENTRADAS', 21.00, 0.00, 0.00, 21.00, 100000.00, 2100000.00, 'INVENTARIO INICIAL', '2019-09-09'),
(15, 'e3PynMjrsJ', 0, '00007', 'ENTRADAS', 6.00, 0.00, 0.00, 6.00, 9000.00, 54000.00, 'INVENTARIO INICIAL', '2019-09-09'),
(18, '1', 1, '00004', 'ENTRADAS', 10.00, 0.00, 0.00, 30.00, 3500.00, 35000.00, 'COMPRA - CONTADO - FACTURA: 1', '2019-09-09'),
(23, 'cXgD2JufML', 0, '00008', 'ENTRADAS', 50.00, 0.00, 0.00, 50.00, 3500.00, 175000.00, 'INVENTARIO INICIAL', '2019-09-10'),
(24, 'GyRgxvK4Ub', 0, '00009', 'ENTRADAS', 100.00, 0.00, 0.00, 100.00, 3500.00, 350000.00, 'INVENTARIO INICIAL', '2019-09-10'),
(25, 'LvS3iqRWd8', 0, '00010', 'ENTRADAS', 100.00, 0.00, 0.00, 100.00, 3500.00, 350000.00, 'INVENTARIO INICIAL', '2019-09-10'),
(26, '2MuY5aEY1P', 0, '00011', 'ENTRADAS', 100.00, 0.00, 0.00, 100.00, 3500.00, 350000.00, 'INVENTARIO INICIAL', '2019-09-10'),
(27, 'wulsBa7oBC', 0, '00012', 'ENTRADAS', 100.00, 0.00, 0.00, 100.00, 3500.00, 350000.00, 'INVENTARIO INICIAL', '2019-09-10'),
(28, 'NdAKXglkmp', 0, '00013', 'ENTRADAS', 20.00, 0.00, 0.00, 20.00, 17000.00, 340000.00, 'INVENTARIO INICIAL', '2019-09-10'),
(29, '6WCPVHoAkZ', 0, '00014', 'ENTRADAS', 100.00, 0.00, 0.00, 100.00, 10000.00, 1000000.00, 'INVENTARIO INICIAL', '2019-09-10'),
(30, 'psaLibcoUv', 0, '00015', 'ENTRADAS', 50.00, 0.00, 0.00, 50.00, 35000.00, 1750000.00, 'INVENTARIO INICIAL', '2019-09-10'),
(31, 'yjlcpaC5q5', 0, '00016', 'ENTRADAS', 15.00, 0.00, 0.00, 15.00, 6000.00, 90000.00, 'INVENTARIO INICIAL', '2019-09-10'),
(32, 'v4ZmN1ZkoR', 0, '00017', 'ENTRADAS', 16.00, 0.00, 0.00, 16.00, 7000.00, 112000.00, 'INVENTARIO INICIAL', '2019-09-10'),
(33, 'EJOhubZQty', 0, '00018', 'ENTRADAS', 19.00, 0.00, 0.00, 19.00, 6500.00, 123500.00, 'INVENTARIO INICIAL', '2019-09-10'),
(34, '449E5rg3se', 0, '00019', 'ENTRADAS', 15.00, 0.00, 0.00, 15.00, 12000.00, 180000.00, 'INVENTARIO INICIAL', '2019-09-10'),
(35, 'gsOk0IuC4l', 0, '00020', 'ENTRADAS', 120.00, 0.00, 0.00, 120.00, 9000.00, 1080000.00, 'INVENTARIO INICIAL', '2019-09-10'),
(36, 'g50pIUjINc', 0, '00021', 'ENTRADAS', 15.00, 0.00, 0.00, 15.00, 35000.00, 525000.00, 'INVENTARIO INICIAL', '2019-09-10'),
(38, 'V6hmukqTXd', 0, '00022', 'ENTRADAS', 13.00, 0.00, 0.00, 13.00, 12500.00, 162500.00, 'INVENTARIO INICIAL', '2019-09-10'),
(39, 'qZEhFvdp0R', 0, '00023', 'ENTRADAS', 20.00, 0.00, 0.00, 20.00, 6000.00, 120000.00, 'INVENTARIO INICIAL', '2019-09-10'),
(40, 'urv1ePaPMw', 0, '00024', 'ENTRADAS', 19.00, 0.00, 0.00, 19.00, 6000.00, 114000.00, 'INVENTARIO INICIAL', '2019-09-10'),
(41, 'zV2Msa1pRH', 0, '00025', 'ENTRADAS', 25.00, 0.00, 0.00, 25.00, 7500.00, 187500.00, 'INVENTARIO INICIAL', '2019-09-10'),
(42, 'rJ4ErYDdCK', 0, '00026', 'ENTRADAS', 100.00, 0.00, 0.00, 100.00, 3500.00, 350000.00, 'INVENTARIO INICIAL', '2019-09-10'),
(43, 'PKqOGk7Vqd', 0, '00027', 'ENTRADAS', 45.00, 0.00, 0.00, 45.00, 25000.00, 1125000.00, 'INVENTARIO INICIAL', '2019-09-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tiempo` datetime DEFAULT NULL,
  `detalles` text CHARACTER SET utf8 COLLATE utf8_spanish_ci,
  `paginas` text CHARACTER SET utf8 COLLATE utf8_spanish_ci,
  `usuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `log`
--

INSERT INTO `log` (`id`, `ip`, `tiempo`, `detalles`, `paginas`, `usuario`) VALUES
(5, '::1', '2019-07-04 11:58:26', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '/restaurante/index.php', 'ADMINISTRADOR'),
(6, '::1', '2019-09-09 08:04:48', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/punto_ventas_restaurantes/index.php', 'ADMINISTRADOR'),
(7, '::1', '2019-09-10 07:31:51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/punto_ventas_restaurantes/index.php', 'ADMIN123'),
(8, '::1', '2019-09-10 07:32:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/punto_ventas_restaurantes/index.php', 'ADMINISTRADOR'),
(9, '::1', '2019-09-10 09:50:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/punto_ventas_restaurantes/index.php', 'ADMINISTRADOR'),
(10, '::1', '2019-09-11 11:15:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/punto_ventas_restaurantes/index.php', 'ADMINISTRADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mediospagos`
--

CREATE TABLE `mediospagos` (
  `codmediopago` int(11) NOT NULL,
  `mediopago` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `mediospagos`
--

INSERT INTO `mediospagos` (`codmediopago`, `mediopago`) VALUES
(1, 'EFECTIVO'),
(2, 'TRANSFERENCIA'),
(3, 'TARJETA DEBITO'),
(4, 'TARJETA CREDITO'),
(5, 'CHEQUE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `codmesa` int(11) NOT NULL,
  `codsala` int(11) NOT NULL,
  `nombremesa` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `mesacreada` datetime NOT NULL,
  `statusmesa` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`codmesa`, `codsala`, `nombremesa`, `mesacreada`, `statusmesa`) VALUES
(1, 1, 'MESA 1', '2019-09-09 09:12:39', 0),
(2, 1, 'MESA 2', '2019-09-09 09:12:48', 0),
(3, 1, 'MESA 3', '2019-09-09 09:12:56', 0),
(4, 1, 'MESA 4', '2019-09-09 09:13:03', 0),
(5, 1, 'MESA 5', '2019-09-09 09:13:11', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientoscajas`
--

CREATE TABLE `movimientoscajas` (
  `codmovimientocaja` int(11) NOT NULL,
  `tipomovimientocaja` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `montomovimientocaja` float(12,2) NOT NULL,
  `mediopagomovimientocaja` int(11) NOT NULL,
  `codcaja` int(11) NOT NULL,
  `descripcionmovimientocaja` text COLLATE utf8_spanish_ci NOT NULL,
  `fechamovimientocaja` datetime NOT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `codalmacen` int(11) NOT NULL,
  `codproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `producto` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcategoria` int(11) NOT NULL,
  `preciocompra` float(12,2) NOT NULL,
  `precioventa` float(12,2) NOT NULL,
  `existencia` float(5,2) NOT NULL,
  `stockminimo` int(5) NOT NULL,
  `ivaproducto` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descproducto` float(12,2) NOT NULL,
  `codproveedor` int(11) NOT NULL,
  `codigobarra` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `favorito` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `statusproducto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`codalmacen`, `codproducto`, `producto`, `codcategoria`, `preciocompra`, `precioventa`, `existencia`, `stockminimo`, `ivaproducto`, `descproducto`, `codproveedor`, `codigobarra`, `favorito`, `statusproducto`) VALUES
(1, '00001', 'PIZZA A LA NAPOLITANA', 3, 15000.00, 30000.00, 12.00, 2, 'NO', 0.00, 0, '253555', 'SI', 'ACTIVO'),
(2, '00002', 'BIFE CON HUEVO', 3, 10000.00, 15000.00, 10.00, 1, 'SI', 0.00, 0, '58965', 'SI', 'ACTIVO'),
(3, '00003', 'PIZZA MUZARELLA', 3, 12000.00, 20000.00, 25.00, 5, 'SI', 0.00, 1, '534344', 'SI', 'ACTIVO'),
(4, '00004', 'COCA COLA DE 1/2', 1, 3500.00, 5000.00, 30.00, 5, 'NO', 0.00, 1, '89555', 'SI', 'ACTIVO'),
(5, '00005', 'BUD 66 TUBITO', 2, 4200.00, 5000.00, 100.00, 5, 'NO', 0.00, 0, '263555', 'SI', 'ACTIVO'),
(6, '00006', 'WHIKY EL MONJE', 4, 65000.00, 100000.00, 21.00, 3, 'SI', 0.00, 1, '00000000000', 'SI', 'ACTIVO'),
(7, '00007', 'ENSALADA MIXTA', 3, 6000.00, 9000.00, 6.00, 3, 'SI', 0.00, 1, '231111', 'SI', 'ACTIVO'),
(8, '00008', 'EMPANADA CHILENA', 3, 1500.00, 3500.00, 50.00, 10, 'SI', 0.00, 1, '855555', 'SI', 'ACTIVO'),
(9, '00009', 'EMPANADA DE CARNE', 3, 1500.00, 3500.00, 100.00, 10, 'SI', 0.00, 1, '256633', 'SI', 'ACTIVO'),
(10, '00010', 'EMPANADA DE POLLO', 3, 1500.00, 3500.00, 100.00, 10, 'SI', 0.00, 1, '235555', 'SI', 'ACTIVO'),
(11, '00011', 'EMPANADA DE JAMON Y QUESO', 3, 1500.00, 3500.00, 100.00, 10, 'SI', 0.00, 1, '52300', 'SI', 'ACTIVO'),
(12, '00012', 'EMAPANADA A LA NAPOLITANA', 3, 1500.00, 3500.00, 100.00, 10, 'NO', 0.00, 1, '66633', 'SI', 'ACTIVO'),
(13, '00013', 'COCTEL DE LIMON', 6, 10000.00, 17000.00, 20.00, 5, 'NO', 0.00, 1, '853366', 'SI', 'ACTIVO'),
(14, '00014', 'COMBO CAFE NEGRO Y MEDIALUNA', 3, 6000.00, 10000.00, 100.00, 5, 'SI', 0.00, 1, '896666', 'SI', 'ACTIVO'),
(15, '00015', 'PIZZA CASERO PEPERONI', 3, 17000.00, 35000.00, 50.00, 5, 'SI', 0.00, 1, '563999', 'SI', 'ACTIVO'),
(16, '00016', 'ENSALADA DE PAPAS', 3, 4000.00, 6000.00, 15.00, 5, 'NO', 0.00, 1, '963222', 'SI', 'ACTIVO'),
(17, '00017', 'ENSALADA DE LECHUGA', 3, 4000.00, 7000.00, 16.00, 5, 'SI', 0.00, 1, '977774', 'SI', 'ACTIVO'),
(18, '00018', 'ENSALADA DE ARROZ', 3, 3500.00, 6500.00, 19.00, 5, 'SI', 0.00, 1, '978222', 'SI', 'ACTIVO'),
(19, '00019', 'COMBO CAFE CON LECHE Y MEDIALUNA', 3, 5000.00, 12000.00, 15.00, 5, 'SI', 0.00, 1, '895555', 'SI', 'ACTIVO'),
(20, '00020', 'BRAHMA DE LITRO', 2, 4000.00, 9000.00, 120.00, 5, 'SI', 0.00, 1, '892222', 'SI', 'ACTIVO'),
(21, '00021', 'PICADAS', 3, 12000.00, 35000.00, 15.00, 5, 'SI', 0.00, 1, '766777', 'SI', 'ACTIVO'),
(23, '00022', 'SANGRIA', 5, 8000.00, 12500.00, 13.00, 5, 'SI', 0.00, 1, '990088', 'SI', 'ACTIVO'),
(24, '00023', 'JUGO DE DURAZNO', 7, 4000.00, 6000.00, 20.00, 5, 'SI', 0.00, 1, '362111', 'SI', 'ACTIVO'),
(25, '00024', 'JUGO DE NARANJA', 7, 4000.00, 6000.00, 19.00, 5, 'SI', 0.00, 1, '54555', 'SI', 'ACTIVO'),
(26, '00025', 'JUGO DE FRUTILLA', 7, 5000.00, 7500.00, 25.00, 5, 'NO', 0.00, 1, '788888', 'SI', 'ACTIVO'),
(27, '00026', 'EMPANADA DE CHOCLO', 3, 1500.00, 3500.00, 100.00, 5, 'SI', 0.00, 1, '65466', 'SI', 'ACTIVO'),
(28, '00027', 'VINO SANTA HELENA', 5, 15000.00, 25000.00, 45.00, 5, 'SI', 0.00, 1, '3453555', 'SI', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productosvsingredientes`
--

CREATE TABLE `productosvsingredientes` (
  `codagrega` int(11) NOT NULL,
  `codproducto` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codingrediente` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cantracion` float(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `productosvsingredientes`
--

INSERT INTO `productosvsingredientes` (`codagrega`, `codproducto`, `codingrediente`, `cantracion`) VALUES
(1, '00001', '00001', 5.00),
(2, '00002', '00002', 2.00),
(3, '00002', '00003', 2.00),
(4, '00003', '00004', 4.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `codproveedor` int(11) NOT NULL,
  `ritproveedor` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nomproveedor` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `direcproveedor` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tlfproveedor` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emailproveedor` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `contactoproveedor` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`codproveedor`, `ritproveedor`, `nomproveedor`, `direcproveedor`, `tlfproveedor`, `emailproveedor`, `contactoproveedor`) VALUES
(1, '034434', 'LA DISTRIBUIDORA', 'HERRERA Y AZARA 234', '098 523 211', 'PROVEEDORES@GMAIL.COM', 'JUAN CACERES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salas`
--

CREATE TABLE `salas` (
  `codsala` int(11) NOT NULL,
  `nombresala` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `salacreada` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `salas`
--

INSERT INTO `salas` (`codsala`, `nombresala`, `salacreada`) VALUES
(1, 'SALON 1', '2019-09-09 09:10:24'),
(2, 'SALON 2', '2019-09-09 09:11:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `codigo` int(11) NOT NULL,
  `cedula` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombres` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nrotelefono` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cargo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nivel` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `status` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`codigo`, `cedula`, `nombres`, `nrotelefono`, `cargo`, `email`, `usuario`, `password`, `nivel`, `status`) VALUES
(1, '0123456789', 'ADMINISTRADOR GENERAL', '303 030 3030', 'ADMINISTRADOR', 'ADMIN@ADMIN.COM', 'ADMINISTRADOR', '1bf14c0c2c2ba92f7dcd98e6194b1eb28ca83f73', 'ADMINISTRADOR', 'ACTIVO'),
(2, '3300136', 'ADMIN', '098 126 8780', 'GERENTE GENERAL', 'GERARDOCANIZA31@GMAIL.COM', 'ADMIN123', 'ab3b31af882ca84dc79c137ea5a295f706b7a381', 'ADMINISTRADOR', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idventa` int(11) NOT NULL,
  `codventa` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codcaja` int(11) NOT NULL,
  `codcliente` int(11) NOT NULL,
  `codmesa` int(11) NOT NULL,
  `subtotalivasive` float(12,2) NOT NULL,
  `subtotalivanove` float(12,2) NOT NULL,
  `ivave` int(2) NOT NULL,
  `totalivave` float(12,2) NOT NULL,
  `descuentove` int(2) NOT NULL,
  `totaldescuentove` float(12,2) NOT NULL,
  `totalpago` float(12,2) NOT NULL,
  `totalpago2` float(12,2) NOT NULL,
  `tipopagove` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `formapagove` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `montopagado` float(12,2) NOT NULL,
  `montodevuelto` float(12,2) NOT NULL,
  `fechavencecredito` date NOT NULL,
  `statusventa` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `statuspago` int(2) NOT NULL,
  `fechaventa` datetime NOT NULL,
  `codigo` int(11) NOT NULL,
  `cocinero` int(2) NOT NULL,
  `delivery` int(2) NOT NULL,
  `repartidor` int(11) NOT NULL,
  `entregado` int(2) NOT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abonoscreditos`
--
ALTER TABLE `abonoscreditos`
  ADD PRIMARY KEY (`codabono`);

--
-- Indices de la tabla `arqueocaja`
--
ALTER TABLE `arqueocaja`
  ADD PRIMARY KEY (`codarqueo`);

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`codcaja`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`codcategoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`codcliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idcompra`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detallecompras`
--
ALTER TABLE `detallecompras`
  ADD PRIMARY KEY (`coddetallecompra`);

--
-- Indices de la tabla `detalleventas`
--
ALTER TABLE `detalleventas`
  ADD PRIMARY KEY (`coddetalleventa`);

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`idingrediente`);

--
-- Indices de la tabla `kardexingredientes`
--
ALTER TABLE `kardexingredientes`
  ADD PRIMARY KEY (`codkardexing`);

--
-- Indices de la tabla `kardexproductos`
--
ALTER TABLE `kardexproductos`
  ADD PRIMARY KEY (`codkardex`);

--
-- Indices de la tabla `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mediospagos`
--
ALTER TABLE `mediospagos`
  ADD PRIMARY KEY (`codmediopago`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`codmesa`);

--
-- Indices de la tabla `movimientoscajas`
--
ALTER TABLE `movimientoscajas`
  ADD PRIMARY KEY (`codmovimientocaja`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`codalmacen`);

--
-- Indices de la tabla `productosvsingredientes`
--
ALTER TABLE `productosvsingredientes`
  ADD PRIMARY KEY (`codagrega`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`codproveedor`);

--
-- Indices de la tabla `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`codsala`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idventa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abonoscreditos`
--
ALTER TABLE `abonoscreditos`
  MODIFY `codabono` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `arqueocaja`
--
ALTER TABLE `arqueocaja`
  MODIFY `codarqueo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `codcaja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `codcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `codcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idcompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detallecompras`
--
ALTER TABLE `detallecompras`
  MODIFY `coddetallecompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalleventas`
--
ALTER TABLE `detalleventas`
  MODIFY `coddetalleventa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `idingrediente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `kardexingredientes`
--
ALTER TABLE `kardexingredientes`
  MODIFY `codkardexing` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `kardexproductos`
--
ALTER TABLE `kardexproductos`
  MODIFY `codkardex` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `mediospagos`
--
ALTER TABLE `mediospagos`
  MODIFY `codmediopago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `codmesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `movimientoscajas`
--
ALTER TABLE `movimientoscajas`
  MODIFY `codmovimientocaja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `codalmacen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `productosvsingredientes`
--
ALTER TABLE `productosvsingredientes`
  MODIFY `codagrega` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `codproveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `salas`
--
ALTER TABLE `salas`
  MODIFY `codsala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
