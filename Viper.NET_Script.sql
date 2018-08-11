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

-- --------------------------------------------------------

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

-- --------------------------------------------------------

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

-- --------------------------------------------------------

--
-- Estructura de tabla `RoadType`
--

CREATE TABLE `RoadType`
(
	`Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
	`Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los tipos de Vialidad';

-- --------------------------------------------------------

--
-- Estructura de tabla `AddressType`
--

CREATE TABLE `AddressType`
(
	`Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
	`Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los tipos de direccion';

-- --------------------------------------------------------

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
    FOREIGN KEY (AddressTypeId) REFERENCES AddressType(Id),
	FOREIGN KEY (CountryRegionId) REFERENCES CountryRegion(Id),
    FOREIGN KEY (StateProvinceId) REFERENCES StateProvince(Id),
    FOREIGN KEY (CityId) REFERENCES City(Id)
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
    FOREIGN KEY (AddressTypeId) REFERENCES AddressType(Id),
	FOREIGN KEY (CountryRegionId) REFERENCES CountryRegion(Id),
    FOREIGN KEY (StateProvinceId) REFERENCES StateProvince(Id),
    FOREIGN KEY (CityId) REFERENCES City(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar el domicilio fiscal registrado ante el SAT';

-- --------------------------------------------------------

--
-- Estructura de tabla `Gender`
--

CREATE TABLE `Gender` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `Abrev` varchar(1) NOT NULL,
  `Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los departamentos disponibles';

-- --------------------------------------------------------

--
-- Estructura de tabla `MaritalStatus`
--

CREATE TABLE `MaritalStatus` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los estados civiles disponibles';

-- --------------------------------------------------------

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

-- --------------------------------------------------------

--
-- Estructura de tabla `Role`
--
CREATE TABLE `Role` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `Name` VARCHAR(50) NOT NULL,
  `Description` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los roles de la aplicacion';

-- --------------------------------------------------------

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
  `RoleId` INT NULL COMMENT 'Llave foranea de Rol',
  
  -- START: AuditableEntity --
  `CreatedDate` DATETIME NULL,
  `CreateBy` VARCHAR(6) NULL,
  `ModifiedDate` DATETIME NULL,
  `ModifiedBy` VARCHAR(6) NULL,
  -- END: AuditableEntity --
  
	FOREIGN KEY (AddressId) REFERENCES Address(Id),
    FOREIGN KEY (AddressSATId) REFERENCES AddressSAT(Id),
    FOREIGN KEY (RegimenFiscalId) REFERENCES RegimenFiscal(Id),
    FOREIGN KEY (RoleId) REFERENCES Role(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los datos fiscales de un cliente';

-- --------------------------------------------------------

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

-- --------------------------------------------------------

--
-- Estructura de tabla `Department`
--

CREATE TABLE `Department`
(
	`Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
	`Name` varchar(100) NOT NULL,
    `GroupName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los departamentos de la compañia';

-- --------------------------------------------------------

--
-- Estructura de tabla `JobTitle`
--

CREATE TABLE `JobTitle` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `Name` varchar(100) NOT NULL,
  `DepartmentId` INT NULL COMMENT 'Llave foranea de Departamento',
  
  FOREIGN KEY (DepartmentId) REFERENCES Department(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los usuarios (empleados) registrados';

-- --------------------------------------------------------

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
  -- `JobTitleId` INT NULL COMMENT 'Llave foranea de Puesto de Trabajo',
  `BirthDate` VARCHAR(10) NULL,
  `MaritalStatusId` INT NULL COMMENT 'Llave foranea de Estado Civil',
  `GenderId` INT NULL COMMENT 'Llave foranea de Genero',
  `AddressId` int(11) NULL,
  `RFC` varchar(13) NULL,
  `CURP` varchar(18) NULL,
  `NSS` varchar(16) NULL,
  `ProfilePhoto` longblob NULL,
  `FingerPrint` longblob NULL,
  -- `ShiftId` INT NOT NULL COMMENT 'Llave foranea de Turno',
  `StartDate` DATE NOT NULL,
  `EndDate` DATE NULL,
  `IsActive` tinyint(1) NOT NULL,
  
  -- START: AuditableEntity --
  `CreatedDate` DATETIME NULL,
  `CreateBy` VARCHAR(6) NULL,
  `ModifiedDate` DATETIME NULL,
  `ModifiedBy` VARCHAR(6) NULL,
  -- END: AuditableEntity --
  
  -- FOREIGN KEY (JobTitleId) REFERENCES JobTitle(Id),
  FOREIGN KEY (AddressId) REFERENCES Address(Id),
  FOREIGN KEY (MaritalStatusId) REFERENCES MaritalStatus(Id),
  -- FOREIGN KEY (ShiftId) REFERENCES Shift(Id),
  FOREIGN KEY (GenderId) REFERENCES Gender(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los usuarios (empleados) registrados';

-- --------------------------------------------------------

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

CREATE TABLE `EmployeeDepartmentHistory`
(
	`Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    `EmployeeId` INT NOT NULL,
    `JobTitleId` INT NOT NULL,
    `DepartmentId` INT NOT NULL,
    `SiteId` INT NOT NULL,
    `ShiftId` INT NOT NULL,
    
	-- START: AuditableEntity --
    `CreatedDate` DATETIME NULL,
    `CreateBy` VARCHAR(6) NULL,
    `ModifiedDate` DATETIME NULL,
    `ModifiedBy` VARCHAR(6) NULL,
    -- END: AuditableEntity --
    
    FOREIGN KEY (EmployeeId) REFERENCES Employee(Id),
    FOREIGN KEY (JobTitleId) REFERENCES JobTitle(Id),
    FOREIGN KEY (DepartmentId) REFERENCES Department(Id),
    FOREIGN KEY (SiteId) REFERENCES Site(Id),
    FOREIGN KEY (ShiftId) REFERENCES Shift(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar el horario, departamento e informacion de donde ha estado un empleado';

-- --------------------------------------------------------

--
-- Estructura de tabla `User`
--

CREATE TABLE `User` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `LoginID` VARCHAR(256) NOT NULL,
  `PasswordEncrypted` varchar(256) NOT NULL,
  `MobilePIN` varchar(50) NULL,
  `EmailAddress` varchar(50) NOT NULL,
  `PasswordQuestion` varchar(100) NOT NULL,
  `PasswordAnswer` varchar(100) NOT NULL,
  `AccessFailed` INT NOT NULL,
  `IsWelcome` tinyint(1) NOT NULL,
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

--
-- Estructura de tabla `Module`
--
CREATE TABLE `Module` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `Name` VARCHAR(50) NOT NULL,
  `Menu` VARCHAR(50) NOT NULL,
  `Submenu` VARCHAR(50) NULL,
  `ControlName` VARCHAR(50) NOT NULL,
  `ControlImage` VARCHAR(50) NOT NULL,
  `IsActive` TINYINT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los modulos que tendra el sistema';

-- --------------------------------------------------------

--
-- Estructura de tabla `Permission`
--
CREATE TABLE `Permission` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `RoleId` INT NOT NULL,
  `ModuleId` INT NOT NULL,
  
  FOREIGN KEY (RoleId) REFERENCES Role(Id),
  FOREIGN KEY (ModuleId) REFERENCES Module(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar la asignacion de permisos para el rol seleccionado';

-- --------------------------------------------------------

--
-- Estructura de tabla `ProductCategory`
--

CREATE TABLE `ProductCategory` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar las categorias de los productos';

-- --------------------------------------------------------

--
-- Estructura de tabla `ProductSubCategory`
--

CREATE TABLE `ProductSubCategory` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `ProductCategoryId` INT NOT NULL COMMENT 'Llave foranea de Categoria de Producto',
  `Name` varchar(100) NOT NULL,
  FOREIGN KEY (ProductCategoryId) REFERENCES ProductCategory(Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar las subcategorias de los productos';

-- --------------------------------------------------------

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

--
-- Estructura de tabla `ControlEmployeeAsistance`
--

-- CREATE TABLE `ControlEmployeeAsistance` (
--   `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
--   `StartTime` DATETIME NOT NULL,
--   `EndTime` DATETIME NOT NULL,
--   `HourWork` decimal(20,2) NOT NULL DEFAULT '0.00',
--   `EmployeeId` int(11) NOT NULL,  
--   `ShiftId` int(11) NOT NULL,  
--   
--   -- START: AuditableEntity --
--   `CreatedDate` DATETIME NULL,
--   `CreateBy` VARCHAR(6) NULL,
--   `ModifiedDate` DATETIME NULL,
--   `ModifiedBy` VARCHAR(6) NULL,
--   -- END: AuditableEntity --
--   
--   FOREIGN KEY (EmployeeId) REFERENCES Employee(Id),
--   FOREIGN KEY (ShiftId) REFERENCES Shift(Id)
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar los proveedores';
 
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `AWBuildVersion`
--

CREATE TABLE `AWBuildVersion` (
  `Id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  `DataBaseVersion` VARCHAR(100) NOT NULL,
  `VersionDate` DATETIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla para almacenar la version de la base de datos'; 

-- 
-- --------------------------------------------------------

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;