-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-12-2017 a las 00:16:03
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";												


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

DROP DATABASE IF EXISTS `viper_developments`;

--
-- Base de datos: viper_developments`
--

CREATE DATABASE `viper_developments`;

USE `viper_developments`;

-- --------------------------------------------------------

DROP TABLE IF EXISTS `CountryRegion`;

--
-- Estructura de tabla `CountryRegion`
--

CREATE TABLE `CountryRegion`
(
	`Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
	`Description` varchar(128) NOT NULL,
	`FIPS104` varchar(2) NOT NULL,
	`ISO2` varchar(2) NOT NULL,
	`ISO3` varchar(3) NULL,
	`ISON` varchar(3) NOT NULL,
	`Internet` varchar(2) NULL,
	`Capital` varchar(25) NULL,
	`MapReference` varchar(50) NULL,
	`NationalitySingular` varchar(35) NULL,
	`NationalityPlural` varchar(35) NULL,
	`Currency` varchar(30) NULL,
	`CurrencyCode` varchar(3) NULL,
	`Population` bigint NULL,
	`Title` varchar(50) NULL,
	`Comment` varchar(2048) NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los paises';

INSERT INTO CountryRegion (Id, Description, FIPS104, ISO2, ISO3, ISON, Internet, Capital, MapReference, NationalitySingular, NationalityPlural, Currency, CurrencyCode, Population, Title, Comment) VALUES (159, N'MEXICO', N'MX', N'MX', N'MEX', N'484', N'MX', N'Mexico ', N'North America ', N'Mexican', N'Mexicans', N'Mexican Peso', N'MXN', 101879171, N'Mexico', N'');

-- --------------------------------------------------------

DROP TABLE IF EXISTS `StateProvince`;

--
-- Estructura de tabla `StateProvince`
--

CREATE TABLE `StateProvince`
(
	`Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    `CountryRegionId` int(11) NOT NULL COMMENT 'Llave Foranea de Pais',
    `CveEnt` varchar(2) NOT NULL,
	`Description` varchar(500) NOT NULL,
	`Abrev` varchar(10) NOT NULL,
	`CveCab` varchar(7) NULL,
	`NameCab` varchar(100) NULL,
	`PTOT` varchar(10) NULL,
	`PMAS` varchar(10) NULL,
	`PFEM` varchar(10) NULL,
	`VTOT` varchar(10) NULL,
    FOREIGN KEY (CountryRegionId) REFERENCES CountryRegion(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los estados';

INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1, 159, N'01', N'Aguascalientes', N'Ags.', N'0010001', N'Aguascalientes', N'1184996', N'576638', N'608358', N'290877');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2, 159, N'02', N'Baja California', N'BC', N'0020001', N'Mexicali', N'3155070', N'1591610', N'1563460', N'870769');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (3, 159, N'03', N'Baja California Sur', N'BCS', N'0030001', N'La Paz', N'637026', N'325433', N'311593', N'178271');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (4, 159, N'04', N'Campeche', N'Camp.', N'0020001', N'San Francisco de Campeche', N'822441', N'407721', N'414720', N'213727');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (5, 159, N'05', N'Coahuila de Zaraza', N'Coah.', N'0300001', N'Saltillo', N'2748391', N'1364197', N'1384194', N'727613');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (6, 159, N'06', N'Colima', N'Col.', N'0020001', N'Colima', N'650555', N'322790', N'327765', N'180488');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (7, 159, N'07', N'Chiapas', N'Chis.', N'1010001', N'Tuxtla Gutiérrez', N'4796580', N'2352807', N'2443773', N'1091100');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (8, 159, N'08', N'Chihuahua', N'Chih.', N'0190001', N'Chihuahua', N'3406465', N'1692545', N'1713920', N'944681');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (9, 159, N'09', N'Distrito Federal', N'DF', N'', N'', N'8851080', N'4233783', N'4617297', N'2453770');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (10, 159, N'10', N'Durango', N'D.', N'0050001', N'Victoria de Duran', N'1632934', N'803890', N'829044', N'407784');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (11, 159, N'11', N'Guanajuato', N'Gto.', N'0150001', N'Guanajuato', N'5486372', N'2639425', N'2846947', N'1276913');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (12, 159, N'12', N'Guerrero', N'Gro.', N'0290001', N'Chilpancin de los Bravo', N'3388768', N'1645561', N'1743207', N'810596');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (13, 159, N'13', N'Hidalgo', N'H.', N'0480001', N'Pachuca de Soto', N'2665018', N'1285222', N'1379796', N'669514');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (14, 159, N'14', N'Jalisco', N'Jal.', N'0390001', N'Guadalajara', N'7350682', N'3600641', N'3750041', N'1831205');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (15, 159, N'15', N'Mexico', N'Mex.', N'1060001', N'Toluca de Lerdo', N'15175862', N'7396986', N'7778876', N'3749499');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (16, 159, N'16', N'Michoacan de Ocampo', N'Mich.', N'0530001', N'Morelia', N'4351037', N'2102109', N'2248928', N'1082772');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (17, 159, N'17', N'Morenos', N'Mor.', N'0070001', N'Cuernavaca', N'1777227', N'858588', N'918639', N'469091');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (18, 159, N'18', N'Nayarit', N'Nay.', N'0170001', N'Tepic', N'1084979', N'541007', N'543972', N'291163');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (19, 159, N'19', N'Nuevo Leon', N'NL', N'0390001', N'Ciudad Monterrey', N'4653458', N'2320185', N'2333273', N'1210893');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (20, 159, N'20', N'Oaxaca', N'Oax.', N'0670001', N'Oaxaca de Juárez', N'3801962', N'1819008', N'1982954', N'941814');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (21, 159, N'21', N'Puebla', N'Pue.', N'1140001', N'Heróica Puebla de Zaraza', N'5779829', N'2769855', N'3009974', N'1392053');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (22, 159, N'22', N'Queretaro', N'Qro.', N'0140001', N'Santia de Querétaro', N'1827937', N'887188', N'940749', N'454392');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (23, 159, N'23', N'Quintana Roo', N'Q. Roo', N'0040001', N'Chetumal', N'1325578', N'673220', N'652358', N'369326');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (24, 159, N'24', N'San Luis Potosi', N'SLP', N'0280001', N'San Luis Potosí', N'2585518', N'1260366', N'1325152', N'639265');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (25, 159, N'25', N'Sinaloa', N'Sin.', N'0060001', N'Culiacán Rosales', N'2767761', N'1376201', N'1391560', N'713296');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (26, 159, N'26', N'Sonora', N'Son.', N'0300001', N'Hermosillo', N'2662480', N'1339612', N'1322868', N'712402');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (27, 159, N'27', N'Tabasco', N'Tab.', N'0040001', N'Villahermosa', N'2238603', N'1100758', N'1137845', N'567233');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (28, 159, N'28', N'Tamaulipas', N'Tamps.', N'0410001', N'Ciudad Victoria', N'3268554', N'1616201', N'1652353', N'901387');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (29, 159, N'29', N'Tlaxcala', N'Tlax.', N'0330001', N'Tlaxcala de Xicohténcatl', N'1169936', N'565775', N'604161', N'274243');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (30, 159, N'30', N'Veracruz de Ignacio de la Llave', N'Ver.', N'0870001', N'Xalapa-Enríquez', N'7643194', N'3695679', N'3947515', N'2014588');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (31, 159, N'31', N'Yucatan', N'Yuc.', N'0500001', N'Mérida', N'1955577', N'963333', N'992244', N'507248');
INSERT INTO StateProvince (Id, CountryRegionId, CveEnt, Description, Abrev, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (32, 159, N'32', N'Zacatecas', N'Zac.', N'0560001', N'Zacatecas', N'1490668', N'726897', N'763771', N'377018');

-- --------------------------------------------------------

DROP TABLE IF EXISTS `City`;

--
-- Estructura de tabla `City`
--

CREATE TABLE `City`
(
	`Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    `CountryRegionId` int(11) NOT NULL COMMENT 'Llave Foranea de Pais',
    `StateProvinceId` int(11) NOT NULL COMMENT 'Llave Foranea de Estado',
    `CveEnt` varchar(2) NOT NULL,
    `CveCity` varchar(3) NOT NULL,
	`Description` varchar(500) NOT NULL,
	`CveCab` varchar(4) NULL,
	`NameCab` varchar(100) NULL,
	`PTOT` varchar(10) NULL,
	`PMAS` varchar(10) NULL,
	`PFEM` varchar(10) NULL,
	`VTOT` varchar(10) NULL,
    FOREIGN KEY (CountryRegionId) REFERENCES CountryRegion(Id),
    FOREIGN KEY (StateProvinceId) REFERENCES StateProvince(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los municipios';

INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1, 159, 1, N'01', N'001', N'Aguascalientes', N'0001', N'Aguascalientes', N'797010', N'386429', N'410581', N'202141');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2, 159, 1, N'01', N'002', N'Asientos', N'0001', N'Asientos', N'45492', N'22512', N'22980', N'10012');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (3, 159, 1, N'01', N'003', N'Calvillo', N'0001', N'Calvillo', N'54136', N'26250', N'27886', N'12847');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (4, 159, 1, N'01', N'004', N'Cosío', N'0001', N'Cosío', N'15042', N'7326', N'7716', N'3467');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (5, 159, 1, N'01', N'005', N'Jesús María', N'0001', N'Jesús María', N'99590', N'49090', N'50500', N'22924');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (6, 159, 1, N'01', N'006', N'Pabellón de Arteaga', N'0001', N'Pabellón de Arteaga', N'41862', N'20170', N'21692', N'9416');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (7, 159, 1, N'01', N'007', N'Rincón de Romos', N'0001', N'Rincón de Romos', N'49156', N'24067', N'25089', N'11089');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (8, 159, 1, N'01', N'008', N'San José de Gracia', N'0001', N'San José de Gracia', N'8443', N'4043', N'4400', N'1899');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (9, 159, 1, N'01', N'009', N'Tepezalá', N'0001', N'Tepezalá', N'19668', N'9600', N'10068', N'4446');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (10, 159, 1, N'01', N'010', N'El Llano', N'0001', N'Palo Alto', N'18828', N'9573', N'9255', N'4159');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (11, 159, 1, N'01', N'011', N'San Francisco de los Romo', N'0001', N'San Francisco de los Romo', N'35769', N'17578', N'18191', N'8477');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (12, 159, 2, N'02', N'001', N'Ensenada', N'0001', N'Ensenada', N'466814', N'235130', N'231684', N'129657');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (13, 159, 2, N'02', N'002', N'Mexicali', N'0001', N'Mexicali', N'936826', N'473203', N'463623', N'265805');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (14, 159, 2, N'02', N'003', N'Tecate', N'0001', N'Tecate', N'101079', N'53323', N'47756', N'26254');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (15, 159, 2, N'02', N'004', N'Tijuana', N'0001', N'Tijuana', N'1559683', N'783653', N'776030', N'423987');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (16, 159, 2, N'02', N'005', N'Playas de Rosarito', N'0001', N'Playas de Rosarito', N'90668', N'46301', N'44367', N'25066');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (17, 159, 3, N'03', N'001', N'Comondú', N'0001', N'Ciudad Constitución', N'70816', N'36436', N'34380', N'19061');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (18, 159, 3, N'03', N'002', N'Mulegé', N'0001', N'Santa Rosalía', N'59114', N'30617', N'28497', N'16658');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (19, 159, 3, N'03', N'003', N'La Paz', N'0001', N'La Paz', N'251871', N'126397', N'125474', N'71212');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (20, 159, 3, N'03', N'008', N'Los Cabos', N'0001', N'San José del Cabo', N'238487', N'123101', N'115386', N'66620');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (21, 159, 3, N'03', N'009', N'Loreto', N'0001', N'Loreto', N'16738', N'8882', N'7856', N'4720');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (22, 159, 4, N'04', N'001', N'Calkiní', N'0001', N'Calkiní', N'52890', N'26072', N'26818', N'12729');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (23, 159, 4, N'04', N'002', N'Campeche', N'0001', N'San Francisco de Campeche', N'259005', N'125561', N'133444', N'71478');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (24, 159, 4, N'04', N'003', N'Carmen', N'0001', N'Ciudad del Carmen', N'221094', N'110317', N'110777', N'59017');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (25, 159, 4, N'04', N'004', N'Champotón', N'0001', N'Champotón', N'83021', N'41760', N'41261', N'21217');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (26, 159, 4, N'04', N'005', N'Hecelchakán', N'0001', N'Hecelchakán', N'28306', N'14093', N'14213', N'6772');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (27, 159, 4, N'04', N'006', N'Hopelchén', N'0001', N'Hopelchén', N'37777', N'19306', N'18471', N'8331');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (28, 159, 4, N'04', N'007', N'Palizada', N'0001', N'Palizada', N'8352', N'4230', N'4122', N'2193');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (29, 159, 4, N'04', N'008', N'Tenabo', N'0001', N'Tenabo', N'9736', N'5002', N'4734', N'2376');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (30, 159, 4, N'04', N'009', N'Escárcega', N'0001', N'Escárcega', N'54184', N'26809', N'27375', N'13339');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (31, 159, 4, N'04', N'010', N'Calakmul', N'0001', N'Xpujil', N'26882', N'13647', N'13235', N'5908');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (32, 159, 4, N'04', N'011', N'Candelaria', N'0001', N'Candelaria', N'41194', N'20924', N'20270', N'10367');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (33, 159, 5, N'05', N'001', N'Abasolo', N'0001', N'Abasolo', N'1070', N'531', N'539', N'362');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (34, 159, 5, N'05', N'002', N'Acuña', N'0001', N'Ciudad Acuña', N'136755', N'68350', N'68405', N'36756');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (35, 159, 5, N'05', N'003', N'Allende', N'0001', N'Allende', N'22675', N'11114', N'11561', N'6324');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (36, 159, 5, N'05', N'004', N'Arteaga', N'0001', N'Arteaga', N'22544', N'11540', N'11004', N'5902');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (37, 159, 5, N'05', N'005', N'Candela', N'0001', N'Candela', N'1808', N'939', N'869', N'529');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (38, 159, 5, N'05', N'006', N'Castaños', N'0001', N'Castaños', N'25892', N'12945', N'12947', N'6858');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (39, 159, 5, N'05', N'007', N'Cuatro Ciénegas', N'0001', N'Cuatro Ciénegas de Carranza', N'13013', N'6565', N'6448', N'3605');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (40, 159, 5, N'05', N'008', N'Escobedo', N'0001', N'Escobedo', N'2901', N'1475', N'1426', N'810');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (41, 159, 5, N'05', N'009', N'Francisco I. Madero', N'0001', N'Francisco I. Madero (Chávez)', N'55676', N'27739', N'27937', N'13976');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (42, 159, 5, N'05', N'010', N'Frontera', N'0001', N'Frontera', N'75215', N'37561', N'37654', N'19468');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (43, 159, 5, N'05', N'011', N'General Cepeda', N'0001', N'General Cepeda', N'11682', N'6071', N'5611', N'3103');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (44, 159, 5, N'05', N'012', N'Guerrero', N'0001', N'Guerrero', N'2091', N'1115', N'976', N'619');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (45, 159, 5, N'05', N'013', N'Hidal', N'0001', N'Hidal', N'1852', N'955', N'897', N'500');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (46, 159, 5, N'05', N'014', N'Jiménez', N'0001', N'Jiménez', N'9935', N'5041', N'4894', N'2667');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (47, 159, 5, N'05', N'015', N'Juárez', N'0001', N'Juárez', N'1599', N'827', N'772', N'448');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (48, 159, 5, N'05', N'016', N'Lamadrid', N'0001', N'Lamadrid', N'1835', N'941', N'894', N'549');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (49, 159, 5, N'05', N'017', N'Matamoros', N'0001', N'Matamoros', N'107160', N'53353', N'53807', N'26131');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (50, 159, 5, N'05', N'018', N'Monclova', N'0001', N'Monclova', N'216206', N'107401', N'108805', N'58929');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (51, 159, 5, N'05', N'019', N'Morelos', N'0001', N'Morelos', N'8207', N'4095', N'4112', N'2242');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (52, 159, 5, N'05', N'020', N'Múzquiz', N'0001', N'Ciudad Melchor Múzquiz', N'66834', N'33465', N'33369', N'17886');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (53, 159, 5, N'05', N'021', N'Nadadores', N'0001', N'Nadadores', N'6335', N'3186', N'3149', N'1778');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (54, 159, 5, N'05', N'022', N'Nava', N'0001', N'Nava', N'27928', N'14237', N'13691', N'7166');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (55, 159, 5, N'05', N'023', N'Ocampo', N'0001', N'Ocampo', N'10991', N'5652', N'5339', N'2809');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (56, 159, 5, N'05', N'024', N'Parras', N'0001', N'Parras de la Fuente', N'45401', N'23062', N'22339', N'11875');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (57, 159, 5, N'05', N'025', N'Piedras Negras', N'0001', N'Piedras Negras', N'152806', N'76404', N'76402', N'41057');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (58, 159, 5, N'05', N'026', N'Progreso', N'0001', N'Progreso', N'3473', N'1774', N'1699', N'967');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (59, 159, 5, N'05', N'027', N'Ramos Arizpe', N'0001', N'Ramos Arizpe', N'75461', N'38302', N'37159', N'20299');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (60, 159, 5, N'05', N'028', N'Sabinas', N'0001', N'Sabinas', N'60847', N'30247', N'30600', N'17074');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (61, 159, 5, N'05', N'029', N'Sacramento', N'0001', N'Sacramento', N'2314', N'1175', N'1139', N'639');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (62, 159, 5, N'05', N'030', N'Saltillo', N'0001', N'Saltillo', N'725123', N'359366', N'365757', N'187801');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (63, 159, 5, N'05', N'031', N'San Buenaventura', N'0001', N'San Buenaventura', N'22149', N'11044', N'11105', N'6225');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (64, 159, 5, N'05', N'032', N'San Juan de Sabinas', N'0014', N'Nueva Rosita', N'41649', N'20502', N'21147', N'11929');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (65, 159, 5, N'05', N'033', N'San Pedro', N'0001', N'San Pedro', N'102650', N'51393', N'51257', N'25319');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (66, 159, 5, N'05', N'034', N'Sierra Mojada', N'0001', N'Sierra Mojada', N'6375', N'3306', N'3069', N'1627');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (67, 159, 5, N'05', N'035', N'Torreón', N'0001', N'Torreón', N'639629', N'312135', N'327494', N'172719');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (68, 159, 5, N'05', N'036', N'Viesca', N'0001', N'Viesca', N'21319', N'10762', N'10557', N'5269');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (69, 159, 5, N'05', N'037', N'Villa Unión', N'0001', N'Villa Unión', N'6289', N'3217', N'3072', N'1788');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (70, 159, 5, N'05', N'038', N'Zaraza', N'0001', N'Zaraza', N'12702', N'6410', N'6292', N'3608');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (71, 159, 6, N'06', N'001', N'Armería', N'0001', N'Ciudad de Armería', N'28695', N'14456', N'14239', N'7732');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (72, 159, 6, N'06', N'002', N'Colima', N'0001', N'Colima', N'146904', N'71556', N'75348', N'41669');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (73, 159, 6, N'06', N'003', N'Comala', N'0001', N'Comala', N'20888', N'10543', N'10345', N'5491');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (74, 159, 6, N'06', N'004', N'Coquimatlán', N'0001', N'Coquimatlán', N'19385', N'9709', N'9676', N'5127');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (75, 159, 6, N'06', N'005', N'Cuauhtémoc', N'0001', N'Cuauhtémoc', N'27107', N'13483', N'13624', N'7431');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (76, 159, 6, N'06', N'006', N'Ixtlahuacán', N'0001', N'Ixtlahuacán', N'5300', N'2679', N'2621', N'1480');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (77, 159, 6, N'06', N'007', N'Manzanillo', N'0001', N'Manzanillo', N'161420', N'81007', N'80413', N'45572');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (78, 159, 6, N'06', N'008', N'Minatitlán', N'0001', N'Minatitlán', N'8174', N'4196', N'3978', N'2163');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (79, 159, 6, N'06', N'009', N'Tecomán', N'0001', N'Tecomán', N'112726', N'56804', N'55922', N'28914');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (80, 159, 6, N'06', N'010', N'Villa de Álvarez', N'0001', N'Ciudad de Villa de Álvarez', N'119956', N'58357', N'61599', N'34909');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (81, 159, 7, N'07', N'001', N'Acacoyagua', N'0001', N'Acacoyagua', N'16814', N'8436', N'8378', N'3838');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (82, 159, 7, N'07', N'002', N'Acala', N'0001', N'Acala', N'28947', N'14473', N'14474', N'6998');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (83, 159, 7, N'07', N'003', N'Acapetahua', N'0001', N'Acapetahua', N'27580', N'13891', N'13689', N'6912');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (84, 159, 7, N'07', N'004', N'Altamirano', N'0001', N'Altamirano', N'29865', N'15019', N'14846', N'6319');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (85, 159, 7, N'07', N'005', N'Amatán', N'0001', N'Amatán', N'21275', N'10791', N'10484', N'4294');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (86, 159, 7, N'07', N'006', N'Amatenan de la Frontera', N'0001', N'Amatenan de la Frontera', N'29547', N'14447', N'15100', N'6364');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (87, 159, 7, N'07', N'007', N'Amatenan del Valle', N'0001', N'Amatenan del Valle', N'8728', N'4183', N'4545', N'1946');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (88, 159, 7, N'07', N'008', N'Angel Albino Corzo', N'0001', N'Jaltenan de la Paz (Angel Albino Corzo);', N'26628', N'13359', N'13269', N'5410');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (89, 159, 7, N'07', N'009', N'Arriaga', N'0001', N'Arriaga', N'40042', N'19534', N'20508', N'11286');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (90, 159, 7, N'07', N'010', N'Bejucal de Ocampo', N'0001', N'Bejucal de Ocampo', N'7623', N'3856', N'3767', N'1325');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (91, 159, 7, N'07', N'011', N'Bella Vista', N'0001', N'Bella Vista', N'19281', N'9522', N'9759', N'3758');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (92, 159, 7, N'07', N'012', N'Berriozábal', N'0001', N'Berriozábal', N'43179', N'21562', N'21617', N'9505');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (93, 159, 7, N'07', N'013', N'Bochil', N'0001', N'Bochil', N'30642', N'15219', N'15423', N'6355');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (94, 159, 7, N'07', N'014', N'El Bosque', N'0001', N'El Bosque', N'18559', N'9090', N'9469', N'3809');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (95, 159, 7, N'07', N'015', N'Cacahoatán', N'0001', N'Cacahoatán', N'43811', N'21417', N'22394', N'9904');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (96, 159, 7, N'07', N'016', N'Catazajá', N'0001', N'Catazajá', N'17140', N'8747', N'8393', N'4230');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (97, 159, 7, N'07', N'017', N'Cintalapa', N'0001', N'Cintalapa de Figueroa', N'78114', N'39239', N'38875', N'17860');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (98, 159, 7, N'07', N'018', N'Coapilla', N'0001', N'Coapilla', N'8444', N'4200', N'4244', N'1971');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (99, 159, 7, N'07', N'019', N'Comitán de Domínguez', N'0001', N'Comitán de Domínguez', N'141013', N'67691', N'73322', N'34580');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (100, 159, 7, N'07', N'020', N'La Concordia', N'0001', N'La Concordia', N'44082', N'22120', N'21962', N'9907');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (101, 159, 7, N'07', N'021', N'Copainalá', N'0001', N'Copainalá', N'21050', N'10375', N'10675', N'5240');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (102, 159, 7, N'07', N'022', N'Chalchihuitán', N'0001', N'Chalchihuitán', N'14027', N'6919', N'7108', N'2909');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (103, 159, 7, N'07', N'023', N'Chamula', N'0001', N'Chamula', N'76941', N'35555', N'41386', N'16189');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (104, 159, 7, N'07', N'024', N'Chanal', N'0001', N'Chanal', N'10817', N'5376', N'5441', N'1783');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (105, 159, 7, N'07', N'025', N'Chapultenan', N'0001', N'Chapultenan', N'7332', N'3660', N'3672', N'1488');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (106, 159, 7, N'07', N'026', N'Chenalhó', N'0001', N'Chenalhó', N'36111', N'17820', N'18291', N'7023');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (107, 159, 7, N'07', N'027', N'Chiapa de Corzo', N'0001', N'Chiapa de Corzo', N'87603', N'43301', N'44302', N'21397');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (108, 159, 7, N'07', N'028', N'Chiapilla', N'0001', N'Chiapilla', N'5405', N'2781', N'2624', N'1347');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (109, 159, 7, N'07', N'029', N'Chicoasén', N'0001', N'Chicoasén', N'5018', N'2516', N'2502', N'1267');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (110, 159, 7, N'07', N'030', N'Chicomuselo', N'0001', N'Chicomuselo', N'31515', N'15715', N'15800', N'6756');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (111, 159, 7, N'07', N'031', N'Chilón', N'0001', N'Chilón', N'111554', N'55205', N'56349', N'19923');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (112, 159, 7, N'07', N'032', N'Escuintla', N'0001', N'Escuintla', N'30068', N'14786', N'15282', N'6852');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (113, 159, 7, N'07', N'033', N'Francisco León', N'0042', N'Rivera el Viejo Carmen', N'7000', N'3540', N'3460', N'1314');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (114, 159, 7, N'07', N'034', N'Frontera Comalapa', N'0001', N'Frontera Comalapa', N'67012', N'32631', N'34381', N'15440');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (115, 159, 7, N'07', N'035', N'Frontera Hidal', N'0001', N'Frontera Hidal', N'12665', N'6229', N'6436', N'3029');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (116, 159, 7, N'07', N'036', N'La Grandeza', N'0001', N'La Grandeza', N'7272', N'3649', N'3623', N'1256');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (117, 159, 7, N'07', N'037', N'Huehuetán', N'0001', N'Huehuetán', N'33444', N'16355', N'17089', N'8060');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (118, 159, 7, N'07', N'038', N'Huixtán', N'0001', N'Huixtán', N'21507', N'10599', N'10908', N'4018');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (119, 159, 7, N'07', N'039', N'Huitiupán', N'0001', N'Huitiupán', N'22536', N'11368', N'11168', N'4640');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (120, 159, 7, N'07', N'040', N'Huixtla', N'0001', N'Huixtla', N'51359', N'24914', N'26445', N'12894');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (121, 159, 7, N'07', N'041', N'La Independencia', N'0001', N'La Independencia', N'41266', N'20256', N'21010', N'9068');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (122, 159, 7, N'07', N'042', N'Ixhuatán', N'0001', N'Ixhuatán', N'10239', N'5070', N'5169', N'2107');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (123, 159, 7, N'07', N'043', N'Ixtacomitán', N'0001', N'Ixtacomitán', N'10176', N'5077', N'5099', N'2235');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (124, 159, 7, N'07', N'044', N'Ixtapa', N'0001', N'Ixtapa', N'24517', N'12121', N'12396', N'4966');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (125, 159, 7, N'07', N'045', N'Ixtapangajoya', N'0001', N'Ixtapangajoya', N'5478', N'2775', N'2703', N'1181');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (126, 159, 7, N'07', N'046', N'Jiquipilas', N'0001', N'Jiquipilas', N'37818', N'18758', N'19060', N'9627');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (127, 159, 7, N'07', N'047', N'Jitotol', N'0001', N'Jitotol', N'18683', N'9448', N'9235', N'3852');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (128, 159, 7, N'07', N'048', N'Juárez', N'0001', N'Juárez', N'21084', N'10481', N'10603', N'5225');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (129, 159, 7, N'07', N'049', N'Larráinzar', N'0001', N'Larráinzar', N'20349', N'10035', N'10314', N'3909');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (130, 159, 7, N'07', N'050', N'La Libertad', N'0001', N'La Libertad', N'4974', N'2441', N'2533', N'1412');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (131, 159, 7, N'07', N'051', N'Mapastepec', N'0001', N'Mapastepec', N'43913', N'21680', N'22233', N'10865');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (132, 159, 7, N'07', N'052', N'Las Margaritas', N'0001', N'Las Margaritas', N'111484', N'54787', N'56697', N'21675');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (133, 159, 7, N'07', N'053', N'Mazapa de Madero', N'0001', N'Mazapa de Madero', N'7793', N'3868', N'3925', N'1462');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (134, 159, 7, N'07', N'054', N'Mazatán', N'0001', N'Mazatán', N'26573', N'13165', N'13408', N'6908');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (135, 159, 7, N'07', N'055', N'Metapa', N'0001', N'Metapa de Domínguez', N'5033', N'2432', N'2601', N'1262');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (136, 159, 7, N'07', N'056', N'Mitontic', N'0001', N'Mitontic', N'11157', N'5497', N'5660', N'2064');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (137, 159, 7, N'07', N'057', N'Motozintla', N'0001', N'Motozintla de Mendoza', N'69119', N'34033', N'35086', N'13798');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (138, 159, 7, N'07', N'058', N'Nicolás Ruíz', N'0001', N'Nicolás Ruíz', N'4317', N'2226', N'2091', N'922');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (139, 159, 7, N'07', N'059', N'Ocosin', N'0001', N'Ocosin', N'198877', N'99113', N'99764', N'38961');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (140, 159, 7, N'07', N'060', N'Ocotepec', N'0001', N'Ocotepec', N'11878', N'5893', N'5985', N'2287');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (141, 159, 7, N'07', N'061', N'Ocozocoautla de Espinosa', N'0001', N'Ocozocoautla de Espinosa', N'82059', N'40580', N'41479', N'18308');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (142, 159, 7, N'07', N'062', N'Ostuacán', N'0001', N'Ostuacán', N'17067', N'8614', N'8453', N'3653');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (143, 159, 7, N'07', N'063', N'Osumacinta', N'0001', N'Osumacinta', N'3792', N'1894', N'1898', N'919');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (144, 159, 7, N'07', N'064', N'Oxchuc', N'0001', N'Oxchuc', N'43350', N'21844', N'21506', N'8266');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (145, 159, 7, N'07', N'065', N'Palenque', N'0001', N'Palenque', N'110918', N'54786', N'56132', N'25617');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (146, 159, 7, N'07', N'066', N'Pantelhó', N'0001', N'Pantelhó', N'20589', N'10226', N'10363', N'3827');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (147, 159, 7, N'07', N'067', N'Pantepec', N'0001', N'Pantepec', N'10870', N'5399', N'5471', N'2367');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (148, 159, 7, N'07', N'068', N'Pichucalco', N'0001', N'Pichucalco', N'29813', N'14820', N'14993', N'7215');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (149, 159, 7, N'07', N'069', N'Pijijiapan', N'0001', N'Pijijiapan', N'50079', N'24803', N'25276', N'12808');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (150, 159, 7, N'07', N'070', N'El Porvenir', N'0001', N'El Porvenir de Velasco Suárez', N'13201', N'6586', N'6615', N'2182');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (151, 159, 7, N'07', N'071', N'Villa Comaltitlán', N'0001', N'Villa Comaltitlán', N'27899', N'13850', N'14049', N'6607');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (152, 159, 7, N'07', N'072', N'Pueblo Nuevo Solistahuacán', N'0001', N'Pueblo Nuevo Solistahuacán', N'31075', N'15104', N'15971', N'6186');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (153, 159, 7, N'07', N'073', N'Rayón', N'0001', N'Rayón', N'9002', N'4482', N'4520', N'1869');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (154, 159, 7, N'07', N'074', N'Reforma', N'0001', N'Reforma', N'40711', N'20004', N'20707', N'10304');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (155, 159, 7, N'07', N'075', N'Las Rosas', N'0001', N'Las Rosas', N'25530', N'12659', N'12871', N'5951');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (156, 159, 7, N'07', N'076', N'Sabanilla', N'0001', N'Sabanilla', N'25187', N'12606', N'12581', N'5272');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (157, 159, 7, N'07', N'077', N'Salto de Agua', N'0001', N'Salto de Agua', N'57253', N'28433', N'28820', N'11476');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (158, 159, 7, N'07', N'078', N'San Cristóbal de las Casas', N'0001', N'San Cristóbal de las Casas', N'185917', N'88996', N'96921', N'42161');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (159, 159, 7, N'07', N'079', N'San Fernando', N'0001', N'San Fernando', N'33060', N'16685', N'16375', N'7707');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (160, 159, 7, N'07', N'080', N'Siltepec', N'0001', N'Siltepec', N'38143', N'19349', N'18794', N'6754');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (161, 159, 7, N'07', N'081', N'Simojovel', N'0001', N'Simojovel de Allende', N'40297', N'19875', N'20422', N'7844');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (162, 159, 7, N'07', N'082', N'Sitalá', N'0001', N'Sitalá', N'12269', N'6113', N'6156', N'2394');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (163, 159, 7, N'07', N'083', N'Socoltenan', N'0001', N'Socoltenan', N'17125', N'8527', N'8598', N'4165');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (164, 159, 7, N'07', N'084', N'Solosuchiapa', N'0001', N'Solosuchiapa', N'8065', N'4054', N'4011', N'1722');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (165, 159, 7, N'07', N'085', N'Soyaló', N'0001', N'Soyaló', N'9740', N'4887', N'4853', N'2182');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (166, 159, 7, N'07', N'086', N'Suchiapa', N'0001', N'Suchiapa', N'21045', N'10551', N'10494', N'4732');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (167, 159, 7, N'07', N'087', N'Suchiate', N'0001', N'Ciudad Hidal', N'35056', N'17171', N'17885', N'8811');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (168, 159, 7, N'07', N'088', N'Sunuapa', N'0001', N'Sunuapa', N'2235', N'1143', N'1092', N'475');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (169, 159, 7, N'07', N'089', N'Tapachula', N'0001', N'Tapachula de Córdova y Ordóñez', N'320451', N'154221', N'166230', N'81913');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (170, 159, 7, N'07', N'090', N'Tapalapa', N'0001', N'Tapalapa', N'4121', N'2002', N'2119', N'996');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (171, 159, 7, N'07', N'091', N'Tapilula', N'0001', N'Tapilula', N'12170', N'6009', N'6161', N'2784');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (172, 159, 7, N'07', N'092', N'Tecpatán', N'0001', N'Tecpatán', N'41045', N'20420', N'20625', N'9582');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (173, 159, 7, N'07', N'093', N'Tenejapa', N'0001', N'Tenejapa', N'40268', N'19761', N'20507', N'7177');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (174, 159, 7, N'07', N'094', N'Teopisca', N'0001', N'Teopisca', N'37607', N'18230', N'19377', N'7939');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (175, 159, 7, N'07', N'096', N'Tila', N'0001', N'Tila', N'71432', N'35704', N'35728', N'14177');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (176, 159, 7, N'07', N'097', N'Tonalá', N'0001', N'Tonalá', N'84594', N'41927', N'42667', N'21835');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (177, 159, 7, N'07', N'098', N'Totolapa', N'0001', N'Totolapa', N'6375', N'3189', N'3186', N'1358');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (178, 159, 7, N'07', N'099', N'La Trinitaria', N'0001', N'La Trinitaria', N'72769', N'35593', N'37176', N'16739');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (179, 159, 7, N'07', N'100', N'Tumbalá', N'0001', N'Tumbalá', N'31723', N'15591', N'16132', N'6168');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (180, 159, 7, N'07', N'101', N'Tuxtla Gutiérrez', N'0001', N'Tuxtla Gutiérrez', N'553374', N'263941', N'289433', N'143886');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (181, 159, 7, N'07', N'102', N'Tuxtla Chico', N'0001', N'Tuxtla Chico', N'37737', N'18487', N'19250', N'8924');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (182, 159, 7, N'07', N'103', N'Tuzantán', N'0001', N'Tuzantán', N'28137', N'13896', N'14241', N'6477');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (183, 159, 7, N'07', N'104', N'Tzimol', N'0001', N'Tzimol', N'14009', N'6884', N'7125', N'3659');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (184, 159, 7, N'07', N'105', N'Unión Juárez', N'0001', N'Unión Juárez', N'14089', N'6883', N'7206', N'3216');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (185, 159, 7, N'07', N'106', N'Venustiano Carranza', N'0001', N'Venustiano Carranza', N'61341', N'30774', N'30567', N'14695');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (186, 159, 7, N'07', N'107', N'Villa Corzo', N'0001', N'Villa Corzo', N'74477', N'36798', N'37679', N'18048');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (187, 159, 7, N'07', N'108', N'Villaflores', N'0001', N'Villaflores', N'98618', N'48595', N'50023', N'24259');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (188, 159, 7, N'07', N'109', N'Yajalón', N'0001', N'Yajalón', N'34028', N'16644', N'17384', N'7318');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (189, 159, 7, N'07', N'110', N'San Lucas', N'0001', N'San Lucas', N'6734', N'3404', N'3330', N'1506');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (190, 159, 7, N'07', N'111', N'Zinacantán', N'0001', N'Zinacantán', N'36489', N'17176', N'19313', N'6979');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (191, 159, 7, N'07', N'112', N'San Juan Cancuc', N'0001', N'San Juan Cancuc', N'29016', N'14154', N'14862', N'5121');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (192, 159, 7, N'07', N'113', N'Aldama', N'0001', N'Aldama', N'5072', N'2438', N'2634', N'969');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (193, 159, 7, N'07', N'114', N'Benemérito de las Américas', N'0001', N'Benemérito de las Américas', N'17282', N'8695', N'8587', N'3575');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (194, 159, 7, N'07', N'115', N'Maravilla Tenejapa', N'0001', N'Maravilla Tenejapa', N'11451', N'5835', N'5616', N'2005');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (195, 159, 7, N'07', N'116', N'Marqués de Comillas', N'0001', N'Zamora Pico de Oro', N'9856', N'4993', N'4863', N'1906');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (196, 159, 7, N'07', N'117', N'Montecristo de Guerrero', N'0001', N'Montecristo de Guerrero', N'6900', N'3474', N'3426', N'1340');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (197, 159, 7, N'07', N'118', N'San Andrés Duraznal', N'0001', N'San Andrés Duraznal', N'4545', N'2195', N'2350', N'907');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (198, 159, 7, N'07', N'119', N'Santia el Pinar', N'0001', N'Santia el Pinar', N'3245', N'1607', N'1638', N'686');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (199, 159, 8, N'08', N'001', N'Ahumada', N'0001', N'Miguel Ahumada', N'11457', N'5852', N'5605', N'3134');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (200, 159, 8, N'08', N'002', N'Aldama', N'0001', N'Juan Aldama', N'22302', N'11099', N'11203', N'6251');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (201, 159, 8, N'08', N'003', N'Allende', N'0001', N'Valle de Ignacio Allende', N'8409', N'4258', N'4151', N'2507');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (202, 159, 8, N'08', N'004', N'Aquiles Serdán', N'0001', N'Santa Eulalia', N'10688', N'6272', N'4416', N'2459');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (203, 159, 8, N'08', N'005', N'Ascensión', N'0001', N'Ascensión', N'23975', N'12207', N'11768', N'6449');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (204, 159, 8, N'08', N'006', N'Bachíniva', N'0001', N'Bachíniva', N'6011', N'3074', N'2937', N'1957');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (205, 159, 8, N'08', N'007', N'Balleza', N'0001', N'Mariano Balleza', N'17672', N'8980', N'8692', N'4165');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (206, 159, 8, N'08', N'008', N'Batopilas', N'0001', N'Batopilas', N'14362', N'7297', N'7065', N'3017');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (207, 159, 8, N'08', N'009', N'Bocoyna', N'0001', N'Bocoyna', N'28766', N'14147', N'14619', N'7948');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (208, 159, 8, N'08', N'010', N'Buenaventura', N'0001', N'San Buenaventura', N'22378', N'11287', N'11091', N'6199');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (209, 159, 8, N'08', N'011', N'Camar', N'0001', N'Santa Rosalía de Camar', N'48748', N'24032', N'24716', N'13571');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (210, 159, 8, N'08', N'012', N'Carichí', N'0001', N'Carichí', N'8795', N'4403', N'4392', N'2075');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (211, 159, 8, N'08', N'013', N'Casas Grandes', N'0001', N'Casas Grandes', N'10587', N'5380', N'5207', N'3106');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (212, 159, 8, N'08', N'014', N'Coronado', N'0001', N'José Esteban Coronado', N'2284', N'1184', N'1100', N'675');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (213, 159, 8, N'08', N'015', N'Coyame del Sotol', N'0001', N'Santia de Coyame', N'1681', N'917', N'764', N'561');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (214, 159, 8, N'08', N'016', N'La Cruz', N'0001', N'La Cruz', N'3982', N'2043', N'1939', N'1096');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (215, 159, 8, N'08', N'017', N'Cuauhtémoc', N'0001', N'Cuauhtémoc', N'154639', N'75936', N'78703', N'43673');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (216, 159, 8, N'08', N'018', N'Cusihuiriachi', N'0001', N'Cusihuiriachi', N'5414', N'2812', N'2602', N'1663');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (217, 159, 8, N'08', N'019', N'Chihuahua', N'0001', N'Chihuahua', N'819543', N'399495', N'420048', N'237194');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (218, 159, 8, N'08', N'020', N'Chínipas', N'0001', N'Chínipas de Almada', N'8441', N'4448', N'3993', N'1941');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (219, 159, 8, N'08', N'021', N'Delicias', N'0001', N'Delicias', N'137935', N'68013', N'69922', N'39303');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (220, 159, 8, N'08', N'022', N'Dr. Belisario Domínguez', N'0001', N'San Lorenzo', N'2911', N'1478', N'1433', N'1017');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (221, 159, 8, N'08', N'023', N'Galeana', N'0001', N'Hermenegildo Galeana', N'5892', N'2941', N'2951', N'1379');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (222, 159, 8, N'08', N'024', N'Santa Isabel', N'0001', N'Santa Isabel', N'3937', N'1979', N'1958', N'1174');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (223, 159, 8, N'08', N'025', N'Gómez Farías', N'0001', N'Valentín Gómez Farías', N'8624', N'4295', N'4329', N'2690');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (224, 159, 8, N'08', N'026', N'Gran Morelos', N'0001', N'San Nicolás de Carretas', N'3209', N'1655', N'1554', N'1072');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (225, 159, 8, N'08', N'027', N'Guachochi', N'0001', N'Guachochi', N'49689', N'24624', N'25065', N'11466');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (226, 159, 8, N'08', N'028', N'Guadalupe', N'0001', N'Guadalupe', N'6458', N'3243', N'3215', N'1770');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (227, 159, 8, N'08', N'029', N'Guadalupe y Calvo', N'0001', N'Guadalupe y Calvo', N'53499', N'27053', N'26446', N'11503');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (228, 159, 8, N'08', N'030', N'Guazapares', N'0001', N'Témoris', N'8998', N'4600', N'4398', N'2106');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (229, 159, 8, N'08', N'031', N'Guerrero', N'0001', N'Vicente Guerrero', N'39626', N'19912', N'19714', N'11773');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (230, 159, 8, N'08', N'032', N'Hidal del Parral', N'0001', N'Hidal del Parral', N'107061', N'51883', N'55178', N'28958');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (231, 159, 8, N'08', N'033', N'Huejotitán', N'0001', N'Huejotitán', N'1049', N'522', N'527', N'332');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (232, 159, 8, N'08', N'034', N'Ignacio Zaraza', N'0001', N'Ignacio Zaraza', N'6934', N'3534', N'3400', N'2173');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (233, 159, 8, N'08', N'035', N'Janos', N'0001', N'Janos', N'10953', N'5727', N'5226', N'2810');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (234, 159, 8, N'08', N'036', N'Jiménez', N'0001', N'José Mariano Jiménez', N'41265', N'20564', N'20701', N'10914');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (235, 159, 8, N'08', N'037', N'Juárez', N'0001', N'Juárez', N'1332131', N'665691', N'666440', N'364639');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (236, 159, 8, N'08', N'038', N'Julimes', N'0001', N'Julimes', N'4953', N'2553', N'2400', N'1487');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (237, 159, 8, N'08', N'039', N'López', N'0001', N'Octaviano López', N'4025', N'2101', N'1924', N'1184');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (238, 159, 8, N'08', N'040', N'Madera', N'0001', N'Madera', N'29611', N'14969', N'14642', N'8450');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (239, 159, 8, N'08', N'041', N'Maguarichi', N'0001', N'Maguarichi', N'1921', N'994', N'927', N'527');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (240, 159, 8, N'08', N'042', N'Manuel Benavides', N'0001', N'Manuel Benavides', N'1601', N'871', N'730', N'499');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (241, 159, 8, N'08', N'043', N'Matachí', N'0001', N'Matachí', N'3104', N'1578', N'1526', N'981');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (242, 159, 8, N'08', N'044', N'Matamoros', N'0001', N'Mariano Matamoros', N'4499', N'2293', N'2206', N'1281');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (243, 159, 8, N'08', N'045', N'Meoqui', N'0001', N'Pedro Meoqui', N'43833', N'21930', N'21903', N'12279');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (244, 159, 8, N'08', N'046', N'Morelos', N'0001', N'Morelos', N'8343', N'4285', N'4058', N'1842');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (245, 159, 8, N'08', N'047', N'Moris', N'0001', N'Moris', N'5312', N'2775', N'2537', N'1363');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (246, 159, 8, N'08', N'048', N'Namiquipa', N'0001', N'Namiquipa', N'22880', N'11630', N'11250', N'7045');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (247, 159, 8, N'08', N'049', N'Nonoava', N'0001', N'Nonoava', N'2849', N'1479', N'1370', N'782');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (248, 159, 8, N'08', N'050', N'Nuevo Casas Grandes', N'0001', N'Nuevo Casas Grandes', N'59337', N'29058', N'30279', N'16975');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (249, 159, 8, N'08', N'051', N'Ocampo', N'0001', N'Melchor Ocampo', N'7546', N'3935', N'3611', N'1991');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (250, 159, 8, N'08', N'052', N'Ojinaga', N'0001', N'Manuel Ojinaga', N'26304', N'13290', N'13014', N'7736');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (251, 159, 8, N'08', N'053', N'Praxedis G. Guerrero', N'0001', N'Praxedis G. Guerrero', N'4799', N'2433', N'2366', N'1356');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (252, 159, 8, N'08', N'054', N'Riva Palacio', N'0001', N'San Andrés', N'8012', N'4076', N'3936', N'1964');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (253, 159, 8, N'08', N'055', N'Rosales', N'0001', N'Santa Cruz de Rosales', N'16785', N'8526', N'8259', N'4669');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (254, 159, 8, N'08', N'056', N'Rosario', N'0001', N'Valle del Rosario', N'2235', N'1131', N'1104', N'682');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (255, 159, 8, N'08', N'057', N'San Francisco de Borja', N'0001', N'San Francisco de Borja', N'2290', N'1183', N'1107', N'759');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (256, 159, 8, N'08', N'058', N'San Francisco de Conchos', N'0001', N'San Francisco de Conchos', N'2983', N'1549', N'1434', N'871');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (257, 159, 8, N'08', N'059', N'San Francisco del Oro', N'0001', N'San Francisco del Oro', N'4753', N'2399', N'2354', N'1357');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (258, 159, 8, N'08', N'060', N'Santa Bárbara', N'0001', N'Santa Bárbara', N'10427', N'5183', N'5244', N'2940');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (259, 159, 8, N'08', N'061', N'Satevó', N'0001', N'San Francisco Javier de Satevó', N'3662', N'1908', N'1754', N'1101');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (260, 159, 8, N'08', N'062', N'Saucillo', N'0001', N'Saucillo', N'32325', N'16275', N'16050', N'8893');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (261, 159, 8, N'08', N'063', N'Temósachic', N'0001', N'Temósachic', N'6211', N'3216', N'2995', N'1932');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (262, 159, 8, N'08', N'064', N'El Tule', N'0001', N'El Tule', N'1869', N'960', N'909', N'552');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (263, 159, 8, N'08', N'065', N'Urique', N'0001', N'Urique', N'20386', N'10342', N'10044', N'4824');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (264, 159, 8, N'08', N'066', N'Uruachi', N'0001', N'Uruachi', N'8200', N'4150', N'4050', N'2087');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (265, 159, 8, N'08', N'067', N'Valle de Zaraza', N'0001', N'Valle de Zaraza', N'5105', N'2636', N'2469', N'1552');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (266, 159, 9, N'09', N'002', N'Azcapotzalco', N'----', N'', N'414711', N'196053', N'218658', N'117264');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (267, 159, 9, N'09', N'003', N'Coyoacán', N'----', N'', N'620416', N'292491', N'327925', N'180946');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (268, 159, 9, N'09', N'004', N'Cuajimalpa de Morelos', N'----', N'', N'186391', N'88642', N'97749', N'47897');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (269, 159, 9, N'09', N'005', N'Gustavo A. Madero', N'----', N'', N'1185772', N'571233', N'614539', N'320756');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (270, 159, 9, N'09', N'006', N'Iztacalco', N'----', N'', N'384326', N'182534', N'201792', N'104406');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (271, 159, 9, N'09', N'007', N'Iztapalapa', N'----', N'', N'1815786', N'880998', N'934788', N'460747');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (272, 159, 9, N'09', N'008', N'La Magdalena Contreras', N'----', N'', N'239086', N'114492', N'124594', N'63267');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (273, 159, 9, N'09', N'009', N'Milpa Alta', N'----', N'', N'130582', N'64192', N'66390', N'31820');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (274, 159, 9, N'09', N'010', N'Álvaro Obregón', N'----', N'', N'727034', N'346041', N'380993', N'197926');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (275, 159, 9, N'09', N'011', N'Tláhuac', N'----', N'', N'360265', N'175210', N'185055', N'91254');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (276, 159, 9, N'09', N'012', N'Tlalpan', N'----', N'', N'650567', N'312139', N'338428', N'176086');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (277, 159, 9, N'09', N'013', N'Xochimilco', N'----', N'', N'415007', N'205305', N'209702', N'102778');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (278, 159, 9, N'09', N'014', N'Benito Juárez', N'----', N'', N'385439', N'176410', N'209029', N'141203');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (279, 159, 9, N'09', N'015', N'Cuauhtémoc', N'----', N'', N'531831', N'251725', N'280106', N'173907');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (280, 159, 9, N'09', N'016', N'Miguel Hidal', N'----', N'', N'372889', N'172667', N'200222', N'120186');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (281, 159, 9, N'09', N'017', N'Venustiano Carranza', N'----', N'', N'430978', N'203651', N'227327', N'123327');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (282, 159, 10, N'10', N'001', N'Canatlán', N'0001', N'Canatlán', N'31401', N'15633', N'15768', N'7888');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (283, 159, 10, N'10', N'002', N'Canelas', N'0001', N'Canelas', N'4122', N'2165', N'1957', N'971');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (284, 159, 10, N'10', N'003', N'Coneto de Comonfort', N'0001', N'Coneto de Comonfort', N'4530', N'2244', N'2286', N'1029');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (285, 159, 10, N'10', N'004', N'Cuencamé', N'0001', N'Cuencamé de Ceniceros', N'33664', N'16961', N'16703', N'8362');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (286, 159, 10, N'10', N'005', N'Duran', N'0001', N'Victoria de Duran', N'582267', N'281702', N'300565', N'148267');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (287, 159, 10, N'10', N'006', N'General Simón Bolívar', N'0001', N'General Simón Bolívar', N'10629', N'5290', N'5339', N'2496');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (288, 159, 10, N'10', N'007', N'Gómez Palacio', N'0001', N'Gómez Palacio', N'327985', N'161736', N'166249', N'83973');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (289, 159, 10, N'10', N'008', N'Guadalupe Victoria', N'0001', N'Guadalupe Victoria', N'34052', N'16987', N'17065', N'8581');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (290, 159, 10, N'10', N'009', N'Guanaceví', N'0001', N'Guanaceví', N'10149', N'5203', N'4946', N'2729');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (291, 159, 10, N'10', N'010', N'Hidal', N'0001', N'Villa Hidal', N'4265', N'2180', N'2085', N'1180');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (292, 159, 10, N'10', N'011', N'Indé', N'0001', N'Indé', N'5280', N'2635', N'2645', N'1496');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (293, 159, 10, N'10', N'012', N'Lerdo', N'0001', N'Lerdo', N'141043', N'69737', N'71306', N'35009');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (294, 159, 10, N'10', N'013', N'Mapimí', N'0001', N'Mapimí', N'25137', N'12549', N'12588', N'5978');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (295, 159, 10, N'10', N'014', N'Mezquital', N'0001', N'San Francisco del Mezquital', N'33396', N'16514', N'16882', N'6351');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (296, 159, 10, N'10', N'015', N'Nazas', N'0001', N'Nazas', N'12411', N'6162', N'6249', N'3120');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (297, 159, 10, N'10', N'016', N'Nombre de Dios', N'0001', N'Nombre de Dios', N'18488', N'9180', N'9308', N'4867');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (298, 159, 10, N'10', N'017', N'Ocampo', N'0001', N'Villa Ocampo', N'9626', N'4955', N'4671', N'2748');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (299, 159, 10, N'10', N'018', N'El Oro', N'0001', N'Santa María del Oro', N'11320', N'5668', N'5652', N'3233');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (300, 159, 10, N'10', N'019', N'Otáez', N'0001', N'Otáez', N'5208', N'2682', N'2526', N'1057');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (301, 159, 10, N'10', N'020', N'Pánuco de Coronado', N'0001', N'Francisco I. Madero', N'11927', N'5905', N'6022', N'3054');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (302, 159, 10, N'10', N'021', N'Peñón Blanco', N'0001', N'Peñón Blanco', N'10473', N'5309', N'5164', N'2623');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (303, 159, 10, N'10', N'022', N'Poanas', N'0001', N'Villa Unión', N'24918', N'12266', N'12652', N'6156');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (304, 159, 10, N'10', N'023', N'Pueblo Nuevo', N'0001', N'El Salto', N'49162', N'24407', N'24755', N'10359');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (305, 159, 10, N'10', N'024', N'Rodeo', N'0001', N'Rodeo', N'12788', N'6402', N'6386', N'3148');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (306, 159, 10, N'10', N'025', N'San Bernardo', N'0001', N'San Bernardo', N'3433', N'1805', N'1628', N'1069');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (307, 159, 10, N'10', N'026', N'San Dimas', N'0001', N'Tayoltita', N'19691', N'10039', N'9652', N'4506');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (308, 159, 10, N'10', N'027', N'San Juan de Guadalupe', N'0001', N'San Juan de Guadalupe', N'5947', N'2930', N'3017', N'1444');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (309, 159, 10, N'10', N'028', N'San Juan del Río', N'0001', N'San Juan del Río del Centauro del Norte', N'11855', N'5851', N'6004', N'2870');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (310, 159, 10, N'10', N'029', N'San Luis del Cordero', N'0001', N'San Luis del Cordero', N'2181', N'1112', N'1069', N'557');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (311, 159, 10, N'10', N'030', N'San Pedro del Gallo', N'0001', N'San Pedro del Gallo', N'1709', N'875', N'834', N'454');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (312, 159, 10, N'10', N'031', N'Santa Clara', N'0001', N'Santa Clara', N'7003', N'3500', N'3503', N'1742');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (313, 159, 10, N'10', N'032', N'Santia Papasquiaro', N'0001', N'Santia Papasquiaro', N'44966', N'22382', N'22584', N'11276');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (314, 159, 10, N'10', N'033', N'Súchil', N'0001', N'Súchil', N'6761', N'3240', N'3521', N'1695');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (315, 159, 10, N'10', N'034', N'Tamazula', N'0001', N'Tamazula de Victoria', N'26368', N'13702', N'12666', N'5223');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (316, 159, 10, N'10', N'035', N'Tepehuanes', N'0001', N'Santa Catarina de Tepehuanes', N'10745', N'5282', N'5463', N'2962');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (317, 159, 10, N'10', N'036', N'Tlahualilo', N'0001', N'Tlahualilo de Zaraza', N'22244', N'11137', N'11107', N'5626');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (318, 159, 10, N'10', N'037', N'Topia', N'0001', N'Topia', N'8581', N'4395', N'4186', N'1863');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (319, 159, 10, N'10', N'038', N'Vicente Guerrero', N'0001', N'Vicente Guerrero', N'21117', N'10206', N'10911', N'5454');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (320, 159, 10, N'10', N'039', N'Nuevo Ideal', N'0001', N'Nuevo Ideal', N'26092', N'12962', N'13130', N'6368');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (321, 159, 11, N'11', N'001', N'Abasolo', N'0001', N'Abasolo', N'84332', N'40281', N'44051', N'19091');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (322, 159, 11, N'11', N'002', N'Acámbaro', N'0001', N'Acámbaro', N'109030', N'51803', N'57227', N'27606');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (323, 159, 11, N'11', N'003', N'San Miguel de Allende', N'0001', N'San Miguel de Allende', N'160383', N'75878', N'84505', N'35699');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (324, 159, 11, N'11', N'004', N'Apaseo el Alto', N'0001', N'Apaseo el Alto', N'64433', N'31177', N'33256', N'14994');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (325, 159, 11, N'11', N'005', N'Apaseo el Grande', N'0001', N'Apaseo el Grande', N'85319', N'41038', N'44281', N'20135');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (326, 159, 11, N'11', N'006', N'Atarjea', N'0001', N'Atarjea', N'5610', N'2748', N'2862', N'1378');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (327, 159, 11, N'11', N'007', N'Celaya', N'0001', N'Celaya', N'468469', N'225024', N'243445', N'116973');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (328, 159, 11, N'11', N'008', N'Manuel Doblado', N'0001', N'Ciudad Manuel Doblado', N'37145', N'17546', N'19599', N'9147');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (329, 159, 11, N'11', N'009', N'Comonfort', N'0001', N'Comonfort', N'77794', N'36430', N'41364', N'16730');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (330, 159, 11, N'11', N'010', N'Coroneo', N'0001', N'Coroneo', N'11691', N'5462', N'6229', N'3082');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (331, 159, 11, N'11', N'011', N'Cortazar', N'0001', N'Cortazar', N'88397', N'42650', N'45747', N'20114');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (332, 159, 11, N'11', N'012', N'Cuerámaro', N'0001', N'Cuerámaro', N'27308', N'13071', N'14237', N'6646');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (333, 159, 11, N'11', N'013', N'Doctor Mora', N'0001', N'Doctor Mora', N'23324', N'11129', N'12195', N'5166');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (334, 159, 11, N'11', N'014', N'Dolores Hidal Cuna de la Independencia Nacional', N'0001', N'Dolores Hidal Cuna de la Independencia Nacional', N'148173', N'69891', N'78282', N'31745');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (335, 159, 11, N'11', N'015', N'Guanajuato', N'0001', N'Guanajuato', N'171709', N'82830', N'88879', N'41166');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (336, 159, 11, N'11', N'016', N'Huanímaro', N'0001', N'Huanímaro', N'20117', N'9421', N'10696', N'4648');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (337, 159, 11, N'11', N'017', N'Irapuato', N'0001', N'Irapuato', N'529440', N'254784', N'274656', N'121937');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (338, 159, 11, N'11', N'018', N'Jaral del Progreso', N'0001', N'Jaral del Progreso', N'36584', N'17661', N'18923', N'8884');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (339, 159, 11, N'11', N'019', N'Jerécuaro', N'0001', N'Jerécuaro', N'50832', N'23555', N'27277', N'12781');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (340, 159, 11, N'11', N'020', N'León', N'0001', N'León de los Aldama', N'1436480', N'701781', N'734699', N'330062');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (341, 159, 11, N'11', N'021', N'Moroleón', N'0001', N'Moroleón', N'49364', N'23282', N'26082', N'13079');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (342, 159, 11, N'11', N'022', N'Ocampo', N'0001', N'Ocampo', N'22683', N'10870', N'11813', N'4969');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (343, 159, 11, N'11', N'023', N'Pénjamo', N'0001', N'Pénjamo', N'149936', N'70551', N'79385', N'35791');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (344, 159, 11, N'11', N'024', N'Pueblo Nuevo', N'0001', N'Pueblo Nuevo', N'11169', N'5201', N'5968', N'2838');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (345, 159, 11, N'11', N'025', N'Purísima del Rincón', N'0001', N'Purísima de Bustos', N'68795', N'33782', N'35013', N'15155');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (346, 159, 11, N'11', N'026', N'Romita', N'0001', N'Romita', N'56655', N'27274', N'29381', N'12482');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (347, 159, 11, N'11', N'027', N'Salamanca', N'0001', N'Salamanca', N'260732', N'126354', N'134378', N'64084');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (348, 159, 11, N'11', N'028', N'Salvatierra', N'0001', N'Salvatierra', N'97054', N'45885', N'51169', N'24756');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (349, 159, 11, N'11', N'029', N'San Die de la Unión', N'0001', N'San Die de la Unión', N'37103', N'17286', N'19817', N'8199');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (350, 159, 11, N'11', N'030', N'San Felipe', N'0001', N'San Felipe', N'106952', N'51340', N'55612', N'22844');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (351, 159, 11, N'11', N'031', N'San Francisco del Rincón', N'0001', N'San Francisco del Rincón', N'113570', N'55026', N'58544', N'25585');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (352, 159, 11, N'11', N'032', N'San José Iturbide', N'0001', N'San José Iturbide', N'72411', N'34637', N'37774', N'16473');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (353, 159, 11, N'11', N'033', N'San Luis de la Paz', N'0001', N'San Luis de la Paz', N'115656', N'54726', N'60930', N'24263');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (354, 159, 11, N'11', N'034', N'Santa Catarina', N'0001', N'Santa Catarina', N'5120', N'2401', N'2719', N'1256');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (355, 159, 11, N'11', N'035', N'Santa Cruz de Juventino Rosas', N'0001', N'Juventino Rosas', N'79214', N'37921', N'41293', N'17156');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (356, 159, 11, N'11', N'036', N'Santia Maravatío', N'0001', N'Santia Maravatío', N'6670', N'3111', N'3559', N'1820');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (357, 159, 11, N'11', N'037', N'Silao de la Victoria', N'0001', N'Silao de la Victoria', N'173024', N'83948', N'89076', N'36669');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (358, 159, 11, N'11', N'038', N'Tarandacuao', N'0001', N'Tarandacuao', N'11641', N'5511', N'6130', N'2991');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (359, 159, 11, N'11', N'039', N'Tarimoro', N'0001', N'Tarimoro', N'35571', N'16975', N'18596', N'9236');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (360, 159, 11, N'11', N'040', N'Tierra Blanca', N'0001', N'Tierra Blanca', N'18175', N'8765', N'9410', N'3862');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (361, 159, 11, N'11', N'041', N'Uriangato', N'0001', N'Uriangato', N'59305', N'28331', N'30974', N'14869');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (362, 159, 11, N'11', N'042', N'Valle de Santia', N'0001', N'Valle de Santia', N'141058', N'66846', N'74212', N'33026');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (363, 159, 11, N'11', N'043', N'Victoria', N'0001', N'Victoria', N'19820', N'9365', N'10455', N'4539');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (364, 159, 11, N'11', N'044', N'Villagrán', N'0001', N'Villagrán', N'55782', N'26905', N'28877', N'12464');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (365, 159, 11, N'11', N'045', N'Xichú', N'0001', N'Xichú', N'11560', N'5534', N'6026', N'2655');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (366, 159, 11, N'11', N'046', N'Yuriria', N'0001', N'Yuriria', N'70782', N'33438', N'37344', N'17868');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (367, 159, 12, N'12', N'001', N'Acapulco de Juárez', N'0001', N'Acapulco de Juárez', N'789971', N'382276', N'407695', N'205559');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (368, 159, 12, N'12', N'002', N'Ahuacuotzin', N'0001', N'Ahuacuotzin', N'25027', N'11748', N'13279', N'4894');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (369, 159, 12, N'12', N'003', N'Ajuchitlán del Progreso', N'0001', N'Ajuchitlán del Progreso', N'38203', N'18342', N'19861', N'8302');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (370, 159, 12, N'12', N'004', N'Alcozauca de Guerrero', N'0001', N'Alcozauca de Guerrero', N'18971', N'8917', N'10054', N'3377');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (371, 159, 12, N'12', N'005', N'Alpoyeca', N'0001', N'Alpoyeca', N'6637', N'3114', N'3523', N'1472');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (372, 159, 12, N'12', N'006', N'Apaxtla', N'0001', N'Ciudad Apaxtla de Castrejón', N'12389', N'5949', N'6440', N'2870');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (373, 159, 12, N'12', N'007', N'Arcelia', N'0001', N'Arcelia', N'32181', N'15644', N'16537', N'7776');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (374, 159, 12, N'12', N'008', N'Atenan del Río', N'0001', N'Atenan del Río', N'8390', N'4015', N'4375', N'2065');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (375, 159, 12, N'12', N'009', N'Atlamajalcin del Monte', N'0001', N'Atlamajalcin del Monte', N'5706', N'2728', N'2978', N'1098');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (376, 159, 12, N'12', N'010', N'Atlixtac', N'0001', N'Atlixtac', N'26341', N'12674', N'13667', N'5657');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (377, 159, 12, N'12', N'011', N'Atoyac de Álvarez', N'0001', N'Atoyac de Álvarez', N'61316', N'30113', N'31203', N'15720');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (378, 159, 12, N'12', N'012', N'Ayutla de los Libres', N'0001', N'Ayutla de los Libres', N'62690', N'30706', N'31984', N'12508');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (379, 159, 12, N'12', N'013', N'Azoyú', N'0001', N'Azoyú', N'14429', N'7102', N'7327', N'3607');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (380, 159, 12, N'12', N'014', N'Benito Juárez', N'0001', N'San Jerónimo de Juárez', N'15019', N'7363', N'7656', N'4458');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (381, 159, 12, N'12', N'015', N'Buenavista de Cuéllar', N'0001', N'Buenavista de Cuéllar', N'12688', N'6192', N'6496', N'3458');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (382, 159, 12, N'12', N'016', N'Coahuayutla de José María Izazaga', N'0001', N'Coahuayutla de Guerrero', N'13025', N'6632', N'6393', N'3121');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (383, 159, 12, N'12', N'017', N'Cocula', N'0001', N'Cocula', N'14707', N'7060', N'7647', N'3851');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (384, 159, 12, N'12', N'018', N'Copala', N'0001', N'Copala', N'13636', N'6717', N'6919', N'3372');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (385, 159, 12, N'12', N'019', N'Copalillo', N'0001', N'Copalillo', N'14456', N'6860', N'7596', N'2851');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (386, 159, 12, N'12', N'020', N'Copanatoyac', N'0001', N'Copanatoyac', N'18855', N'9049', N'9806', N'3600');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (387, 159, 12, N'12', N'021', N'Coyuca de Benítez', N'0001', N'Coyuca de Benítez', N'73460', N'35960', N'37500', N'18539');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (388, 159, 12, N'12', N'022', N'Coyuca de Catalán', N'0001', N'Coyuca de Catalán', N'42069', N'21849', N'20220', N'10517');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (389, 159, 12, N'12', N'023', N'Cuajinicuilapa', N'0001', N'Cuajinicuilapa', N'25922', N'12944', N'12978', N'6029');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (390, 159, 12, N'12', N'024', N'Cualác', N'0001', N'Cualác', N'7007', N'3344', N'3663', N'1612');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (391, 159, 12, N'12', N'025', N'Cuautepec', N'0001', N'Cuautepec', N'15115', N'7554', N'7561', N'3402');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (392, 159, 12, N'12', N'026', N'Cuetzala del Progreso', N'0001', N'Cuetzala del Progreso', N'9166', N'4443', N'4723', N'2333');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (393, 159, 12, N'12', N'027', N'Cutzamala de Pinzón', N'0001', N'Cutzamala de Pinzón', N'21388', N'10528', N'10860', N'5790');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (394, 159, 12, N'12', N'028', N'Chilapa de Álvarez', N'0001', N'Chilapa de Álvarez', N'120790', N'57940', N'62850', N'25917');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (395, 159, 12, N'12', N'029', N'Chilpancin de los Bravo', N'0001', N'Chilpancin de los Bravo', N'241717', N'115443', N'126274', N'57172');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (396, 159, 12, N'12', N'030', N'Florencio Villarreal', N'0001', N'Cruz Grande', N'20175', N'9967', N'10208', N'4639');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (397, 159, 12, N'12', N'031', N'General Canuto A. Neri', N'0001', N'Acapetlahuaya', N'6301', N'3042', N'3259', N'1464');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (398, 159, 12, N'12', N'032', N'General Heliodoro Castillo', N'0001', N'Tlacotepec', N'36586', N'18348', N'18238', N'7108');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (399, 159, 12, N'12', N'033', N'Huamuxtitlán', N'0001', N'Huamuxtitlán', N'14393', N'6823', N'7570', N'3485');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (400, 159, 12, N'12', N'034', N'Huitzuco de los Figueroa', N'0001', N'Ciudad de Huitzuco', N'37364', N'17935', N'19429', N'10018');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (401, 159, 12, N'12', N'035', N'Iguala de la Independencia', N'0001', N'Iguala de la Independencia', N'140363', N'67611', N'72752', N'35301');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (402, 159, 12, N'12', N'036', N'Igualapa', N'0001', N'Igualapa', N'10815', N'5290', N'5525', N'2392');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (403, 159, 12, N'12', N'037', N'Ixcateopan de Cuauhtémoc', N'0001', N'Ixcateopan de Cuauhtémoc', N'6603', N'3148', N'3455', N'1637');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (404, 159, 12, N'12', N'038', N'Zihuatanejo de Azueta', N'0001', N'Zihuatanejo', N'118211', N'58314', N'59897', N'31942');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (405, 159, 12, N'12', N'039', N'Juan R. Escudero', N'0001', N'Tierra Colorada', N'24364', N'11949', N'12415', N'6069');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (406, 159, 12, N'12', N'040', N'Leonardo Bravo', N'0001', N'Chichihualco', N'24720', N'12231', N'12489', N'5468');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (407, 159, 12, N'12', N'041', N'Malinaltepec', N'0001', N'Malinaltepec', N'29599', N'14110', N'15489', N'5726');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (408, 159, 12, N'12', N'042', N'Mártir de Cuilapan', N'0001', N'Apan', N'17702', N'8504', N'9198', N'3941');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (409, 159, 12, N'12', N'043', N'Metlatónoc', N'0001', N'Metlatónoc', N'18976', N'9014', N'9962', N'3402');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (410, 159, 12, N'12', N'044', N'Mochitlán', N'0001', N'Mochitlán', N'11376', N'5617', N'5759', N'2742');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (411, 159, 12, N'12', N'045', N'Olinalá', N'0001', N'Olinalá', N'24723', N'11878', N'12845', N'5012');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (412, 159, 12, N'12', N'046', N'Ometepec', N'0001', N'Ometepec', N'61306', N'29891', N'31415', N'13352');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (413, 159, 12, N'12', N'047', N'Pedro Ascencio Alquisiras', N'0001', N'Ixcapuzalco', N'6978', N'3215', N'3763', N'1528');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (414, 159, 12, N'12', N'048', N'Petatlán', N'0001', N'Petatlán', N'44979', N'22397', N'22582', N'11241');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (415, 159, 12, N'12', N'049', N'Pilcaya', N'0001', N'Pilcaya', N'11558', N'5597', N'5961', N'2979');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (416, 159, 12, N'12', N'050', N'Pungarabato', N'0001', N'Ciudad Altamirano', N'37035', N'17921', N'19114', N'8927');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (417, 159, 12, N'12', N'051', N'Quechultenan', N'0001', N'Quechultenan', N'34728', N'16855', N'17873', N'7753');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (418, 159, 12, N'12', N'052', N'San Luis Acatlán', N'0001', N'San Luis Acatlán', N'42360', N'20867', N'21493', N'8447');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (419, 159, 12, N'12', N'053', N'San Marcos', N'0001', N'San Marcos', N'48501', N'23896', N'24605', N'11729');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (420, 159, 12, N'12', N'054', N'San Miguel Totolapan', N'0001', N'San Miguel Totolapan', N'28009', N'13755', N'14254', N'5670');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (421, 159, 12, N'12', N'055', N'Taxco de Alarcón', N'0001', N'Taxco de Alarcón', N'104053', N'50432', N'53621', N'26912');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (422, 159, 12, N'12', N'056', N'Tecoanapa', N'0001', N'Tecoanapa', N'44079', N'21733', N'22346', N'9442');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (423, 159, 12, N'12', N'057', N'Técpan de Galeana', N'0001', N'Técpan de Galeana', N'62071', N'30871', N'31200', N'16736');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (424, 159, 12, N'12', N'058', N'Teloloapan', N'0001', N'Teloloapan', N'53769', N'25442', N'28327', N'12638');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (425, 159, 12, N'12', N'059', N'Tepecoacuilco de Trujano', N'0001', N'Tepecoacuilco de Trujano', N'30470', N'14612', N'15858', N'7989');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (426, 159, 12, N'12', N'060', N'Tetipac', N'0001', N'Tetipac', N'13128', N'6356', N'6772', N'3208');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (427, 159, 12, N'12', N'061', N'Tixtla de Guerrero', N'0001', N'Tixtla de Guerrero', N'40058', N'19369', N'20689', N'9156');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (428, 159, 12, N'12', N'062', N'Tlacoachistlahuaca', N'0001', N'Tlacoachistlahuaca', N'21306', N'10191', N'11115', N'3900');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (429, 159, 12, N'12', N'063', N'Tlacoapa', N'0001', N'Tlacoapa', N'9967', N'4734', N'5233', N'2072');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (430, 159, 12, N'12', N'064', N'Tlalchapa', N'0001', N'Tlalchapa', N'11495', N'5737', N'5758', N'3148');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (431, 159, 12, N'12', N'065', N'Tlalixtaquilla de Maldonado', N'0001', N'Tlalixtaquilla', N'7096', N'3396', N'3700', N'1600');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (432, 159, 12, N'12', N'066', N'Tlapa de Comonfort', N'0001', N'Tlapa de Comonfort', N'81419', N'38983', N'42436', N'16252');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (433, 159, 12, N'12', N'067', N'Tlapehuala', N'0001', N'Tlapehuala', N'21819', N'10558', N'11261', N'5335');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (434, 159, 12, N'12', N'068', N'La Unión de Isidoro Montes de Oca', N'0001', N'La Unión', N'25712', N'13087', N'12625', N'6485');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (435, 159, 12, N'12', N'069', N'Xalpatláhuac', N'0001', N'Xalpatláhuac', N'12240', N'5690', N'6550', N'2384');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (436, 159, 12, N'12', N'070', N'Xochihuehuetlán', N'0001', N'Xochihuehuetlán', N'7079', N'3289', N'3790', N'1711');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (437, 159, 12, N'12', N'071', N'Xochistlahuaca', N'0001', N'Xochistlahuaca', N'28089', N'13646', N'14443', N'6034');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (438, 159, 12, N'12', N'072', N'Zapotitlán Tablas', N'0001', N'Zapotitlán Tablas', N'10516', N'5037', N'5479', N'2239');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (439, 159, 12, N'12', N'073', N'Zirándaro', N'0001', N'Zirándaro de los Chávez', N'18813', N'9799', N'9014', N'4898');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (440, 159, 12, N'12', N'074', N'Zitlala', N'0001', N'Zitlala', N'22587', N'10750', N'11837', N'5121');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (441, 159, 12, N'12', N'075', N'Eduardo Neri', N'0001', N'Zumpan del Río', N'46158', N'22634', N'23524', N'10470');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (442, 159, 12, N'12', N'076', N'Acatepec', N'0001', N'Acatepec', N'32792', N'16070', N'16722', N'6549');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (443, 159, 12, N'12', N'077', N'Marquelia', N'0001', N'Marquelia', N'12912', N'6396', N'6516', N'3111');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (444, 159, 12, N'12', N'078', N'Cochoapa el Grande', N'0001', N'Cochoapa el Grande', N'18778', N'8945', N'9833', N'3351');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (445, 159, 12, N'12', N'079', N'José Joaquín de Herrera', N'0001', N'Hueycantenan', N'15678', N'7743', N'7935', N'3156');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (446, 159, 12, N'12', N'080', N'Juchitán', N'0001', N'Juchitán', N'7166', N'3605', N'3561', N'1724');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (447, 159, 12, N'12', N'081', N'Iliatenco', N'0001', N'Iliatenco', N'10522', N'5075', N'5447', N'2076');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (448, 159, 13, N'13', N'001', N'Acatlán', N'0001', N'Acatlán', N'20077', N'9669', N'10408', N'4871');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (449, 159, 13, N'13', N'002', N'Acaxochitlán', N'0001', N'Acaxochitlán', N'40583', N'19390', N'21193', N'8239');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (450, 159, 13, N'13', N'003', N'Actopan', N'0001', N'Actopan', N'54299', N'25741', N'28558', N'13248');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (451, 159, 13, N'13', N'004', N'Agua Blanca de Iturbide', N'0001', N'Agua Blanca Iturbide', N'8994', N'4294', N'4700', N'2264');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (452, 159, 13, N'13', N'005', N'Ajacuba', N'0001', N'Ajacuba', N'17055', N'8375', N'8680', N'4291');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (453, 159, 13, N'13', N'006', N'Alfajayucan', N'0001', N'Alfajayucan', N'18879', N'9208', N'9671', N'4930');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (454, 159, 13, N'13', N'007', N'Almoloya', N'0001', N'Almoloya', N'11294', N'5593', N'5701', N'2926');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (455, 159, 13, N'13', N'008', N'Apan', N'0001', N'Apan', N'42563', N'20359', N'22204', N'11027');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (456, 159, 13, N'13', N'009', N'El Arenal', N'0001', N'El Arenal', N'17374', N'8267', N'9107', N'4124');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (457, 159, 13, N'13', N'010', N'Atitalaquia', N'0001', N'Atitalaquia', N'26904', N'13253', N'13651', N'6683');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (458, 159, 13, N'13', N'011', N'Atlapexco', N'0001', N'Atlapexco', N'19452', N'9370', N'10082', N'4464');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (459, 159, 13, N'13', N'012', N'Atotonilco el Grande', N'0001', N'Atotonilco el Grande', N'26940', N'12776', N'14164', N'6816');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (460, 159, 13, N'13', N'013', N'Atotonilco de Tula', N'0001', N'Atotonilco de Tula', N'31078', N'15193', N'15885', N'7733');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (461, 159, 13, N'13', N'014', N'Calnali', N'0001', N'Calnali', N'16962', N'8195', N'8767', N'4441');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (462, 159, 13, N'13', N'015', N'Cardonal', N'0001', N'Cardonal', N'18427', N'8919', N'9508', N'4568');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (463, 159, 13, N'13', N'016', N'Cuautepec de Hinojosa', N'0001', N'Cuautepec de Hinojosa', N'54500', N'25893', N'28607', N'13245');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (464, 159, 13, N'13', N'017', N'Chapanton', N'0001', N'Chapanton', N'12271', N'6044', N'6227', N'3326');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (465, 159, 13, N'13', N'018', N'Chapulhuacán', N'0001', N'Chapulhuacán', N'22402', N'11328', N'11074', N'5452');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (466, 159, 13, N'13', N'019', N'Chilcuautla', N'0001', N'Chilcuautla', N'17436', N'8491', N'8945', N'4317');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (467, 159, 13, N'13', N'020', N'Eloxochitlán', N'0001', N'Eloxochitlán', N'2800', N'1321', N'1479', N'824');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (468, 159, 13, N'13', N'021', N'Emiliano Zapata', N'0001', N'Emiliano Zapata', N'13357', N'6322', N'7035', N'3408');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (469, 159, 13, N'13', N'022', N'Epazoyucan', N'0001', N'Epazoyucan', N'13830', N'6739', N'7091', N'3720');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (470, 159, 13, N'13', N'023', N'Francisco I. Madero', N'0001', N'Tepatepec', N'33901', N'16202', N'17699', N'8142');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (471, 159, 13, N'13', N'024', N'Huasca de Ocampo', N'0001', N'Huasca de Ocampo', N'17182', N'8261', N'8921', N'4159');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (472, 159, 13, N'13', N'025', N'Huautla', N'0001', N'Huautla', N'22621', N'10930', N'11691', N'5357');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (473, 159, 13, N'13', N'026', N'Huazalin', N'0001', N'Huazalin', N'12779', N'6295', N'6484', N'2669');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (474, 159, 13, N'13', N'027', N'Huehuetla', N'0001', N'Huehuetla', N'23563', N'11427', N'12136', N'5693');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (475, 159, 13, N'13', N'028', N'Huejutla de Reyes', N'0001', N'Huejutla de Reyes', N'122905', N'60254', N'62651', N'26316');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (476, 159, 13, N'13', N'029', N'Huichapan', N'0001', N'Huichapan', N'44253', N'21176', N'23077', N'11024');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (477, 159, 13, N'13', N'030', N'Ixmiquilpan', N'0001', N'Ixmiquilpan', N'86363', N'40740', N'45623', N'21248');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (478, 159, 13, N'13', N'031', N'Jacala de Ledezma', N'0001', N'Jacala', N'12804', N'6098', N'6706', N'3574');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (479, 159, 13, N'13', N'032', N'Jaltocán', N'0001', N'Jaltocán', N'10933', N'5416', N'5517', N'2404');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (480, 159, 13, N'13', N'033', N'Juárez Hidal', N'0001', N'Juárez', N'3193', N'1546', N'1647', N'932');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (481, 159, 13, N'13', N'034', N'Lolotla', N'0001', N'Lolotla', N'9843', N'4831', N'5012', N'2436');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (482, 159, 13, N'13', N'035', N'Metepec', N'0001', N'Metepec', N'11429', N'5339', N'6090', N'2724');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (483, 159, 13, N'13', N'036', N'San Agustín Metzquititlán', N'0001', N'Mezquititlán', N'9364', N'4480', N'4884', N'2590');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (484, 159, 13, N'13', N'037', N'Metztitlán', N'0001', N'Metztitlán', N'21623', N'10255', N'11368', N'6047');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (485, 159, 13, N'13', N'038', N'Mineral del Chico', N'0001', N'Mineral del Chico', N'7980', N'3875', N'4105', N'2093');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (486, 159, 13, N'13', N'039', N'Mineral del Monte', N'0001', N'Mineral del Monte', N'13864', N'6599', N'7265', N'3361');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (487, 159, 13, N'13', N'040', N'La Misión', N'0001', N'La Misión', N'10452', N'5147', N'5305', N'2788');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (488, 159, 13, N'13', N'041', N'Mixquiahuala de Juárez', N'0001', N'Mixquiahuala', N'42834', N'20483', N'22351', N'10560');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (489, 159, 13, N'13', N'042', N'Molan de Escamilla', N'0001', N'Molan', N'11209', N'5519', N'5690', N'2940');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (490, 159, 13, N'13', N'043', N'Nicolás Flores', N'0001', N'Nicolás Flores', N'6614', N'3177', N'3437', N'1718');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (491, 159, 13, N'13', N'044', N'Nopala de Villagrán', N'0001', N'Nopala', N'15666', N'7689', N'7977', N'4282');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (492, 159, 13, N'13', N'045', N'Omitlán de Juárez', N'0001', N'Omitlán de Juárez', N'8963', N'4299', N'4664', N'2166');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (493, 159, 13, N'13', N'046', N'San Felipe Orizatlán', N'0001', N'Orizatlán', N'39181', N'19406', N'19775', N'8880');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (494, 159, 13, N'13', N'047', N'Pacula', N'0001', N'Pacula', N'5049', N'2354', N'2695', N'1377');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (495, 159, 13, N'13', N'048', N'Pachuca de Soto', N'0001', N'Pachuca de Soto', N'267862', N'127236', N'140626', N'72920');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (496, 159, 13, N'13', N'049', N'Pisaflores', N'0001', N'Pisaflores', N'18244', N'9115', N'9129', N'4178');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (497, 159, 13, N'13', N'050', N'Progreso de Obregón', N'0001', N'Progreso', N'22217', N'10536', N'11681', N'5352');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (498, 159, 13, N'13', N'051', N'Mineral de la Reforma', N'0001', N'Pachuquilla', N'127404', N'60921', N'66483', N'35924');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (499, 159, 13, N'13', N'052', N'San Agustín Tlaxiaca', N'0001', N'San Agustín Tlaxiaca', N'32057', N'15597', N'16460', N'7702');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (500, 159, 13, N'13', N'053', N'San Bartolo Tutotepec', N'0001', N'San Bartolo Tutotepec', N'18137', N'9006', N'9131', N'4404');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (501, 159, 13, N'13', N'054', N'San Salvador', N'0001', N'San Salvador', N'32773', N'15794', N'16979', N'8133');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (502, 159, 13, N'13', N'055', N'Santia de Anaya', N'0001', N'Santia de Anaya', N'16014', N'7763', N'8251', N'4050');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (503, 159, 13, N'13', N'056', N'Santia Tulantepec de Lu Guerrero', N'0001', N'Santia Tulantepec', N'33495', N'15938', N'17557', N'8495');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (504, 159, 13, N'13', N'057', N'Singuilucan', N'0001', N'Singuilucan', N'14851', N'7252', N'7599', N'3736');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (505, 159, 13, N'13', N'058', N'Tasquillo', N'0001', N'Tasquillo', N'16865', N'7744', N'9121', N'4477');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (506, 159, 13, N'13', N'059', N'Tecozautla', N'0001', N'Tecozautla', N'35067', N'16658', N'18409', N'8798');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (507, 159, 13, N'13', N'060', N'Tenan de Doria', N'0001', N'Tenan de Doria', N'17206', N'8307', N'8899', N'4121');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (508, 159, 13, N'13', N'061', N'Tepeapulco', N'0001', N'Tepeapulco', N'51664', N'24741', N'26923', N'13960');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (509, 159, 13, N'13', N'062', N'Tepehuacán de Guerrero', N'0001', N'Tepehuacán de Guerrero', N'29125', N'14788', N'14337', N'6415');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (510, 159, 13, N'13', N'063', N'Tepeji del Río de Ocampo', N'0001', N'Tepeji del Río de Ocampo', N'80612', N'39569', N'41043', N'20170');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (511, 159, 13, N'13', N'064', N'Tepetitlán', N'0001', N'Tepetitlán', N'9940', N'4830', N'5110', N'2715');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (512, 159, 13, N'13', N'065', N'Tetepan', N'0001', N'Tetepan', N'11112', N'5465', N'5647', N'2706');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (513, 159, 13, N'13', N'066', N'Villa de Tezontepec', N'0001', N'Tezontepec', N'11654', N'5732', N'5922', N'2775');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (514, 159, 13, N'13', N'067', N'Tezontepec de Aldama', N'0001', N'Tezontepec de Aldama', N'48025', N'23622', N'24403', N'11947');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (515, 159, 13, N'13', N'068', N'Tianguisten', N'0001', N'Tianguisten', N'14037', N'6853', N'7184', N'3672');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (516, 159, 13, N'13', N'069', N'Tizayuca', N'0001', N'Tizayuca', N'97461', N'48102', N'49359', N'25329');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (517, 159, 13, N'13', N'070', N'Tlahuelilpan', N'0001', N'Tlahuelilpan', N'17153', N'8401', N'8752', N'4121');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (518, 159, 13, N'13', N'071', N'Tlahuiltepa', N'0001', N'Tlahuiltepa', N'9753', N'4821', N'4932', N'2756');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (519, 159, 13, N'13', N'072', N'Tlanalapa', N'0001', N'Tlanalapa', N'10248', N'4944', N'5304', N'2671');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (520, 159, 13, N'13', N'073', N'Tlanchinol', N'0001', N'Tlanchinol', N'36382', N'17975', N'18407', N'8080');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (521, 159, 13, N'13', N'074', N'Tlaxcoapan', N'0001', N'Tlaxcoapan', N'26758', N'13076', N'13682', N'6100');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (522, 159, 13, N'13', N'075', N'Tolcayuca', N'0001', N'Tolcayuca', N'13228', N'6454', N'6774', N'3381');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (523, 159, 13, N'13', N'076', N'Tula de Allende', N'0001', N'Tula de Allende', N'103919', N'50490', N'53429', N'27214');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (524, 159, 13, N'13', N'077', N'Tulancin de Bravo', N'0001', N'Tulancin', N'151584', N'71287', N'80297', N'38322');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (525, 159, 13, N'13', N'078', N'Xochiatipan', N'0001', N'Xochiatipan', N'19067', N'9364', N'9703', N'3937');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (526, 159, 13, N'13', N'079', N'Xochicoatlán', N'0001', N'Xochicoatlán', N'7320', N'3618', N'3702', N'2068');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (527, 159, 13, N'13', N'080', N'Yahualica', N'0001', N'Yahualica', N'23607', N'11574', N'12033', N'5226');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (528, 159, 13, N'13', N'081', N'Zacualtipán de Ángeles', N'0001', N'Zacualtipán', N'32437', N'15416', N'17021', N'8438');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (529, 159, 13, N'13', N'082', N'Zapotlán de Juárez', N'0001', N'Zapotlán de Juárez', N'18036', N'8678', N'9358', N'4559');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (530, 159, 13, N'13', N'083', N'Zempoala', N'0001', N'Zempoala', N'39143', N'19069', N'20074', N'10520');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (531, 159, 13, N'13', N'084', N'Zimapán', N'0001', N'Zimapán', N'38516', N'17948', N'20568', N'9745');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (532, 159, 14, N'14', N'001', N'Acatic', N'0001', N'Acatic', N'21206', N'10348', N'10858', N'5256');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (533, 159, 14, N'14', N'002', N'Acatlán de Juárez', N'0001', N'Acatlán de Juárez', N'23241', N'12220', N'11021', N'5363');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (534, 159, 14, N'14', N'003', N'Ahualulco de Mercado', N'0001', N'Ahualulco de Mercado', N'21714', N'10677', N'11037', N'5657');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (535, 159, 14, N'14', N'004', N'Amacueca', N'0001', N'Amacueca', N'5545', N'2674', N'2871', N'1411');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (536, 159, 14, N'14', N'005', N'Amatitán', N'0001', N'Amatitán', N'14648', N'7273', N'7375', N'3455');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (537, 159, 14, N'14', N'006', N'Ameca', N'0001', N'Ameca', N'57340', N'28013', N'29327', N'15559');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (538, 159, 14, N'14', N'007', N'San Juanito de Escobedo', N'0001', N'San Juanito de Escobedo', N'8896', N'4461', N'4435', N'2333');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (539, 159, 14, N'14', N'008', N'Arandas', N'0001', N'Arandas', N'72812', N'35135', N'37677', N'18033');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (540, 159, 14, N'14', N'009', N'El Arenal', N'0001', N'El Arenal', N'17545', N'8631', N'8914', N'4229');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (541, 159, 14, N'14', N'010', N'Atemajac de Brizuela', N'0001', N'Atemajac de Brizuela', N'6655', N'3303', N'3352', N'1437');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (542, 159, 14, N'14', N'011', N'Aten', N'0001', N'Aten', N'5400', N'2797', N'2603', N'1388');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (543, 159, 14, N'14', N'012', N'Atenguillo', N'0001', N'Atenguillo', N'4115', N'2014', N'2101', N'1182');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (544, 159, 14, N'14', N'013', N'Atotonilco el Alto', N'0001', N'Atotonilco el Alto', N'57717', N'28217', N'29500', N'14182');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (545, 159, 14, N'14', N'014', N'Atoyac', N'0001', N'Atoyac', N'8276', N'3962', N'4314', N'2255');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (546, 159, 14, N'14', N'015', N'Autlán de Navarro', N'0001', N'Autlán de Navarro', N'57559', N'28210', N'29349', N'15077');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (547, 159, 14, N'14', N'016', N'Ayotlán', N'0001', N'Ayotlán', N'38291', N'18603', N'19688', N'9095');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (548, 159, 14, N'14', N'017', N'Ayutla', N'0001', N'Ayutla', N'12664', N'6308', N'6356', N'3245');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (549, 159, 14, N'14', N'018', N'La Barca', N'0001', N'La Barca', N'64269', N'30920', N'33349', N'15557');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (550, 159, 14, N'14', N'019', N'Bolaños', N'0001', N'Bolaños', N'6820', N'3384', N'3436', N'1441');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (551, 159, 14, N'14', N'020', N'Cabo Corrientes', N'0001', N'El Tuito', N'10029', N'5176', N'4853', N'2615');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (552, 159, 14, N'14', N'021', N'Casimiro Castillo', N'0001', N'La Resolana', N'21475', N'10667', N'10808', N'5772');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (553, 159, 14, N'14', N'022', N'Cihuatlán', N'0001', N'Cihuatlán', N'39020', N'19694', N'19326', N'10306');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (554, 159, 14, N'14', N'023', N'Zapotlán el Grande', N'0001', N'Ciudad Guzmán', N'100534', N'48661', N'51873', N'25107');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (555, 159, 14, N'14', N'024', N'Cocula', N'0001', N'Cocula', N'26174', N'12721', N'13453', N'6819');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (556, 159, 14, N'14', N'025', N'Colotlán', N'0001', N'Colotlán', N'18091', N'8711', N'9380', N'4708');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (557, 159, 14, N'14', N'026', N'Concepción de Buenos Aires', N'0001', N'Concepción de Buenos Aires', N'5933', N'3011', N'2922', N'1619');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (558, 159, 14, N'14', N'027', N'Cuautitlán de García Barragán', N'0001', N'Cuautitlán de García Barragán', N'17322', N'8763', N'8559', N'4242');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (559, 159, 14, N'14', N'028', N'Cuautla', N'0001', N'Cuautla', N'2171', N'1045', N'1126', N'584');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (560, 159, 14, N'14', N'029', N'Cuquío', N'0001', N'Cuquío', N'17795', N'8488', N'9307', N'4488');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (561, 159, 14, N'14', N'030', N'Chapala', N'0001', N'Chapala', N'48839', N'23902', N'24937', N'12681');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (562, 159, 14, N'14', N'031', N'Chimaltitán', N'0001', N'Chimaltitán', N'3771', N'1869', N'1902', N'913');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (563, 159, 14, N'14', N'032', N'Chiquilistlán', N'0001', N'Chiquilistlán', N'5814', N'2896', N'2918', N'1341');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (564, 159, 14, N'14', N'033', N'Dellado', N'0001', N'Dellado', N'21132', N'10119', N'11013', N'5262');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (565, 159, 14, N'14', N'034', N'Ejutla', N'0001', N'Ejutla', N'2082', N'1072', N'1010', N'611');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (566, 159, 14, N'14', N'035', N'Encarnación de Díaz', N'0001', N'Encarnación de Díaz', N'51396', N'24692', N'26704', N'12508');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (567, 159, 14, N'14', N'036', N'Etzatlán', N'0001', N'Etzatlán', N'18632', N'9157', N'9475', N'4698');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (568, 159, 14, N'14', N'037', N'El Grullo', N'0001', N'El Grullo', N'23845', N'11622', N'12223', N'6321');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (569, 159, 14, N'14', N'038', N'Guachinan', N'0001', N'Guachinan', N'4323', N'2178', N'2145', N'1218');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (570, 159, 14, N'14', N'039', N'Guadalajara', N'0001', N'Guadalajara', N'1495189', N'717404', N'777785', N'379624');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (571, 159, 14, N'14', N'040', N'Hostotipaquillo', N'0001', N'Hostotipaquillo', N'10284', N'5501', N'4783', N'2261');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (572, 159, 14, N'14', N'041', N'Huejúcar', N'0001', N'Huejúcar', N'6084', N'2905', N'3179', N'1746');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (573, 159, 14, N'14', N'042', N'Huejuquilla el Alto', N'0001', N'Huejuquilla el Alto', N'8781', N'4237', N'4544', N'2143');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (574, 159, 14, N'14', N'043', N'La Huerta', N'0001', N'La Huerta', N'23428', N'11845', N'11583', N'6360');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (575, 159, 14, N'14', N'044', N'Ixtlahuacán de los Membrillos', N'0001', N'Ixtlahuacán de los Membrillos', N'41060', N'20419', N'20641', N'10493');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (576, 159, 14, N'14', N'045', N'Ixtlahuacán del Río', N'0001', N'Ixtlahuacán del Río', N'19005', N'9175', N'9830', N'4786');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (577, 159, 14, N'14', N'046', N'Jalostotitlán', N'0001', N'Jalostotitlán', N'31948', N'15598', N'16350', N'7594');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (578, 159, 14, N'14', N'047', N'Jamay', N'0001', N'Jamay', N'22881', N'11337', N'11544', N'5515');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (579, 159, 14, N'14', N'048', N'Jesús María', N'0001', N'Jesús María', N'18634', N'8571', N'10063', N'4634');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (580, 159, 14, N'14', N'049', N'Jilotlán de los Dolores', N'0001', N'Jilotlán de los Dolores', N'9545', N'4905', N'4640', N'2456');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (581, 159, 14, N'14', N'050', N'Jocotepec', N'0001', N'Jocotepec', N'42164', N'20839', N'21325', N'9375');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (582, 159, 14, N'14', N'051', N'Juanacatlán', N'0001', N'Juanacatlán', N'13218', N'6675', N'6543', N'3232');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (583, 159, 14, N'14', N'052', N'Juchitlán', N'0001', N'Juchitlán', N'5515', N'2637', N'2878', N'1495');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (584, 159, 14, N'14', N'053', N'Las de Moreno', N'0001', N'Las de Moreno', N'153817', N'74472', N'79345', N'36001');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (585, 159, 14, N'14', N'054', N'El Limón', N'0001', N'El Limón', N'5499', N'2752', N'2747', N'1740');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (586, 159, 14, N'14', N'055', N'Magdalena', N'0001', N'Magdalena', N'21321', N'10583', N'10738', N'5055');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (587, 159, 14, N'14', N'056', N'Santa María del Oro', N'0001', N'Santa María del Oro', N'2517', N'1273', N'1244', N'672');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (588, 159, 14, N'14', N'057', N'La Manzanilla de la Paz', N'0001', N'La Manzanilla de la Paz', N'3755', N'1790', N'1965', N'1059');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (589, 159, 14, N'14', N'058', N'Mascota', N'0001', N'Mascota', N'14245', N'7010', N'7235', N'3855');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (590, 159, 14, N'14', N'059', N'Mazamitla', N'0001', N'Mazamitla', N'13225', N'6288', N'6937', N'3284');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (591, 159, 14, N'14', N'060', N'Mexticacán', N'0001', N'Mexticacán', N'6034', N'2777', N'3257', N'1722');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (592, 159, 14, N'14', N'061', N'Mezquitic', N'0001', N'Mezquitic', N'18084', N'8745', N'9339', N'3754');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (593, 159, 14, N'14', N'062', N'Mixtlán', N'0001', N'Mixtlán', N'3574', N'1800', N'1774', N'946');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (594, 159, 14, N'14', N'063', N'Ocotlán', N'0001', N'Ocotlán', N'92967', N'45453', N'47514', N'23118');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (595, 159, 14, N'14', N'064', N'Ojuelos de Jalisco', N'0001', N'Ojuelos de Jalisco', N'30097', N'14636', N'15461', N'6718');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (596, 159, 14, N'14', N'065', N'Pihuamo', N'0001', N'Pihuamo', N'12119', N'6045', N'6074', N'3464');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (597, 159, 14, N'14', N'066', N'Poncitlán', N'0001', N'Poncitlán', N'48408', N'23721', N'24687', N'10714');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (598, 159, 14, N'14', N'067', N'Puerto Vallarta', N'0001', N'Puerto Vallarta', N'255681', N'128577', N'127104', N'68710');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (599, 159, 14, N'14', N'068', N'Villa Purificación', N'0001', N'Villa Purificación', N'11623', N'5933', N'5690', N'3108');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (600, 159, 14, N'14', N'069', N'Quitupan', N'0001', N'Quitupan', N'8691', N'4066', N'4625', N'2396');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (601, 159, 14, N'14', N'070', N'El Salto', N'0001', N'El Salto', N'138226', N'69006', N'69220', N'32233');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (602, 159, 14, N'14', N'071', N'San Cristóbal de la Barranca', N'0001', N'San Cristóbal de la Barranca', N'3176', N'1583', N'1593', N'770');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (603, 159, 14, N'14', N'072', N'San Die de Alejandría', N'0001', N'San Die de Alejandría', N'6647', N'3172', N'3475', N'1534');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (604, 159, 14, N'14', N'073', N'San Juan de los Las', N'0001', N'San Juan de los Las', N'65219', N'32066', N'33153', N'15134');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (605, 159, 14, N'14', N'074', N'San Julián', N'0001', N'San Julián', N'15454', N'7296', N'8158', N'3916');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (606, 159, 14, N'14', N'075', N'San Marcos', N'0001', N'San Marcos', N'3762', N'1918', N'1844', N'949');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (607, 159, 14, N'14', N'076', N'San Martín de Bolaños', N'0001', N'San Martín de Bolaños', N'3405', N'1704', N'1701', N'837');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (608, 159, 14, N'14', N'077', N'San Martín Hidal', N'0001', N'San Martín Hidal', N'26306', N'12785', N'13521', N'7263');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (609, 159, 14, N'14', N'078', N'San Miguel el Alto', N'0001', N'San Miguel el Alto', N'31166', N'14999', N'16167', N'7541');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (610, 159, 14, N'14', N'079', N'Gómez Farías', N'0001', N'San Sebastián del Sur', N'14011', N'6778', N'7233', N'3250');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (611, 159, 14, N'14', N'080', N'San Sebastián del Oeste', N'0001', N'San Sebastián del Oeste', N'5755', N'3008', N'2747', N'1574');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (612, 159, 14, N'14', N'081', N'Santa María de los Ángeles', N'0001', N'Santa María de los Ángeles', N'3726', N'1758', N'1968', N'1030');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (613, 159, 14, N'14', N'082', N'Sayula', N'0001', N'Sayula', N'34829', N'16733', N'18096', N'8308');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (614, 159, 14, N'14', N'083', N'Tala', N'0001', N'Tala', N'69031', N'34313', N'34718', N'17495');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (615, 159, 14, N'14', N'084', N'Talpa de Allende', N'0001', N'Talpa de Allende', N'14410', N'7215', N'7195', N'3669');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (616, 159, 14, N'14', N'085', N'Tamazula de rdiano', N'0001', N'Tamazula de rdiano', N'37986', N'18512', N'19474', N'10522');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (617, 159, 14, N'14', N'086', N'Tapalpa', N'0001', N'Tapalpa', N'18096', N'8848', N'9248', N'3942');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (618, 159, 14, N'14', N'087', N'Tecalitlán', N'0001', N'Tecalitlán', N'16847', N'8220', N'8627', N'4481');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (619, 159, 14, N'14', N'088', N'Tecolotlán', N'0001', N'Tecolotlán', N'16573', N'8292', N'8281', N'4555');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (620, 159, 14, N'14', N'089', N'Techaluta de Montenegro', N'0001', N'Techaluta de Montenegro', N'3511', N'1722', N'1789', N'938');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (621, 159, 14, N'14', N'090', N'Tenamaxtlán', N'0001', N'Tenamaxtlán', N'7051', N'3495', N'3556', N'2009');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (622, 159, 14, N'14', N'091', N'Teocaltiche', N'0001', N'Teocaltiche', N'40105', N'18973', N'21132', N'10106');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (623, 159, 14, N'14', N'092', N'Teocuitatlán de Corona', N'0001', N'Teocuitatlán de Corona', N'10837', N'5307', N'5530', N'3069');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (624, 159, 14, N'14', N'093', N'Tepatitlán de Morelos', N'0001', N'Tepatitlán de Morelos', N'136123', N'66244', N'69879', N'33088');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (625, 159, 14, N'14', N'094', N'Tequila', N'0001', N'Tequila', N'40697', N'20148', N'20549', N'9225');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (626, 159, 14, N'14', N'095', N'Teuchitlán', N'0001', N'Teuchitlán', N'9088', N'4425', N'4663', N'2429');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (627, 159, 14, N'14', N'096', N'Tizapán el Alto', N'0001', N'Tizapán el Alto', N'20857', N'10163', N'10694', N'5460');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (628, 159, 14, N'14', N'097', N'Tlajomulco de Zúñiga', N'0001', N'Tlajomulco de Zúñiga', N'416626', N'206958', N'209668', N'105973');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (629, 159, 14, N'14', N'098', N'San Pedro Tlaquepaque', N'0001', N'Tlaquepaque', N'608114', N'299904', N'308210', N'143359');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (630, 159, 14, N'14', N'099', N'Tolimán', N'0001', N'Tolimán', N'9591', N'4724', N'4867', N'2353');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (631, 159, 14, N'14', N'100', N'Tomatlán', N'0001', N'Tomatlán', N'35050', N'17822', N'17228', N'8908');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (632, 159, 14, N'14', N'101', N'Tonalá', N'0001', N'Tonalá', N'478689', N'243241', N'235448', N'107305');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (633, 159, 14, N'14', N'102', N'Tonaya', N'0001', N'Tonaya', N'5930', N'2874', N'3056', N'1647');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (634, 159, 14, N'14', N'103', N'Tonila', N'0001', N'Tonila', N'7256', N'3573', N'3683', N'1976');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (635, 159, 14, N'14', N'104', N'Totatiche', N'0001', N'Totatiche', N'4435', N'2209', N'2226', N'1334');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (636, 159, 14, N'14', N'105', N'Tototlán', N'0001', N'Tototlán', N'21871', N'10668', N'11203', N'5530');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (637, 159, 14, N'14', N'106', N'Tuxcacuesco', N'0001', N'Tuxcacuesco', N'4234', N'2168', N'2066', N'1104');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (638, 159, 14, N'14', N'107', N'Tuxcueca', N'0001', N'Tuxcueca', N'6316', N'3054', N'3262', N'1571');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (639, 159, 14, N'14', N'108', N'Tuxpan', N'0001', N'Tuxpan', N'34182', N'16442', N'17740', N'8165');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (640, 159, 14, N'14', N'109', N'Unión de San Antonio', N'0001', N'Unión de San Antonio', N'17325', N'8306', N'9019', N'4122');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (641, 159, 14, N'14', N'110', N'Unión de Tula', N'0001', N'Unión de Tula', N'13737', N'6620', N'7117', N'3687');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (642, 159, 14, N'14', N'111', N'Valle de Guadalupe', N'0001', N'Valle de Guadalupe', N'6705', N'3333', N'3372', N'1693');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (643, 159, 14, N'14', N'112', N'Valle de Juárez', N'0001', N'Valle de Juárez', N'5798', N'2806', N'2992', N'1613');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (644, 159, 14, N'14', N'113', N'San Gabriel', N'0001', N'San Gabriel', N'15310', N'7507', N'7803', N'3931');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (645, 159, 14, N'14', N'114', N'Villa Corona', N'0001', N'Villa Corona', N'16969', N'8357', N'8612', N'4431');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (646, 159, 14, N'14', N'115', N'Villa Guerrero', N'0001', N'Villa Guerrero', N'5638', N'2785', N'2853', N'1542');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (647, 159, 14, N'14', N'116', N'Villa Hidal', N'0001', N'Villa Hidal', N'18711', N'9043', N'9668', N'4604');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (648, 159, 14, N'14', N'117', N'Cañadas de Obregón', N'0001', N'Cañadas de Obregón', N'4152', N'2015', N'2137', N'1216');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (649, 159, 14, N'14', N'118', N'Yahualica de nzález Gallo', N'0001', N'Yahualica de nzález Gallo', N'22284', N'10586', N'11698', N'6293');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (650, 159, 14, N'14', N'119', N'Zacoalco de Torres', N'0001', N'Zacoalco de Torres', N'27901', N'13698', N'14203', N'6779');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (651, 159, 14, N'14', N'120', N'Zapopan', N'0001', N'Zapopan', N'1243756', N'607907', N'635849', N'317419');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (652, 159, 14, N'14', N'121', N'Zapotiltic', N'0001', N'Zapotiltic', N'29192', N'14181', N'15011', N'7527');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (653, 159, 14, N'14', N'122', N'Zapotitlán de Vadillo', N'0001', N'Zapotitlán de Vadillo', N'6685', N'3328', N'3357', N'1642');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (654, 159, 14, N'14', N'123', N'Zapotlán del Rey', N'0001', N'Zapotlán del Rey', N'17585', N'8671', N'8914', N'4343');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (655, 159, 14, N'14', N'124', N'Zapotlanejo', N'0001', N'Zapotlanejo', N'63636', N'31114', N'32522', N'15642');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (656, 159, 14, N'14', N'125', N'San Ignacio Cerro rdo', N'0001', N'San Ignacio Cerro rdo', N'17626', N'8501', N'9125', N'4171');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (657, 159, 15, N'15', N'001', N'Acambay de Ruíz Castañeda', N'0001', N'Villa de Acambay de Ruíz Castañeda', N'60918', N'29449', N'31469', N'14207');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (658, 159, 15, N'15', N'002', N'Acolman', N'0001', N'Acolman de Nezahualcóyotl', N'136558', N'68392', N'68166', N'33781');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (659, 159, 15, N'15', N'003', N'Aculco', N'0001', N'Aculco de Espinoza', N'44823', N'22043', N'22780', N'10518');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (660, 159, 15, N'15', N'004', N'Almoloya de Alquisiras', N'0001', N'Almoloya de Alquisiras', N'14856', N'7091', N'7765', N'3622');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (661, 159, 15, N'15', N'005', N'Almoloya de Juárez', N'0001', N'Villa de Almoloya de Juárez', N'147653', N'73783', N'73870', N'32842');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (662, 159, 15, N'15', N'006', N'Almoloya del Río', N'0001', N'Almoloya del Río', N'10886', N'5199', N'5687', N'2429');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (663, 159, 15, N'15', N'007', N'Amanalco', N'0001', N'Amanalco de Becerra', N'22868', N'11224', N'11644', N'5256');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (664, 159, 15, N'15', N'008', N'Amatepec', N'0001', N'Amatepec', N'26334', N'12799', N'13535', N'6511');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (665, 159, 15, N'15', N'009', N'Amecameca', N'0001', N'Amecameca de Juárez', N'48421', N'23240', N'25181', N'11366');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (666, 159, 15, N'15', N'010', N'Apaxco', N'0001', N'Apaxco de Ocampo', N'27521', N'13576', N'13945', N'6514');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (667, 159, 15, N'15', N'011', N'Atenco', N'0001', N'San Salvador Atenco', N'56243', N'27933', N'28310', N'12483');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (668, 159, 15, N'15', N'012', N'Atizapán', N'0001', N'Santa Cruz Atizapán', N'10299', N'4967', N'5332', N'2112');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (669, 159, 15, N'15', N'013', N'Atizapán de Zaraza', N'0001', N'Ciudad López Mateos', N'489937', N'238124', N'251813', N'129313');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (670, 159, 15, N'15', N'014', N'Atlacomulco', N'0001', N'Atlacomulco de Fabela', N'93718', N'44905', N'48813', N'21172');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (671, 159, 15, N'15', N'015', N'Atlautla', N'0001', N'Atlautla de Victoria', N'27663', N'13396', N'14267', N'6266');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (672, 159, 15, N'15', N'016', N'Axapusco', N'0001', N'Axapusco', N'25559', N'12666', N'12893', N'6356');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (673, 159, 15, N'15', N'017', N'Ayapan', N'0001', N'Ayapan de Gabriel Ramos M.', N'8864', N'4353', N'4511', N'2310');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (674, 159, 15, N'15', N'018', N'Calimaya', N'0001', N'Calimaya de Díaz nzález', N'47033', N'23061', N'23972', N'10694');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (675, 159, 15, N'15', N'019', N'Capulhuac', N'0001', N'Capulhuac de Mirafuentes', N'34101', N'16541', N'17560', N'7470');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (676, 159, 15, N'15', N'020', N'Coacalco de Berriozábal', N'0001', N'San Francisco Coacalco', N'278064', N'134141', N'143923', N'75062');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (677, 159, 15, N'15', N'021', N'Coatepec Harinas', N'0001', N'Coatepec Harinas', N'36174', N'17472', N'18702', N'8225');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (678, 159, 15, N'15', N'022', N'Cocotitlán', N'0001', N'Cocotitlán', N'12142', N'5976', N'6166', N'3056');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (679, 159, 15, N'15', N'023', N'Coyotepec', N'0001', N'Coyotepec', N'39030', N'19282', N'19748', N'8497');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (680, 159, 15, N'15', N'024', N'Cuautitlán', N'0001', N'Cuautitlán', N'140059', N'69079', N'70980', N'36891');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (681, 159, 15, N'15', N'025', N'Chalco', N'0001', N'Chalco de Díaz Covarrubias', N'310130', N'151403', N'158727', N'74775');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (682, 159, 15, N'15', N'026', N'Chapa de Mota', N'0001', N'Chapa de Mota', N'27551', N'13532', N'14019', N'6337');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (683, 159, 15, N'15', N'027', N'Chapultepec', N'0001', N'Chapultepec', N'9676', N'4738', N'4938', N'2421');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (684, 159, 15, N'15', N'028', N'Chiautla', N'0001', N'Chiautla', N'26191', N'12759', N'13432', N'5943');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (685, 159, 15, N'15', N'029', N'Chicoloapan', N'0001', N'Chicoloapan de Juárez', N'175053', N'85377', N'89676', N'44666');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (686, 159, 15, N'15', N'030', N'Chiconcuac', N'0001', N'Chiconcuac de Juárez', N'22819', N'11138', N'11681', N'4707');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (687, 159, 15, N'15', N'031', N'Chimalhuacán', N'0001', N'Chimalhuacán', N'614453', N'302297', N'312156', N'147765');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (688, 159, 15, N'15', N'032', N'Donato Guerra', N'0001', N'Villa Donato Guerra', N'33455', N'16484', N'16971', N'6888');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (689, 159, 15, N'15', N'033', N'Ecatepec de Morelos', N'0001', N'Ecatepec de Morelos', N'1656107', N'806443', N'849664', N'419118');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (690, 159, 15, N'15', N'034', N'Ecatzin', N'0001', N'Ecatzin de Hidal', N'9369', N'4582', N'4787', N'2073');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (691, 159, 15, N'15', N'035', N'Huehuetoca', N'0001', N'Huehuetoca', N'100023', N'49372', N'50651', N'25188');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (692, 159, 15, N'15', N'036', N'Hueypoxtla', N'0001', N'Hueypoxtla', N'39864', N'19860', N'20004', N'9094');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (693, 159, 15, N'15', N'037', N'Huixquilucan', N'0001', N'Huixquilucan de Dellado', N'242167', N'116502', N'125665', N'62409');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (694, 159, 15, N'15', N'038', N'Isidro Fabela', N'0001', N'Tlazala de Fabela', N'10308', N'5097', N'5211', N'2461');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (695, 159, 15, N'15', N'039', N'Ixtapaluca', N'0001', N'Ixtapaluca', N'467361', N'227846', N'239515', N'118691');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (696, 159, 15, N'15', N'040', N'Ixtapan de la Sal', N'0001', N'Ixtapan de la Sal', N'33541', N'16082', N'17459', N'8312');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (697, 159, 15, N'15', N'041', N'Ixtapan del Oro', N'0001', N'Ixtapan del Oro', N'6629', N'3326', N'3303', N'1532');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (698, 159, 15, N'15', N'042', N'Ixtlahuaca', N'0001', N'Ixtlahuaca de Rayón', N'141482', N'68388', N'73094', N'30853');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (699, 159, 15, N'15', N'043', N'Xalatlaco', N'0001', N'Xalatlaco', N'26865', N'13058', N'13807', N'5666');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (700, 159, 15, N'15', N'044', N'Jaltenco', N'0001', N'Jaltenco', N'26328', N'12844', N'13484', N'6448');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (701, 159, 15, N'15', N'045', N'Jilotepec', N'0001', N'Jilotepec de Molina Enríquez', N'83755', N'41088', N'42667', N'19979');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (702, 159, 15, N'15', N'046', N'Jilotzin', N'0001', N'Santa Ana Jilotzin', N'17970', N'8864', N'9106', N'4273');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (703, 159, 15, N'15', N'047', N'Jiquipilco', N'0001', N'Jiquipilco', N'69031', N'33299', N'35732', N'15210');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (704, 159, 15, N'15', N'048', N'Jocotitlán', N'0001', N'Ciudad de Jocotitlán', N'61204', N'29503', N'31701', N'14572');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (705, 159, 15, N'15', N'049', N'Joquicin', N'0001', N'Joquicin de León Guzmán', N'12840', N'6201', N'6639', N'2896');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (706, 159, 15, N'15', N'050', N'Juchitepec', N'0001', N'Juchitepec de Mariano Rivapalacio', N'23497', N'11503', N'11994', N'5794');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (707, 159, 15, N'15', N'051', N'Lerma', N'0001', N'Lerma de Villada', N'134799', N'66669', N'68130', N'31150');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (708, 159, 15, N'15', N'052', N'Malinalco', N'0001', N'Malinalco', N'25624', N'12585', N'13039', N'6105');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (709, 159, 15, N'15', N'053', N'Melchor Ocampo', N'0001', N'Melchor Ocampo', N'50240', N'24570', N'25670', N'11308');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (710, 159, 15, N'15', N'054', N'Metepec', N'0001', N'Metepec', N'214162', N'103059', N'111103', N'54915');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (711, 159, 15, N'15', N'055', N'Mexicaltzin', N'0001', N'San Mateo Mexicaltzin', N'11712', N'5658', N'6054', N'2623');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (712, 159, 15, N'15', N'056', N'Morelos', N'0001', N'San Bartolo Morelos', N'28426', N'13617', N'14809', N'6470');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (713, 159, 15, N'15', N'057', N'Naucalpan de Juárez', N'0001', N'Naucalpan de Juárez', N'833779', N'404974', N'428805', N'219310');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (714, 159, 15, N'15', N'058', N'Nezahualcóyotl', N'0001', N'Ciudad Nezahualcóyotl', N'1110565', N'536943', N'573622', N'285045');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (715, 159, 15, N'15', N'059', N'Nextlalpan', N'0001', N'Santa Ana Nextlalpan', N'31691', N'15637', N'16054', N'7861');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (716, 159, 15, N'15', N'060', N'Nicolás Romero', N'0001', N'Ciudad Nicolás Romero', N'366602', N'180139', N'186463', N'91357');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (717, 159, 15, N'15', N'061', N'Nopaltepec', N'0001', N'Nopaltepec', N'8895', N'4427', N'4468', N'2289');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (718, 159, 15, N'15', N'062', N'Ocoyoacac', N'0001', N'Ocoyoacac', N'61805', N'30365', N'31440', N'13926');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (719, 159, 15, N'15', N'063', N'Ocuilan', N'0001', N'Ocuilan de Arteaga', N'31803', N'15540', N'16263', N'7059');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (720, 159, 15, N'15', N'064', N'El Oro', N'0001', N'El Oro de Hidal', N'34446', N'16829', N'17617', N'7600');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (721, 159, 15, N'15', N'065', N'Otumba', N'0001', N'Otumba de Gómez Farías', N'34232', N'17330', N'16902', N'7894');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (722, 159, 15, N'15', N'066', N'Otzoloapan', N'0001', N'Otzoloapan', N'4864', N'2464', N'2400', N'1095');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (723, 159, 15, N'15', N'067', N'Otzolotepec', N'0001', N'Villa Cuauhtémoc', N'78146', N'38318', N'39828', N'16076');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (724, 159, 15, N'15', N'068', N'Ozumba', N'0001', N'Ozumba de Alzate', N'27207', N'13077', N'14130', N'6298');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (725, 159, 15, N'15', N'069', N'Papalotla', N'0001', N'Papalotla', N'4147', N'2012', N'2135', N'962');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (726, 159, 15, N'15', N'070', N'La Paz', N'0001', N'Los Reyes Acaquilpan', N'253845', N'123956', N'129889', N'62492');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (727, 159, 15, N'15', N'071', N'Polotitlán', N'0001', N'Polotitlán de la Ilustración', N'13002', N'6364', N'6638', N'3257');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (728, 159, 15, N'15', N'072', N'Rayón', N'0001', N'Santa María Rayón', N'12748', N'6252', N'6496', N'2834');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (729, 159, 15, N'15', N'073', N'San Antonio la Isla', N'0001', N'San Antonio la Isla', N'22152', N'10886', N'11266', N'5551');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (730, 159, 15, N'15', N'074', N'San Felipe del Progreso', N'0001', N'San Felipe del Progreso', N'121396', N'58173', N'63223', N'23971');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (731, 159, 15, N'15', N'075', N'San Martín de las Pirámides', N'0001', N'San Martín de las Pirámides', N'24851', N'12278', N'12573', N'6070');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (732, 159, 15, N'15', N'076', N'San Mateo Atenco', N'0001', N'San Mateo Atenco', N'72579', N'35597', N'36982', N'16119');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (733, 159, 15, N'15', N'077', N'San Simón de Guerrero', N'0001', N'San Simón de Guerrero', N'6272', N'3026', N'3246', N'1457');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (734, 159, 15, N'15', N'078', N'Santo Tomás', N'0001', N'Santo Tomás de los Plátanos', N'9111', N'4458', N'4653', N'2178');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (735, 159, 15, N'15', N'079', N'Soyaniquilpan de Juárez', N'0001', N'San Francisco Soyaniquilpan', N'11798', N'5778', N'6020', N'3007');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (736, 159, 15, N'15', N'080', N'Sultepec', N'0001', N'Sultepec de Pedro Ascencio de Alquisiras', N'25809', N'12267', N'13542', N'5700');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (737, 159, 15, N'15', N'081', N'Tecámac', N'0001', N'Tecámac de Felipe Villanueva', N'364579', N'177713', N'186866', N'97150');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (738, 159, 15, N'15', N'082', N'Tejupilco', N'0001', N'Tejupilco de Hidal', N'71077', N'34411', N'36666', N'16125');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (739, 159, 15, N'15', N'083', N'Temamatla', N'0001', N'Temamatla', N'11206', N'5447', N'5759', N'2772');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (740, 159, 15, N'15', N'084', N'Temascalapa', N'0001', N'Temascalapa', N'35987', N'17916', N'18071', N'8869');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (741, 159, 15, N'15', N'085', N'Temascalcin', N'0001', N'Temascalcin de José María Velasco', N'62695', N'30220', N'32475', N'14396');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (742, 159, 15, N'15', N'086', N'Temascaltepec', N'0001', N'Temascaltepec de nzález', N'32870', N'16142', N'16728', N'7445');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (743, 159, 15, N'15', N'087', N'Temoaya', N'0001', N'Temoaya', N'90010', N'43963', N'46047', N'17982');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (744, 159, 15, N'15', N'088', N'Tenancin', N'0001', N'Tenancin de Dellado', N'90946', N'44239', N'46707', N'20715');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (745, 159, 15, N'15', N'089', N'Tenan del Aire', N'0001', N'Tenan del Aire', N'10578', N'5164', N'5414', N'2595');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (746, 159, 15, N'15', N'090', N'Tenan del Valle', N'0001', N'Tenan de Arista', N'77965', N'38072', N'39893', N'17364');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (747, 159, 15, N'15', N'091', N'Teoloyucan', N'0001', N'Teoloyucan', N'63115', N'31240', N'31875', N'14632');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (748, 159, 15, N'15', N'092', N'Teotihuacán', N'0001', N'Teotihuacán de Arista', N'53010', N'26000', N'27010', N'12936');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (749, 159, 15, N'15', N'093', N'Tepetlaoxtoc', N'0001', N'Tepetlaoxtoc de Hidal', N'27944', N'13714', N'14230', N'6481');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (750, 159, 15, N'15', N'094', N'Tepetlixpa', N'0001', N'Tepetlixpa', N'18327', N'9003', N'9324', N'4297');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (751, 159, 15, N'15', N'095', N'Tepotzotlán', N'0001', N'Tepotzotlán', N'88559', N'43521', N'45038', N'21530');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (752, 159, 15, N'15', N'096', N'Tequixquiac', N'0001', N'Tequixquiac', N'33907', N'16794', N'17113', N'8252');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (753, 159, 15, N'15', N'097', N'Texcaltitlán', N'0001', N'Texcaltitlán', N'17390', N'8366', N'9024', N'3835');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (754, 159, 15, N'15', N'098', N'Texcalyacac', N'0001', N'San Mateo Texcalyacac', N'5111', N'2506', N'2605', N'1246');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (755, 159, 15, N'15', N'099', N'Texcoco', N'0001', N'Texcoco de Mora', N'235151', N'115648', N'119503', N'56481');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (756, 159, 15, N'15', N'100', N'Tezoyuca', N'0001', N'Tezoyuca', N'35199', N'17404', N'17795', N'8334');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (757, 159, 15, N'15', N'101', N'Tianguistenco', N'0001', N'Santia Tianguistenco de Galeana', N'70682', N'34277', N'36405', N'15550');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (758, 159, 15, N'15', N'102', N'Timilpan', N'0001', N'San Andrés Timilpan', N'15391', N'7389', N'8002', N'3859');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (759, 159, 15, N'15', N'103', N'Tlalmanalco', N'0001', N'Tlalmanalco de Velázquez', N'46130', N'22333', N'23797', N'11498');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (760, 159, 15, N'15', N'104', N'Tlalnepantla de Baz', N'0001', N'Tlalnepantla', N'664225', N'321747', N'342478', N'177317');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (761, 159, 15, N'15', N'105', N'Tlatlaya', N'0001', N'Tlatlaya', N'32997', N'16074', N'16923', N'7875');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (762, 159, 15, N'15', N'106', N'Toluca', N'0001', N'Toluca de Lerdo', N'819561', N'394836', N'424725', N'199815');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (763, 159, 15, N'15', N'107', N'Tonatico', N'0001', N'Tonatico', N'12099', N'5799', N'6300', N'3219');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (764, 159, 15, N'15', N'108', N'Tultepec', N'0001', N'Tultepec', N'131567', N'64287', N'67280', N'33089');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (765, 159, 15, N'15', N'109', N'Tultitlán', N'0001', N'Tultitlán de Mariano Escobedo', N'486998', N'238340', N'248658', N'125151');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (766, 159, 15, N'15', N'110', N'Valle de Bravo', N'0001', N'Valle de Bravo', N'61599', N'30296', N'31303', N'14843');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (767, 159, 15, N'15', N'111', N'Villa de Allende', N'0001', N'San José Villa de Allende', N'47709', N'23413', N'24296', N'10013');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (768, 159, 15, N'15', N'112', N'Villa del Carbón', N'0001', N'Villa del Carbón', N'44881', N'22433', N'22448', N'10271');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (769, 159, 15, N'15', N'113', N'Villa Guerrero', N'0001', N'Villa Guerrero', N'59991', N'29293', N'30698', N'13885');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (770, 159, 15, N'15', N'114', N'Villa Victoria', N'0001', N'Villa Victoria', N'94369', N'46657', N'47712', N'18725');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (771, 159, 15, N'15', N'115', N'Xonacatlán', N'0001', N'Xonacatlán', N'46331', N'22871', N'23460', N'9966');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (772, 159, 15, N'15', N'116', N'Zacazonapan', N'0001', N'Zacazonapan', N'4051', N'2033', N'2018', N'935');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (773, 159, 15, N'15', N'117', N'Zacualpan', N'0001', N'Zacualpan', N'15121', N'7217', N'7904', N'3480');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (774, 159, 15, N'15', N'118', N'Zinacantepec', N'0001', N'San Miguel Zinacantepec', N'167759', N'82109', N'85650', N'37665');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (775, 159, 15, N'15', N'119', N'Zumpahuacán', N'0001', N'Zumpahuacán', N'16365', N'7780', N'8585', N'3434');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (776, 159, 15, N'15', N'120', N'Zumpan', N'0001', N'Zumpan de Ocampo', N'159647', N'78608', N'81039', N'37647');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (777, 159, 15, N'15', N'121', N'Cuautitlán Izcalli', N'0001', N'Cuautitlán Izcalli', N'511675', N'248552', N'263123', N'135024');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (778, 159, 15, N'15', N'122', N'Valle de Chalco Solidaridad', N'0001', N'Xico', N'357645', N'175772', N'181873', N'89563');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (779, 159, 15, N'15', N'123', N'Luvianos', N'0001', N'Villa Luvianos', N'27781', N'13719', N'14062', N'6104');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (780, 159, 15, N'15', N'124', N'San José del Rincón', N'0001', N'San José del Rincón Centro', N'91345', N'45084', N'46261', N'17712');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (781, 159, 15, N'15', N'125', N'Tonanitla', N'0001', N'Santa María Tonanitla', N'10216', N'5058', N'5158', N'2415');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (782, 159, 16, N'16', N'001', N'Acuitzio', N'0001', N'Acuitzio del Canje', N'10987', N'5259', N'5728', N'2680');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (783, 159, 16, N'16', N'002', N'Aguililla', N'0001', N'Aguililla', N'16214', N'8174', N'8040', N'4103');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (784, 159, 16, N'16', N'003', N'Álvaro Obregón', N'0001', N'Álvaro Obregón', N'20913', N'9984', N'10929', N'5019');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (785, 159, 16, N'16', N'004', N'Angamacutiro', N'0001', N'Angamacutiro de la Unión', N'14684', N'6936', N'7748', N'3746');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (786, 159, 16, N'16', N'005', N'Angangueo', N'0001', N'Mineral de Angangueo', N'10768', N'5201', N'5567', N'2333');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (787, 159, 16, N'16', N'006', N'Apatzingán', N'0001', N'Apatzingán de la Constitución', N'123649', N'60907', N'62742', N'30124');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (788, 159, 16, N'16', N'007', N'Aporo', N'0001', N'Aporo', N'3218', N'1537', N'1681', N'726');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (789, 159, 16, N'16', N'008', N'Aquila', N'0001', N'Aquila', N'23536', N'11917', N'11619', N'4955');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (790, 159, 16, N'16', N'009', N'Ario', N'0001', N'Ario de Rosales', N'34848', N'16925', N'17923', N'8743');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (791, 159, 16, N'16', N'010', N'Arteaga', N'0001', N'Arteaga', N'21790', N'10846', N'10944', N'5262');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (792, 159, 16, N'16', N'011', N'Briseñas', N'0001', N'Briseñas de Matamoros', N'10653', N'5138', N'5515', N'2661');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (793, 159, 16, N'16', N'012', N'Buenavista', N'0001', N'Buenavista Tomatlán', N'42234', N'21308', N'20926', N'10532');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (794, 159, 16, N'16', N'013', N'Carácuaro', N'0001', N'Carácuaro de Morelos', N'9212', N'4617', N'4595', N'2260');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (795, 159, 16, N'16', N'014', N'Coahuayana', N'0001', N'Coahuayana de Hidal', N'14136', N'7256', N'6880', N'3626');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (796, 159, 16, N'16', N'015', N'Coalcomán de Vázquez Pallares', N'0001', N'Coalcomán de Vázquez Pallares', N'17615', N'8601', N'9014', N'4305');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (797, 159, 16, N'16', N'016', N'Coeneo', N'0001', N'Coeneo de la Libertad', N'20492', N'9360', N'11132', N'5484');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (798, 159, 16, N'16', N'017', N'Contepec', N'0001', N'Contepec', N'32954', N'16007', N'16947', N'7798');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (799, 159, 16, N'16', N'018', N'Copándaro', N'0001', N'Copándaro de Galeana', N'8952', N'4191', N'4761', N'2198');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (800, 159, 16, N'16', N'019', N'Cotija', N'0001', N'Cotija de la Paz', N'19644', N'9259', N'10385', N'5165');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (801, 159, 16, N'16', N'020', N'Cuitzeo', N'0001', N'Cuitzeo del Porvenir', N'28227', N'13253', N'14974', N'6690');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (802, 159, 16, N'16', N'021', N'Charapan', N'0001', N'Charapan', N'12163', N'5649', N'6514', N'2790');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (803, 159, 16, N'16', N'022', N'Charo', N'0001', N'Charo', N'21723', N'11463', N'10260', N'4649');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (804, 159, 16, N'16', N'023', N'Chavinda', N'0001', N'Chavinda', N'9975', N'4847', N'5128', N'2748');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (805, 159, 16, N'16', N'024', N'Cherán', N'0001', N'Cherán', N'18141', N'8701', N'9440', N'4119');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (806, 159, 16, N'16', N'025', N'Chilchota', N'0001', N'Chilchota', N'36293', N'17360', N'18933', N'8665');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (807, 159, 16, N'16', N'026', N'Chinicuila', N'0001', N'Villa Victoria', N'5271', N'2696', N'2575', N'1273');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (808, 159, 16, N'16', N'027', N'Chucándiro', N'0001', N'Chucándiro', N'5166', N'2320', N'2846', N'1459');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (809, 159, 16, N'16', N'028', N'Churintzio', N'0001', N'Churintzio', N'5564', N'2599', N'2965', N'1679');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (810, 159, 16, N'16', N'029', N'Churumuco', N'0001', N'Churumuco de Morelos', N'14366', N'7167', N'7199', N'3067');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (811, 159, 16, N'16', N'030', N'Ecuandureo', N'0001', N'Ecuandureo', N'12855', N'5855', N'7000', N'3533');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (812, 159, 16, N'16', N'031', N'Epitacio Huerta', N'0001', N'Epitacio Huerta', N'16218', N'7785', N'8433', N'3994');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (813, 159, 16, N'16', N'032', N'Erongarícuaro', N'0001', N'Erongarícuaro', N'14555', N'7005', N'7550', N'3449');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (814, 159, 16, N'16', N'033', N'Gabriel Zamora', N'0001', N'Lombardía', N'21294', N'10500', N'10794', N'5400');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (815, 159, 16, N'16', N'034', N'Hidal', N'0001', N'Ciudad Hidal', N'117620', N'56532', N'61088', N'27405');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (816, 159, 16, N'16', N'035', N'La Huacana', N'0001', N'La Huacana', N'32757', N'16176', N'16581', N'7829');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (817, 159, 16, N'16', N'036', N'Huandacareo', N'0001', N'Huandacareo', N'11592', N'5399', N'6193', N'3197');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (818, 159, 16, N'16', N'037', N'Huaniqueo', N'0001', N'Huaniqueo de Morales', N'7983', N'3639', N'4344', N'2373');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (819, 159, 16, N'16', N'038', N'Huetamo', N'0001', N'Huetamo de Núñez', N'41937', N'20531', N'21406', N'11110');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (820, 159, 16, N'16', N'039', N'Huiramba', N'0001', N'Huiramba', N'7925', N'3883', N'4042', N'1801');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (821, 159, 16, N'16', N'040', N'Indaparapeo', N'0001', N'Indaparapeo', N'16427', N'7886', N'8541', N'3800');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (822, 159, 16, N'16', N'041', N'Irimbo', N'0001', N'Irimbo', N'14766', N'6983', N'7783', N'3472');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (823, 159, 16, N'16', N'042', N'Ixtlán', N'0001', N'Ixtlán de los Hervores', N'13584', N'6621', N'6963', N'3591');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (824, 159, 16, N'16', N'043', N'Jacona', N'0001', N'Jacona de Plancarte', N'64011', N'30951', N'33060', N'15634');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (825, 159, 16, N'16', N'044', N'Jiménez', N'0001', N'Villa Jiménez', N'13275', N'6285', N'6990', N'3851');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (826, 159, 16, N'16', N'045', N'Jiquilpan', N'0001', N'Jiquilpan de Juárez', N'34199', N'16134', N'18065', N'9064');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (827, 159, 16, N'16', N'046', N'Juárez', N'0001', N'Benito Juárez', N'13604', N'6592', N'7012', N'3346');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (828, 159, 16, N'16', N'047', N'Jungapeo', N'0001', N'Jungapeo de Juárez', N'19986', N'9762', N'10224', N'4625');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (829, 159, 16, N'16', N'048', N'Lagunillas', N'0001', N'Lagunillas', N'5506', N'2665', N'2841', N'1375');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (830, 159, 16, N'16', N'049', N'Madero', N'0001', N'Villa Madero', N'17427', N'8700', N'8727', N'3864');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (831, 159, 16, N'16', N'050', N'Maravatío', N'0001', N'Maravatío de Ocampo', N'80258', N'38228', N'42030', N'18780');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (832, 159, 16, N'16', N'051', N'Marcos Castellanos', N'0001', N'San José de Gracia', N'13031', N'6309', N'6722', N'3563');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (833, 159, 16, N'16', N'052', N'Lázaro Cárdenas', N'0001', N'Ciudad Lázaro Cárdenas', N'178817', N'89221', N'89596', N'46498');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (834, 159, 16, N'16', N'053', N'Morelia', N'0001', N'Morelia', N'729279', N'348994', N'380285', N'190537');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (835, 159, 16, N'16', N'054', N'Morelos', N'0001', N'Villa Morelos', N'8091', N'3630', N'4461', N'2134');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (836, 159, 16, N'16', N'055', N'Múgica', N'0001', N'Nueva Italia de Ruiz', N'44963', N'22135', N'22828', N'10957');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (837, 159, 16, N'16', N'056', N'Nahuatzen', N'0001', N'Nahuatzen', N'27174', N'13090', N'14084', N'6208');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (838, 159, 16, N'16', N'057', N'Nocupétaro', N'0001', N'Nocupétaro de Morelos', N'7799', N'3835', N'3964', N'1862');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (839, 159, 16, N'16', N'058', N'Nuevo Parangaricutiro', N'0001', N'Nuevo San Juan Parangaricutiro', N'18834', N'9108', N'9726', N'4369');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (840, 159, 16, N'16', N'059', N'Nuevo Urecho', N'0001', N'Nuevo Urecho', N'8240', N'4101', N'4139', N'2121');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (841, 159, 16, N'16', N'060', N'Numarán', N'0001', N'Numarán', N'9599', N'4557', N'5042', N'2327');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (842, 159, 16, N'16', N'061', N'Ocampo', N'0001', N'Ocampo', N'22628', N'11242', N'11386', N'4812');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (843, 159, 16, N'16', N'062', N'Pajacuarán', N'0001', N'Pajacuarán', N'19450', N'9430', N'10020', N'4826');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (844, 159, 16, N'16', N'063', N'Panindícuaro', N'0001', N'Panindícuaro', N'16064', N'7514', N'8550', N'4249');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (845, 159, 16, N'16', N'064', N'Parácuaro', N'0001', N'Parácuaro', N'25343', N'12681', N'12662', N'6051');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (846, 159, 16, N'16', N'065', N'Paracho', N'0001', N'Paracho de Verduzco', N'34721', N'16422', N'18299', N'8234');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (847, 159, 16, N'16', N'066', N'Pátzcuaro', N'0001', N'Pátzcuaro', N'87794', N'41827', N'45967', N'20477');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (848, 159, 16, N'16', N'067', N'Penjamillo', N'0001', N'Penjamillo de Dellado', N'17159', N'7986', N'9173', N'4630');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (849, 159, 16, N'16', N'068', N'Peribán', N'0001', N'Peribán de Ramos', N'25296', N'12566', N'12730', N'6022');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (850, 159, 16, N'16', N'069', N'La Piedad', N'0001', N'La Piedad de Cabadas', N'99576', N'47492', N'52084', N'25247');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (851, 159, 16, N'16', N'070', N'Purépero', N'0001', N'Purépero de Echáiz', N'15306', N'7423', N'7883', N'4092');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (852, 159, 16, N'16', N'071', N'Puruándiro', N'0001', N'Puruándiro', N'67837', N'31746', N'36091', N'16618');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (853, 159, 16, N'16', N'072', N'Queréndaro', N'0001', N'Queréndaro', N'13550', N'6546', N'7004', N'3280');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (854, 159, 16, N'16', N'073', N'Quiroga', N'0001', N'Quiroga', N'25592', N'12109', N'13483', N'6214');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (855, 159, 16, N'16', N'074', N'Cojumatlán de Régules', N'0001', N'Cojumatlán de Régules', N'9980', N'4863', N'5117', N'2641');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (856, 159, 16, N'16', N'075', N'Los Reyes', N'0001', N'Los Reyes de Salgado', N'64141', N'31265', N'32876', N'15837');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (857, 159, 16, N'16', N'076', N'Sahuayo', N'0001', N'Sahuayo de Morelos', N'72841', N'35298', N'37543', N'18242');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (858, 159, 16, N'16', N'077', N'San Lucas', N'0001', N'San Lucas', N'18461', N'9044', N'9417', N'5155');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (859, 159, 16, N'16', N'078', N'Santa Ana Maya', N'0001', N'Santa Ana Maya', N'12618', N'5767', N'6851', N'3129');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (860, 159, 16, N'16', N'079', N'Salvador Escalante', N'0001', N'Santa Clara del Cobre', N'45217', N'21796', N'23421', N'10291');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (861, 159, 16, N'16', N'080', N'Senguio', N'0001', N'Senguio', N'18427', N'8829', N'9598', N'4154');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (862, 159, 16, N'16', N'081', N'Susupuato', N'0001', N'Susupuato de Guerrero', N'8704', N'4310', N'4394', N'2000');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (863, 159, 16, N'16', N'082', N'Tacámbaro', N'0001', N'Tacámbaro de Codallos', N'69955', N'34010', N'35945', N'16678');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (864, 159, 16, N'16', N'083', N'Tancítaro', N'0001', N'Tancítaro', N'29414', N'14727', N'14687', N'6613');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (865, 159, 16, N'16', N'084', N'Tangamandapio', N'0001', N'Santia Tangamandapio', N'27822', N'13277', N'14545', N'6062');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (866, 159, 16, N'16', N'085', N'Tangancícuaro', N'0001', N'Tangancícuaro de Arista', N'32677', N'15740', N'16937', N'8539');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (867, 159, 16, N'16', N'086', N'Tanhuato', N'0001', N'Tanhuato de Guerrero', N'15176', N'7354', N'7822', N'3770');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (868, 159, 16, N'16', N'087', N'Taretan', N'0001', N'Taretan', N'13558', N'6636', N'6922', N'3519');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (869, 159, 16, N'16', N'088', N'Tarímbaro', N'0001', N'Tarímbaro', N'78623', N'37951', N'40672', N'21213');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (870, 159, 16, N'16', N'089', N'Tepalcatepec', N'0001', N'Tepalcatepec', N'22987', N'11559', N'11428', N'6185');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (871, 159, 16, N'16', N'090', N'Tingambato', N'0001', N'Tingambato', N'13950', N'6731', N'7219', N'3255');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (872, 159, 16, N'16', N'091', N'Tingüindín', N'0001', N'Tingüindín', N'13511', N'6448', N'7063', N'3568');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (873, 159, 16, N'16', N'092', N'Tiquicheo de Nicolás Romero', N'0001', N'Tiquicheo', N'14274', N'7143', N'7131', N'3282');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (874, 159, 16, N'16', N'093', N'Tlalpujahua', N'0001', N'Tlalpujahua de Rayón', N'27587', N'13104', N'14483', N'6593');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (875, 159, 16, N'16', N'094', N'Tlazazalca', N'0001', N'Tlazazalca', N'6890', N'3344', N'3546', N'2049');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (876, 159, 16, N'16', N'095', N'Tocumbo', N'0001', N'Tocumbo', N'11504', N'5674', N'5830', N'3194');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (877, 159, 16, N'16', N'096', N'Tumbiscatío', N'0001', N'Tumbiscatío de Ruiz', N'7890', N'3972', N'3918', N'1802');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (878, 159, 16, N'16', N'097', N'Turicato', N'0001', N'Turicato', N'31877', N'15364', N'16513', N'7717');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (879, 159, 16, N'16', N'098', N'Tuxpan', N'0001', N'Tuxpan', N'26026', N'12502', N'13524', N'6336');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (880, 159, 16, N'16', N'099', N'Tuzantla', N'0001', N'Tuzantla', N'16305', N'8060', N'8245', N'3913');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (881, 159, 16, N'16', N'100', N'Tzintzuntzan', N'0001', N'Tzintzuntzan', N'13556', N'6344', N'7212', N'3173');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (882, 159, 16, N'16', N'101', N'Tzitzio', N'0001', N'Tzitzio', N'9166', N'4633', N'4533', N'2050');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (883, 159, 16, N'16', N'102', N'Uruapan', N'0001', N'Uruapan', N'315350', N'152442', N'162908', N'78374');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (884, 159, 16, N'16', N'103', N'Venustiano Carranza', N'0001', N'Venustiano Carranza', N'23457', N'11527', N'11930', N'6118');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (885, 159, 16, N'16', N'104', N'Villamar', N'0001', N'Villamar', N'16991', N'8063', N'8928', N'4493');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (886, 159, 16, N'16', N'105', N'Vista Hermosa', N'0001', N'Vista Hermosa de Negrete', N'18995', N'9288', N'9707', N'4796');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (887, 159, 16, N'16', N'106', N'Yurécuaro', N'0001', N'Yurécuaro', N'29995', N'14505', N'15490', N'7039');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (888, 159, 16, N'16', N'107', N'Zacapu', N'0001', N'Zacapu', N'73455', N'35300', N'38155', N'19032');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (889, 159, 16, N'16', N'108', N'Zamora', N'0001', N'Zamora de Hidal', N'186102', N'89746', N'96356', N'47707');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (890, 159, 16, N'16', N'109', N'Zináparo', N'0001', N'Zináparo', N'3247', N'1479', N'1768', N'952');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (891, 159, 16, N'16', N'110', N'Zinapécuaro', N'0001', N'Zinapécuaro de Figueroa', N'46666', N'22275', N'24391', N'11617');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (892, 159, 16, N'16', N'111', N'Ziracuaretiro', N'0001', N'Ziracuaretiro', N'15222', N'7441', N'7781', N'3454');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (893, 159, 16, N'16', N'112', N'Zitácuaro', N'0001', N'Heróica Zitácuaro', N'155534', N'74715', N'80819', N'36038');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (894, 159, 16, N'16', N'113', N'José Sixto Verduzco', N'0001', N'Pastor Ortiz', N'25576', N'12029', N'13547', N'6512');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (895, 159, 17, N'17', N'001', N'Amacuzac', N'0001', N'Amacuzac', N'17021', N'8223', N'8798', N'4415');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (896, 159, 17, N'17', N'002', N'Atlatlahucan', N'0001', N'Atlatlahucan', N'18895', N'9240', N'9655', N'4956');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (897, 159, 17, N'17', N'003', N'Axochiapan', N'0001', N'Axochiapan', N'33695', N'16458', N'17237', N'8140');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (898, 159, 17, N'17', N'004', N'Ayala', N'0001', N'Ciudad Ayala', N'78866', N'38186', N'40680', N'20318');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (899, 159, 17, N'17', N'005', N'Coatlán del Río', N'0001', N'Coatlán del Río', N'9471', N'4684', N'4787', N'2636');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (900, 159, 17, N'17', N'006', N'Cuautla', N'0001', N'Cuautla', N'175207', N'83676', N'91531', N'46492');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (901, 159, 17, N'17', N'007', N'Cuernavaca', N'0001', N'Cuernavaca', N'365168', N'172901', N'192267', N'103026');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (902, 159, 17, N'17', N'008', N'Emiliano Zapata', N'0001', N'Emiliano Zapata', N'83485', N'40761', N'42724', N'22340');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (903, 159, 17, N'17', N'009', N'Huitzilac', N'0001', N'Huitzilac', N'17340', N'8527', N'8813', N'4304');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (904, 159, 17, N'17', N'010', N'Jantetelco', N'0001', N'Jantetelco', N'15646', N'7629', N'8017', N'3903');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (905, 159, 17, N'17', N'011', N'Jiutepec', N'0001', N'Jiutepec', N'196953', N'94766', N'102187', N'52414');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (906, 159, 17, N'17', N'012', N'Jojutla', N'0001', N'Jojutla', N'55115', N'26430', N'28685', N'14990');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (907, 159, 17, N'17', N'013', N'Jonacatepec', N'0001', N'Jonacatepec', N'14604', N'7002', N'7602', N'3684');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (908, 159, 17, N'17', N'014', N'Mazatepec', N'0001', N'Mazatepec', N'9456', N'4578', N'4878', N'2658');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (909, 159, 17, N'17', N'015', N'Miacatlán', N'0001', N'Miacatlán', N'24990', N'12107', N'12883', N'6240');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (910, 159, 17, N'17', N'016', N'Ocuituco', N'0001', N'Ocuituco', N'16858', N'8273', N'8585', N'4097');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (911, 159, 17, N'17', N'017', N'Puente de Ixtla', N'0001', N'Puente de Ixtla', N'61585', N'30152', N'31433', N'15002');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (912, 159, 17, N'17', N'018', N'Temixco', N'0001', N'Temixco', N'108126', N'52374', N'55752', N'27652');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (913, 159, 17, N'17', N'019', N'Tepalcin', N'0001', N'Tepalcin', N'25346', N'12280', N'13066', N'6510');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (914, 159, 17, N'17', N'020', N'Tepoztlán', N'0001', N'Tepoztlán', N'41629', N'20291', N'21338', N'10784');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (915, 159, 17, N'17', N'021', N'Tetecala', N'0001', N'Tetecala', N'7441', N'3680', N'3761', N'2107');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (916, 159, 17, N'17', N'022', N'Tetela del Volcán', N'0001', N'Tetela del Volcán', N'19138', N'9207', N'9931', N'4424');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (917, 159, 17, N'17', N'023', N'Tlalnepantla', N'0001', N'Tlalnepantla', N'6636', N'3330', N'3306', N'1621');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (918, 159, 17, N'17', N'024', N'Tlaltizapán de Zapata', N'0001', N'Tlaltizapán', N'48881', N'23865', N'25016', N'13020');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (919, 159, 17, N'17', N'025', N'Tlaquiltenan', N'0001', N'Tlaquiltenan', N'31534', N'15608', N'15926', N'8533');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (920, 159, 17, N'17', N'026', N'Tlayacapan', N'0001', N'Tlayacapan', N'16543', N'8102', N'8441', N'4011');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (921, 159, 17, N'17', N'027', N'Totolapan', N'0001', N'Totolapan', N'10789', N'5247', N'5542', N'2783');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (922, 159, 17, N'17', N'028', N'Xochitepec', N'0001', N'Xochitepec', N'63382', N'32161', N'31221', N'15372');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (923, 159, 17, N'17', N'029', N'Yautepec', N'0001', N'Yautepec de Zaraza', N'97827', N'47581', N'50246', N'25832');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (924, 159, 17, N'17', N'030', N'Yecapixtla', N'0001', N'Yecapixtla', N'46809', N'22967', N'23842', N'11392');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (925, 159, 17, N'17', N'031', N'Zacatepec', N'0001', N'Zacatepec de Hidal', N'35063', N'16934', N'18129', N'9621');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (926, 159, 17, N'17', N'032', N'Zacualpan de Amilpas', N'0001', N'Zacualpan de Amilpas', N'9087', N'4452', N'4635', N'2368');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (927, 159, 17, N'17', N'033', N'Temoac', N'0001', N'Temoac', N'14641', N'6916', N'7725', N'3446');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (928, 159, 18, N'18', N'001', N'Acaponeta', N'0001', N'Acaponeta', N'36572', N'18289', N'18283', N'9716');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (929, 159, 18, N'18', N'002', N'Ahuacatlán', N'0001', N'Ahuacatlán', N'15229', N'7621', N'7608', N'4346');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (930, 159, 18, N'18', N'003', N'Amatlán de Cañas', N'0001', N'Amatlán de Cañas', N'11188', N'5665', N'5523', N'3254');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (931, 159, 18, N'18', N'004', N'Compostela', N'0001', N'Compostela', N'70399', N'35413', N'34986', N'19552');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (932, 159, 18, N'18', N'005', N'Huajicori', N'0001', N'Huajicori', N'11400', N'5818', N'5582', N'2381');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (933, 159, 18, N'18', N'006', N'Ixtlán del Río', N'0001', N'Ixtlán del Río', N'27273', N'13181', N'14092', N'7257');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (934, 159, 18, N'18', N'007', N'Jala', N'0001', N'Jala', N'17698', N'8740', N'8958', N'4344');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (935, 159, 18, N'18', N'008', N'Xalisco', N'0001', N'Xalisco', N'49102', N'24037', N'25065', N'12971');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (936, 159, 18, N'18', N'009', N'Del Nayar', N'0001', N'Jesús María', N'34300', N'17268', N'17032', N'6295');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (937, 159, 18, N'18', N'010', N'Rosamorada', N'0001', N'Rosamorada', N'34393', N'17466', N'16927', N'9332');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (938, 159, 18, N'18', N'011', N'Ruíz', N'0001', N'Ruíz', N'23469', N'11861', N'11608', N'6066');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (939, 159, 18, N'18', N'012', N'San Blas', N'0001', N'San Blas', N'43120', N'23123', N'19997', N'11721');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (940, 159, 18, N'18', N'013', N'San Pedro Lagunillas', N'0001', N'San Pedro Lagunillas', N'7510', N'3778', N'3732', N'2205');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (941, 159, 18, N'18', N'014', N'Santa María del Oro', N'0001', N'Santa María del Oro', N'22412', N'11412', N'11000', N'5988');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (942, 159, 18, N'18', N'015', N'Santia Ixcuintla', N'0001', N'Santia Ixcuintla', N'93074', N'47136', N'45938', N'26190');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (943, 159, 18, N'18', N'016', N'Tecuala', N'0001', N'Tecuala', N'39756', N'20212', N'19544', N'11127');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (944, 159, 18, N'18', N'017', N'Tepic', N'0001', N'Tepic', N'380249', N'185167', N'195082', N'102775');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (945, 159, 18, N'18', N'018', N'Tuxpan', N'0001', N'Tuxpan', N'30030', N'14923', N'15107', N'8727');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (946, 159, 18, N'18', N'019', N'La Yesca', N'0001', N'La Yesca', N'13600', N'6898', N'6702', N'2960');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (947, 159, 18, N'18', N'020', N'Bahía de Banderas', N'0001', N'Valle de Banderas', N'124205', N'62999', N'61206', N'33956');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (948, 159, 19, N'19', N'001', N'Abasolo', N'0001', N'Abasolo', N'2791', N'1406', N'1385', N'741');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (949, 159, 19, N'19', N'002', N'Agualeguas', N'0001', N'Agualeguas', N'3443', N'1777', N'1666', N'1175');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (950, 159, 19, N'19', N'003', N'Los Aldamas', N'0001', N'Los Aldamas', N'1374', N'708', N'666', N'475');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (951, 159, 19, N'19', N'004', N'Allende', N'0001', N'Ciudad de Allende', N'32593', N'16440', N'16153', N'9360');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (952, 159, 19, N'19', N'005', N'Anáhuac', N'0001', N'Anáhuac', N'18480', N'9219', N'9261', N'5139');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (953, 159, 19, N'19', N'006', N'Apodaca', N'0001', N'Ciudad Apodaca', N'523370', N'263374', N'259996', N'133180');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (954, 159, 19, N'19', N'007', N'Aramberri', N'0001', N'Aramberri', N'15470', N'7869', N'7601', N'4045');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (955, 159, 19, N'19', N'008', N'Bustamante', N'0001', N'Bustamante', N'3773', N'1890', N'1883', N'1116');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (956, 159, 19, N'19', N'009', N'Cadereyta Jiménez', N'0001', N'Cadereyta Jiménez', N'86445', N'43939', N'42506', N'24088');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (957, 159, 19, N'19', N'010', N'El Carmen', N'0001', N'Carmen', N'16092', N'8175', N'7917', N'4378');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (958, 159, 19, N'19', N'011', N'Cerralvo', N'0001', N'Ciudad Cerralvo', N'7855', N'4049', N'3806', N'2419');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (959, 159, 19, N'19', N'012', N'Ciénega de Flores', N'0001', N'Ciénega de Flores', N'24526', N'12476', N'12050', N'6486');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (960, 159, 19, N'19', N'013', N'China', N'0001', N'China', N'10864', N'5585', N'5279', N'3188');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (961, 159, 19, N'19', N'014', N'Doctor Arroyo', N'0001', N'Doctor Arroyo', N'35445', N'17849', N'17596', N'8488');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (962, 159, 19, N'19', N'015', N'Doctor Coss', N'0001', N'Doctor Coss', N'1716', N'889', N'827', N'539');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (963, 159, 19, N'19', N'016', N'Doctor nzález', N'0001', N'Doctor nzález', N'3345', N'1713', N'1632', N'974');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (964, 159, 19, N'19', N'017', N'Galeana', N'0001', N'Galeana', N'39991', N'20237', N'19754', N'10201');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (965, 159, 19, N'19', N'018', N'García', N'0001', N'García', N'143668', N'72640', N'71028', N'38791');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (966, 159, 19, N'19', N'019', N'San Pedro Garza García', N'0001', N'San Pedro Garza García', N'122659', N'57622', N'65037', N'31936');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (967, 159, 19, N'19', N'020', N'General Bravo', N'0001', N'General Bravo', N'5527', N'2876', N'2651', N'1643');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (968, 159, 19, N'19', N'021', N'General Escobedo', N'0001', N'Ciudad General Escobedo', N'357937', N'180332', N'177605', N'89379');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (969, 159, 19, N'19', N'022', N'General Terán', N'0001', N'Ciudad General Terán', N'14437', N'7234', N'7203', N'4360');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (970, 159, 19, N'19', N'023', N'General Treviño', N'0001', N'General Treviño', N'1277', N'626', N'651', N'437');
-- INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (971, 159, 19, N'19', N'024', N'General Zaraza', N'0001', N'General Zaraza', N'5942', N'3052', N'2890', N'1428');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (972, 159, 19, N'19', N'025', N'General Zuazua', N'0001', N'General Zuazua', N'55213', N'27787', N'27426', N'14744');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (973, 159, 19, N'19', N'026', N'Guadalupe', N'0001', N'Guadalupe', N'678006', N'336731', N'341275', N'172341');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (974, 159, 19, N'19', N'027', N'Los Herreras', N'0001', N'Los Herreras', N'2030', N'1001', N'1029', N'728');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (975, 159, 19, N'19', N'028', N'Higueras', N'0001', N'Higueras', N'1594', N'829', N'765', N'451');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (976, 159, 19, N'19', N'029', N'Hualahuises', N'0001', N'Hualahuises', N'6914', N'3424', N'3490', N'1978');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (977, 159, 19, N'19', N'030', N'Iturbide', N'0001', N'Iturbide', N'3558', N'1844', N'1714', N'948');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (978, 159, 19, N'19', N'031', N'Juárez', N'0001', N'Ciudad Benito Juárez', N'256970', N'129324', N'127646', N'65980');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (979, 159, 19, N'19', N'032', N'Lampazos de Naranjo', N'0001', N'Lampazos de Naranjo', N'5349', N'2700', N'2649', N'1542');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (980, 159, 19, N'19', N'033', N'Linares', N'0001', N'Linares', N'78669', N'39104', N'39565', N'20939');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (981, 159, 19, N'19', N'034', N'Marín', N'0001', N'Marín', N'5488', N'2808', N'2680', N'1426');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (982, 159, 19, N'19', N'035', N'Melchor Ocampo', N'0001', N'Melchor Ocampo', N'862', N'433', N'429', N'285');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (983, 159, 19, N'19', N'036', N'Mier y Noriega', N'0001', N'Mier y Noriega', N'7095', N'3555', N'3540', N'1574');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (984, 159, 19, N'19', N'037', N'Mina', N'0001', N'Mina', N'5447', N'2774', N'2673', N'1458');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (985, 159, 19, N'19', N'038', N'Montemorelos', N'0001', N'Montemorelos', N'59113', N'29370', N'29743', N'17056');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (986, 159, 19, N'19', N'039', N'Monterrey', N'0001', N'Monterrey', N'1135550', N'561656', N'573894', N'297825');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (987, 159, 19, N'19', N'040', N'Parrás', N'0001', N'Parás', N'1034', N'512', N'522', N'319');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (988, 159, 19, N'19', N'041', N'Pesquería', N'0001', N'Pesquería', N'20843', N'10737', N'10106', N'5768');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (989, 159, 19, N'19', N'042', N'Los Ramones', N'0001', N'Los Ramones', N'5359', N'2720', N'2639', N'1715');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (990, 159, 19, N'19', N'043', N'Rayones', N'0001', N'Rayones', N'2628', N'1363', N'1265', N'767');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (991, 159, 19, N'19', N'044', N'Sabinas Hidal', N'0001', N'Ciudad Sabinas Hidal', N'34671', N'17214', N'17457', N'10027');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (992, 159, 19, N'19', N'045', N'Salinas Victoria', N'0001', N'Salinas Victoria', N'32660', N'16800', N'15860', N'8544');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (993, 159, 19, N'19', N'046', N'San Nicolás de los Garza', N'0001', N'San Nicolás de los Garza', N'443273', N'219337', N'223936', N'115413');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (994, 159, 19, N'19', N'047', N'Hidalgo', N'0001', N'Hidal', N'16604', N'8318', N'8286', N'4398');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (995, 159, 19, N'19', N'048', N'Santa Catarina', N'0001', N'Ciudad Santa Catarina', N'268955', N'134388', N'134567', N'67067');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (996, 159, 19, N'19', N'049', N'Santia', N'0001', N'Santia', N'40469', N'20341', N'20128', N'11675');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (997, 159, 19, N'19', N'050', N'Vallecillo', N'0001', N'Vallecillo', N'1971', N'1065', N'906', N'641');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (998, 159, 19, N'19', N'051', N'Villaldama', N'0001', N'Ciudad de Villaldama', N'4113', N'2073', N'2040', N'1318');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (999, 159, 20, N'20', N'001', N'Abejones', N'0001', N'Abejones', N'1084', N'483', N'601', N'256');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1000, 159, 20, N'20', N'002', N'Acatlán de Pérez Figueroa', N'0001', N'Acatlán de Pérez Figueroa', N'44885', N'21866', N'23019', N'11537');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1001, 159, 20, N'20', N'003', N'Asunción Cacalotepec', N'0001', N'Asunción Cacalotepec', N'2495', N'1206', N'1289', N'692');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1002, 159, 20, N'20', N'004', N'Asunción Cuyotepeji', N'0001', N'Asunción Cuyotepeji', N'1012', N'469', N'543', N'290');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1003, 159, 20, N'20', N'005', N'Asunción Ixtaltepec', N'0001', N'Asunción Ixtaltepec', N'14751', N'7296', N'7455', N'4238');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1004, 159, 20, N'20', N'006', N'Asunción Nochixtlán', N'0001', N'Asunción Nochixtlán', N'17820', N'8437', N'9383', N'4423');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1005, 159, 20, N'20', N'007', N'Asunción Ocotlán', N'0001', N'Asunción Ocotlán', N'2612', N'1165', N'1447', N'788');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1006, 159, 20, N'20', N'008', N'Asunción Tlacolulita', N'0001', N'Asunción Tlacolulita', N'842', N'412', N'430', N'267');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1007, 159, 20, N'20', N'009', N'Ayotzintepec', N'0001', N'Ayotzintepec', N'6720', N'3314', N'3406', N'1541');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1008, 159, 20, N'20', N'010', N'El Barrio de la Soledad', N'0001', N'El Barrio de la Soledad', N'13608', N'6557', N'7051', N'3894');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1009, 159, 20, N'20', N'011', N'Calihualá', N'0001', N'Calihualá', N'1220', N'595', N'625', N'274');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1010, 159, 20, N'20', N'012', N'Candelaria Loxicha', N'0001', N'Candelaria Loxicha', N'9860', N'4730', N'5130', N'2095');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1011, 159, 20, N'20', N'013', N'Ciénega de Zimatlán', N'0001', N'Ciénega de Zimatlán', N'2785', N'1319', N'1466', N'789');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1012, 159, 20, N'20', N'014', N'Ciudad Ixtepec', N'0001', N'Ciudad Ixtepec', N'26450', N'12677', N'13773', N'7315');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1013, 159, 20, N'20', N'015', N'Coatecas Altas', N'0001', N'Coatecas Altas', N'4712', N'2221', N'2491', N'1037');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1014, 159, 20, N'20', N'016', N'Coicoyán de las Flores', N'0001', N'Coicoyán de las Flores', N'8531', N'3990', N'4541', N'1370');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1015, 159, 20, N'20', N'017', N'La Compañía', N'0001', N'La Compañía', N'3302', N'1557', N'1745', N'854');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1016, 159, 20, N'20', N'018', N'Concepción Buenavista', N'0001', N'Concepción Buenavista', N'834', N'397', N'437', N'241');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1017, 159, 20, N'20', N'019', N'Concepción Pápalo', N'0001', N'Concepción Pápalo', N'3071', N'1537', N'1534', N'854');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1018, 159, 20, N'20', N'020', N'Constancia del Rosario', N'0001', N'Constancia del Rosario', N'3860', N'1795', N'2065', N'734');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1019, 159, 20, N'20', N'021', N'Cosolapa', N'0001', N'Cosolapa', N'14667', N'7057', N'7610', N'3762');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1020, 159, 20, N'20', N'022', N'Cosoltepec', N'0001', N'Cosoltepec', N'866', N'394', N'472', N'306');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1021, 159, 20, N'20', N'023', N'Cuilápam de Guerrero', N'0001', N'Cuilápam de Guerrero', N'18428', N'8824', N'9604', N'4428');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1022, 159, 20, N'20', N'024', N'Cuyamecalco Villa de Zaraza', N'0001', N'Cuyamecalco Villa de Zaraza', N'3846', N'1949', N'1897', N'923');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1023, 159, 20, N'20', N'025', N'Chahuites', N'0001', N'Chahuites', N'11105', N'5498', N'5607', N'2918');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1024, 159, 20, N'20', N'026', N'Chalcaton de Hidal', N'0001', N'Chalcaton de Hidal', N'8481', N'3923', N'4558', N'2234');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1025, 159, 20, N'20', N'027', N'Chiquihuitlán de Benito Juárez', N'0001', N'Chiquihuitlán de Benito Juárez', N'2458', N'1157', N'1301', N'729');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1026, 159, 20, N'20', N'028', N'Heroica Ciudad de Ejutla de Crespo', N'0001', N'Heroica Ciudad de Ejutla de Crespo', N'19679', N'9233', N'10446', N'4881');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1027, 159, 20, N'20', N'029', N'Eloxochitlán de Flores Magón', N'0001', N'Eloxochitlán de Flores Magón', N'4263', N'2024', N'2239', N'1061');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1028, 159, 20, N'20', N'030', N'El Espinal', N'0001', N'El Espinal', N'8310', N'4031', N'4279', N'2307');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1029, 159, 20, N'20', N'031', N'Tamazulápam del Espíritu Santo', N'0001', N'Tamazulápam del Espíritu Santo', N'7362', N'3434', N'3928', N'1746');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1030, 159, 20, N'20', N'032', N'Fresnillo de Trujano', N'0001', N'Fresnillo de Trujano', N'1033', N'489', N'544', N'266');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1031, 159, 20, N'20', N'033', N'Guadalupe Etla', N'0001', N'Guadalupe Etla', N'2433', N'1150', N'1283', N'629');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1032, 159, 20, N'20', N'034', N'Guadalupe de Ramírez', N'0001', N'Guadalupe de Ramírez', N'1425', N'689', N'736', N'365');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1033, 159, 20, N'20', N'035', N'Guelatao de Juárez', N'0001', N'Guelatao de Juárez', N'544', N'267', N'277', N'144');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1034, 159, 20, N'20', N'036', N'Guevea de Humboldt', N'0001', N'Guevea de Humboldt', N'5285', N'2581', N'2704', N'1307');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1035, 159, 20, N'20', N'037', N'Mesones Hidal', N'0001', N'Mesones Hidal', N'4402', N'1984', N'2418', N'1039');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1036, 159, 20, N'20', N'038', N'Villa Hidal', N'0001', N'Villa Hidal', N'2112', N'1000', N'1112', N'576');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1037, 159, 20, N'20', N'039', N'Heroica Ciudad de Huajuapan de León', N'0001', N'Heroica Ciudad de Huajuapan de León', N'69839', N'32910', N'36929', N'17122');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1038, 159, 20, N'20', N'040', N'Huautepec', N'0001', N'Huautepec', N'5995', N'2824', N'3171', N'1376');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1039, 159, 20, N'20', N'041', N'Huautla de Jiménez', N'0001', N'Huautla de Jiménez', N'30004', N'13952', N'16052', N'7300');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1040, 159, 20, N'20', N'042', N'Ixtlán de Juárez', N'0001', N'Ixtlán de Juárez', N'7674', N'3755', N'3919', N'1934');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1041, 159, 20, N'20', N'043', N'Heroica Ciudad de Juchitán de Zaraza', N'0001', N'Heroica Ciudad de Juchitán de Zaraza', N'93038', N'45210', N'47828', N'22389');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1042, 159, 20, N'20', N'044', N'Loma Bonita', N'0001', N'Loma Bonita', N'41535', N'19779', N'21756', N'11510');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1043, 159, 20, N'20', N'045', N'Magdalena Apasco', N'0001', N'Magdalena Apasco', N'7522', N'3576', N'3946', N'2037');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1044, 159, 20, N'20', N'046', N'Magdalena Jaltepec', N'0001', N'Magdalena Jaltepec', N'3313', N'1540', N'1773', N'946');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1045, 159, 20, N'20', N'047', N'Santa Magdalena Jicotlán', N'0001', N'Santa Magdalena Jicotlán', N'93', N'40', N'53', N'34');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1046, 159, 20, N'20', N'048', N'Magdalena Mixtepec', N'0001', N'Magdalena Mixtepec', N'1304', N'642', N'662', N'232');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1047, 159, 20, N'20', N'049', N'Magdalena Ocotlán', N'0001', N'Magdalena Ocotlán', N'1141', N'546', N'595', N'298');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1048, 159, 20, N'20', N'050', N'Magdalena Peñasco', N'0001', N'Magdalena Peñasco', N'3778', N'1755', N'2023', N'914');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1049, 159, 20, N'20', N'051', N'Magdalena Teitipac', N'0001', N'Magdalena Teitipac', N'4368', N'2059', N'2309', N'911');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1050, 159, 20, N'20', N'052', N'Magdalena Tequisistlán', N'0001', N'Magdalena Tequisistlán', N'6182', N'3026', N'3156', N'1692');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1051, 159, 20, N'20', N'053', N'Magdalena Tlacotepec', N'0001', N'Magdalena Tlacotepec', N'1221', N'581', N'640', N'387');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1052, 159, 20, N'20', N'054', N'Magdalena Zahuatlán', N'0001', N'Magdalena Zahuatlán', N'409', N'194', N'215', N'127');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1053, 159, 20, N'20', N'055', N'Mariscala de Juárez', N'0001', N'Mariscala de Juárez', N'3530', N'1690', N'1840', N'919');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1054, 159, 20, N'20', N'056', N'Mártires de Tacubaya', N'0001', N'Mártires de Tacubaya', N'1451', N'705', N'746', N'343');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1055, 159, 20, N'20', N'057', N'Matías Romero Avendaño', N'0001', N'Matías Romero Avendaño', N'38019', N'18198', N'19821', N'10101');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1056, 159, 20, N'20', N'058', N'Mazatlán Villa de Flores', N'0001', N'Mazatlán Villa de Flores', N'13435', N'6634', N'6801', N'3365');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1057, 159, 20, N'20', N'059', N'Miahuatlán de Porfirio Díaz', N'0001', N'Miahuatlán de Porfirio Díaz', N'41387', N'19792', N'21595', N'9601');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1058, 159, 20, N'20', N'060', N'Mixistlán de la Reforma', N'0001', N'Mixistlán de la Reforma', N'2770', N'1292', N'1478', N'599');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1059, 159, 20, N'20', N'061', N'Monjas', N'0001', N'Monjas', N'2568', N'1166', N'1402', N'597');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1060, 159, 20, N'20', N'062', N'Natividad', N'0001', N'Natividad', N'586', N'272', N'314', N'160');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1061, 159, 20, N'20', N'063', N'Nazareno Etla', N'0001', N'Nazareno Etla', N'3882', N'1825', N'2057', N'935');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1062, 159, 20, N'20', N'064', N'Nejapa de Madero', N'0001', N'Nejapa de Madero', N'7390', N'3609', N'3781', N'1976');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1063, 159, 20, N'20', N'065', N'Ixpantepec Nieves', N'0001', N'Ixpantepec Nieves', N'1182', N'526', N'656', N'360');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1064, 159, 20, N'20', N'066', N'Santia Niltepec', N'0001', N'Santia Niltepec', N'5353', N'2655', N'2698', N'1569');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1065, 159, 20, N'20', N'067', N'Oaxaca de Juárez', N'0001', N'Oaxaca de Juárez', N'263357', N'122446', N'140911', N'68744');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1066, 159, 20, N'20', N'068', N'Ocotlán de Morelos', N'0001', N'Ocotlán de Morelos', N'21341', N'10208', N'11133', N'5152');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1067, 159, 20, N'20', N'069', N'La Pe', N'0001', N'La Pe', N'2446', N'1162', N'1284', N'591');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1068, 159, 20, N'20', N'070', N'Pinotepa de Don Luis', N'0001', N'Pinotepa de Don Luis', N'6629', N'3248', N'3381', N'1548');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1069, 159, 20, N'20', N'071', N'Pluma Hidal', N'0001', N'Pluma Hidal', N'3060', N'1503', N'1557', N'665');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1070, 159, 20, N'20', N'072', N'San José del Progreso', N'0001', N'San José del Progreso', N'6579', N'3168', N'3411', N'1549');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1071, 159, 20, N'20', N'073', N'Putla Villa de Guerrero', N'0001', N'Putla Villa de Guerrero', N'31897', N'14982', N'16915', N'7495');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1072, 159, 20, N'20', N'074', N'Santa Catarina Quioquitani', N'0001', N'Santa Catarina Quioquitani', N'505', N'245', N'260', N'120');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1073, 159, 20, N'20', N'075', N'Reforma de Pineda', N'0001', N'Reforma de Pineda', N'2671', N'1310', N'1361', N'833');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1074, 159, 20, N'20', N'076', N'La Reforma', N'0001', N'La Reforma', N'3331', N'1574', N'1757', N'768');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1075, 159, 20, N'20', N'077', N'Reyes Etla', N'0001', N'Reyes Etla', N'3568', N'1700', N'1868', N'844');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1076, 159, 20, N'20', N'078', N'Rojas de Cuauhtémoc', N'0001', N'Rojas de Cuauhtémoc', N'1092', N'515', N'577', N'317');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1077, 159, 20, N'20', N'079', N'Salina Cruz', N'0001', N'Salina Cruz', N'82371', N'39508', N'42863', N'23186');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1078, 159, 20, N'20', N'080', N'San Agustín Amaten', N'0001', N'San Agustín Amaten', N'1312', N'614', N'698', N'443');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1079, 159, 20, N'20', N'081', N'San Agustín Atenan', N'0001', N'San Agustín Atenan', N'1914', N'897', N'1017', N'531');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1080, 159, 20, N'20', N'082', N'San Agustín Chayuco', N'0001', N'San Agustín Chayuco', N'3952', N'1846', N'2106', N'948');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1081, 159, 20, N'20', N'083', N'San Agustín de las Juntas', N'0001', N'San Agustín de las Juntas', N'8089', N'3956', N'4133', N'1904');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1082, 159, 20, N'20', N'084', N'San Agustín Etla', N'0001', N'San Agustín Etla', N'3893', N'1844', N'2049', N'1048');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1083, 159, 20, N'20', N'085', N'San Agustín Loxicha', N'0001', N'San Agustín Loxicha', N'22565', N'11108', N'11457', N'4372');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1084, 159, 20, N'20', N'086', N'San Agustín Tlacotepec', N'0001', N'San Agustín Tlacotepec', N'874', N'368', N'506', N'300');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1085, 159, 20, N'20', N'087', N'San Agustín Yatareni', N'0001', N'San Agustín Yatareni', N'4075', N'1916', N'2159', N'962');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1086, 159, 20, N'20', N'088', N'San Andrés Cabecera Nueva', N'0001', N'San Andrés Cabecera Nueva', N'2851', N'1396', N'1455', N'656');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1087, 159, 20, N'20', N'089', N'San Andrés Dinicuiti', N'0001', N'San Andrés Dinicuiti', N'2152', N'1034', N'1118', N'597');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1088, 159, 20, N'20', N'090', N'San Andrés Huaxpaltepec', N'0001', N'San Andrés Huaxpaltepec', N'5867', N'2850', N'3017', N'1426');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1089, 159, 20, N'20', N'091', N'San Andrés Huayápam', N'0001', N'San Andrés Huayápam', N'4879', N'2296', N'2583', N'1274');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1090, 159, 20, N'20', N'092', N'San Andrés Ixtlahuaca', N'0001', N'San Andrés Ixtlahuaca', N'1439', N'664', N'775', N'366');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1091, 159, 20, N'20', N'093', N'San Andrés Lagunas', N'0001', N'San Andrés Lagunas', N'505', N'239', N'266', N'162');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1092, 159, 20, N'20', N'094', N'San Andrés Nuxiño', N'0001', N'San Andrés Nuxiño', N'1898', N'897', N'1001', N'504');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1093, 159, 20, N'20', N'095', N'San Andrés Paxtlán', N'0001', N'San Andrés Paxtlán', N'3990', N'1970', N'2020', N'847');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1094, 159, 20, N'20', N'096', N'San Andrés Sinaxtla', N'0001', N'San Andrés Sinaxtla', N'772', N'364', N'408', N'197');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1095, 159, 20, N'20', N'097', N'San Andrés Solaga', N'0001', N'San Andrés Solaga', N'1740', N'833', N'907', N'492');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1096, 159, 20, N'20', N'098', N'San Andrés Teotilálpam', N'0001', N'San Andrés Teotilálpam', N'4427', N'2106', N'2321', N'1032');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1097, 159, 20, N'20', N'099', N'San Andrés Tepetlapa', N'0001', N'San Andrés Tepetlapa', N'475', N'225', N'250', N'121');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1098, 159, 20, N'20', N'100', N'San Andrés Yaá', N'0001', N'San Andrés Yaá', N'497', N'228', N'269', N'171');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1099, 159, 20, N'20', N'101', N'San Andrés Zabache', N'0001', N'San Andrés Zabache', N'726', N'317', N'409', N'190');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1100, 159, 20, N'20', N'102', N'San Andrés Zautla', N'0001', N'San Andrés Zautla', N'4405', N'2135', N'2270', N'1114');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1101, 159, 20, N'20', N'103', N'San Antonino Castillo Velasco', N'0001', N'San Antonino Castillo Velasco', N'5651', N'2690', N'2961', N'1409');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1102, 159, 20, N'20', N'104', N'San Antonino el Alto', N'0001', N'San Antonino el Alto', N'2508', N'1228', N'1280', N'597');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1103, 159, 20, N'20', N'105', N'San Antonino Monte Verde', N'0001', N'San Antonino Monte Verde', N'6650', N'3079', N'3571', N'1529');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1104, 159, 20, N'20', N'106', N'San Antonio Acutla', N'0001', N'San Antonio Acutla', N'297', N'126', N'171', N'94');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1105, 159, 20, N'20', N'107', N'San Antonio de la Cal', N'0001', N'San Antonio de la Cal', N'21456', N'10112', N'11344', N'5089');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1106, 159, 20, N'20', N'108', N'San Antonio Huitepec', N'0001', N'San Antonio Huitepec', N'4289', N'2012', N'2277', N'960');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1107, 159, 20, N'20', N'109', N'San Antonio Nanahuatípam', N'0001', N'San Antonio Nanahuatípam', N'1233', N'617', N'616', N'304');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1108, 159, 20, N'20', N'110', N'San Antonio Sinicahua', N'0001', N'San Antonio Sinicahua', N'1603', N'738', N'865', N'394');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1109, 159, 20, N'20', N'111', N'San Antonio Tepetlapa', N'0001', N'San Antonio Tepetlapa', N'4394', N'2111', N'2283', N'861');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1110, 159, 20, N'20', N'112', N'San Baltazar Chichicápam', N'0001', N'San Baltazar Chichicápam', N'2439', N'1132', N'1307', N'804');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1111, 159, 20, N'20', N'113', N'San Baltazar Loxicha', N'0001', N'San Baltazar Loxicha', N'2832', N'1381', N'1451', N'683');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1112, 159, 20, N'20', N'114', N'San Baltazar Yatzachi el Bajo', N'0001', N'San Baltazar Yatzachi el Bajo', N'677', N'314', N'363', N'226');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1113, 159, 20, N'20', N'115', N'San Bartolo Coyotepec', N'0001', N'San Bartolo Coyotepec', N'8684', N'4141', N'4543', N'2256');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1114, 159, 20, N'20', N'116', N'San Bartolomé Ayautla', N'0001', N'San Bartolomé Ayautla', N'4052', N'1941', N'2111', N'995');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1115, 159, 20, N'20', N'117', N'San Bartolomé Loxicha', N'0001', N'San Bartolomé Loxicha', N'2422', N'1173', N'1249', N'559');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1116, 159, 20, N'20', N'118', N'San Bartolomé Quialana', N'0001', N'San Bartolomé Quialana', N'2470', N'1026', N'1444', N'593');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1117, 159, 20, N'20', N'119', N'San Bartolomé Yucuañe', N'0001', N'San Bartolomé Yucuañe', N'399', N'163', N'236', N'136');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1118, 159, 20, N'20', N'120', N'San Bartolomé Zoocho', N'0001', N'San Bartolomé Zoocho', N'368', N'160', N'208', N'131');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1119, 159, 20, N'20', N'121', N'San Bartolo Soyaltepec', N'0001', N'San Bartolo Soyaltepec', N'655', N'291', N'364', N'205');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1120, 159, 20, N'20', N'122', N'San Bartolo Yautepec', N'0001', N'San Bartolo Yautepec', N'677', N'333', N'344', N'203');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1121, 159, 20, N'20', N'123', N'San Bernardo Mixtepec', N'0001', N'San Bernardo Mixtepec', N'2705', N'1296', N'1409', N'653');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1122, 159, 20, N'20', N'124', N'San Blas Atempa', N'0001', N'San Blas Atempa', N'17094', N'8525', N'8569', N'4124');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1123, 159, 20, N'20', N'125', N'San Carlos Yautepec', N'0001', N'San Carlos Yautepec', N'11813', N'5902', N'5911', N'2611');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1124, 159, 20, N'20', N'126', N'San Cristóbal Amatlán', N'0001', N'San Cristóbal Amatlán', N'5024', N'2365', N'2659', N'1100');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1125, 159, 20, N'20', N'127', N'San Cristóbal Amoltepec', N'0001', N'San Cristóbal Amoltepec', N'1283', N'601', N'682', N'350');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1126, 159, 20, N'20', N'128', N'San Cristóbal Lachirioag', N'0001', N'San Cristóbal Lachirioag', N'1230', N'591', N'639', N'442');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1127, 159, 20, N'20', N'129', N'San Cristóbal Suchixtlahuaca', N'0001', N'San Cristóbal Suchixtlahuaca', N'334', N'161', N'173', N'97');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1128, 159, 20, N'20', N'130', N'San Dionisio del Mar', N'0001', N'San Dionisio del Mar', N'5098', N'2582', N'2516', N'1400');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1129, 159, 20, N'20', N'131', N'San Dionisio Ocotepec', N'0001', N'San Dionisio Ocotepec', N'10500', N'4894', N'5606', N'2421');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1130, 159, 20, N'20', N'132', N'San Dionisio Ocotlán', N'0001', N'San Dionisio Ocotlán', N'1245', N'609', N'636', N'313');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1131, 159, 20, N'20', N'133', N'San Esteban Atatlahuca', N'0001', N'San Esteban Atatlahuca', N'3974', N'1938', N'2036', N'991');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1132, 159, 20, N'20', N'134', N'San Felipe Jalapa de Díaz', N'0001', N'San Felipe Jalapa de Díaz', N'26838', N'12997', N'13841', N'5729');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1133, 159, 20, N'20', N'135', N'San Felipe Tejalápam', N'0001', N'San Felipe Tejalápam', N'7187', N'3419', N'3768', N'1629');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1134, 159, 20, N'20', N'136', N'San Felipe Usila', N'0001', N'San Felipe Usila', N'11575', N'5565', N'6010', N'2527');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1135, 159, 20, N'20', N'137', N'San Francisco Cahuacuá', N'0001', N'San Francisco Cahuacuá', N'3427', N'1671', N'1756', N'763');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1136, 159, 20, N'20', N'138', N'San Francisco Cajonos', N'0001', N'San Francisco Cajonos', N'460', N'217', N'243', N'167');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1137, 159, 20, N'20', N'139', N'San Francisco Chapulapa', N'0001', N'San Francisco Chapulapa', N'2136', N'1022', N'1114', N'502');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1138, 159, 20, N'20', N'140', N'San Francisco Chindúa', N'0001', N'San Francisco Chindúa', N'827', N'395', N'432', N'212');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1139, 159, 20, N'20', N'141', N'San Francisco del Mar', N'0036', N'San Francisco del Mar', N'7232', N'3659', N'3573', N'1829');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1140, 159, 20, N'20', N'142', N'San Francisco Huehuetlán', N'0001', N'San Francisco Huehuetlán', N'1160', N'516', N'644', N'348');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1141, 159, 20, N'20', N'143', N'San Francisco Ixhuatán', N'0001', N'San Francisco Ixhuatán', N'8959', N'4429', N'4530', N'2516');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1142, 159, 20, N'20', N'144', N'San Francisco Jaltepeton', N'0001', N'San Francisco Jaltepeton', N'1110', N'544', N'566', N'325');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1143, 159, 20, N'20', N'145', N'San Francisco Lachiló', N'0001', N'San Francisco Lachiló', N'3474', N'1697', N'1777', N'905');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1144, 159, 20, N'20', N'146', N'San Francisco Logueche', N'0001', N'San Francisco Logueche', N'2666', N'1256', N'1410', N'564');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1145, 159, 20, N'20', N'147', N'San Francisco Nuxaño', N'0001', N'San Francisco Nuxaño', N'378', N'195', N'183', N'111');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1146, 159, 20, N'20', N'148', N'San Francisco Ozolotepec', N'0001', N'San Francisco Ozolotepec', N'1945', N'925', N'1020', N'402');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1147, 159, 20, N'20', N'149', N'San Francisco Sola', N'0001', N'San Francisco Sola', N'1509', N'726', N'783', N'349');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1148, 159, 20, N'20', N'150', N'San Francisco Telixtlahuaca', N'0001', N'San Francisco Telixtlahuaca', N'11893', N'5694', N'6199', N'2738');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1149, 159, 20, N'20', N'151', N'San Francisco Teopan', N'0001', N'San Francisco Teopan', N'394', N'205', N'189', N'112');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1150, 159, 20, N'20', N'152', N'San Francisco Tlapancin', N'0001', N'San Francisco Tlapancin', N'2152', N'981', N'1171', N'404');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1151, 159, 20, N'20', N'153', N'San Gabriel Mixtepec', N'0001', N'San Gabriel Mixtepec', N'4733', N'2263', N'2470', N'1116');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1152, 159, 20, N'20', N'154', N'San Ildefonso Amatlán', N'0001', N'San Ildefonso Amatlán', N'2393', N'1124', N'1269', N'565');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1153, 159, 20, N'20', N'155', N'San Ildefonso Sola', N'0001', N'San Ildefonso Sola', N'940', N'470', N'470', N'196');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1154, 159, 20, N'20', N'156', N'San Ildefonso Villa Alta', N'0001', N'San Ildefonso Villa Alta', N'3478', N'1691', N'1787', N'1005');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1155, 159, 20, N'20', N'157', N'San Jacinto Amilpas', N'0001', N'San Jacinto Amilpas', N'13860', N'6581', N'7279', N'3647');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1156, 159, 20, N'20', N'158', N'San Jacinto Tlacotepec', N'0001', N'San Jacinto Tlacotepec', N'2231', N'1094', N'1137', N'500');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1157, 159, 20, N'20', N'159', N'San Jerónimo Coatlán', N'0001', N'San Jerónimo Coatlán', N'5449', N'2636', N'2813', N'1058');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1158, 159, 20, N'20', N'160', N'San Jerónimo Silacayoapilla', N'0001', N'San Jerónimo Silacayoapilla', N'1449', N'710', N'739', N'410');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1159, 159, 20, N'20', N'161', N'San Jerónimo Sosola', N'0001', N'San Jerónimo Sosola', N'2559', N'1205', N'1354', N'723');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1160, 159, 20, N'20', N'162', N'San Jerónimo Taviche', N'0001', N'San Jerónimo Taviche', N'1848', N'869', N'979', N'406');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1161, 159, 20, N'20', N'163', N'San Jerónimo Tecóatl', N'0001', N'San Jerónimo Tecóatl', N'1606', N'769', N'837', N'438');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1162, 159, 20, N'20', N'164', N'San Jorge Nuchita', N'0001', N'San Jorge Nuchita', N'3215', N'1486', N'1729', N'722');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1163, 159, 20, N'20', N'165', N'San José Ayuquila', N'0001', N'San José Ayuquila', N'1511', N'697', N'814', N'386');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1164, 159, 20, N'20', N'166', N'San José Chiltepec', N'0001', N'San José Chiltepec', N'11019', N'5279', N'5740', N'2639');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1165, 159, 20, N'20', N'167', N'San José del Peñasco', N'0001', N'San José del Peñasco', N'2094', N'1038', N'1056', N'496');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1166, 159, 20, N'20', N'168', N'San José Estancia Grande', N'0001', N'San José Estancia Grande', N'977', N'485', N'492', N'237');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1167, 159, 20, N'20', N'169', N'San José Independencia', N'0001', N'San José Independencia', N'3684', N'1779', N'1905', N'894');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1168, 159, 20, N'20', N'170', N'San José Lachiguiri', N'0001', N'San José Lachiguiri', N'3849', N'1757', N'2092', N'850');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1169, 159, 20, N'20', N'171', N'San José Tenan', N'0001', N'San José Tenan', N'18478', N'8929', N'9549', N'4434');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1170, 159, 20, N'20', N'172', N'San Juan Achiutla', N'0001', N'San Juan Achiutla', N'430', N'213', N'217', N'152');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1171, 159, 20, N'20', N'173', N'San Juan Atepec', N'0001', N'San Juan Atepec', N'1517', N'722', N'795', N'474');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1172, 159, 20, N'20', N'174', N'Ánimas Trujano', N'0001', N'Ánimas Trujano', N'3759', N'1786', N'1973', N'923');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1173, 159, 20, N'20', N'175', N'San Juan Bautista Atatlahuca', N'0001', N'San Juan Bautista Atatlahuca', N'1724', N'833', N'891', N'381');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1174, 159, 20, N'20', N'176', N'San Juan Bautista Coixtlahuaca', N'0001', N'San Juan Bautista Coixtlahuaca', N'2808', N'1334', N'1474', N'784');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1175, 159, 20, N'20', N'177', N'San Juan Bautista Cuicatlán', N'0001', N'San Juan Bautista Cuicatlán', N'9441', N'4601', N'4840', N'2487');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1176, 159, 20, N'20', N'178', N'San Juan Bautista Guelache', N'0001', N'San Juan Bautista Guelache', N'6287', N'2975', N'3312', N'1612');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1177, 159, 20, N'20', N'179', N'San Juan Bautista Jayacatlán', N'0001', N'San Juan Bautista Jayacatlán', N'1462', N'736', N'726', N'364');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1178, 159, 20, N'20', N'180', N'San Juan Bautista Lo de Soto', N'0001', N'San Juan Bautista Lo de Soto', N'2325', N'1138', N'1187', N'623');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1179, 159, 20, N'20', N'181', N'San Juan Bautista Suchitepec', N'0001', N'San Juan Bautista Suchitepec', N'417', N'187', N'230', N'146');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1180, 159, 20, N'20', N'182', N'San Juan Bautista Tlacoatzintepec', N'0001', N'San Juan Bautista Tlacoatzintepec', N'2292', N'1088', N'1204', N'484');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1181, 159, 20, N'20', N'183', N'San Juan Bautista Tlachichilco', N'0001', N'San Juan Bautista Tlachichilco', N'1447', N'681', N'766', N'340');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1182, 159, 20, N'20', N'184', N'San Juan Bautista Tuxtepec', N'0001', N'San Juan Bautista Tuxtepec', N'155766', N'74788', N'80978', N'41374');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1183, 159, 20, N'20', N'185', N'San Juan Cacahuatepec', N'0001', N'San Juan Cacahuatepec', N'8680', N'4216', N'4464', N'2006');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1184, 159, 20, N'20', N'186', N'San Juan Cieneguilla', N'0001', N'San Juan Cieneguilla', N'605', N'294', N'311', N'168');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1185, 159, 20, N'20', N'187', N'San Juan Coatzóspam', N'0001', N'San Juan Coatzóspam', N'2535', N'1275', N'1260', N'547');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1186, 159, 20, N'20', N'188', N'San Juan Colorado', N'0001', N'San Juan Colorado', N'9494', N'4583', N'4911', N'2229');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1187, 159, 20, N'20', N'189', N'San Juan Comaltepec', N'0001', N'San Juan Comaltepec', N'2517', N'1207', N'1310', N'504');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1188, 159, 20, N'20', N'190', N'San Juan Cotzocón', N'0001', N'San Juan Cotzocón', N'22356', N'10895', N'11461', N'5472');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1189, 159, 20, N'20', N'191', N'San Juan Chicomezúchil', N'0001', N'San Juan Chicomezúchil', N'320', N'147', N'173', N'98');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1190, 159, 20, N'20', N'192', N'San Juan Chilateca', N'0001', N'San Juan Chilateca', N'1442', N'667', N'775', N'403');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1191, 159, 20, N'20', N'193', N'San Juan del Estado', N'0001', N'San Juan del Estado', N'2546', N'1207', N'1339', N'646');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1192, 159, 20, N'20', N'194', N'San Juan del Río', N'0001', N'San Juan del Río', N'1231', N'557', N'674', N'407');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1193, 159, 20, N'20', N'195', N'San Juan Diuxi', N'0001', N'San Juan Diuxi', N'1256', N'627', N'629', N'372');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1194, 159, 20, N'20', N'196', N'San Juan Evangelista Analco', N'0001', N'San Juan Evangelista Analco', N'404', N'197', N'207', N'128');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1195, 159, 20, N'20', N'197', N'San Juan Guelavía', N'0001', N'San Juan Guelavía', N'3047', N'1483', N'1564', N'881');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1196, 159, 20, N'20', N'198', N'San Juan Guichicovi', N'0001', N'San Juan Guichicovi', N'28142', N'13221', N'14921', N'7800');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1197, 159, 20, N'20', N'199', N'San Juan Ihualtepec', N'0001', N'San Juan Ihualtepec', N'713', N'328', N'385', N'181');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1198, 159, 20, N'20', N'200', N'San Juan Juquila Mixes', N'0001', N'San Juan Juquila Mixes', N'3924', N'1841', N'2083', N'1026');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1199, 159, 20, N'20', N'201', N'San Juan Juquila Vijanos', N'0001', N'San Juan Juquila Vijanos', N'1832', N'871', N'961', N'475');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1200, 159, 20, N'20', N'202', N'San Juan Lachao', N'0001', N'San Juan Lachao', N'4531', N'2159', N'2372', N'944');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1201, 159, 20, N'20', N'203', N'San Juan Lachigalla', N'0001', N'San Juan Lachigalla', N'3285', N'1580', N'1705', N'689');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1202, 159, 20, N'20', N'204', N'San Juan Lajarcia', N'0001', N'San Juan Lajarcia', N'715', N'324', N'391', N'202');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1203, 159, 20, N'20', N'205', N'San Juan Lalana', N'0001', N'San Juan Lalana', N'17398', N'8441', N'8957', N'3979');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1204, 159, 20, N'20', N'206', N'San Juan de los Cués', N'0001', N'San Juan de los Cués', N'2357', N'1166', N'1191', N'638');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1205, 159, 20, N'20', N'207', N'San Juan Mazatlán', N'0001', N'San Juan Mazatlán', N'17100', N'8432', N'8668', N'3844');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1206, 159, 20, N'20', N'208', N'San Juan Mixtepec', N'0001', N'San Juan Mixtepec Distrito 08', N'7611', N'3572', N'4039', N'2071');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1207, 159, 20, N'20', N'209', N'San Juan Mixtepec', N'0001', N'San Juan Mixtepec Distrito 26', N'711', N'277', N'434', N'191');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1208, 159, 20, N'20', N'210', N'San Juan Ñumí', N'0001', N'San Juan Ñumí', N'6666', N'3196', N'3470', N'1498');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1209, 159, 20, N'20', N'211', N'San Juan Ozolotepec', N'0001', N'San Juan Ozolotepec', N'3168', N'1582', N'1586', N'639');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1210, 159, 20, N'20', N'212', N'San Juan Petlapa', N'0001', N'San Juan Petlapa', N'2807', N'1344', N'1463', N'642');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1211, 159, 20, N'20', N'213', N'San Juan Quiahije', N'0001', N'San Juan Quiahije', N'3628', N'1702', N'1926', N'579');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1212, 159, 20, N'20', N'214', N'San Juan Quiotepec', N'0001', N'San Juan Quiotepec', N'2313', N'1153', N'1160', N'531');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1213, 159, 20, N'20', N'215', N'San Juan Sayultepec', N'0001', N'San Juan Sayultepec', N'764', N'351', N'413', N'212');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1214, 159, 20, N'20', N'216', N'San Juan Tabaá', N'0001', N'San Juan Tabaá', N'1331', N'633', N'698', N'328');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1215, 159, 20, N'20', N'217', N'San Juan Tamazola', N'0001', N'San Juan Tamazola', N'3446', N'1678', N'1768', N'828');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1216, 159, 20, N'20', N'218', N'San Juan Teita', N'0001', N'San Juan Teita', N'607', N'291', N'316', N'155');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1217, 159, 20, N'20', N'219', N'San Juan Teitipac', N'0001', N'San Juan Teitipac', N'2565', N'1232', N'1333', N'716');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1218, 159, 20, N'20', N'220', N'San Juan Tepeuxila', N'0001', N'San Juan Tepeuxila', N'2773', N'1429', N'1344', N'797');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1219, 159, 20, N'20', N'221', N'San Juan Teposcolula', N'0001', N'San Juan Teposcolula', N'1340', N'646', N'694', N'374');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1220, 159, 20, N'20', N'222', N'San Juan Yaeé', N'0001', N'San Juan Yaeé', N'1530', N'718', N'812', N'460');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1221, 159, 20, N'20', N'223', N'San Juan Yatzona', N'0001', N'San Juan Yatzona', N'452', N'195', N'257', N'124');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1222, 159, 20, N'20', N'224', N'San Juan Yucuita', N'0001', N'San Juan Yucuita', N'684', N'314', N'370', N'205');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1223, 159, 20, N'20', N'225', N'San Lorenzo', N'0001', N'San Lorenzo', N'5955', N'2842', N'3113', N'1352');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1224, 159, 20, N'20', N'226', N'San Lorenzo Albarradas', N'0001', N'San Lorenzo Albarradas', N'2708', N'1359', N'1349', N'688');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1225, 159, 20, N'20', N'227', N'San Lorenzo Cacaotepec', N'0001', N'San Lorenzo Cacaotepec', N'13704', N'6548', N'7156', N'3460');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1226, 159, 20, N'20', N'228', N'San Lorenzo Cuaunecuiltitla', N'0001', N'San Lorenzo Cuaunecuiltitla', N'771', N'404', N'367', N'168');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1227, 159, 20, N'20', N'229', N'San Lorenzo Texmelúcan', N'0001', N'San Lorenzo Texmelúcan', N'7048', N'3213', N'3835', N'1253');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1228, 159, 20, N'20', N'230', N'San Lorenzo Victoria', N'0001', N'San Lorenzo Victoria', N'1007', N'491', N'516', N'267');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1229, 159, 20, N'20', N'231', N'San Lucas Camotlán', N'0001', N'San Lucas Camotlán', N'3026', N'1493', N'1533', N'651');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1230, 159, 20, N'20', N'232', N'San Lucas Ojitlán', N'0001', N'San Lucas Ojitlán', N'21514', N'10395', N'11119', N'4674');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1231, 159, 20, N'20', N'233', N'San Lucas Quiaviní', N'0001', N'San Lucas Quiaviní', N'1745', N'720', N'1025', N'425');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1232, 159, 20, N'20', N'234', N'San Lucas Zoquiápam', N'0001', N'San Lucas Zoquiápam', N'7554', N'3653', N'3901', N'1791');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1233, 159, 20, N'20', N'235', N'San Luis Amatlán', N'0001', N'San Luis Amatlán', N'3624', N'1657', N'1967', N'953');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1234, 159, 20, N'20', N'236', N'San Marcial Ozolotepec', N'0001', N'San Marcial Ozolotepec', N'1525', N'723', N'802', N'329');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1235, 159, 20, N'20', N'237', N'San Marcos Arteaga', N'0001', N'San Marcos Arteaga', N'1557', N'719', N'838', N'421');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1236, 159, 20, N'20', N'238', N'San Martín de los Cansecos', N'0001', N'San Martín de los Cansecos', N'816', N'403', N'413', N'214');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1237, 159, 20, N'20', N'239', N'San Martín Huamelúlpam', N'0001', N'San Martín Huamelúlpam', N'1077', N'489', N'588', N'315');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1238, 159, 20, N'20', N'240', N'San Martín Itunyoso', N'0001', N'San Martín Itunyoso', N'2460', N'1077', N'1383', N'540');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1239, 159, 20, N'20', N'241', N'San Martín Lachilá', N'0001', N'San Martín Lachilá', N'1084', N'480', N'604', N'303');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1240, 159, 20, N'20', N'242', N'San Martín Peras', N'0001', N'San Martín Peras', N'11361', N'5473', N'5888', N'1805');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1241, 159, 20, N'20', N'243', N'San Martín Tilcajete', N'0001', N'San Martín Tilcajete', N'1742', N'780', N'962', N'447');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1242, 159, 20, N'20', N'244', N'San Martín Toxpalan', N'0001', N'San Martín Toxpalan', N'3669', N'1774', N'1895', N'894');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1243, 159, 20, N'20', N'245', N'San Martín Zacatepec', N'0001', N'San Martín Zacatepec', N'1277', N'619', N'658', N'343');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1244, 159, 20, N'20', N'246', N'San Mateo Cajonos', N'0001', N'San Mateo Cajonos', N'620', N'280', N'340', N'164');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1245, 159, 20, N'20', N'247', N'Capulálpam de Méndez', N'0001', N'Capulálpam de Méndez', N'1467', N'662', N'805', N'388');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1246, 159, 20, N'20', N'248', N'San Mateo del Mar', N'0001', N'San Mateo del Mar', N'14252', N'7203', N'7049', N'3005');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1247, 159, 20, N'20', N'249', N'San Mateo Yoloxochitlán', N'0001', N'San Mateo Yoloxochitlán', N'3475', N'1654', N'1821', N'844');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1248, 159, 20, N'20', N'250', N'San Mateo Etlaton', N'0001', N'San Mateo Etlaton', N'1181', N'565', N'616', N'340');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1249, 159, 20, N'20', N'251', N'San Mateo Nejápam', N'0001', N'San Mateo Nejápam', N'1180', N'551', N'629', N'270');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1250, 159, 20, N'20', N'252', N'San Mateo Peñasco', N'0001', N'San Mateo Peñasco', N'2116', N'973', N'1143', N'551');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1251, 159, 20, N'20', N'253', N'San Mateo Piñas', N'0001', N'San Mateo Piñas', N'2226', N'1110', N'1116', N'599');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1252, 159, 20, N'20', N'254', N'San Mateo Río Hondo', N'0001', N'San Mateo Río Hondo', N'3308', N'1605', N'1703', N'810');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1253, 159, 20, N'20', N'255', N'San Mateo Sindihui', N'0001', N'San Mateo Sindihui', N'2086', N'993', N'1093', N'511');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1254, 159, 20, N'20', N'256', N'San Mateo Tlapiltepec', N'0001', N'San Mateo Tlapiltepec', N'234', N'106', N'128', N'72');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1255, 159, 20, N'20', N'257', N'San Melchor Betaza', N'0001', N'San Melchor Betaza', N'1091', N'503', N'588', N'315');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1256, 159, 20, N'20', N'258', N'San Miguel Achiutla', N'0001', N'San Miguel Achiutla', N'744', N'348', N'396', N'240');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1257, 159, 20, N'20', N'259', N'San Miguel Ahuehuetitlán', N'0001', N'San Miguel Ahuehuetitlán', N'2465', N'1171', N'1294', N'531');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1258, 159, 20, N'20', N'260', N'San Miguel Aloápam', N'0001', N'San Miguel Aloápam', N'2488', N'1175', N'1313', N'545');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1259, 159, 20, N'20', N'261', N'San Miguel Amatitlán', N'0001', N'San Miguel Amatitlán', N'7244', N'3421', N'3823', N'1540');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1260, 159, 20, N'20', N'262', N'San Miguel Amatlán', N'0001', N'San Miguel Amatlán', N'1043', N'508', N'535', N'282');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1261, 159, 20, N'20', N'263', N'San Miguel Coatlán', N'0001', N'San Miguel Coatlán', N'3483', N'1638', N'1845', N'752');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1262, 159, 20, N'20', N'264', N'San Miguel Chicahua', N'0001', N'San Miguel Chicahua', N'2274', N'1016', N'1258', N'575');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1263, 159, 20, N'20', N'265', N'San Miguel Chimalapa', N'0001', N'San Miguel Chimalapa', N'6608', N'3397', N'3211', N'1750');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1264, 159, 20, N'20', N'266', N'San Miguel del Puerto', N'0001', N'San Miguel del Puerto', N'8481', N'4210', N'4271', N'1994');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1265, 159, 20, N'20', N'267', N'San Miguel del Río', N'0001', N'San Miguel del Río', N'294', N'148', N'146', N'85');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1266, 159, 20, N'20', N'268', N'San Miguel Ejutla', N'0001', N'San Miguel Ejutla', N'916', N'418', N'498', N'221');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1267, 159, 20, N'20', N'269', N'San Miguel el Grande', N'0001', N'San Miguel el Grande', N'4127', N'1904', N'2223', N'1062');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1268, 159, 20, N'20', N'270', N'San Miguel Huautla', N'0001', N'San Miguel Huautla', N'1399', N'659', N'740', N'365');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1269, 159, 20, N'20', N'271', N'San Miguel Mixtepec', N'0001', N'San Miguel Mixtepec', N'3245', N'1571', N'1674', N'586');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1270, 159, 20, N'20', N'272', N'San Miguel Panixtlahuaca', N'0001', N'San Miguel Panixtlahuaca', N'6161', N'2852', N'3309', N'1029');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1271, 159, 20, N'20', N'273', N'San Miguel Peras', N'0001', N'San Miguel Peras', N'3497', N'1672', N'1825', N'751');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1272, 159, 20, N'20', N'274', N'San Miguel Piedras', N'0001', N'San Miguel Piedras', N'1296', N'638', N'658', N'286');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1273, 159, 20, N'20', N'275', N'San Miguel Quetzaltepec', N'0001', N'San Miguel Quetzaltepec', N'7293', N'3652', N'3641', N'1797');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1274, 159, 20, N'20', N'276', N'San Miguel Santa Flor', N'0001', N'San Miguel Santa Flor', N'801', N'398', N'403', N'206');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1275, 159, 20, N'20', N'277', N'Villa Sola de Vega', N'0001', N'Villa Sola de Vega', N'12525', N'6176', N'6349', N'2757');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1276, 159, 20, N'20', N'278', N'San Miguel Soyaltepec', N'0001', N'Temascal', N'36564', N'17715', N'18849', N'8697');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1277, 159, 20, N'20', N'279', N'San Miguel Suchixtepec', N'0001', N'San Miguel Suchixtepec', N'2911', N'1402', N'1509', N'586');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1278, 159, 20, N'20', N'280', N'Villa Talea de Castro', N'0001', N'Villa Talea de Castro', N'2394', N'1152', N'1242', N'716');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1279, 159, 20, N'20', N'281', N'San Miguel Tecomatlán', N'0001', N'San Miguel Tecomatlán', N'308', N'159', N'149', N'99');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1280, 159, 20, N'20', N'282', N'San Miguel Tenan', N'0001', N'San Miguel Tenan', N'794', N'410', N'384', N'207');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1281, 159, 20, N'20', N'283', N'San Miguel Tequixtepec', N'0001', N'San Miguel Tequixtepec', N'1042', N'511', N'531', N'306');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1282, 159, 20, N'20', N'284', N'San Miguel Tilquiápam', N'0001', N'San Miguel Tilquiápam', N'3160', N'1385', N'1775', N'606');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1283, 159, 20, N'20', N'285', N'San Miguel Tlacamama', N'0001', N'San Miguel Tlacamama', N'3386', N'1654', N'1732', N'771');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1284, 159, 20, N'20', N'286', N'San Miguel Tlacotepec', N'0001', N'San Miguel Tlacotepec', N'3220', N'1483', N'1737', N'871');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1285, 159, 20, N'20', N'287', N'San Miguel Tulancin', N'0001', N'San Miguel Tulancin', N'346', N'134', N'212', N'131');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1286, 159, 20, N'20', N'288', N'San Miguel Yotao', N'0001', N'San Miguel Yotao', N'611', N'297', N'314', N'166');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1287, 159, 20, N'20', N'289', N'San Nicolás', N'0001', N'San Nicolás', N'1143', N'519', N'624', N'336');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1288, 159, 20, N'20', N'290', N'San Nicolás Hidal', N'0001', N'San Nicolás Hidal', N'1012', N'463', N'549', N'253');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1289, 159, 20, N'20', N'291', N'San Pablo Coatlán', N'0001', N'San Pablo Coatlán', N'4167', N'2029', N'2138', N'967');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1290, 159, 20, N'20', N'292', N'San Pablo Cuatro Venados', N'0001', N'San Pablo Cuatro Venados', N'1388', N'640', N'748', N'256');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1291, 159, 20, N'20', N'293', N'San Pablo Etla', N'0001', N'San Pablo Etla', N'15535', N'7430', N'8105', N'4387');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1292, 159, 20, N'20', N'294', N'San Pablo Huitzo', N'0001', N'San Pablo Huitzo', N'6307', N'2995', N'3312', N'1653');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1293, 159, 20, N'20', N'295', N'San Pablo Huixtepec', N'0001', N'San Pablo Huixtepec', N'9025', N'4256', N'4769', N'2280');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1294, 159, 20, N'20', N'296', N'San Pablo Macuiltianguis', N'0001', N'San Pablo Macuiltianguis', N'929', N'440', N'489', N'288');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1295, 159, 20, N'20', N'297', N'San Pablo Tijaltepec', N'0001', N'San Pablo Tijaltepec', N'2150', N'948', N'1202', N'440');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1296, 159, 20, N'20', N'298', N'San Pablo Villa de Mitla', N'0001', N'San Pablo Villa de Mitla', N'11825', N'5614', N'6211', N'2939');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1297, 159, 20, N'20', N'299', N'San Pablo Yaganiza', N'0001', N'San Pablo Yaganiza', N'1108', N'518', N'590', N'293');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1298, 159, 20, N'20', N'300', N'San Pedro Amuzs', N'0001', N'San Pedro Amuzs', N'6468', N'3032', N'3436', N'1501');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1299, 159, 20, N'20', N'301', N'San Pedro Apóstol', N'0001', N'San Pedro Apóstol', N'1544', N'708', N'836', N'452');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1300, 159, 20, N'20', N'302', N'San Pedro Atoyac', N'0001', N'San Pedro Atoyac', N'4136', N'1953', N'2183', N'852');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1301, 159, 20, N'20', N'303', N'San Pedro Cajonos', N'0001', N'San Pedro Cajonos', N'1172', N'512', N'660', N'354');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1302, 159, 20, N'20', N'304', N'San Pedro Coxcaltepec Cántaros', N'0001', N'San Pedro Coxcaltepec Cántaros', N'851', N'407', N'444', N'239');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1303, 159, 20, N'20', N'305', N'San Pedro Comitancillo', N'0001', N'San Pedro Comitancillo', N'3944', N'1867', N'2077', N'1099');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1304, 159, 20, N'20', N'306', N'San Pedro el Alto', N'0001', N'San Pedro el Alto', N'3903', N'1904', N'1999', N'816');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1305, 159, 20, N'20', N'307', N'San Pedro Huamelula', N'0001', N'San Pedro Huamelula', N'9594', N'4795', N'4799', N'2656');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1306, 159, 20, N'20', N'308', N'San Pedro Huilotepec', N'0001', N'San Pedro Huilotepec', N'2839', N'1397', N'1442', N'689');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1307, 159, 20, N'20', N'309', N'San Pedro Ixcatlán', N'0001', N'San Pedro Ixcatlán', N'10371', N'5113', N'5258', N'2561');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1308, 159, 20, N'20', N'310', N'San Pedro Ixtlahuaca', N'0001', N'San Pedro Ixtlahuaca', N'6822', N'3322', N'3500', N'1591');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1309, 159, 20, N'20', N'311', N'San Pedro Jaltepeton', N'0001', N'San Pedro Jaltepeton', N'458', N'216', N'242', N'139');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1310, 159, 20, N'20', N'312', N'San Pedro Jicayán', N'0001', N'San Pedro Jicayán', N'11555', N'5544', N'6011', N'2344');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1311, 159, 20, N'20', N'313', N'San Pedro Jocotipac', N'0001', N'San Pedro Jocotipac', N'834', N'377', N'457', N'284');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1312, 159, 20, N'20', N'314', N'San Pedro Juchaten', N'0001', N'San Pedro Juchaten', N'1693', N'807', N'886', N'396');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1313, 159, 20, N'20', N'315', N'San Pedro Mártir', N'0001', N'San Pedro Mártir', N'1711', N'743', N'968', N'476');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1314, 159, 20, N'20', N'316', N'San Pedro Mártir Quiechapa', N'0001', N'San Pedro Mártir Quiechapa', N'753', N'342', N'411', N'190');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1315, 159, 20, N'20', N'317', N'San Pedro Mártir Yucuxaco', N'0001', N'San Pedro Mártir Yucuxaco', N'1405', N'667', N'738', N'408');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1316, 159, 20, N'20', N'318', N'San Pedro Mixtepec', N'0001', N'San Pedro Mixtepec Distrito 22', N'42860', N'20826', N'22034', N'11119');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1317, 159, 20, N'20', N'319', N'San Pedro Mixtepec', N'0001', N'San Pedro Mixtepec Distrito 26', N'1099', N'518', N'581', N'279');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1318, 159, 20, N'20', N'320', N'San Pedro Molinos', N'0001', N'San Pedro Molinos', N'723', N'338', N'385', N'204');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1319, 159, 20, N'20', N'321', N'San Pedro Nopala', N'0001', N'San Pedro Nopala', N'840', N'403', N'437', N'226');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1320, 159, 20, N'20', N'322', N'San Pedro Ocopetatillo', N'0001', N'San Pedro Ocopetatillo', N'884', N'408', N'476', N'229');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1321, 159, 20, N'20', N'323', N'San Pedro Ocotepec', N'0001', N'San Pedro Ocotepec', N'2135', N'1030', N'1105', N'456');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1322, 159, 20, N'20', N'324', N'San Pedro Pochutla', N'0001', N'San Pedro Pochutla', N'43860', N'21514', N'22346', N'10407');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1323, 159, 20, N'20', N'325', N'San Pedro Quiatoni', N'0001', N'San Pedro Quiatoni', N'10491', N'5052', N'5439', N'2419');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1324, 159, 20, N'20', N'326', N'San Pedro Sochiápam', N'0001', N'San Pedro Sochiápam', N'4957', N'2440', N'2517', N'999');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1325, 159, 20, N'20', N'327', N'San Pedro Tapanatepec', N'0001', N'San Pedro Tapanatepec', N'13992', N'6870', N'7122', N'3862');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1326, 159, 20, N'20', N'328', N'San Pedro Taviche', N'0001', N'San Pedro Taviche', N'1173', N'569', N'604', N'261');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1327, 159, 20, N'20', N'329', N'San Pedro Teozacoalco', N'0001', N'San Pedro Teozacoalco', N'1320', N'629', N'691', N'373');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1328, 159, 20, N'20', N'330', N'San Pedro Teutila', N'0001', N'San Pedro Teutila', N'4277', N'2094', N'2183', N'1005');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1329, 159, 20, N'20', N'331', N'San Pedro Tidaá', N'0001', N'San Pedro Tidaá', N'894', N'415', N'479', N'309');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1330, 159, 20, N'20', N'332', N'San Pedro Topiltepec', N'0001', N'San Pedro Topiltepec', N'406', N'199', N'207', N'131');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1331, 159, 20, N'20', N'333', N'San Pedro Totolápam', N'0001', N'San Pedro Totolápam', N'2603', N'1227', N'1376', N'719');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1332, 159, 20, N'20', N'334', N'Villa de Tututepec de Melchor Ocampo', N'0001', N'Villa de Tututepec de Melchor Ocampo', N'43913', N'21372', N'22541', N'11032');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1333, 159, 20, N'20', N'335', N'San Pedro Yaneri', N'0001', N'San Pedro Yaneri', N'1002', N'485', N'517', N'275');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1334, 159, 20, N'20', N'336', N'San Pedro Yólox', N'0001', N'San Pedro Yólox', N'2267', N'1059', N'1208', N'547');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1335, 159, 20, N'20', N'337', N'San Pedro y San Pablo Ayutla', N'0001', N'San Pedro y San Pablo Ayutla', N'5602', N'2597', N'3005', N'1434');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1336, 159, 20, N'20', N'338', N'Villa de Etla', N'0001', N'Villa de Etla', N'9280', N'4426', N'4854', N'2254');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1337, 159, 20, N'20', N'339', N'San Pedro y San Pablo Teposcolula', N'0001', N'San Pedro y San Pablo Teposcolula', N'3989', N'1907', N'2082', N'1031');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1338, 159, 20, N'20', N'340', N'San Pedro y San Pablo Tequixtepec', N'0001', N'San Pedro y San Pablo Tequixtepec', N'1878', N'851', N'1027', N'636');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1339, 159, 20, N'20', N'341', N'San Pedro Yucunama', N'0001', N'San Pedro Yucunama', N'232', N'99', N'133', N'66');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1340, 159, 20, N'20', N'342', N'San Raymundo Jalpan', N'0001', N'San Raymundo Jalpan', N'2079', N'953', N'1126', N'526');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1341, 159, 20, N'20', N'343', N'San Sebastián Abasolo', N'0001', N'San Sebastián Abasolo', N'1849', N'882', N'967', N'459');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1342, 159, 20, N'20', N'344', N'San Sebastián Coatlán', N'0001', N'San Sebastián Coatlán', N'2613', N'1261', N'1352', N'639');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1343, 159, 20, N'20', N'345', N'San Sebastián Ixcapa', N'0001', N'San Sebastián Ixcapa', N'3968', N'1954', N'2014', N'961');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1344, 159, 20, N'20', N'346', N'San Sebastián Nicananduta', N'0001', N'San Sebastián Nicananduta', N'1449', N'624', N'825', N'449');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1345, 159, 20, N'20', N'347', N'San Sebastián Río Hondo', N'0001', N'San Sebastián Río Hondo', N'3664', N'1803', N'1861', N'776');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1346, 159, 20, N'20', N'348', N'San Sebastián Tecomaxtlahuaca', N'0001', N'San Sebastián Tecomaxtlahuaca', N'8246', N'3929', N'4317', N'1998');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1347, 159, 20, N'20', N'349', N'San Sebastián Teitipac', N'0001', N'San Sebastián Teitipac', N'1976', N'906', N'1070', N'547');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1348, 159, 20, N'20', N'350', N'San Sebastián Tutla', N'0001', N'San Sebastián Tutla', N'16241', N'7515', N'8726', N'4494');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1349, 159, 20, N'20', N'351', N'San Simón Almolongas', N'0001', N'San Simón Almolongas', N'2623', N'1214', N'1409', N'681');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1350, 159, 20, N'20', N'352', N'San Simón Zahuatlán', N'0001', N'San Simón Zahuatlán', N'3833', N'1903', N'1930', N'414');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1351, 159, 20, N'20', N'353', N'Santa Ana', N'0001', N'Santa Ana', N'1978', N'957', N'1021', N'472');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1352, 159, 20, N'20', N'354', N'Santa Ana Ateixtlahuaca', N'0001', N'Santa Ana Ateixtlahuaca', N'510', N'257', N'253', N'126');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1353, 159, 20, N'20', N'355', N'Santa Ana Cuauhtémoc', N'0001', N'Santa Ana Cuauhtémoc', N'738', N'347', N'391', N'206');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1354, 159, 20, N'20', N'356', N'Santa Ana del Valle', N'0001', N'Santa Ana del Valle', N'1993', N'966', N'1027', N'541');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1355, 159, 20, N'20', N'357', N'Santa Ana Tavela', N'0001', N'Santa Ana Tavela', N'908', N'442', N'466', N'279');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1356, 159, 20, N'20', N'358', N'Santa Ana Tlapacoyan', N'0001', N'Santa Ana Tlapacoyan', N'1854', N'875', N'979', N'570');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1357, 159, 20, N'20', N'359', N'Santa Ana Yareni', N'0001', N'Santa Ana Yareni', N'809', N'347', N'462', N'251');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1358, 159, 20, N'20', N'360', N'Santa Ana Zegache', N'0001', N'Santa Ana Zegache', N'3592', N'1684', N'1908', N'937');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1359, 159, 20, N'20', N'361', N'Santa Catalina Quierí', N'0001', N'Santa Catalina Quierí', N'922', N'415', N'507', N'249');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1360, 159, 20, N'20', N'362', N'Santa Catarina Cuixtla', N'0001', N'Santa Catarina Cuixtla', N'1496', N'673', N'823', N'402');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1361, 159, 20, N'20', N'363', N'Santa Catarina Ixtepeji', N'0001', N'Santa Catarina Ixtepeji', N'2633', N'1267', N'1366', N'662');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1362, 159, 20, N'20', N'364', N'Santa Catarina Juquila', N'0001', N'Santa Catarina Juquila', N'14710', N'7145', N'7565', N'3043');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1363, 159, 20, N'20', N'365', N'Santa Catarina Lachatao', N'0001', N'Santa Catarina Lachatao', N'1307', N'636', N'671', N'396');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1364, 159, 20, N'20', N'366', N'Santa Catarina Loxicha', N'0001', N'Santa Catarina Loxicha', N'3986', N'1985', N'2001', N'829');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1365, 159, 20, N'20', N'367', N'Santa Catarina Mechoacán', N'0001', N'Santa Catarina Mechoacán', N'4543', N'2232', N'2311', N'956');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1366, 159, 20, N'20', N'368', N'Santa Catarina Minas', N'0001', N'Santa Catarina Minas', N'1816', N'889', N'927', N'446');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1367, 159, 20, N'20', N'369', N'Santa Catarina Quiané', N'0001', N'Santa Catarina Quiané', N'1847', N'887', N'960', N'510');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1368, 159, 20, N'20', N'370', N'Santa Catarina Tayata', N'0001', N'Santa Catarina Tayata', N'679', N'312', N'367', N'192');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1369, 159, 20, N'20', N'371', N'Santa Catarina Ticuá', N'0001', N'Santa Catarina Ticuá', N'954', N'423', N'531', N'327');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1370, 159, 20, N'20', N'372', N'Santa Catarina Yosonotú', N'0001', N'Santa Catarina Yosonotú', N'1886', N'845', N'1041', N'487');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1371, 159, 20, N'20', N'373', N'Santa Catarina Zapoquila', N'0001', N'Santa Catarina Zapoquila', N'448', N'214', N'234', N'132');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1372, 159, 20, N'20', N'374', N'Santa Cruz Acatepec', N'0001', N'Santa Cruz Acatepec', N'1470', N'710', N'760', N'344');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1373, 159, 20, N'20', N'375', N'Santa Cruz Amilpas', N'0001', N'Santa Cruz Amilpas', N'10120', N'4746', N'5374', N'2607');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1374, 159, 20, N'20', N'376', N'Santa Cruz de Bravo', N'0001', N'Santa Cruz de Bravo', N'364', N'177', N'187', N'109');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1375, 159, 20, N'20', N'377', N'Santa Cruz Itundujia', N'0001', N'Santa Cruz Itundujia', N'10975', N'5278', N'5697', N'2547');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1376, 159, 20, N'20', N'378', N'Santa Cruz Mixtepec', N'0001', N'Santa Cruz Mixtepec', N'3615', N'1720', N'1895', N'892');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1377, 159, 20, N'20', N'379', N'Santa Cruz Nundaco', N'0001', N'Santa Cruz Nundaco', N'2958', N'1359', N'1599', N'669');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1378, 159, 20, N'20', N'380', N'Santa Cruz Papalutla', N'0001', N'Santa Cruz Papalutla', N'1972', N'950', N'1022', N'535');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1379, 159, 20, N'20', N'381', N'Santa Cruz Tacache de Mina', N'0001', N'Santa Cruz Tacache de Mina', N'2606', N'1235', N'1371', N'662');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1380, 159, 20, N'20', N'382', N'Santa Cruz Tacahua', N'0001', N'Santa Cruz Tacahua', N'1170', N'551', N'619', N'314');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1381, 159, 20, N'20', N'383', N'Santa Cruz Tayata', N'0001', N'Santa Cruz Tayata', N'608', N'294', N'314', N'155');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1382, 159, 20, N'20', N'384', N'Santa Cruz Xitla', N'0001', N'Santa Cruz Xitla', N'4514', N'2153', N'2361', N'932');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1383, 159, 20, N'20', N'385', N'Santa Cruz Xoxocotlán', N'0001', N'Santa Cruz Xoxocotlán', N'77833', N'36822', N'41011', N'19368');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1384, 159, 20, N'20', N'386', N'Santa Cruz Zenzontepec', N'0001', N'Santa Cruz Zenzontepec', N'17897', N'8669', N'9228', N'3587');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1385, 159, 20, N'20', N'387', N'Santa Gertrudis', N'0001', N'Santa Gertrudis', N'2858', N'1368', N'1490', N'790');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1386, 159, 20, N'20', N'388', N'Santa Inés del Monte', N'0001', N'Santa Inés del Monte', N'2535', N'1233', N'1302', N'517');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1387, 159, 20, N'20', N'389', N'Santa Inés Yatzeche', N'0001', N'Santa Inés Yatzeche', N'921', N'389', N'532', N'213');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1388, 159, 20, N'20', N'390', N'Santa Lucía del Camino', N'0001', N'Santa Lucía del Camino', N'47356', N'22857', N'24499', N'12258');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1389, 159, 20, N'20', N'391', N'Santa Lucía Miahuatlán', N'0001', N'Santa Lucía Miahuatlán', N'3356', N'1634', N'1722', N'723');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1390, 159, 20, N'20', N'392', N'Santa Lucía Monteverde', N'0001', N'Santa Lucía Monteverde', N'6678', N'3184', N'3494', N'1607');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1391, 159, 20, N'20', N'393', N'Santa Lucía Ocotlán', N'0001', N'Santa Lucía Ocotlán', N'3604', N'1615', N'1989', N'802');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1392, 159, 20, N'20', N'394', N'Santa María Alotepec', N'0001', N'Santa María Alotepec', N'2778', N'1381', N'1397', N'747');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1393, 159, 20, N'20', N'395', N'Santa María Apazco', N'0001', N'Santa María Apazco', N'1898', N'870', N'1028', N'534');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1394, 159, 20, N'20', N'396', N'Santa María la Asunción', N'0001', N'Santa María la Asunción', N'3252', N'1440', N'1812', N'849');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1395, 159, 20, N'20', N'397', N'Heroica Ciudad de Tlaxiaco', N'0001', N'Heroica Ciudad de Tlaxiaco', N'38453', N'17987', N'20466', N'9325');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1396, 159, 20, N'20', N'398', N'Ayoquezco de Aldama', N'0001', N'Ayoquezco de Aldama', N'4406', N'2053', N'2353', N'1225');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1397, 159, 20, N'20', N'399', N'Santa María Atzompa', N'0001', N'Santa María Atzompa', N'27465', N'13029', N'14436', N'7022');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1398, 159, 20, N'20', N'400', N'Santa María Camotlán', N'0001', N'Santa María Camotlán', N'1632', N'750', N'882', N'472');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1399, 159, 20, N'20', N'401', N'Santa María Colotepec', N'0001', N'Santa María Colotepec', N'22562', N'11104', N'11458', N'5480');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1400, 159, 20, N'20', N'402', N'Santa María Cortijo', N'0001', N'Santa María Cortijo', N'1083', N'516', N'567', N'265');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1401, 159, 20, N'20', N'403', N'Santa María Coyotepec', N'0001', N'Santa María Coyotepec', N'2772', N'1316', N'1456', N'680');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1402, 159, 20, N'20', N'404', N'Santa María Chachoápam', N'0001', N'Santa María Chachoápam', N'766', N'355', N'411', N'236');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1403, 159, 20, N'20', N'405', N'Villa de Chilapa de Díaz', N'0001', N'Villa de Chilapa de Díaz', N'1932', N'844', N'1088', N'570');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1404, 159, 20, N'20', N'406', N'Santa María Chilchotla', N'0001', N'Santa María Chilchotla', N'20584', N'10098', N'10486', N'4842');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1405, 159, 20, N'20', N'407', N'Santa María Chimalapa', N'0001', N'Santa María Chimalapa', N'8506', N'4256', N'4250', N'2076');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1406, 159, 20, N'20', N'408', N'Santa María del Rosario', N'0001', N'Santa María del Rosario', N'480', N'249', N'231', N'133');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1407, 159, 20, N'20', N'409', N'Santa María del Tule', N'0001', N'Santa María del Tule', N'8165', N'3754', N'4411', N'2227');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1408, 159, 20, N'20', N'410', N'Santa María Ecatepec', N'0001', N'Santa María Ecatepec', N'3461', N'1703', N'1758', N'922');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1409, 159, 20, N'20', N'411', N'Santa María Guelacé', N'0001', N'Santa María Guelacé', N'816', N'360', N'456', N'187');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1410, 159, 20, N'20', N'412', N'Santa María Guienagati', N'0001', N'Santa María Guienagati', N'3286', N'1639', N'1647', N'760');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1411, 159, 20, N'20', N'413', N'Santa María Huatulco', N'0001', N'Santa María Huatulco', N'38629', N'18726', N'19903', N'10161');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1412, 159, 20, N'20', N'414', N'Santa María Huazolotitlán', N'0001', N'Santa María Huazolotitlán', N'10794', N'5277', N'5517', N'2776');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1413, 159, 20, N'20', N'415', N'Santa María Ipalapa', N'0001', N'Santa María Ipalapa', N'4888', N'2290', N'2598', N'1135');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1414, 159, 20, N'20', N'416', N'Santa María Ixcatlán', N'0001', N'Santa María Ixcatlán', N'516', N'243', N'273', N'175');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1415, 159, 20, N'20', N'417', N'Santa María Jacatepec', N'0001', N'Santa María Jacatepec', N'9240', N'4380', N'4860', N'2248');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1416, 159, 20, N'20', N'418', N'Santa María Jalapa del Marqués', N'0001', N'Santa María Jalapa del Marqués', N'11888', N'5707', N'6181', N'3207');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1417, 159, 20, N'20', N'419', N'Santa María Jaltianguis', N'0001', N'Santa María Jaltianguis', N'575', N'257', N'318', N'173');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1418, 159, 20, N'20', N'420', N'Santa María Lachixío', N'0001', N'Santa María Lachixío', N'1680', N'776', N'904', N'349');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1419, 159, 20, N'20', N'421', N'Santa María Mixtequilla', N'0001', N'Santa María Mixtequilla', N'4442', N'2158', N'2284', N'1231');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1420, 159, 20, N'20', N'422', N'Santa María Nativitas', N'0001', N'Santa María Nativitas', N'681', N'308', N'373', N'203');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1421, 159, 20, N'20', N'423', N'Santa María Nduayaco', N'0001', N'Santa María Nduayaco', N'550', N'280', N'270', N'168');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1422, 159, 20, N'20', N'424', N'Santa María Ozolotepec', N'0001', N'Santa María Ozolotepec', N'3992', N'1915', N'2077', N'867');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1423, 159, 20, N'20', N'425', N'Santa María Pápalo', N'0001', N'Santa María Pápalo', N'2209', N'1104', N'1105', N'595');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1424, 159, 20, N'20', N'426', N'Santa María Peñoles', N'0001', N'Santa María Peñoles', N'7865', N'3799', N'4066', N'1407');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1425, 159, 20, N'20', N'427', N'Santa María Petapa', N'0001', N'Santa María Petapa', N'15387', N'7439', N'7948', N'4088');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1426, 159, 20, N'20', N'428', N'Santa María Quielani', N'0001', N'Santa María Quielani', N'1770', N'886', N'884', N'397');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1427, 159, 20, N'20', N'429', N'Santa María Sola', N'0001', N'Santa María Sola', N'1524', N'719', N'805', N'380');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1428, 159, 20, N'20', N'430', N'Santa María Tataltepec', N'0001', N'Santa María Tataltepec', N'253', N'122', N'131', N'85');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1429, 159, 20, N'20', N'431', N'Santa María Tecomavaca', N'0001', N'Santa María Tecomavaca', N'1774', N'847', N'927', N'451');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1430, 159, 20, N'20', N'432', N'Santa María Temaxcalapa', N'0001', N'Santa María Temaxcalapa', N'968', N'465', N'503', N'286');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1431, 159, 20, N'20', N'433', N'Santa María Temaxcaltepec', N'0001', N'Santa María Temaxcaltepec', N'2595', N'1204', N'1391', N'567');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1432, 159, 20, N'20', N'434', N'Santa María Teopoxco', N'0001', N'Santa María Teopoxco', N'4651', N'2208', N'2443', N'975');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1433, 159, 20, N'20', N'435', N'Santa María Tepantlali', N'0001', N'Santa María Tepantlali', N'3505', N'1714', N'1791', N'802');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1434, 159, 20, N'20', N'436', N'Santa María Texcatitlán', N'0001', N'Santa María Texcatitlán', N'1113', N'539', N'574', N'267');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1435, 159, 20, N'20', N'437', N'Santa María Tlahuitoltepec', N'0001', N'Santa María Tlahuitoltepec', N'9663', N'4680', N'4983', N'2081');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1436, 159, 20, N'20', N'438', N'Santa María Tlalixtac', N'0001', N'Santa María Tlalixtac', N'1754', N'841', N'913', N'404');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1437, 159, 20, N'20', N'439', N'Santa María Tonameca', N'0001', N'Santa María Tonameca', N'24318', N'12000', N'12318', N'5400');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1438, 159, 20, N'20', N'440', N'Santa María Totolapilla', N'0001', N'Santa María Totolapilla', N'896', N'425', N'471', N'276');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1439, 159, 20, N'20', N'441', N'Santa María Xadani', N'0001', N'Santa María Xadani', N'7781', N'3929', N'3852', N'1753');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1440, 159, 20, N'20', N'442', N'Santa María Yalina', N'0001', N'Santa María Yalina', N'354', N'162', N'192', N'100');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1441, 159, 20, N'20', N'443', N'Santa María Yavesía', N'0001', N'Santa María Yavesía', N'448', N'200', N'248', N'139');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1442, 159, 20, N'20', N'444', N'Santa María Yolotepec', N'0001', N'Santa María Yolotepec', N'461', N'228', N'233', N'117');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1443, 159, 20, N'20', N'445', N'Santa María Yosoyúa', N'0001', N'Santa María Yosoyúa', N'1642', N'805', N'837', N'335');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1444, 159, 20, N'20', N'446', N'Santa María Yucuhiti', N'0001', N'Santa María Yucuhiti', N'6551', N'3119', N'3432', N'1430');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1445, 159, 20, N'20', N'447', N'Santa María Zacatepec', N'0001', N'Santa María Zacatepec', N'15076', N'7021', N'8055', N'3428');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1446, 159, 20, N'20', N'448', N'Santa María Zaniza', N'0001', N'Santa María Zaniza', N'2009', N'964', N'1045', N'360');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1447, 159, 20, N'20', N'449', N'Santa María Zoquitlán', N'0001', N'Santa María Zoquitlán', N'3359', N'1666', N'1693', N'969');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1448, 159, 20, N'20', N'450', N'Santia Amoltepec', N'0001', N'Santia Amoltepec', N'12313', N'5930', N'6383', N'2419');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1449, 159, 20, N'20', N'451', N'Santia Apoala', N'0001', N'Santia Apoala', N'1053', N'495', N'558', N'312');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1450, 159, 20, N'20', N'452', N'Santia Apóstol', N'0001', N'Santia Apóstol', N'4220', N'1879', N'2341', N'1043');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1451, 159, 20, N'20', N'453', N'Santia Astata', N'0001', N'Santia Astata', N'3915', N'1941', N'1974', N'1075');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1452, 159, 20, N'20', N'454', N'Santia Atitlán', N'0001', N'Santia Atitlán', N'3180', N'1618', N'1562', N'731');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1453, 159, 20, N'20', N'455', N'Santia Ayuquililla', N'0001', N'Santia Ayuquililla', N'2748', N'1284', N'1464', N'605');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1454, 159, 20, N'20', N'456', N'Santia Cacaloxtepec', N'0001', N'Santia Cacaloxtepec', N'1686', N'808', N'878', N'445');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1455, 159, 20, N'20', N'457', N'Santia Camotlán', N'0001', N'Santia Camotlán', N'3395', N'1704', N'1691', N'813');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1456, 159, 20, N'20', N'458', N'Santia Comaltepec', N'0001', N'Santia Comaltepec', N'1115', N'528', N'587', N'307');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1457, 159, 20, N'20', N'459', N'Santia Chazumba', N'0001', N'Santia Chazumba', N'4479', N'2040', N'2439', N'1381');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1458, 159, 20, N'20', N'460', N'Santia Choápam', N'0001', N'Santia Choápam', N'5413', N'2620', N'2793', N'1248');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1459, 159, 20, N'20', N'461', N'Santia del Río', N'0001', N'Santia del Río', N'614', N'306', N'308', N'201');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1460, 159, 20, N'20', N'462', N'Santia Huajolotitlán', N'0001', N'Santia Huajolotitlán', N'4350', N'1972', N'2378', N'1116');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1461, 159, 20, N'20', N'463', N'Santia Huauclilla', N'0001', N'Santia Huauclilla', N'663', N'317', N'346', N'221');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1462, 159, 20, N'20', N'464', N'Santia Ihuitlán Plumas', N'0001', N'Santia Ihuitlán Plumas', N'480', N'217', N'263', N'161');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1463, 159, 20, N'20', N'465', N'Santia Ixcuintepec', N'0001', N'Santia Ixcuintepec', N'1568', N'773', N'795', N'347');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1464, 159, 20, N'20', N'466', N'Santia Ixtayutla', N'0001', N'Santia Ixtayutla', N'11917', N'5749', N'6168', N'2433');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1465, 159, 20, N'20', N'467', N'Santia Jamiltepec', N'0001', N'Santia Jamiltepec', N'18383', N'8815', N'9568', N'4711');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1466, 159, 20, N'20', N'468', N'Santia Jocotepec', N'0019', N'Monte Negro', N'13568', N'6682', N'6886', N'2746');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1467, 159, 20, N'20', N'469', N'Santia Juxtlahuaca', N'0001', N'Santia Juxtlahuaca', N'32927', N'15475', N'17452', N'6946');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1468, 159, 20, N'20', N'470', N'Santia Lachiguiri', N'0001', N'Santia Lachiguiri', N'4693', N'2302', N'2391', N'1328');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1469, 159, 20, N'20', N'471', N'Santia Lalopa', N'0001', N'Santia Lalopa', N'496', N'225', N'271', N'140');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1470, 159, 20, N'20', N'472', N'Santia Laollaga', N'0001', N'Santia Laollaga', N'3198', N'1594', N'1604', N'956');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1471, 159, 20, N'20', N'473', N'Santia Laxopa', N'0001', N'Santia Laxopa', N'1394', N'660', N'734', N'366');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1472, 159, 20, N'20', N'474', N'Santia Llano Grande', N'0001', N'Santia Llano Grande', N'3260', N'1609', N'1651', N'854');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1473, 159, 20, N'20', N'475', N'Santia Matatlán', N'0001', N'Santia Matatlán', N'9653', N'4547', N'5106', N'2251');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1474, 159, 20, N'20', N'476', N'Santia Miltepec', N'0001', N'Santia Miltepec', N'409', N'197', N'212', N'121');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1475, 159, 20, N'20', N'477', N'Santia Minas', N'0001', N'Santia Minas', N'1430', N'701', N'729', N'341');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1476, 159, 20, N'20', N'478', N'Santia Nacaltepec', N'0001', N'Santia Nacaltepec', N'1913', N'919', N'994', N'620');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1477, 159, 20, N'20', N'479', N'Santia Nejapilla', N'0001', N'Santia Nejapilla', N'219', N'118', N'101', N'79');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1478, 159, 20, N'20', N'480', N'Santia Nundiche', N'0001', N'Santia Nundiche', N'967', N'469', N'498', N'264');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1479, 159, 20, N'20', N'481', N'Santia Nuyoó', N'0001', N'Santia Nuyoó', N'1966', N'926', N'1040', N'529');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1480, 159, 20, N'20', N'482', N'Santia Pinotepa Nacional', N'0001', N'Santia Pinotepa Nacional', N'50309', N'24328', N'25981', N'12366');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1481, 159, 20, N'20', N'483', N'Santia Suchilquiton', N'0001', N'Santia Suchilquiton', N'9542', N'4555', N'4987', N'2346');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1482, 159, 20, N'20', N'484', N'Santia Tamazola', N'0001', N'Santia Tamazola', N'4207', N'1922', N'2285', N'1010');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1483, 159, 20, N'20', N'485', N'Santia Tapextla', N'0001', N'Santia Tapextla', N'3031', N'1539', N'1492', N'619');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1484, 159, 20, N'20', N'486', N'Villa Tejúpam de la Unión', N'0001', N'Villa Tejúpam de la Unión', N'2469', N'1194', N'1275', N'655');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1485, 159, 20, N'20', N'487', N'Santia Tenan', N'0001', N'Santia Tenan', N'1945', N'973', N'972', N'491');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1486, 159, 20, N'20', N'488', N'Santia Tepetlapa', N'0001', N'Santia Tepetlapa', N'131', N'62', N'69', N'39');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1487, 159, 20, N'20', N'489', N'Santia Tetepec', N'0001', N'Santia Tetepec', N'4953', N'2403', N'2550', N'1103');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1488, 159, 20, N'20', N'490', N'Santia Texcalcin', N'0001', N'Santia Texcalcin', N'3076', N'1473', N'1603', N'716');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1489, 159, 20, N'20', N'491', N'Santia Textitlán', N'0001', N'Santia Textitlán', N'4170', N'2048', N'2122', N'750');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1490, 159, 20, N'20', N'492', N'Santia Tilanton', N'0001', N'Santia Tilanton', N'3210', N'1495', N'1715', N'892');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1491, 159, 20, N'20', N'493', N'Santia Tillo', N'0001', N'Santia Tillo', N'553', N'258', N'295', N'182');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1492, 159, 20, N'20', N'494', N'Santia Tlazoyaltepec', N'0001', N'Santia Tlazoyaltepec', N'4894', N'2244', N'2650', N'953');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1493, 159, 20, N'20', N'495', N'Santia Xanica', N'0001', N'Santia Xanica', N'2884', N'1428', N'1456', N'668');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1494, 159, 20, N'20', N'496', N'Santia Xiacuí', N'0001', N'Santia Xiacuí', N'2171', N'1023', N'1148', N'581');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1495, 159, 20, N'20', N'497', N'Santia Yaitepec', N'0001', N'Santia Yaitepec', N'4122', N'1893', N'2229', N'711');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1496, 159, 20, N'20', N'498', N'Santia Yaveo', N'0001', N'Santia Yaveo', N'6665', N'3326', N'3339', N'1632');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1497, 159, 20, N'20', N'499', N'Santia Yolomécatl', N'0001', N'Santia Yolomécatl', N'2021', N'932', N'1089', N'530');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1498, 159, 20, N'20', N'500', N'Santia Yosondúa', N'0001', N'Santia Yosondúa', N'7883', N'3723', N'4160', N'2127');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1499, 159, 20, N'20', N'501', N'Santia Yucuyachi', N'0001', N'Santia Yucuyachi', N'940', N'446', N'494', N'297');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1500, 159, 20, N'20', N'502', N'Santia Zacatepec', N'0001', N'Santia Zacatepec', N'5515', N'2730', N'2785', N'1329');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1501, 159, 20, N'20', N'503', N'Santia Zoochila', N'0001', N'Santia Zoochila', N'374', N'175', N'199', N'99');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1502, 159, 20, N'20', N'504', N'Nuevo Zoquiápam', N'0001', N'Nuevo Zoquiápam', N'1652', N'788', N'864', N'375');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1503, 159, 20, N'20', N'505', N'Santo Domin Ingenio', N'0001', N'Santo Domin Ingenio', N'7554', N'3781', N'3773', N'2251');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1504, 159, 20, N'20', N'506', N'Santo Domin Albarradas', N'0001', N'Santo Domin Albarradas', N'782', N'361', N'421', N'203');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1505, 159, 20, N'20', N'507', N'Santo Domin Armenta', N'0001', N'Santo Domin Armenta', N'3224', N'1601', N'1623', N'797');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1506, 159, 20, N'20', N'508', N'Santo Domin Chihuitán', N'0001', N'Santo Domin Chihuitán', N'1521', N'754', N'767', N'477');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1507, 159, 20, N'20', N'509', N'Santo Domin de Morelos', N'0001', N'Santo Domin de Morelos', N'10547', N'5065', N'5482', N'2050');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1508, 159, 20, N'20', N'510', N'Santo Domin Ixcatlán', N'0001', N'Santo Domin Ixcatlán', N'877', N'405', N'472', N'244');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1509, 159, 20, N'20', N'511', N'Santo Domin Nuxaá', N'0001', N'Santo Domin Nuxaá', N'3610', N'1742', N'1868', N'756');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1510, 159, 20, N'20', N'512', N'Santo Domin Ozolotepec', N'0001', N'Santo Domin Ozolotepec', N'913', N'432', N'481', N'193');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1511, 159, 20, N'20', N'513', N'Santo Domin Petapa', N'0001', N'Santo Domin Petapa', N'8394', N'4192', N'4202', N'2200');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1512, 159, 20, N'20', N'514', N'Santo Domin Roayaga', N'0001', N'Santo Domin Roayaga', N'997', N'472', N'525', N'252');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1513, 159, 20, N'20', N'515', N'Santo Domin Tehuantepec', N'0001', N'Santo Domin Tehuantepec', N'61872', N'30124', N'31748', N'16071');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1514, 159, 20, N'20', N'516', N'Santo Domin Teojomulco', N'0001', N'Santo Domin Teojomulco', N'4571', N'2198', N'2373', N'1005');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1515, 159, 20, N'20', N'517', N'Santo Domin Tepuxtepec', N'0001', N'Santo Domin Tepuxtepec', N'5194', N'2454', N'2740', N'1164');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1516, 159, 20, N'20', N'518', N'Santo Domin Tlatayápam', N'0001', N'Santo Domin Tlatayápam', N'153', N'74', N'79', N'51');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1517, 159, 20, N'20', N'519', N'Santo Domin Tomaltepec', N'0001', N'Santo Domin Tomaltepec', N'2790', N'1367', N'1423', N'775');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1518, 159, 20, N'20', N'520', N'Santo Domin Tonalá', N'0001', N'Santo Domin Tonalá', N'7153', N'3339', N'3814', N'1799');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1519, 159, 20, N'20', N'521', N'Santo Domin Tonaltepec', N'0001', N'Santo Domin Tonaltepec', N'276', N'111', N'165', N'87');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1520, 159, 20, N'20', N'522', N'Santo Domin Xagacía', N'0001', N'Santo Domin Xagacía', N'1213', N'564', N'649', N'332');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1521, 159, 20, N'20', N'523', N'Santo Domin Yanhuitlán', N'0001', N'Santo Domin Yanhuitlán', N'1609', N'760', N'849', N'455');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1522, 159, 20, N'20', N'524', N'Santo Domin Yodohino', N'0001', N'Santo Domin Yodohino', N'369', N'173', N'196', N'120');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1523, 159, 20, N'20', N'525', N'Santo Domin Zanatepec', N'0001', N'Santo Domin Zanatepec', N'11218', N'5541', N'5677', N'3133');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1524, 159, 20, N'20', N'526', N'Santos Reyes Nopala', N'0001', N'Santos Reyes Nopala', N'15986', N'7759', N'8227', N'3683');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1525, 159, 20, N'20', N'527', N'Santos Reyes Pápalo', N'0001', N'Santos Reyes Pápalo', N'2829', N'1375', N'1454', N'585');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1526, 159, 20, N'20', N'528', N'Santos Reyes Tepejillo', N'0001', N'Santos Reyes Tepejillo', N'1213', N'520', N'693', N'341');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1527, 159, 20, N'20', N'529', N'Santos Reyes Yucuná', N'0001', N'Santos Reyes Yucuná', N'1332', N'658', N'674', N'189');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1528, 159, 20, N'20', N'530', N'Santo Tomás Jalieza', N'0001', N'Santo Tomás Jalieza', N'3385', N'1605', N'1780', N'809');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1529, 159, 20, N'20', N'531', N'Santo Tomás Mazaltepec', N'0001', N'Santo Tomás Mazaltepec', N'2333', N'1094', N'1239', N'593');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1530, 159, 20, N'20', N'532', N'Santo Tomás Ocotepec', N'0001', N'Santo Tomás Ocotepec', N'4076', N'1900', N'2176', N'903');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1531, 159, 20, N'20', N'533', N'Santo Tomás Tamazulapan', N'0001', N'Santo Tomás Tamazulapan', N'2191', N'1052', N'1139', N'544');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1532, 159, 20, N'20', N'534', N'San Vicente Coatlán', N'0001', N'San Vicente Coatlán', N'3964', N'1839', N'2125', N'880');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1533, 159, 20, N'20', N'535', N'San Vicente Lachixío', N'0001', N'San Vicente Lachixío', N'2976', N'1364', N'1612', N'565');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1534, 159, 20, N'20', N'536', N'San Vicente Nuñú', N'0001', N'San Vicente Nuñú', N'493', N'225', N'268', N'167');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1535, 159, 20, N'20', N'537', N'Silacayoápam', N'0001', N'Silacayoápam', N'6747', N'3159', N'3588', N'1794');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1536, 159, 20, N'20', N'538', N'Sitio de Xitlapehua', N'0001', N'Sitio de Xitlapehua', N'705', N'339', N'366', N'169');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1537, 159, 20, N'20', N'539', N'Soledad Etla', N'0001', N'Soledad Etla', N'5025', N'2431', N'2594', N'1200');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1538, 159, 20, N'20', N'540', N'Villa de Tamazulápam del Progreso', N'0001', N'Villa de Tamazulápam del Progreso', N'7059', N'3288', N'3771', N'1802');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1539, 159, 20, N'20', N'541', N'Tanetze de Zaraza', N'0001', N'Tanetze de Zaraza', N'1707', N'825', N'882', N'523');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1540, 159, 20, N'20', N'542', N'Taniche', N'0001', N'Taniche', N'746', N'332', N'414', N'198');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1541, 159, 20, N'20', N'543', N'Tataltepec de Valdés', N'0001', N'Tataltepec de Valdés', N'5561', N'2709', N'2852', N'1295');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1542, 159, 20, N'20', N'544', N'Teococuilco de Marcos Pérez', N'0001', N'Teococuilco de Marcos Pérez', N'1106', N'497', N'609', N'310');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1543, 159, 20, N'20', N'545', N'Teotitlán de Flores Magón', N'0001', N'Teotitlán de Flores Magón', N'8966', N'4275', N'4691', N'2261');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1544, 159, 20, N'20', N'546', N'Teotitlán del Valle', N'0001', N'Teotitlán del Valle', N'5638', N'2657', N'2981', N'1421');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1545, 159, 20, N'20', N'547', N'Teoton', N'0001', N'Teoton', N'951', N'433', N'518', N'297');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1546, 159, 20, N'20', N'548', N'Tepelmeme Villa de Morelos', N'0001', N'Tepelmeme Villa de Morelos', N'1734', N'796', N'938', N'515');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1547, 159, 20, N'20', N'549', N'Heroica Villa Tezoatlán de Segura y Luna, Cuna de la Independencia de Oaxaca', N'0001', N'Heroica Villa Tezoatlán de Segura y Luna, Cuna de la Independencia de Oaxaca', N'11319', N'5158', N'6161', N'3028');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1548, 159, 20, N'20', N'550', N'San Jerónimo Tlacochahuaya', N'0001', N'San Jerónimo Tlacochahuaya', N'5076', N'2368', N'2708', N'1303');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1549, 159, 20, N'20', N'551', N'Tlacolula de Matamoros', N'0001', N'Tlacolula de Matamoros', N'19625', N'9151', N'10474', N'5104');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1550, 159, 20, N'20', N'552', N'Tlacotepec Plumas', N'0001', N'Tlacotepec Plumas', N'510', N'240', N'270', N'164');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1551, 159, 20, N'20', N'553', N'Tlalixtac de Cabrera', N'0001', N'Tlalixtac de Cabrera', N'9417', N'4453', N'4964', N'2240');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1552, 159, 20, N'20', N'554', N'Totontepec Villa de Morelos', N'0001', N'Totontepec Villa de Morelos', N'5598', N'2685', N'2913', N'1370');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1553, 159, 20, N'20', N'555', N'Trinidad Zaachila', N'0001', N'Trinidad Zaachila', N'2653', N'1246', N'1407', N'678');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1554, 159, 20, N'20', N'556', N'La Trinidad Vista Hermosa', N'0001', N'La Trinidad Vista Hermosa', N'249', N'110', N'139', N'78');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1555, 159, 20, N'20', N'557', N'Unión Hidal', N'0001', N'Unión Hidal', N'13970', N'6749', N'7221', N'3660');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1556, 159, 20, N'20', N'558', N'Valerio Trujano', N'0001', N'Valerio Trujano', N'1543', N'685', N'858', N'401');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1557, 159, 20, N'20', N'559', N'San Juan Bautista Valle Nacional', N'0001', N'San Juan Bautista Valle Nacional', N'22446', N'10688', N'11758', N'5238');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1558, 159, 20, N'20', N'560', N'Villa Díaz Ordaz', N'0001', N'Villa Díaz Ordaz', N'6174', N'2797', N'3377', N'1570');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1559, 159, 20, N'20', N'561', N'Yaxe', N'0001', N'Yaxe', N'2683', N'1269', N'1414', N'690');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1560, 159, 20, N'20', N'562', N'Magdalena Yodocono de Porfirio Díaz', N'0001', N'Magdalena Yodocono de Porfirio Díaz', N'1458', N'691', N'767', N'380');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1561, 159, 20, N'20', N'563', N'Yogana', N'0001', N'Yogana', N'1308', N'602', N'706', N'346');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1562, 159, 20, N'20', N'564', N'Yutanduchi de Guerrero', N'0001', N'Yutanduchi de Guerrero', N'1292', N'617', N'675', N'387');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1563, 159, 20, N'20', N'565', N'Villa de Zaachila', N'0001', N'Villa de Zaachila', N'34101', N'16240', N'17861', N'8170');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1564, 159, 20, N'20', N'566', N'San Mateo Yucutindoo', N'0009', N'San Mateo Yucutindoo', N'3034', N'1473', N'1561', N'707');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1565, 159, 20, N'20', N'567', N'Zapotitlán Lagunas', N'0001', N'Zapotitlán Lagunas', N'3133', N'1436', N'1697', N'811');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1566, 159, 20, N'20', N'568', N'Zapotitlán Palmas', N'0001', N'Zapotitlán Palmas', N'1514', N'669', N'845', N'397');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1567, 159, 20, N'20', N'569', N'Santa Inés de Zaraza', N'0001', N'Santa Inés de Zaraza', N'1707', N'804', N'903', N'493');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1568, 159, 20, N'20', N'570', N'Zimatlán de Álvarez', N'0001', N'Zimatlán de Álvarez', N'19215', N'8935', N'10280', N'4720');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1569, 159, 21, N'21', N'001', N'Acajete', N'0001', N'Acajete', N'60353', N'29225', N'31128', N'12014');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1570, 159, 21, N'21', N'002', N'Acateno', N'0001', N'San José Acateno', N'8916', N'4484', N'4432', N'2270');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1571, 159, 21, N'21', N'003', N'Acatlán', N'0001', N'Acatlán de Osorio', N'33865', N'15545', N'18320', N'8465');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1572, 159, 21, N'21', N'004', N'Acatzin', N'0001', N'Acatzin de Hidal', N'52078', N'25298', N'26780', N'10675');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1573, 159, 21, N'21', N'005', N'Acteopan', N'0001', N'Acteopan', N'2881', N'1340', N'1541', N'763');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1574, 159, 21, N'21', N'006', N'Ahuacatlán', N'0001', N'Ahuacatlán', N'14754', N'7087', N'7667', N'3270');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1575, 159, 21, N'21', N'007', N'Ahuatlán', N'0001', N'Ahuatlán', N'3403', N'1662', N'1741', N'833');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1576, 159, 21, N'21', N'008', N'Ahuazotepec', N'0001', N'Ahuazotepec', N'10457', N'5127', N'5330', N'2451');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1577, 159, 21, N'21', N'009', N'Ahuehuetitla', N'0001', N'Ahuehuetitla', N'2008', N'935', N'1073', N'533');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1578, 159, 21, N'21', N'010', N'Ajalpan', N'0001', N'Ciudad de Ajalpan', N'60621', N'29304', N'31317', N'12047');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1579, 159, 21, N'21', N'011', N'Albino Zertuche', N'0001', N'Acaxtlahuacán de Albino Zertuche', N'1770', N'811', N'959', N'441');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1580, 159, 21, N'21', N'012', N'Aljojuca', N'0001', N'Aljojuca', N'6288', N'2934', N'3354', N'1538');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1581, 159, 21, N'21', N'013', N'Altepexi', N'0001', N'Altepexi', N'18920', N'9109', N'9811', N'4126');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1582, 159, 21, N'21', N'014', N'Amixtlán', N'0001', N'Amixtlán', N'5004', N'2370', N'2634', N'1242');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1583, 159, 21, N'21', N'015', N'Amozoc', N'0001', N'Amozoc de Mota', N'100964', N'49098', N'51866', N'22506');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1584, 159, 21, N'21', N'016', N'Aquixtla', N'0001', N'Aquixtla', N'7848', N'3900', N'3948', N'1955');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1585, 159, 21, N'21', N'017', N'Atempan', N'0001', N'Atempan', N'25386', N'12278', N'13108', N'5415');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1586, 159, 21, N'21', N'018', N'Atexcal', N'0001', N'San Martín Atexcal', N'3734', N'1790', N'1944', N'983');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1587, 159, 21, N'21', N'019', N'Atlixco', N'0001', N'Atlixco', N'127062', N'59360', N'67702', N'31559');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1588, 159, 21, N'21', N'020', N'Atoyatempan', N'0001', N'Atoyatempan', N'6426', N'3099', N'3327', N'1566');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1589, 159, 21, N'21', N'021', N'Atzala', N'0001', N'Atzala', N'1228', N'585', N'643', N'295');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1590, 159, 21, N'21', N'022', N'Atzitzihuacán', N'0001', N'Santia Atzitzihuacán', N'11684', N'5329', N'6355', N'2692');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1591, 159, 21, N'21', N'023', N'Atzitzintla', N'0001', N'Atzitzintla', N'8408', N'4118', N'4290', N'1831');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1592, 159, 21, N'21', N'024', N'Axutla', N'0001', N'Axutla', N'947', N'439', N'508', N'271');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1593, 159, 21, N'21', N'025', N'Ayotoxco de Guerrero', N'0001', N'Ayotoxco de Guerrero', N'8153', N'3993', N'4160', N'1981');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1594, 159, 21, N'21', N'026', N'Calpan', N'0001', N'San Andrés Calpan', N'13730', N'6464', N'7266', N'3198');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1595, 159, 21, N'21', N'027', N'Caltepec', N'0001', N'Caltepec', N'4177', N'1953', N'2224', N'1152');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1596, 159, 21, N'21', N'028', N'Camocuautla', N'0001', N'Camocuautla', N'2476', N'1214', N'1262', N'607');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1597, 159, 21, N'21', N'029', N'Caxhuacan', N'0001', N'Caxhuacan', N'3791', N'1810', N'1981', N'896');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1598, 159, 21, N'21', N'030', N'Coatepec', N'0001', N'Coatepec', N'758', N'359', N'399', N'197');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1599, 159, 21, N'21', N'031', N'Coatzin', N'0001', N'Coatzin', N'2964', N'1403', N'1561', N'785');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1600, 159, 21, N'21', N'032', N'Cohetzala', N'0001', N'Santa María Cohetzala', N'1283', N'646', N'637', N'316');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1601, 159, 21, N'21', N'033', N'Cohuecan', N'0001', N'Cohuecan', N'4763', N'2258', N'2505', N'1080');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1602, 159, 21, N'21', N'034', N'Coronan', N'0001', N'Santa María Coronan', N'34596', N'16758', N'17838', N'7378');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1603, 159, 21, N'21', N'035', N'Coxcatlán', N'0001', N'Coxcatlán', N'19639', N'9368', N'10271', N'4527');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1604, 159, 21, N'21', N'036', N'Coyomeapan', N'0001', N'Santa María Coyomeapan', N'14205', N'6801', N'7404', N'3104');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1605, 159, 21, N'21', N'037', N'Coyotepec', N'0001', N'San Vicente Coyotepec', N'2339', N'1081', N'1258', N'698');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1606, 159, 21, N'21', N'038', N'Cuapiaxtla de Madero', N'0001', N'Cuapiaxtla de Madero', N'8709', N'4286', N'4423', N'1914');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1607, 159, 21, N'21', N'039', N'Cuautempan', N'0001', N'San Esteban Cuautempan', N'9212', N'4408', N'4804', N'2391');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1608, 159, 21, N'21', N'040', N'Cuautinchán', N'0001', N'Cuautinchán', N'9538', N'4697', N'4841', N'2163');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1609, 159, 21, N'21', N'041', N'Cuautlancin', N'0001', N'San Juan Cuautlancin', N'79153', N'38477', N'40676', N'20198');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1610, 159, 21, N'21', N'042', N'Cuayuca de Andrade', N'0001', N'San Pedro Cuayuca', N'3062', N'1457', N'1605', N'806');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1611, 159, 21, N'21', N'043', N'Cuetzalan del Progreso', N'0001', N'Ciudad de Cuetzalan', N'47433', N'23240', N'24193', N'10662');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1612, 159, 21, N'21', N'044', N'Cuyoaco', N'0001', N'Cuyoaco', N'15367', N'7412', N'7955', N'3527');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1613, 159, 21, N'21', N'045', N'Chalchicomula de Sesma', N'0001', N'Ciudad Serdán', N'43882', N'21092', N'22790', N'10394');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1614, 159, 21, N'21', N'046', N'Chapulco', N'0001', N'Chapulco', N'6992', N'3343', N'3649', N'1460');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1615, 159, 21, N'21', N'047', N'Chiautla', N'0001', N'Ciudad de Chiautla de Tapia', N'19037', N'9191', N'9846', N'4794');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1616, 159, 21, N'21', N'048', N'Chiautzin', N'0001', N'San Lorenzo Chiautzin', N'18762', N'8846', N'9916', N'4018');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1617, 159, 21, N'21', N'049', N'Chiconcuautla', N'0001', N'Chiconcuautla', N'15767', N'7696', N'8071', N'3417');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1618, 159, 21, N'21', N'050', N'Chichiquila', N'0001', N'Chichiquila', N'24148', N'11918', N'12230', N'4269');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1619, 159, 21, N'21', N'051', N'Chietla', N'0001', N'Chietla', N'33935', N'16288', N'17647', N'8935');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1620, 159, 21, N'21', N'052', N'Chigmecatitlán', N'0001', N'Chigmecatitlán', N'1227', N'581', N'646', N'367');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1621, 159, 21, N'21', N'053', N'Chignahuapan', N'0001', N'Ciudad de Chignahuapan', N'57909', N'28228', N'29681', N'14007');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1622, 159, 21, N'21', N'054', N'Chignautla', N'0001', N'Chignautla', N'30254', N'14669', N'15585', N'6347');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1623, 159, 21, N'21', N'055', N'Chila', N'0001', N'Chila', N'4699', N'2169', N'2530', N'1226');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1624, 159, 21, N'21', N'056', N'Chila de la Sal', N'0001', N'Chila de la Sal', N'1237', N'571', N'666', N'363');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1625, 159, 21, N'21', N'057', N'Honey', N'0001', N'Honey', N'7463', N'3552', N'3911', N'1764');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1626, 159, 21, N'21', N'058', N'Chilchotla', N'0001', N'Rafael J. García', N'19257', N'9682', N'9575', N'3533');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1627, 159, 21, N'21', N'059', N'Chinantla', N'0001', N'Chinantla', N'2468', N'1151', N'1317', N'650');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1628, 159, 21, N'21', N'060', N'Domin Arenas', N'0001', N'Domin Arenas', N'6946', N'3296', N'3650', N'1524');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1629, 159, 21, N'21', N'061', N'Eloxochitlán', N'0001', N'Eloxochitlán', N'12575', N'6181', N'6394', N'2706');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1630, 159, 21, N'21', N'062', N'Epatlán', N'0001', N'San Juan Epatlán', N'4594', N'2216', N'2378', N'1184');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1631, 159, 21, N'21', N'063', N'Esperanza', N'0001', N'Esperanza', N'13785', N'6593', N'7192', N'3274');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1632, 159, 21, N'21', N'064', N'Francisco Z. Mena', N'0001', N'Metlaltoyuca', N'16270', N'8154', N'8116', N'4138');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1633, 159, 21, N'21', N'065', N'General Felipe Ángeles', N'0001', N'San Pablo de las Tunas', N'19040', N'9125', N'9915', N'4208');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1634, 159, 21, N'21', N'066', N'Guadalupe', N'0001', N'Guadalupe', N'6276', N'2919', N'3357', N'1592');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1635, 159, 21, N'21', N'067', N'Guadalupe Victoria', N'0001', N'Guadalupe Victoria', N'16551', N'8006', N'8545', N'3796');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1636, 159, 21, N'21', N'068', N'Hermenegildo Galeana', N'0001', N'Bienvenido', N'7718', N'3849', N'3869', N'1851');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1637, 159, 21, N'21', N'069', N'Huaquechula', N'0001', N'Huaquechula', N'25373', N'11681', N'13692', N'6041');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1638, 159, 21, N'21', N'070', N'Huatlatlauca', N'0001', N'Huatlatlauca', N'6643', N'3051', N'3592', N'1734');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1639, 159, 21, N'21', N'071', N'Huauchinan', N'0001', N'Huauchinan', N'97753', N'46336', N'51417', N'23335');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1640, 159, 21, N'21', N'072', N'Huehuetla', N'0001', N'Huehuetla', N'15689', N'7706', N'7983', N'3365');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1641, 159, 21, N'21', N'073', N'Huehuetlán el Chico', N'0001', N'Huehuetlán el Chico', N'8679', N'4179', N'4500', N'2107');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1642, 159, 21, N'21', N'074', N'Huejotzin', N'0001', N'Huejotzin', N'63457', N'30723', N'32734', N'13840');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1643, 159, 21, N'21', N'075', N'Hueyapan', N'0001', N'Hueyapan', N'11868', N'5787', N'6081', N'2624');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1644, 159, 21, N'21', N'076', N'Hueytamalco', N'0001', N'Hueytamalco', N'26689', N'13208', N'13481', N'6629');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1645, 159, 21, N'21', N'077', N'Hueytlalpan', N'0001', N'Hueytlalpan', N'5734', N'2827', N'2907', N'1245');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1646, 159, 21, N'21', N'078', N'Huitzilan de Serdán', N'0001', N'Huitzilan', N'13982', N'7049', N'6933', N'3195');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1647, 159, 21, N'21', N'079', N'Huitziltepec', N'0001', N'Santa Clara Huitziltepec', N'5306', N'2534', N'2772', N'1270');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1648, 159, 21, N'21', N'080', N'Atlequizayan', N'0001', N'Atlequizayan', N'2833', N'1328', N'1505', N'659');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1649, 159, 21, N'21', N'081', N'Ixcamilpa de Guerrero', N'0001', N'Ixcamilpa', N'3695', N'1756', N'1939', N'913');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1650, 159, 21, N'21', N'082', N'Ixcaquixtla', N'0001', N'San Juan Ixcaquixtla', N'8093', N'3857', N'4236', N'1981');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1651, 159, 21, N'21', N'083', N'Ixtacamaxtitlán', N'0001', N'Ixtacamaxtitlán', N'25326', N'12524', N'12802', N'5828');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1652, 159, 21, N'21', N'084', N'Ixtepec', N'0001', N'Ixtepec', N'6811', N'3285', N'3526', N'1502');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1653, 159, 21, N'21', N'085', N'Izúcar de Matamoros', N'0001', N'Izúcar de Matamoros', N'72799', N'34451', N'38348', N'18132');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1654, 159, 21, N'21', N'086', N'Jalpan', N'0001', N'Jalpan', N'12547', N'6067', N'6480', N'2963');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1655, 159, 21, N'21', N'087', N'Jolalpan', N'0001', N'Jolalpan', N'12662', N'6006', N'6656', N'3002');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1656, 159, 21, N'21', N'088', N'Jonotla', N'0001', N'Jonotla', N'4598', N'2237', N'2361', N'1177');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1657, 159, 21, N'21', N'089', N'Jopala', N'0001', N'Jopala', N'12997', N'6327', N'6670', N'2937');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1658, 159, 21, N'21', N'090', N'Juan C. Bonilla', N'0001', N'Cuanalá', N'18540', N'8881', N'9659', N'4035');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1659, 159, 21, N'21', N'091', N'Juan Galindo', N'0001', N'Nuevo Necaxa', N'10213', N'4800', N'5413', N'2633');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1660, 159, 21, N'21', N'092', N'Juan N. Méndez', N'0001', N'Atenayuca', N'5223', N'2562', N'2661', N'1284');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1661, 159, 21, N'21', N'093', N'Lafragua', N'0001', N'Saltillo', N'7767', N'3806', N'3961', N'1803');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1662, 159, 21, N'21', N'094', N'Libres', N'0001', N'Ciudad de Libres', N'31532', N'15224', N'16308', N'7122');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1663, 159, 21, N'21', N'095', N'La Magdalena Tlatlauquitepec', N'0001', N'La Magdalena Tlatlauquitepec', N'484', N'242', N'242', N'122');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1664, 159, 21, N'21', N'096', N'Mazapiltepec de Juárez', N'0001', N'Mazapiltepec de Juárez', N'2633', N'1303', N'1330', N'600');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1665, 159, 21, N'21', N'097', N'Mixtla', N'0001', N'San Francisco Mixtla', N'2216', N'1032', N'1184', N'474');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1666, 159, 21, N'21', N'098', N'Molcaxac', N'0001', N'Molcaxac', N'6218', N'2902', N'3316', N'1583');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1667, 159, 21, N'21', N'099', N'Cañada Morelos', N'0001', N'Morelos Cañada', N'18954', N'9132', N'9822', N'4529');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1668, 159, 21, N'21', N'100', N'Naupan', N'0001', N'Naupan', N'9707', N'4610', N'5097', N'2165');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1669, 159, 21, N'21', N'101', N'Nauzontla', N'0001', N'Nauzontla', N'3598', N'1695', N'1903', N'956');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1670, 159, 21, N'21', N'102', N'Nealtican', N'0001', N'San Buenaventura Nealtican', N'12011', N'5746', N'6265', N'2510');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1671, 159, 21, N'21', N'103', N'Nicolás Bravo', N'0001', N'Nicolás Bravo', N'6009', N'2915', N'3094', N'1311');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1672, 159, 21, N'21', N'104', N'Nopalucan', N'0001', N'Nopalucan de la Granja', N'27292', N'13259', N'14033', N'5779');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1673, 159, 21, N'21', N'105', N'Ocotepec', N'0001', N'Ocotepec', N'4825', N'2329', N'2496', N'1205');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1674, 159, 21, N'21', N'106', N'Ocoyucan', N'0001', N'Santa Clara Ocoyucan', N'25720', N'12128', N'13592', N'5393');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1675, 159, 21, N'21', N'107', N'Olintla', N'0001', N'Olintla', N'11641', N'5681', N'5960', N'2428');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1676, 159, 21, N'21', N'108', N'Oriental', N'0001', N'Oriental', N'16575', N'8009', N'8566', N'3785');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1677, 159, 21, N'21', N'109', N'Pahuatlán', N'0001', N'Ciudad de Pahuatlán de Valle', N'20618', N'9905', N'10713', N'4961');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1678, 159, 21, N'21', N'110', N'Palmar de Bravo', N'0001', N'Palmar de Bravo', N'42887', N'20914', N'21973', N'9335');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1679, 159, 21, N'21', N'111', N'Pantepec', N'0001', N'Pantepec', N'18435', N'8947', N'9488', N'4601');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1680, 159, 21, N'21', N'112', N'Petlalcin', N'0001', N'Petlalcin', N'9382', N'4356', N'5026', N'2414');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1681, 159, 21, N'21', N'113', N'Piaxtla', N'0001', N'Piaxtla', N'4585', N'2187', N'2398', N'1278');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1682, 159, 21, N'21', N'114', N'Puebla', N'0001', N'Heróica Puebla de Zaraza', N'1539819', N'734352', N'805467', N'406507');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1683, 159, 21, N'21', N'115', N'Quecholac', N'0001', N'Quecholac', N'47281', N'23041', N'24240', N'10319');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1684, 159, 21, N'21', N'116', N'Quimixtlán', N'0001', N'Quimixtlán', N'21275', N'10572', N'10703', N'4048');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1685, 159, 21, N'21', N'117', N'Rafael Lara Grajales', N'0001', N'Ciudad de Rafael Lara Grajales', N'14052', N'6679', N'7373', N'3151');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1686, 159, 21, N'21', N'118', N'Los Reyes de Juárez', N'0001', N'Los Reyes de Juárez', N'25553', N'12390', N'13163', N'5295');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1687, 159, 21, N'21', N'119', N'San Andrés Cholula', N'0001', N'San Andrés Cholula', N'100439', N'48650', N'51789', N'25384');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1688, 159, 21, N'21', N'120', N'San Antonio Cañada', N'0001', N'San Antonio Cañada', N'5110', N'2393', N'2717', N'1057');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1689, 159, 21, N'21', N'121', N'San Die la Mesa Tochimiltzin', N'0001', N'Tochimiltzin', N'1132', N'549', N'583', N'280');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1690, 159, 21, N'21', N'122', N'San Felipe Teotlalcin', N'0001', N'San Felipe Teotlalcin', N'9426', N'4564', N'4862', N'2067');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1691, 159, 21, N'21', N'123', N'San Felipe Tepatlán', N'0001', N'San Felipe Tepatlán', N'4120', N'2022', N'2098', N'1006');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1692, 159, 21, N'21', N'124', N'San Gabriel Chilac', N'0001', N'San Gabriel Chilac', N'14454', N'6818', N'7636', N'3297');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1693, 159, 21, N'21', N'125', N'San Grerio Atzompa', N'0001', N'San Grerio Atzompa', N'8170', N'3864', N'4306', N'2052');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1694, 159, 21, N'21', N'126', N'San Jerónimo Tecuanipan', N'0001', N'San Jerónimo Tecuanipan', N'5826', N'2762', N'3064', N'1263');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1695, 159, 21, N'21', N'127', N'San Jerónimo Xayacatlán', N'0001', N'San Jerónimo Xayacatlán', N'3777', N'1757', N'2020', N'1104');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1696, 159, 21, N'21', N'128', N'San José Chiapa', N'0001', N'San José Chiapa', N'8087', N'3966', N'4121', N'1917');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1697, 159, 21, N'21', N'129', N'San José Miahuatlán', N'0001', N'San José Miahuatlán', N'12699', N'5941', N'6758', N'3186');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1698, 159, 21, N'21', N'130', N'San Juan Atenco', N'0001', N'San Juan Atenco', N'3416', N'1582', N'1834', N'881');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1699, 159, 21, N'21', N'131', N'San Juan Atzompa', N'0001', N'San Juan Atzompa', N'872', N'442', N'430', N'225');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1700, 159, 21, N'21', N'132', N'San Martín Texmelucan', N'0001', N'San Martín Texmelucan de Labastida', N'141112', N'67505', N'73607', N'33122');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1701, 159, 21, N'21', N'133', N'San Martín Totoltepec', N'0001', N'San Martín Totoltepec', N'651', N'313', N'338', N'166');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1702, 159, 21, N'21', N'134', N'San Matías Tlalancaleca', N'0001', N'San Matías Tlalancaleca', N'19310', N'9406', N'9904', N'4406');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1703, 159, 21, N'21', N'135', N'San Miguel Ixitlán', N'0001', N'San Miguel Ixitlán', N'586', N'282', N'304', N'208');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1704, 159, 21, N'21', N'136', N'San Miguel Xoxtla', N'0001', N'San Miguel Xoxtla', N'11598', N'5624', N'5974', N'2808');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1705, 159, 21, N'21', N'137', N'San Nicolás Buenos Aires', N'0001', N'San Nicolás Buenos Aires', N'9185', N'4471', N'4714', N'2105');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1706, 159, 21, N'21', N'138', N'San Nicolás de los Ranchos', N'0001', N'San Nicolás de los Ranchos', N'10777', N'5190', N'5587', N'2360');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1707, 159, 21, N'21', N'139', N'San Pablo Anicano', N'0001', N'San Pablo Anicano', N'3554', N'1690', N'1864', N'866');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1708, 159, 21, N'21', N'140', N'San Pedro Cholula', N'0001', N'Cholula de Rivadavia', N'120459', N'57578', N'62881', N'29209');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1709, 159, 21, N'21', N'141', N'San Pedro Yeloixtlahuaca', N'0001', N'San Pedro Yeloixtlahuaca', N'3395', N'1628', N'1767', N'863');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1710, 159, 21, N'21', N'142', N'San Salvador el Seco', N'0001', N'San Salvador el Seco', N'27622', N'13391', N'14231', N'6428');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1711, 159, 21, N'21', N'143', N'San Salvador el Verde', N'0001', N'San Salvador el Verde', N'28419', N'13816', N'14603', N'6264');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1712, 159, 21, N'21', N'144', N'San Salvador Huixcolotla', N'0001', N'San Salvador Huixcolotla', N'13541', N'6663', N'6878', N'2923');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1713, 159, 21, N'21', N'145', N'San Sebastián Tlacotepec', N'0001', N'Tlacotepec de Porfirio Díaz', N'13534', N'6668', N'6866', N'2938');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1714, 159, 21, N'21', N'146', N'Santa Catarina Tlaltempan', N'0001', N'Santa Catarina Tlaltempan', N'874', N'439', N'435', N'294');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1715, 159, 21, N'21', N'147', N'Santa Inés Ahuatempan', N'0001', N'Santa Inés Ahuatempan', N'5944', N'2861', N'3083', N'1577');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1716, 159, 21, N'21', N'148', N'Santa Isabel Cholula', N'0001', N'Santa Isabel Cholula', N'8040', N'3853', N'4187', N'1738');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1717, 159, 21, N'21', N'149', N'Santia Miahuatlán', N'0001', N'Santia Miahuatlán', N'21993', N'10595', N'11398', N'4822');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1718, 159, 21, N'21', N'150', N'Huehuetlán el Grande', N'0001', N'Santo Domin Huehuetlán', N'7060', N'3418', N'3642', N'1742');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1719, 159, 21, N'21', N'151', N'Santo Tomás Hueyotlipan', N'0001', N'Santo Tomás Hueyotlipan', N'8016', N'3822', N'4194', N'1784');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1720, 159, 21, N'21', N'152', N'Soltepec', N'0001', N'Soltepec', N'11706', N'5702', N'6004', N'2545');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1721, 159, 21, N'21', N'153', N'Tecali de Herrera', N'0001', N'Tecali de Herrera', N'20267', N'9770', N'10497', N'4749');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1722, 159, 21, N'21', N'154', N'Tecamachalco', N'0001', N'Tecamachalco', N'71571', N'34365', N'37206', N'16037');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1723, 159, 21, N'21', N'155', N'Tecomatlán', N'0001', N'Tecomatlán', N'5420', N'2578', N'2842', N'1446');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1724, 159, 21, N'21', N'156', N'Tehuacán', N'0001', N'Tehuacán', N'274906', N'129484', N'145422', N'67005');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1725, 159, 21, N'21', N'157', N'Tehuitzin', N'0001', N'Tehuitzin', N'11328', N'5360', N'5968', N'2863');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1726, 159, 21, N'21', N'158', N'Tenampulco', N'0001', N'Tenampulco', N'6772', N'3327', N'3445', N'1866');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1727, 159, 21, N'21', N'159', N'Teopantlán', N'0001', N'Teopantlán', N'4024', N'1807', N'2217', N'1078');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1728, 159, 21, N'21', N'160', N'Teotlalco', N'0001', N'Teotlalco', N'3121', N'1514', N'1607', N'758');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1729, 159, 21, N'21', N'161', N'Tepanco de López', N'0001', N'Tepanco de López', N'19002', N'8916', N'10086', N'4419');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1730, 159, 21, N'21', N'162', N'Tepan de Rodríguez', N'0001', N'Tepan de Rodríguez', N'4244', N'2003', N'2241', N'964');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1731, 159, 21, N'21', N'163', N'Tepatlaxco de Hidal', N'0001', N'Tepatlaxco de Hidal', N'16275', N'7831', N'8444', N'3401');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1732, 159, 21, N'21', N'164', N'Tepeaca', N'0001', N'Tepeaca', N'74708', N'35672', N'39036', N'15789');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1733, 159, 21, N'21', N'165', N'Tepemaxalco', N'0001', N'San Felipe Tepemaxalco', N'1141', N'547', N'594', N'236');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1734, 159, 21, N'21', N'166', N'Tepeojuma', N'0001', N'Tepeojuma', N'8056', N'3655', N'4401', N'2037');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1735, 159, 21, N'21', N'167', N'Tepetzintla', N'0001', N'Tepetzintla', N'10240', N'4944', N'5296', N'2227');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1736, 159, 21, N'21', N'168', N'Tepexco', N'0001', N'Tepexco', N'6580', N'3160', N'3420', N'1450');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1737, 159, 21, N'21', N'169', N'Tepexi de Rodríguez', N'0001', N'Tepexi de Rodríguez', N'20478', N'10400', N'10078', N'4940');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1738, 159, 21, N'21', N'170', N'Tepeyahualco', N'0001', N'Tepeyahualco', N'16390', N'8087', N'8303', N'3805');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1739, 159, 21, N'21', N'171', N'Tepeyahualco de Cuauhtémoc', N'0001', N'Tepeyahualco de Cuauhtémoc', N'3365', N'1601', N'1764', N'840');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1740, 159, 21, N'21', N'172', N'Tetela de Ocampo', N'0001', N'Ciudad de Tetela de Ocampo', N'25793', N'12341', N'13452', N'6543');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1741, 159, 21, N'21', N'173', N'Teteles de Avila Castillo', N'0001', N'Teteles de Avila Castillo', N'5689', N'2633', N'3056', N'1422');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1742, 159, 21, N'21', N'174', N'Teziutlán', N'0001', N'Teziutlán', N'92246', N'43462', N'48784', N'23159');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1743, 159, 21, N'21', N'175', N'Tianguismanalco', N'0001', N'Tianguismanalco', N'9807', N'4626', N'5181', N'2189');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1744, 159, 21, N'21', N'176', N'Tilapa', N'0001', N'Tilapa', N'8401', N'4016', N'4385', N'2115');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1745, 159, 21, N'21', N'177', N'Tlacotepec de Benito Juárez', N'0001', N'Tlacotepec de Benito Juárez', N'48268', N'22926', N'25342', N'10308');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1746, 159, 21, N'21', N'178', N'Tlacuilotepec', N'0001', N'Tlacuilotepec', N'17115', N'8406', N'8709', N'4202');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1747, 159, 21, N'21', N'179', N'Tlachichuca', N'0001', N'Tlachichuca', N'28568', N'13950', N'14618', N'6451');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1748, 159, 21, N'21', N'180', N'Tlahuapan', N'0001', N'Santa Rita Tlahuapan', N'36518', N'17975', N'18543', N'8151');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1749, 159, 21, N'21', N'181', N'Tlaltenan', N'0001', N'Tlaltenan', N'6269', N'3103', N'3166', N'1395');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1750, 159, 21, N'21', N'182', N'Tlanepantla', N'0001', N'Tlanepantla', N'4833', N'2325', N'2508', N'950');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1751, 159, 21, N'21', N'183', N'Tlaola', N'0001', N'Tlaola', N'19826', N'9672', N'10154', N'4417');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1752, 159, 21, N'21', N'184', N'Tlapacoya', N'0001', N'Tlapacoya', N'6406', N'3128', N'3278', N'1506');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1753, 159, 21, N'21', N'185', N'Tlapanalá', N'0001', N'Tlapanalá', N'8404', N'3930', N'4474', N'1995');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1754, 159, 21, N'21', N'186', N'Tlatlauquitepec', N'0001', N'Ciudad de Tlatlauquitepec', N'51495', N'24722', N'26773', N'12376');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1755, 159, 21, N'21', N'187', N'Tlaxco', N'0001', N'Tlaxco', N'5415', N'2663', N'2752', N'1347');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1756, 159, 21, N'21', N'188', N'Tochimilco', N'0001', N'Tochimilco', N'17028', N'7916', N'9112', N'3885');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1757, 159, 21, N'21', N'189', N'Tochtepec', N'0001', N'Tochtepec', N'19701', N'9439', N'10262', N'4444');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1758, 159, 21, N'21', N'190', N'Totoltepec de Guerrero', N'0001', N'Totoltepec de Guerrero', N'1155', N'526', N'629', N'364');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1759, 159, 21, N'21', N'191', N'Tulcin', N'0001', N'Tulcin de Valle', N'9245', N'4275', N'4970', N'2355');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1760, 159, 21, N'21', N'192', N'Tuzamapan de Galeana', N'0001', N'Tuzamapan de Galeana', N'5983', N'2892', N'3091', N'1434');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1761, 159, 21, N'21', N'193', N'Tzicatlacoyan', N'0001', N'Tzicatlacoyan', N'6242', N'3062', N'3180', N'1612');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1762, 159, 21, N'21', N'194', N'Venustiano Carranza', N'0001', N'Venustiano Carranza', N'27890', N'13474', N'14416', N'6898');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1763, 159, 21, N'21', N'195', N'Vicente Guerrero', N'0001', N'Santa María del Monte', N'24217', N'11592', N'12625', N'4818');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1764, 159, 21, N'21', N'196', N'Xayacatlán de Bravo', N'0001', N'Xayacatlán de Bravo', N'1649', N'752', N'897', N'476');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1765, 159, 21, N'21', N'197', N'Xicotepec', N'0001', N'Xicotepec de Juárez', N'75601', N'36390', N'39211', N'17974');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1766, 159, 21, N'21', N'198', N'Xicotlán', N'0001', N'Xicotlán', N'1241', N'583', N'658', N'302');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1767, 159, 21, N'21', N'199', N'Xiutetelco', N'0001', N'San Juan Xiutetelco', N'37910', N'18326', N'19584', N'7915');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1768, 159, 21, N'21', N'200', N'Xochiapulco', N'0001', N'Cinco de Mayo', N'3911', N'1906', N'2005', N'1044');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1769, 159, 21, N'21', N'201', N'Xochiltepec', N'0001', N'Xochiltepec', N'3187', N'1437', N'1750', N'763');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1770, 159, 21, N'21', N'202', N'Xochitlán de Vicente Suárez', N'0001', N'Xochitlán de Vicente Suárez', N'12249', N'5977', N'6272', N'2956');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1771, 159, 21, N'21', N'203', N'Xochitlán Todos Santos', N'0001', N'Xochitlán', N'6049', N'2872', N'3177', N'1513');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1772, 159, 21, N'21', N'204', N'Yaonáhuac', N'0001', N'Yaonáhuac', N'7514', N'3613', N'3901', N'1687');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1773, 159, 21, N'21', N'205', N'Yehualtepec', N'0001', N'Yehualtepec', N'22976', N'11113', N'11863', N'5224');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1774, 159, 21, N'21', N'206', N'Zacapala', N'0001', N'Zacapala', N'4224', N'1962', N'2262', N'1123');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1775, 159, 21, N'21', N'207', N'Zacapoaxtla', N'0001', N'Zacapoaxtla', N'53295', N'25534', N'27761', N'12292');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1776, 159, 21, N'21', N'208', N'Zacatlán', N'0001', N'Zacatlán', N'76296', N'36133', N'40163', N'18394');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1777, 159, 21, N'21', N'209', N'Zapotitlán', N'0001', N'Zapotitlán Salinas', N'8220', N'3712', N'4508', N'1970');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1778, 159, 21, N'21', N'210', N'Zapotitlán de Méndez', N'0001', N'Zapotitlán de Méndez', N'5608', N'2779', N'2829', N'1296');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1779, 159, 21, N'21', N'211', N'Zaraza', N'0001', N'Zaraza', N'15444', N'7152', N'8292', N'3815');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1780, 159, 21, N'21', N'212', N'Zautla', N'0001', N'Santia Zautla', N'19438', N'9186', N'10252', N'4464');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1781, 159, 21, N'21', N'213', N'Zihuateutla', N'0001', N'Zihuateutla', N'12530', N'6112', N'6418', N'2833');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1782, 159, 21, N'21', N'214', N'Zinacatepec', N'0001', N'San Sebastián Zinacatepec', N'15690', N'7374', N'8316', N'3637');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1783, 159, 21, N'21', N'215', N'Zonzotla', N'0001', N'Zonzotla', N'4599', N'2258', N'2341', N'1034');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1784, 159, 21, N'21', N'216', N'Zoquiapan', N'0001', N'Zoquiapan', N'2639', N'1251', N'1388', N'716');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1785, 159, 21, N'21', N'217', N'Zoquitlán', N'0001', N'Zoquitlán', N'20529', N'9987', N'10542', N'4249');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1786, 159, 22, N'22', N'001', N'Amealco de Bonfil', N'0001', N'Amealco de Bonfil', N'62197', N'29842', N'32355', N'13832');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1787, 159, 22, N'22', N'002', N'Pinal de Amoles', N'0001', N'Pinal de Amoles', N'27093', N'12859', N'14234', N'6053');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1788, 159, 22, N'22', N'003', N'Arroyo Seco', N'0001', N'Arroyo Seco', N'12910', N'6122', N'6788', N'3288');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1789, 159, 22, N'22', N'004', N'Cadereyta de Montes', N'0001', N'Cadereyta de Montes', N'64183', N'30585', N'33598', N'14536');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1790, 159, 22, N'22', N'005', N'Colón', N'0001', N'Colón', N'58171', N'28975', N'29196', N'13129');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1791, 159, 22, N'22', N'006', N'Corregidora', N'0001', N'El Pueblito', N'143073', N'69373', N'73700', N'37991');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1792, 159, 22, N'22', N'007', N'Ezequiel Montes', N'0001', N'Ezequiel Montes', N'38123', N'18213', N'19910', N'8959');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1793, 159, 22, N'22', N'008', N'Huimilpan', N'0001', N'Huimilpan', N'35554', N'16930', N'18624', N'8237');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1794, 159, 22, N'22', N'009', N'Jalpan de Serra', N'0001', N'Jalpan de Serra', N'25550', N'12192', N'13358', N'6342');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1795, 159, 22, N'22', N'010', N'Landa de Matamoros', N'0001', N'Landa de Matamoros', N'19929', N'9501', N'10428', N'5010');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1796, 159, 22, N'22', N'011', N'El Marqués', N'0001', N'La Cañada', N'116458', N'57547', N'58911', N'27544');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1797, 159, 22, N'22', N'012', N'Pedro Escobedo', N'0001', N'Pedro Escobedo', N'63966', N'31387', N'32579', N'14435');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1798, 159, 22, N'22', N'013', N'Peñamiller', N'0001', N'Peñamiller', N'18441', N'9013', N'9428', N'4280');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1799, 159, 22, N'22', N'014', N'Querétaro', N'0001', N'Santia de Querétaro', N'801940', N'389403', N'412537', N'205925');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1800, 159, 22, N'22', N'015', N'San Joaquín', N'0001', N'San Joaquín', N'8865', N'4109', N'4756', N'1990');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1801, 159, 22, N'22', N'016', N'San Juan del Río', N'0001', N'San Juan del Río', N'241699', N'117628', N'124071', N'61732');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1802, 159, 22, N'22', N'017', N'Tequisquiapan', N'0001', N'Tequisquiapan', N'63413', N'30752', N'32661', N'15168');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1803, 159, 22, N'22', N'018', N'Tolimán', N'0001', N'Tolimán', N'26372', N'12757', N'13615', N'5941');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1804, 159, 23, N'23', N'001', N'Cozumel', N'0001', N'Cozumel', N'79535', N'40357', N'39178', N'22201');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1805, 159, 23, N'23', N'002', N'Felipe Carrillo Puerto', N'0001', N'Felipe Carrillo Puerto', N'75026', N'37994', N'37032', N'17148');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1806, 159, 23, N'23', N'003', N'Isla Mujeres', N'0001', N'Isla Mujeres', N'16203', N'8358', N'7845', N'4520');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1807, 159, 23, N'23', N'004', N'Othón P. Blanco', N'0001', N'Chetumal', N'244553', N'121906', N'122647', N'65893');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1808, 159, 23, N'23', N'005', N'Benito Juárez', N'0001', N'Cancún', N'661176', N'334945', N'326231', N'188555');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1809, 159, 23, N'23', N'006', N'José María Morelos', N'0069', N'José María Morelos', N'36179', N'18506', N'17673', N'8295');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1810, 159, 23, N'23', N'007', N'Lázaro Cárdenas', N'0001', N'Kantunilkín', N'25333', N'12972', N'12361', N'6163');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1811, 159, 23, N'23', N'008', N'Solidaridad', N'0001', N'Playa del Carmen', N'159310', N'83468', N'75842', N'48922');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1812, 159, 23, N'23', N'009', N'Tulum', N'0001', N'Tulum', N'28263', N'14714', N'13549', N'7629');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1813, 159, 23, N'23', N'010', N'Bacalar', N'0001', N'Bacalar', N'-', N'-', N'-', N'-');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1814, 159, 24, N'24', N'001', N'Ahualulco', N'0001', N'Ahualulco del Sonido 13', N'18644', N'8775', N'9869', N'4201');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1815, 159, 24, N'24', N'002', N'Alaquines', N'0001', N'Alaquines', N'8186', N'4068', N'4118', N'2089');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1816, 159, 24, N'24', N'003', N'Aquismón', N'0001', N'Aquismón', N'47423', N'23894', N'23529', N'10401');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1817, 159, 24, N'24', N'004', N'Armadillo de los Infante', N'0001', N'Armadillo de los Infante', N'4436', N'2182', N'2254', N'1168');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1818, 159, 24, N'24', N'005', N'Cárdenas', N'0001', N'Cárdenas', N'18937', N'9103', N'9834', N'4923');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1819, 159, 24, N'24', N'006', N'Catorce', N'0001', N'Real de Catorce', N'9716', N'4932', N'4784', N'2470');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1820, 159, 24, N'24', N'007', N'Cedral', N'0001', N'Cedral', N'18485', N'9048', N'9437', N'4342');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1821, 159, 24, N'24', N'008', N'Cerritos', N'0001', N'Cerritos', N'21394', N'10373', N'11021', N'5651');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1822, 159, 24, N'24', N'009', N'Cerro de San Pedro', N'0001', N'Cerro de San Pedro', N'4021', N'2031', N'1990', N'963');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1823, 159, 24, N'24', N'010', N'Ciudad del Maíz', N'0001', N'Ciudad del Maíz', N'31323', N'15523', N'15800', N'7497');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1824, 159, 24, N'24', N'011', N'Ciudad Fernández', N'0001', N'Ciudad Fernández', N'43528', N'21258', N'22270', N'10690');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1825, 159, 24, N'24', N'012', N'Tancanhuitz', N'0001', N'Tancanhuitz', N'21039', N'10406', N'10633', N'4678');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1826, 159, 24, N'24', N'013', N'Ciudad Valles', N'0001', N'Ciudad Valles', N'167713', N'81226', N'86487', N'44678');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1827, 159, 24, N'24', N'014', N'Coxcatlán', N'0001', N'Coxcatlán', N'17015', N'8544', N'8471', N'4095');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1828, 159, 24, N'24', N'015', N'Charcas', N'0001', N'Charcas', N'21138', N'10328', N'10810', N'5434');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1829, 159, 24, N'24', N'016', N'Ebano', N'0001', N'Ebano', N'41529', N'20347', N'21182', N'10760');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1830, 159, 24, N'24', N'017', N'Guadalcázar', N'0001', N'Guadalcázar', N'25985', N'13158', N'12827', N'6357');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1831, 159, 24, N'24', N'018', N'Huehuetlán', N'0001', N'Huehuetlán', N'15311', N'7554', N'7757', N'3526');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1832, 159, 24, N'24', N'019', N'Lagunillas', N'0001', N'Lagunillas', N'5774', N'2839', N'2935', N'1625');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1833, 159, 24, N'24', N'020', N'Matehuala', N'0001', N'Matehuala', N'91522', N'44343', N'47179', N'22316');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1834, 159, 24, N'24', N'021', N'Mexquitic de Carmona', N'0001', N'Mexquitic de Carmona', N'53442', N'25449', N'27993', N'11447');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1835, 159, 24, N'24', N'022', N'Moctezuma', N'0001', N'Moctezuma', N'19327', N'9298', N'10029', N'4643');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1836, 159, 24, N'24', N'023', N'Rayón', N'0001', N'Rayón', N'15707', N'7739', N'7968', N'4123');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1837, 159, 24, N'24', N'024', N'Rioverde', N'0001', N'Rioverde', N'91924', N'44574', N'47350', N'23030');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1838, 159, 24, N'24', N'025', N'Salinas', N'0001', N'Salinas de Hidal', N'30190', N'14548', N'15642', N'6806');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1839, 159, 24, N'24', N'026', N'San Antonio', N'0001', N'San Antonio', N'9390', N'4800', N'4590', N'2109');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1840, 159, 24, N'24', N'027', N'San Ciro de Acosta', N'0001', N'San Ciro de Acosta', N'10171', N'4875', N'5296', N'2771');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1841, 159, 24, N'24', N'028', N'San Luis Potosí', N'0001', N'San Luis Potosí', N'772604', N'372083', N'400521', N'199366');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1842, 159, 24, N'24', N'029', N'San Martín Chalchicuautla', N'0001', N'San Martín Chalchicuautla', N'21347', N'10686', N'10661', N'5132');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1843, 159, 24, N'24', N'030', N'San Nicolás Tolentino', N'0001', N'San Nicolás Tolentino', N'5466', N'2587', N'2879', N'1550');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1844, 159, 24, N'24', N'031', N'Santa Catarina', N'0001', N'Santa Catarina', N'11835', N'5805', N'6030', N'2431');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1845, 159, 24, N'24', N'032', N'Santa María del Río', N'0001', N'Santa María del Río', N'40326', N'19242', N'21084', N'9198');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1846, 159, 24, N'24', N'033', N'Santo Domin', N'0001', N'Santo Domin', N'12043', N'6022', N'6021', N'3060');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1847, 159, 24, N'24', N'034', N'San Vicente Tancuayalab', N'0001', N'San Vicente Tancuayalab', N'14958', N'7451', N'7507', N'3724');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1848, 159, 24, N'24', N'035', N'Soledad de Graciano Sánchez', N'0001', N'Soledad de Graciano Sánchez', N'267839', N'129814', N'138025', N'67212');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1849, 159, 24, N'24', N'036', N'Tamasopo', N'0001', N'Tamasopo', N'28848', N'14563', N'14285', N'7449');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1850, 159, 24, N'24', N'037', N'Tamazunchale', N'0001', N'Tamazunchale', N'96820', N'47951', N'48869', N'21806');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1851, 159, 24, N'24', N'038', N'Tampacán', N'0001', N'Tampacán', N'15838', N'7975', N'7863', N'3703');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1852, 159, 24, N'24', N'039', N'Tampamolón Corona', N'0001', N'Tampamolón Corona', N'14274', N'7081', N'7193', N'3247');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1853, 159, 24, N'24', N'040', N'Tamuín', N'0001', N'Tamuín', N'37956', N'18672', N'19284', N'9698');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1854, 159, 24, N'24', N'041', N'Tanlajás', N'0001', N'Tanlajás', N'19312', N'9725', N'9587', N'4455');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1855, 159, 24, N'24', N'042', N'Tanquián de Escobedo', N'0001', N'Tanquián de Escobedo', N'14382', N'7077', N'7305', N'3453');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1856, 159, 24, N'24', N'043', N'Tierra Nueva', N'0001', N'Tierra Nueva', N'9024', N'4268', N'4756', N'2130');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1857, 159, 24, N'24', N'044', N'Vanegas', N'0001', N'Vanegas', N'7902', N'3974', N'3928', N'1889');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1858, 159, 24, N'24', N'045', N'Venado', N'0001', N'Venado', N'14492', N'7149', N'7343', N'3661');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1859, 159, 24, N'24', N'046', N'Villa de Arriaga', N'0001', N'Villa de Arriaga', N'16316', N'8117', N'8199', N'3670');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1860, 159, 24, N'24', N'047', N'Villa de Guadalupe', N'0001', N'Villa de Guadalupe', N'9779', N'4920', N'4859', N'2430');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1861, 159, 24, N'24', N'048', N'Villa de la Paz', N'0001', N'Villa de la Paz', N'5350', N'2694', N'2656', N'1283');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1862, 159, 24, N'24', N'049', N'Villa de Ramos', N'0001', N'Villa de Ramos', N'37928', N'18590', N'19338', N'9090');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1863, 159, 24, N'24', N'050', N'Villa de Reyes', N'0001', N'Villa de Reyes', N'46898', N'23204', N'23694', N'9988');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1864, 159, 24, N'24', N'051', N'Villa Hidal', N'0001', N'Villa Hidal', N'14876', N'7361', N'7515', N'3765');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1865, 159, 24, N'24', N'052', N'Villa Juárez', N'0001', N'Villa Juárez', N'10174', N'4988', N'5186', N'2883');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1866, 159, 24, N'24', N'053', N'Axtla de Terrazas', N'0001', N'Axtla de Terrazas', N'33245', N'16471', N'16774', N'7656');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1867, 159, 24, N'24', N'054', N'Xilitla', N'0001', N'Xilitla', N'51498', N'25484', N'26014', N'11726');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1868, 159, 24, N'24', N'055', N'Zaraza', N'0001', N'Villa de Zaraza', N'24596', N'12105', N'12491', N'5282');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1869, 159, 24, N'24', N'056', N'Villa de Arista', N'0002', N'Villa de Arista', N'15528', N'7713', N'7815', N'3606');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1870, 159, 24, N'24', N'057', N'Matlapa', N'0001', N'Matlapa', N'30299', N'15053', N'15246', N'6638');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1871, 159, 24, N'24', N'058', N'El Naranjo', N'0001', N'El Naranjo', N'20495', N'10326', N'10169', N'5291');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1872, 159, 25, N'25', N'001', N'Ahome', N'0001', N'Los Mochis', N'416299', N'205435', N'210864', N'108911');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1873, 159, 25, N'25', N'002', N'Anstura', N'0001', N'Anstura', N'44993', N'22605', N'22388', N'11843');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1874, 159, 25, N'25', N'003', N'Badiraguato', N'0001', N'Badiraguato', N'29999', N'15524', N'14475', N'7621');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1875, 159, 25, N'25', N'004', N'Concordia', N'0001', N'Concordia', N'28493', N'14532', N'13961', N'7350');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1876, 159, 25, N'25', N'005', N'Cosalá', N'0001', N'Cosalá', N'16697', N'8542', N'8155', N'3668');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1877, 159, 25, N'25', N'006', N'Culiacán', N'0001', N'Culiacán Rosales', N'858638', N'422507', N'436131', N'220230');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1878, 159, 25, N'25', N'007', N'Choix', N'0001', N'Choix', N'32998', N'17116', N'15882', N'7878');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1879, 159, 25, N'25', N'008', N'Elota', N'0001', N'La Cruz', N'42907', N'22032', N'20875', N'10319');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1880, 159, 25, N'25', N'009', N'Escuinapa', N'0001', N'Escuinapa de Hidal', N'54131', N'27301', N'26830', N'13457');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1881, 159, 25, N'25', N'010', N'El Fuerte', N'0001', N'El Fuerte', N'97536', N'49693', N'47843', N'23907');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1882, 159, 25, N'25', N'011', N'Guasave', N'0001', N'Guasave', N'285912', N'142031', N'143881', N'70722');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1883, 159, 25, N'25', N'012', N'Mazatlán', N'0001', N'Mazatlán', N'438434', N'216266', N'222168', N'122418');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1884, 159, 25, N'25', N'013', N'Mocorito', N'0001', N'Mocorito', N'45847', N'23647', N'22200', N'11674');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1885, 159, 25, N'25', N'014', N'Rosario', N'0001', N'El Rosario', N'49380', N'25152', N'24228', N'12871');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1886, 159, 25, N'25', N'015', N'Salvador Alvarado', N'0001', N'Guamúchil', N'79085', N'38864', N'40221', N'20579');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1887, 159, 25, N'25', N'016', N'San Ignacio', N'0001', N'San Ignacio', N'22527', N'11699', N'10828', N'5868');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1888, 159, 25, N'25', N'017', N'Sinaloa', N'0001', N'Sinaloa de Leyva', N'88282', N'44862', N'43420', N'20788');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1889, 159, 25, N'25', N'018', N'Navolato', N'0001', N'Navolato', N'135603', N'68393', N'67210', N'33192');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1890, 159, 26, N'26', N'001', N'Aconchi', N'0001', N'Aconchi', N'2637', N'1405', N'1232', N'703');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1891, 159, 26, N'26', N'002', N'Agua Prieta', N'0001', N'Agua Prieta', N'79138', N'40117', N'39021', N'20434');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1892, 159, 26, N'26', N'003', N'Alamos', N'0001', N'Alamos', N'25848', N'13497', N'12351', N'6634');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1893, 159, 26, N'26', N'004', N'Altar', N'0001', N'Altar', N'9049', N'4624', N'4425', N'2267');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1894, 159, 26, N'26', N'005', N'Arivechi', N'0001', N'Arivechi', N'1253', N'650', N'603', N'369');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1895, 159, 26, N'26', N'006', N'Arizpe', N'0001', N'Arizpe', N'3037', N'1571', N'1466', N'933');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1896, 159, 26, N'26', N'007', N'Atil', N'0001', N'Atil', N'625', N'326', N'299', N'168');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1897, 159, 26, N'26', N'008', N'Bacadéhuachi', N'0001', N'Bacadéhuachi', N'1252', N'667', N'585', N'363');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1898, 159, 26, N'26', N'009', N'Bacanora', N'0001', N'Bacanora', N'784', N'417', N'367', N'254');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1899, 159, 26, N'26', N'010', N'Bacerac', N'0001', N'Bacerac', N'1467', N'761', N'706', N'412');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1900, 159, 26, N'26', N'011', N'Bacoachi', N'0001', N'Bacoachi', N'1646', N'834', N'812', N'498');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1901, 159, 26, N'26', N'012', N'Bácum', N'0001', N'Bácum', N'22821', N'11581', N'11240', N'5859');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1902, 159, 26, N'26', N'013', N'Banámichi', N'0001', N'Banámichi', N'1646', N'841', N'805', N'483');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1903, 159, 26, N'26', N'014', N'Baviácora', N'0001', N'Baviácora', N'3560', N'1833', N'1727', N'1051');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1904, 159, 26, N'26', N'015', N'Bavispe', N'0001', N'Bavispe', N'1454', N'774', N'680', N'419');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1905, 159, 26, N'26', N'016', N'Benjamín Hill', N'0001', N'Benjamín Hill', N'5275', N'2651', N'2624', N'1483');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1906, 159, 26, N'26', N'017', N'Caborca', N'0001', N'Heroica Caborca', N'81309', N'41370', N'39939', N'21440');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1907, 159, 26, N'26', N'018', N'Cajeme', N'0001', N'Ciudad Obregón', N'409310', N'202700', N'206610', N'112426');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1908, 159, 26, N'26', N'019', N'Cananea', N'0001', N'Heroica Ciudad de Cananea', N'32936', N'16415', N'16521', N'9032');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1909, 159, 26, N'26', N'020', N'Carbó', N'0001', N'Carbó', N'5347', N'2854', N'2493', N'1237');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1910, 159, 26, N'26', N'021', N'La Colorada', N'0001', N'La Colorada', N'1663', N'922', N'741', N'562');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1911, 159, 26, N'26', N'022', N'Cucurpe', N'0001', N'Cucurpe', N'958', N'532', N'426', N'308');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1912, 159, 26, N'26', N'023', N'Cumpas', N'0001', N'Cumpas', N'6362', N'3248', N'3114', N'1843');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1913, 159, 26, N'26', N'024', N'Divisaderos', N'0001', N'Divisaderos', N'813', N'421', N'392', N'230');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1914, 159, 26, N'26', N'025', N'Empalme', N'0001', N'Empalme', N'54131', N'26996', N'27135', N'14370');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1915, 159, 26, N'26', N'026', N'Etchojoa', N'0001', N'Etchojoa', N'60717', N'31131', N'29586', N'14249');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1916, 159, 26, N'26', N'027', N'Fronteras', N'0001', N'Fronteras', N'8639', N'4467', N'4172', N'2263');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1917, 159, 26, N'26', N'028', N'Granados', N'0001', N'Granados', N'1150', N'595', N'555', N'329');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1918, 159, 26, N'26', N'029', N'Guaymas', N'0001', N'Heroica Guaymas', N'149299', N'74740', N'74559', N'40588');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1919, 159, 26, N'26', N'030', N'Hermosillo', N'0001', N'Hermosillo', N'784342', N'392697', N'391645', N'213369');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1920, 159, 26, N'26', N'031', N'Huachinera', N'0001', N'Huachinera', N'1350', N'701', N'649', N'394');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1921, 159, 26, N'26', N'032', N'Huásabas', N'0001', N'Huásabas', N'962', N'513', N'449', N'286');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1922, 159, 26, N'26', N'033', N'Huatabampo', N'0001', N'Huatabampo', N'79313', N'40128', N'39185', N'19692');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1923, 159, 26, N'26', N'034', N'Huépac', N'0001', N'Huépac', N'1154', N'593', N'561', N'345');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1924, 159, 26, N'26', N'035', N'Imuris', N'0001', N'Imuris', N'12316', N'6248', N'6068', N'3203');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1925, 159, 26, N'26', N'036', N'Magdalena', N'0001', N'Magdalena de Kino', N'29707', N'14848', N'14859', N'7854');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1926, 159, 26, N'26', N'037', N'Mazatán', N'0001', N'Mazatán', N'1350', N'708', N'642', N'435');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1927, 159, 26, N'26', N'038', N'Moctezuma', N'0001', N'Moctezuma', N'4680', N'2351', N'2329', N'1351');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1928, 159, 26, N'26', N'039', N'Naco', N'0001', N'Naco', N'6401', N'3238', N'3163', N'1656');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1929, 159, 26, N'26', N'040', N'Nácori Chico', N'0001', N'Nácori Chico', N'2051', N'1080', N'971', N'597');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1930, 159, 26, N'26', N'041', N'Nacozari de García', N'0001', N'Nacozari de García', N'12751', N'6575', N'6176', N'3375');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1931, 159, 26, N'26', N'042', N'Navojoa', N'0001', N'Navojoa', N'157729', N'78242', N'79487', N'40118');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1932, 159, 26, N'26', N'043', N'Nogales', N'0001', N'Heroica Nogales', N'220292', N'111295', N'108997', N'57672');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1933, 159, 26, N'26', N'044', N'Onavas', N'0001', N'Onavas', N'399', N'214', N'185', N'111');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1934, 159, 26, N'26', N'045', N'Opodepe', N'0001', N'Opodepe', N'2878', N'1538', N'1340', N'857');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1935, 159, 26, N'26', N'046', N'Oquitoa', N'0001', N'Oquitoa', N'443', N'218', N'225', N'129');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1936, 159, 26, N'26', N'047', N'Pitiquito', N'0001', N'Pitiquito', N'9468', N'4936', N'4532', N'2574');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1937, 159, 26, N'26', N'048', N'Puerto Peñasco', N'0001', N'Puerto Peñasco', N'57342', N'29460', N'27882', N'15682');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1938, 159, 26, N'26', N'049', N'Quirie', N'0001', N'Quirie', N'3356', N'1797', N'1559', N'930');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1939, 159, 26, N'26', N'050', N'Rayón', N'0001', N'Rayón', N'1599', N'852', N'747', N'527');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1940, 159, 26, N'26', N'051', N'Rosario', N'0001', N'Rosario', N'5226', N'2737', N'2489', N'1455');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1941, 159, 26, N'26', N'052', N'Sahuaripa', N'0001', N'Sahuaripa', N'6020', N'3109', N'2911', N'1752');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1942, 159, 26, N'26', N'053', N'San Felipe de Jesús', N'0001', N'San Felipe de Jesús', N'396', N'202', N'194', N'130');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1943, 159, 26, N'26', N'054', N'San Javier', N'0001', N'San Javier', N'492', N'277', N'215', N'147');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1944, 159, 26, N'26', N'055', N'San Luis Río Colorado', N'0001', N'San Luis Río Colorado', N'178380', N'90545', N'87835', N'47863');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1945, 159, 26, N'26', N'056', N'San Miguel de Horcasitas', N'0001', N'San Miguel de Horcasitas', N'8382', N'4592', N'3790', N'1648');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1946, 159, 26, N'26', N'057', N'San Pedro de la Cueva', N'0001', N'San Pedro de la Cueva', N'1604', N'856', N'748', N'567');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1947, 159, 26, N'26', N'058', N'Santa Ana', N'0001', N'Santa Ana', N'16014', N'7961', N'8053', N'4426');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1948, 159, 26, N'26', N'059', N'Santa Cruz', N'0001', N'Santa Cruz', N'1998', N'1015', N'983', N'558');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1949, 159, 26, N'26', N'060', N'Sáric', N'0001', N'Sáric', N'2703', N'1423', N'1280', N'708');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1950, 159, 26, N'26', N'061', N'Soyopa', N'0001', N'Soyopa', N'1284', N'716', N'568', N'430');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1951, 159, 26, N'26', N'062', N'Suaqui Grande', N'0001', N'Suaqui Grande', N'1121', N'604', N'517', N'332');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1952, 159, 26, N'26', N'063', N'Tepache', N'0001', N'Tepache', N'1365', N'716', N'649', N'421');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1953, 159, 26, N'26', N'064', N'Trincheras', N'0001', N'Trincheras', N'1731', N'938', N'793', N'481');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1954, 159, 26, N'26', N'065', N'Tubutama', N'0001', N'Tubutama', N'1735', N'904', N'831', N'511');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1955, 159, 26, N'26', N'066', N'Ures', N'0001', N'Heroica Ciudad de Ures', N'9185', N'4711', N'4474', N'2741');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1956, 159, 26, N'26', N'067', N'Villa Hidal', N'0001', N'Villa Hidal', N'1738', N'893', N'845', N'537');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1957, 159, 26, N'26', N'068', N'Villa Pesqueira', N'0001', N'Villa Pesqueira (Mátape)', N'1254', N'688', N'566', N'390');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1958, 159, 26, N'26', N'069', N'Yécora', N'0001', N'Yécora', N'6046', N'3064', N'2982', N'1661');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1959, 159, 26, N'26', N'070', N'General Plutarco Elías Calles', N'0001', N'Sonoita', N'15652', N'8104', N'7548', N'4040');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1960, 159, 26, N'26', N'071', N'Benito Juárez', N'0001', N'Villa Juárez', N'22009', N'11088', N'10921', N'5643');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1961, 159, 26, N'26', N'072', N'San Ignacio Río Muerto', N'0001', N'San Ignacio Río Muerto', N'14136', N'7297', N'6839', N'3597');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1962, 159, 27, N'27', N'001', N'Balancán', N'0001', N'Balancán', N'56739', N'28318', N'28421', N'15035');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1963, 159, 27, N'27', N'002', N'Cárdenas', N'0001', N'Cárdenas', N'248481', N'122234', N'126247', N'60264');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1964, 159, 27, N'27', N'003', N'Centla', N'0001', N'Frontera', N'102110', N'50925', N'51185', N'24353');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1965, 159, 27, N'27', N'004', N'Centro', N'0001', N'Villahermosa', N'640359', N'311619', N'328740', N'173629');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1966, 159, 27, N'27', N'005', N'Comalcalco', N'0001', N'Comalcalco', N'192802', N'95084', N'97718', N'46742');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1967, 159, 27, N'27', N'006', N'Cunduacán', N'0001', N'Cunduacán', N'126416', N'62368', N'64048', N'31358');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1968, 159, 27, N'27', N'007', N'Emiliano Zapata', N'0001', N'Emiliano Zapata', N'29518', N'14174', N'15344', N'7938');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1969, 159, 27, N'27', N'008', N'Huimanguillo', N'0001', N'Huimanguillo', N'179285', N'88749', N'90536', N'42530');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1970, 159, 27, N'27', N'009', N'Jalapa', N'0001', N'Jalapa', N'36391', N'18283', N'18108', N'9308');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1971, 159, 27, N'27', N'010', N'Jalpa de Méndez', N'0001', N'Jalpa de Méndez', N'83356', N'41362', N'41994', N'19736');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1972, 159, 27, N'27', N'011', N'Jonuta', N'0001', N'Jonuta', N'29511', N'14812', N'14699', N'7534');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1973, 159, 27, N'27', N'012', N'Macuspana', N'0001', N'Macuspana', N'153132', N'75220', N'77912', N'37937');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1974, 159, 27, N'27', N'013', N'Nacajuca', N'0001', N'Nacajuca', N'115066', N'56593', N'58473', N'29255');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1975, 159, 27, N'27', N'014', N'Paraíso', N'0001', N'Paraíso', N'86620', N'42887', N'43733', N'21765');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1976, 159, 27, N'27', N'015', N'Tacotalpa', N'0001', N'Tacotalpa', N'46302', N'23006', N'23296', N'10828');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1977, 159, 27, N'27', N'016', N'Teapa', N'0001', N'Teapa', N'53555', N'26314', N'27241', N'13401');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1978, 159, 27, N'27', N'017', N'Tenosique', N'0001', N'Tenosique de Pino Suárez', N'58960', N'28810', N'30150', N'15620');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1979, 159, 28, N'28', N'001', N'Abasolo', N'0001', N'Abasolo', N'12070', N'6041', N'6029', N'3267');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1980, 159, 28, N'28', N'002', N'Aldama', N'0001', N'Aldama', N'29470', N'14857', N'14613', N'8144');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1981, 159, 28, N'28', N'003', N'Altamira', N'0001', N'Altamira', N'212001', N'105619', N'106382', N'57636');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1982, 159, 28, N'28', N'004', N'Antiguo Morelos', N'0001', N'Antiguo Morelos', N'9003', N'4494', N'4509', N'2529');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1983, 159, 28, N'28', N'005', N'Burs', N'0001', N'Burs', N'4589', N'2377', N'2212', N'1360');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1984, 159, 28, N'28', N'006', N'Bustamante', N'0001', N'Bustamante', N'7636', N'3953', N'3683', N'1734');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1985, 159, 28, N'28', N'007', N'Camar', N'0001', N'Ciudad Camar', N'14933', N'7567', N'7366', N'4405');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1986, 159, 28, N'28', N'008', N'Casas', N'0001', N'Casas', N'4423', N'2326', N'2097', N'1170');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1987, 159, 28, N'28', N'009', N'Ciudad Madero', N'0001', N'Ciudad Madero', N'197216', N'94384', N'102832', N'57701');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1988, 159, 28, N'28', N'010', N'Cruillas', N'0001', N'Cruillas', N'2011', N'1023', N'988', N'604');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1989, 159, 28, N'28', N'011', N'Gómez Farías', N'0036', N'Gómez Farías', N'8786', N'4507', N'4279', N'2470');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1990, 159, 28, N'28', N'012', N'nzález', N'0001', N'nzález', N'43435', N'21554', N'21881', N'11529');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1991, 159, 28, N'28', N'013', N'Güémez', N'0001', N'Güémez', N'15659', N'8091', N'7568', N'4217');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1992, 159, 28, N'28', N'014', N'Guerrero', N'0001', N'Nueva Ciudad Guerrero', N'4477', N'2316', N'2161', N'1472');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1993, 159, 28, N'28', N'015', N'Gustavo Díaz Ordaz', N'0001', N'Ciudad Gustavo Díaz Ordaz', N'15775', N'7979', N'7796', N'4593');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1994, 159, 28, N'28', N'016', N'Hidal', N'0001', N'Hidal', N'23793', N'12203', N'11590', N'6673');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1995, 159, 28, N'28', N'017', N'Jaumave', N'0001', N'Jaumave', N'15105', N'7605', N'7500', N'3909');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1996, 159, 28, N'28', N'018', N'Jiménez', N'0001', N'Santander Jiménez', N'8338', N'4183', N'4155', N'2273');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1997, 159, 28, N'28', N'019', N'Llera', N'0001', N'Llera de Canales', N'17333', N'8783', N'8550', N'5064');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1998, 159, 28, N'28', N'020', N'Mainero', N'0001', N'Villa Mainero', N'2579', N'1313', N'1266', N'786');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (1999, 159, 28, N'28', N'021', N'El Mante', N'0001', N'Ciudad Mante', N'115792', N'56501', N'59291', N'33152');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2000, 159, 28, N'28', N'022', N'Matamoros', N'0001', N'Heroica Matamoros', N'489193', N'242234', N'246959', N'133142');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2001, 159, 28, N'28', N'023', N'Méndez', N'0001', N'Méndez', N'4530', N'2359', N'2171', N'1311');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2002, 159, 28, N'28', N'024', N'Mier', N'0001', N'Mier', N'4762', N'2350', N'2412', N'1442');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2003, 159, 28, N'28', N'025', N'Miguel Alemán', N'0001', N'Ciudad Miguel Alemán', N'27015', N'13467', N'13548', N'7584');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2004, 159, 28, N'28', N'026', N'Miquihuana', N'0001', N'Miquihuana', N'3514', N'1850', N'1664', N'891');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2005, 159, 28, N'28', N'027', N'Nuevo Laredo', N'0001', N'Nuevo Laredo', N'384033', N'191001', N'193032', N'101872');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2006, 159, 28, N'28', N'028', N'Nuevo Morelos', N'0001', N'Nuevo Morelos', N'3381', N'1753', N'1628', N'913');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2007, 159, 28, N'28', N'029', N'Ocampo', N'0001', N'Ocampo', N'12962', N'6603', N'6359', N'3697');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2008, 159, 28, N'28', N'030', N'Padilla', N'0001', N'Nueva Villa de Padilla', N'14020', N'7100', N'6920', N'3866');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2009, 159, 28, N'28', N'031', N'Palmillas', N'0001', N'Palmillas', N'1795', N'901', N'894', N'506');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2010, 159, 28, N'28', N'032', N'Reynosa', N'0001', N'Reynosa', N'608891', N'303853', N'305038', N'170190');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2011, 159, 28, N'28', N'033', N'Río Bravo', N'0001', N'Ciudad Río Bravo', N'118259', N'59174', N'59085', N'31373');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2012, 159, 28, N'28', N'034', N'San Carlos', N'0001', N'San Carlos', N'9331', N'4897', N'4434', N'2715');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2013, 159, 28, N'28', N'035', N'San Fernando', N'0001', N'San Fernando', N'57220', N'28800', N'28420', N'15448');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2014, 159, 28, N'28', N'036', N'San Nicolás', N'0001', N'San Nicolás', N'1031', N'535', N'496', N'271');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2015, 159, 28, N'28', N'037', N'Soto la Marina', N'0001', N'Soto la Marina', N'24764', N'12664', N'12100', N'6966');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2016, 159, 28, N'28', N'038', N'Tampico', N'0001', N'Tampico', N'297554', N'142334', N'155220', N'86325');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2017, 159, 28, N'28', N'039', N'Tula', N'0001', N'Ciudad Tula', N'27572', N'13717', N'13855', N'6472');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2018, 159, 28, N'28', N'040', N'Valle Hermoso', N'0001', N'Valle Hermoso', N'63170', N'31061', N'32109', N'17400');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2019, 159, 28, N'28', N'041', N'Victoria', N'0001', N'Ciudad Victoria', N'321953', N'157152', N'164801', N'85825');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2020, 159, 28, N'28', N'042', N'Villagrán', N'0001', N'Villagrán', N'6316', N'3276', N'3040', N'1810');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2021, 159, 28, N'28', N'043', N'Xicoténcatl', N'0001', N'Xicoténcatl', N'22864', N'11444', N'11420', N'6680');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2022, 159, 29, N'29', N'001', N'Amaxac de Guerrero', N'0001', N'Amaxac de Guerrero', N'9875', N'4819', N'5056', N'2381');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2023, 159, 29, N'29', N'002', N'Apetatitlán de Antonio Carvajal', N'0001', N'Apetatitlán', N'13361', N'6424', N'6937', N'3322');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2024, 159, 29, N'29', N'003', N'Atlangatepec', N'0001', N'Atlangatepec', N'6018', N'2914', N'3104', N'1473');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2025, 159, 29, N'29', N'004', N'Atltzayanca', N'0001', N'Atlzayanca', N'15935', N'7904', N'8031', N'3593');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2026, 159, 29, N'29', N'005', N'Apizaco', N'0001', N'Ciudad de Apizaco', N'76492', N'36269', N'40223', N'19576');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2027, 159, 29, N'29', N'006', N'Calpulalpan', N'0001', N'Calpulalpan', N'44807', N'21730', N'23077', N'10836');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2028, 159, 29, N'29', N'007', N'El Carmen Tequexquitla', N'0001', N'Villa de El Carmen Tequexquitla', N'15368', N'7527', N'7841', N'3332');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2029, 159, 29, N'29', N'008', N'Cuapiaxtla', N'0001', N'Cuapiaxtla', N'13671', N'6801', N'6870', N'3171');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2030, 159, 29, N'29', N'009', N'Cuaxomulco', N'0001', N'Cuaxomulco', N'5066', N'2504', N'2562', N'1156');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2031, 159, 29, N'29', N'010', N'Chiautempan', N'0001', N'Santa Ana Chiautempan', N'66149', N'31651', N'34498', N'15913');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2032, 159, 29, N'29', N'011', N'Muñoz de Domin Arenas', N'0001', N'Muñoz', N'4285', N'2156', N'2129', N'1015');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2033, 159, 29, N'29', N'012', N'Españita', N'0001', N'Españita', N'8399', N'4151', N'4248', N'2009');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2034, 159, 29, N'29', N'013', N'Huamantla', N'0001', N'Huamantla', N'84979', N'41296', N'43683', N'18997');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2035, 159, 29, N'29', N'014', N'Hueyotlipan', N'0001', N'Hueyotlipan', N'13879', N'6839', N'7040', N'3253');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2036, 159, 29, N'29', N'015', N'Ixtacuixtla de Mariano Matamoros', N'0001', N'Villa Mariano Matamoros', N'35162', N'16917', N'18245', N'8458');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2037, 159, 29, N'29', N'016', N'Ixtenco', N'0001', N'Ixtenco', N'6791', N'3245', N'3546', N'1690');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2038, 159, 29, N'29', N'017', N'Mazatecochco de José María Morelos', N'0001', N'Mazatecochco', N'9740', N'4764', N'4976', N'2121');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2039, 159, 29, N'29', N'018', N'Contla de Juan Cuamatzi', N'0001', N'Contla', N'35084', N'17162', N'17922', N'8036');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2040, 159, 29, N'29', N'019', N'Tepetitla de Lardizábal', N'0001', N'Tepetitla', N'18725', N'8990', N'9735', N'4401');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2041, 159, 29, N'29', N'020', N'Sanctórum de Lázaro Cárdenas', N'0001', N'Sanctórum', N'8474', N'4167', N'4307', N'2005');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2042, 159, 29, N'29', N'021', N'Nanacamilpa de Mariano Arista', N'0001', N'Ciudad de Nanacamilpa', N'16640', N'8127', N'8513', N'4096');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2043, 159, 29, N'29', N'022', N'Acuamanala de Miguel Hidal', N'0001', N'Acuamanala', N'5711', N'2846', N'2865', N'1245');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2044, 159, 29, N'29', N'023', N'Natívitas', N'0001', N'Natívitas', N'23621', N'11330', N'12291', N'5283');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2045, 159, 29, N'29', N'024', N'Panotla', N'0001', N'Panotla', N'25128', N'12073', N'13055', N'6284');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2046, 159, 29, N'29', N'025', N'San Pablo del Monte', N'0001', N'Villa Vicente Guerrero', N'69615', N'34281', N'35334', N'14036');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2047, 159, 29, N'29', N'026', N'Santa Cruz Tlaxcala', N'0001', N'Santa Cruz Tlaxcala', N'17968', N'8832', N'9136', N'4314');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2048, 159, 29, N'29', N'027', N'Tenancin', N'0001', N'Tenancin', N'11763', N'5732', N'6031', N'2455');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2049, 159, 29, N'29', N'028', N'Teolocholco', N'0001', N'Teolocholco', N'21671', N'10426', N'11245', N'4738');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2050, 159, 29, N'29', N'029', N'Tepeyanco', N'0001', N'Tepeyanco', N'11048', N'5233', N'5815', N'2396');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2051, 159, 29, N'29', N'030', N'Terrenate', N'0001', N'Terrenate', N'13775', N'6838', N'6937', N'2998');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2052, 159, 29, N'29', N'031', N'Tetla de la Solidaridad', N'0001', N'Tetla', N'28760', N'14026', N'14734', N'7121');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2053, 159, 29, N'29', N'032', N'Tetlatlahuca', N'0001', N'Tetlatlahuca', N'12410', N'5980', N'6430', N'2834');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2054, 159, 29, N'29', N'033', N'Tlaxcala', N'0001', N'Tlaxcala de Xicohténcatl', N'89795', N'42529', N'47266', N'23347');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2055, 159, 29, N'29', N'034', N'Tlaxco', N'0001', N'Tlaxco', N'39939', N'19507', N'20432', N'9377');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2056, 159, 29, N'29', N'035', N'Tocatlán', N'0001', N'Tocatlán', N'5589', N'2756', N'2833', N'1196');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2057, 159, 29, N'29', N'036', N'Totolac', N'0001', N'San Juan Totolac', N'20625', N'9854', N'10771', N'5035');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2058, 159, 29, N'29', N'037', N'Ziltlaltépec de Trinidad Sánchez Santos', N'0001', N'Zitlaltépec', N'8224', N'3935', N'4289', N'1807');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2059, 159, 29, N'29', N'038', N'Tzompantepec', N'0001', N'Tzompantepec', N'14611', N'7083', N'7528', N'3657');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2060, 159, 29, N'29', N'039', N'Xaloztoc', N'0001', N'Xaloztoc', N'21769', N'10847', N'10922', N'4690');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2061, 159, 29, N'29', N'040', N'Xaltocan', N'0001', N'Xaltocan', N'9777', N'4701', N'5076', N'2460');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2062, 159, 29, N'29', N'041', N'Papalotla de Xicohténcatl', N'0001', N'Papalotla', N'26997', N'12969', N'14028', N'6231');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2063, 159, 29, N'29', N'042', N'Xicohtzinco', N'0001', N'Xicohtzinco', N'12255', N'5856', N'6399', N'2999');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2064, 159, 29, N'29', N'043', N'Yauhquemehcan', N'0001', N'San Dionisio Yauhquemehcan', N'33081', N'15941', N'17140', N'8393');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2065, 159, 29, N'29', N'044', N'Zacatelco', N'0001', N'Zacatelco', N'38654', N'18499', N'20155', N'8948');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2066, 159, 29, N'29', N'045', N'Benito Juárez', N'0001', N'Benito Juárez', N'5687', N'2757', N'2930', N'1308');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2067, 159, 29, N'29', N'046', N'Emiliano Zapata', N'0001', N'Emiliano Zapata', N'4146', N'1999', N'2147', N'939');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2068, 159, 29, N'29', N'047', N'Lázaro Cárdenas', N'0001', N'Lázaro Cárdenas', N'2769', N'1349', N'1420', N'634');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2069, 159, 29, N'29', N'048', N'La Magdalena Tlaltelulco', N'0001', N'La Magdalena Tlaltelulco', N'16834', N'8089', N'8745', N'3381');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2070, 159, 29, N'29', N'049', N'San Damián Texóloc', N'0001', N'San Damián Texóloc', N'5064', N'2508', N'2556', N'1226');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2071, 159, 29, N'29', N'050', N'San Francisco Tetlanohcan', N'0001', N'San Francisco Tetlanohcan', N'9880', N'4780', N'5100', N'2215');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2072, 159, 29, N'29', N'051', N'San Jerónimo Zacualpan', N'0001', N'San Jerónimo Zacualpan', N'3581', N'1681', N'1900', N'869');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2073, 159, 29, N'29', N'052', N'San José Teacalco', N'0001', N'San José Teacalco', N'5660', N'2744', N'2916', N'1133');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2074, 159, 29, N'29', N'053', N'San Juan Huactzinco', N'0001', N'San Juan Huactzinco', N'6821', N'3221', N'3600', N'1480');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2075, 159, 29, N'29', N'054', N'San Lorenzo Axocomanitla', N'0001', N'San Lorenzo Axocomanitla', N'5045', N'2405', N'2640', N'1165');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2076, 159, 29, N'29', N'055', N'San Lucas Tecopilco', N'0001', N'San Lucas Tecopilco', N'2833', N'1342', N'1491', N'662');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2077, 159, 29, N'29', N'056', N'Santa Ana Nopalucan', N'0001', N'Santa Ana Nopalucan', N'6857', N'3348', N'3509', N'1510');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2078, 159, 29, N'29', N'057', N'Santa Apolonia Teacalco', N'0001', N'Santa Apolonia Teacalco', N'4349', N'2034', N'2315', N'977');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2079, 159, 29, N'29', N'058', N'Santa Catarina Ayometla', N'0001', N'Santa Catarina Ayometla', N'7992', N'3840', N'4152', N'1781');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2080, 159, 29, N'29', N'059', N'Santa Cruz Quilehtla', N'0001', N'Santa Cruz Quilehtla', N'6296', N'3109', N'3187', N'1370');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2081, 159, 29, N'29', N'060', N'Santa Isabel Xiloxoxtla', N'0001', N'Santa Isabel Xiloxoxtla', N'4436', N'2138', N'2298', N'915');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2082, 159, 30, N'30', N'001', N'Acajete', N'0001', N'Acajete', N'8223', N'4203', N'4020', N'1998');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2083, 159, 30, N'30', N'002', N'Acatlán', N'0001', N'Acatlán', N'3085', N'1501', N'1584', N'710');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2084, 159, 30, N'30', N'003', N'Acayucan', N'0001', N'Acayucan', N'83817', N'40242', N'43575', N'21668');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2085, 159, 30, N'30', N'004', N'Actopan', N'0001', N'Actopan', N'40994', N'20142', N'20852', N'11966');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2086, 159, 30, N'30', N'005', N'Acula', N'0001', N'Acula', N'5129', N'2556', N'2573', N'1482');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2087, 159, 30, N'30', N'006', N'Acultzin', N'0001', N'Acultzin', N'20973', N'10254', N'10719', N'4811');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2088, 159, 30, N'30', N'007', N'Camarón de Tejeda', N'0001', N'Camarón de Tejeda', N'6224', N'3103', N'3121', N'1665');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2089, 159, 30, N'30', N'008', N'Alpatláhuac', N'0001', N'Alpatláhuac', N'9691', N'4809', N'4882', N'2031');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2090, 159, 30, N'30', N'009', N'Alto Lucero de Gutiérrez Barrios', N'0001', N'Alto Lucero', N'28017', N'14066', N'13951', N'7788');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2091, 159, 30, N'30', N'010', N'Altotonga', N'0001', N'Altotonga', N'60396', N'29014', N'31382', N'13958');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2092, 159, 30, N'30', N'011', N'Alvarado', N'0001', N'Alvarado', N'51955', N'25615', N'26340', N'15280');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2093, 159, 30, N'30', N'012', N'Amatitlán', N'0001', N'Amatitlán', N'7487', N'3650', N'3837', N'2307');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2094, 159, 30, N'30', N'013', N'Naranjos Amatlán', N'0001', N'Naranjos', N'27548', N'13076', N'14472', N'7560');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2095, 159, 30, N'30', N'014', N'Amatlán de los Reyes', N'0001', N'Amatlán de los Reyes', N'42268', N'20591', N'21677', N'10636');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2096, 159, 30, N'30', N'015', N'Angel R. Cabada', N'0001', N'Angel R. Cabada', N'33528', N'16270', N'17258', N'9492');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2097, 159, 30, N'30', N'016', N'La Antigua', N'0001', N'José Cardel', N'25500', N'12286', N'13214', N'7273');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2098, 159, 30, N'30', N'017', N'Apazapan', N'0001', N'Apazapan', N'4027', N'1996', N'2031', N'1138');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2099, 159, 30, N'30', N'018', N'Aquila', N'0001', N'Aquila', N'1797', N'866', N'931', N'418');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2100, 159, 30, N'30', N'019', N'Astacinga', N'0001', N'Astacinga', N'5995', N'2781', N'3214', N'1296');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2101, 159, 30, N'30', N'020', N'Atlahuilco', N'0001', N'Atlahuilco', N'9824', N'4711', N'5113', N'2188');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2102, 159, 30, N'30', N'021', N'Atoyac', N'0001', N'Atoyac', N'22986', N'11078', N'11908', N'6216');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2103, 159, 30, N'30', N'022', N'Atzacan', N'0001', N'Atzacan', N'20063', N'9865', N'10198', N'4525');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2104, 159, 30, N'30', N'023', N'Atzalan', N'0001', N'Atzalan', N'48397', N'24140', N'24257', N'11777');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2105, 159, 30, N'30', N'024', N'Tlaltetela', N'0001', N'Tlaltetela', N'14613', N'7315', N'7298', N'3296');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2106, 159, 30, N'30', N'025', N'Ayahualulco', N'0001', N'Ayahualulco', N'25456', N'12693', N'12763', N'5016');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2107, 159, 30, N'30', N'026', N'Banderilla', N'0001', N'Banderilla', N'21546', N'10158', N'11388', N'5691');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2108, 159, 30, N'30', N'027', N'Benito Juárez', N'0001', N'Benito Juárez', N'16692', N'8142', N'8550', N'3600');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2109, 159, 30, N'30', N'028', N'Boca del Río', N'0001', N'Boca del Río', N'138058', N'64656', N'73402', N'39869');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2110, 159, 30, N'30', N'029', N'Calcahualco', N'0001', N'Calcahualco', N'12929', N'6433', N'6496', N'2437');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2111, 159, 30, N'30', N'030', N'Camerino Z. Mendoza', N'0001', N'Ciudad Mendoza', N'41778', N'19778', N'22000', N'10556');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2112, 159, 30, N'30', N'031', N'Carrillo Puerto', N'0001', N'Tamarindo', N'16313', N'7940', N'8373', N'3905');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2113, 159, 30, N'30', N'032', N'Catemaco', N'0001', N'Catemaco', N'48593', N'23457', N'25136', N'11954');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2114, 159, 30, N'30', N'033', N'Cazones de Herrera', N'0001', N'Cazones de Herrera', N'23483', N'11378', N'12105', N'5996');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2115, 159, 30, N'30', N'034', N'Cerro Azul', N'0001', N'Cerro Azul', N'25801', N'12260', N'13541', N'7233');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2116, 159, 30, N'30', N'035', N'Citlaltépetl', N'0001', N'Citlaltépec', N'11081', N'5418', N'5663', N'2786');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2117, 159, 30, N'30', N'036', N'Coacoatzintla', N'0001', N'Coacoatzintla', N'9416', N'4578', N'4838', N'2243');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2118, 159, 30, N'30', N'037', N'Coahuitlán', N'0001', N'Progreso de Zaraza', N'7810', N'3861', N'3949', N'1587');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2119, 159, 30, N'30', N'038', N'Coatepec', N'0001', N'Coatepec', N'86696', N'41788', N'44908', N'22870');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2120, 159, 30, N'30', N'039', N'Coatzacoalcos', N'0001', N'Coatzacoalcos', N'305260', N'147962', N'157298', N'87535');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2121, 159, 30, N'30', N'040', N'Coatzintla', N'0001', N'Coatzintla', N'48351', N'23449', N'24902', N'12437');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2122, 159, 30, N'30', N'041', N'Coetzala', N'0001', N'Coetzala', N'2144', N'1053', N'1091', N'506');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2123, 159, 30, N'30', N'042', N'Colipa', N'0001', N'Colipa', N'5728', N'2804', N'2924', N'1628');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2124, 159, 30, N'30', N'043', N'Comapa', N'0001', N'Comapa', N'18713', N'9527', N'9186', N'4382');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2125, 159, 30, N'30', N'044', N'Córdoba', N'0001', N'Córdoba', N'196541', N'91805', N'104736', N'53233');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2126, 159, 30, N'30', N'045', N'Cosamaloapan de Carpio', N'0001', N'Cosamaloapan', N'57366', N'27634', N'29732', N'16970');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2127, 159, 30, N'30', N'046', N'Cosautlán de Carvajal', N'0001', N'Cosautlán de Carvajal', N'15668', N'7756', N'7912', N'3724');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2128, 159, 30, N'30', N'047', N'Coscomatepec', N'0001', N'Coscomatepec de Bravo', N'52510', N'25561', N'26949', N'11163');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2129, 159, 30, N'30', N'048', N'Cosoleacaque', N'0001', N'Cosoleacaque', N'117725', N'56945', N'60780', N'31771');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2130, 159, 30, N'30', N'049', N'Cotaxtla', N'0001', N'Cotaxtla', N'19710', N'9770', N'9940', N'5232');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2131, 159, 30, N'30', N'050', N'Coxquihui', N'0001', N'Coxquihui', N'15492', N'7571', N'7921', N'3488');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2132, 159, 30, N'30', N'051', N'Coyutla', N'0001', N'Coyutla', N'21822', N'10516', N'11306', N'5215');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2133, 159, 30, N'30', N'052', N'Cuichapa', N'0001', N'Cuichapa', N'11645', N'5527', N'6118', N'2955');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2134, 159, 30, N'30', N'053', N'Cuitláhuac', N'0001', N'Cuitláhuac', N'26265', N'12469', N'13796', N'6826');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2135, 159, 30, N'30', N'054', N'Chacaltianguis', N'0001', N'Chacaltianguis', N'11683', N'5686', N'5997', N'3511');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2136, 159, 30, N'30', N'055', N'Chalma', N'0001', N'Chalma', N'12626', N'6221', N'6405', N'3091');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2137, 159, 30, N'30', N'056', N'Chiconamel', N'0001', N'Chiconamel', N'6752', N'3276', N'3476', N'1528');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2138, 159, 30, N'30', N'057', N'Chiconquiaco', N'0001', N'Chiconquiaco', N'13190', N'6529', N'6661', N'2844');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2139, 159, 30, N'30', N'058', N'Chicontepec', N'0001', N'Chicontepec de Tejeda', N'54982', N'26729', N'28253', N'13367');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2140, 159, 30, N'30', N'059', N'Chinameca', N'0001', N'Chinameca', N'15214', N'7404', N'7810', N'4277');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2141, 159, 30, N'30', N'060', N'Chinampa de rostiza', N'0001', N'Chinampa de rostiza', N'15286', N'7477', N'7809', N'3725');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2142, 159, 30, N'30', N'061', N'Las Choapas', N'0001', N'Las Choapas', N'77426', N'38042', N'39384', N'18829');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2143, 159, 30, N'30', N'062', N'Chocamán', N'0001', N'Chocamán', N'18601', N'9173', N'9428', N'4260');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2144, 159, 30, N'30', N'063', N'Chontla', N'0001', N'Chontla', N'14688', N'7349', N'7339', N'3623');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2145, 159, 30, N'30', N'064', N'Chumatlán', N'0001', N'Chumatlán', N'3889', N'1899', N'1990', N'915');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2146, 159, 30, N'30', N'065', N'Emiliano Zapata', N'0001', N'Dos Ríos', N'61718', N'30300', N'31418', N'16990');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2147, 159, 30, N'30', N'066', N'Espinal', N'0001', N'Espinal', N'25548', N'12407', N'13141', N'6256');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2148, 159, 30, N'30', N'067', N'Filomeno Mata', N'0001', N'Filomeno Mata', N'16418', N'8180', N'8238', N'2726');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2149, 159, 30, N'30', N'068', N'Fortín', N'0001', N'Fortín de las Flores', N'59761', N'28261', N'31500', N'16147');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2150, 159, 30, N'30', N'069', N'Gutiérrez Zamora', N'0001', N'Gutiérrez Zamora', N'24353', N'11436', N'12917', N'6915');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2151, 159, 30, N'30', N'070', N'Hidaltitlán', N'0001', N'Hidaltitlán', N'18277', N'9220', N'9057', N'4466');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2152, 159, 30, N'30', N'071', N'Huatusco', N'0001', N'Huatusco de Chicuellar', N'54561', N'26216', N'28345', N'12848');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2153, 159, 30, N'30', N'072', N'Huayacocotla', N'0001', N'Huayacocotla', N'20765', N'10014', N'10751', N'5238');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2154, 159, 30, N'30', N'073', N'Hueyapan de Ocampo', N'0001', N'Hueyapan de Ocampo', N'41649', N'20276', N'21373', N'11073');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2155, 159, 30, N'30', N'074', N'Huiloapan de Cuauhtémoc', N'0001', N'Huiloapan de Cuauhtémoc', N'6750', N'3253', N'3497', N'1745');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2156, 159, 30, N'30', N'075', N'Ignacio de la Llave', N'0001', N'Ignacio de la Llave', N'17121', N'8293', N'8828', N'5243');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2157, 159, 30, N'30', N'076', N'Ilamatlán', N'0001', N'Ilamatlán', N'13575', N'6423', N'7152', N'3332');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2158, 159, 30, N'30', N'077', N'Isla', N'0001', N'Isla', N'42205', N'20520', N'21685', N'11355');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2159, 159, 30, N'30', N'078', N'Ixcatepec', N'0001', N'Ixcatepec', N'12713', N'6340', N'6373', N'3094');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2160, 159, 30, N'30', N'079', N'Ixhuacán de los Reyes', N'0001', N'Ixhuacán de los Reyes', N'10724', N'5400', N'5324', N'2554');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2161, 159, 30, N'30', N'080', N'Ixhuatlán del Café', N'0001', N'Ixhuatlán del Café', N'21407', N'10541', N'10866', N'4804');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2162, 159, 30, N'30', N'081', N'Ixhuatlancillo', N'0001', N'Ixhuatlancillo', N'21150', N'10121', N'11029', N'5545');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2163, 159, 30, N'30', N'082', N'Ixhuatlán del Sureste', N'0001', N'Ixhuatlán del Sureste', N'14903', N'7361', N'7542', N'3961');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2164, 159, 30, N'30', N'083', N'Ixhuatlán de Madero', N'0001', N'Ixhuatlán de Madero', N'49820', N'24351', N'25469', N'11766');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2165, 159, 30, N'30', N'084', N'Ixmatlahuacan', N'0001', N'Ixmatlahuacan', N'5727', N'2856', N'2871', N'1698');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2166, 159, 30, N'30', N'085', N'Ixtaczoquitlán', N'0001', N'Ixtaczoquitlán', N'65385', N'31521', N'33864', N'16692');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2167, 159, 30, N'30', N'086', N'Jalacin', N'0001', N'Jalacin', N'40747', N'19969', N'20778', N'9007');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2168, 159, 30, N'30', N'087', N'Xalapa', N'0001', N'Xalapa-Enríquez', N'457928', N'213571', N'244357', N'129211');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2169, 159, 30, N'30', N'088', N'Jalcomulco', N'0001', N'Jalcomulco', N'4940', N'2480', N'2460', N'1397');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2170, 159, 30, N'30', N'089', N'Jáltipan', N'0001', N'Jáltipan de Morelos', N'39673', N'18929', N'20744', N'11173');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2171, 159, 30, N'30', N'090', N'Jamapa', N'0001', N'Jamapa', N'10376', N'5085', N'5291', N'3024');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2172, 159, 30, N'30', N'091', N'Jesús Carranza', N'0001', N'Jesús Carranza', N'27080', N'13394', N'13686', N'6658');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2173, 159, 30, N'30', N'092', N'Xico', N'0001', N'Xico', N'35188', N'17276', N'17912', N'8279');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2174, 159, 30, N'30', N'093', N'Jilotepec', N'0001', N'Jilotepec', N'15313', N'7401', N'7912', N'3737');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2175, 159, 30, N'30', N'094', N'Juan Rodríguez Clara', N'0001', N'Juan Rodríguez Clara', N'37193', N'18326', N'18867', N'9919');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2176, 159, 30, N'30', N'095', N'Juchique de Ferrer', N'0001', N'Juchique de Ferrer', N'16387', N'8067', N'8320', N'4444');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2177, 159, 30, N'30', N'096', N'Landero y Coss', N'0001', N'Landero y Coss', N'1546', N'746', N'800', N'403');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2178, 159, 30, N'30', N'097', N'Lerdo de Tejada', N'0001', N'Lerdo de Tejada', N'20141', N'9468', N'10673', N'6094');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2179, 159, 30, N'30', N'098', N'Magdalena', N'0001', N'Magdalena', N'2920', N'1443', N'1477', N'672');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2180, 159, 30, N'30', N'099', N'Maltrata', N'0001', N'Maltrata', N'16898', N'8098', N'8800', N'3805');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2181, 159, 30, N'30', N'100', N'Manlio Fabio Altamirano', N'0001', N'Manlio Fabio Altamirano', N'22585', N'11171', N'11414', N'6454');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2182, 159, 30, N'30', N'101', N'Mariano Escobedo', N'0001', N'Mariano Escobedo', N'33941', N'16253', N'17688', N'8034');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2183, 159, 30, N'30', N'102', N'Martínez de la Torre', N'0001', N'Martínez de la Torre', N'101358', N'48561', N'52797', N'27732');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2184, 159, 30, N'30', N'103', N'Mecatlán', N'0001', N'Mecatlán', N'11808', N'5787', N'6021', N'2639');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2185, 159, 30, N'30', N'104', N'Mecayapan', N'0001', N'Mecayapan', N'17333', N'8501', N'8832', N'4048');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2186, 159, 30, N'30', N'105', N'Medellín', N'0001', N'Medellín', N'59126', N'28431', N'30695', N'18198');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2187, 159, 30, N'30', N'106', N'Miahuatlán', N'0001', N'Miahuatlán', N'4429', N'2154', N'2275', N'1009');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2188, 159, 30, N'30', N'107', N'Las Minas', N'0001', N'Las Minas', N'2897', N'1468', N'1429', N'614');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2189, 159, 30, N'30', N'108', N'Minatitlán', N'0001', N'Minatitlán', N'157840', N'76222', N'81618', N'43395');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2190, 159, 30, N'30', N'109', N'Misantla', N'0001', N'Misantla', N'62919', N'30771', N'32148', N'16509');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2191, 159, 30, N'30', N'110', N'Mixtla de Altamirano', N'0001', N'Mixtla de Altamirano', N'10387', N'5221', N'5166', N'2378');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2192, 159, 30, N'30', N'111', N'Moloacán', N'0001', N'Moloacán', N'16120', N'7851', N'8269', N'4262');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2193, 159, 30, N'30', N'112', N'Naolinco', N'0001', N'Naolinco de Victoria', N'20255', N'9861', N'10394', N'5185');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2194, 159, 30, N'30', N'113', N'Naranjal', N'0001', N'Naranjal', N'4507', N'2163', N'2344', N'1051');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2195, 159, 30, N'30', N'114', N'Nautla', N'0001', N'Nautla', N'9974', N'4873', N'5101', N'2940');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2196, 159, 30, N'30', N'115', N'Nogales', N'0001', N'Nogales', N'34688', N'16604', N'18084', N'8905');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2197, 159, 30, N'30', N'116', N'Oluta', N'0001', N'Oluta', N'14784', N'7097', N'7687', N'3885');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2198, 159, 30, N'30', N'117', N'Omealca', N'0001', N'Omealca', N'22561', N'10850', N'11711', N'5712');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2199, 159, 30, N'30', N'118', N'Orizaba', N'0001', N'Orizaba', N'120995', N'55845', N'65150', N'34029');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2200, 159, 30, N'30', N'119', N'Otatitlán', N'0001', N'Otatitlán', N'5250', N'2511', N'2739', N'1570');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2201, 159, 30, N'30', N'120', N'Oteapan', N'0001', N'Oteapan', N'14965', N'7289', N'7676', N'3888');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2202, 159, 30, N'30', N'121', N'Ozuluama de Mascareñas', N'0001', N'Ozuluama de Mascareñas', N'23276', N'11937', N'11339', N'6342');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2203, 159, 30, N'30', N'122', N'Pajapan', N'0001', N'Pajapan', N'15909', N'7923', N'7986', N'4137');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2204, 159, 30, N'30', N'123', N'Pánuco', N'0001', N'Pánuco', N'97290', N'48357', N'48933', N'25847');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2205, 159, 30, N'30', N'124', N'Papantla', N'0001', N'Papantla de Olarte', N'158599', N'77291', N'81308', N'39603');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2206, 159, 30, N'30', N'125', N'Paso del Macho', N'0001', N'Paso del Macho', N'29165', N'14390', N'14775', N'7330');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2207, 159, 30, N'30', N'126', N'Paso de Ovejas', N'0001', N'Paso de Ovejas', N'32576', N'16252', N'16324', N'9243');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2208, 159, 30, N'30', N'127', N'La Perla', N'0001', N'La Perla', N'23648', N'11498', N'12150', N'4624');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2209, 159, 30, N'30', N'128', N'Perote', N'0001', N'Perote', N'68982', N'34642', N'34340', N'15598');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2210, 159, 30, N'30', N'129', N'Platón Sánchez', N'0001', N'Platón Sánchez', N'17888', N'8780', N'9108', N'4427');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2211, 159, 30, N'30', N'130', N'Playa Vicente', N'0001', N'Playa Vicente', N'40984', N'19660', N'21324', N'10584');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2212, 159, 30, N'30', N'131', N'Poza Rica de Hidal', N'0001', N'Poza Rica de Hidal', N'193311', N'91390', N'101921', N'52155');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2213, 159, 30, N'30', N'132', N'Las Vigas de Ramírez', N'0001', N'Las Vigas de Ramírez', N'17958', N'8889', N'9069', N'4154');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2214, 159, 30, N'30', N'133', N'Pueblo Viejo', N'0001', N'Cd. Cuauhtémoc', N'55358', N'27668', N'27690', N'14653');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2215, 159, 30, N'30', N'134', N'Puente Nacional', N'0001', N'Puente Nacional', N'21603', N'10628', N'10975', N'6189');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2216, 159, 30, N'30', N'135', N'Rafael Delgado', N'0001', N'Rafael Delgado', N'20245', N'9978', N'10267', N'4444');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2217, 159, 30, N'30', N'136', N'Rafael Lucio', N'0001', N'Rafael Lucio', N'7023', N'3405', N'3618', N'1639');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2218, 159, 30, N'30', N'137', N'Los Reyes', N'0001', N'Los Reyes', N'5484', N'2696', N'2788', N'1264');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2219, 159, 30, N'30', N'138', N'Río Blanco', N'0001', N'Río Blanco', N'40634', N'19042', N'21592', N'11122');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2220, 159, 30, N'30', N'139', N'Saltabarranca', N'0001', N'Saltabarranca', N'5908', N'2864', N'3044', N'1733');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2221, 159, 30, N'30', N'140', N'San Andrés Tenejapan', N'0001', N'San Andrés Tenejapan', N'2715', N'1311', N'1404', N'538');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2222, 159, 30, N'30', N'141', N'San Andrés Tuxtla', N'0001', N'San Andrés Tuxtla', N'157364', N'75604', N'81760', N'38415');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2223, 159, 30, N'30', N'142', N'San Juan Evangelista', N'0001', N'San Juan Evangelista', N'33435', N'16442', N'16993', N'8417');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2224, 159, 30, N'30', N'143', N'Santia Tuxtla', N'0001', N'Santia Tuxtla', N'56427', N'27099', N'29328', N'14323');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2225, 159, 30, N'30', N'144', N'Sayula de Alemán', N'0001', N'Sayula de Alemán', N'31974', N'15604', N'16370', N'7775');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2226, 159, 30, N'30', N'145', N'Soconusco', N'0001', N'Soconusco', N'14395', N'6994', N'7401', N'3767');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2227, 159, 30, N'30', N'146', N'Sochiapa', N'0001', N'Sochiapa', N'3502', N'1749', N'1753', N'748');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2228, 159, 30, N'30', N'147', N'Soledad Atzompa', N'0001', N'Soledad Atzompa', N'21380', N'10496', N'10884', N'4296');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2229, 159, 30, N'30', N'148', N'Soledad de Doblado', N'0001', N'Soledad de Doblado', N'27008', N'13339', N'13669', N'7248');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2230, 159, 30, N'30', N'149', N'Soteapan', N'0001', N'Soteapan', N'32596', N'15964', N'16632', N'7889');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2231, 159, 30, N'30', N'150', N'Tamalín', N'0001', N'Tamalín', N'11211', N'5599', N'5612', N'2910');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2232, 159, 30, N'30', N'151', N'Tamiahua', N'0001', N'Tamiahua', N'23588', N'11841', N'11747', N'6592');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2233, 159, 30, N'30', N'152', N'Tampico Alto', N'0001', N'Tampico Alto', N'12242', N'6329', N'5913', N'3511');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2234, 159, 30, N'30', N'153', N'Tancoco', N'0001', N'Tancoco', N'5873', N'2867', N'3006', N'1602');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2235, 159, 30, N'30', N'154', N'Tantima', N'0001', N'Tantima', N'12814', N'6483', N'6331', N'3351');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2236, 159, 30, N'30', N'155', N'Tantoyuca', N'0001', N'Tantoyuca', N'101743', N'50432', N'51311', N'23695');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2237, 159, 30, N'30', N'156', N'Tatatila', N'0001', N'Tatatila', N'5584', N'2903', N'2681', N'1195');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2238, 159, 30, N'30', N'157', N'Castillo de Teayo', N'0001', N'Castillo de Teayo', N'18663', N'9334', N'9329', N'4597');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2239, 159, 30, N'30', N'158', N'Tecolutla', N'0001', N'Tecolutla', N'25126', N'12351', N'12775', N'6865');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2240, 159, 30, N'30', N'159', N'Tehuipan', N'0001', N'Tehuipan', N'23479', N'11298', N'12181', N'4343');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2241, 159, 30, N'30', N'160', N'Álamo Temapache', N'0001', N'Álamo', N'104499', N'51618', N'52881', N'25771');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2242, 159, 30, N'30', N'161', N'Tempoal', N'0001', N'Tempoal de Sánchez', N'34956', N'17311', N'17645', N'8822');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2243, 159, 30, N'30', N'162', N'Tenampa', N'0001', N'Tenampa', N'6247', N'3053', N'3194', N'1428');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2244, 159, 30, N'30', N'163', N'Tenochtitlán', N'0001', N'Tenochtitlán', N'5222', N'2486', N'2736', N'1192');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2245, 159, 30, N'30', N'164', N'Teocelo', N'0001', N'Teocelo', N'16327', N'7982', N'8345', N'4218');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2246, 159, 30, N'30', N'165', N'Tepatlaxco', N'0001', N'Tepatlaxco', N'8249', N'4207', N'4042', N'1905');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2247, 159, 30, N'30', N'166', N'Tepetlán', N'0001', N'Tepetlán', N'9004', N'4545', N'4459', N'2368');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2248, 159, 30, N'30', N'167', N'Tepetzintla', N'0001', N'Tepetzintla', N'13949', N'6918', N'7031', N'3460');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2249, 159, 30, N'30', N'168', N'Tequila', N'0001', N'Tequila', N'14648', N'7202', N'7446', N'3343');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2250, 159, 30, N'30', N'169', N'José Azueta', N'0001', N'Villa Azueta', N'23999', N'11727', N'12272', N'6737');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2251, 159, 30, N'30', N'170', N'Texcatepec', N'0001', N'Texcatepec', N'10627', N'5149', N'5478', N'2358');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2252, 159, 30, N'30', N'171', N'Texhuacán', N'0001', N'Texhuacán', N'5292', N'2492', N'2800', N'1164');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2253, 159, 30, N'30', N'172', N'Texistepec', N'0001', N'Texistepec', N'20199', N'10063', N'10136', N'5109');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2254, 159, 30, N'30', N'173', N'Tezonapa', N'0001', N'Tezonapa', N'52584', N'25931', N'26653', N'13071');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2255, 159, 30, N'30', N'174', N'Tierra Blanca', N'0001', N'Tierra Blanca', N'94087', N'45203', N'48884', N'26702');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2256, 159, 30, N'30', N'175', N'Tihuatlán', N'0001', N'Tihuatlán', N'89774', N'43978', N'45796', N'22355');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2257, 159, 30, N'30', N'176', N'Tlacojalpan', N'0001', N'Tlacojalpan', N'4632', N'2285', N'2347', N'1354');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2258, 159, 30, N'30', N'177', N'Tlacolulan', N'0001', N'Tlacolulan', N'10299', N'5189', N'5110', N'2222');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2259, 159, 30, N'30', N'178', N'Tlacotalpan', N'0001', N'Tlacotalpan', N'13284', N'6415', N'6869', N'4018');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2260, 159, 30, N'30', N'179', N'Tlacotepec de Mejía', N'0001', N'Tlacotepec de Mejía', N'3965', N'1944', N'2021', N'1030');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2261, 159, 30, N'30', N'180', N'Tlachichilco', N'0001', N'Tlachichilco', N'11276', N'5563', N'5713', N'2607');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2262, 159, 30, N'30', N'181', N'Tlalixcoyan', N'0001', N'Tlalixcoyan', N'37037', N'18181', N'18856', N'10919');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2263, 159, 30, N'30', N'182', N'Tlalnelhuayocan', N'0001', N'Tlalnelhuayocan', N'16311', N'7940', N'8371', N'3737');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2264, 159, 30, N'30', N'183', N'Tlapacoyan', N'0001', N'Tlapacoyan', N'58084', N'28079', N'30005', N'15116');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2265, 159, 30, N'30', N'184', N'Tlaquilpa', N'0001', N'Tlaquilpa', N'7151', N'3333', N'3818', N'1473');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2266, 159, 30, N'30', N'185', N'Tlilapan', N'0001', N'Tlilapan', N'4879', N'2358', N'2521', N'1121');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2267, 159, 30, N'30', N'186', N'Tomatlán', N'0001', N'Tomatlán', N'6763', N'3330', N'3433', N'1751');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2268, 159, 30, N'30', N'187', N'Tonayán', N'0001', N'Tonayán', N'5696', N'2752', N'2944', N'1166');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2269, 159, 30, N'30', N'188', N'Totutla', N'0001', N'Totutla', N'16403', N'8176', N'8227', N'3822');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2270, 159, 30, N'30', N'189', N'Tuxpan', N'0001', N'Túxpam de Rodríguez Cano', N'143362', N'69764', N'73598', N'38671');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2271, 159, 30, N'30', N'190', N'Tuxtilla', N'0001', N'Tuxtilla', N'2177', N'1078', N'1099', N'715');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2272, 159, 30, N'30', N'191', N'Ursulo Galván', N'0001', N'Ursulo Galván', N'29005', N'14077', N'14928', N'8859');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2273, 159, 30, N'30', N'192', N'Vega de Alatorre', N'0001', N'Vega de Alatorre', N'19541', N'9477', N'10064', N'5732');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2274, 159, 30, N'30', N'193', N'Veracruz', N'0001', N'Veracruz', N'552156', N'261537', N'290619', N'164690');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2275, 159, 30, N'30', N'194', N'Villa Aldama', N'0001', N'Villa Aldama', N'10851', N'5333', N'5518', N'2446');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2276, 159, 30, N'30', N'195', N'Xoxocotla', N'0001', N'Xoxocotla', N'5163', N'2611', N'2552', N'1137');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2277, 159, 30, N'30', N'196', N'Yanga', N'0001', N'Yanga', N'17462', N'8204', N'9258', N'4867');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2278, 159, 30, N'30', N'197', N'Yecuatla', N'0001', N'Yecuatla', N'11357', N'5580', N'5777', N'2977');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2279, 159, 30, N'30', N'198', N'Zacualpan', N'0001', N'Zacualpan', N'6784', N'3262', N'3522', N'1822');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2280, 159, 30, N'30', N'199', N'Zaraza', N'0001', N'Zaraza', N'10720', N'5190', N'5530', N'2393');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2281, 159, 30, N'30', N'200', N'Zentla', N'0001', N'Colonia Manuel nzález', N'12379', N'6205', N'6174', N'3008');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2282, 159, 30, N'30', N'201', N'Zonlica', N'0001', N'Zonlica', N'41923', N'20699', N'21224', N'10076');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2283, 159, 30, N'30', N'202', N'Zontecomatlán de López y Fuentes', N'0001', N'Zontecomatlán de López y Fuentes', N'13866', N'6868', N'6998', N'3158');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2284, 159, 30, N'30', N'203', N'Zozocolco de Hidal', N'0001', N'Zozocolco de Hidal', N'13434', N'6599', N'6835', N'2920');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2285, 159, 30, N'30', N'204', N'Agua Dulce', N'0001', N'Agua Dulce', N'46010', N'22329', N'23681', N'12471');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2286, 159, 30, N'30', N'205', N'El Hi', N'0001', N'El Hi', N'19128', N'9512', N'9616', N'4924');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2287, 159, 30, N'30', N'206', N'Nanchital de Lázaro Cárdenas del Río', N'0001', N'Nanchital de Lázaro Cárdenas del Río', N'27094', N'12978', N'14116', N'7497');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2288, 159, 30, N'30', N'207', N'Tres Valles', N'0001', N'Tres Valles', N'45095', N'21938', N'23157', N'12622');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2289, 159, 30, N'30', N'208', N'Carlos A. Carrillo', N'0001', N'Carlos A. Carrillo', N'22907', N'10921', N'11986', N'6799');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2290, 159, 30, N'30', N'209', N'Tatahuicapan de Juárez', N'0001', N'Tatahuicapan', N'14297', N'7061', N'7236', N'3385');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2291, 159, 30, N'30', N'210', N'Uxpanapa', N'0001', N'Poblado 10', N'27346', N'13681', N'13665', N'5933');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2292, 159, 30, N'30', N'211', N'San Rafael', N'0001', N'San Rafael', N'29277', N'14219', N'15058', N'8047');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2293, 159, 30, N'30', N'212', N'Santia Sochiapan', N'0001', N'Xochiapa', N'12409', N'5986', N'6423', N'2970');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2294, 159, 31, N'31', N'001', N'Abalá', N'0001', N'Abalá', N'6356', N'3254', N'3102', N'1608');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2295, 159, 31, N'31', N'002', N'Acanceh', N'0001', N'Acanceh', N'15337', N'7599', N'7738', N'3695');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2296, 159, 31, N'31', N'003', N'Akil', N'0001', N'Akil', N'10362', N'5104', N'5258', N'2535');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2297, 159, 31, N'31', N'004', N'Baca', N'0001', N'Baca', N'5701', N'2819', N'2882', N'1558');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2298, 159, 31, N'31', N'005', N'Bokobá', N'0001', N'Bokobá', N'2053', N'1053', N'1000', N'579');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2299, 159, 31, N'31', N'006', N'Buctzotz', N'0001', N'Buctzotz', N'8637', N'4336', N'4301', N'2368');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2300, 159, 31, N'31', N'007', N'Cacalchén', N'0001', N'Cacalchén', N'6811', N'3483', N'3328', N'1780');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2301, 159, 31, N'31', N'008', N'Calotmul', N'0001', N'Calotmul', N'4095', N'2080', N'2015', N'1088');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2302, 159, 31, N'31', N'009', N'Cansahcab', N'0001', N'Cansahcab', N'4696', N'2327', N'2369', N'1285');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2303, 159, 31, N'31', N'010', N'Cantamayec', N'0001', N'Cantamayec', N'2407', N'1255', N'1152', N'531');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2304, 159, 31, N'31', N'011', N'Celestún', N'0001', N'Celestún', N'6831', N'3493', N'3338', N'1821');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2305, 159, 31, N'31', N'012', N'Cenotillo', N'0001', N'Cenotillo', N'3701', N'1765', N'1936', N'1109');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2306, 159, 31, N'31', N'013', N'Conkal', N'0001', N'Conkal', N'9143', N'4584', N'4559', N'2392');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2307, 159, 31, N'31', N'014', N'Cuncunul', N'0001', N'Cuncunul', N'1595', N'815', N'780', N'343');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2308, 159, 31, N'31', N'015', N'Cuzamá', N'0001', N'Cuzamá', N'4966', N'2493', N'2473', N'1246');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2309, 159, 31, N'31', N'016', N'Chacsinkín', N'0001', N'Chacsinkín', N'2818', N'1417', N'1401', N'631');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2310, 159, 31, N'31', N'017', N'Chankom', N'0001', N'Chankom', N'4464', N'2276', N'2188', N'1042');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2311, 159, 31, N'31', N'018', N'Chapab', N'0001', N'Chapab', N'3035', N'1509', N'1526', N'777');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2312, 159, 31, N'31', N'019', N'Chemax', N'0001', N'Chemax', N'33490', N'16797', N'16693', N'7115');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2313, 159, 31, N'31', N'020', N'Chicxulub Pueblo', N'0001', N'Chicxulub Pueblo', N'4113', N'2123', N'1990', N'1071');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2314, 159, 31, N'31', N'021', N'Chichimilá', N'0001', N'Chichimilá', N'7952', N'3982', N'3970', N'1651');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2315, 159, 31, N'31', N'022', N'Chikindzonot', N'0001', N'Chikindzonot', N'4162', N'2103', N'2059', N'878');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2316, 159, 31, N'31', N'023', N'Chocholá', N'0001', N'Chocholá', N'4530', N'2318', N'2212', N'1236');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2317, 159, 31, N'31', N'024', N'Chumayel', N'0001', N'Chumayel', N'3148', N'1552', N'1596', N'743');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2318, 159, 31, N'31', N'025', N'Dzán', N'0001', N'Dzán', N'4941', N'2399', N'2542', N'1085');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2319, 159, 31, N'31', N'026', N'Dzemul', N'0001', N'Dzemul', N'3489', N'1777', N'1712', N'1008');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2320, 159, 31, N'31', N'027', N'Dzidzantún', N'0001', N'Dzidzantún', N'8133', N'4115', N'4018', N'2288');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2321, 159, 31, N'31', N'028', N'Dzilam de Bravo', N'0001', N'Dzilam de Bravo', N'2463', N'1262', N'1201', N'691');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2322, 159, 31, N'31', N'029', N'Dzilam nzález', N'0001', N'Dzilam nzález', N'5905', N'3027', N'2878', N'1713');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2323, 159, 31, N'31', N'030', N'Dzitás', N'0001', N'Dzitás', N'3540', N'1813', N'1727', N'843');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2324, 159, 31, N'31', N'031', N'Dzoncauich', N'0001', N'Dzoncauich', N'2772', N'1401', N'1371', N'738');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2325, 159, 31, N'31', N'032', N'Espita', N'0001', N'Espita', N'15571', N'7928', N'7643', N'3570');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2326, 159, 31, N'31', N'033', N'Halachó', N'0001', N'Halachó', N'19072', N'9609', N'9463', N'4748');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2327, 159, 31, N'31', N'034', N'Hocabá', N'0001', N'Hocabá', N'6061', N'3033', N'3028', N'1518');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2328, 159, 31, N'31', N'035', N'Hoctún', N'0001', N'Hoctún', N'5697', N'2816', N'2881', N'1483');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2329, 159, 31, N'31', N'036', N'Homún', N'0001', N'Homún', N'7257', N'3688', N'3569', N'1808');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2330, 159, 31, N'31', N'037', N'Huhí', N'0001', N'Huhí', N'4841', N'2471', N'2370', N'1334');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2331, 159, 31, N'31', N'038', N'Hunucmá', N'0001', N'Hunucmá', N'30731', N'15330', N'15401', N'7231');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2332, 159, 31, N'31', N'039', N'Ixil', N'0001', N'Ixil', N'3803', N'1946', N'1857', N'925');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2333, 159, 31, N'31', N'040', N'Izamal', N'0001', N'Izamal', N'25980', N'12887', N'13093', N'6592');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2334, 159, 31, N'31', N'041', N'Kanasín', N'0001', N'Kanasín', N'78709', N'39102', N'39607', N'20314');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2335, 159, 31, N'31', N'042', N'Kantunil', N'0001', N'Kantunil', N'5502', N'2764', N'2738', N'1422');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2336, 159, 31, N'31', N'043', N'Kaua', N'0001', N'Kaua', N'2761', N'1419', N'1342', N'639');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2337, 159, 31, N'31', N'044', N'Kinchil', N'0001', N'Kinchil', N'6571', N'3301', N'3270', N'1644');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2338, 159, 31, N'31', N'045', N'Kopomá', N'0001', N'Kopomá', N'2449', N'1255', N'1194', N'660');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2339, 159, 31, N'31', N'046', N'Mama', N'0001', N'Mama', N'2888', N'1366', N'1522', N'757');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2340, 159, 31, N'31', N'047', N'Maní', N'0001', N'Maní', N'5250', N'2560', N'2690', N'1241');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2341, 159, 31, N'31', N'048', N'Maxcanú', N'0001', N'Maxcanú', N'21704', N'10860', N'10844', N'5221');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2342, 159, 31, N'31', N'049', N'Mayapán', N'0001', N'Mayapán', N'3269', N'1676', N'1593', N'756');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2343, 159, 31, N'31', N'050', N'Mérida', N'0001', N'Mérida', N'830732', N'401340', N'429392', N'229705');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2344, 159, 31, N'31', N'051', N'Mocochá', N'0001', N'Mocochá', N'3071', N'1548', N'1523', N'812');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2345, 159, 31, N'31', N'052', N'Motul', N'0001', N'Motul de Carrillo Puerto', N'33978', N'16817', N'17161', N'8753');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2346, 159, 31, N'31', N'053', N'Muna', N'0001', N'Muna', N'12336', N'6061', N'6275', N'3029');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2347, 159, 31, N'31', N'054', N'Muxupip', N'0001', N'Muxupip', N'2755', N'1341', N'1414', N'735');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2348, 159, 31, N'31', N'055', N'Opichén', N'0001', N'Opichén', N'6285', N'3201', N'3084', N'1585');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2349, 159, 31, N'31', N'056', N'Oxkutzcab', N'0001', N'Oxkutzcab', N'29325', N'13947', N'15378', N'7026');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2350, 159, 31, N'31', N'057', N'Panabá', N'0001', N'Panabá', N'7461', N'3718', N'3743', N'1986');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2351, 159, 31, N'31', N'058', N'Peto', N'0001', N'Peto', N'24159', N'12025', N'12134', N'5600');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2352, 159, 31, N'31', N'059', N'Progreso', N'0001', N'Progreso', N'53958', N'26925', N'27033', N'14476');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2353, 159, 31, N'31', N'060', N'Quintana Roo', N'0001', N'Quintana Roo', N'942', N'470', N'472', N'257');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2354, 159, 31, N'31', N'061', N'Río Lagartos', N'0001', N'Río Lagartos', N'3438', N'1749', N'1689', N'899');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2355, 159, 31, N'31', N'062', N'Sacalum', N'0001', N'Sacalum', N'4589', N'2368', N'2221', N'1154');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2356, 159, 31, N'31', N'063', N'Samahil', N'0001', N'Samahil', N'5008', N'2532', N'2476', N'1214');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2357, 159, 31, N'31', N'064', N'Sanahcat', N'0001', N'Sanahcat', N'1619', N'813', N'806', N'417');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2358, 159, 31, N'31', N'065', N'San Felipe', N'0001', N'San Felipe', N'1839', N'956', N'883', N'553');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2359, 159, 31, N'31', N'066', N'Santa Elena', N'0001', N'Santa Elena', N'3833', N'1855', N'1978', N'942');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2360, 159, 31, N'31', N'067', N'Seyé', N'0001', N'Seyé', N'9276', N'4733', N'4543', N'2312');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2361, 159, 31, N'31', N'068', N'Sinanché', N'0001', N'Sinanché', N'3126', N'1622', N'1504', N'874');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2362, 159, 31, N'31', N'069', N'Sotuta', N'0001', N'Sotuta', N'8449', N'4336', N'4113', N'2020');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2363, 159, 31, N'31', N'070', N'Sucilá', N'0001', N'Sucilá', N'3930', N'1994', N'1936', N'1027');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2364, 159, 31, N'31', N'071', N'Sudzal', N'0001', N'Sudzal', N'1689', N'890', N'799', N'451');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2365, 159, 31, N'31', N'072', N'Suma', N'0001', N'Suma', N'1876', N'946', N'930', N'516');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2366, 159, 31, N'31', N'073', N'Tahdziú', N'0001', N'Tahdziú', N'4447', N'2281', N'2166', N'861');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2367, 159, 31, N'31', N'074', N'Tahmek', N'0001', N'Tahmek', N'3609', N'1841', N'1768', N'996');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2368, 159, 31, N'31', N'075', N'Teabo', N'0001', N'Teabo', N'6205', N'3071', N'3134', N'1380');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2369, 159, 31, N'31', N'076', N'Tecoh', N'0001', N'Tecoh', N'16200', N'8160', N'8040', N'3870');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2370, 159, 31, N'31', N'077', N'Tekal de Venegas', N'0001', N'Tekal de Venegas', N'2606', N'1313', N'1293', N'707');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2371, 159, 31, N'31', N'078', N'Tekantó', N'0001', N'Tekantó', N'3683', N'1830', N'1853', N'1011');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2372, 159, 31, N'31', N'079', N'Tekax', N'0001', N'Tekax de Álvaro Obregón', N'40547', N'19975', N'20572', N'9609');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2373, 159, 31, N'31', N'080', N'Tekit', N'0001', N'Tekit', N'9884', N'4965', N'4919', N'2280');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2374, 159, 31, N'31', N'081', N'Tekom', N'0001', N'Tekom', N'3100', N'1553', N'1547', N'652');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2375, 159, 31, N'31', N'082', N'Telchac Pueblo', N'0001', N'Telchac', N'3557', N'1803', N'1754', N'1103');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2376, 159, 31, N'31', N'083', N'Telchac Puerto', N'0001', N'Telchac Puerto', N'1726', N'906', N'820', N'498');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2377, 159, 31, N'31', N'084', N'Temax', N'0001', N'Temax', N'6817', N'3425', N'3392', N'1706');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2378, 159, 31, N'31', N'085', N'Temozón', N'0001', N'Temozón', N'14801', N'7494', N'7307', N'3506');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2379, 159, 31, N'31', N'086', N'Tepakán', N'0001', N'Tepakán', N'2226', N'1141', N'1085', N'668');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2380, 159, 31, N'31', N'087', N'Tetiz', N'0001', N'Tetiz', N'4725', N'2313', N'2412', N'1173');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2381, 159, 31, N'31', N'088', N'Teya', N'0001', N'Teya', N'1977', N'972', N'1005', N'546');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2382, 159, 31, N'31', N'089', N'Ticul', N'0001', N'Ticul', N'37685', N'18593', N'19092', N'9000');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2383, 159, 31, N'31', N'090', N'Timucuy', N'0001', N'Timucuy', N'6833', N'3496', N'3337', N'1523');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2384, 159, 31, N'31', N'091', N'Tinum', N'0001', N'Tinum', N'11421', N'5788', N'5633', N'2666');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2385, 159, 31, N'31', N'092', N'Tixcacalcupul', N'0001', N'Tixcacalcupul', N'6665', N'3362', N'3303', N'1479');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2386, 159, 31, N'31', N'093', N'Tixkokob', N'0001', N'Tixkokob', N'17176', N'8500', N'8676', N'4384');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2387, 159, 31, N'31', N'094', N'Tixmehuac', N'0001', N'Tixmehuac', N'4746', N'2411', N'2335', N'1113');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2388, 159, 31, N'31', N'095', N'Tixpéhual', N'0001', N'Tixpéhual', N'5388', N'2660', N'2728', N'1366');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2389, 159, 31, N'31', N'096', N'Tizimín', N'0001', N'Tizimín', N'73138', N'36468', N'36670', N'17708');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2390, 159, 31, N'31', N'097', N'Tunkás', N'0001', N'Tunkás', N'3464', N'1774', N'1690', N'951');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2391, 159, 31, N'31', N'098', N'Tzucacab', N'0001', N'Tzucacab', N'14011', N'7102', N'6909', N'3253');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2392, 159, 31, N'31', N'099', N'Uayma', N'0001', N'Uayma', N'3782', N'1944', N'1838', N'841');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2393, 159, 31, N'31', N'100', N'Ucú', N'0001', N'Ucú', N'3469', N'1744', N'1725', N'912');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2394, 159, 31, N'31', N'101', N'Umán', N'0001', N'Umán', N'50993', N'25443', N'25550', N'12751');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2395, 159, 31, N'31', N'102', N'Valladolid', N'0001', N'Valladolid', N'74217', N'36624', N'37593', N'17479');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2396, 159, 31, N'31', N'103', N'Xocchel', N'0001', N'Xocchel', N'3236', N'1660', N'1576', N'774');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2397, 159, 31, N'31', N'104', N'Yaxcabá', N'0001', N'Yaxcabá', N'14802', N'7646', N'7156', N'3436');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2398, 159, 31, N'31', N'105', N'Yaxkukul', N'0001', N'Yaxkukul', N'2868', N'1443', N'1425', N'764');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2399, 159, 31, N'31', N'106', N'Yobaín', N'0001', N'Yobaín', N'2137', N'1103', N'1034', N'628');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2400, 159, 32, N'32', N'001', N'Apozol', N'0001', N'Apozol', N'6314', N'3067', N'3247', N'1698');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2401, 159, 32, N'32', N'002', N'Apulco', N'0001', N'Apulco', N'5005', N'2347', N'2658', N'1218');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2402, 159, 32, N'32', N'003', N'Atolinga', N'0001', N'Atolinga', N'2692', N'1287', N'1405', N'843');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2403, 159, 32, N'32', N'004', N'Benito Juárez', N'0001', N'Florencia', N'4372', N'2221', N'2151', N'1157');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2404, 159, 32, N'32', N'005', N'Calera', N'0001', N'Víctor Rosales', N'39917', N'19726', N'20191', N'9891');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2405, 159, 32, N'32', N'006', N'Cañitas de Felipe Pescador', N'0001', N'Cañitas de Felipe Pescador', N'8239', N'4039', N'4200', N'2081');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2406, 159, 32, N'32', N'007', N'Concepción del Oro', N'0001', N'Concepción del Oro', N'12803', N'6448', N'6355', N'3321');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2407, 159, 32, N'32', N'008', N'Cuauhtémoc', N'0001', N'San Pedro Piedra rda', N'11915', N'5818', N'6097', N'2767');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2408, 159, 32, N'32', N'009', N'Chalchihuites', N'0001', N'Chalchihuites', N'10565', N'5103', N'5462', N'2666');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2409, 159, 32, N'32', N'010', N'Fresnillo', N'0001', N'Fresnillo', N'213139', N'104348', N'108791', N'52891');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2410, 159, 32, N'32', N'011', N'Trinidad García de la Cadena', N'0001', N'Trinidad García de la Cadena', N'3013', N'1472', N'1541', N'905');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2411, 159, 32, N'32', N'012', N'Genaro Codina', N'0001', N'Genaro Codina', N'8104', N'3984', N'4120', N'1818');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2412, 159, 32, N'32', N'013', N'General Enrique Estrada', N'0001', N'General Enrique Estrada', N'5894', N'2905', N'2989', N'1517');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2413, 159, 32, N'32', N'014', N'General Francisco R. Murguía', N'0001', N'Nieves', N'21974', N'10568', N'11406', N'5429');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2414, 159, 32, N'32', N'015', N'El Plateado de Joaquín Amaro', N'0001', N'El Plateado de Joaquín Amaro', N'1609', N'795', N'814', N'509');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2415, 159, 32, N'32', N'016', N'General Pánfilo Natera', N'0001', N'General Pánfilo Natera', N'22346', N'10976', N'11370', N'5366');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2416, 159, 32, N'32', N'017', N'Guadalupe', N'0001', N'Guadalupe', N'159991', N'77843', N'82148', N'41784');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2417, 159, 32, N'32', N'018', N'Huanusco', N'0001', N'Huanusco', N'4306', N'2096', N'2210', N'1192');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2418, 159, 32, N'32', N'019', N'Jalpa', N'0001', N'Jalpa', N'23557', N'11380', N'12177', N'6166');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2419, 159, 32, N'32', N'020', N'Jerez', N'0001', N'Jerez de García Salinas', N'57610', N'27792', N'29818', N'16014');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2420, 159, 32, N'32', N'021', N'Jiménez del Teul', N'0001', N'Jiménez del Teul', N'4584', N'2238', N'2346', N'1042');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2421, 159, 32, N'32', N'022', N'Juan Aldama', N'0001', N'Juan Aldama', N'20543', N'9947', N'10596', N'5099');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2422, 159, 32, N'32', N'023', N'Juchipila', N'0001', N'Juchipila', N'12284', N'5863', N'6421', N'3668');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2423, 159, 32, N'32', N'024', N'Loreto', N'0001', N'Loreto', N'48365', N'23746', N'24619', N'10975');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2424, 159, 32, N'32', N'025', N'Luis Moya', N'0001', N'Luis Moya', N'12234', N'6075', N'6159', N'2906');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2425, 159, 32, N'32', N'026', N'Mazapil', N'0001', N'Mazapil', N'17813', N'9331', N'8482', N'4293');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2426, 159, 32, N'32', N'027', N'Melchor Ocampo', N'0001', N'Melchor Ocampo', N'2662', N'1414', N'1248', N'635');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2427, 159, 32, N'32', N'028', N'Mezquital del Oro', N'0001', N'Mezquital del Oro', N'2584', N'1219', N'1365', N'684');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2428, 159, 32, N'32', N'029', N'Miguel Auza', N'0001', N'Miguel Auza', N'22296', N'10853', N'11443', N'5079');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2429, 159, 32, N'32', N'030', N'Momax', N'0001', N'Momax', N'2529', N'1216', N'1313', N'750');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2430, 159, 32, N'32', N'031', N'Monte Escobedo', N'0001', N'Monte Escobedo', N'8929', N'4352', N'4577', N'2620');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2431, 159, 32, N'32', N'032', N'Morelos', N'0001', N'Morelos', N'11493', N'5690', N'5803', N'2982');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2432, 159, 32, N'32', N'033', N'Moyahua de Estrada', N'0001', N'Moyahua de Estrada', N'4563', N'2155', N'2408', N'1384');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2433, 159, 32, N'32', N'034', N'Nochistlán de Mejía', N'0001', N'Nochistlán de Mejía', N'27932', N'13157', N'14775', N'7531');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2434, 159, 32, N'32', N'035', N'Noria de Ángeles', N'0001', N'Noria de Ángeles', N'15607', N'7663', N'7944', N'3630');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2435, 159, 32, N'32', N'036', N'Ojocaliente', N'0001', N'Ojocaliente', N'40740', N'19749', N'20991', N'9444');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2436, 159, 32, N'32', N'037', N'Pánuco', N'0001', N'Pánuco', N'16875', N'8407', N'8468', N'4284');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2437, 159, 32, N'32', N'038', N'Pinos', N'0001', N'Pinos', N'69844', N'33973', N'35871', N'16719');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2438, 159, 32, N'32', N'039', N'Río Grande', N'0001', N'Río Grande', N'62693', N'30198', N'32495', N'15971');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2439, 159, 32, N'32', N'040', N'Sain Alto', N'0001', N'Sain Alto', N'21533', N'10433', N'11100', N'4924');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2440, 159, 32, N'32', N'041', N'El Salvador', N'0001', N'El Salvador', N'2710', N'1378', N'1332', N'713');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2441, 159, 32, N'32', N'042', N'Sombrerete', N'0001', N'Sombrerete', N'61188', N'30159', N'31029', N'15667');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2442, 159, 32, N'32', N'043', N'Susticacán', N'0001', N'Susticacán', N'1360', N'636', N'724', N'365');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2443, 159, 32, N'32', N'044', N'Tabasco', N'0001', N'Tabasco', N'15656', N'7603', N'8053', N'4026');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2444, 159, 32, N'32', N'045', N'Tepechitlán', N'0001', N'Tepechitlán', N'8215', N'3934', N'4281', N'2320');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2445, 159, 32, N'32', N'046', N'Tepeton', N'0001', N'Tepeton', N'7090', N'3401', N'3689', N'2066');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2446, 159, 32, N'32', N'047', N'Teúl de nzález Ortega', N'0001', N'Teúl de nzález Ortega', N'5506', N'2656', N'2850', N'1557');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2447, 159, 32, N'32', N'048', N'Tlaltenan de Sánchez Román', N'0001', N'Tlaltenan de Sánchez Román', N'25493', N'12470', N'13023', N'6765');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2448, 159, 32, N'32', N'049', N'Valparaíso', N'0001', N'Valparaíso', N'33323', N'16349', N'16974', N'8679');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2449, 159, 32, N'32', N'050', N'Vetagrande', N'0001', N'Vetagrande', N'9353', N'4561', N'4792', N'2240');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2450, 159, 32, N'32', N'051', N'Villa de Cos', N'0001', N'Villa de Cos', N'34328', N'17164', N'17164', N'8642');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2451, 159, 32, N'32', N'052', N'Villa García', N'0001', N'Villa García', N'18269', N'9035', N'9234', N'4231');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2452, 159, 32, N'32', N'053', N'Villa nzález Ortega', N'0001', N'Villa nzález Ortega', N'12893', N'6177', N'6716', N'3032');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2453, 159, 32, N'32', N'054', N'Villa Hidal', N'0001', N'Villa Hidal', N'18490', N'9120', N'9370', N'4290');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2454, 159, 32, N'32', N'055', N'Villanueva', N'0001', N'Villanueva', N'29395', N'14303', N'15092', N'7863');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2455, 159, 32, N'32', N'056', N'Zacatecas', N'0001', N'Zacatecas', N'138176', N'66297', N'71879', N'36249');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2456, 159, 32, N'32', N'057', N'Trancoso', N'0001', N'Trancoso', N'16934', N'8358', N'8576', N'3699');
INSERT INTO City (Id, CountryRegionId, StateProvinceId, CveEnt, CveCity, Description, CveCab, NameCab, PTOT, PMAS, PFEM, VTOT) VALUES (2457, 159, 32, N'32', N'058', N'Santa María de la Paz', N'0001', N'Santa María de la Paz', N'2821', N'1402', N'1419', N'761');

UPDATE StateProvince SET Description = UPPER(Description), Abrev = UPPER(Abrev), NameCab = UPPER(NameCab) WHERE CountryRegionId = 159;
UPDATE StateProvince SET Abrev = REPLACE(Abrev, '.', '') WHERE CountryRegionId = 159;
UPDATE City SET Description = UPPER(Description), NameCab = UPPER(NameCab) WHERE CountryRegionId = 159;

-- --------------------------------------------------------

DROP TABLE IF EXISTS `RoadType`;

--
-- Estructura de tabla `RoadType`
--

CREATE TABLE `RoadType`
(
	`Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
	`Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los tipos de Vialidad';

INSERT INTO RoadType (Name) VALUES('ANDADOR');
INSERT INTO RoadType (Name) VALUES('AUTOPISTA');
INSERT INTO RoadType (Name) VALUES('AVENIDA (AV.)');
INSERT INTO RoadType (Name) VALUES('BOULEVARD (BLVD.)');
INSERT INTO RoadType (Name) VALUES('CALLE');
INSERT INTO RoadType (Name) VALUES('CALLEJON (CJON.)');
INSERT INTO RoadType (Name) VALUES('CALZADA (CALZ.)');
INSERT INTO RoadType (Name) VALUES('CAMINO');
INSERT INTO RoadType (Name) VALUES('CARRETERA (CARR.)');
INSERT INTO RoadType (Name) VALUES('CERRADA (CDA) O PRIVADA (PRIV.)');
INSERT INTO RoadType (Name) VALUES('PASAJE');

-- --------------------------------------------------------

DROP TABLE IF EXISTS `AddressType`;

--
-- Estructura de tabla `AddressType`
--

CREATE TABLE `AddressType`
(
	`Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
	`Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los tipos de direccion';

INSERT INTO AddressType (Name) VALUES('BODEGA');
INSERT INTO AddressType (Name) VALUES('CASA HABITACION');
INSERT INTO AddressType (Name) VALUES('ESCUELA Y BIBLIOTECA');
INSERT INTO AddressType (Name) VALUES('HOSPITALES Y ATENCION MEDICA');
INSERT INTO AddressType (Name) VALUES('INDUSTRIAS, FABRICAS Y TALLERES');
INSERT INTO AddressType (Name) VALUES('INFRAE. TURISTICA Y DE ESPARCIMIENTO');
INSERT INTO AddressType (Name) VALUES('LOCAL COMERCIAL');
INSERT INTO AddressType (Name) VALUES('LOTE BALDIO');
INSERT INTO AddressType (Name) VALUES('OFICINA');
INSERT INTO AddressType (Name) VALUES('TERRENOS AGROPECUARIOS');

-- --------------------------------------------------------

DROP TABLE IF EXISTS `Address`;

--
-- Estructura de tabla `Address`
--

CREATE TABLE `Address`
(
	`Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
	`RoadTypeId` INT NOT NULL,
    `AddressTypeId` INT NOT NULL,
	`AddressLine1` varchar(50) NOT NULL,
	`AddressLine2` varchar(50) NOT NULL,
    `CountryRegionId` INT NOT NULL,
    `StateProvinceId` INT NOT NULL,
    `CityId` INT NOT NULL,
    `PostalCode` VARCHAR(5) NULL,
    
    -- START: AuditableEntity --
    `CreatedDate` DATETIME NULL,
    `CreateBy` VARCHAR(6) NULL,
    `ModifiedDate` DATETIME NULL,
    `ModifiedBy` VARCHAR(6) NULL,
    -- END: AuditableEntity --
    
    FOREIGN KEY (RoadTypeId) REFERENCES RoadType(Id),
    FOREIGN KEY (AddressTypeId) REFERENCES AddressType(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar las direcciones de las sucursales/empresas';

-- --------------------------------------------------------

DROP TABLE IF EXISTS `AddressSAT`;

--
-- Estructura de tabla `AddressSAT`
--

CREATE TABLE `AddressSAT`
(
	`Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
	`RoadTypeId` INT NOT NULL,
    `AddressTypeId` INT NOT NULL,
	`AddressLine1` varchar(50) NOT NULL,
	`AddressLine2` varchar(50) NOT NULL,
    `CountryRegionId` INT NOT NULL,
    `StateProvinceId` INT NOT NULL,
    `CityId` INT NOT NULL,
    `PostalCode` VARCHAR(5) NULL,
    
    -- START: AuditableEntity --
    `CreatedDate` DATETIME NULL,
    `CreateBy` VARCHAR(6) NULL,
    `ModifiedDate` DATETIME NULL,
    `ModifiedBy` VARCHAR(6) NULL,
    -- END: AuditableEntity --
    
	FOREIGN KEY (RoadTypeId) REFERENCES RoadType(Id),
    FOREIGN KEY (AddressTypeId) REFERENCES AddressType(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar el domicilio fiscal registrado ante el SAT';

-- --------------------------------------------------------

DROP TABLE IF EXISTS `Gender`;

--
-- Estructura de tabla `Gender`
--

CREATE TABLE `Gender` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `Abrev` varchar(1) NOT NULL,
  `Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los departamentos disponibles';

INSERT INTO Gender (Abrev, Name) VALUES('M', 'MASCULINO');
INSERT INTO Gender (Abrev, Name) VALUES('F', 'FEMENINO');

-- --------------------------------------------------------

DROP TABLE IF EXISTS `MaritalStatus`;

--
-- Estructura de tabla `MaritalStatus`
--

CREATE TABLE `MaritalStatus` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los estados civiles disponibles';

INSERT INTO MaritalStatus (Name) VALUES('SOLTERO');
INSERT INTO MaritalStatus (Name) VALUES('CASADO');
INSERT INTO MaritalStatus (Name) VALUES('VIUDO');
INSERT INTO MaritalStatus (Name) VALUES('DIVORCIADO');
INSERT INTO MaritalStatus (Name) VALUES('SEPARADO');

-- --------------------------------------------------------

DROP TABLE IF EXISTS `RegimenFiscal`;

--
-- Estructura de tabla `RegimenFiscal`
--

CREATE TABLE `RegimenFiscal` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `Key` varchar(6) NOT NULL,
  `Description` varchar(200) NULL,
  `Fisica` tinyint NOT NULL,
  `Moral` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los regimenes fiscales';

INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11','AGRICULTURA, GANADERÍA, APROVECHAMIENTO FORESTAL, PESCA Y CAZA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('21','MINERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('22','ELECTRICIDAD, AGUA Y SUMINISTRO DE GAS POR DUCTOS AL CONSUMIDOR FINAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23','CONSTRUCCIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31','INDUSTRIAS MANUFACTURERAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43','COMERCIO AL POR MAYOR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46','COMERCIO AL POR MENOR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48','TRANSPORTES, CORREOS Y ALMACENAMIENTO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51','INFORMACIÓN EN MEDIOS MASIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52','SERVICIOS FINANCIEROS Y DE SEGUROS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('53','SERVICIOS INMOBILIARIOS Y DE ALQUILER DE BIENES MUEBLES E INTANGIBLES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54','SERVICIOS PROFESIONALES, CIENTÍFICOS Y TÉCNICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('55','DIRECCIÓN DE CORPORATIVOS Y EMPRESAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56','SERVICIOS DE APOYO A LOS NEGOCIOS Y MANEJO DE DESECHOS Y SERVICIOS DE REMEDIACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('61','SERVICIOS EDUCATIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62','SERVICIOS DE SALUD Y DE ASISTENCIA SOCIAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71','SERVICIOS DE ESPARCIMIENTO CULTURALES Y DEPORTIVOS, Y OTROS SERVICIOS RECREATIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('72','SERVICIOS DE ALOJAMIENTO TEMPORAL Y DE PREPARACIÓN DE ALIMENTOS Y BEBIDAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81','OTROS SERVICIOS EXCEPTO ACTIVIDADES DEL GOBIERNO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93','ACTIVIDADES DEL GOBIERNO Y DE ORGANISMOS INTERNACIONALES Y EXTRATERRITORIALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111','AGRICULTURA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112','GANADERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('113','APROVECHAMIENTO FORESTAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('114','PESCA, CAZA Y CAPTURA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('115','SERVICIOS RELACIONADOS CON LAS ACTIVIDADES AGROPECUARIAS Y FORESTALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('211','EXTRACCIÓN DE PETRÓLEO Y GAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212','MINERÍA DE MINERALES METÁLICOS Y NO METÁLICOS, EXCEPTO PETRÓLEO Y GAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('213','SERVICIOS RELACIONADOS CON LA MINERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('221','GENERACIÓN, TRANSMISIÓN Y SUMINISTRO DE ENERGÍA ELÉCTRICA.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('222','AGUA Y SUMINISTRO DE GAS POR DUCTOS AL CONSUMIDOR FINAL.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('236','EDIFICACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237','CONSTRUCCIÓN DE OBRAS DE INGENIERÍA CIVIL U OBRA PESADA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238','TRABAJOS ESPECIALIZADOS PARA LA CONSTRUCCIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311','INDUSTRIA ALIMENTARIA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312','INDUSTRIA DE LAS BEBIDAS Y DEL TABACO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('313','FABRICACIÓN DE INSUMOS TEXTILES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('314','CONFECCIÓN DE PRODUCTOS TEXTILES, EXCEPTO PRENDAS DE VESTIR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('315','FABRICACIÓN DE PRENDAS DE VESTIR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('316','FABRICACIÓN DE PRODUCTOS DE CUERO, PIEL Y MATERIALES SUCEDÁNEOS, EXCEPTO PRENDAS DE VESTIR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('321','INDUSTRIA DE LA MADERA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('322','INDUSTRIA DEL PAPEL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('323','IMPRESIÓN E INDUSTRIAS CONEXAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('324','FABRICACIÓN DE PRODUCTOS DERIVADOS DEL PETRÓLEO Y DEL CARBÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325','INDUSTRIA QUÍMICA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('326','INDUSTRIA DEL PLÁSTICO Y DEL HULE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327','FABRICACIÓN DE PRODUCTOS A BASE DE MINERALES NO METÁLICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('331','INDUSTRIAS METÁLICAS BÁSICAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('332','FABRICACIÓN DE PRODUCTOS METÁLICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333','FABRICACIÓN DE MAQUINARIA Y EQUIPO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('334','FABRICACIÓN DE EQUIPO DE COMPUTACIÓN, COMUNICACIÓN, MEDICIÓN Y DE OTROS EQUIPOS, COMPONENTES Y ACCESORIOS ELECTRÓNICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('335','FABRICACIÓN DE EQUIPO DE GENERACIÓN ELÉCTRICA Y APARATOS Y ACCESORIOS ELÉCTRICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('336','FABRICACIÓN DE EQUIPO DE TRANSPORTE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('337','FABRICACIÓN DE MUEBLES Y PRODUCTOS RELACIONADOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('339','OTRAS INDUSTRIAS MANUFACTURERAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431','COMERCIO AL POR MAYOR DE ALIMENTOS, BEBIDAS Y TABACO.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('432','COMERCIO AL POR MAYOR DE PRODUCTOS TEXTILES Y CALZADO.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('433','COMERCIO AL POR MAYOR DE PRODUCTOS FARMACÉUTICOS, DE PERFUMERÍA, ACCESORIOS DE VESTIR, ARTÍCULOS PARA EL ESPARCIMIENTO Y ELECTRODOMÉSTICOS.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('434','COMERCIO AL POR MAYOR DE MATERIAS PRIMAS AGROPECUARIAS, PARA LA INDUSTRIA Y MATERIALES DE DESECHO.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('435','COMERCIO AL POR MAYOR DE MAQUINARIA, MOBILIARIO Y EQUIPO PARA ACTIVIDADES AGROPECUARIAS, INDUSTRIALES Y DE SERVICIOS.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('436','COMERCIO AL POR MAYOR DE CAMIONES.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('437','INTERMEDIACIÓN Y COMERCIO AL POR MAYOR POR MEDIOS MASIVOS DE COMUNICACIÓN Y OTROS MEDIOS.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461','COMERCIO AL POR MENOR DE ALIMENTOS, BEBIDAS Y TABACO.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('462','COMERCIO AL POR MENOR EN TIENDAS DE AUTOSERVICIO Y DEPARTAMENTALES.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('463','COMERCIO AL POR MENOR DE PRODUCTOS TEXTILES, ACCESORIOS DE VESTIR Y CALZADO.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('464','COMERCIO AL POR MENOR DE ARTÍCULOS PARA EL CUIDADO DE LA SALUD.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('465','COMERCIO AL POR MENOR DE ARTÍCULOS DE PAPELERÍA, PARA EL ESPARCIMIENTO Y OTROS ARTÍCULOS DE USO PERSONAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('466','COMERCIO AL POR MENOR DE ENSERES DOMÉSTICOS, COMPUTADORAS Y ARTÍCULOS PARA LA DECORACIÓN DE INTERIORES.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('467','COMERCIO AL POR MENOR DE ARTÍCULOS DE FERRETERÍA, TLAPALERÍA Y VIDRIOS.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('468','COMERCIO AL POR MENOR DE VEHÍCULOS DE MOTOR, REFACCIONES, COMBUSTIBLES Y LUBRICANTES.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('469','INTERMEDIACIÓN Y COMERCIO AL POR MENOR POR MEDIOS MASIVOS DE COMUNICACIÓN Y OTROS MEDIOS.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('481','TRANSPORTE AÉREO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('482','TRANSPORTE POR FERROCARRIL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('483','TRANSPORTE POR AGUA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('484','AUTOTRANSPORTE DE CARGA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('485','TRANSPORTE TERRESTRE DE PASAJEROS, EXCEPTO POR FERROCARRIL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('486','TRANSPORTE POR DUCTOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('487','TRANSPORTE TURÍSTICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('488','SERVICIOS RELACIONADOS CON EL TRANSPORTE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('491','SERVICIOS POSTALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('492','SERVICIOS DE MENSAJERÍA Y PAQUETERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('493','SERVICIOS DE ALMACENAMIENTO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('511','EDICIÓN DE PUBLICACIONES Y DE SOFTWARE, EXCEPTO A TRAVÉS DE INTERNET',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('512','INDUSTRIA FÍLMICA Y DEL VIDEO, E INDUSTRIA DEL SONIDO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('515','RADIO Y TELEVISIÓN, EXCEPTO A TRAVÉS DE INTERNET',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('516','CREACIÓN Y DIFUSIÓN DE CONTENIDO EXCLUSIVAMENTE A TRAVÉS DE INTERNET',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('517','OTRAS TELECOMUNICACIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('518','PROVEEDORES DE ACCESO A INTERNET, SERVICIOS DE BÚSQUEDA EN LA RED Y SERVICIOS DE PROCESAMIENTO DE INFORMACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('519','OTROS SERVICIOS DE INFORMACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('521','BANCA CENTRAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522','INSTITUCIONES DE INTERMEDIACIÓN CREDITICIA Y FINANCIERA NO BURSÁTIL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('523','ACTIVIDADES BURSÁTILES CAMBIARIAS Y DE INVERSIÓN FINANCIERA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('524','COMPAÑÍAS DE FIANZAS, SEGUROS Y PENSIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('531','SERVICIOS INMOBILIARIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('532','SERVICIOS DE ALQUILER DE BIENES MUEBLES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('533','SERVICIOS DE ALQUILER DE MARCAS REGISTRADAS, PATENTES Y FRANQUICIAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541','SERVICIOS PROFESIONALES, CIENTÍFICOS Y TÉCNICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('551','DIRECCIÓN DE CORPORATIVOS Y EMPRESAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561','SERVICIOS DE APOYO A LOS NEGOCIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('562','MANEJO DE DESECHOS Y SERVICIOS DE REMEDIACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611','SERVICIOS EDUCATIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621','SERVICIOS MÉDICOS DE CONSULTA EXTERNA Y SERVICIOS RELACIONADOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('622','HOSPITALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('623','RESIDENCIAS DE ASISTENCIA SOCIAL Y PARA EL CUIDADO DE LA SALUD',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('624','OTROS SERVICIOS DE ASISTENCIA SOCIAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('711','SERVICIOS ARTÍSTICOS Y DEPORTIVOS Y OTROS SERVICIOS RELACIONADOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('712','MUSEOS, SITIOS HISTÓRICOS, JARDINES BOTÁNICOS Y SIMILARES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713','SERVICIOS DE ENTRETENIMIENTO EN INSTALACIONES RECREATIVAS Y OTROS SERVICIOS RECREATIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('721','SERVICIOS DE ALOJAMIENTO TEMPORAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('722','SERVICIOS DE PREPARACIÓN DE ALIMENTOS Y BEBIDAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811','SERVICIOS DE REPARACIÓN Y MANTENIMIENTO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('812','SERVICIOS PERSONALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('813','ASOCIACIONES Y ORGANIZACIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('814','HOGARES CON EMPLEADOS DOMÉSTICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('931','ACTIVIDADES DEL GOBIERNO.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('932','ORGANISMOS INTERNACIONALES Y EXTRATERRITORIALES.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('1111','CULTIVO DE GRANOS Y SEMILLAS OLEAGINOSAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('1112','CULTIVO DE HORTALIZAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('1113','CULTIVO DE FRUTALES Y NUECES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('1114','CULTIVO EN INVERNADEROS Y VIVEROS, Y FLORICULTURA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('1119','OTROS CULTIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('1121','EXPLOTACIÓN DE BOVINOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('1122','EXPLOTACIÓN DE PORCINOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('1123','EXPLOTACIÓN AVÍCOLA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('1124','EXPLOTACIÓN DE OVINOS Y CAPRINOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('1125','ACUICULTURA ANIMAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('1129','EXPLOTACIÓN DE OTROS ANIMALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('1131','SILVICULTURA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('1132','VIVEROS FORESTALES Y RECOLECCIÓN DE PRODUCTOS FORESTALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('1133','TALA DE ÁRBOLES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('1141','PESCA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('1142','CAZA Y CAPTURA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('1151','SERVICIOS RELACIONADOS CON LA AGRICULTURA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('1152','SERVICIOS RELACIONADOS CON LA GANADERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('1153','SERVICIOS RELACIONADOS CON EL APROVECHAMIENTO FORESTAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('2111','EXTRACCIÓN DE PETRÓLEO Y GAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('2121','MINERÍA DE CARBÓN MINERAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('2122','MINERÍA DE MINERALES METÁLICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('2123','MINERÍA DE MINERALES NO METÁLICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('2131','SERVICIOS RELACIONADOS CON LA MINERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('2211','GENERACIÓN, TRANSMISIÓN Y SUMINISTRO DE ENERGÍA ELÉCTRICA.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('2221','CAPTACIÓN, TRATAMIENTO Y SUMINISTRO DE AGUA.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('2222','SUMINISTRO DE GAS POR DUCTOS AL CONSUMIDOR FINAL.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('2361','EDIFICACIÓN RESIDENCIAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('2362','EDIFICACIÓN NO RESIDENCIAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('2371','CONSTRUCCIÓN DE OBRAS PARA EL ABASTECIMIENTO DE AGUA, PETRÓLEO, GAS, ELECTRICIDAD Y TELECOMUNICACIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('2372','DIVISIÓN DE TERRENOS Y CONSTRUCCIÓN DE OBRAS DE URBANIZACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('2373','CONSTRUCCIÓN DE VÍAS DE COMUNICACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('2379','OTRAS CONSTRUCCIONES DE INGENIERÍA CIVIL U OBRA PESADA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('2381','CIMENTACIONES, MONTAJE DE ESTRUCTURAS PREFABRICADAS Y TRABAJOS EN EXTERIORES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('2382','INSTALACIONES Y EQUIPAMIENTO EN CONSTRUCCIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('2383','TRABAJOS DE ACABADOS EN EDIFICACIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('2389','OTROS TRABAJOS ESPECIALIZADOS PARA LA CONSTRUCCIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3111','ELABORACIÓN DE ALIMENTOS PARA ANIMALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3112','MOLIENDA DE GRANOS Y DE SEMILLAS OLEAGINOSAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3113','ELABORACIÓN DE AZÚCAR, CHOCOLATES, DULCES Y SIMILARES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3114','CONSERVACIÓN DE FRUTAS, VERDURAS Y GUISOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3115','ELABORACIÓN DE PRODUCTOS LÁCTEOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3116','MATANZA, EMPACADO Y PROCESAMIENTO DE CARNE DE GANADO Y AVES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3117','PREPARACIÓN Y ENVASADO DE PESCADOS Y MARISCOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3118','ELABORACIÓN DE PRODUCTOS DE PANADERÍA Y TORTILLAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3119','OTRAS INDUSTRIAS ALIMENTARIAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3121','INDUSTRIA DE LAS BEBIDAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3122','INDUSTRIA DEL TABACO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3131','PREPARACIÓN E HILADO DE FIBRAS TEXTILES Y FABRICACIÓN DE HILOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3132','FABRICACIÓN DE TELAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3133','ACABADO Y RECUBRIMIENTO DE TEXTILES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3141','CONFECCIÓN DE ALFOMBRAS, BLANCOS Y SIMILARES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3149','CONFECCIÓN DE OTROS PRODUCTOS TEXTILES, EXCEPTO PRENDAS DE VESTIR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3151','TEJIDO DE PRENDAS DE VESTIR DE PUNTO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3152','CONFECCIÓN DE PRENDAS DE VESTIR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3159','CONFECCIÓN DE ACCESORIOS DE VESTIR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3161','CURTIDO Y ACABADO DE CUERO Y PIEL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3162','FABRICACIÓN DE CALZADO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3169','FABRICACIÓN DE OTROS PRODUCTOS DE CUERO, PIEL Y MATERIALES SUCEDÁNEOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3211','ASERRADO Y CONSERVACIÓN DE LA MADERA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3212','FABRICACIÓN DE LAMINADOS Y AGLUTINADOS DE MADERA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3219','FABRICACIÓN DE OTROS PRODUCTOS DE MADERA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3221','FABRICACIÓN DE CELULOSA, PAPEL Y CARTÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3222','FABRICACIÓN DE PRODUCTOS DE PAPEL Y CARTÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3231','IMPRESIÓN E INDUSTRIAS CONEXAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3241','FABRICACIÓN DE PRODUCTOS DERIVADOS DEL PETRÓLEO Y DEL CARBÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3251','FABRICACIÓN DE PRODUCTOS QUÍMICOS BÁSICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3252','FABRICACIÓN DE HULES, RESINAS Y FIBRAS QUÍMICAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3253','FABRICACIÓN DE FERTILIZANTES, PESTICIDAS Y OTROS AGROQUÍMICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3254','FABRICACIÓN DE PRODUCTOS FARMACÉUTICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3255','FABRICACIÓN DE PINTURAS, RECUBRIMIENTOS, ADHESIVOS Y SELLADORES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3256','FABRICACIÓN DE JABONES, LIMPIADORES Y PREPARACIONES DE TOCADOR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3259','FABRICACIÓN DE OTROS PRODUCTOS QUÍMICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3261','FABRICACIÓN DE PRODUCTOS DE PLÁSTICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3262','FABRICACIÓN DE PRODUCTOS DE HULE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3271','FABRICACIÓN DE PRODUCTOS A BASE DE ARCILLAS Y MINERALES REFRACTARIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3272','FABRICACIÓN DE VIDRIO Y PRODUCTOS DE VIDRIO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3273','FABRICACIÓN DE CEMENTO Y PRODUCTOS DE CONCRETO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3274','FABRICACIÓN DE CAL, YESO Y PRODUCTOS DE YESO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3279','FABRICACIÓN DE OTROS PRODUCTOS A BASE DE MINERALES NO METÁLICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3311','INDUSTRIA BÁSICA DEL HIERRO Y DEL ACERO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3312','FABRICACIÓN DE PRODUCTOS DE HIERRO Y ACERO DE MATERIAL COMPRADO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3313','INDUSTRIA DEL ALUMINIO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3314','INDUSTRIAS DE METALES NO FERROSOS, EXCEPTO ALUMINIO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3315','MOLDEO POR FUNDICIÓN DE PIEZAS METÁLICAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3321','FABRICACIÓN DE PRODUCTOS METÁLICOS FORJADOS Y TROQUELADOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3322','FABRICACIÓN DE HERRAMIENTAS DE MANO SIN MOTOR Y UTENSILIOS DE COCINA METÁLICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3323','FABRICACIÓN DE ESTRUCTURAS METÁLICAS Y PRODUCTOS DE HERRERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3324','FABRICACIÓN DE CALDERAS, TANQUES Y ENVASES METÁLICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3325','FABRICACIÓN DE HERRAJES Y CERRADURAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3326','FABRICACIÓN DE ALAMBRE, PRODUCTOS DE ALAMBRE Y RESORTES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3327','MAQUINADO DE PIEZAS METÁLICAS Y FABRICACIÓN DE TORNILLOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3328','RECUBRIMIENTOS Y TERMINADOS METÁLICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3329','FABRICACIÓN DE OTROS PRODUCTOS METÁLICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3331','FABRICACIÓN DE MAQUINARIA Y EQUIPO PARA LAS ACTIVIDADES AGROPECUARIAS, PARA LA CONSTRUCCIÓN Y PARA LA INDUSTRIA EXTRACTIVA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3332','FABRICACIÓN DE MAQUINARIA Y EQUIPO PARA LAS INDUSTRIAS MANUFACTURERAS, EXCEPTO LA METALMECÁNICA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3333','FABRICACIÓN DE MAQUINARIA Y EQUIPO PARA EL COMERCIO Y LOS SERVICIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3334','FABRICACIÓN DE SISTEMAS DE AIRE ACONDICIONADO, CALEFACCIÓN Y DE REFRIGERACIÓN INDUSTRIAL Y COMERCIAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3335','FABRICACIÓN DE MAQUINARIA Y EQUIPO PARA LA INDUSTRIA METALMECÁNICA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3336','FABRICACIÓN DE MOTORES DE COMBUSTIÓN INTERNA, TURBINAS Y TRANSMISIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3339','FABRICACIÓN DE OTRA MAQUINARIA Y EQUIPO PARA LA INDUSTRIA EN GENERAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3341','FABRICACIÓN DE COMPUTADORAS Y EQUIPO PERIFÉRICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3342','FABRICACIÓN DE EQUIPO DE COMUNICACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3343','FABRICACIÓN DE EQUIPO DE AUDIO Y DE VIDEO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3344','FABRICACIÓN DE COMPONENTES ELECTRÓNICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3345','FABRICACIÓN DE INSTRUMENTOS DE NAVEGACIÓN, MEDICIÓN, MÉDICOS Y DE CONTROL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3346','FABRICACIÓN Y REPRODUCCIÓN DE MEDIOS MAGNÉTICOS Y ÓPTICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3351','FABRICACIÓN DE ACCESORIOS DE ILUMINACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3352','FABRICACIÓN DE APARATOS ELÉCTRICOS DE USO DOMÉSTICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3353','FABRICACIÓN DE EQUIPO DE GENERACIÓN Y DISTRIBUCIÓN DE ENERGÍA ELÉCTRICA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3359','FABRICACIÓN DE OTROS EQUIPOS Y ACCESORIOS ELÉCTRICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3361','FABRICACIÓN DE AUTOMÓVILES Y CAMIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3362','FABRICACIÓN DE CARROCERÍAS Y REMOLQUES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3363','FABRICACIÓN DE PARTES PARA VEHÍCULOS AUTOMOTORES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3364','FABRICACIÓN DE EQUIPO AEROESPACIAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3365','FABRICACIÓN DE EQUIPO FERROVIARIO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3366','FABRICACIÓN DE EMBARCACIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3369','FABRICACIÓN DE OTRO EQUIPO DE TRANSPORTE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3371','FABRICACIÓN DE MUEBLES, EXCEPTO DE OFICINA Y ESTANTERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3372','FABRICACIÓN DE MUEBLES DE OFICINA Y ESTANTERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3379','FABRICACIÓN DE PRODUCTOS RELACIONADOS CON LOS MUEBLES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3391','FABRICACIÓN DE EQUIPO Y MATERIAL PARA USO MÉDICO, DENTAL Y PARA LABORATORIO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('3399','OTRAS INDUSTRIAS MANUFACTURERAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4311','COMERCIO AL POR MAYOR DE ALIMENTOS Y ABARROTES.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4312','COMERCIO AL POR MAYOR DE BEBIDAS Y TABACO.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4321','COMERCIO AL POR MAYOR DE PRODUCTOS TEXTILES Y CALZADO.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4331','COMERCIO AL POR MAYOR DE PRODUCTOS FARMACÉUTICOS.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4332','COMERCIO AL POR MAYOR DE ARTÍCULOS DE PERFUMERÍA, JOYERÍA Y OTROS ACCESORIOS DE VESTIR.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4333','COMERCIO AL POR MAYOR DE DISCOS, JUGUETES Y ARTÍCULOS DEPORTIVOS.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4334','COMERCIO AL POR MAYOR DE ARTÍCULOS DE PAPELERÍA, LIBROS, REVISTAS Y PERIÓDICOS.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4335','COMERCIO AL POR MAYOR DE ELECTRODOMÉSTICOS MENORES Y APARATOS DE LÍNEA BLANCA.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4341','COMERCIO AL POR MAYOR DE MATERIAS PRIMAS AGROPECUARIAS.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4342','COMERCIO AL POR MAYOR DE MATERIAS PRIMAS PARA LA INDUSTRIA.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4343','COMERCIO AL POR MAYOR DE MATERIALES DE DESECHO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4351','COMERCIO AL POR MAYOR DE MAQUINARIA Y EQUIPO AGROPECUARIO, FORESTAL Y PARA LA PESCA.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4352','COMERCIO AL POR MAYOR DE MAQUINARIA Y EQUIPO PARA LA INDUSTRIA.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4353','COMERCIO AL POR MAYOR DE MAQUINARIA Y EQUIPO PARA LOS SERVICIOS Y PARA ACTIVIDADES COMERCIALES.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4354','COMERCIO AL POR MAYOR DE MAQUINARIA, MOBILIARIO Y EQUIPO DE USO GENERAL.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4361','COMERCIO AL POR MAYOR DE CAMIONES.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4371','INTERMEDIACIÓN AL POR MAYOR. ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4372','COMERCIO AL POR MAYOR POR MEDIOS MASIVOS DE COMUNICACIÓN Y OTROS MEDIOS.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4611','COMERCIO AL POR MENOR DE ALIMENTOS.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4612','COMERCIO AL POR MENOR DE BEBIDAS Y TABACO.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4621','COMERCIO AL POR MENOR EN TIENDAS DE AUTOSERVICIO.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4622','COMERCIO AL POR MENOR EN TIENDAS DEPARTAMENTALES.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4631','COMERCIO AL POR MENOR DE PRODUCTOS TEXTILES, EXCEPTO ROPA.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4632','COMERCIO AL POR MENOR DE ROPA Y ACCESORIOS DE VESTIR.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4633','COMERCIO AL POR MENOR DE CALZADO.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4641','COMERCIO AL POR MENOR DE ARTÍCULOS PARA EL CUIDADO DE LA SALUD.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4651','COMERCIO AL POR MENOR DE ARTÍCULOS DE PERFUMERÍA Y JOYERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4652','COMERCIO AL POR MENOR DE ARTÍCULOS PARA EL ESPARCIMIENTO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4653','COMERCIO AL POR MENOR DE ARTÍCULOS DE PAPELERÍA, LIBROS Y PERIÓDICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4659','COMERCIO AL POR MENOR DE MASCOTAS, REGALOS, ARTÍCULOS RELIGIOSOS, ARTESANÍAS, ARTÍCULOS EN TIENDAS IMPORTADORAS Y OTROS ARTÍCULOS DE USO PERSONAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4661','COMERCIO AL POR MENOR DE MUEBLES PARA EL HOGAR Y OTROS ENSERES DOMÉSTICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4662','COMERCIO AL POR MENOR DE COMPUTADORAS, TELÉFONOS Y OTROS APARATOS DE COMUNICACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4663','COMERCIO AL POR MENOR DE ARTÍCULOS PARA LA DECORACIÓN DE INTERIORES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4664','COMERCIO AL POR MENOR DE ARTÍCULOS USADOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4671','COMERCIO AL POR MENOR DE ARTÍCULOS DE FERRETERÍA, TLAPALERÍA Y VIDRIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4681','COMERCIO AL POR MENOR DE AUTOMÓVILES Y CAMIONETAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4682','COMERCIO AL POR MENOR DE PARTES Y REFACCIONES PARA AUTOMÓVILES, CAMIONETAS Y CAMIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4683','COMERCIO AL POR MENOR DE MOTOCICLETAS Y OTROS VEHÍCULOS DE MOTOR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4684','COMERCIO AL POR MENOR DE COMBUSTIBLES, ACEITES Y GRASAS LUBRICANTES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4691','INTERMEDIACIÓN AL POR MENOR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4692','COMERCIO AL POR MENOR POR MEDIOS MASIVOS DE COMUNICACIÓN Y OTROS MEDIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4811','TRANSPORTE AÉREO REGULAR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4812','TRANSPORTE AÉREO NO REGULAR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4821','TRANSPORTE POR FERROCARRIL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4831','TRANSPORTE MARÍTIMO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4832','TRANSPORTE POR AGUAS INTERIORES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4841','AUTOTRANSPORTE DE CARGA GENERAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4842','AUTOTRANSPORTE DE CARGA ESPECIALIZADO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4851','TRANSPORTE COLECTIVO DE PASAJEROS URBANO Y SUBURBANO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4852','TRANSPORTE DE PASAJEROS INTERURBANO Y RURAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4853','SERVICIO DE TAXIS Y LIMUSINAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4854','TRANSPORTE ESCOLAR Y DE PERSONAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4855','ALQUILER DE AUTOBUSES CON CHOFER',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4859','OTRO TRANSPORTE TERRESTRE DE PASAJEROS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4861','TRANSPORTE DE PETRÓLEO CRUDO POR DUCTOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4862','TRANSPORTE DE GAS NATURAL POR DUCTOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4869','TRANSPORTE POR DUCTOS DE OTROS PRODUCTOS ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4871','TRANSPORTE TURÍSTICO POR TIERRA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4872','TRANSPORTE TURÍSTICO POR AGUA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4879','OTRO TRANSPORTE TURÍSTICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4881','SERVICIOS RELACIONADOS CON EL TRANSPORTE AÉREO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4882','SERVICIOS RELACIONADOS CON EL TRANSPORTE POR FERROCARRIL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4883','SERVICIOS RELACIONADOS CON EL TRANSPORTE POR AGUA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4884','SERVICIOS RELACIONADOS CON EL TRANSPORTE POR CARRETERA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4885','SERVICIOS DE INTERMEDIACIÓN PARA EL TRANSPORTE DE CARGA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4889','OTROS SERVICIOS RELACIONADOS CON EL TRANSPORTE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4911','SERVICIOS POSTALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4921','SERVICIOS DE MENSAJERÍA Y PAQUETERÍA FORÁNEA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4922','SERVICIOS DE MENSAJERÍA Y PAQUETERÍA LOCAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('4931','SERVICIOS DE ALMACENAMIENTO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5111','EDICIÓN DE PERIÓDICOS, REVISTAS, LIBROS Y SIMILARES, EXCEPTO A TRAVÉS DE INTERNET',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5112','EDICIÓN DE SOFTWARE, EXCEPTO A TRAVÉS DE INTERNET ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5121','INDUSTRIA FÍLMICA Y DEL VIDEO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5122','INDUSTRIA DEL SONIDO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5151','TRANSMISIÓN DE PROGRAMAS DE RADIO Y TELEVISIÓN, EXCEPTO A TRAVÉS DE INTERNET',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5152','PRODUCCIÓN DE PROGRAMACIÓN DE CANALES PARA SISTEMAS DE TELEVISIÓN POR CABLE O SATELITALES, EXCEPTO A TRAVÉS DE INTERNET',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5161','CREACIÓN Y DIFUSIÓN DE CONTENIDO EXCLUSIVAMENTE A TRAVÉS DE INTERNET',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5171','TELEFONÍA TRADICIONAL, TELEGRAFÍA Y OTRAS TELECOMUNICACIONES ALÁMBRICAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5172','TELEFONÍA CELULAR Y OTRAS TELECOMUNICACIONES INALÁMBRICAS, EXCEPTO LOS SERVICIOS DE SATÉLITES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5173','REVENTA DE SERVICIOS DE TELECOMUNICACIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5174','SERVICIOS DE SATÉLITES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5175','DISTRIBUCIÓN POR SUSCRIPCIÓN DE PROGRAMAS DE TELEVISIÓN, EXCEPTO A TRAVÉS DE INTERNET',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5179','OTROS SERVICIOS DE TELECOMUNICACIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5181','PROVEEDORES DE ACCESO A INTERNET Y SERVICIOS DE BÚSQUEDA EN LA RED',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5182','PROCESAMIENTO ELECTRÓNICO DE INFORMACIÓN, HOSPEDAJE DE PÁGINAS WEB Y OTROS SERVICIOS RELACIONADOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5191','OTROS SERVICIOS DE INFORMACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5211','BANCA CENTRAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5221','BANCA MÚLTIPLE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5222','INSTITUCIONES FINANCIERAS DE FOMENTO ECONÓMICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5223','UNIONES DE CRÉDITO E INSTITUCIONES DE AHORRO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5224','OTRAS INSTITUCIONES DE INTERMEDIACIÓN CREDITICIA Y FINANCIERA NO BURSÁTIL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5225','SERVICIOS RELACIONADOS CON LA INTERMEDIACIÓN CREDITICIA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5231','CASAS DE BOLSA, CASAS DE CAMBIO Y CENTROS CAMBIARIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5232','BOLSA DE VALORES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5239','OTROS SERVICIOS DE INVERSIÓN E INTERMEDIACIÓN BURSÁTIL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5241','INSTITUCIONES DE SEGUROS Y FIANZAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5242','SERVICIOS RELACIONADOS CON LOS SEGUROS Y LAS FIANZAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5311','ALQUILER SIN INTERMEDIACIÓN DE VIVIENDAS Y OTROS INMUEBLES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5312','INMOBILIARIAS Y CORREDORES DE BIENES RAÍCES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5313','SERVICIOS RELACIONADOS CON LOS SERVICIOS INMOBILIARIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5321','ALQUILER DE AUTOMÓVILES, CAMIONES Y OTROS TRANSPORTES TERRESTRES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5322','ALQUILER DE ARTÍCULOS PARA EL HOGAR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5323','CENTROS GENERALES DE ALQUILER',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5324','ALQUILER DE MAQUINARIA Y EQUIPO INDUSTRIAL, COMERCIAL Y DE SERVICIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5331','SERVICIOS DE ALQUILER DE MARCAS REGISTRADAS, PATENTES Y FRANQUICIAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5411','SERVICIOS LEGALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5412','SERVICIOS DE CONTABILIDAD, AUDITORÍA Y SERVICIOS RELACIONADOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5413','SERVICIOS DE ARQUITECTURA, INGENIERÍA Y ACTIVIDADES RELACIONADAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5414','DISEÑO ESPECIALIZADO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5415','SERVICIOS DE CONSULTORÍA EN COMPUTACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5416','SERVICIOS DE CONSULTORÍA ADMINISTRATIVA, CIENTÍFICA Y TÉCNICA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5417','SERVICIOS DE INVESTIGACIÓN CIENTÍFICA Y DESARROLLO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5418','SERVICIOS DE PUBLICIDAD Y ACTIVIDADES RELACIONADAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5419','OTROS SERVICIOS PROFESIONALES, CIENTÍFICOS Y TÉCNICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5511','DIRECCIÓN DE CORPORATIVOS Y EMPRESAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5611','SERVICIOS DE ADMINISTRACIÓN DE NEGOCIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5612','SERVICIOS COMBINADOS DE APOYO EN INSTALACIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5613','SERVICIOS DE EMPLEO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5614','SERVICIOS DE APOYO SECRETARIAL, FOTOCOPIADO, COBRANZA, INVESTIGACIÓN CREDITICIA Y SIMILARES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5615','AGENCIAS DE VIAJES Y SERVICIOS DE RESERVACIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5616','SERVICIOS DE INVESTIGACIÓN, PROTECCIÓN Y SEGURIDAD',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5617','SERVICIOS DE LIMPIEZA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5619','OTROS SERVICIOS DE APOYO A LOS NEGOCIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('5621','MANEJO DE DESECHOS Y SERVICIOS DE REMEDIACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6111','ESCUELAS DE EDUCACIÓN BÁSICA, MEDIA Y ESPECIAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6112','ESCUELAS DE EDUCACIÓN POSTBACHILLERATO NO UNIVERSITARIA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6113','ESCUELAS DE EDUCACIÓN SUPERIOR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6114','ESCUELAS COMERCIALES, DE COMPUTACIÓN Y DE CAPACITACIÓN PARA EJECUTIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6115','ESCUELAS DE OFICIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6116','OTROS SERVICIOS EDUCATIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6117','SERVICIOS DE APOYO A LA EDUCACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6211','CONSULTORIOS MÉDICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6212','CONSULTORIOS DENTALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6213','OTROS CONSULTORIOS PARA EL CUIDADO DE LA SALUD',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6214','CENTROS PARA LA ATENCIÓN DE PACIENTES QUE NO REQUIEREN HOSPITALIZACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6215','LABORATORIOS MÉDICOS Y DE DIAGNÓSTICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6216','SERVICIOS DE ENFERMERÍA A DOMICILIO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6219','SERVICIOS DE AMBULANCIAS, DE BANCOS DE ÓRGANOS Y OTROS SERVICIOS AUXILIARES AL TRATAMIENTO MÉDICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6221','HOSPITALES GENERALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6222','HOSPITALES PSIQUIÁTRICOS Y PARA EL TRATAMIENTO POR ABUSO DE SUBSTANCIAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6223','HOSPITALES DE OTRAS ESPECIALIDADES MÉDICAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6231','RESIDENCIAS CON CUIDADOS DE ENFERMERAS PARA ENFERMOS CONVALECIENTES, EN REHABILITACIÓN, INCURABLES Y TERMINALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6232','RESIDENCIAS PARA EL CUIDADO DE PERSONAS CON PROBLEMAS DE RETARDO MENTAL, SALUD MENTAL Y ABUSO DE SUBSTANCIAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6233','ASILOS Y OTRAS RESIDENCIAS PARA EL CUIDADO DE ANCIANOS Y DISCAPACITADOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6239','ORFANATOS Y OTRAS RESIDENCIAS DE ASISTENCIA SOCIAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6241','SERVICIOS DE ORIENTACIÓN Y TRABAJO SOCIAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6242','SERVICIOS COMUNITARIOS DE ALIMENTACIÓN, REFUGIO Y DE EMERGENCIA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6243','SERVICIOS DE CAPACITACIÓN PARA EL TRABAJO PARA PERSONAS DESEMPLEADAS, SUBEMPLEADAS O DISCAPACITADAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('6244','GUARDERÍAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('7111','COMPAÑÍAS Y GRUPOS DE ESPECTÁCULOS ARTÍSTICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('7112','DEPORTISTAS Y EQUIPOS DEPORTIVOS PROFESIONALES Y SEMIPROFESIONALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('7113','PROMOTORES DE ESPECTÁCULOS ARTÍSTICOS, DEPORTIVOS Y SIMILARES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('7114','AGENTES Y REPRESENTANTES DE ARTISTAS, DEPORTISTAS Y SIMILARES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('7115','ARTISTAS Y TÉCNICOS INDEPENDIENTES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('7121','MUSEOS, SITIOS HISTÓRICOS, JARDINES BOTÁNICOS Y SIMILARES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('7131','PARQUES CON INSTALACIONES RECREATIVAS Y CASAS DE JUEGOS ELECTRÓNICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('7132','CASINOS, LOTERÍAS Y OTROS JUEGOS DE AZAR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('7139','OTROS SERVICIOS RECREATIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('7211','HOTELES, MOTELES Y SIMILARES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('7212','CAMPAMENTOS Y ALBERGUES RECREATIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('7213','PENSIONES Y CASAS DE HUÉSPEDES, Y DEPARTAMENTOS Y CASAS AMUEBLADOS CON SERVICIOS DE HOTELERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('7221','RESTAURANTES CON SERVICIO DE MESEROS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('7222','RESTAURANTES DE AUTOSERVICIO Y DE COMIDA PARA LLEVAR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('7223','SERVICIOS DE PREPARACIÓN DE ALIMENTOS POR ENCARGO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('7224','CENTROS NOCTURNOS, BARES, CANTINAS Y SIMILARES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('8111','REPARACIÓN Y MANTENIMIENTO DE AUTOMÓVILES Y CAMIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('8112','REPARACIÓN Y MANTENIMIENTO DE EQUIPO ELECTRÓNICO Y DE EQUIPO DE PRECISIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('8113','REPARACIÓN Y MANTENIMIENTO DE MAQUINARIA Y EQUIPO AGROPECUARIO, INDUSTRIAL, COMERCIAL Y DE SERVICIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('8114','REPARACIÓN Y MANTENIMIENTO DE ARTÍCULOS PARA EL HOGAR Y PERSONALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('8121','SALONES Y CLÍNICAS DE BELLEZA, BAÑOS PÚBLICOS Y BOLERÍAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('8122','LAVANDERÍAS Y TINTORERÍAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('8123','SERVICIOS FUNERARIOS Y ADMINISTRACIÓN DE CEMENTERIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('8124','ESTACIONAMIENTOS Y PENSIONES PARA AUTOMÓVILES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('8129','SERVICIOS DE REVELADO DE FOTOGRAFÍAS Y OTROS SERVICIOS PERSONALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('8131','ASOCIACIONES Y ORGANIZACIONES COMERCIALES, LABORALES, PROFESIONALES Y RECREATIVAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('8132','ASOCIACIONES Y ORGANIZACIONES RELIGIOSAS, POLÍTICAS Y CIVILES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('8141','HOGARES CON EMPLEADOS DOMÉSTICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('9311','ÓRGANOS LEGISLATIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('9312','ADMINISTRACIÓN PÚBLICA EN GENERAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('9313','REGULACIÓN Y FOMENTO DEL DESARROLLO ECONÓMICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('9314','IMPARTICIÓN DE JUSTICIA Y MANTENIMIENTO DE LA SEGURIDAD Y EL ORDEN PÚBLICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('9315','REGULACIÓN Y FOMENTO DE ACTIVIDADES PARA MEJORAR Y PRESERVAR EL MEDIO AMBIENTE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('9316','ACTIVIDADES ADMINISTRATIVAS DE INSTITUCIONES DE BIENESTAR SOCIAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('9317','RELACIONES EXTERIORES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('9318','ACTIVIDADES DE SEGURIDAD NACIONAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('9321','ORGANISMOS INTERNACIONALES Y EXTRATERRITORIALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11111','CULTIVO DE SOYA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11112','CULTIVO DE SEMILLAS OLEAGINOSAS, EXCEPTO SOYA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11113','CULTIVO DE LEGUMBRES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11114','CULTIVO DE TRIGO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11115','CULTIVO DE MAÍZ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11116','CULTIVO DE ARROZ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11119','CULTIVO DE OTROS GRANOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11121','CULTIVO DE HORTALIZAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11131','CULTIVO DE NARANJA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11132','CULTIVO DE OTROS CÍTRICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11133','CULTIVO DE FRUTALES NO CÍTRICOS Y NUECES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11141','CULTIVO DE PRODUCTOS ALIMENTICIOS EN INVERNADEROS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11142','CULTIVO EN VIVEROS, CULTIVOS NO ALIMENTICIOS EN INVERNADEROS Y FLORICULTURA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11191','CULTIVO DE TABACO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11192','CULTIVO DE ALGODÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11193','CULTIVO DE CAÑA DE AZÚCAR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11194','CULTIVO DE ALFALFA Y PASTOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11199','OTROS CULTIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11211','EXPLOTACIÓN DE BOVINOS PARA CARNE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11212','EXPLOTACIÓN DE BOVINOS PARA LECHE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11213','EXPLOTACIÓN DE BOVINOS SIN ESPECIALIZACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11221','EXPLOTACIÓN DE PORCINOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11231','EXPLOTACIÓN DE GALLINAS PONEDORAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11232','EXPLOTACIÓN DE POLLOS PARA CARNE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11233','EXPLOTACIÓN DE GUAJOLOTES O PAVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11234','PRODUCCIÓN DE AVES DE CORRAL EN INCUBADORA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11239','EXPLOTACIÓN DE OTRAS AVES PRODUCTORAS DE CARNE Y HUEVO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11241','EXPLOTACIÓN DE OVINOS Y EXPLOTACIÓN CONJUNTA DE OVINOS CON CAPRINOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11242','EXPLOTACIÓN DE CAPRINOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11251','ACUICULTURA ANIMAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11291','APICULTURA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11292','EXPLOTACIÓN DE ÉQUIDOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11293','CUNICULTURA Y EXPLOTACIÓN DE ANIMALES DE PIEL CON PELAJE FINO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11299','EXPLOTACIÓN DE OTROS ANIMALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11311','SILVICULTURA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11321','VIVEROS FORESTALES Y RECOLECCIÓN DE PRODUCTOS FORESTALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11331','TALA DE ÁRBOLES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11411','PESCA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11421','CAZA Y CAPTURA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11511','SERVICIOS RELACIONADOS CON LA AGRICULTURA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11521','SERVICIOS RELACIONADOS CON LA GANADERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('11531','SERVICIOS RELACIONADOS CON EL APROVECHAMIENTO FORESTAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('21111','EXTRACCIÓN DE PETRÓLEO Y GAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('21211','MINERÍA DE CARBÓN MINERAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('21221','MINERÍA DE HIERRO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('21222','MINERÍA DE ORO Y PLATA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('21223','MINERÍA DE COBRE, NÍQUEL, PLOMO Y ZINC',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('21229','MINERÍA DE OTROS MINERALES METÁLICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('21231','MINERÍA DE PIEDRA CALIZA, MÁRMOL Y OTRAS PIEDRAS DIMENSIONADAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('21232','MINERÍA DE ARENA, GRAVA, ARCILLA Y OTROS MINERALES REFRACTARIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('21239','MINERÍA DE OTROS MINERALES NO METÁLICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('21311','SERVICIOS RELACIONADOS CON LA MINERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('22111','GENERACIÓN Y TRANSMISIÓN DE ENERGÍA ELÉCTRICA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('22112','SUMINISTRO DE ENERGÍA ELÉCTRICA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('22211','CAPTACIÓN, TRATAMIENTO Y SUMINISTRO DE AGUA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('22221','SUMINISTRO DE GAS POR DUCTOS AL CONSUMIDOR FINAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23611','EDIFICACIÓN RESIDENCIAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23621','EDIFICACIÓN DE NAVES Y PLANTAS INDUSTRIALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23622','EDIFICACIÓN DE INMUEBLES COMERCIALES, INSTITUCIONALES Y DE SERVICIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23711','CONSTRUCCIÓN DE OBRAS PARA EL TRATAMIENTO, DISTRIBUCIÓN Y SUMINISTRO DE AGUA, DRENAJE Y RIEGO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23712','CONSTRUCCIÓN DE OBRAS PARA PETRÓLEO Y GAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23713','CONSTRUCCIÓN DE OBRAS DE GENERACIÓN Y CONDUCCIÓN DE ENERGÍA ELÉCTRICA Y TELECOMUNICACIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23721','DIVISIÓN DE TERRENOS Y CONSTRUCCIÓN DE OBRAS DE URBANIZACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23731','CONSTRUCCIÓN DE VÍAS DE COMUNICACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23799','OTRAS CONSTRUCCIONES DE INGENIERÍA CIVIL U OBRA PESADA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23811','TRABAJOS DE CIMENTACIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23812','MONTAJE DE ESTRUCTURAS PREFABRICADAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23813','TRABAJOS DE ALBAÑILERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23819','OTROS TRABAJOS EN EXTERIORES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23821','INSTALACIONES ELÉCTRICAS EN CONSTRUCCIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23822','INSTALACIONES HIDROSANITARIAS, DE GAS, AIRE ACONDICIONADO Y CALEFACCIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23829','OTRAS INSTALACIONES Y EQUIPAMIENTO EN CONSTRUCCIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23831','COLOCACIÓN DE MUROS FALSOS, AISLAMIENTO Y ENYESADO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23832','TRABAJOS DE PINTURA Y OTROS CUBRIMIENTOS DE PAREDES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23833','COLOCACIÓN DE PISOS FLEXIBLES Y DE MADERA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23834','COLOCACIÓN DE PISOS CERÁMICOS Y AZULEJOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23835','INSTALACIÓN DE PRODUCTOS DE CARPINTERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23839','OTROS TRABAJOS DE ACABADOS EN EDIFICACIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23891','PREPARACIÓN DE TERRENOS PARA LA CONSTRUCCIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('23899','OTROS TRABAJOS ESPECIALIZADOS PARA LA CONSTRUCCIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31111','ELABORACIÓN DE ALIMENTOS PARA ANIMALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31121','ELABORACIÓN DE PRODUCTOS DE MOLINERÍA Y MANUFACTURA DE MALTA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31122','ELABORACIÓN DE ALMIDONES, ACEITES Y GRASAS VEGETALES COMESTIBLES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31123','ELABORACIÓN DE CEREALES PARA EL DESAYUNO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31131','ELABORACIÓN DE AZÚCAR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31132','ELABORACIÓN DE CHOCOLATE Y PRODUCTOS DE CHOCOLATE A PARTIR DE CACAO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31133','ELABORACIÓN DE PRODUCTOS DE CHOCOLATE A PARTIR DE CHOCOLATE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31134','ELABORACIÓN DE DULCES, CHICLES Y PRODUCTOS DE CONFITERÍA QUE NO SEAN DE CHOCOLATE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31141','CONGELACIÓN DE FRUTAS, VERDURAS Y GUISOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31142','CONSERVACIÓN DE FRUTAS, VERDURAS Y GUISOS POR PROCESOS DISTINTOS A LA CONGELACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31151','ELABORACIÓN DE LECHE Y DERIVADOS LÁCTEOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31152','ELABORACIÓN DE HELADOS Y PALETAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31161','MATANZA, EMPACADO Y PROCESAMIENTO DE CARNE DE GANADO Y AVES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31171','PREPARACIÓN Y ENVASADO DE PESCADOS Y MARISCOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31181','ELABORACIÓN DE PAN Y OTROS PRODUCTOS DE PANADERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31182','ELABORACIÓN DE GALLETAS Y PASTAS PARA SOPA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31183','ELABORACIÓN DE TORTILLAS DE MAÍZ Y MOLIENDA DE NIXTAMAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31191','ELABORACIÓN DE BOTANAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31192','INDUSTRIAS DEL CAFÉ Y DEL TÉ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31193','ELABORACIÓN DE CONCENTRADOS, POLVOS, JARABES Y ESENCIAS DE SABOR PARA REFRESCOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31194','ELABORACIÓN DE CONDIMENTOS Y ADEREZOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31199','ELABORACIÓN DE OTROS ALIMENTOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31211','ELABORACIÓN DE REFRESCOS Y HIELO, Y PURIFICACIÓN DE AGUA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31212','ELABORACIÓN DE CERVEZA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31213','ELABORACIÓN DE BEBIDAS ALCOHÓLICAS A BASE DE UVA Y BEBIDAS FERMENTADAS, EXCEPTO CERVEZA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31214','ELABORACIÓN DE BEBIDAS DESTILADAS, EXCEPTO DE UVA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31221','BENEFICIO DEL TABACO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31222','ELABORACIÓN DE PRODUCTOS DE TABACO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31311','PREPARACIÓN E HILADO DE FIBRAS TEXTILES Y FABRICACIÓN DE HILOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31321','FABRICACIÓN DE TELAS ANCHAS DE TRAMA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31322','FABRICACIÓN DE TELAS ANGOSTAS DE TRAMA Y PASAMANERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31323','FABRICACIÓN DE TELAS NO TEJIDAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31324','FABRICACIÓN DE TELAS DE PUNTO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31331','ACABADO DE FIBRAS, HILADOS, HILOS Y TELAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31332','RECUBRIMIENTO DE TELAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31411','TEJIDO Y CONFECCIÓN DE ALFOMBRAS Y TAPETES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31412','CONFECCIÓN DE CORTINAS, BLANCOS Y SIMILARES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31491','CONFECCIÓN DE COSTALES Y PRODUCTOS DE TEXTILES RECUBIERTOS Y DE MATERIALES SUCEDÁNEOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31499','CONFECCIÓN DE OTROS PRODUCTOS TEXTILES, EXCEPTO PRENDAS DE VESTIR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31511','TEJIDO DE CALCETINES Y MEDIAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31519','TEJIDO DE OTRAS PRENDAS DE VESTIR DE PUNTO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31521','CONFECCIÓN DE ROPA DE CUERO, PIEL Y MATERIALES SUCEDÁNEOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31522','CONFECCIÓN DE ROPA DE MATERIALES TEXTILES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31599','CONFECCIÓN DE ACCESORIOS DE VESTIR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31611','CURTIDO Y ACABADO DE CUERO Y PIEL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31621','FABRICACIÓN DE CALZADO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('31699','FABRICACIÓN DE OTROS PRODUCTOS DE CUERO, PIEL Y MATERIALES SUCEDÁNEOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32111','ASERRADO Y CONSERVACIÓN DE LA MADERA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32121','FABRICACIÓN DE LAMINADOS Y AGLUTINADOS DE MADERA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32191','FABRICACIÓN DE PRODUCTOS DE MADERA PARA LA CONSTRUCCIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32192','FABRICACIÓN DE PRODUCTOS PARA EMBALAJE Y ENVASES DE MADERA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32199','FABRICACIÓN DE OTROS PRODUCTOS DE MADERA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32211','FABRICACIÓN DE CELULOSA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32212','FABRICACIÓN DE PAPEL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32213','FABRICACIÓN DE CARTÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32221','FABRICACIÓN DE ENVASES DE CARTÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32222','FABRICACIÓN DE BOLSAS DE PAPEL Y PRODUCTOS CELULÓSICOS RECUBIERTOS Y TRATADOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32223','FABRICACIÓN DE PRODUCTOS DE PAPELERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32229','FABRICACIÓN DE OTROS PRODUCTOS DE PAPEL Y CARTÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32311','IMPRESIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32312','INDUSTRIAS CONEXAS A LA IMPRESIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32411','REFINACIÓN DE PETRÓLEO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32412','FABRICACIÓN DE PRODUCTOS DE ASFALTO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32419','FABRICACIÓN DE OTROS PRODUCTOS DERIVADOS DEL PETRÓLEO Y DEL CARBÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32511','FABRICACIÓN DE PRODUCTOS PETROQUÍMICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32512','FABRICACIÓN DE GASES INDUSTRIALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32513','FABRICACIÓN DE PIGMENTOS Y COLORANTES SINTÉTICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32518','FABRICACIÓN DE OTROS PRODUCTOS QUÍMICOS BÁSICOS INORGÁNICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32519','FABRICACIÓN DE OTROS PRODUCTOS QUÍMICOS BÁSICOS ORGÁNICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32521','FABRICACIÓN DE HULES Y RESINAS SINTÉTICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32522','FABRICACIÓN DE FIBRAS QUÍMICAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32531','FABRICACIÓN DE FERTILIZANTES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32532','FABRICACIÓN DE PESTICIDAS Y AGROQUÍMICOS, EXCEPTO FERTILIZANTES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32541','FABRICACIÓN DE PRODUCTOS FARMACÉUTICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32551','FABRICACIÓN DE PINTURAS Y RECUBRIMIENTOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32552','FABRICACIÓN DE ADHESIVOS Y SELLADORES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32561','FABRICACIÓN DE JABONES, LIMPIADORES Y DENTÍFRICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32562','FABRICACIÓN DE COSMÉTICOS, PERFUMES Y OTRAS PREPARACIONES DE TOCADOR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32591','FABRICACIÓN DE TINTAS PARA IMPRESIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32592','FABRICACIÓN DE EXPLOSIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32599','FABRICACIÓN DE OTROS PRODUCTOS QUÍMICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32611','FABRICACIÓN DE BOLSAS Y PELÍCULAS DE PLÁSTICO FLEXIBLE SIN SOPORTE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32612','FABRICACIÓN DE PERFILES, TUBERÍA Y CONEXIONES DE PLÁSTICO RÍGIDO SIN SOPORTE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32613','FABRICACIÓN DE LAMINADOS RÍGIDOS DE PLÁSTICO SIN SOPORTE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32614','FABRICACIÓN DE ESPUMAS Y PRODUCTOS DE POLIESTIRENO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32615','FABRICACIÓN DE ESPUMAS Y PRODUCTOS DE URETANO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32616','FABRICACIÓN DE BOTELLAS DE PLÁSTICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32619','FABRICACIÓN DE OTROS PRODUCTOS DE PLÁSTICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32621','FABRICACIÓN Y REVITALIZACIÓN DE LLANTAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32622','FABRICACIÓN DE BANDAS Y MANGUERAS DE HULE Y DE PLÁSTICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32629','FABRICACIÓN DE OTROS PRODUCTOS DE HULE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32711','FABRICACIÓN DE ARTÍCULOS DE ALFARERÍA, PORCELANA, LOZA Y MUEBLES DE BAÑO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32712','FABRICACIÓN DE PRODUCTOS A BASE DE ARCILLA PARA LA CONSTRUCCIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32721','FABRICACIÓN DE VIDRIO Y PRODUCTOS DE VIDRIO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32731','FABRICACIÓN DE CEMENTO PARA LA CONSTRUCCIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32732','FABRICACIÓN DE CONCRETO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32733','FABRICACIÓN DE TUBOS Y BLOQUES DE CEMENTO Y CONCRETO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32739','FABRICACIÓN DE OTROS PRODUCTOS DE CEMENTO Y CONCRETO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32741','FABRICACIÓN DE CAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32742','FABRICACIÓN DE YESO Y PRODUCTOS DE YESO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32791','FABRICACIÓN DE PRODUCTOS ABRASIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('32799','FABRICACIÓN DE OTROS PRODUCTOS A BASE DE MINERALES NO METÁLICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33111','INDUSTRIA BÁSICA DEL HIERRO Y DEL ACERO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33121','FABRICACIÓN DE TUBOS Y POSTES DE HIERRO Y ACERO DE MATERIAL COMPRADO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33122','FABRICACIÓN DE OTROS PRODUCTOS DE HIERRO Y ACERO DE MATERIAL COMPRADO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33131','INDUSTRIA DEL ALUMINIO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33141','REFINACIÓN DE COBRE Y DE OTROS METALES NO FERROSOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33142','LAMINACIÓN SECUNDARIA DE COBRE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33149','LAMINACIÓN SECUNDARIA DE OTROS METALES NO FERROSOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33151','MOLDEO POR FUNDICIÓN DE PIEZAS DE HIERRO Y ACERO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33152','MOLDEO POR FUNDICIÓN DE PIEZAS METÁLICAS NO FERROSAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33211','FABRICACIÓN DE PRODUCTOS METÁLICOS FORJADOS Y TROQUELADOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33221','FABRICACIÓN DE HERRAMIENTAS DE MANO SIN MOTOR Y UTENSILIOS DE COCINA METÁLICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33231','FABRICACIÓN DE ESTRUCTURAS METÁLICAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33232','FABRICACIÓN DE PRODUCTOS DE HERRERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33241','FABRICACIÓN DE CALDERAS INDUSTRIALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33242','FABRICACIÓN DE TANQUES METÁLICOS DE CALIBRE GRUESO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33243','FABRICACIÓN DE ENVASES METÁLICOS DE CALIBRE LIGERO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33251','FABRICACIÓN DE HERRAJES Y CERRADURAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33261','FABRICACIÓN DE ALAMBRE, PRODUCTOS DE ALAMBRE Y RESORTES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33271','MAQUINADO DE PIEZAS METÁLICAS PARA MAQUINARIA Y EQUIPO EN GENERAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33272','FABRICACIÓN DE TORNILLOS, TUERCAS, REMACHES Y SIMILARES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33281','RECUBRIMIENTOS Y TERMINADOS METÁLICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33291','FABRICACIÓN DE VÁLVULAS METÁLICAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33299','FABRICACIÓN DE OTROS PRODUCTOS METÁLICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33311','FABRICACIÓN DE MAQUINARIA Y EQUIPO AGROPECUARIO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33312','FABRICACIÓN DE MAQUINARIA Y EQUIPO PARA LA CONSTRUCCIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33313','FABRICACIÓN DE MAQUINARIA Y EQUIPO PARA LA INDUSTRIA EXTRACTIVA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33321','FABRICACIÓN DE MAQUINARIA Y EQUIPO PARA LA INDUSTRIA DE LA MADERA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33322','FABRICACIÓN DE MAQUINARIA Y EQUIPO PARA LA INDUSTRIA DEL HULE Y DEL PLÁSTICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33329','FABRICACIÓN DE MAQUINARIA Y EQUIPO PARA OTRAS INDUSTRIAS MANUFACTURERAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33331','FABRICACIÓN DE MAQUINARIA Y EQUIPO PARA EL COMERCIO Y LOS SERVICIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33341','FABRICACIÓN DE SISTEMAS DE AIRE ACONDICIONADO, CALEFACCIÓN Y DE REFRIGERACIÓN INDUSTRIAL Y COMERCIAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33351','FABRICACIÓN DE MAQUINARIA Y EQUIPO PARA LA INDUSTRIA METALMECÁNICA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33361','FABRICACIÓN DE MOTORES DE COMBUSTIÓN INTERNA, TURBINAS Y TRANSMISIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33391','FABRICACIÓN DE BOMBAS Y SISTEMAS DE BOMBEO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33392','FABRICACIÓN DE MAQUINARIA Y EQUIPO PARA LEVANTAR Y TRASLADAR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33399','FABRICACIÓN DE OTRA MAQUINARIA Y EQUIPO PARA LA INDUSTRIA EN GENERAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33411','FABRICACIÓN DE COMPUTADORAS Y EQUIPO PERIFÉRICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33421','FABRICACIÓN DE APARATOS TELEFÓNICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33422','FABRICACIÓN DE EQUIPO DE TRANSMISIÓN Y RECEPCIÓN DE SEÑALES DE RADIO, TELEVISIÓN Y CABLE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33429','FABRICACIÓN DE OTROS EQUIPOS DE COMUNICACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33431','FABRICACIÓN DE EQUIPO DE AUDIO Y DE VIDEO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33441','FABRICACIÓN DE COMPONENTES ELECTRÓNICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33451','FABRICACIÓN DE INSTRUMENTOS DE NAVEGACIÓN, MEDICIÓN, MÉDICOS Y DE CONTROL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33461','FABRICACIÓN Y REPRODUCCIÓN DE MEDIOS MAGNÉTICOS Y ÓPTICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33511','FABRICACIÓN DE FOCOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33512','FABRICACIÓN DE LÁMPARAS ORNAMENTALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33521','FABRICACIÓN DE ENSERES ELECTRODOMÉSTICOS MENORES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33522','FABRICACIÓN DE APARATOS DE LÍNEA BLANCA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33531','FABRICACIÓN DE EQUIPO DE GENERACIÓN Y DISTRIBUCIÓN DE ENERGÍA ELÉCTRICA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33591','FABRICACIÓN DE ACUMULADORES Y PILAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33592','FABRICACIÓN DE CABLES DE CONDUCCIÓN ELÉCTRICA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33593','FABRICACIÓN DE ENCHUFES, CONTACTOS, FUSIBLES Y OTROS ACCESORIOS PARA INSTALACIONES ELÉCTRICAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33599','FABRICACIÓN DE OTROS PRODUCTOS ELÉCTRICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33611','FABRICACIÓN DE AUTOMÓVILES Y CAMIONETAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33612','FABRICACIÓN DE CAMIONES Y TRACTOCAMIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33621','FABRICACIÓN DE CARROCERÍAS Y REMOLQUES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33631','FABRICACIÓN DE MOTORES DE GASOLINA Y SUS PARTES PARA VEHÍCULOS AUTOMOTRICES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33632','FABRICACIÓN DE EQUIPO ELÉCTRICO Y ELECTRÓNICO PARA VEHÍCULOS AUTOMOTORES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33633','FABRICACIÓN DE PARTES DE SISTEMAS DE DIRECCIÓN Y DE SUSPENSIÓN PARA VEHÍCULOS AUTOMOTRICES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33634','FABRICACIÓN DE PARTES DE SISTEMAS DE FRENOS PARA VEHÍCULOS AUTOMOTRICES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33635','FABRICACIÓN DE PARTES DE SISTEMAS DE TRANSMISIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33636','FABRICACIÓN DE ASIENTOS PARA VEHÍCULOS AUTOMOTORES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33637','FABRICACIÓN DE PIEZAS METÁLICAS TROQUELADAS PARA VEHÍCULOS AUTOMOTRICES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33639','FABRICACIÓN DE OTRAS PARTES PARA VEHÍCULOS AUTOMOTRICES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33641','FABRICACIÓN DE EQUIPO AEROESPACIAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33651','FABRICACIÓN DE EQUIPO FERROVIARIO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33661','FABRICACIÓN DE EMBARCACIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33699','FABRICACIÓN DE OTRO EQUIPO DE TRANSPORTE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33711','FABRICACIÓN DE COCINAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33712','FABRICACIÓN DE MUEBLES, EXCEPTO COCINAS Y MUEBLES DE OFICINA Y ESTANTERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33721','FABRICACIÓN DE MUEBLES DE OFICINA Y ESTANTERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33791','FABRICACIÓN DE COLCHONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33792','FABRICACIÓN DE PERSIANAS Y CORTINEROS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33911','FABRICACIÓN DE EQUIPO Y MATERIAL PARA USO MÉDICO, DENTAL Y PARA LABORATORIO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33991','METALISTERÍA Y JOYERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33992','FABRICACIÓN DE ARTÍCULOS DEPORTIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33993','FABRICACIÓN DE JUGUETES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33994','FABRICACIÓN DE ARTÍCULOS Y ACCESORIOS PARA ESCRITURA, PINTURA, DIBUJO Y ACTIVIDADES DE OFICINA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33995','FABRICACIÓN DE ANUNCIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('33999','OTRAS INDUSTRIAS MANUFACTURERAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43111','COMERCIO AL POR MAYOR DE ABARROTES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43112','COMERCIO AL POR MAYOR DE CARNES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43113','COMERCIO AL POR MAYOR DE FRUTAS Y VERDURAS FRESCAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43114','COMERCIO AL POR MAYOR DE HUEVO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43115','COMERCIO AL POR MAYOR DE SEMILLAS Y GRANOS ALIMENTICIOS, ESPECIAS Y CHILES SECOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43116','COMERCIO AL POR MAYOR DE LECHE Y OTROS PRODUCTOS LÁCTEOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43117','COMERCIO AL POR MAYOR DE EMBUTIDOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43118','COMERCIO AL POR MAYOR DE DULCES Y MATERIAS PRIMAS PARA REPOSTERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43119','COMERCIO AL POR MAYOR DE OTROS ALIMENTOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43121','COMERCIO AL POR MAYOR DE BEBIDAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43122','COMERCIO AL POR MAYOR DE CIGARROS, PUROS Y TABACO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43211','COMERCIO AL POR MAYOR DE PRODUCTOS TEXTILES, EXCEPTO ROPA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43212','COMERCIO AL POR MAYOR DE ROPA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43213','COMERCIO AL POR MAYOR DE CALZADO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43311','COMERCIO AL POR MAYOR DE PRODUCTOS FARMACÉUTICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43321','COMERCIO AL POR MAYOR DE ARTÍCULOS DE PERFUMERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43322','COMERCIO AL POR MAYOR DE ARTÍCULOS DE JOYERÍA Y OTROS ACCESORIOS DE VESTIR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43331','COMERCIO AL POR MAYOR DE DISCOS, JUGUETES Y ARTÍCULOS DEPORTIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43341','COMERCIO AL POR MAYOR DE ARTÍCULOS DE PAPELERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43342','COMERCIO AL POR MAYOR DE LIBROS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43343','COMERCIO AL POR MAYOR DE REVISTAS Y PERIÓDICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43351','COMERCIO AL POR MAYOR DE ELECTRODOMÉSTICOS MENORES Y APARATOS DE LÍNEA BLANCA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43411','COMERCIO AL POR MAYOR DE MATERIAS PRIMAS AGROPECUARIAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43421','COMERCIO AL POR MAYOR DE MATERIALES PARA LA CONSTRUCCIÓN, EXCEPTO DE MADERA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43422','COMERCIO AL POR MAYOR DE MATERIAS PRIMAS PARA OTRAS INDUSTRIAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43431','COMERCIO AL POR MAYOR DE MATERIALES DE DESECHO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43511','COMERCIO AL POR MAYOR DE MAQUINARIA Y EQUIPO AGROPECUARIO, FORESTAL Y PARA LA PESCA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43521','COMERCIO AL POR MAYOR DE MAQUINARIA Y EQUIPO PARA LA CONSTRUCCIÓN Y LA MINERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43522','COMERCIO AL POR MAYOR DE MAQUINARIA Y EQUIPO PARA LA INDUSTRIA MANUFACTURERA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43531','COMERCIO AL POR MAYOR DE MAQUINARIA Y EQUIPO PARA LOS SERVICIOS Y PARA ACTIVIDADES COMERCIALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43541','COMERCIO AL POR MAYOR DE MAQUINARIA, MOBILIARIO Y EQUIPO DE USO GENERAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43611','COMERCIO AL POR MAYOR DE CAMIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43711','INTERMEDIACIÓN AL POR MAYOR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('43721','COMERCIO AL POR MAYOR POR MEDIOS MASIVOS DE COMUNICACIÓN Y OTROS MEDIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46111','COMERCIO AL POR MENOR EN TIENDAS DE ABARROTES, ULTRAMARINOS Y MISCELÁNEAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46112','COMERCIO AL POR MENOR DE CARNES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46113','COMERCIO AL POR MENOR DE FRUTAS Y VERDURAS FRESCAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46114','COMERCIO AL POR MENOR DE HUEVO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46115','COMERCIO AL POR MENOR DE SEMILLAS Y GRANOS ALIMENTICIOS, ESPECIAS Y CHILES SECOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46116','COMERCIO AL POR MENOR DE LECHE PROCESADA, OTROS PRODUCTOS LÁCTEOS Y EMBUTIDOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46117','COMERCIO AL POR MENOR DE DULCES Y MATERIAS PRIMAS PARA REPOSTERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46119','COMERCIO AL POR MENOR DE OTROS ALIMENTOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46121','COMERCIO AL POR MENOR DE BEBIDAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46122','COMERCIO AL POR MENOR DE CIGARROS, PUROS Y TABACO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46211','COMERCIO AL POR MENOR EN TIENDAS DE AUTOSERVICIO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46221','COMERCIO AL POR MENOR EN TIENDAS DEPARTAMENTALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46311','COMERCIO AL POR MENOR DE PRODUCTOS TEXTILES, EXCEPTO ROPA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46321','COMERCIO AL POR MENOR DE ROPA Y ACCESORIOS DE VESTIR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46331','COMERCIO AL POR MENOR DE CALZADO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46411','COMERCIO AL POR MENOR DE PRODUCTOS FARMACÉUTICOS Y NATURISTAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46412','COMERCIO AL POR MENOR DE LENTES Y APARATOS ORTOPÉDICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46511','COMERCIO AL POR MENOR DE ARTÍCULOS DE PERFUMERÍA Y JOYERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46521','COMERCIO AL POR MENOR DE ARTÍCULOS PARA EL ESPARCIMIENTO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46531','COMERCIO AL POR MENOR DE ARTÍCULOS DE PAPELERÍA, LIBROS Y PERIÓDICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46591','COMERCIO AL POR MENOR DE MASCOTAS, REGALOS, ARTÍCULOS RELIGIOSOS, ARTESANÍAS, ARTÍCULOS EN TIENDAS IMPORTADORAS Y OTROS ARTÍCULOS DE USO PERSONAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46611','COMERCIO AL POR MENOR DE MUEBLES PARA EL HOGAR Y OTROS ENSERES DOMÉSTICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46621','COMERCIO AL POR MENOR DE COMPUTADORAS, TELÉFONOS Y OTROS APARATOS DE COMUNICACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46631','COMERCIO AL POR MENOR DE ARTÍCULOS PARA LA DECORACIÓN DE INTERIORES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46641','COMERCIO AL POR MENOR DE ARTÍCULOS USADOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46711','COMERCIO AL POR MENOR DE ARTÍCULOS DE FERRETERÍA, TLAPALERÍA Y VIDRIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46811','COMERCIO AL POR MENOR DE AUTOMÓVILES Y CAMIONETAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46821','COMERCIO AL POR MENOR DE PARTES Y REFACCIONES PARA AUTOMÓVILES, CAMIONETAS Y CAMIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46831','COMERCIO AL POR MENOR DE MOTOCICLETAS Y OTROS VEHÍCULOS DE MOTOR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46841','COMERCIO AL POR MENOR DE COMBUSTIBLES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46842','COMERCIO AL POR MENOR DE ACEITES Y GRASAS LUBRICANTES, ADITIVOS Y SIMILARES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46911','INTERMEDIACIÓN AL POR MENOR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('46921','COMERCIO AL POR MENOR POR MEDIOS MASIVOS DE COMUNICACIÓN Y OTROS MEDIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48111','TRANSPORTE AÉREO REGULAR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48121','TRANSPORTE AÉREO NO REGULAR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48211','TRANSPORTE POR FERROCARRIL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48311','TRANSPORTE MARÍTIMO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48321','TRANSPORTE POR AGUAS INTERIORES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48411','AUTOTRANSPORTE LOCAL DE CARGA GENERAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48412','AUTOTRANSPORTE FORÁNEO DE CARGA GENERAL ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48421','SERVICIO DE MUDANZAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48422','AUTOTRANSPORTE LOCAL DE CARGA ESPECIALIZADO, EXCEPTO MUDANZAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48423','AUTOTRANSPORTE FORÁNEO DE CARGA ESPECIALIZADO, EXCEPTO MUDANZAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48511','TRANSPORTE COLECTIVO DE PASAJEROS URBANO Y SUBURBANO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48521','TRANSPORTE DE PASAJEROS INTERURBANO Y RURAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48531','SERVICIO DE TAXIS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48532','SERVICIO DE LIMUSINAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48541','TRANSPORTE ESCOLAR Y DE PERSONAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48551','ALQUILER DE AUTOBUSES CON CHOFER',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48599','OTRO TRANSPORTE TERRESTRE DE PASAJEROS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48611','TRANSPORTE DE PETRÓLEO CRUDO POR DUCTOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48621','TRANSPORTE DE GAS NATURAL POR DUCTOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48691','TRANSPORTE POR DUCTOS DE PRODUCTOS REFINADOS DEL PETRÓLEO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48699','TRANSPORTE POR DUCTOS DE OTROS PRODUCTOS, EXCEPTO DE PRODUCTOS REFINADOS DEL PETRÓLEO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48711','TRANSPORTE TURÍSTICO POR TIERRA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48721','TRANSPORTE TURÍSTICO POR AGUA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48799','OTRO TRANSPORTE TURÍSTICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48811','OPERACIONES AEROPORTUARIAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48819','OTROS SERVICIOS RELACIONADOS CON EL TRANSPORTE AÉREO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48821','SERVICIOS RELACIONADOS CON EL TRANSPORTE POR FERROCARRIL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48831','ADMINISTRACIÓN DE PUERTOS Y MUELLES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48832','SERVICIOS DE CARGA Y DESCARGA PARA EL TRANSPORTE POR AGUA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48833','SERVICIOS PARA LA NAVEGACIÓN POR AGUA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48839','OTROS SERVICIOS RELACIONADOS CON EL TRANSPORTE POR AGUA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48841','REMOLQUE DE VEHÍCULOS DE MOTOR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48849','OTROS SERVICIOS RELACIONADOS CON EL TRANSPORTE POR CARRETERA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48851','SERVICIOS DE INTERMEDIACIÓN PARA EL TRANSPORTE DE CARGA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('48899','OTROS SERVICIOS RELACIONADOS CON EL TRANSPORTE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('49111','SERVICIOS POSTALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('49211','SERVICIOS DE MENSAJERÍA Y PAQUETERÍA FORÁNEA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('49221','SERVICIOS DE MENSAJERÍA Y PAQUETERÍA LOCAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('49311','ALMACENAMIENTO GENERAL SIN INSTALACIONES ESPECIALIZADAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('49312','ALMACENAMIENTO CON REFRIGERACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('49313','ALMACENAMIENTO DE PRODUCTOS AGROPECUARIOS QUE NO REQUIEREN REFRIGERACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('49319','OTROS SERVICIOS DE ALMACENAMIENTO CON INSTALACIONES ESPECIALIZADAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51111','EDICIÓN DE PERIÓDICOS, EXCEPTO A TRAVÉS DE INTERNET',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51112','EDICIÓN DE REVISTAS Y OTRAS PUBLICACIONES PERIÓDICAS, EXCEPTO A TRAVÉS DE INTERNET',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51113','EDICIÓN DE LIBROS, EXCEPTO A TRAVÉS DE INTERNET',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51114','EDICIÓN DE DIRECTORIOS Y DE LISTAS DE CORREO, EXCEPTO A TRAVÉS DE INTERNET',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51119','EDICIÓN DE OTROS MATERIALES, EXCEPTO A TRAVÉS DE INTERNET',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51121','EDICIÓN DE SOFTWARE, EXCEPTO A TRAVÉS DE INTERNET',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51211','PRODUCCIÓN DE PELÍCULAS CINEMATOGRÁFICAS, VIDEOS, PROGRAMAS PARA LA TELEVISIÓN Y OTROS MATERIALES AUDIOVISUALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51212','DISTRIBUCIÓN DE PELÍCULAS CINEMATOGRÁFICAS, VIDEOS Y OTROS MATERIALES AUDIOVISUALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51213','EXHIBICIÓN DE PELÍCULAS CINEMATOGRÁFICAS, VIDEOS Y OTROS MATERIALES AUDIOVISUALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51219','SERVICIOS DE POSTPRODUCCIÓN Y OTROS SERVICIOS PARA LA INDUSTRIA FÍLMICA Y DEL VIDEO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51221','PRODUCTORAS DISCOGRÁFICAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51222','PRODUCCIÓN Y DISTRIBUCIÓN DE DISCOS Y CINTAS MAGNETOFÓNICAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51223','EDITORAS DE MÚSICA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51224','GRABACIÓN DE DISCOS Y CINTAS MAGNETOFÓNICAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51229','OTROS SERVICIOS DE GRABACIÓN DEL SONIDO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51511','TRANSMISIÓN DE PROGRAMAS DE RADIO, EXCEPTO A TRAVÉS DE INTERNET',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51512','TRANSMISIÓN DE PROGRAMAS DE TELEVISIÓN, EXCEPTO A TRAVÉS DE INTERNET',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51521','PRODUCCIÓN DE PROGRAMACIÓN DE CANALES PARA SISTEMAS DE TELEVISIÓN POR CABLE O SATELITALES, EXCEPTO A TRAVÉS DE INTERNET',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51611','CREACIÓN Y DIFUSIÓN DE CONTENIDO EXCLUSIVAMENTE A TRAVÉS DE INTERNET',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51711','TELEFONÍA TRADICIONAL, TELEGRAFÍA Y OTRAS TELECOMUNICACIONES ALÁMBRICAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51721','TELEFONÍA CELULAR Y OTRAS TELECOMUNICACIONES INALÁMBRICAS, EXCEPTO LOS SERVICIOS DE SATÉLITES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51731','REVENTA DE SERVICIOS DE TELECOMUNICACIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51741','SERVICIOS DE SATÉLITES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51751','DISTRIBUCIÓN POR SUSCRIPCIÓN DE PROGRAMAS DE TELEVISIÓN, EXCEPTO A TRAVÉS DE INTERNET',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51791','OTROS SERVICIOS DE TELECOMUNICACIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51811','PROVEEDORES DE ACCESO A INTERNET Y SERVICIOS DE BÚSQUEDA EN LA RED',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51821','PROCESAMIENTO ELECTRÓNICO DE INFORMACIÓN, HOSPEDAJE DE PÁGINAS WEB Y OTROS SERVICIOS RELACIONADOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51911','AGENCIAS NOTICIOSAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51912','BIBLIOTECAS Y ARCHIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('51919','OTROS SERVICIOS DE SUMINISTRO DE INFORMACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52111','BANCA CENTRAL ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52211','BANCA MÚLTIPLE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52221','BANCA DE DESARROLLO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52222','FONDOS Y FIDEICOMISOS FINANCIEROS PARA EL DESARROLLO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52231','UNIONES DE CRÉDITO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52232','CAJAS DE AHORRO POPULAR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52239','OTRAS INSTITUCIONES DE AHORRO Y PRÉSTAMO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52241','ARRENDADORAS FINANCIERAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52242','COMPAÑÍAS DE FACTORAJE FINANCIERO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52243','SOCIEDADES FINANCIERAS DE OBJETO LIMITADO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52244','COMPAÑÍAS DE AUTOFINANCIAMIENTO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52245','MONTEPÍOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52249','OTRAS INSTITUCIONES DE INTERMEDIACIÓN CREDITICIA Y FINANCIERA NO BURSÁTIL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52251','SERVICIOS RELACIONADOS CON LA INTERMEDIACIÓN CREDITICIA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52311','CASAS DE BOLSA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52312','CASAS DE CAMBIO Y CENTROS CAMBIARIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52321','BOLSA DE VALORES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52391','SOCIEDADES DE INVERSIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52392','ASESORÍA EN INVERSIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52399','OTROS SERVICIOS RELACIONADOS CON LA INTERMEDIACIÓN BURSÁTIL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52411','COMPAÑÍAS ESPECIALIZADAS EN SEGUROS DE VIDA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52412','COMPAÑÍAS DE SEGUROS NO ESPECIALIZADAS EN SEGUROS DE VIDA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52413','FONDOS DE ASEGURAMIENTO CAMPESINO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52414','COMPAÑÍAS AFIANZADORAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52421','AGENTES, AJUSTADORES Y GESTORES DE SEGUROS Y FIANZAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('52422','ADMINISTRACIÓN DE CAJAS DE PENSIÓN Y DE SEGUROS INDEPENDIENTES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('53111','ALQUILER SIN INTERMEDIACIÓN DE VIVIENDAS Y OTROS INMUEBLES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('53121','INMOBILIARIAS Y CORREDORES DE BIENES RAÍCES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('53131','SERVICIOS RELACIONADOS CON LOS SERVICIOS INMOBILIARIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('53211','ALQUILER DE AUTOMÓVILES SIN CHOFER',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('53212','ALQUILER DE CAMIONES DE CARGA, AUTOBUSES Y REMOLQUES SIN CHOFER',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('53221','ALQUILER DE APARATOS ELÉCTRICOS Y ELECTRÓNICOS PARA EL HOGAR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('53222','ALQUILER DE ROPA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('53223','ALQUILER DE VIDEOCASETES Y DISCOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('53229','ALQUILER DE OTROS ARTÍCULOS PARA EL HOGAR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('53231','CENTROS GENERALES DE ALQUILER',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('53241','ALQUILER DE MAQUINARIA Y EQUIPO PARA CONSTRUCCIÓN, MINERÍA, ACTIVIDADES FORESTALES Y TRANSPORTE, EXCEPTO TERRESTRE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('53242','ALQUILER DE EQUIPO DE CÓMPUTO Y DE OTRAS MÁQUINAS Y MOBILIARIO DE OFICINA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('53249','ALQUILER DE OTRA MAQUINARIA Y EQUIPO INDUSTRIAL, COMERCIAL Y DE SERVICIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('53311','SERVICIOS DE ALQUILER DE MARCAS REGISTRADAS, PATENTES Y FRANQUICIAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54111','BUFETES JURÍDICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54112','NOTARÍAS PÚBLICAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54119','SERVICIOS DE APOYO PARA EFECTUAR TRÁMITES LEGALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54121','SERVICIOS DE CONTABILIDAD, AUDITORÍA Y SERVICIOS RELACIONADOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54131','SERVICIOS DE ARQUITECTURA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54132','SERVICIOS DE ARQUITECTURA DE PAISAJE Y URBANISMO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54133','SERVICIOS DE INGENIERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54134','SERVICIOS DE DIBUJO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54135','SERVICIOS DE INSPECCIÓN DE EDIFICIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54136','SERVICIOS DE LEVANTAMIENTO GEOFÍSICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54137','SERVICIOS DE ELABORACIÓN DE MAPAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54138','LABORATORIOS DE PRUEBAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54141','DISEÑO Y DECORACIÓN DE INTERIORES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54142','DISEÑO INDUSTRIAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54143','DISEÑO GRÁFICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54149','DISEÑO DE MODAS Y OTROS DISEÑOS ESPECIALIZADOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54151','SERVICIOS DE CONSULTORÍA EN COMPUTACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54161','SERVICIOS DE CONSULTORÍA EN ADMINISTRACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54162','SERVICIOS DE CONSULTORÍA EN MEDIO AMBIENTE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54169','OTROS SERVICIOS DE CONSULTORÍA CIENTÍFICA Y TÉCNICA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54171','SERVICIOS DE INVESTIGACIÓN Y DESARROLLO EN CIENCIAS FÍSICAS, DE LA VIDA E INGENIERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54172','SERVICIOS DE INVESTIGACIÓN Y DESARROLLO EN CIENCIAS SOCIALES Y HUMANIDADES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54181','AGENCIAS DE PUBLICIDAD',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54182','AGENCIAS DE RELACIONES PÚBLICAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54183','AGENCIAS DE COMPRA DE MEDIOS A PETICIÓN DEL CLIENTE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54184','AGENCIAS DE REPRESENTACIÓN DE MEDIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54185','AGENCIAS DE ANUNCIOS PUBLICITARIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54186','AGENCIAS DE PUBLICIDAD QUE OPERAN POR CORREO DIRECTO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54187','DISTRIBUCIÓN DE MATERIAL PUBLICITARIO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54189','OTROS SERVICIOS DE PUBLICIDAD',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54191','SERVICIOS DE INVESTIGACIÓN DE MERCADOS Y ENCUESTAS DE OPINIÓN PÚBLICA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54192','SERVICIOS DE FOTOGRAFÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54193','SERVICIOS DE TRADUCCIÓN E INTERPRETACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54194','SERVICIOS VETERINARIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('54199','OTROS SERVICIOS PROFESIONALES, CIENTÍFICOS Y TÉCNICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('55111','DIRECCIÓN DE CORPORATIVOS Y EMPRESAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56111','SERVICIOS DE ADMINISTRACIÓN DE NEGOCIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56121','SERVICIOS COMBINADOS DE APOYO EN INSTALACIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56131','AGENCIAS DE COLOCACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56132','AGENCIAS DE EMPLEO TEMPORAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56133','SUMINISTRO DE PERSONAL PERMANENTE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56141','SERVICIOS DE PREPARACIÓN DE DOCUMENTOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56142','SERVICIOS DE CASETAS TELEFÓNICAS, RECEPCIÓN DE LLAMADAS Y PROMOCIÓN POR TELÉFONO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56143','SERVICIOS DE FOTOCOPIADO, FAX Y AFINES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56144','AGENCIAS DE COBRANZA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56145','DESPACHOS DE INVESTIGACIÓN DE SOLVENCIA FINANCIERA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56149','OTROS SERVICIOS DE APOYO SECRETARIAL Y SIMILARES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56151','AGENCIAS DE VIAJES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56152','ORGANIZACIÓN DE EXCURSIONES Y PAQUETES TURÍSTICOS PARA AGENCIAS DE VIAJES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56159','OTROS SERVICIOS DE RESERVACIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56161','SERVICIOS DE INVESTIGACIÓN Y DE PROTECCIÓN Y CUSTODIA, EXCEPTO MEDIANTE MONITOREO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56162','SERVICIOS DE PROTECCIÓN Y CUSTODIA MEDIANTE EL MONITOREO DE SISTEMAS DE SEGURIDAD',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56171','SERVICIOS DE CONTROL Y EXTERMINACIÓN DE PLAGAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56172','SERVICIOS DE LIMPIEZA DE INMUEBLES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56173','SERVICIOS DE INSTALACIÓN Y MANTENIMIENTO DE ÁREAS VERDES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56174','SERVICIOS DE LIMPIEZA DE TAPICERÍA, ALFOMBRAS Y MUEBLES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56179','OTROS SERVICIOS DE LIMPIEZA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56191','SERVICIOS DE EMPACADO Y ETIQUETADO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56192','ORGANIZADORES DE CONVENCIONES Y FERIAS COMERCIALES E INDUSTRIALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56199','OTROS SERVICIOS DE APOYO A LOS NEGOCIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('56211','MANEJO DE DESECHOS Y SERVICIOS DE REMEDIACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('61111','ESCUELAS DE EDUCACIÓN PREESCOLAR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('61112','ESCUELAS DE EDUCACIÓN PRIMARIA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('61113','ESCUELAS DE EDUCACIÓN SECUNDARIA GENERAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('61114','ESCUELAS DE EDUCACIÓN SECUNDARIA TÉCNICA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('61115','ESCUELAS DE EDUCACIÓN MEDIA TÉCNICA TERMINAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('61116','ESCUELAS DE EDUCACIÓN MEDIA SUPERIOR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('61117','ESCUELAS QUE COMBINAN DIVERSOS NIVELES DE EDUCACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('61118','ESCUELAS DE EDUCACIÓN ESPECIAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('61121','ESCUELAS DE EDUCACIÓN POSTBACHILLERATO NO UNIVERSITARIA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('61131','ESCUELAS DE EDUCACIÓN SUPERIOR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('61141','ESCUELAS COMERCIALES Y SECRETARIALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('61142','ESCUELAS DE COMPUTACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('61143','ESCUELAS PARA LA CAPACITACIÓN DE EJECUTIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('61151','ESCUELAS DE OFICIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('61161','ESCUELAS DE ARTE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('61162','ESCUELAS DE DEPORTE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('61163','ESCUELAS DE IDIOMAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('61169','OTROS SERVICIOS EDUCATIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('61171','SERVICIOS DE APOYO A LA EDUCACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62111','CONSULTORIOS MÉDICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62121','CONSULTORIOS DENTALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62131','CONSULTORIOS DE QUIROPRÁCTICA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62132','CONSULTORIOS DE OPTOMETRÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62133','CONSULTORIOS DE PSICOLOGÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62134','CONSULTORIOS DE AUDIOLOGÍA Y DE TERAPIA OCUPACIONAL, FÍSICA Y DEL LENGUAJE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62139','OTROS CONSULTORIOS PARA EL CUIDADO DE LA SALUD',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62141','CENTROS DE PLANIFICACIÓN FAMILIAR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62142','CENTROS DE ATENCIÓN MÉDICA EXTERNA PARA ENFERMOS MENTALES Y ADICTOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62149','OTROS CENTROS PARA LA ATENCIÓN DE PACIENTES QUE NO REQUIEREN HOSPITALIZACIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62151','LABORATORIOS MÉDICOS Y DE DIAGNÓSTICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62161','SERVICIOS DE ENFERMERÍA A DOMICILIO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62191','SERVICIOS DE AMBULANCIAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62199','SERVICIOS DE BANCOS DE ÓRGANOS, DE BANCOS DE SANGRE Y OTROS SERVICIOS AUXILIARES AL TRATAMIENTO MÉDICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62211','HOSPITALES GENERALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62221','HOSPITALES PSIQUIÁTRICOS Y PARA EL TRATAMIENTO POR ABUSO DE SUBSTANCIAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62231','HOSPITALES DE OTRAS ESPECIALIDADES MÉDICAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62311','RESIDENCIAS CON CUIDADOS DE ENFERMERAS PARA ENFERMOS CONVALECIENTES, EN REHABILITACIÓN, INCURABLES Y TERMINALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62321','RESIDENCIAS PARA EL CUIDADO DE PERSONAS CON PROBLEMAS DE RETARDO MENTAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62322','RESIDENCIAS PARA EL CUIDADO DE PERSONAS CON PROBLEMAS DE SALUD MENTAL Y ABUSO DE SUBSTANCIAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62331','ASILOS Y OTRAS RESIDENCIAS PARA EL CUIDADO DE ANCIANOS Y DISCAPACITADOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62399','ORFANATOS Y OTRAS RESIDENCIAS DE ASISTENCIA SOCIAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62411','SERVICIOS DE ORIENTACIÓN Y TRABAJO SOCIAL PARA LA NIÑEZ Y LA JUVENTUD',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62412','CENTROS DE ATENCIÓN Y CUIDADO DIURNO DE ANCIANOS Y DISCAPACITADOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62419','OTROS SERVICIOS DE ORIENTACIÓN Y TRABAJO SOCIAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62421','SERVICIOS DE ALIMENTACIÓN COMUNITARIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62422','REFUGIOS TEMPORALES COMUNITARIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62423','SERVICIOS DE EMERGENCIA COMUNITARIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62431','SERVICIOS DE CAPACITACIÓN PARA EL TRABAJO PARA PERSONAS DESEMPLEADAS, SUBEMPLEADAS O DISCAPACITADAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('62441','GUARDERÍAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71111','COMPAÑÍAS DE TEATRO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71112','COMPAÑÍAS DE DANZA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71113','CANTANTES Y GRUPOS MUSICALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71119','OTRAS COMPAÑÍAS Y GRUPOS DE ESPECTÁCULOS ARTÍSTICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71121','DEPORTISTAS Y EQUIPOS DEPORTIVOS PROFESIONALES Y SEMIPROFESIONALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71131','PROMOTORES CON INSTALACIONES PARA LA PRESENTACIÓN DE ESPECTÁCULOS ARTÍSTICOS, DEPORTIVOS Y SIMILARES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71132','PROMOTORES DE ESPECTÁCULOS ARTÍSTICOS, DEPORTIVOS Y SIMILARES QUE NO CUENTAN CON INSTALACIONES PARA PRESENTARLOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71141','AGENTES Y REPRESENTANTES DE ARTISTAS, DEPORTISTAS Y SIMILARES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71151','ARTISTAS Y TÉCNICOS INDEPENDIENTES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71211','MUSEOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71212','SITIOS HISTÓRICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71213','JARDINES BOTÁNICOS Y ZOOLÓGICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71219','GRUTAS, PARQUES NATURALES Y OTROS SITIOS DEL PATRIMONIO NACIONAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71311','PARQUES CON INSTALACIONES RECREATIVAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71312','CASAS DE JUEGOS ELECTRÓNICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71321','CASINOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71329','LOTERÍAS Y OTROS JUEGOS DE AZAR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71391','CAMPOS DE GOLF',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71392','PISTAS PARA ESQUIAR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71393','MARINAS TURÍSTICAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71394','CLUBES DEPORTIVOS, BALNEARIOS Y CENTROS DE ACONDICIONAMIENTO FÍSICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71395','BOLICHES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('71399','OTROS SERVICIOS RECREATIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('72111','HOTELES Y MOTELES, EXCEPTO HOTELES CON CASINO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('72112','HOTELES CON CASINO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('72119','CABAÑAS, VILLAS Y SIMILARES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('72121','CAMPAMENTOS Y ALBERGUES RECREATIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('72131','PENSIONES Y CASAS DE HUÉSPEDES, Y DEPARTAMENTOS Y CASAS AMUEBLADOS CON SERVICIOS DE HOTELERÍA',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('72211','RESTAURANTES CON SERVICIO DE MESEROS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('72221','RESTAURANTES DE AUTOSERVICIO Y DE COMIDA PARA LLEVAR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('72231','SERVICIOS DE COMEDOR PARA EMPRESAS E INSTITUCIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('72232','SERVICIOS DE PREPARACIÓN DE ALIMENTOS PARA OCASIONES ESPECIALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('72233','SERVICIOS DE PREPARACIÓN DE ALIMENTOS EN UNIDADES MÓVILES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('72241','CENTROS NOCTURNOS, BARES, CANTINAS Y SIMILARES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81111','REPARACIÓN MECÁNICA Y ELÉCTRICA DE AUTOMÓVILES Y CAMIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81112','HOJALATERÍA, TAPICERÍA Y OTRAS REPARACIONES A LA CARROCERÍA DE AUTOMÓVILES Y CAMIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81119','OTROS SERVICIOS DE REPARACIÓN Y MANTENIMIENTO DE AUTOMÓVILES Y CAMIONES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81121','REPARACIÓN Y MANTENIMIENTO DE EQUIPO ELECTRÓNICO Y DE EQUIPO DE PRECISIÓN',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81131','REPARACIÓN Y MANTENIMIENTO DE MAQUINARIA Y EQUIPO AGROPECUARIO, INDUSTRIAL, COMERCIAL Y DE SERVICIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81141','REPARACIÓN Y MANTENIMIENTO DE APARATOS ELÉCTRICOS PARA EL HOGAR Y PERSONALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81142','REPARACIÓN DE TAPICERÍA DE MUEBLES PARA EL HOGAR',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81143','REPARACIÓN DE CALZADO Y OTROS ARTÍCULOS DE PIEL Y CUERO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81149','REPARACIÓN Y MANTENIMIENTO DE OTROS ARTÍCULOS PARA EL HOGAR Y PERSONALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81211','SALONES Y CLÍNICAS DE BELLEZA Y PELUQUERÍAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81212','BAÑOS PÚBLICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81213','SANITARIOS PÚBLICOS Y BOLERÍAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81221','LAVANDERÍAS Y TINTORERÍAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81231','SERVICIOS FUNERARIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81232','ADMINISTRACIÓN DE CEMENTERIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81241','ESTACIONAMIENTOS Y PENSIONES PARA AUTOMÓVILES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81291','SERVICIOS DE REVELADO DE FOTOGRAFÍAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81299','OTROS SERVICIOS PERSONALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81311','ASOCIACIONES, ORGANIZACIONES Y CÁMARAS DE PRODUCTORES, COMERCIANTES Y PRESTADORES DE SERVICIOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81312','ASOCIACIONES Y ORGANIZACIONES LABORALES Y SINDICALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81313','ASOCIACIONES Y ORGANIZACIONES DE PROFESIONISTAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81314','FEDERACIONES Y OTRAS ASOCIACIONES REGULATORIAS DE ACTIVIDADES RECREATIVAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81321','ASOCIACIONES Y ORGANIZACIONES RELIGIOSAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81322','ASOCIACIONES Y ORGANIZACIONES POLÍTICAS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81323','ASOCIACIONES Y ORGANIZACIONES CIVILES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('81411','HOGARES CON EMPLEADOS DOMÉSTICOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93111','ÓRGANOS LEGISLATIVOS',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93121','ADMINISTRACIÓN PÚBLICA FEDERAL EN GENERAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93122','ADMINISTRACIÓN PÚBLICA ESTATAL EN GENERAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93123','ADMINISTRACIÓN PÚBLICA MUNICIPAL EN GENERAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93131','REGULACIÓN Y FOMENTO FEDERAL DEL DESARROLLO ECONÓMICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93132','REGULACIÓN Y FOMENTO ESTATAL DEL DESARROLLO ECONÓMICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93133','REGULACIÓN Y FOMENTO MUNICIPAL DEL DESARROLLO ECONÓMICO',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93141','IMPARTICIÓN DE JUSTICIA Y MANTENIMIENTO DE LA SEGURIDAD Y EL ORDEN PÚBLICO EN EL NIVEL FEDERAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93142','IMPARTICIÓN DE JUSTICIA Y MANTENIMIENTO DE LA SEGURIDAD Y EL ORDEN PÚBLICO EN EL NIVEL ESTATAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93143','IMPARTICIÓN DE JUSTICIA Y MANTENIMIENTO DE LA SEGURIDAD Y EL ORDEN PÚBLICO EN EL NIVEL MUNICIPAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93151','REGULACIÓN Y FOMENTO FEDERAL DE ACTIVIDADES PARA MEJORAR Y PRESERVAR EL MEDIO AMBIENTE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93152','REGULACIÓN Y FOMENTO ESTATAL DE ACTIVIDADES PARA MEJORAR Y PRESERVAR EL MEDIO AMBIENTE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93153','REGULACIÓN Y FOMENTO MUNICIPAL DE ACTIVIDADES PARA MEJORAR Y PRESERVAR EL MEDIO AMBIENTE',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93161','ACTIVIDADES ADMINISTRATIVAS FEDERALES DE INSTITUCIONES DE BIENESTAR SOCIAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93162','ACTIVIDADES ADMINISTRATIVAS ESTATALES DE INSTITUCIONES DE BIENESTAR SOCIAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93163','ACTIVIDADES ADMINISTRATIVAS MUNICIPALES DE INSTITUCIONES DE BIENESTAR SOCIAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93171','RELACIONES EXTERIORES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93181','ACTIVIDADES DE SEGURIDAD NACIONAL',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93211','ORGANISMOS INTERNACIONALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('93212','SEDES DIPLOMÁTICAS Y OTRAS UNIDADES EXTRATERRITORIALES',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111110','Siembra, cultivo y cosecha de soya',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111121','Siembra, cultivo y cosecha de cártamo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111122','Siembra, cultivo y cosecha de girasol',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111129','Siembra, cultivo y cosecha anual de otras semillas oleaginosas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111131','Siembra, cultivo y cosecha de frijol',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111132','Siembra, cultivo y cosecha de garbanzo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111139','Siembra, cultivo y cosecha de otras legumbres',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111140','Siembra, cultivo y cosecha de trigo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111151','Siembra, cultivo y cosecha de maíz grano',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111152','Siembra, cultivo y cosecha de maíz forrajero',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111160','Siembra, cultivo y cosecha de arroz',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111191','Siembra, cultivo y cosecha de sorgo grano',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111192','Siembra, cultivo y cosecha de avena grano',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111193','Siembra, cultivo y cosecha de cebada grano',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111194','Siembra, cultivo y cosecha de sorgo forrajero',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111195','Siembra, cultivo y cosecha de avena forrajera',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111199','Siembra, cultivo y cosecha de otros cereales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111211','Siembra, cultivo y cosecha de jitomate o tomate rojo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111212','Siembra, cultivo y cosecha de chile',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111213','Siembra, cultivo y cosecha de cebolla',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111214','Siembra, cultivo y cosecha de melón o sandía',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111215','Siembra, cultivo y cosecha de tomate verde',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111216','Siembra, cultivo y cosecha de papa',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111217','Siembra, cultivo y cosecha de calabacita',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111219','Siembra, cultivo y cosecha de otras hortalizas y semillas de hortalizas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111310','Siembra, cultivo y cosecha de naranja',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111321','Siembra, cultivo y cosecha de limón',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111329','Siembra, cultivo y cosecha de cítricos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111331','Siembra, cultivo y cosecha de café',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111332','Siembra, cultivo y cosecha de plátano',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111333','Siembra, cultivo y cosecha de mango',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111334','Siembra, cultivo y cosecha de aguacate',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111335','Siembra, cultivo y cosecha de uva',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111336','Siembra, cultivo y cosecha de manzana',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111337','Siembra, cultivo y cosecha de cacao',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111339','Siembra, cultivo y cosecha de otros frutales no cítricos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111410','Siembra, cultivo y cosecha de productos alimenticios en invernaderos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111421','Siembra, cultivo y cosecha de flores a cielo abierto',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111422','Siembra, cultivo y cosecha de flores en invernadero',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111423','Siembra, cultivo y cosecha de árboles de Navidad y de especies maderables de ciclos productivos de 10 años o menos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111429','Siembra, cultivo y cosecha de otros cultivos en invernaderos y viveros',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111910','Siembra, cultivo y cosecha de tabaco',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111920','Siembra, cultivo y cosecha de algodón',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111930','Siembra, cultivo y cosecha de caña de azúcar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111941','Siembra, cultivo y cosecha de alfalfa',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111942','Siembra, cultivo y cosecha de trébol, pastos y zacates',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111991','Siembra, cultivo y cosecha de coco y coquito de aceite',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111992','Siembra, cultivo y cosecha de cacahuate',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111993','Siembra, cultivo y cosecha de agave o maguey tequilero',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('111999','Siembra, cultivo y cosecha de otros cultivos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112110','Cría y engorda de vacas, reses o novillos para venta de su carne',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112120','Cría y engorda de vacas, reses o novillos para venta de leche',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112130','Cría y engorda de vacas, reses o novillos para su venta',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112211','Cría y engorda de cerdos en granja',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112212','Cría y engorda de cerdos en patios y lugares distintos a granjas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112311','Cría y engorda de gallinas ponedoras de huevo para reproducción',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112312','Cría y engorda de gallinas ponedoras de huevo para consumo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112320','Cría y engorda de pollos para venta de su carne',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112330','Cría y engorda de guajolotes o pavos para la venta de su carne y producción de huevo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112340','Producción de aves de corral en incubadora',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112390','Cría y engorda de otras aves para venta de su carne y producción de huevo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112411','Cría y engorda de borregos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112412','Cría y engorda de borregos en forma conjunta con cabras o chivos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112420','Cría y engorda de cabras o chivos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112511','Cría, fomento y cuidado de camarones ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112519','Cría, cultivo, fomento y cuidado de animales acuáticos, excepto camarones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112910','Explotación, recolección y venta de miel de abeja y otros productos derivados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112920','Cría y engorda de caballos, mulas, burros y otros équidos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112930','Cría y explotación de animales de piel con pelaje fino',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('112990','Cría y explotación de otros animales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('113110','Actividades forestales como plantación, reforestación y conservación, con el propósito de realizar la venta en pie de árboles maderables',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('113211','Cultivo de especies forestales para tareas de reforestación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('113212','Recolección de productos forestales como gomas, resinas, rizomas, fibras y heno. recolección de frutas silvestres y plantas medicinales y raíces',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('113310','Tala de árboles, desbastado y el descortezado de troncos y la producción de trozas, astillas y rajas de madera',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('114111','Pesca de camarón',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('114112','Pesca de atunes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('114113','Pesca de sardina y anchoveta',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('114119','Pesca de otras especies',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('114210','Caza y captura de animales en su hábitat natural y Operación y administración de reservas para caza (como los ranchos cinegéticos)',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('115111','Servicios de fumigación agrícola',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('115112','Despepite de algodón',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('115113','Beneficio de productos agrícolas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('115119','Otros servicios relacionados con la agricultura',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('115119','Administración de empresas o negocios agrícolas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('115210','Servicios relacionados con la ganadería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('115210','Administración de empresas o negocios ganaderos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('115310','Servicios relacionados con el aprovechamiento forestal',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('115310','Administración de empresas o negocios forestales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('211110','Extracción de petróleo crudo y a la extracción de hidrocarburos crudos en estado gaseoso (gas natural)',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212110','Minería de carbón mineral',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212210','Minería de hierro',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212221','Minería de oro',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212222','Minería de plata',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212231','Minería de cobre y níquel',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212232','Minería de plomo y zinc',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212291','Minería de manganeso',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212292','Minería de mercurio y antimonio',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212293','Minería de uranio y minerales radiactivos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212299','Minería de otros minerales metálicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212311','Minería de piedra de cal',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212312','Minería de mármol',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212319','Minería de otras piedras dimensionadas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212321','Minería de arena y grava para la construcción',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212322','Minería de tezontle y tepetate',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212323','Minería de feldespato',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212324','Minería de sílice',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212325','Minería de caolín',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212329','Minería de otras arcillas y otros minerales refractarios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212391','Extracción y explotación de sal',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212392','Minería de piedra de yeso',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212393','Minería de barita',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212394','Minería de roca fosfórica',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212395','Minería de fluorita',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212396','Minería de grafito',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212397','Minería de azufre',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212398','Minería de minerales no metálicos para productos químicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('212399','Minería de otros minerales no metálicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('213111','Perforación de pozos petroleros y de gas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('213119','Servicios de explotación o prospección minera y desmantelamiento de torres de perforación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('221110','Generación y transmisión de energía eléctrica',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('221120','Suministro de energía eléctrica a los consumidores finales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('222111','Captación, tratamiento y suministro de agua para uso distinto al doméstico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('222111','Captación, tratamiento y suministro de agua para uso doméstico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('222112','Captación, tratamiento y suministro de agua para uso distinto al doméstico realizados por particulares',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('222112','Captación, tratamiento y suministro de agua para uso doméstico realizados por particulares',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('222210','Suministro de gas por ductos al consumidor final',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('236111','Construcción de vivienda unifamiliar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('236112','Construcción de vivienda multifamiliar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('236113','Administración y supervisión de construcción de vivienda',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('236211','Construcción de naves y plantas industriales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('236212','Administración y supervisión de Construcción de naves y plantas industriales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('236221','Construcción de inmuebles comerciales, institucionales y de servicios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('236222','Administración y supervisión de Construcción de inmuebles comerciales, institucionales y de servicios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237111','Construcción de obras para el tratamiento, distribución y suministro de agua y drenaje',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237111','Construcción de obras para el suministro de agua realizados para el sector agrícola o ganadero',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237112','Construcción de sistemas de riego agrícola',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237113','Administración y supervisión de construcción de obras para el tratamiento, distribución y suministro de agua, drenaje y riego',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237121','Construcción de obras relacionadas con la distribución de petróleo y gas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237122','Construcción de plantas de refinación de petróleo, de procesamiento de gas natural y de petroquímica',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237123','Administración y supervisión de construcción de obras para petróleo y gas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237131','Construcción de obras de generación y conducción de energía eléctrica',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237132','Construcción de obras para telecomunicaciones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237133','Administración y supervisión de construcción de obras de generación y conducción de energía eléctrica y telecomunicaciones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237211','División de terrenos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237212','Construcción de obras de urbanización',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237213','Administración y supervisión de división de terrenos y de construcción de obras de urbanización',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237311','Instalación de señalamientos y protecciones de obras viales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237312','Construcción de carreteras, autopistas, terracerías, puentes, pasos a desnivel y aeropistas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237313','Administración y supervisión de construcción de vías de comunicación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237991','Construcción de presas y represas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237992','Construcción de obras marítimas, fluviales y subacuáticas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237993','Construcción de obras para transporte eléctrico y ferroviario',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237994','Administración y supervisión de construcción de otras obras de ingeniería civil u obra pesada',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('237999','Otras construcciones de ingeniería civil u obra pesada',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238110','Trabajos de cimentaciones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238121','Montaje de estructuras de concreto prefabricadas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238122','Montaje de estructuras de acero prefabricadas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238130','Trabajos de albañilería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238190','Otros trabajos en exteriores no clasificados en otra parte',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238210','Instalaciones eléctricas en construcciones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238221','Instalaciones hidrosanitarias y de gas en construcciones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238222','Instalaciones de sistemas centrales de aire acondicionado y calefacción',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238290','Otras instalaciones y equipamiento en construcciones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238290','Explotación de concesiones, permisos, autorizaciones o contratos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238290','Explotación del subsuelo sujetos a regímenes fiscales preferentes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238290','Explotación del subsuelo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238290','Participación en productos del subsuelo sujetos a regímenes fiscales preferentes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238290','Participación en productos del subsuelo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238290','Venta de terreno',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238290','Enajenación de arena, grava, piedra, tierra y otros bienes muebles provenientes del suelo ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238311','Colocación de muros falsos y aislamiento',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238312','Trabajos de enyesado, empastado y tiroleado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238320','Trabajos de pintura y otros cubrimientos de paredes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238330','Colocación de pisos flexibles (como alfombras, linóleos y vinilos) y pisos de madera (como parquet, duela y tablón colonial)',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238340','Colocación de pisos cerámicos y azulejos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238350','Instalación de productos de carpintería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238390','Otros trabajos de acabados en edificaciones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238910','Preparación de terrenos para la construcción',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('238990','Otros trabajos especializados para la construcción',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311110','Elaboración de alimentos para animales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311211','Beneficio del arroz',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311212','Elaboración de harina de trigo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311213','Elaboración de harina de maíz',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311214','Elaboración de harina de otros productos agrícolas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311215','Elaboración de malta',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311221','Elaboración de féculas y otros almidones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311222','Elaboración de aceites y grasas vegetales comestibles',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311230','Elaboración de cereales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311311','Elaboración y refinación de azúcar de caña',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311319','Elaboración de otros azúcares como de piloncillo o panela y azúcar de remolacha',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311320','Elaboración de chocolate y productos de chocolate a partir de cacao',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311330','Elaboración de productos de chocolate a partir de chocolate',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311340','Elaboración de dulces, chicles y productos de confitería que no sean de chocolate',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311411','Congelación de frutas y verduras',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311411','Congelación de jugos, néctares y concentrados de frutas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311412','Congelación de guisos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311421','Deshidratación de frutas y verduras',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311422','Conservación de frutas y verduras por procesos distintos a la congelación y la deshidratación. Incluye la elaboración de jugos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311423','Conservación de guisos por procesos distintos a la congelación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311511','Tratamiento y envasado de leche líquida',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311512','Elaboración de leche en polvo, condensada y evaporada',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311513','Elaboración de derivados y fermentos lácteos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311520','Elaboración de helados y paletas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311611','Matanza de ganado y aves',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311612','Corte y empacado de carne de ganado y aves',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311613','Preparación de embutidos y otras conservas de carne de ganado y aves',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311613','Preparación de embutidos y otras conservas de carne de ganado y aves',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311614','Elaboración de manteca y otras grasas animales comestibles',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311710','Preparación y envasado de pescados y mariscos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311811','Panificación industrial',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311812','Panificación tradicional',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311820','Elaboración de galletas, pastas para sopa y harinas premezcladas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311830','Elaboración de tortillas de maíz y molienda de nixtamal',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311910','Elaboración de botanas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311921','Beneficio del café',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311922','Tostado y molienda de café',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311923','Elaboración de café soluble',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311924','Preparación y envasado de té',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311930','Elaboración de concentrados, polvos, jarabes y esencias de sabor para preparar refrescos, bebidas hidratantes o rehidratantes que no utilizan en dicha elaboración como edulcorante únicamente la caña de azúcar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311930','Elaboración de colorantes y saborizantes naturales para alimentos, o cualquier producto distinto a refrescos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311930','Productor, envasador o fabricante de concentrados o jarabes para preparar refresco que se expanda en envase abierto utilizando aparatos automáticos, eléctricos o mecánicos que no utilizan en su elaboración como edulcorante únicamente la caña de azúcar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311930','Elaboración de concentrados, polvos, jarabes y esencias de sabor para preparar refrescos, bebidas hidratantes o rehidratantes que utilizan en dicha elaboración como edulcorante únicamente caña de azúcar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311930','Productor, envasador o fabricante de concentrados o jarabes para preparar refrescos que se expandan en envases abiertos utilizando aparatos automáticos, eléctricos o mecánicos que utilizan en dicha elaboración como edulcorante únicamente caña de azúcar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311940','Elaboración de condimentos y aderezos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311991','Elaboración de postres en polvo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311992','Elaboración de levadura',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311993','Elaboración de alimentos frescos para consumo inmediato',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('311999','Elaboración de otros alimentos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312111','Productor, envasador o fabricante de refrescos que no utiliza en su elaboración como edulcorante únicamente la caña de azúcar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312111','Productor, envasador o fabricante de bebidas hidratantes o rehidratantes que no utiliza en su elaboración como edulcorante únicamente la caña de azúcar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312111','Productor, envasador o fabricante de refrescos que utiliza en dicha elaboración como edulcorante únicamente caña de azúcar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312111','Productor, envasador o fabricante de bebidas hidratantes o rehidratantes que utiliza en dicha elaboración como edulcorante únicamente caña de azúcar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312112','Purificación de agua (por filtración, pasteurización, ósmosis inversa, etc.)',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312113','Elaboración de hielo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312120','Producción, fabricación o envasado de de cerveza',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312120','Producción y envasado de cerveza con una graduación alcohólica de más de 20º G.L.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312120','Fabricantes, productores, envasadores o importadores que enajenan o importan cerveza en envases reutilizables',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312120','Fabricantes, productores, envasadores o importadores que enajenan o importan cerveza de 20º G.L en envases reutilizables',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312131','Producción, fabricación o envasado de vinos de mesa',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312131','Producción, fabricación, o envasado de bebidas refrescantes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312131','Producción, fabricación, o envasado de otras bebidas a base de uva',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312131','Producción, fabricación, o envasado de vinos de mesa con una graduación alcohólica de más de 20º G.L.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312131','Producción, fabricación, o envasado de bebidas refrescantes con una graduación alcohólica de más de 20º G.L.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312131','Producción, fabricación, o envasado de otras bebidas a base de uva con una graduación alcohólica de más de 20º G.L.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312132','Producción, fabricación o envasado de aguamiel y pulque',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312139','Producción, fabricación, o envasado de sidra y otras bebidas fermentadas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312139','Producción, fabricación, o envasado de sidra y otras bebidas fermentadas con una graduación alcohólica de más de 20º G.L.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312141','Producción, fabricación, o envasado de ron y otras bebidas destiladas de caña',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312141','Producción, fabricación, o envasado de ron y otras bebidas destiladas de caña con una graduación alcohólica de más de 20º G.L.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312142','Producción, fabricación, o envasado de bebidas destiladas de agave',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312142','Producción, fabricación, o envasado de bebidas destiladas de agave con una graduación alcohólica de más de 20º G.L..',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312143','Producción, fabricación o envasado de alcohol o alcohol desnaturalizado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312143','Producción, fabricación o envasado de mieles incristalizables para transformarlas en alcohol',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312143','Venta de alcohol y alcohol desnaturalizado a hospitales en envases de hasta 20 litros',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312143','Venta de alcohol y alcohol desnaturalizado a público en general en envases de hasta 1 litro',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312143','Venta de mieles incristalizables que no se utilicen para transformarlas en alcohol',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312143','Venta de mieles incristalizables para transformarlas en alcohol',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312143','Venta de alcohol y alcohol desnaturalizado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312143','Producción, fabricación o envasado de mieles incristalizables que no se utilizarán para transformarlas en alcohol',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312149','Producción, fabricación o envasado de otras bebidas destiladas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312210','Beneficio del tabaco',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312221','Elaboración, fabricación y producción de cigarros',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('312222','Elaboración, fabricación y producción de puros y otros tabacos labrados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('313111','Preparación e hilado de fibras duras naturales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('313111','Preparación, tejido y anudado de fibras de ixtle, palma y lechuguilla',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('313112','Preparación e hilado de fibras blandas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('313113','Fabricación de hilos para coser y bordar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('313210','Fabricación de telas anchas de trama',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('313220','Fabricación de telas angostas de trama y pasamanería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('313230','Fabricación de telas no tejidas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('313240','Fabricación de telas de punto',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('313310','Acabado de fibras, hilados, hilos y telas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('313320','Recubrimiento de telas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('314110','Tejido y confección de alfombras y tapetes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('314120','Confección de cortinas, blancos y similares',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('314911','Confección de costales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('314912','Confección de productos de textiles recubiertos y de materiales sucedáneos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('314991','Confección de productos bordados y deshilados como servilletas, manteles, rebozos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('314992','Fabricación de redes y otros productos de cordelería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('314993','Fabricación de productos textiles reciclados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('314999','Fabricación de banderas y otros productos confeccionados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('315110','Tejido de calcetines y medias',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('315191','Tejido de ropa interior de punto',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('315192','Tejido de ropa exterior de punto',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('315210','Confección de ropa (chamarras, sacos, faldas, abrigos) de cuero, piel y materiales sucedáneos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('315221','Confección en serie de ropa interior y de dormir',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('315222','Confección en serie de camisas y guayaberas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('315223','Confección en serie de uniformes (escolares, industriales, etc.) y ropa de trabajo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('315224','Confección en serie de ropa especial: artística, disfraces, trajes típicos, trajes de torero, hábitos religiosos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('315225','Confección de ropa sobre medida',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('315229','Confección de otra ropa de materiales textiles',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('315991','Fabricación de sombreros, gorras, cachuchas, boinas, viseras y otros accesorios similares hechos a base de materiales diversos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('315999','Confección de otros accesorios de vestir',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('316110','Curtido y acabado de cuero y piel',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('316211','Fabricación de calzado con corte de piel y cuero',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('316212','Fabricación de calzado con corte de tela',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('316213','Fabricación de calzado de plástico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('316214','Fabricación de calzado de hule',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('316219','Fabricación de huaraches, calzado tejido y de otro tipo de materiales no clasificados en otra parte',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('316991','Fabricación de bolsos de mano, maletas y similares',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('316992','Fabricación de artículos de talabartería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('321111','Aserraderos integrados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('321112','Aserrado de tablas y tablones. Corte de tablas y tablones a partir de la madera en rollo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('321113','Tratamiento de la madera y producción de postes y durmientes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('321210','Fabricación de laminados y aglutinados de madera',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('321910','Fabricación de productos de madera para la construcción, como puertas, ventanas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('321920','Fabricación de productos para embalaje y envases de madera',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('321991','Fabricación de productos de materiales trenzables como vara, carrizo, mimbre, excepto palma',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('321992','Fabricación de artículos y utensilios de madera para el hogar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('321993','Fabricación de productos de madera de uso industrial',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('321999','Fabricación de otros productos de madera',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('322110','Fabricación de celulosa a partir de madera, bagazo y materiales reciclables como papel, cartón y textiles',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('322121','Fabricación de celulosa, papel y productos de papel en plantas integradas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('322122','Fabricación de papel a partir de celulosa',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('322131','Fabricación de cartón en plantas integradas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('322132','Fabricación de cartón y cartoncillo a partir de celulosa',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('322210','Fabricación de envases de cartón',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('322220','Fabricación de bolsas de papel y productos celulósicos recubiertos y tratados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('322230','Fabricación de productos de papelería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('322291','Fabricación de pañales desechables y productos sanitarios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('322299','Fabricación de otros productos de papel y cartón',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('323111','Impresión de libros, periódicos y revistas por contrato',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('323119','Impresión de formas continuas y otros impresos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('323120','Industrias conexas a la impresión, como la encuadernación y la elaboración de placas, clichés, grabados y otros productos similares',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('324110','Refinación de petróleo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('324110','Producción, elaboración de gasolina y diesel ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('324110','Venta de gasolina y diesel',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('324120','Fabricación de productos de asfalto',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('324191','Fabricación de aceites y grasas lubricantes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('324199','Fabricación de coque y otros productos derivados del petróleo y del carbón',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325110','Fabricación de productos petroquímicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325120','Fabricación de gases industriales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325130','Fabricación de pigmentos y colorantes sintéticos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325180','Fabricación de otros productos químicos básicos inorgánicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325190','Fabricación de otros productos químicos básicos orgánicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325211','Fabricación de resinas sintéticas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325212','Fabricación de hules sintéticos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325220','Fabricación de fibras químicas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325310','Fabricación de fertilizantes destinados para ser utilizados en la agricultura o ganadería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325310','Fabricación de fertilizantes domésticos o industriales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325320','Fabricación de pesticidas y agroquímicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325320','Fabricación de pesticidas, excepto fertilizantes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325411','Fabricación de materias primas para la industria farmacéutica',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325412','Fabricación de preparaciones farmacéuticas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325510','Fabricación de pinturas y recubrimientos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325520','Fabricación de adhesivos o pegamentos, selladores, impermeabilizantes, masillas, resanadores, gomas-cemento y similares',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325610','Fabricación de jabones, limpiadores y dentífricos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325620','Fabricación de cosméticos, perfumes y otras preparaciones de tocador',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325910','Fabricación de tintas para impresión',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325920','Fabricación de explosivos y sus accesorios (fusibles de seguridad, detonantes)',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325991','Fabricación de cerillos o fósforos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325992','Fabricación de películas, placas, productos químicos para fotografía, telas y papel fotosensible para fotografía, cinematografía, artes gráficas y rayos X',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325993','Fabricación de resinas plásticas hechas a partir de plásticos reciclados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('325999','Fabricación de otros productos químicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('326110','Fabricación de bolsas y películas de plástico flexible sin soporte para envase o empaque y tela plástica sin soporte',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('326120','Fabricación de productos de plástico rígido con forma específica, sin soporte o sin reforzamiento, como tuberías, conexiones y perfiles',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('326130','Fabricación de laminados rígidos de plástico sin soporte',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('326140','Fabricación de espumas y productos de poliestireno, como vasos, platos, bloques aislantes, tableros y productos para embalaje',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('326150','Fabricación de espumas y productos de uretano',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('326160','Fabricación de botellas, botellones y frascos de plástico. Incluye la fabricación de preformas de botellas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('326191','Fabricación de artículos de plástico para el hogar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('326192','Fabricación de autopartes de plástico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('326193','Fabricación de envases y contenedores de plástico. Incluye la fabricación de tapas y tarimas de plástico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('326194','Fabricación de partes y piezas de plástico sin reforzamiento para las industrias eléctrica, electrónica, química, textil y para otras industrias',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('326195','Fabricación de otros artículos de plástico reforzado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('326199','Fabricación de otros productos de plástico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('326211','Fabricación de llantas y cámaras',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('326212','Revitalización (recauchutado) de llantas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('326220','Fabricación de bandas, mangueras de uso industrial y doméstico de hule y de plástico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('326290','Fabricación de otros productos de hule',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327111','Fabricación de artículos de alfarería, porcelana y loza ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327112','Fabricación de muebles de baño',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327121','Fabricación de ladrillos no refractarios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327122','Fabricación de azulejos y losetas no refractarias y azulejos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327123','Fabricación de productos refractarios arcillosos y no arcillosos, como moldes, ladrillos, losetas y baldosas refractarios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327211','Fabricación de vidrio',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327212','Fabricación de espejos (planos, cóncavos y convexos)',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327213','Fabricación de envases y ampolletas de vidrio',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327214','Fabricación de fibra de vidrio',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327215','Fabricación de vasos, jarras, platos, charolas, fruteros, adornos y otros artículos domésticos y ornamentales de vidrio ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327216','Fabricación de artículos de vidrio de uso industrial y comercial',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327219','Fabricación de otros productos de vidrio',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327310','Fabricación de cemento para la construcción',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327320','Fabricación de concreto',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327330','Fabricación de tubos y bloques de cemento y concreto, como tubos de drenaje y alcantarillado, celosías, adoquines, tabiques',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327391','Fabricación de productos preesforzados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327399','Fabricación de otros productos de cemento y concreto',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327410','Fabricación de cal',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327420','Fabricación de yeso y productos de yeso',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327910','Fabricación de productos abrasivos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327991','Corte, pulido y laminado de mármol fuera de la mina',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327992','Corte y pulido, fuera de la mina, de otras piedras de cantera, como el granito, la cantera y el ónix, excepto mármol ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('327999','Fabricación de otros productos a base de minerales no metálicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('331111','Complejos siderúrgicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('331112','Fabricación de desbastes primarios y ferroaleaciones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('331210','Fabricación de tubos y postes de hierro y acero de material comprado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('331220','Fabricación de otros productos de hierro y acero de material comprado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('331310','Industria del aluminio',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('331411','Afinación y refinación de cobre (blister y electrolítico), y a la producción de sus aleaciones ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('331419','Refinación de otros metales no ferrosos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('331420','Laminación secundaria de cobre',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('331490','Laminación secundaria de otros metales no ferrosos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('331490','Venta de lingotes de oro',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('331510','Moldeo por fundición de todo tipo de piezas a partir de hierro y acero producidos en otro establecimiento',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('331520','Moldeo por fundición de piezas metálicas no ferrosas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('332110','Fabricación de productos metálicos forjados y troquelados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('332211','Fabricación de herramientas de mano metálicas sin motor',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('332212','Fabricación de utensilios de cocina metálicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('332310','Fabricación de estructuras metálicas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('332320','Fabricación de productos de herrería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('332410','Fabricación de calderas industriales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('332420','Fabricación de tanques metálicos de calibre grueso',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('332430','Fabricación de envases metálicos de calibre ligero para embalaje, como latas para refrescos, toneles, tambores, cubetas, tinas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('332510','Fabricación de herrajes y cerraduras',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('332610','Fabricación de alambre, productos de alambre y resortes ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('332710','Maquinado de piezas metálicas para maquinaria y equipo en general',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('332720','Fabricación de tornillos, tuercas, armellas, pijas, rondanas, remaches y otros sujetadores metálicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('332810','Recubrimientos y terminados metálicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('332910','Fabricación de válvulas metálicas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('332991','Fabricación de baleros y rodamientos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('332999','Fabricación de otros productos metálicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333111','Fabricación de maquinaria y equipo agrícola',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333111','Fabricación de equipo con motor para jardinería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333112','Fabricación de maquinaria y equipo pecuario',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333120','Fabricación de maquinaria y equipo para la construcción',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333130','Fabricación de maquinaria y equipo para la industria extractiva',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333210','Fabricación de maquinaria y equipo para la industria de la madera',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333220','Fabricación de maquinaria y equipo para la industria del hule y del plástico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333291','Fabricación de maquinaria y equipo para la industria alimentaria y de las bebidas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333292','Fabricación de maquinaria y equipo para la industria textil',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333293','Fabricación de maquinaria y equipo para la impresión',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333294','Fabricación de maquinaria y equipo para la industria del vidrio y otros minerales no metálicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333299','Fabricación de maquinaria y equipo para otras industrias manufactureras',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333311','Fabricación de aparatos fotográficos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333312','Fabricación y ensamble de máquinas fotocopiadoras',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333319','Fabricación de otra maquinaria y equipo para el comercio y los servicios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333411','Fabricación de sistemas de aire acondicionado y calefacción',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333412','Fabricación y ensamble de sistemas de refrigeración industrial y comercial',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333510','Fabricación de maquinaria y equipo para la industria metalmecánica',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333610','Fabricación de motores de combustión interna, turbinas y transmisiones ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333911','Fabricación de bombas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333912','Fabricación de sistemas de bombeo para uso industrial, comercial y doméstico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333920','Fabricación de maquinaria y equipo para levantar y trasladar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333991','Fabricación de equipo para soldar y soldaduras ferrosas y no ferrosas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333992','Fabricación de maquinaria y equipo para envasar y empacar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333993','Fabricación de básculas y balanzas para uso comercial, industrial y doméstico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('333999','Fabricación de otra maquinaria y equipo para la industria en general',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('334110','Fabricación de computadoras y equipo periférico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('334210','Fabricación de aparatos telefónicos y equipo de comunicación alámbrica',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('334220','Fabricación de equipo de transmisión y recepción de señales de radio, televisión y cable',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('334290','Fabricación de otros equipos de comunicación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('334310','Fabricación de equipo de audio y de video',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('334410','Fabricación de componentes electrónicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('334511','Fabricación y ensamble de relojes y sus partes, maquinaria para relojes, y otros instrumentos para medir el tiempo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('334519','Fabricación de otros instrumentos de navegación, medición, médicos y de control',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('334610','Fabricación y reproducción de medios magnéticos y ópticos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('335110','Fabricación de focos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('335120','Fabricación de lámparas ornamentales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('335210','Fabricación de enseres electrodomésticos menores',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('335220','Fabricación de aparatos de línea blanca',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('335311','Fabricación de motores y generadores eléctricos trifásicos y monofásicos o de corriente directa',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('335312','Fabricación de equipo y aparatos de distribución de energía eléctrica',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('335910','Fabricación de acumuladores y pilas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('335920','Fabricación de alambres y cables de conducción eléctrica y de comunicación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('335930','Fabricación de enchufes, contactos, fusibles y otros accesorios para instalaciones eléctricas ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('335991','Fabricación de productos eléctricos de carbón y grafito',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('335999','Fabricación de otros productos eléctricos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('336110','Fabricación o ensamble de automóviles y camionetas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('336110','Venta de vehículos ligeros con motor de combustión interna, como automóviles, furgonetas (minivans) y otras camionetas de carga ligera',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('336120','Fabricación o ensamble de camiones y tractocamiones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('336210','Fabricación de carrocerías y remolques',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('336310','Fabricación de motores de gasolina y sus partes para vehículos automotrices',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('336320','Fabricación de equipo eléctrico y electrónico para vehículos automotores',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('336330','Fabricación de partes de sistemas de dirección y de suspensión para vehículos automotrices',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('336340','Fabricación de partes de sistemas de frenos para vehículos automotrices',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('336350','Fabricación de partes de sistemas de transmisión',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('336360','Fabricación de asientos para vehículos automotores',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('336370','Fabricación de piezas metálicas troqueladas para vehículos automotrices',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('336390','Fabricación de otras partes para vehículos automotrices',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('336410','Fabricación, reconstrucción, ensamble y subensamble de equipo aeroespacial, incluso motores',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('336510','Fabricación de equipo ferroviario',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('336610','Fabricación de embarcaciones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('336991','Fabricación de motocicletas y sus partes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('336992','Fabricación de bicicletas y triciclos y sus partes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('336999','Fabricación de otro equipo de transporte',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('337110','Fabricación de cocinas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('337120','Fabricación de muebles, excepto cocinas y muebles de oficina y estantería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('337210','Fabricación de muebles de oficina y estantería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('337910','Fabricación de colchones y box spring. Incluye la fabricación de colchones de agua',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('337920','Fabricación de persianas, cortineros y sus accesorios. Incluye la fabricación de toldos de bambú y otro tipo de sombras para ventanas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('339111','Fabricación de equipo y aparatos para uso médico, dental, para laboratorio y de máxima seguridad',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('339112','Fabricación de material de curación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('339113','Fabricación de instrumentos y aparatos ópticos de uso oftálmico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('339911','Acuñación e impresión de monedas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('339912','Orfebrería, joyería, piezas artísticas u ornamentales de oro',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('339912','Orfebrería y joyería de metales y piedras preciosos distintos al oro',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('339913','Fabricación de joyería de fantasía hecha de metales y piedras no preciosas, de plástico y de otros materiales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('339914','Fabricación de productos de metales no preciosos, como trofeos, artículos ornamentales para uso doméstico, platones, jarrones, floreros',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('339920','Fabricación de artículos deportivos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('339930','Fabricación de juguetes. Incluye la fabricación de juegos y juguetes electrónicos, instrumentos musicales de juguete y juegos de mesa',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('339940','Fabricación de artículos y accesorios para escritura, pintura, dibujo y actividades de oficina',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('339950','Fabricación de anuncios publicitarios de todo tipo de material, como anuncios y toldos luminosos, carteleras espectaculares, anuncios electrónicos, rotagraphics, unipolares, de neón',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('339991','Fabricación y ensamble de instrumentos musicales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('339992','Fabricación de cierres, botones y agujas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('339993','Fabricación de escobas, cepillos y similares',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('339994','Fabricación de velas y veladoras',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('339995','Fabricación de ataúdes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('339999','Otras industrias manufactureras',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431110','Comercio al por mayor de abarrotes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431121','Comercio al por mayor de carnes rojas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431122','Comercio al por mayor de carne y vísceras de pollo y otras aves de corral',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431123','Comercio al por mayor de pescados y mariscos frescos, secos, salados y congelados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431130','Comercio al por mayor de frutas y verduras frescas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431140','Comercio al por mayor de huevo de gallina y de otras aves',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431150','Comercio al por mayor de semillas y granos alimenticios, frutas secas, chiles secos y especias (clavos, pimienta, azafrán, comino, nuez moscada, canela)',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431160','Comercio al por mayor de leche',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431160','Comercio al por mayor de productos lácteos, como crema, mantequilla, yogur, queso',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431170','Comercio al por mayor de embutidos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431180','Comercio al por mayor de dulces y materias primas para repostería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431191','Comercio al por mayor de pan y pasteles y otros productos de panadería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431192','Comercio al por mayor de botanas y frituras, como papas fritas, chicharrones de harina y de cerdo, tostadas, cacahuates, semillas fritas, palomitas de maíz',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431193','Comercio al por mayor de conservas alimenticias enlatadas, en salmuera, encurtidos, productos alimenticios congelados, en almíbar, en aceite, purés',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431199','Comercio al por mayor de helados, paletas de hielo, gelatinas, flanes, budines y otros productos alimenticios para consumo humano no clasificados en otra parte',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431211','Comercio al por mayor agua purificada y hielo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431211','Comercio al por mayor de concentrados, polvos, jarabes y esencias de sabor para preparar refrescos, bebidas hidratantes o rehidratantes elaborados con azúcar de caña y otros edulcorantes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431211','Comercio al por mayor de concentrados o jarabes para preparar refrescos que se expendan en envases abiertos utilizando aparatos automáticos, eléctricos o mecánicos elaborados con azúcar de caña y otros edulcorantes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431211','Comercio al por mayor de refrescos o bebidas hidratantes o rehidratantes elaborados con azúcar de caña y otros edulcorantes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431211','Comercio al por mayor de refrescos o bebidas hidratantes o rehidratantes elaborados únicamente con azúcar de caña como edulcorante',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431211','Comercio al por mayor de concentrados, polvos, jarabes y esencias de sabor para preparar refrescos, bebidas hidratantes o rehidratantes elaborados únicamente con azúcar de caña como edulcorante',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431211','Comercio al por mayor de concentrados o jarabes para preparar refrescos que se expendan en envases abiertos utilizando aparatos automáticos, eléctricos o mecánicos elaborados únicamente con azúcar de caña como edulcorante',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431212','Comercio al por mayor de bebidas refrescantes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431212','Comercio al por mayor de vinos de mesa',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431212','Comercio al por mayor de otras bebidas a base de uva',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431212','Comercio al por mayor de aguamiel y pulque',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431212','Comercio al por mayor de sidra y otras bebidas fermentadas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431212','Comercio al por mayor de ron y otras bebidas destiladas de caña',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431212','Comercio al por mayor de bebidas destiladas de agave',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431212','Comercio al por mayor de bebidas alcohólicas no clasificados en otra parte',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431213','Comercio al por mayor de cerveza',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('431220','Comercio al por mayor de cigarros, puros y tabaco',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('432111','Comercio al por mayor de fibras, hilos y telas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('432112','Comercio al por mayor de blancos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('432119','Comercio al por mayor de otros productos textiles',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('432120','Comercio al por mayor de ropa',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('432130','Comercio al por mayor de calzado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('433110','Comercio al por mayor de productos farmacéuticos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('433210','Comercio al por mayor de artículos de perfumería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('433220','Comercio al por mayor de joyería, orfebrería, piezas artísticas u ornamentales de oro',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('433220','Comercio al por mayor de artículos de joyería y otros accesorios de vestir',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('433311','Comercio al por mayor de discos y casetes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('433312','Comercio al por mayor de juguetes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('433313','Comercio al por mayor de artículos y aparatos deportivos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('433410','Comercio al por mayor de artículos de papelería para uso escolar y de oficina',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('433420','Comercio al por mayor de libros',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('433430','Comercio al por mayor de revistas y periódicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('433510','Comercio al por mayor de electrodomésticos menores y aparatos de línea blanca',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('434111','Comercio al por mayor de fertilizantes, plaguicidas y semillas para siembra',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('434112','Comercio al por mayor de medicamentos veterinarios y alimentos para animales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('434211','Comercio al por mayor de cemento, tabique y grava',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('434219','Comercio al por mayor de otros materiales para la construcción, excepto de madera',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('434221','Comercio al por mayor de materiales metálicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('434222','Comercio al por mayor de productos químicos para uso industrial',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('434223','Comercio al por mayor de envases, papel y cartón',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('434224','Comercio al por mayor de madera',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('434225','Comercio al por mayor de equipo y material eléctrico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('434226','Comercio al por mayor de pintura',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('434227','Comercio al por mayor de vidrios y espejos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('434228','Comercio al por mayor de ganado y aves de corral en pie',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('434229','Comercio al por mayor de otras materias primas para otras industrias',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('434311','Comercio al por mayor de desechos metálicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('434312','Comercio al por mayor de desechos de papel y de cartón',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('434313','Comercio al por mayor de desechos de vidrio',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('434314','Comercio al por mayor de desechos de plástico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('434319','Comercio al por mayor de otros materiales de desecho',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('435110','Comercio al por mayor de maquinaria y equipo agropecuario, forestal y para la pesca',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('435210','Comercio al por mayor de maquinaria y equipo para la construcción y la minería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('435220','Comercio al por mayor de maquinaria y equipo para la industria manufacturera',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('435311','Comercio al por mayor de equipo de telecomunicaciones, fotografía y cinematografía',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('435312','Comercio al por mayor de artículos y accesorios para diseño y pintura artística',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('435313','Comercio al por mayor de mobiliario, equipo e instrumental médico y de laboratorio',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('435319','Comercio al por mayor de maquinaria y equipo para otros servicios y para actividades comerciales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('435411','Comercio al por mayor de equipo y accesorios de cómputo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('435412','Comercio al por mayor de mobiliario y equipo de oficina',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('435419','Comercio al por mayor de otra maquinaria y equipo de uso general',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('436110','Comercio al por mayor de camiones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('436110','Comercio al por mayor de carrocerías, cajas de carga, remolques y semirremolques',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('437111','Venta al por mayor por comisión y consignación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('437119','Otros intermediarios de comercio al por mayor',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('437210','Comercio al por mayor por medios masivos de comunicación (como correo e internet) y otros medios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461110','Comercio al por menor en tiendas de abarrotes, ultramarinos y misceláneas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461121','Comercio al por menor de carnes rojas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461122','Comercio al por menor de carne de aves',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461123','Comercio al por menor de pescados y mariscos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461130','Comercio al por menor de frutas y verduras frescas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461140','Comercio al por menor de huevos de gallina y de otras aves',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461150','Comercio al por menor de semillas y granos alimenticios, especias y chiles secos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461160','Comercio al por menor de productos lácteos y embutidos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461160','Comercio al por menor de leche.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461170','Comercio al por menor de dulces y materias primas para repostería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461190','Comercio al por menor de otros alimentos que no sean preparados ni cocidos para su consumo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461190','Comercio al por menor de otros alimentos preparados para su consumo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461211','Venta al público en general de bebidas refrescantes por la cual se entrega un comprobante simplificado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461211','Comercio al por menor de bebidas refrescantes entregando factura',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461211','Comercio al por menor de vinos de mesa',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461211','Comercio al por menor de aguamiel y pulque',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461211','Comercio al por menor de otras bebidas a base de uva',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461211','Comercio al por menor de sidra y otras bebidas fermentadas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461211','Comercio al por menor de ron y otras bebidas destiladas de caña',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461211','Comercio al por menor de bebidas destiladas de agave.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461211','Comercio al por menor de bebidas alcohólicas no clasificados en otra parte',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461212','Comercio al por menor de cerveza entregando factura',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461212','Venta de cerveza por la cual se entrega un comprobante simplificado, realizada por personas distintas al fabricante, productor, envasador o importador',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461213','Comercio al por menor de agua purificada y hielo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461213','Comercio al por menor de refrescos, bebidas hidratantes y rehidratantes elaborados únicamente con azúcar de caña como edulcorante',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461213','Comercio al por menor de concentrados, polvos, jarabes y esencias de sabor para preparar refrescos, bebidas hidratantes o rehidratantes elaborados con azúcar de caña y otros edulcorantes entregando factura',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461213','Venta de refrescos, bebidas hidratantes y rehidratantes por la cual se entrega un comprobante simplificado, realizada por personas distintas al fabricante, productor, envasador o importador ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461213','Venta de concentrados, polvos, jarabes y esencias de sabor para preparar refrescos, bebidas hidratantes o rehidratantes por la cual se entrega un comprobante simplificado, realizada por personas distintas al fabricante, productor, envasador o importador',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461213','Comercio al por menor de concentrados o jarabes para preparar refrescos que se expendan en envases abiertos utilizando aparatos automáticos, eléctricos o mecánicos entregando factura',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461213','Comercio al por menor de refrescos, bebidas hidratantes y rehidratantes elaborados con azúcar de caña y otros edulcorantes entregando factura.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461213','Comercio al por menor de concentrados, polvos, jarabes y esencias de sabor para preparar refrescos, bebidas hidratantes o rehidratantes elaborados únicamente con azúcar de caña como edulcorante',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461213','Comercio al por menor de concentrados o jarabes para preparar refrescos que se expendan en envases abiertos utilizando aparatos automáticos, eléctricos o mecánicos elaborados únicamente con azúcar de caña como edulcorante.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('461220','Comercio al por menor de cigarros, puros y tabaco',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('462111','Comercio al por menor en supermercados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('462112','Comercio al por menor en minisupers',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('462210','Comercio al por menor en tiendas departamentales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('463111','Comercio al por menor de telas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('463112','Comercio al por menor de blancos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('463113','Comercio al por menor de artículos de mercería y bonetería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('463211','Comercio al por menor de ropa nueva, de trajes regionales, disfraces, pieles finas, vestidos para novia, uniformes escolares, no confeccionados con cuero y piel',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('463212','Comercio al por menor bisutería y accesorios de vestir, como pañoletas, mascadas, etc',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('463213','Comercio al por menor cuero, piel y materiales sucedáneos como chamarras, chalecos, faldas y otros artículos de estos materiales como bolsas, portafolios, maletas, cinturones, guantes y carteras',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('463214','Comercio al por menor pañales desechables y/o toallas sanitarias',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('463215','Comercio al por menor sombreros',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('463310','Comercio al por menor calzado, agujetas, tintas, plantillas, accesorios del calzado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('464111','Farmacias sin minisuper',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('464112','Farmacias con minisuper',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('464113','Comercio al por menor de productos naturistas y de complementos alimenticios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('464121','Comercio al por menor de lentes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('464122','Comercio al por menor de aparatos ortopédicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('465111','Comercio al por menor de artículos de perfumería y cosméticos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('465112','Comercio al por menor de relojes, joyería fina y artículos decorativos de materiales preciosos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('465211','Comercio al por menor de discos, discos compactos, casetes, cartuchos, cintas de audio y video',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('465212','Comercio al por menor de juguetes, bicicletas, triciclos y partes para bicicletas y triciclos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('465213','Comercio al por menor de equipo, material fotográfico y sus accesorios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('465214','Comercio al por menor en general de uniformes y artículos deportivos, equipo y accesorios para excursionismo, pesca y caza deportiva',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('465215','Comercio al por menor de instrumentos musicales y sus accesorios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('465311','Comercio al por menor de artículos de papelería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('465312','Comercio al por menor de libros',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('465313','Comercio al por menor de periódicos y revistas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('465911','Comercio al por menor de mascotas, medicamentos, accesorios y otros productos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('465912','Comercio al por menor de regalos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('465913','Comercio al por menor de artículos religiosos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('465914','Comercio al por menor de artesanías',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('465915','Comercio al por menor en tiendas importadoras de productos de origen extranjero',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('465919','Comercio al por menor de ataúdes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('465919','Comercio al por menor de artículos misceláneos no clasificados en otra parte',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('466111','Comercio al por menor de muebles para el hogar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('466112','Comercio al por menor de enseres electrodomésticos menores y aparatos de línea blanca',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('466113','Comercio al por menor de cristalería y sus piezas sueltas, loza y utensilios de cocina de cerámica y plástico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('466211','Comercio al por menor de computadoras y sus accesorios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('466212','Comercio al por menor de teléfonos, de otros aparatos de comunicación, refaccciones y accesorios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('466311','Comercio al por menor de alfombras, tapetes, gobelinos, tapices, linóleos, cortinas, persianas y similares',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('466312','Comercio al por menor de plantas y flores naturales, arreglos florales y frutales, coronas funerarias, naturalezas muertas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('466313','Comercio al por menor de antigüedades y obras de arte',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('466314','Comercio al por menor de lámparas ornamentales y pantallas para lámparas y candiles',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('466319','Comercio al por menor de otros artículos para la decoración de interiores',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('466410','Comercio al por menor de artículos usados de muebles, enseres domésticos, libros, revistas, ropa, calzado, juguetes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('467111','Comercio al por menor en ferreterías y tlapalerías',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('467112','Comercio al por menor de pintura, recubrimientos, barnices, brochas, materiales y accesorios para pintura no artística',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('467113','Comercio al por menor de vidrios y espejos, cancelería de aluminio, domos de material acrílico y policarbonato, tragaluces de vidrio',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('467114','Comercio al por menor de artículos para la limpieza',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('467115','Comercio al por menor en Tiendas de autoservicio de materiales para la autoconstrucción',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('468111','Comercio al por menor de automóviles y camionetas nuevos cuya propulsión sea a través de baterías eléctricas recargable',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('468111','Venta de automóviles nuevos al consumidor por el fabricante, ensamblador, por el distribuidor autorizado o por el comerciante en el ramo de vehículos cuyo precio de venta no exceda $150,000.00',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('468111','Venta de automóviles nuevos al consumidor por el fabricante, ensamblador, por el distribuidor autorizado o por el comerciante en el ramo de vehículos cuyo precio de venta exceda $150,000.00',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('468112','Comercio al por menor de automóviles y camionetas usados y comercio integrado de automóviles y camiones usados, y a la compra, venta y consignación de automóviles y camionetas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('468211','Comercio al por menor de partes y refacciones nuevas para automóviles, camionetas y camiones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('468212','Comercio al por menor de partes y refacciones usadas para automóviles, camionetas y camiones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('468213','Comercio al por menor de llantas y cámaras, corbatas, válvulas de cámara y tapones para automóviles, camionetas y camiones de motor',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('468311','Comercio al por menor de motocicletas, bicimotos, motonetas y motocicletas acuáticas y sus refacciones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('468319','Comercio al por menor de otros vehículos de motor',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('468411','Comercio al por menor de gasolina y diesel',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('468411','Venta final al público en general en territorio nacional de gasolina y diesel',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('468412','Comercio al por menor de gas L.P. en cilindros y para tanques estacionarios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('468419','Comercio al por menor de otros combustibles como petróleo diáfano, carbón vegetal y leña',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('468420','Comercio al por menor de aceites y grasas lubricantes de uso industrial, aditivos y similares para vehículos de motor',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('469111','Comercio al por menor de productos de consumo final propiedad de terceros por comisión y consignación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('469119','Otros intermediarios del comercio al por menor',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('469210','Comercio al por menor por medios masivos de comunicación y otros medios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('469210','Comercio al por menor a través de máquinas expendedoras',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('481111','Transporte aéreo regular de pasajeros y de carga en aeronaves con matrícula nacional con rutas y horarios establecidos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('481112','Transporte aéreo regular de pasajeros y de carga en aeronaves con matrícula extranjera con rutas y horarios establecidos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('481210','Transporte aéreo no regular de pasajeros y de carga por vía aérea, sin rutas ni horarios fijos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('482110','Transporte por ferrocarril de pasajeros y de carga',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('483111','Transporte marítimo de altura',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('483112','Transporte marítimo de cabotaje',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('483113','Transporte marítimo de altura o de cabotaje de petróleo y gas natural por mar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('483210','Transporte de pasajeros y de carga por ríos, presas, lagos, lagunas y otras vías navegables interiores, servicio de remolque de carga por aguas interiores',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('484111','Autotransporte local de productos agropecuarios sin refrigeración',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('484119','Otro autotransporte local de carga general',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('484121','Autotransporte foráneo de productos agropecuarios sin refrigeración',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('484129','Otro autotransporte foráneo de carga general',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('484210','Servicio de mudanzas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('484221','Autotransporte local de materiales para la construcción cuyo radio de acción se limita al área metropolitana, municipio o localidad en que operan',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('484222','Autotransporte local de materiales y residuos peligrosos cuyo radio de acción se limita al área metropolitana, municipio o localidad en que operan',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('484223','Autotransporte local con refrigeración cuyo radio de acción se limita al área metropolitana, municipio o localidad en que operan',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('484224','Autotransporte local de madera y sus derivados cuyo radio de acción se limita al área metropolitana, municipio o localidad en que operan',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('484229','Otro autotransporte local de carga especializado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('484231','Autotransporte foráneo de materiales para la construcción',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('484232','Autotransporte foráneo de materiales y residuos peligrosos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('484233','Autotransporte foráneo con refrigeración',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('484234','Autotransporte foráneo de madera y sus derivados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('484239','Otro autotransporte foráneo de carga especializado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('485111','Transporte de pasajeros urbano y suburbano en autobuses',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('485112','Transporte de pasajeros urbano y suburbano en automóviles colectivos de ruta fija',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('485113','Transporte de pasajeros urbano y suburbano en trolebuses y trenes ligeros',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('485114','Transporte de pasajeros urbano y suburbano en metro',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('485210','Transporte de pasajeros interurbano y rural',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('485311','Transporte de pasajeros en taxis de sitio',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('485312','Transporte de pasajeros en taxis de ruleteo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('485320','Servicio de limusinas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('485410','Transporte escolar y de personal',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('485510','Alquiler de autobuses con chofer',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('485991','Alquiler de automóviles con chofer',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('485999','Otro transporte terrestre de pasajeros',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('486110','Transporte de petróleo crudo por ductos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('486210','Transporte de gas natural por ductos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('486910','Transporte por ductos de productos refinados del petróleo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('486990','Transporte por ductos de otros productos, excepto de productos refinados del petróleo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('487110','Transporte turístico por tierra',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('487210','Transporte turístico por agua',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('487990','Otro transporte turístico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('488111','Servicios a la navegación aérea',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('488112','Administración de aeropuertos y helipuertos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('488190','Otros servicios relacionados con el transporte aéreo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('488210','Servicios relacionados con el transporte por ferrocarril',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('488310','Administración de puertos y muelles',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('488320','Servicios de carga y descarga para el transporte por agua',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('488330','Servicios para la navegación por agua',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('488390','Otros servicios relacionados con el transporte por agua',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('488410','Remolque de vehículos de motor',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('488491','Servicios de administración de centrales camioneras',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('488492','Servicios de administración de carreteras, puentes y servicios auxiliares',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('488493','Servicios de báscula para el transporte',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('488511','Servicios de agencias aduanales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('488519','Otros servicios de intermediación para el transporte de carga',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('488990','Otros servicios relacionados con el transporte',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('491110','Servicios postales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('492110','Servicios de mensajería y paquetería foránea',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('492210','Servicios de mensajería y paquetería local',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('493111','Almacenes generales de depósito',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('493119','Otros servicios de almacenamiento general sin instalaciones especializadas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('493120','Almacenamiento con refrigeración',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('493130','Almacenamiento de productos agropecuarios que no requieren refrigeración',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('493190','Otros servicios de almacenamiento con instalaciones especializadas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('511111','Edición de periódicos no integrada con la impresión, excepto a través de Internet',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('511112','Edición de periódicos integrada con la impresión',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('511121','Edición de revistas y otras publicaciones periódicas no integrada con la impresión, excepto a través de Internet',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('511122','Edición de revistas y otras publicaciones periódicas integrada con la impresión',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('511131','Edición de libros no integrada con la impresión, excepto a través de Internet',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('511132','Edición de libros integrada con la impresión',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('511141','Edición de directorios y de listas de correo no integrada con la impresión, excepto a través de Internet',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('511142','Edición de directorios y de listas de correo integrada con la impresión',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('511191','Edición de otros materiales no integrada con la impresión, excepto a través de Internet',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('511192','Edición de otros materiales integrada con la impresión',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('511210','Edición de software, excepto a través de Internet',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('512111','Producción de películas cinematográficas y videos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('512112','Producción de programas para la televisión',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('512113','Producción de videoclips, comerciales y otros materiales audiovisuales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('512120','Distribución de películas cinematográficas, videos y otros materiales audiovisuales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('512130','Exhibición de películas cinematográficas, videos y otros materiales audiovisuales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('512190','Servicios de postproducción y otros servicios para la industria fílmica y del video',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('512210','Productoras discográficas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('512220','Producción y distribución de discos y cintas magnetofónicas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('512230','Editoras de música',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('512240','Grabación de discos y cintas magnetofónicas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('512290','Otros servicios de grabación del sonido',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('515110','Transmisión de programas de radio, excepto a través de Internet',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('515120','Transmisión de programas de televisión, excepto a través de Internet',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('515210','Producción de programación de canales para sistemas de televisión por cable o satelitales, excepto a través de Internet',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('516110','Creación y difusión de contenido exclusivamente a través de Internet',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('517111','Telefonía tradicional',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('517119','Telegrafía y otras telecomunicaciones alámbricas del sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('517119','Telegrafía y otras telecomunicaciones alámbricas.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('517211','Telefonía celular',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('517219','Otras telecomunicaciones inalámbricas, excepto los servicios de satélites',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('517310','Reventa de servicios de telecomunicaciones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('517410','Servicios de satélites',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('517510','Distribución por suscripción de programas de televisión, excepto a través de Internet',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('517910','Otros servicios de telecomunicaciones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('518110','Proveedores de acceso a Internet y servicios de búsqueda en la red',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('518210','Procesamiento electrónico de información, hospedaje de páginas web y otros servicios relacionados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('519110','Agencias noticiosas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('519121','Bibliotecas y archivos del sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('519122','Bibliotecas y archivos del sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('519190','Otros servicios de suministro de información',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('521110','Banco de México',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522110','Banca múltiple o comercial',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522210','Banca de desarrollo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522220','Fondos y fideicomisos financieros para el desarrollo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522220','Inversión en sociedades mexicanas residentes en México no listadas en la bolsa al momento de la inversión',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522310','Uniones de crédito',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522320','Cajas de ahorro popular',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522320','Sociedades financieras populares',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522390','Sociedades de ahorro y préstamo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522410','Arrendadoras financieras',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522420','Empresas de factoraje financiero',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522430','Sociedades financieras de objeto limitado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522430','Sociedades financieras de objeto múltiple',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522440','Compañías de autofinanciamiento',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522450','Montepíos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522450','Casas de préstamo y empeño',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522490','Sociedades controladoras de grupos financieros',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522490','Oficinas de representación y agencias de bancos extranjeros',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522490','Financiera rural',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522490','Otras instituciones de intermediación crediticia y financiera no bursátil',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522490','Sociedades mutualistas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522510','Servicios relacionados con la intermediación crediticia',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522510','Transmisores, dispersores de dinero. Dispersores',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('522510','Transmisores, dispersores de dinero. Pagadores',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('523110','Casas de bolsa',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('523121','Casas de cambio',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('523122','Centros cambiarios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('523210','Bolsa de valores',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('523910','Sociedades de inversión de capitales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('523910','Sociedades de inversión de objeto limitado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('523910','Sociedades de inversión en instrumentos de deuda',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('523910','Sociedades de inversión especializadas de fondos para el retiro',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('523910','Sociedades de inversión de renta variable',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('523920','Asesoría en inversiones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('523990','Instituciones para el depósito de valores',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('523990','Operadora de Sociedades de inversión',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('523990','Sociedades de inversión valuadoras',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('523990','Sociedades distribuidoras de acciones de sociedades de inversión',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('523990','Calificadora de valores',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('523990','Sociedades operadoras de sociedades de inversión',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('523990','Otras instituciones financieras cuya actividad sea la intermediación bursátil',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('523990','Administradoras de fondos para el Retiro.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('524110','Compañías especializadas en seguros de vida',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('524120','Compañías de seguros no especializadas en seguros de vida',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('524130','Compañías especializadas en seguros contra riesgos agropecuarios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('524140','Compañías afianzadoras',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('524210','Agentes, ajustadores y gestores de seguros de vida',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('524210','Agentes, ajustadores y gestores de seguros contra riesgos agropecuarios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('524210','Agentes, ajustadores y gestores de otros seguros ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('524210','Ingresos derivados del otorgamiento de fianzas o avales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('524220','Administración de cajas de pensión y de seguros independientes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('531111','Alquiler de Viviendas amuebladas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('531112','Alquiler de Viviendas no amuebladas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('531112','Construcción y/o adquisición de viviendas para ser rentadas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('531113','Alquiler de Salones para fiestas y convenciones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('531113','Construcción y/o adquisición de salones para fiestas y convenciones para ser rentados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('531114','Alquiler de Oficinas y locales comerciales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('531114','Construcción y/o adquisición de oficinas y locales comerciales para ser rentados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('531115','Alquiler de Teatros, estadios, auditorios y similares',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('531115','Construcción y/o adquisición de teatros, estadios, auditorios y similares para ser rentados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('531119','Alquiler de Fincas destinadas fines agrícolas o ganaderos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('531119','Alquiler de Otros inmuebles',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('531119','Alquiler de inmuebles para escuelas, colegios de profesionales e instituciones de asistencia y beneficencia o empresas asociaciones u organismos no comerciales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('531119','Construcción  y/o adquisición de Fincas destinadas fines agrícolas o ganaderos para ser rentados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('531119','Construcción y/o adquisición de otros inmuebles para ser rentados, como terrenos, bodegas, galerones, plantas industriales, naves industriales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('531210','Inmobiliarias y corredores de bienes raíces',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('531311','Servicios de administración de inmuebles',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('531319','Otros servicios relacionados con los servicios inmobiliarios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('531319','Administración de bien inmueble destinado a hospedaje',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('532110','Alquiler de automóviles sin chofer',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('532121','Alquiler de camiones de carga sin chofer',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('532122','Alquiler de autobuses, minibuses y remolques sin chofer',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('532210','Alquiler de aparatos eléctricos y electrónicos para el hogar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('532220','Alquiler de ropa',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('532230','Alquiler de videocasetes y discos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('532291','Alquiler de mesas, sillas, vajillas y similares',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('532292','Alquiler de instrumentos musicales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('532299','Alquiler de otros artículos para el hogar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('532310','Centros generales de alquiler',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('532411','Alquiler de maquinaria para construcción, minería y actividades forestales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('532412','Alquiler de equipo de transporte, excepto terrestre',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('532420','Alquiler de equipo de cómputo y de otras máquinas y mobiliario de oficina',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('532491','Alquiler de maquinaria y equipo agropecuario, pesquero y para la industria de la transformación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('532492','Alquiler de equipo para levantar, mover y acomodar materiales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('532493','Alquiler de equipo para el comercio y los servicios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('533110','Regalías por uso o goce temporal de patentes y franquicias',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541110','Bufetes jurídicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541120','Notarías públicas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541190','Servicios de apoyo para efectuar trámites legales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541211','Servicios de contabilidad y auditoría',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541219','Otros servicios relacionados con la contabilidad',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541310','Servicios de arquitectura',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541320','Servicios de arquitectura de paisaje y urbanismo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541330','Servicios de ingeniería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541340','Servicios de dibujo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541350','Servicios de inspección de edificios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541360','Servicios de levantamiento geofísico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541370','Servicios de elaboración de mapas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541380','Laboratorios de pruebas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541410','Diseño y decoración de interiores',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541420','Diseño industrial',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541430','Diseño gráfico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541490','Diseño de modas y otros diseños especializados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541510','Servicios de consultoría en computación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541610','Servicios de consultoría en administración',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541620','Servicios de consultoría en medio ambiente',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541690','Otros servicios de consultoría científica y técnica',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541711','Servicios de investigación y desarrollo en ciencias físicas, de la vida e ingeniería prestados por el sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541712','Servicios de investigación y desarrollo en ciencias físicas, de la vida e ingeniería prestados por el sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541721','Actividades de Investigación científica o tecnológica inscritas en el R. N. I. C. y T. prestados únicamente a los socios o asociados. ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541721','Actividades de Investigación científica o tecnológica inscritas en el R. N. I. C. y T. prestados a terceras personas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541721','Servicios de investigación y desarrollo en ciencias sociales y humanidades prestados por el sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541722','Servicios de investigación y desarrollo en ciencias sociales y humanidades prestados por el sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541810','Agencias de publicidad',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541820','Agencias de relaciones públicas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541830','Agencias de compra de medios a petición del cliente',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541840','Agencias de representación de medios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541850','Agencias de anuncios publicitarios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541860','Agencias de publicidad que operan por correo directo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541870','Distribución de material publicitario',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541890','Otros servicios de publicidad',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541910','Servicios de investigación de mercados y encuestas de opinión pública',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541920','Servicios de estudio fotográfico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541930','Servicios de traducción e interpretación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541941','Servicios veterinarios para mascotas prestados por el sector privado que requieran de título de médico conforme a las leyes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541942','Servicios veterinarios para mascotas prestados por el sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541943','Servicios veterinarios para la ganadería prestados por el sector privado que requieran de título de médico conforme a las leyes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541944','Servicios veterinarios para la ganadería prestados por el sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('541990','Otros servicios profesionales, científicos y técnicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('551111','Dirección de corporativos y empresas financieras',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('551112','Dirección de corporativos y empresas no financieras',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561110','Servicios de administración de negocios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561110','Operaciones financieras derivadas en el Mercado Mexicano de Derivados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561110','Intereses por inversiones o depósitos en sistema financiero',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561110','Inversiones realizadas en sociedades residentes en el extranjero sin establecimiento en el país',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561110','Ganancia cambiaria y los intereses obtenidos por otros créditos, operaciones o préstamos otorgados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561110','Ganancia cambiaria y los intereses obtenidos por otros créditos, operaciones o préstamos otorgados a residentes en el extranjero',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561110','Dividendos o utilidades distribuidos por sociedades residentes en el extranjero',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561110','Remanente distribuible proveniente de personas morales con fines no lucrativos del Impuesto Sobre la Renta',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561110','Intereses del extranjero',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561110','Intereses por préstamos en el país',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561110','Inversiones realizadas en sociedades residentes en el extranjero sin establecimiento en el país. Sujetos a regímenes fiscales preferentes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561110','Dividendos o utilidades distribuidos por sociedades residentes en el extranjero sujetos a regímenes fiscales preferentes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561110','Operaciones financieras derivadas en el Mercado Mexicano de Derivados sujetos a regímenes fiscales preferentes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561210','Servicios combinados de apoyo en instalaciones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561310','Agencias de colocación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561320','Agencias de empleo temporal',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561330','Suministro de personal permanente',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561410','Servicios de preparación de documentos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561421','Servicios de casetas telefónicas.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561422','Servicios de recepción de llamadas telefónicas y promoción por teléfono',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561430','Servicios de fotocopiado, fax y afines',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561440','Agencias de cobranza',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561450','Despachos de investigación de solvencia financiera',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561490','Otros servicios de apoyo secretarial y similares',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561510','Agencias de viajes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561520','Organización de excursiones y paquetes turísticos para agencias de viajes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561590','Otros servicios de reservaciones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561610','Servicios de investigación y de protección y custodia, excepto mediante monitoreo',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561610','Servicios de investigación y de protección',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561620','Servicios de protección y custodia mediante el monitoreo de sistemas de seguridad',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561710','Servicios de control y exterminación de plagas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561720','Servicios de limpieza de inmuebles',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561730','Servicios de instalación y mantenimiento de áreas verdes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561740','Servicios de limpieza de tapicería, alfombras y muebles',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561790','Otros servicios de limpieza',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561910','Servicios de empacado y etiquetado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561920','Organizadores de convenciones y ferias comerciales e industriales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561990','Otros servicios de apoyo a los negocios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561990','Servicios especializados de apoyo a las empresas micro, pequeñas y medianas (Empresas Integradoras) ',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('561990','Actividades complementarias prestadas como integrante a los coordinados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('562111','Manejo de desechos peligrosos y servicios de remediación a zonas dañadas por desechos peligrosos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('562112','Manejo de desechos no peligrosos y servicios de remediación a zonas dañadas por desechos no peligrosos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611111','Escuelas de educación preescolar pertenecientes al sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611112','Escuelas de educación preescolar pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611121','Escuelas de educación primaria pertenecientes al sector privado, que tengan autorización o reconocimiento de validez oficial de estudios, en los términos de la Ley General de Educación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611122','Escuelas de educación primaria pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611131','Escuelas de educación secundaria general pertenecientes al sector privado, que tengan autorización o reconocimiento de validez oficial de estudios, en los términos de la Ley General de Educación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611132','Escuelas de educación secundaria general pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611141','Escuelas de educación secundaria técnica pertenecientes al sector privado, que tengan autorización o reconocimiento de validez oficial de estudios, en los términos de la Ley General de Educación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611142','Escuelas de educación secundaria técnica pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611151','Escuelas de educación media técnica terminal pertenecientes al sector privado, que tengan autorización o reconocimiento de validez oficial de estudios, en los términos de la Ley General de Educación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611152','Escuelas de educación media técnica terminal pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611161','Escuelas de educación media superior pertenecientes al sector privado, que tengan autorización o reconocimiento de validez oficial de estudios, en los términos de la Ley General de Educación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611162','Escuelas de educación media superior pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611171','Escuelas del sector privado que combinan diversos niveles de educación, que tengan autorización o reconocimiento de validez oficial de estudios, en los términos de la Ley General de Educación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611172','Escuelas del sector público que combinan diversos niveles de educación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611181','Escuelas de educación especial pertenecientes al sector privado, que tengan autorización o reconocimiento de validez oficial de estudios, en los términos de la Ley General de Educación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611182','Escuelas de educación especial pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611211','Escuelas de educación postbachillerato no universitaria pertenecientes al sector privado, que tengan autorización o reconocimiento de validez oficial de estudios, en los términos de la Ley General de Educación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611212','Escuelas de educación postbachillerato no universitaria pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611311','Escuelas de educación superior pertenecientes al sector privado, que tengan autorización o reconocimiento de validez oficial de estudios, en los términos de la Ley General de Educación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611312','Escuelas de educación superior pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611411','Escuelas comerciales y secretariales del sector privado, que tengan autorización o reconocimiento de validez oficial de estudios, en los términos de la Ley General de Educación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611412','Escuelas comerciales y secretariales del sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611421','Escuelas de computación pertenecientes al sector privado, que tengan autorización o reconocimiento de validez oficial de estudios, en los términos de la Ley General de Educación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611422','Escuelas de computación pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611431','Escuelas del sector privado para la capacitación de ejecutivos, que tengan autorización o reconocimiento de validez oficial de estudios, en los términos de la Ley General de Educación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611432','Escuelas del sector público para la capacitación de ejecutivos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611511','Escuelas del sector privado dedicadas a la enseñanza de oficios, que tengan autorización o reconocimiento de validez oficial de estudios, en los términos de la Ley General de Educación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611512','Escuelas del sector público dedicadas a la enseñanza de oficios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611611','Escuelas de arte pertenecientes al sector privado, que tengan autorización o reconocimiento de validez oficial de estudios, en los términos de la Ley General de Educación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611612','Escuelas de arte pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611621','Escuelas de deporte pertenecientes al sector privado, que tengan autorización o reconocimiento de validez oficial de estudios, en los términos de la Ley General de Educación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611622','Escuelas de deporte pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611631','Escuelas del sector privado dedicadas a la enseñanza de idiomas, que tengan autorización o reconocimiento de validez oficial de estudios, en los términos de la Ley General de Educación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611631','Escuelas del sector privado, que no cuenten con autorización o reconocimiento de validez oficial de estudios, en los términos de la Ley General de Educación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611632','Escuelas del sector público dedicadas a la enseñanza de idiomas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611691','Servicios de profesores particulares',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611698','Otros servicios educativos proporcionados por el sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611699','Otros servicios educativos proporcionados por el sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('611710','Servicios de apoyo a la educación',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621111','Consultorios de medicina general pertenecientes al sector privado que cuenten con título de médico conforme a las leyes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621111','Consultorios de medicina general pertenecientes al sector privado que no cuenten con título de médico conforme a las leyes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621112','Consultorios de medicina general pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621113','Consultorios de medicina especializada pertenecientes al sector privado que cuenten con título de médico conforme a las leyes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621113','Consultorios de medicina especializada pertenecientes al sector privado que no cuenten con título de médico conforme a las leyes.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621114','Consultorios de medicina especializada pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621211','Consultorios dentales del sector privado que cuenten con título de médico conforme a las leyes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621211','Consultorios dentales del sector privado que no cuenten con título de médico conforme a las leyes.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621212','Consultorios dentales del sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621311','Consultorios de quiropráctica pertenecientes al sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621312','Consultorios de quiropráctica pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621320','Consultorios de optometría',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621331','Consultorios de psicología pertenecientes al sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621332','Consultorios de psicología pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621341','Consultorios de audiología y de terapia ocupacional, física y del lenguaje pertenecientes al sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621342','Consultorios de audiología y de terapia ocupacional, física y del lenguaje perteneciente al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621391','Consultorios del sector privado de nutriólogos y dietistas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621392','Consultorios del sector público de nutriólogos y dietistas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621398','Otros consultorios del sector privado para el cuidado de la salud',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621399','Otros consultorios del sector público para el cuidado de la salud',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621411','Centros de planificación familiar pertenecientes al sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621412','Centros de planificación familiar pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621421','Centros del sector privado dedicados a la atención médica externa de enfermos mentales y adictos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621422','Centros del sector público dedicados a la atención médica externa de enfermos mentales y adictos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621491','Otros centros del sector privado para la atención de pacientes que no requieren hospitalización',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621492','Otros centros del sector público para la atención de pacientes que no requieren hospitalización',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621511','Laboratorios médicos y de diagnóstico pertenecientes al sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621512','Laboratorios médicos y de diagnóstico pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621610','Servicios de enfermería a domicilio',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621910','Servicios de ambulancias',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621991','Servicios de bancos de órganos, de bancos de sangre y otros servicios auxiliares al tratamiento médico prestados por el sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('621992','Servicios de bancos de órganos, de bancos de sangre y otros servicios auxiliares al tratamiento médico prestados por el sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('622111','Hospitales generales del sector privado que requieran de título de médico conforme a las leyes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('622112','Hospitales generales del sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('622211','Hospitales del sector privado psiquiátricos y para el tratamiento por abuso de substancias',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('622212','Hospitales del sector público psiquiátricos y para el tratamiento por abuso de substancias',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('622311','Hospitales del sector privado dedicados a otras especialidades médicas que requieran de título de médico conforme a las leyes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('622312','Hospitales del sector público dedicados a otras especialidades médicas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('623111','Residencias del sector privado con cuidados de enfermeras para enfermos convalecientes, en rehabilitación, incurables y terminales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('623112','Residencias del sector público con cuidados de enfermeras para enfermos convalecientes, en rehabilitación, incurables y terminales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('623211','Residencias del sector privado para el cuidado de personas con problemas de retardo mental',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('623212','Residencias del sector público para el cuidado de personas con problemas de retardo mental',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('623221','Residencias del sector privado para el cuidado de personas con problemas de salud mental y abuso de substancias',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('623222','Residencias del sector público para el cuidado de personas con problemas de salud mental y abuso de substancias',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('623311','Asilos y otras residencias del sector privado para el cuidado de ancianos y discapacitados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('623312','Asilos y otras residencias del sector público para el cuidado de ancianos y discapacitados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('623991','Orfanatos y otras residencias de asistencia social pertenecientes al sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('623992','Orfanatos y otras residencias de asistencia social pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('624111','Servicios de orientación y trabajo social para la niñez y la juventud prestados por el sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('624112','Servicios de orientación y trabajo social para la niñez y la juventud prestados por el sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('624121','Centros del sector privado dedicados a la atención y cuidado diurno de ancianos y discapacitados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('624122','Centros del sector público dedicados a la atención y cuidado diurno de ancianos y discapacitados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('624191','Asistencia social de ayuda mutua',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('624191','Defensa de los Derechos Humanos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('624198','Otros servicios de orientación y trabajo social prestados por el sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('624199','Otros servicios de orientación y trabajo social prestados por el sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('624211','Servicios de alimentación comunitarios prestados por el sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('624212','Servicios de alimentación comunitarios prestados por el sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('624221','Refugios temporales comunitarios pertenecientes al sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('624222','Refugios temporales comunitarios pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('624231','Servicios de emergencia comunitarios prestados por el sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('624232','Servicios de emergencia comunitarios prestados por el sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('624311','Servicios de capacitación para el trabajo prestados por el sector privado a personas desempleadas, subempleadas o discapacitadas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('624312','Servicios de capacitación para el trabajo prestados por el sector público a personas desempleadas, subempleadas o discapacitadas.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('624411','Guarderías del sector privado.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('624412','Guarderías del sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('711111','Compañías de teatro del sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('711112','Compañías de teatro del sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('711121','Compañías de danza del sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('711122','Compañías de danza del sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('711131','Cantantes y grupos musicales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('711131','Producción y presentación de espectáculos públicos combinada con la promoción de los mismos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('711131','Producción y presentación de espectáculos en restaurantes, bares, salones de fiesta o de baile y centros nocturnos.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('711132','Grupos musicales del sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('711191','Otras compañías y grupos circenses, de magia, de patinaje y de otros espectáculos artísticos no clasificados en otra parte',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('711192','Otras compañías y grupos de espectáculos artísticos del sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('711211','Presentación de espectáculos públicos deportivos profesionales y semiprofesionales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('711212','Equipos deportivos profesionales y semiprofesionales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('711311','Promotores del sector privado con instalaciones para la presentación de espectáculos artísticos, deportivos y similares',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('711312','Promotores del sector público con instalaciones para la presentación de espectáculos artísticos, deportivos y similares.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('711320','Promotores de espectáculos artísticos, deportivos y similares que no cuentan con instalaciones para presentarlos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('711410','Agentes y representantes de artistas, deportistas y similares',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('711510','Artistas y técnicos independientes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('711510','Creación y producción de obras artísticas y culturales, autorizando a terceros su publicación y enajenación al público, y en su caso, la transmisión de derechos patrimoniales o licencias de uso',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('711510','Explotación de derechos de autor de terceros',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('712111','Museos del sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('712111','Museos del sector privado.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('712112','Museos del sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('712120','Sitios históricos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('712131','Jardines botánicos y zoológicos del sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('712132','Jardines botánicos y zoológicos del sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('712190','Grutas, parques naturales y otros sitios del patrimonio nacional',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713111','Parques del sector privado con instalaciones recreativas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713112','Parques del sector público con instalaciones recreativas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713120','Casas de juegos electrónicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713210','Recepción, captación, cruce o explotación de apuestas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713291','Venta de billetes de lotería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713291','Realización de juegos con apuestas y sorteos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713299','Concursos en los que se ofrezcan premios y en alguna etapa de su desarrollo intervenga directa o indirectamente el azar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713299','Juegos o concursos de destreza',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713910','Campos de golf',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713920','Pistas para esquiar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713930','Marinas turísticas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713941','Clubes deportivos del sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713942','Clubes deportivos del sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713943','Balnearios del sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713944','Balnearios del sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713945','Centros de acondicionamiento físico pertenecientes al sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713946','Centros de acondicionamiento físico pertenecientes al sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713950','Boliches',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713991','Billares',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713998','Otros servicios recreativos prestados por el sector privado',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713998','guías de turismo que trabajan por cuenta propia',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('713999','Otros servicios recreativos prestados por el sector público',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('721111','Hoteles con otros servicios integrados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('721111','Servicios de exportación de servicios de hotelería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('721111','Servicios de exportación de servicios de convenciones y exposiciones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('721112','Hoteles sin otros servicios integrados',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('721113','Moteles',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('721120','Hoteles con casino',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('721190','Cabañas, villas y similares',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('721210','Campamentos y albergues recreativos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('721311','Pensiones y casas de huéspedes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('721312','Departamentos y casas amueblados con servicios de hotelería',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('721312','Alquiler de inmuebles destinados a hospedaje a través de terceros',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('722111','Restaurantes-bar con servicio de meseros',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('722112','Restaurantes sin bar y con servicio de meseros',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('722211','Restaurantes de autoservicio',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('722212','Restaurantes de comida para llevar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('722310','Servicios de comedor para empresas e instituciones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('722320','Servicios de preparación de alimentos para ocasiones especiales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('722330','Servicios de preparación de alimentos en unidades móviles',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('722330','Preparación y venta de comida y antojitos en general',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('722411','Centros nocturnos, discotecas y similares',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('722412','Bares y cantinas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('722413','Cervecerías',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('722414','Pulquerías',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811111','Reparación mecánica en general de automóviles y camiones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811112','Reparación del sistema eléctrico de automóviles y camiones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811113','Rectificación de motores de automóviles y camiones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811114','Reparación de transmisiones de automóviles y camiones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811115','Reparación de suspensiones de automóviles y camiones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811116','Alineación y balanceo de automóviles y camiones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811119','Otras reparaciones mecánicas y eléctricas de automóviles y camiones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811121','Hojalatería y pintura de automóviles y camiones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811122','Tapicería de automóviles y camiones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811129','Instalación de cristales y otras reparaciones a la carrocería de automóviles y camiones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811191','Reparación menor de llantas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811192','Lavado y lubricado de automóviles y camiones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811199','Otros servicios de reparación y mantenimiento de automóviles y camiones',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811211','Reparación y mantenimiento de equipo electrónico de uso doméstico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811219','Reparación y mantenimiento de otro equipo electrónico y de equipo de precisión',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811311','Reparación y mantenimiento de maquinaria y equipo agropecuario y forestal',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811312','Reparación y mantenimiento de maquinaria y equipo industrial',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811313','Reparación y mantenimiento de maquinaria y equipo para mover, acomodar y levantar materiales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811314','Reparación y mantenimiento de maquinaria y equipo comercial y de servicios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811410','Reparación y mantenimiento de aparatos eléctricos para el hogar y personales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811420','Reparación de tapicería de muebles para el hogar',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811430','Reparación de calzado y otros artículos de piel y cuero',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811491','Cerrajerías',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811492','Reparación y mantenimiento de motocicletas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811493','Reparación y mantenimiento de bicicletas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('811499','Reparación y mantenimiento de otros artículos para el hogar y personales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('812110','Salones y clínicas de belleza y peluquerías',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('812120','Baños públicos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('812130','Sanitarios públicos y bolerías',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('812210','Lavanderías y tintorerías',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('812310','Servicios funerarios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('812320','Administración de cementerios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('812410','Estacionamientos y pensiones para automóviles',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('812910','Servicios de revelado de fotografías',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('812990','Otros servicios como máquinas fotográficas que funcionan con monedas, de casilleros que funcionan con monedas, de guardapaquetes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('813110','Asociaciones, organizaciones y cámaras de productores, comerciantes y prestadores de servicios',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('813120','Asociaciones y organizaciones laborales y sindicales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('813120','Asociaciones y organizaciones patronales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('813130','Asociaciones y organizaciones de profesionistas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('813140','Federaciones y otras asociaciones regulatorias de actividades recreativas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('813210','Asociaciones y organizaciones religiosas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('813220','Asociaciones y organizaciones políticas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('813230','Asociaciones y organizaciones civiles',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('813230','Asociaciones y organizaciones civiles de condóminos.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('813230','Asociaciones de padres de familia.',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('813230','Sociedades de gestión colectiva constituidas de acuerdo con la Ley Federal del Derecho de Autor',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('813230','Sociedades cooperativas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('813230','Oranismos que agrupan a Sociedades Cooperativas ya sea de productores o de consumidores',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('813230','Asociaciones y sociedades que administren distritos o unidades de riego',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('813230','Actividades culturales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('813230','Actividades Ecológicas',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('813230','Actividades para la reproducción de especies en protección y peligro de extinción',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('814110','Hogares con empleados domésticos',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('931110','Cámara de Senadores, la Cámara de Diputados, la Asamblea de Representantes',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('931210','Administración pública federal en general',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('931220','Administración pública estatal en general',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('931230','Administración pública municipal en general',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('931310','Regulación y fomento federal del desarrollo económico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('931320','Regulación y fomento estatal del desarrollo económico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('931330','Regulación y fomento municipal del desarrollo económico',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('931410','Impartición de justicia y mantenimiento de la seguridad y el orden público en el nivel federal',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('931420','Impartición de justicia y mantenimiento de la seguridad y el orden público en el nivel estatal',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('931430','Impartición de justicia y mantenimiento de la seguridad y el orden público en el nivel municipal',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('931510','Regulación y fomento federal de actividades para mejorar y preservar el medio ambiente',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('931520','Regulación y fomento estatal de actividades para mejorar y preservar el medio ambiente',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('931530','Regulación y fomento municipal de actividades para mejorar y preservar el medio ambiente',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('931610','Actividades administrativas federales de instituciones de bienestar social',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('931620','Actividades administrativas estatales de instituciones de bienestar social',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('931630','Actividades administrativas municipales de instituciones de bienestar social',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('931710','Relaciones exteriores',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('931810','Actividades de seguridad nacional',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('932110','Organismos internacionales',1,0);
INSERT INTO RegimenFiscal(`Key`, Description, Fisica, Moral) VALUES('932120','Sedes diplomáticas y otras unidades extraterritoriales',1,0);

UPDATE RegimenFiscal SET Description = UPPER(Description) WHERE Id > 0;

SET SQL_SAFE_UPDATES = 0;

DELETE n1 FROM RegimenFiscal n1, RegimenFiscal n2 WHERE n1.`Description` = n2.`Description` AND n1.`Id` < n2.`Id`;

SET SQL_SAFE_UPDATES = 1;

-- --------------------------------------------------------

DROP TABLE IF EXISTS `Company`;

--
-- Estructura de tabla `Company`
--

CREATE TABLE `Company` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `CompanyName` varchar(50) NOT NULL,
  `CompanyKey` varchar(30) NULL,
  `AddressId` int(11) NOT NULL,
  `PhoneNumber` varchar(13) NULL,
  `CellphoneNumber` varchar(17) NULL,
  `EmailAddress` varchar(50) NULL,
  `FiscalName` varchar(50) NULL,
  `AddressSATId` int(11) NOT NULL,
  `RegimenFiscalId` int(11) NOT NULL,
  `RFC` varchar(13) NOT NULL,
  `CURP` varchar(18) NULL,
  `LoginID` VARCHAR(256) NOT NULL,
  `PasswordEncrypted` varchar(256) NOT NULL,
  `ApiKey` varchar(100) NULL,
  `BusinessActivity` varchar(30) NULL,
  `Logo` longblob NULL,
  
  -- START: AuditableEntity --
  `CreatedDate` DATETIME NULL,
  `CreateBy` VARCHAR(6) NULL,
  `ModifiedDate` DATETIME NULL,
  `ModifiedBy` VARCHAR(6) NULL,
  -- END: AuditableEntity --
  
	FOREIGN KEY (AddressId) REFERENCES Address(Id),
    FOREIGN KEY (AddressSATId) REFERENCES AddressSAT(Id),
    FOREIGN KEY (RegimenFiscalId) REFERENCES RegimenFiscal(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los datos fiscales de un cliente';

-- --------------------------------------------------------

DROP TABLE IF EXISTS `Bank`;

--
-- Estructura de tabla `Bank`
--

CREATE TABLE `Bank` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `Name` varchar(30) NOT NULL,
  `Logo` longblob NULL,
  
  -- START: AuditableEntity --
  `CreatedDate` DATETIME NULL,
  `CreateBy` VARCHAR(6) NULL,
  `ModifiedDate` DATETIME NULL,
  `ModifiedBy` VARCHAR(6) NULL
  -- END: AuditableEntity --
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los bancos';

-- --------------------------------------------------------

DROP TABLE IF EXISTS `AccountBank`;

--
-- Estructura de tabla `AccountBank`
--

CREATE TABLE `AccountBank` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `Account` varchar(30) NOT NULL,
  `BankBranch` varchar(30) NULL,
  `Key` int(11) NOT NULL,
  `BankId` int(11) NOT NULL,
  `CompanyId` int(11) NOT NULL,
  
  -- START: AuditableEntity --
  `CreatedDate` DATETIME NULL,
  `CreateBy` VARCHAR(6) NULL,
  `ModifiedDate` DATETIME NULL,
  `ModifiedBy` VARCHAR(6) NULL,
  -- END: AuditableEntity --
  
    FOREIGN KEY (BankId) REFERENCES Bank(Id),
    FOREIGN KEY (CompanyId) REFERENCES Company(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar las cuentas bancarias de la compañia';

-- --------------------------------------------------------

DROP TABLE IF EXISTS `Shift`;

--
-- Estructura de tabla `Shift`
--

CREATE TABLE `Shift`
(
	`Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
	`Name` varchar(50) NOT NULL,
    `StartTime` TIME NOT NULL,
    `EndTime` TIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los turnos que se manejan';

INSERT INTO Shift(Name, StartTime, EndTime) VALUES('DAY', '07:00:00', '15:00:00');
INSERT INTO Shift(Name, StartTime, EndTime) VALUES('EVENING', '15:00:00', '23:00:00');
INSERT INTO Shift(Name, StartTime, EndTime) VALUES('NIGHT', '23:00:00', '07:00:00');
INSERT INTO Shift(Name, StartTime, EndTime) VALUES('ALL DAY', '07:00:00', '23:00:00');

-- --------------------------------------------------------

DROP TABLE IF EXISTS `Department`;

--
-- Estructura de tabla `Department`
--

CREATE TABLE `Department`
(
	`Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
	`Name` varchar(100) NOT NULL,
    `GroupName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los departamentos de la compañia';

INSERT INTO Department (Name, GroupName) VALUES('Executive', 'Executive General and Administration');
INSERT INTO Department (Name, GroupName) VALUES('Pharmacy Manager', 'Executive General and Administration');
INSERT INTO Department (Name, GroupName) VALUES('Administration Management', 'Executive General and Administration');
INSERT INTO Department (Name, GroupName) VALUES('Sales', 'Sales & Marketing');

UPDATE Department SET Name = UPPER(Name), GroupName = UPPER(GroupName) WHERE Id > 0;

-- --------------------------------------------------------

DROP TABLE IF EXISTS `JobTitle`;

--
-- Estructura de tabla `JobTitle`
--

CREATE TABLE `JobTitle` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `Name` varchar(100) NOT NULL,
  `DepartmentId` INT NULL COMMENT 'Llave foranea de Departamento',
  
  FOREIGN KEY (DepartmentId) REFERENCES Department(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los usuarios (empleados) registrados';

INSERT INTO JobTitle (Name, DepartmentId) VALUES('VENDEDOR',4);
-- INSERT INTO JobTitle (Name) VALUES('DOCTOR',5);

-- --------------------------------------------------------

DROP TABLE IF EXISTS `Employee`;

--
-- Estructura de tabla `Employee`
--

CREATE TABLE `Employee` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `EmployeeIDNumber` VARCHAR(100) NOT NULL,
  `IS` varchar(5) NULL,
  `FirstName` varchar(30) NULL,
  `MiddleName` varchar(30) NULL,
  `LastName` varchar(30) NULL,
  `FullName` varchar(50) NULL,
  `PhoneNumber` varchar(10) NULL,
  `CellphoneNumber` varchar(13) NULL,
  `JobTitleId` INT NULL COMMENT 'Llave foranea de Puesto de Trabajo',
  `BirthDate` VARCHAR(10) NULL,
  `MaritalStatusId` INT NULL COMMENT 'Llave foranea de Estado Civil',
  `GenderId` INT NULL COMMENT 'Llave foranea de Genero',
  `AddressId` int(11) NULL,
  `RFC` varchar(13) NULL,
  `CURP` varchar(18) NULL,
  `NSS` varchar(16) NULL,
  `ProfilePhoto` longblob NULL,
  `FingerPrint` longblob NULL,
  `ShiftId` INT NOT NULL COMMENT 'Llave foranea de Turno',
  `StartDate` DATE NOT NULL,
  `EndDate` DATE NULL,
  `IsActive` tinyint(1) NOT NULL,
  
  -- START: AuditableEntity --
  `CreatedDate` DATETIME NULL,
  `CreateBy` VARCHAR(6) NULL,
  `ModifiedDate` DATETIME NULL,
  `ModifiedBy` VARCHAR(6) NULL,
  -- END: AuditableEntity --
  
  FOREIGN KEY (JobTitleId) REFERENCES JobTitle(Id),
  FOREIGN KEY (AddressId) REFERENCES Address(Id),
  FOREIGN KEY (MaritalStatusId) REFERENCES MaritalStatus(Id),
  FOREIGN KEY (ShiftId) REFERENCES Shift(Id),
  FOREIGN KEY (GenderId) REFERENCES Gender(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los usuarios (empleados) registrados';

-- --------------------------------------------------------

DROP TABLE IF EXISTS `Site`;

--
-- Estructura de tabla `Site`
--

CREATE TABLE `Site`
(
	`Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    `CompanyId` INT NOT NULL,
	`CompanyName` varchar(100) NOT NULL,
    `UniquePhysicalID` varchar(100) NOT NULL,
    `AddressId` int(11) NOT NULL,
    `ContactName` varchar(100) NULL,
    `PhoneNumber` varchar(10) NULL,
    `IsValid` tinyint(1) NOT NULL,
    `Photo` longblob NULL,
    
	-- START: AuditableEntity --
    `CreatedDate` DATETIME NULL,
    `CreateBy` VARCHAR(6) NULL,
    `ModifiedDate` DATETIME NULL,
    `ModifiedBy` VARCHAR(6) NULL,
    -- END: AuditableEntity --
  
    FOREIGN KEY (AddressId) REFERENCES Address(Id),
    FOREIGN KEY (CompanyId) REFERENCES Company(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar las sucursales';

-- --------------------------------------------------------

--
-- Estructura de tabla `EmployeeDepartmentHistory`
--

-- CREATE TABLE `EmployeeDepartmentHistory`
-- (
-- 	`Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
--     `EmployeeId` INT NOT NULL,
--     `JobTitleId` INT NOT NULL,
--     `DepartmentId` INT NOT NULL,
--     `SiteId` INT NOT NULL,
--     `ShiftId` INT NOT NULL,
--     
-- 	-- START: AuditableEntity --
--     `CreatedDate` DATETIME NULL,
--     `CreateBy` VARCHAR(6) NULL,
--     `ModifiedDate` DATETIME NULL,
--     `ModifiedBy` VARCHAR(6) NULL,
--     -- END: AuditableEntity --
--     
--     FOREIGN KEY (EmployeeId) REFERENCES Employee(Id),
--     FOREIGN KEY (JobTitleId) REFERENCES JobTitle(Id),
--     FOREIGN KEY (DepartmentId) REFERENCES Department(Id),
--     FOREIGN KEY (SiteId) REFERENCES Site(Id),
--     FOREIGN KEY (ShiftId) REFERENCES Shift(Id)
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar el horario, departamento e informacion de donde ha estado un empleado';

-- --------------------------------------------------------

DROP TABLE IF EXISTS `Role`;

--
-- Estructura de tabla `Role`
--
CREATE TABLE `Role` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `Name` VARCHAR(50) NOT NULL,
  `Description` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los roles de la aplicacion';

INSERT INTO Role (Name, Description) VALUES('ADMINISTRADOR', 'God Mode allows us, among other things to control users, products, managae credentials, ...');
INSERT INTO Role (Name, Description) VALUES('BASIC', 'The employee can make sales, consult reports, make cash cuts');
INSERT INTO Role (Name, Description) VALUES('DOCTOR', 'The employee can access module Medical');

-- --------------------------------------------------------

DROP TABLE IF EXISTS `User`;

--
-- Estructura de tabla `User`
--

CREATE TABLE `User` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `LoginID` VARCHAR(256) NOT NULL,
  `PasswordEncrypted` varchar(256) NOT NULL,
  `MobilePIN` varchar(50) NOT NULL,
  `EmailAddress` varchar(50) NOT NULL,
  `PasswordQuestion` varchar(100) NOT NULL,
  `PasswordAnswer` varchar(100) NOT NULL,
  `AccessFailed` INT NOT NULL,
  `IsWelcome` tinyint(1) NOT NULL,
  `IsApproved` tinyint(1) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `IsEnabled` tinyint(1) NOT NULL,
  `EmployeeId` INT NOT NULL,
  `RoleId` INT NULL COMMENT 'Llave foranea de Rol',
  
  -- START: AuditableEntity --
  `CreatedDate` DATETIME NULL,
  `CreateBy` VARCHAR(6) NULL,
  `ModifiedDate` DATETIME NULL,
  `ModifiedBy` VARCHAR(6) NULL,
  -- END: AuditableEntity --
  
  FOREIGN KEY (EmployeeId) REFERENCES Employee(Id),
  FOREIGN KEY (RoleId) REFERENCES Role(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar la informacion de las credenciales de usuario';

-- --------------------------------------------------------

DROP TABLE IF EXISTS `Permission`;

--
-- Estructura de tabla `Permission`
--
CREATE TABLE `Permission` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `Name` VARCHAR(50) NOT NULL,
  `Menu` VARCHAR(50) NOT NULL,
  `Submenu` VARCHAR(50) NULL,
  `ControlName` VARCHAR(30) NOT NULL,
  `SubControlName` VARCHAR(30) NULL,
  `ControlImage` VARCHAR(100) NOT NULL,
  `SubControlImage` VARCHAR(100) NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los permisos que tiene el usuario';

INSERT INTO Permission (Name, Menu, Submenu, ControlName, SubControlName, ControlImage, SubControlImage) VALUES('Ventas', 'F1 Ventas', NULL, 'btnVentas', NULL, 'ventas.png', NULL);
INSERT INTO Permission (Name, Menu, Submenu, ControlName, SubControlName, ControlImage, SubControlImage) VALUES('Productos', 'F2 Productos', NULL, 'btnProductos', NULL, 'productos.png', NULL);
INSERT INTO Permission (Name, Menu, Submenu, ControlName, SubControlName, ControlImage, SubControlImage) VALUES('Inventario', 'F3 Inventario', NULL, 'btnInventario', NULL, 'inventario.png', NULL);
INSERT INTO Permission (Name, Menu, Submenu, ControlName, SubControlName, ControlImage, SubControlImage) VALUES('Operaciones', 'F4 Operaciones', NULL, 'btnOperaciones', NULL, 'procesos.png', NULL);
INSERT INTO Permission (Name, Menu, Submenu, ControlName, SubControlName, ControlImage, SubControlImage) VALUES('Configuracion', 'F5 Configuracion', NULL, 'btnConfiguracion', NULL, 'configuracion.png', NULL);
INSERT INTO Permission (Name, Menu, Submenu, ControlName, SubControlName, ControlImage, SubControlImage) VALUES('Corte', 'F6 Corte', NULL, 'btnCorte', NULL, 'corte.png', NULL);
INSERT INTO Permission (Name, Menu, Submenu, ControlName, SubControlName, ControlImage, SubControlImage) VALUES('Reportes', 'F7 Reportes', NULL, 'btnReportes', NULL, 'reportes.png', NULL);
INSERT INTO Permission (Name, Menu, Submenu, ControlName, SubControlName, ControlImage, SubControlImage) VALUES('Estadisticas', 'F7 Estadisticas', NULL, 'btnEstadisticas', NULL, 'estadisticas.png', NULL);
INSERT INTO Permission (Name, Menu, Submenu, ControlName, SubControlName, ControlImage, SubControlImage) VALUES('Medico', 'F9 Medico', NULL, 'btnMedico', NULL, 'medico.png', NULL);

-- --------------------------------------------------------

DROP TABLE IF EXISTS `RolePermission`;

--
-- Estructura de tabla `RolePermission`
--
CREATE TABLE `RolePermission` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `RoleId` INT NOT NULL,
  `PermissionId` INT NOT NULL,
  
  FOREIGN KEY (RoleId) REFERENCES Role(Id),
  FOREIGN KEY (PermissionId) REFERENCES Permission(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar la asignacion de permisos para el rol seleccionado';

INSERT INTO RolePermission (RoleId, PermissionId) VALUES(1, 1);
INSERT INTO RolePermission (RoleId, PermissionId) VALUES(1, 2);
INSERT INTO RolePermission (RoleId, PermissionId) VALUES(1, 3);
INSERT INTO RolePermission (RoleId, PermissionId) VALUES(1, 4);
INSERT INTO RolePermission (RoleId, PermissionId) VALUES(1, 5);
INSERT INTO RolePermission (RoleId, PermissionId) VALUES(1, 6);
INSERT INTO RolePermission (RoleId, PermissionId) VALUES(1, 7);
INSERT INTO RolePermission (RoleId, PermissionId) VALUES(1, 8);
INSERT INTO RolePermission (RoleId, PermissionId) VALUES(1, 9);

-- --------------------------------------------------------

DROP TABLE IF EXISTS `ProductCategory`;

--
-- Estructura de tabla `ProductCategory`
--

CREATE TABLE `ProductCategory` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar las categorias de los productos';

INSERT INTO ProductCategory (Name) VALUES('FARMACIA');
INSERT INTO ProductCategory (Name) VALUES('SERVICIOS');

-- --------------------------------------------------------

DROP TABLE IF EXISTS `ProductSubCategory`;

--
-- Estructura de tabla `ProductSubCategory`
--

CREATE TABLE `ProductSubCategory` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `ProductCategoryId` INT NOT NULL COMMENT 'Llave foranea de Categoria de Producto',
  `Name` varchar(100) NOT NULL,
  FOREIGN KEY (ProductCategoryId) REFERENCES ProductCategory(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar las subcategorias de los productos';

INSERT INTO ProductSubCategory (ProductCategoryId, Name) VALUES(1, 'N/A');

-- --------------------------------------------------------

DROP TABLE IF EXISTS `Supplier`;

--
-- Estructura de tabla `Supplier`
--

CREATE TABLE `Supplier` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `SupplierKey` varchar(120) NOT NULL,
  `CompanyName` varchar(120) NOT NULL,
  `ContactName` varchar(120) NOT NULL,  
  `AddressId` int(11) NOT NULL,  
  `AddressSATId` int(11) NOT NULL,  
  `RFC` varchar(13) NULL,
  `CURP` varchar(18) NULL,
  `PhoneNumber` varchar(10) NULL,
  `CellphoneNumber` varchar(13) NULL,
  `EmailAddress` varchar(50) NOT NULL,
  `Comment` varchar(255) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `CreditLimit` decimal(20,2) NOT NULL DEFAULT '0.00',
  `DaysCredit` int(11) NOT NULL DEFAULT '0',
  `Logo` longblob NOT NULL,
  
  -- START: AuditableEntity --
  `CreatedDate` DATETIME NULL,
  `CreateBy` VARCHAR(6) NULL,
  `ModifiedDate` DATETIME NULL,
  `ModifiedBy` VARCHAR(6) NULL,
  -- END: AuditableEntity --
  
  FOREIGN KEY (AddressId) REFERENCES Address(Id),
  FOREIGN KEY (AddressSATId) REFERENCES AddressSAT(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los proveedores';

-- --------------------------------------------------------

DROP TABLE IF EXISTS `Product`;

--
-- Estructura de tabla `Product`
--

CREATE TABLE `Product` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `BarCode` varchar(45) NOT NULL,
  `AlternateKey` varchar(45) NULL,
  `Description` varchar(200) NULL,
  `IsService` tinyint(1) NOT NULL,
  `Location` varchar(10) NULL,
  `ActiveSubstance` varchar(200) NULL,
  `ProductSubCategoryId` INT NULL COMMENT 'Llave foranea de SubCategoria de Producto',
  `QuantityPerUnit` int(11) NOT NULL DEFAULT '0',
  `StandardCost` decimal(20,2) NOT NULL DEFAULT '0.00',
  `ListPrice` decimal(20,2) NOT NULL DEFAULT '0.00',
  `IVA` decimal(20,2) NOT NULL DEFAULT '0.00',
  `IsUseInStock` tinyint(1) NOT NULL,
  -- `UnitsInStock` int(11) NOT NULL DEFAULT '0',
  `IsDiscontinued` tinyint(1) NOT NULL DEFAULT '0',
  `DiscontinuedDate` DATE NULL,
  `InvMin` int(11) NOT NULL DEFAULT '0',
  `InvMax` int(11) NOT NULL DEFAULT '0',
  `IsLot` tinyint(1) NOT NULL,
  `IsRecipe` tinyint(1) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `SupplierId` int(11) NOT NULL,  
  
  
  -- START: AuditableEntity --
  `CreatedDate` DATETIME NULL,
  `CreateBy` VARCHAR(6) NULL,
  `ModifiedDate` DATETIME NULL,
  `ModifiedBy` VARCHAR(6) NULL,
  -- END: AuditableEntity --
  
  FOREIGN KEY (SupplierId) REFERENCES Supplier(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los productos del inventario';

-- --------------------------------------------------------

DROP TABLE IF EXISTS `SupplierProduct`;

--
-- Estructura de tabla `SupplierProduct`
--

CREATE TABLE `SupplierProduct` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `ProductId` int(11) NOT NULL,
  `SupplierId` int(11) NOT NULL,
  `SupplierKey` varchar(120) NOT NULL,
  `StandardCost` decimal(20,2) NOT NULL DEFAULT '0.00',
  
    -- START: AuditableEntity --
  `CreatedDate` DATETIME NULL,
  `CreateBy` VARCHAR(6) NULL,
  `ModifiedDate` DATETIME NULL,
  `ModifiedBy` VARCHAR(6) NULL,
  -- END: AuditableEntity --
  
  FOREIGN KEY (ProductId) REFERENCES Product(Id),
  FOREIGN KEY (SupplierId) REFERENCES Supplier(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar las imagenes';

-- --------------------------------------------------------

DROP TABLE IF EXISTS `Image`;

--
-- Estructura de tabla `Image`
--

CREATE TABLE `Image` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `Image` longblob NOT NULL,
  
    -- START: AuditableEntity --
  `CreatedDate` DATETIME NULL,
  `CreateBy` VARCHAR(6) NULL,
  `ModifiedDate` DATETIME NULL,
  `ModifiedBy` VARCHAR(6) NULL
  -- END: AuditableEntity --
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar las imagenes';

-- --------------------------------------------------------

DROP TABLE IF EXISTS `ProductImage`;

--
-- Estructura de tabla `ProductImage`
--

CREATE TABLE `ProductImage` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `ProductId` INT NOT NULL COMMENT 'Llave foranea de Producto',
  `ImageId` INT NOT NULL COMMENT 'Llave foranea de Image',
  
    -- START: AuditableEntity --
  `CreatedDate` DATETIME NULL,
  `CreateBy` VARCHAR(6) NULL,
  `ModifiedDate` DATETIME NULL,
  `ModifiedBy` VARCHAR(6) NULL,
  -- END: AuditableEntity --
  
  FOREIGN KEY (ProductId) REFERENCES Product(Id),
  FOREIGN KEY (ImageId) REFERENCES Image(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar las imagenes de un producto';

-- --------------------------------------------------------

DROP TABLE IF EXISTS `ProductInventory`;

--
-- Estructura de tabla `ProductInventory`
--

CREATE TABLE `ProductInventory` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `ProductId` INT NOT NULL COMMENT 'Llave foranea de Producto',
  `SiteId` INT NOT NULL COMMENT 'Llave foranea de Sucursal',
  `UnitsInStock` int(11) NOT NULL DEFAULT '0',
  
    -- START: AuditableEntity --
  `CreatedDate` DATETIME NULL,
  `CreateBy` VARCHAR(6) NULL,
  `ModifiedDate` DATETIME NULL,
  `ModifiedBy` VARCHAR(6) NULL,
  -- END: AuditableEntity --
  
  FOREIGN KEY (ProductId) REFERENCES Product(Id),
  FOREIGN KEY (SiteId) REFERENCES Site(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar el inventario de los productos';

-- --------------------------------------------------------

DROP TABLE IF EXISTS `ProductCostHistory`;

--
-- Estructura de tabla `ProductCostHistory`
--

CREATE TABLE `ProductCostHistory` (
   `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
   `ProductId` INT NOT NULL COMMENT 'Llave foranea de Producto',
   `SiteId` INT NOT NULL COMMENT 'Llave foranea de Sucursal',
   `StartDate` DATETIME NOT NULL,
   `EndDate` DATETIME NULL,
   `StandardCost` decimal(20,2) NOT NULL DEFAULT '0.00',
   
  -- START: AuditableEntity --
  `CreatedDate` DATETIME NULL,
  `CreateBy` VARCHAR(6) NULL,
  `ModifiedDate` DATETIME NULL,
  `ModifiedBy` VARCHAR(6) NULL,
  -- END: AuditableEntity --
  
   FOREIGN KEY (ProductId) REFERENCES Product(Id),
   FOREIGN KEY (SiteId) REFERENCES Site(Id)
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar el historial de los costos de un producto en especifico';

-- --------------------------------------------------------

DROP TABLE IF EXISTS `ProductListPriceHistory`;

--
-- Estructura de tabla `ProductListPriceHistory`
--

 CREATE TABLE `ProductListPriceHistory` (
   `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
   `ProductId` INT NOT NULL COMMENT 'Llave foranea de Producto',
   `SiteId` INT NOT NULL COMMENT 'Llave foranea de Sucursal',
   `StartDate` DATETIME NOT NULL,
   `EndDate` DATETIME NULL,
   `ListPrice` decimal(20,2) NOT NULL DEFAULT '0.00',

    -- START: AuditableEntity --
  `CreatedDate` DATETIME NULL,
  `CreateBy` VARCHAR(6) NULL,
  `ModifiedDate` DATETIME NULL,
  `ModifiedBy` VARCHAR(6) NULL,
  -- END: AuditableEntity --
  
   FOREIGN KEY (ProductId) REFERENCES Product(Id),
   FOREIGN KEY (SiteId) REFERENCES Site(Id)
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar el historial de los precios de un producto en especifico';
 
-- --------------------------------------------------------

DROP TABLE IF EXISTS `Customer`;

--
-- Estructura de tabla `Customer`
--

CREATE TABLE `Customer` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `CustomerKey` varchar(120) NOT NULL,
  `FullName` varchar(50) NULL,
  `ContactName` varchar(120) NOT NULL,  
  `AddressId` int(11) NOT NULL,  
  `AddressSATId` int(11) NOT NULL,  
  `RFC` varchar(13) NULL,
  `CURP` varchar(18) NULL,
  `PhoneNumber` varchar(10) NULL,
  `CellphoneNumber` varchar(13) NULL,
  `EmailAddress` varchar(50) NOT NULL,
  `Comment` varchar(255) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `CreditLimit` decimal(20,2) NOT NULL DEFAULT '0.00',
  `DaysCredit` int(11) NOT NULL DEFAULT '0',
  `Photo` longblob NOT NULL,
  `UseCFDI` varchar(10) DEFAULT NULL,
  
  -- START: AuditableEntity --
  `CreatedDate` DATETIME NULL,
  `CreateBy` VARCHAR(6) NULL,
  `ModifiedDate` DATETIME NULL,
  `ModifiedBy` VARCHAR(6) NULL,
  -- END: AuditableEntity --
  
  FOREIGN KEY (AddressId) REFERENCES Address(Id),
  FOREIGN KEY (AddressSATId) REFERENCES AddressSAT(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los clientes';

-- --------------------------------------------------------

DROP TABLE IF EXISTS `ControlEmployeeAsistance`;

--
-- Estructura de tabla `ControlEmployeeAsistance`
--

CREATE TABLE `ControlEmployeeAsistance` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `StartTime` DATETIME NOT NULL,
  `EndTime` DATETIME NOT NULL,
  `HourWork` decimal(20,2) NOT NULL DEFAULT '0.00',
  `EmployeeId` int(11) NOT NULL,  
  `ShiftId` int(11) NOT NULL,  
  
  -- START: AuditableEntity --
  `CreatedDate` DATETIME NULL,
  `CreateBy` VARCHAR(6) NULL,
  `ModifiedDate` DATETIME NULL,
  `ModifiedBy` VARCHAR(6) NULL,
  -- END: AuditableEntity --
  
  FOREIGN KEY (EmployeeId) REFERENCES Employee(Id),
  FOREIGN KEY (ShiftId) REFERENCES Shift(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los proveedores';
 
-- --------------------------------------------------------

DROP TABLE IF EXISTS `AWBuildVersion`;

--
-- Estructura de tabla para la tabla `AWBuildVersion`
--

CREATE TABLE `AWBuildVersion` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `DataBaseVersion` VARCHAR(100) NOT NULL,
  `VersionDate` DATETIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar la version de la base de datos'; 

INSERT INTO AWBuildVersion (DataBaseVersion, VersionDate) VALUES ('1.0.0.0', CURRENT_TIMESTAMP());

-- 
-- --------------------------------------------------------

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;