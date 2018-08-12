namespace Viper.BusinessEntities.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ViperDbContext_v4 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Address",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        RoadTypeId = c.Int(nullable: false),
                        AddressTypeId = c.Int(nullable: false),
                        AddressLine1 = c.String(nullable: false, maxLength: 100, unicode: false, storeType: "nvarchar"),
                        AddressLine2 = c.String(nullable: false, maxLength: 100, unicode: false, storeType: "nvarchar"),
                        CountryRegionId = c.Int(nullable: false),
                        StateProvinceId = c.Int(nullable: false),
                        CityId = c.Int(nullable: false),
                        PostalCode = c.String(nullable: false, maxLength: 5, unicode: false, storeType: "nvarchar"),
                        CreatedDate = c.DateTime(nullable: false, precision: 0),
                        CreatedBy = c.String(unicode: false),
                        LastUpdatedDate = c.DateTime(nullable: false, precision: 0),
                        LastUpdatedBy = c.String(unicode: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.AddressType", t => t.AddressTypeId, cascadeDelete: true)
                .ForeignKey("dbo.City", t => t.CityId, cascadeDelete: true)
                .ForeignKey("dbo.CountryRegion", t => t.CountryRegionId, cascadeDelete: true)
                .ForeignKey("dbo.RoadType", t => t.RoadTypeId, cascadeDelete: true)
                .ForeignKey("dbo.StateProvince", t => t.StateProvinceId, cascadeDelete: true)
                .Index(t => t.AddressTypeId)
                .Index(t => t.CityId)
                .Index(t => t.CountryRegionId)
                .Index(t => t.RoadTypeId)
                .Index(t => t.StateProvinceId);
            
            CreateTable(
                "dbo.AddressSAT",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        RoadTypeId = c.Int(nullable: false),
                        AddressTypeId = c.Int(nullable: false),
                        AddressLine1 = c.String(nullable: false, maxLength: 100, unicode: false, storeType: "nvarchar"),
                        AddressLine2 = c.String(nullable: false, maxLength: 100, unicode: false, storeType: "nvarchar"),
                        CountryRegionId = c.Int(nullable: false),
                        StateProvinceId = c.Int(nullable: false),
                        CityId = c.Int(nullable: false),
                        PostalCode = c.String(nullable: false, maxLength: 5, unicode: false, storeType: "nvarchar"),
                        CreatedDate = c.DateTime(nullable: false, precision: 0),
                        CreatedBy = c.String(unicode: false),
                        LastUpdatedDate = c.DateTime(nullable: false, precision: 0),
                        LastUpdatedBy = c.String(unicode: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.AddressType", t => t.AddressTypeId, cascadeDelete: true)
                .ForeignKey("dbo.City", t => t.CityId, cascadeDelete: true)
                .ForeignKey("dbo.CountryRegion", t => t.CountryRegionId, cascadeDelete: true)
                .ForeignKey("dbo.RoadType", t => t.RoadTypeId, cascadeDelete: true)
                .ForeignKey("dbo.StateProvince", t => t.StateProvinceId, cascadeDelete: true)
                .Index(t => t.AddressTypeId)
                .Index(t => t.CityId)
                .Index(t => t.CountryRegionId)
                .Index(t => t.RoadTypeId)
                .Index(t => t.StateProvinceId);
            
            CreateTable(
                "dbo.Company",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CompanyName = c.String(nullable: false, maxLength: 50, unicode: false, storeType: "nvarchar"),
                        CompanyKey = c.String(nullable: false, maxLength: 30, unicode: false, storeType: "nvarchar"),
                        AddressId = c.Int(nullable: false),
                        AddressSATId = c.Int(nullable: false),
                        RegimenFiscalId = c.Int(nullable: false),
                        PhoneNumber = c.String(maxLength: 10, unicode: false, storeType: "nvarchar"),
                        CellphoneNumber = c.String(maxLength: 13, unicode: false, storeType: "nvarchar"),
                        EmailAddress = c.String(maxLength: 50, unicode: false, storeType: "nvarchar"),
                        FiscalName = c.String(maxLength: 50, unicode: false, storeType: "nvarchar"),
                        RFC = c.String(nullable: false, maxLength: 13, unicode: false, storeType: "nvarchar"),
                        CURP = c.String(nullable: false, maxLength: 18, unicode: false, storeType: "nvarchar"),
                        ApiKey = c.String(maxLength: 100, unicode: false, storeType: "nvarchar"),
                        BusinessActivity = c.String(maxLength: 30, unicode: false, storeType: "nvarchar"),
                        UserId = c.Int(nullable: false),
                        Logo = c.Binary(),
                        CreatedDate = c.DateTime(nullable: false, precision: 0),
                        CreatedBy = c.String(unicode: false),
                        LastUpdatedDate = c.DateTime(nullable: false, precision: 0),
                        LastUpdatedBy = c.String(unicode: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Address", t => t.AddressId, cascadeDelete: true)
                .ForeignKey("dbo.AddressSAT", t => t.AddressSATId, cascadeDelete: true)
                .ForeignKey("dbo.RegimenFiscal", t => t.RegimenFiscalId, cascadeDelete: true)
                .ForeignKey("dbo.User", t => t.UserId, cascadeDelete: true)
                .Index(t => t.AddressId)
                .Index(t => t.AddressSATId)
                .Index(t => t.RegimenFiscalId)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.Site",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CompanyId = c.Int(nullable: false),
                        SiteName = c.String(nullable: false, maxLength: 256, unicode: false, storeType: "nvarchar"),
                        UniquePhysicalID = c.String(nullable: false, maxLength: 100, unicode: false, storeType: "nvarchar"),
                        AddressId = c.Int(nullable: false),
                        ResponsibleName = c.String(nullable: false, maxLength: 100, unicode: false, storeType: "nvarchar"),
                        PhoneNumber = c.String(maxLength: 10, unicode: false, storeType: "nvarchar"),
                        IsActive = c.Boolean(nullable: false),
                        CreatedDate = c.DateTime(nullable: false, precision: 0),
                        CreatedBy = c.String(unicode: false),
                        LastUpdatedDate = c.DateTime(nullable: false, precision: 0),
                        LastUpdatedBy = c.String(unicode: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Address", t => t.AddressId, cascadeDelete: true)
                .ForeignKey("dbo.Company", t => t.CompanyId, cascadeDelete: true)
                .Index(t => t.AddressId)
                .Index(t => t.CompanyId);
            
            CreateTable(
                "dbo.EmployeeDepartmentHistory",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        EmployeeId = c.Int(nullable: false),
                        JobTitleId = c.Int(nullable: false),
                        DepartmentId = c.Int(nullable: false),
                        SiteId = c.Int(nullable: false),
                        ShiftId = c.Int(nullable: false),
                        CreatedDate = c.DateTime(nullable: false, precision: 0),
                        CreatedBy = c.String(unicode: false),
                        LastUpdatedDate = c.DateTime(nullable: false, precision: 0),
                        LastUpdatedBy = c.String(unicode: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Department", t => t.DepartmentId, cascadeDelete: true)
                .ForeignKey("dbo.Employee", t => t.EmployeeId, cascadeDelete: true)
                .ForeignKey("dbo.JobTitle", t => t.JobTitleId, cascadeDelete: true)
                .ForeignKey("dbo.Shift", t => t.ShiftId, cascadeDelete: true)
                .ForeignKey("dbo.Site", t => t.SiteId, cascadeDelete: true)
                .Index(t => t.DepartmentId)
                .Index(t => t.EmployeeId)
                .Index(t => t.JobTitleId)
                .Index(t => t.ShiftId)
                .Index(t => t.SiteId);
            
            CreateTable(
                "dbo.Employee",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        EmployeeNumber = c.String(nullable: false, maxLength: 100, unicode: false, storeType: "nvarchar"),
                        IS = c.String(nullable: false, maxLength: 6, unicode: false, storeType: "nvarchar"),
                        FirstName = c.String(nullable: false, maxLength: 50, unicode: false, storeType: "nvarchar"),
                        MiddleName = c.String(nullable: false, maxLength: 50, unicode: false, storeType: "nvarchar"),
                        LastName = c.String(nullable: false, maxLength: 50, unicode: false, storeType: "nvarchar"),
                        FullName = c.String(nullable: false, maxLength: 150, unicode: false, storeType: "nvarchar"),
                        PhoneNumber = c.String(maxLength: 10, unicode: false, storeType: "nvarchar"),
                        CellphoneNumber = c.String(maxLength: 13, unicode: false, storeType: "nvarchar"),
                        BirthDate = c.String(maxLength: 8, unicode: false, storeType: "nvarchar"),
                        MaritalStatusId = c.Int(nullable: false),
                        GenderId = c.Int(nullable: false),
                        AddressId = c.Int(nullable: false),
                        RFC = c.String(maxLength: 13, unicode: false, storeType: "nvarchar"),
                        CURP = c.String(nullable: false, maxLength: 18, unicode: false, storeType: "nvarchar"),
                        NSS = c.String(nullable: false, maxLength: 16, unicode: false, storeType: "nvarchar"),
                        UserId = c.Int(nullable: false),
                        Photo = c.Binary(),
                        FingerPrint = c.Binary(),
                        StartDate = c.DateTime(nullable: false, precision: 0),
                        EndDate = c.DateTime(nullable: false, precision: 0),
                        IsActive = c.Boolean(nullable: false),
                        CreatedDate = c.DateTime(nullable: false, precision: 0),
                        CreatedBy = c.String(unicode: false),
                        LastUpdatedDate = c.DateTime(nullable: false, precision: 0),
                        LastUpdatedBy = c.String(unicode: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Address", t => t.AddressId, cascadeDelete: true)
                .ForeignKey("dbo.Gender", t => t.GenderId, cascadeDelete: true)
                .ForeignKey("dbo.MaritalStatus", t => t.MaritalStatusId, cascadeDelete: true)
                .ForeignKey("dbo.User", t => t.UserId, cascadeDelete: true)
                .Index(t => t.AddressId)
                .Index(t => t.GenderId)
                .Index(t => t.MaritalStatusId)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.User",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        LoginID = c.String(nullable: false, maxLength: 20, unicode: false, storeType: "nvarchar"),
                        PasswordEncrypted = c.String(nullable: false, maxLength: 256, unicode: false, storeType: "nvarchar"),
                        PasswordQuestion = c.String(maxLength: 100, unicode: false, storeType: "nvarchar"),
                        PasswordAnswer = c.String(maxLength: 100, unicode: false, storeType: "nvarchar"),
                        RoleId = c.Int(nullable: false),
                        AccessFailedCount = c.Int(nullable: false),
                        IsWelcome = c.Boolean(nullable: false),
                        IsActive = c.Boolean(nullable: false),
                        CreatedDate = c.DateTime(nullable: false, precision: 0),
                        CreatedBy = c.String(unicode: false),
                        LastUpdatedDate = c.DateTime(nullable: false, precision: 0),
                        LastUpdatedBy = c.String(unicode: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Role", t => t.RoleId, cascadeDelete: true)
                .Index(t => t.RoleId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Address", "StateProvinceId", "dbo.StateProvince");
            DropForeignKey("dbo.Address", "RoadTypeId", "dbo.RoadType");
            DropForeignKey("dbo.Address", "CountryRegionId", "dbo.CountryRegion");
            DropForeignKey("dbo.Address", "CityId", "dbo.City");
            DropForeignKey("dbo.Address", "AddressTypeId", "dbo.AddressType");
            DropForeignKey("dbo.AddressSAT", "StateProvinceId", "dbo.StateProvince");
            DropForeignKey("dbo.AddressSAT", "RoadTypeId", "dbo.RoadType");
            DropForeignKey("dbo.AddressSAT", "CountryRegionId", "dbo.CountryRegion");
            DropForeignKey("dbo.Company", "UserId", "dbo.User");
            DropForeignKey("dbo.EmployeeDepartmentHistory", "SiteId", "dbo.Site");
            DropForeignKey("dbo.EmployeeDepartmentHistory", "ShiftId", "dbo.Shift");
            DropForeignKey("dbo.EmployeeDepartmentHistory", "JobTitleId", "dbo.JobTitle");
            DropForeignKey("dbo.EmployeeDepartmentHistory", "EmployeeId", "dbo.Employee");
            DropForeignKey("dbo.Employee", "UserId", "dbo.User");
            DropForeignKey("dbo.User", "RoleId", "dbo.Role");
            DropForeignKey("dbo.Employee", "MaritalStatusId", "dbo.MaritalStatus");
            DropForeignKey("dbo.Employee", "GenderId", "dbo.Gender");
            DropForeignKey("dbo.Employee", "AddressId", "dbo.Address");
            DropForeignKey("dbo.EmployeeDepartmentHistory", "DepartmentId", "dbo.Department");
            DropForeignKey("dbo.Site", "CompanyId", "dbo.Company");
            DropForeignKey("dbo.Site", "AddressId", "dbo.Address");
            DropForeignKey("dbo.Company", "RegimenFiscalId", "dbo.RegimenFiscal");
            DropForeignKey("dbo.Company", "AddressSATId", "dbo.AddressSAT");
            DropForeignKey("dbo.Company", "AddressId", "dbo.Address");
            DropForeignKey("dbo.AddressSAT", "CityId", "dbo.City");
            DropForeignKey("dbo.AddressSAT", "AddressTypeId", "dbo.AddressType");
            DropIndex("dbo.Address", new[] { "StateProvinceId" });
            DropIndex("dbo.Address", new[] { "RoadTypeId" });
            DropIndex("dbo.Address", new[] { "CountryRegionId" });
            DropIndex("dbo.Address", new[] { "CityId" });
            DropIndex("dbo.Address", new[] { "AddressTypeId" });
            DropIndex("dbo.AddressSAT", new[] { "StateProvinceId" });
            DropIndex("dbo.AddressSAT", new[] { "RoadTypeId" });
            DropIndex("dbo.AddressSAT", new[] { "CountryRegionId" });
            DropIndex("dbo.Company", new[] { "UserId" });
            DropIndex("dbo.EmployeeDepartmentHistory", new[] { "SiteId" });
            DropIndex("dbo.EmployeeDepartmentHistory", new[] { "ShiftId" });
            DropIndex("dbo.EmployeeDepartmentHistory", new[] { "JobTitleId" });
            DropIndex("dbo.EmployeeDepartmentHistory", new[] { "EmployeeId" });
            DropIndex("dbo.Employee", new[] { "UserId" });
            DropIndex("dbo.User", new[] { "RoleId" });
            DropIndex("dbo.Employee", new[] { "MaritalStatusId" });
            DropIndex("dbo.Employee", new[] { "GenderId" });
            DropIndex("dbo.Employee", new[] { "AddressId" });
            DropIndex("dbo.EmployeeDepartmentHistory", new[] { "DepartmentId" });
            DropIndex("dbo.Site", new[] { "CompanyId" });
            DropIndex("dbo.Site", new[] { "AddressId" });
            DropIndex("dbo.Company", new[] { "RegimenFiscalId" });
            DropIndex("dbo.Company", new[] { "AddressSATId" });
            DropIndex("dbo.Company", new[] { "AddressId" });
            DropIndex("dbo.AddressSAT", new[] { "CityId" });
            DropIndex("dbo.AddressSAT", new[] { "AddressTypeId" });
            DropTable("dbo.User");
            DropTable("dbo.Employee");
            DropTable("dbo.EmployeeDepartmentHistory");
            DropTable("dbo.Site");
            DropTable("dbo.Company");
            DropTable("dbo.AddressSAT");
            DropTable("dbo.Address");
        }
    }
}
