--
-- Volcado de datos para la tablas de prueba MYSQLSERVER
--

INSERT INTO `address` (`Id`, `RoadTypeId`, `AddressTypeId`, `AddressLine1`, `AddressLine2`, `CountryRegionId`, `StateProvinceId`, `CityId`, `PostalCode`, `CreatedDate`, `CreatedBy`, `LastUpdatedDate`, `LastUpdatedBy`) VALUES
(1, 5, 2, 'CALLE: DIAMANTE, NO. EXT: 285;', 'COLONIA: PRIVADAS EL JARAL;', 1, 19, 957, '66834', '2018-10-28 00:00:00', 'HECP', '2018-10-28 00:00:00', 'HECP'),
(2, 3, 9, 'CALLE: S. BERNABÉ, NO. EXT: 205;', 'COLONIA: VALLE MORELOS;', 1, 19, 985, '64180', '2018-11-23 10:54:17', 'HECP', '2018-11-23 10:54:17', 'HECP');

INSERT INTO `addresssat` (`Id`,`RoadTypeId`,`AddressTypeId`,`AddressLine1`,`AddressLine2`,`CountryRegionId`,`StateProvinceId`,`CityId`,`PostalCode`,`CreatedDate`,`CreatedBy`,`LastUpdatedDate`,`LastUpdatedBy`) VALUES (1,5,2,'CALLE: MIMAS, NO. EXT: 111;','COLONIA: COSMOPOLIS;',1,19,953,'66612','2018-10-28 00:00:00','HECP','2018-10-28 00:00:00','HECP');

INSERT INTO `user` (`Id`, `LoginID`, `PasswordEncrypted`, `PasswordQuestion`, `PasswordAnswer`, `RoleId`, `AccessFailedCount`, `IsWelcome`, `IsActive`, `CreatedDate`, `CreatedBy`, `LastUpdatedDate`, `LastUpdatedBy`) VALUES
(1, 'CAPH930421PM4', 'Mgq71kVNtNqdFwsiQhe1dw==', NULL, NULL, 1, 0, 1, 1, '2018-10-28 17:22:29', 'HECP', '2018-10-28 17:22:29', 'HECP'),
(2, 'PFR050609CC92', 'Mgq71kVNtNqdFwsiQhe1dw==', NULL, NULL, 3, 0, 1, 1, '2018-11-23 11:12:02', 'HECP', '2018-11-23 11:12:02', 'HECP');

INSERT INTO `company` (`Id`,`CompanyName`,`CompanyKey`,`AddressId`,`AddressSATId`,`RegimenFiscalId`,`PhoneNumber`,`CellphoneNumber`,`EmailAddress`,`FiscalName`,`RFC`,`CURP`,`ApiKey`,`BusinessActivity`,`UserId`,`Logo`,`CreatedDate`,`CreatedBy`,`LastUpdatedDate`,`LastUpdatedBy`) VALUES (1,'SUPER FARMACIAS FARMANYL','EMPOWTK0001',1,1,1,'8121650892','8120127009','PATRICIA.PEREZARN@OUTLOOK.COM','HORACIO ENRIQUE CASTILLO PUENTE','CAPH930421PM4','CAPH930421HNLSNR01',NULL,'FARMACIA',1,NULL,'2018-10-28 00:00:00','HECP','2018-10-28 00:00:00','HECP');

INSERT INTO `site` (`Id`,`CompanyId`,`SiteName`,`UniquePhysicalID`,`AddressId`,`ResponsibleName`,`PhoneNumber`,`IsActive`,`CreatedDate`,`CreatedBy`,`LastUpdatedDate`,`LastUpdatedBy`) VALUES (1,1,'DEFAULT','OWTK-SUPFARFARPM4NL',1,'DEFAULT','8121650892',1,'2018-10-28 00:00:00','HECP','2018-10-28 00:00:00','HECP');

INSERT INTO `supplier` (`Id`, `SupplierName`, `SupplierKey`, `AddressId`, `PhoneNumber`, `CellphoneNumber`, `EmailAddress`, `RFC`, `BusinessActivity`, `UserId`, `IsActive`, `Logo`, `CreatedDate`, `CreatedBy`, `LastUpdatedDate`, `LastUpdatedBy`) VALUES
(1, 'RASE FARMACÉUTICA', 'OWTK-RASFARC92NL', 2, '8183111103', '0180063848982', 'INFO@RASE.COM.MX', 'PFR050609CC92', 'DISTRIBUIDORA DE MEDICAMENTOS', 2, 0, NULL, '2018-11-23 10:54:17', 'HECP', '2018-11-23 10:54:17', 'HECP');

--
-- Volcado de datos para la tablas de prueba MSSQLSERVER
--

SET IDENTITY_INSERT address ON

INSERT INTO address ([Id], [RoadTypeId], [AddressTypeId], [AddressLine1], [AddressLine2], [CountryRegionId], [StateProvinceId], [CityId], [PostalCode], [CreatedDate], [CreatedBy], [LastUpdatedDate], [LastUpdatedBy]) VALUES
(1, 5, 2, 'CALLE: DIAMANTE, NO. EXT: 285;', 'COLONIA: PRIVADAS EL JARAL;', 1, 19, 957, '66834', '2018-10-28 00:00:00', 'HECP', '2018-10-28 00:00:00', 'HECP'),
(2, 3, 9, 'CALLE: S. BERNABÉ, NO. EXT: 205;', 'COLONIA: VALLE MORELOS;', 1, 19, 985, '64180', '2018-11-23 10:54:17', 'HECP', '2018-11-23 10:54:17', 'HECP')

SET IDENTITY_INSERT address OFF 

SET IDENTITY_INSERT addresssat ON

INSERT INTO addresssat ([Id],[RoadTypeId],[AddressTypeId],[AddressLine1],[AddressLine2],[CountryRegionId],[StateProvinceId],[CityId],[PostalCode],[CreatedDate],[CreatedBy],[LastUpdatedDate],[LastUpdatedBy]) VALUES (1,5,2,'CALLE: MIMAS, NO. EXT: 111;','COLONIA: COSMOPOLIS;',1,19,953,'66612','2018-10-28 00:00:00','HECP','2018-10-28 00:00:00','HECP')

SET IDENTITY_INSERT addresssat OFF 

SET IDENTITY_INSERT [User] ON

INSERT INTO [User] ([Id], [LoginID], [PasswordEncrypted], [PasswordQuestion], [PasswordAnswer], [RoleId], [AccessFailedCount], [IsWelcome], [IsActive], [CreatedDate], [CreatedBy], [LastUpdatedDate], [LastUpdatedBy]) VALUES
(1, 'CAPH930421PM4', 'Mgq71kVNtNqdFwsiQhe1dw==', NULL, NULL, 1, 0, 1, 1, '2018-10-28 17:22:29', 'HECP', '2018-10-28 17:22:29', 'HECP'),
(2, 'PFR050609CC92', 'Mgq71kVNtNqdFwsiQhe1dw==', NULL, NULL, 3, 0, 1, 1, '2018-11-23 11:12:02', 'HECP', '2018-11-23 11:12:02', 'HECP')

SET IDENTITY_INSERT [User] OFF 

SET IDENTITY_INSERT company ON

INSERT INTO company ([Id],[CompanyName],[CompanyKey],[AddressId],[AddressSATId],[RegimenFiscalId],[PhoneNumber],[CellphoneNumber],[EmailAddress],[FiscalName],[RFC],[CURP],[ApiKey],[BusinessActivity],[UserId],[Logo],[CreatedDate],[CreatedBy],[LastUpdatedDate],[LastUpdatedBy]) VALUES (1,'SUPER FARMACIAS FARMANYL','EMPOWTK0001',1,1,1,'8121650892','8120127009','PATRICIA.PEREZARN@OUTLOOK.COM','HORACIO ENRIQUE CASTILLO PUENTE','CAPH930421PM4','CAPH930421HNLSNR01',NULL,'FARMACIA',1,NULL,'2018-10-28 00:00:00','HECP','2018-10-28 00:00:00','HECP')

SET IDENTITY_INSERT company OFF 

SET IDENTITY_INSERT site ON

INSERT INTO site ([Id],[CompanyId],[SiteName],[UniquePhysicalID],[AddressId],[ResponsibleName],[PhoneNumber],[IsActive],[CreatedDate],[CreatedBy],[LastUpdatedDate],[LastUpdatedBy]) VALUES (1,1,'DEFAULT','OWTK-SUPFARFARPM4NL',1,'DEFAULT','8121650892',1,'2018-10-28 00:00:00','HECP','2018-10-28 00:00:00','HECP')

SET IDENTITY_INSERT site OFF 

SET IDENTITY_INSERT supplier ON

INSERT INTO supplier ([Id], [SupplierName], [SupplierKey], [AddressId], [PhoneNumber], [CellphoneNumber], [EmailAddress], [RFC], [BusinessActivity], [UserId], [IsActive], [Logo], [CreatedDate], [CreatedBy], [LastUpdatedDate], [LastUpdatedBy]) VALUES
(1, 'RASE FARMACÉUTICA', 'OWTK-RASFARC92NL', 2, '8183111103', '0180063848982', 'INFO@RASE.COM.MX', 'PFR050609CC92', 'DISTRIBUIDORA DE MEDICAMENTOS', 2, 0, NULL, '2018-11-23 10:54:17', 'HECP', '2018-11-23 10:54:17', 'HECP')

SET IDENTITY_INSERT supplier OFF 
