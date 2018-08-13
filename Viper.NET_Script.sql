-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 13-08-2018 a las 02:04:54
-- Versión del servidor: 5.7.21
-- Versión de PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `viper_developments`
--
CREATE DATABASE IF NOT EXISTS `viper_developments` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `viper_developments`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoadTypeId` int(11) NOT NULL,
  `AddressTypeId` int(11) NOT NULL,
  `AddressLine1` varchar(100) CHARACTER SET utf8 NOT NULL,
  `AddressLine2` varchar(100) CHARACTER SET utf8 NOT NULL,
  `CountryRegionId` int(11) NOT NULL,
  `StateProvinceId` int(11) NOT NULL,
  `CityId` int(11) NOT NULL,
  `PostalCode` varchar(5) CHARACTER SET utf8 NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `CreatedBy` longtext,
  `LastUpdatedDate` datetime NOT NULL,
  `LastUpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `IX_AddressTypeId` (`AddressTypeId`) USING HASH,
  KEY `IX_CityId` (`CityId`) USING HASH,
  KEY `IX_CountryRegionId` (`CountryRegionId`) USING HASH,
  KEY `IX_RoadTypeId` (`RoadTypeId`) USING HASH,
  KEY `IX_StateProvinceId` (`StateProvinceId`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addresssat`
--

DROP TABLE IF EXISTS `addresssat`;
CREATE TABLE IF NOT EXISTS `addresssat` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoadTypeId` int(11) NOT NULL,
  `AddressTypeId` int(11) NOT NULL,
  `AddressLine1` varchar(100) CHARACTER SET utf8 NOT NULL,
  `AddressLine2` varchar(100) CHARACTER SET utf8 NOT NULL,
  `CountryRegionId` int(11) NOT NULL,
  `StateProvinceId` int(11) NOT NULL,
  `CityId` int(11) NOT NULL,
  `PostalCode` varchar(5) CHARACTER SET utf8 NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `CreatedBy` longtext,
  `LastUpdatedDate` datetime NOT NULL,
  `LastUpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `IX_AddressTypeId` (`AddressTypeId`) USING HASH,
  KEY `IX_CityId` (`CityId`) USING HASH,
  KEY `IX_CountryRegionId` (`CountryRegionId`) USING HASH,
  KEY `IX_RoadTypeId` (`RoadTypeId`) USING HASH,
  KEY `IX_StateProvinceId` (`StateProvinceId`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addresstype`
--

DROP TABLE IF EXISTS `addresstype`;
CREATE TABLE IF NOT EXISTS `addresstype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `StateProvinceId` int(11) NOT NULL,
  `CveEnt` varchar(2) CHARACTER SET utf8 NOT NULL,
  `CveCity` varchar(3) CHARACTER SET utf8 NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8 NOT NULL,
  `CveCab` varchar(7) CHARACTER SET utf8 DEFAULT NULL,
  `NameCab` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `PTOT` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `PMAS` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `PFEM` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `VTOT` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_StateProvinceId` (`StateProvinceId`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=14737 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(50) CHARACTER SET utf8 NOT NULL,
  `CompanyKey` varchar(30) CHARACTER SET utf8 NOT NULL,
  `AddressId` int(11) NOT NULL,
  `AddressSATId` int(11) NOT NULL,
  `RegimenFiscalId` int(11) NOT NULL,
  `PhoneNumber` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `CellphoneNumber` varchar(13) CHARACTER SET utf8 DEFAULT NULL,
  `EmailAddress` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `FiscalName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `RFC` varchar(13) CHARACTER SET utf8 NOT NULL,
  `CURP` varchar(18) CHARACTER SET utf8 NOT NULL,
  `ApiKey` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `BusinessActivity` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `UserId` int(11) NOT NULL,
  `Logo` longblob,
  `CreatedDate` datetime NOT NULL,
  `CreatedBy` longtext,
  `LastUpdatedDate` datetime NOT NULL,
  `LastUpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `IX_AddressId` (`AddressId`) USING HASH,
  KEY `IX_AddressSATId` (`AddressSATId`) USING HASH,
  KEY `IX_RegimenFiscalId` (`RegimenFiscalId`) USING HASH,
  KEY `IX_UserId` (`UserId`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countryregion`
--

DROP TABLE IF EXISTS `countryregion`;
CREATE TABLE IF NOT EXISTS `countryregion` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(100) CHARACTER SET utf8 NOT NULL,
  `FIPS104` varchar(2) CHARACTER SET utf8 NOT NULL,
  `ISO2` varchar(2) CHARACTER SET utf8 NOT NULL,
  `ISO3` varchar(3) CHARACTER SET utf8 NOT NULL,
  `ISON` varchar(30) CHARACTER SET utf8 NOT NULL,
  `Internet` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `Capital` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `MapReference` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `NationalitySingular` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `NationalityPlural` varchar(35) CHARACTER SET utf8 DEFAULT NULL,
  `Currency` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `CurrencyCode` varchar(3) CHARACTER SET utf8 DEFAULT NULL,
  `Population` bigint(20) NOT NULL,
  `Title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Comment` varchar(2048) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) CHARACTER SET utf8 NOT NULL,
  `GroupName` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeeNumber` varchar(100) CHARACTER SET utf8 NOT NULL,
  `IS` varchar(6) CHARACTER SET utf8 NOT NULL,
  `FirstName` varchar(50) CHARACTER SET utf8 NOT NULL,
  `MiddleName` varchar(50) CHARACTER SET utf8 NOT NULL,
  `LastName` varchar(50) CHARACTER SET utf8 NOT NULL,
  `FullName` varchar(150) CHARACTER SET utf8 NOT NULL,
  `PhoneNumber` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `CellphoneNumber` varchar(13) CHARACTER SET utf8 DEFAULT NULL,
  `BirthDate` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  `MaritalStatusId` int(11) NOT NULL,
  `GenderId` int(11) NOT NULL,
  `AddressId` int(11) NOT NULL,
  `RFC` varchar(13) CHARACTER SET utf8 DEFAULT NULL,
  `CURP` varchar(18) CHARACTER SET utf8 NOT NULL,
  `NSS` varchar(16) CHARACTER SET utf8 NOT NULL,
  `UserId` int(11) NOT NULL,
  `Photo` longblob,
  `FingerPrint` longblob,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `CreatedBy` longtext,
  `LastUpdatedDate` datetime NOT NULL,
  `LastUpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `IX_AddressId` (`AddressId`) USING HASH,
  KEY `IX_GenderId` (`GenderId`) USING HASH,
  KEY `IX_MaritalStatusId` (`MaritalStatusId`) USING HASH,
  KEY `IX_UserId` (`UserId`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employeedepartmenthistory`
--

DROP TABLE IF EXISTS `employeedepartmenthistory`;
CREATE TABLE IF NOT EXISTS `employeedepartmenthistory` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeeId` int(11) NOT NULL,
  `JobTitleId` int(11) NOT NULL,
  `DepartmentId` int(11) NOT NULL,
  `SiteId` int(11) NOT NULL,
  `ShiftId` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `CreatedBy` longtext,
  `LastUpdatedDate` datetime NOT NULL,
  `LastUpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `IX_DepartmentId` (`DepartmentId`) USING HASH,
  KEY `IX_EmployeeId` (`EmployeeId`) USING HASH,
  KEY `IX_JobTitleId` (`JobTitleId`) USING HASH,
  KEY `IX_ShiftId` (`ShiftId`) USING HASH,
  KEY `IX_SiteId` (`SiteId`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gender`
--

DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobtitle`
--

DROP TABLE IF EXISTS `jobtitle`;
CREATE TABLE IF NOT EXISTS `jobtitle` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) CHARACTER SET utf8 NOT NULL,
  `DepartmentId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_DepartmentId` (`DepartmentId`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maritalstatus`
--

DROP TABLE IF EXISTS `maritalstatus`;
CREATE TABLE IF NOT EXISTS `maritalstatus` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Menu` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Submenu` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ControlName` varchar(50) CHARACTER SET utf8 NOT NULL,
  `ControlImage` varchar(50) CHARACTER SET utf8 NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission`
--

DROP TABLE IF EXISTS `permission`;
CREATE TABLE IF NOT EXISTS `permission` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleId` int(11) NOT NULL,
  `ModuleId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ModuleId` (`ModuleId`) USING HASH,
  KEY `IX_RoleId` (`RoleId`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=731 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regimenfiscal`
--

DROP TABLE IF EXISTS `regimenfiscal`;
CREATE TABLE IF NOT EXISTS `regimenfiscal` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Key` varchar(6) CHARACTER SET utf8 NOT NULL,
  `Description` varchar(400) CHARACTER SET utf8 NOT NULL,
  `Fisica` tinyint(1) NOT NULL,
  `Moral` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10471 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roadtype`
--

DROP TABLE IF EXISTS `roadtype`;
CREATE TABLE IF NOT EXISTS `roadtype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) CHARACTER SET utf8 NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shift`
--

DROP TABLE IF EXISTS `shift`;
CREATE TABLE IF NOT EXISTS `shift` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) CHARACTER SET utf8 NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyId` int(11) NOT NULL,
  `SiteName` varchar(256) CHARACTER SET utf8 NOT NULL,
  `UniquePhysicalID` varchar(100) CHARACTER SET utf8 NOT NULL,
  `AddressId` int(11) NOT NULL,
  `ResponsibleName` varchar(100) CHARACTER SET utf8 NOT NULL,
  `PhoneNumber` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `CreatedBy` longtext,
  `LastUpdatedDate` datetime NOT NULL,
  `LastUpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `IX_AddressId` (`AddressId`) USING HASH,
  KEY `IX_CompanyId` (`CompanyId`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stateprovince`
--

DROP TABLE IF EXISTS `stateprovince`;
CREATE TABLE IF NOT EXISTS `stateprovince` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CountryRegionId` int(11) NOT NULL,
  `CveEnt` varchar(2) CHARACTER SET utf8 NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8 NOT NULL,
  `Abrev` varchar(10) CHARACTER SET utf8 NOT NULL,
  `CveCab` varchar(7) CHARACTER SET utf8 DEFAULT NULL,
  `NameCab` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `PTOT` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `PMAS` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `PFEM` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `VTOT` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_CountryRegionId` (`CountryRegionId`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `LoginID` varchar(20) CHARACTER SET utf8 NOT NULL,
  `PasswordEncrypted` varchar(256) CHARACTER SET utf8 NOT NULL,
  `PasswordQuestion` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `PasswordAnswer` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `RoleId` int(11) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  `IsWelcome` tinyint(1) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `CreatedBy` longtext,
  `LastUpdatedDate` datetime NOT NULL,
  `LastUpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `IX_RoleId` (`RoleId`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `__migrationhistory`
--

DROP TABLE IF EXISTS `__migrationhistory`;
CREATE TABLE IF NOT EXISTS `__migrationhistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8 NOT NULL,
  `ContextKey` varchar(300) CHARACTER SET utf8 NOT NULL,
  `Model` longblob NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_Address_AddressType_AddressTypeId` FOREIGN KEY (`AddressTypeId`) REFERENCES `addresstype` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Address_City_CityId` FOREIGN KEY (`CityId`) REFERENCES `city` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Address_CountryRegion_CountryRegionId` FOREIGN KEY (`CountryRegionId`) REFERENCES `countryregion` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Address_RoadType_RoadTypeId` FOREIGN KEY (`RoadTypeId`) REFERENCES `roadtype` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Address_StateProvince_StateProvinceId` FOREIGN KEY (`StateProvinceId`) REFERENCES `stateprovince` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `addresssat`
--
ALTER TABLE `addresssat`
  ADD CONSTRAINT `FK_AddressSAT_AddressType_AddressTypeId` FOREIGN KEY (`AddressTypeId`) REFERENCES `addresstype` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AddressSAT_City_CityId` FOREIGN KEY (`CityId`) REFERENCES `city` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AddressSAT_CountryRegion_CountryRegionId` FOREIGN KEY (`CountryRegionId`) REFERENCES `countryregion` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AddressSAT_RoadType_RoadTypeId` FOREIGN KEY (`RoadTypeId`) REFERENCES `roadtype` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AddressSAT_StateProvince_StateProvinceId` FOREIGN KEY (`StateProvinceId`) REFERENCES `stateprovince` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `FK_City_StateProvince_StateProvinceId` FOREIGN KEY (`StateProvinceId`) REFERENCES `stateprovince` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `FK_Company_AddressSAT_AddressSATId` FOREIGN KEY (`AddressSATId`) REFERENCES `addresssat` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Company_Address_AddressId` FOREIGN KEY (`AddressId`) REFERENCES `address` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Company_RegimenFiscal_RegimenFiscalId` FOREIGN KEY (`RegimenFiscalId`) REFERENCES `regimenfiscal` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Company_User_UserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `FK_Employee_Address_AddressId` FOREIGN KEY (`AddressId`) REFERENCES `address` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Employee_Gender_GenderId` FOREIGN KEY (`GenderId`) REFERENCES `gender` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Employee_MaritalStatus_MaritalStatusId` FOREIGN KEY (`MaritalStatusId`) REFERENCES `maritalstatus` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Employee_User_UserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `employeedepartmenthistory`
--
ALTER TABLE `employeedepartmenthistory`
  ADD CONSTRAINT `FK_EmployeeDepartmentHistory_Department_DepartmentId` FOREIGN KEY (`DepartmentId`) REFERENCES `department` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EmployeeDepartmentHistory_Employee_EmployeeId` FOREIGN KEY (`EmployeeId`) REFERENCES `employee` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EmployeeDepartmentHistory_JobTitle_JobTitleId` FOREIGN KEY (`JobTitleId`) REFERENCES `jobtitle` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EmployeeDepartmentHistory_Shift_ShiftId` FOREIGN KEY (`ShiftId`) REFERENCES `shift` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EmployeeDepartmentHistory_Site_SiteId` FOREIGN KEY (`SiteId`) REFERENCES `site` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `jobtitle`
--
ALTER TABLE `jobtitle`
  ADD CONSTRAINT `FK_JobTitle_Department_DepartmentId` FOREIGN KEY (`DepartmentId`) REFERENCES `department` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permission`
--
ALTER TABLE `permission`
  ADD CONSTRAINT `FK_Permission_Module_ModuleId` FOREIGN KEY (`ModuleId`) REFERENCES `module` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Permission_Role_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `role` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_Site_Address_AddressId` FOREIGN KEY (`AddressId`) REFERENCES `address` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Site_Company_CompanyId` FOREIGN KEY (`CompanyId`) REFERENCES `company` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `stateprovince`
--
ALTER TABLE `stateprovince`
  ADD CONSTRAINT `FK_StateProvince_CountryRegion_CountryRegionId` FOREIGN KEY (`CountryRegionId`) REFERENCES `countryregion` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_User_Role_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `role` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
