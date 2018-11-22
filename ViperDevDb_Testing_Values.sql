/*
-- Query: SELECT * FROM viper_developments.address
LIMIT 0, 50000

-- Date: 2018-10-28 18:29
*/
INSERT INTO `address` (`Id`,`RoadTypeId`,`AddressTypeId`,`AddressLine1`,`AddressLine2`,`CountryRegionId`,`StateProvinceId`,`CityId`,`PostalCode`,`CreatedDate`,`CreatedBy`,`LastUpdatedDate`,`LastUpdatedBy`) VALUES (1,5,2,'CALLE: DIAMANTE, NO. EXT: 285;','COLONIA: PRIVADAS EL JARAL;',1,19,957,'66834','2018-10-28 00:00:00','HECP','2018-10-28 00:00:00','HECP');

/*
-- Query: SELECT * FROM viper_developments.addresssat
LIMIT 0, 50000

-- Date: 2018-10-28 18:29
*/
INSERT INTO `addresssat` (`Id`,`RoadTypeId`,`AddressTypeId`,`AddressLine1`,`AddressLine2`,`CountryRegionId`,`StateProvinceId`,`CityId`,`PostalCode`,`CreatedDate`,`CreatedBy`,`LastUpdatedDate`,`LastUpdatedBy`) VALUES (1,5,2,'CALLE: MIMAS, NO. EXT: 111;','COLONIA: COSMOPOLIS;',1,19,953,'66612','2018-10-28 00:00:00','HECP','2018-10-28 00:00:00','HECP');

/*
-- Query: SELECT * FROM viper_developments.user
LIMIT 0, 50000

-- Date: 2018-10-28 18:28
*/
INSERT INTO `user` (`Id`,`LoginID`,`PasswordEncrypted`,`PasswordQuestion`,`PasswordAnswer`,`RoleId`,`AccessFailedCount`,`IsWelcome`,`IsActive`,`CreatedDate`,`CreatedBy`,`LastUpdatedDate`,`LastUpdatedBy`) VALUES (1,'CAPH930421PM4','Mgq71kVNtNqdFwsiQhe1dw==',NULL,NULL,1,0,1,1,'2018-10-28 17:22:29','HECP','2018-10-28 17:22:29','HECP');

/*
-- Query: SELECT * FROM viper_developments.company
LIMIT 0, 50000

-- Date: 2018-10-28 18:29
*/
INSERT INTO `company` (`Id`,`CompanyName`,`CompanyKey`,`AddressId`,`AddressSATId`,`RegimenFiscalId`,`PhoneNumber`,`CellphoneNumber`,`EmailAddress`,`FiscalName`,`RFC`,`CURP`,`ApiKey`,`BusinessActivity`,`UserId`,`Logo`,`CreatedDate`,`CreatedBy`,`LastUpdatedDate`,`LastUpdatedBy`) VALUES (1,'SUPER FARMACIAS FARMANYL','EMPOWTK0001',1,1,1856,'8121650892','8120127009','PATRICIA.PEREZARN@OUTLOOK.COM','HORACIO ENRIQUE CASTILLO PUENTE','CAPH930421PM4','CAPH930421HNLSNR01',NULL,'FARMACIA',1,NULL,'2018-10-28 00:00:00','HECP','2018-10-28 00:00:00','HECP');

/*
-- Query: SELECT * FROM viper_developments.site
LIMIT 0, 50000

-- Date: 2018-10-28 18:29
*/
INSERT INTO `site` (`Id`,`CompanyId`,`SiteName`,`UniquePhysicalID`,`AddressId`,`ResponsibleName`,`PhoneNumber`,`IsActive`,`CreatedDate`,`CreatedBy`,`LastUpdatedDate`,`LastUpdatedBy`) VALUES (1,1,'DEFAULT','OWTK-SUPFARFARPM4NL',1,'DEFAULT','8121650892',1,'2018-10-28 00:00:00','HECP','2018-10-28 00:00:00','HECP');
