INSERT INTO address (Id, RoadTypeId, AddressTypeId, AddressLine1, AddressLine2, CountryRegionId, StateProvinceId, CityId, PostalCode, CreatedDate, CreateBy, ModifiedDate, ModifiedBy) VALUES
(3, 5, 2, 'CALLE: DIAMANTE, NO. EXT: 825;', 'COLONIA: PRIVADAS EL JARAL;', 159, 19, 957, '66580', '2018-07-31 00:00:00', 'HECP', '2018-07-31 00:00:00', 'HECP');

INSERT INTO addresssat (Id, RoadTypeId, AddressTypeId, AddressLine1, AddressLine2, CountryRegionId, StateProvinceId, CityId, PostalCode, CreatedDate, CreateBy, ModifiedDate, ModifiedBy) VALUES
(3, 5, 2, 'CALLE: DIAMANTE, NO. EXT: 825;', 'COLONIA: PRIVADAS EL JARAL;', 159, 19, 957, '66580', '2018-07-31 00:00:00', 'HECP', '2018-07-31 00:00:00', 'HECP');

INSERT INTO company (Id, CompanyName, CompanyKey, AddressId, PhoneNumber, CellphoneNumber, EmailAddress, FiscalName, AddressSATId, RegimenFiscalId, RFC, CURP, LoginID, PasswordEncrypted, ApiKey, BusinessActivity, Logo, RoleId, CreatedDate, CreateBy, ModifiedDate, ModifiedBy) VALUES
(1, 'SUPER FARMACIA FARMANYL', 'EMPOWTK0001', 3, '(81)216-50892', '(044)812-012-7009', 'HORACIO.CASTILLOPNT@GMAIL.COM', 'HORACIO ENRIQUE CASTILLO PUENTE', 3, 1691, 'CAPH930421PM4', 'CAPH930421HNLSNR01', 'CAPH930421PM4', 'ZcEBoaQi6vx45fQ06oFOoQ==', NULL, 'FARMACIA', NULL, 1, '2018-07-31 00:00:00', 'HECP', '2018-07-31 00:00:00', 'HECP');