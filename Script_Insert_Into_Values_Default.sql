/*
-- Date: 2018-10-19 21:15
*/
INSERT INTO `address` (`Id`,`RoadTypeId`,`AddressTypeId`,`AddressLine1`,`AddressLine2`,`CountryRegionId`,`StateProvinceId`,`CityId`,`PostalCode`,`CreatedDate`,`CreatedBy`,`LastUpdatedDate`,`LastUpdatedBy`) 
VALUES (1,5,2,'CALLE: CIPRES, NO. EXT: 803;','COLONIA: ARBOLEDAS DE SANTA ROSA 3ER SECTOR OTE;',1,19,953,'66614','2018-10-19 00:00:00','HECP','2018-10-19 00:00:00','HECP');

INSERT INTO `addresssat` (`Id`,`RoadTypeId`,`AddressTypeId`,`AddressLine1`,`AddressLine2`,`CountryRegionId`,`StateProvinceId`,`CityId`,`PostalCode`,`CreatedDate`,`CreatedBy`,`LastUpdatedDate`,`LastUpdatedBy`) 
VALUES (1,5,2,'CALLE: MIMAS, NO. EXT: 111;','COLONIA: COSMOPOLIS;',1,19,953,'66612','2018-10-19 00:00:00','HECP','2018-10-19 00:00:00','HECP');

INSERT INTO `user` (`Id`,`LoginID`,`PasswordEncrypted`,`PasswordQuestion`,`PasswordAnswer`,`RoleId`,`AccessFailedCount`,`IsWelcome`,`IsActive`,`CreatedDate`,`CreatedBy`,`LastUpdatedDate`,`LastUpdatedBy`) 
VALUES (1,'CAPH930421PM4','Mgq71kVNtNqdFwsiQhe1dw==',NULL,NULL,1,0,1,1,'2018-10-19 20:31:50','HECP','2018-10-19 20:31:50','HECP');

INSERT INTO `company` (`Id`,`CompanyName`,`CompanyKey`,`AddressId`,`AddressSATId`,`RegimenFiscalId`,`PhoneNumber`,`CellphoneNumber`,`EmailAddress`,`FiscalName`,`RFC`,`CURP`,`ApiKey`,`BusinessActivity`,`UserId`,`Logo`,`CreatedDate`,`CreatedBy`,`LastUpdatedDate`,`LastUpdatedBy`) 
VALUES (1,'FARMACIA FARMANYL','EMPOWTK0001',1,1,1856,'8121650892','0448120127009','HORACIO.CASTILLOPNT@GMAIL.COM','HORACIO ENRIQUE CASTILLO PUENTE','CAPH930421PM4','CAPH930421HNLSNR01',NULL,'FARMACIA',1,NULL,'2018-10-19 00:00:00','HECP','2018-10-19 00:00:00','HECP');

INSERT INTO `site` (`Id`,`CompanyId`,`SiteName`,`UniquePhysicalID`,`AddressId`,`ResponsibleName`,`PhoneNumber`,`IsActive`,`CreatedDate`,`CreatedBy`,`LastUpdatedDate`,`LastUpdatedBy`) 
VALUES (1,1,'SUCURSAL-DEFAULT','OWTK-SUC-DEF',1,'HORACIO ENRIQUE CASTILLO PUENTE', '8120127009', true,'2018-10-19 20:31:50','HECP','2018-10-19 20:31:50','HECP');