namespace Viper.BusinessEntities.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial : DbMigration
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
                        Street = c.String(nullable: false, maxLength: 20),
                        No_Int = c.String(),
                        No_Ext = c.String(nullable: false),
                        Colony = c.String(nullable: false, maxLength: 40),
                        CountryRegionId = c.Int(nullable: false),
                        StateProvinceId = c.Int(nullable: false),
                        CityId = c.Int(nullable: false),
                        PostalCode = c.String(nullable: false, maxLength: 5),
                        CreatedDate = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                        LastUpdatedDate = c.DateTime(nullable: false),
                        LastUpdatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.AddressType", t => t.AddressTypeId)
                .ForeignKey("dbo.City", t => t.CityId)
                .ForeignKey("dbo.CountryRegion", t => t.CountryRegionId)
                .ForeignKey("dbo.RoadType", t => t.RoadTypeId)
                .ForeignKey("dbo.StateProvince", t => t.StateProvinceId)
                .Index(t => t.AddressTypeId)
                .Index(t => t.CityId)
                .Index(t => t.CountryRegionId)
                .Index(t => t.RoadTypeId)
                .Index(t => t.StateProvinceId);
            
            CreateTable(
                "dbo.AddressType",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 40),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.AddressSAT",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        RoadTypeId = c.Int(nullable: false),
                        AddressTypeId = c.Int(nullable: false),
                        Street = c.String(nullable: false, maxLength: 20),
                        No_Int = c.String(),
                        No_Ext = c.String(nullable: false),
                        Colony = c.String(nullable: false, maxLength: 40),
                        CountryRegionId = c.Int(nullable: false),
                        StateProvinceId = c.Int(nullable: false),
                        CityId = c.Int(nullable: false),
                        PostalCode = c.String(nullable: false, maxLength: 5),
                        CreatedDate = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                        LastUpdatedDate = c.DateTime(nullable: false),
                        LastUpdatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.AddressType", t => t.AddressTypeId)
                .ForeignKey("dbo.City", t => t.CityId)
                .ForeignKey("dbo.CountryRegion", t => t.CountryRegionId)
                .ForeignKey("dbo.RoadType", t => t.RoadTypeId)
                .ForeignKey("dbo.StateProvince", t => t.StateProvinceId)
                .Index(t => t.AddressTypeId)
                .Index(t => t.CityId)
                .Index(t => t.CountryRegionId)
                .Index(t => t.RoadTypeId)
                .Index(t => t.StateProvinceId);
            
            CreateTable(
                "dbo.City",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        StateProvinceId = c.Int(nullable: false),
                        CveEnt = c.String(nullable: false, maxLength: 2),
                        CveCity = c.String(nullable: false, maxLength: 3),
                        Description = c.String(nullable: false, maxLength: 100),
                        CveCab = c.String(maxLength: 7),
                        NameCab = c.String(maxLength: 100),
                        PTOT = c.String(maxLength: 10),
                        PMAS = c.String(maxLength: 10),
                        PFEM = c.String(maxLength: 10),
                        VTOT = c.String(maxLength: 10),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.StateProvince", t => t.StateProvinceId)
                .Index(t => t.StateProvinceId);
            
            CreateTable(
                "dbo.StateProvince",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CountryRegionId = c.Int(nullable: false),
                        CveEnt = c.String(nullable: false, maxLength: 2),
                        Description = c.String(nullable: false, maxLength: 100),
                        Abrev = c.String(nullable: false, maxLength: 10),
                        CveCab = c.String(maxLength: 7),
                        NameCab = c.String(maxLength: 100),
                        PTOT = c.String(maxLength: 10),
                        PMAS = c.String(maxLength: 10),
                        PFEM = c.String(maxLength: 10),
                        VTOT = c.String(maxLength: 10),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.CountryRegion", t => t.CountryRegionId)
                .Index(t => t.CountryRegionId);
            
            CreateTable(
                "dbo.CountryRegion",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Description = c.String(nullable: false, maxLength: 100),
                        FIPS104 = c.String(nullable: false, maxLength: 2),
                        ISO2 = c.String(nullable: false, maxLength: 2),
                        ISO3 = c.String(nullable: false, maxLength: 3),
                        ISON = c.String(nullable: false, maxLength: 30),
                        Internet = c.String(maxLength: 2),
                        Capital = c.String(maxLength: 25),
                        MapReference = c.String(maxLength: 50),
                        NationalitySingular = c.String(maxLength: 35),
                        NationalityPlural = c.String(maxLength: 35),
                        Currency = c.String(maxLength: 30),
                        CurrencyCode = c.String(maxLength: 3),
                        Population = c.Long(nullable: false),
                        Title = c.String(maxLength: 50),
                        Comment = c.String(maxLength: 2048),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Company",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CompanyName = c.String(nullable: false, maxLength: 50),
                        CompanyKey = c.String(nullable: false, maxLength: 30),
                        AddressId = c.Int(nullable: false),
                        AddressSATId = c.Int(nullable: false),
                        RegimenFiscalId = c.Int(nullable: false),
                        PhoneNumber = c.String(maxLength: 10),
                        CellphoneNumber = c.String(maxLength: 13),
                        EmailAddress = c.String(maxLength: 50),
                        FiscalName = c.String(maxLength: 50),
                        RFC = c.String(nullable: false, maxLength: 13),
                        CURP = c.String(nullable: false, maxLength: 18),
                        ApiKey = c.String(maxLength: 100),
                        BusinessActivity = c.String(maxLength: 30),
                        UserId = c.Int(nullable: false),
                        Logo = c.Binary(),
                        CreatedDate = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                        LastUpdatedDate = c.DateTime(nullable: false),
                        LastUpdatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Address", t => t.AddressId)
                .ForeignKey("dbo.AddressSAT", t => t.AddressSATId)
                .ForeignKey("dbo.RegimenFiscal", t => t.RegimenFiscalId)
                .ForeignKey("dbo.User", t => t.UserId)
                .Index(t => t.AddressId)
                .Index(t => t.AddressSATId)
                .Index(t => t.RegimenFiscalId)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.RegimenFiscal",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Key = c.String(nullable: false, maxLength: 6),
                        Description = c.String(nullable: false, maxLength: 400),
                        Fisica = c.Boolean(nullable: false),
                        Moral = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Site",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CompanyId = c.Int(nullable: false),
                        SiteName = c.String(nullable: false, maxLength: 256),
                        UniquePhysicalID = c.String(nullable: false, maxLength: 100),
                        AddressId = c.Int(nullable: false),
                        ResponsibleName = c.String(nullable: false, maxLength: 100),
                        PhoneNumber = c.String(maxLength: 10),
                        IsActive = c.Boolean(nullable: false),
                        CreatedDate = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                        LastUpdatedDate = c.DateTime(nullable: false),
                        LastUpdatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Address", t => t.AddressId)
                .ForeignKey("dbo.Company", t => t.CompanyId)
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
                        CreatedDate = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                        LastUpdatedDate = c.DateTime(nullable: false),
                        LastUpdatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Department", t => t.DepartmentId)
                .ForeignKey("dbo.Employee", t => t.EmployeeId)
                .ForeignKey("dbo.JobTitle", t => t.JobTitleId)
                .ForeignKey("dbo.Shift", t => t.ShiftId)
                .ForeignKey("dbo.Site", t => t.SiteId)
                .Index(t => t.DepartmentId)
                .Index(t => t.EmployeeId)
                .Index(t => t.JobTitleId)
                .Index(t => t.ShiftId)
                .Index(t => t.SiteId);
            
            CreateTable(
                "dbo.Department",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 40),
                        GroupName = c.String(nullable: false, maxLength: 100),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.JobTitle",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 40),
                        DepartmentId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Department", t => t.DepartmentId)
                .Index(t => t.DepartmentId);
            
            CreateTable(
                "dbo.Employee",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        EmployeeNumber = c.String(nullable: false, maxLength: 100),
                        IS = c.String(nullable: false, maxLength: 6),
                        FirstName = c.String(nullable: false, maxLength: 50),
                        MiddleName = c.String(nullable: false, maxLength: 50),
                        LastName = c.String(nullable: false, maxLength: 50),
                        FullName = c.String(nullable: false, maxLength: 150),
                        PhoneNumber = c.String(maxLength: 10),
                        CellphoneNumber = c.String(maxLength: 13),
                        BirthDate = c.String(maxLength: 8),
                        MaritalStatusId = c.Int(nullable: false),
                        GenderId = c.Int(nullable: false),
                        AddressId = c.Int(nullable: false),
                        RFC = c.String(maxLength: 13),
                        CURP = c.String(nullable: false, maxLength: 18),
                        NSS = c.String(nullable: false, maxLength: 16),
                        UserId = c.Int(nullable: false),
                        Photo = c.Binary(),
                        FingerPrint = c.Binary(),
                        StartDate = c.DateTime(nullable: false),
                        EndDate = c.DateTime(),
                        IsActive = c.Boolean(nullable: false),
                        CreatedDate = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                        LastUpdatedDate = c.DateTime(nullable: false),
                        LastUpdatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Address", t => t.AddressId)
                .ForeignKey("dbo.Gender", t => t.GenderId)
                .ForeignKey("dbo.MaritalStatus", t => t.MaritalStatusId)
                .ForeignKey("dbo.User", t => t.UserId)
                .Index(t => t.AddressId)
                .Index(t => t.GenderId)
                .Index(t => t.MaritalStatusId)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.Gender",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 40),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.MaritalStatus",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 40),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.User",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        LoginID = c.String(nullable: false, maxLength: 20),
                        PasswordEncrypted = c.String(nullable: false, maxLength: 256),
                        PasswordQuestion = c.String(maxLength: 100),
                        PasswordAnswer = c.String(maxLength: 100),
                        RoleId = c.Int(nullable: false),
                        AccessFailedCount = c.Int(nullable: false),
                        IsWelcome = c.Boolean(nullable: false),
                        IsActive = c.Boolean(nullable: false),
                        CreatedDate = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                        LastUpdatedDate = c.DateTime(nullable: false),
                        LastUpdatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Role", t => t.RoleId)
                .Index(t => t.RoleId);
            
            CreateTable(
                "dbo.Role",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 40),
                        Description = c.String(nullable: false, maxLength: 100),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Permission",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        RoleId = c.Int(nullable: false),
                        ModuleId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Module", t => t.ModuleId)
                .ForeignKey("dbo.Role", t => t.RoleId)
                .Index(t => t.ModuleId)
                .Index(t => t.RoleId);
            
            CreateTable(
                "dbo.Module",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 50),
                        Menu = c.String(nullable: false, maxLength: 50),
                        Submenu = c.String(maxLength: 50),
                        ControlName = c.String(nullable: false, maxLength: 50),
                        ControlImage = c.String(nullable: false, maxLength: 50),
                        IsActive = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Supplier",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        SupplierName = c.String(nullable: false, maxLength: 50),
                        SupplierKey = c.String(nullable: false, maxLength: 30),
                        AddressId = c.Int(nullable: false),
                        PhoneNumber = c.String(maxLength: 10),
                        CellphoneNumber = c.String(maxLength: 13),
                        EmailAddress = c.String(maxLength: 50),
                        RFC = c.String(nullable: false, maxLength: 13),
                        BusinessActivity = c.String(maxLength: 30),
                        UserId = c.Int(nullable: false),
                        IsActive = c.Boolean(nullable: false),
                        Logo = c.Binary(),
                        CreatedDate = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                        LastUpdatedDate = c.DateTime(nullable: false),
                        LastUpdatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Address", t => t.AddressId)
                .ForeignKey("dbo.User", t => t.UserId)
                .Index(t => t.AddressId)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.Product",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        BarCode = c.String(nullable: false, maxLength: 21),
                        AlternativeCode = c.String(maxLength: 21),
                        ActiveSubstance = c.String(maxLength: 100),
                        Description = c.String(nullable: false, maxLength: 100),
                        Location = c.String(maxLength: 10),
                        ProductSubCategoryId = c.Int(nullable: false),
                        StandardCost = c.Decimal(nullable: false, precision: 18, scale: 2),
                        ListPrice = c.Decimal(nullable: false, precision: 18, scale: 2),
                        IsUseInStock = c.Boolean(nullable: false),
                        IsDiscontinued = c.Boolean(nullable: false),
                        IsLot = c.Boolean(nullable: false),
                        IsRecipe = c.Boolean(nullable: false),
                        IsActive = c.Boolean(nullable: false),
                        DiscontinuedDate = c.String(),
                        InvMin = c.Int(nullable: false),
                        InvMax = c.Int(nullable: false),
                        SupplierId = c.Int(nullable: false),
                        SiteId = c.Int(nullable: false),
                        CreatedDate = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                        LastUpdatedDate = c.DateTime(nullable: false),
                        LastUpdatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.ProductSubCategory", t => t.ProductSubCategoryId)
                .ForeignKey("dbo.Site", t => t.SiteId)
                .ForeignKey("dbo.Supplier", t => t.SupplierId)
                .Index(t => t.ProductSubCategoryId)
                .Index(t => t.SiteId)
                .Index(t => t.SupplierId);
            
            CreateTable(
                "dbo.ProductInventory",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ProductId = c.Int(nullable: false),
                        SiteId = c.Int(nullable: false),
                        UnitsInStock = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Product", t => t.ProductId)
                .ForeignKey("dbo.Site", t => t.SiteId)
                .Index(t => t.ProductId)
                .Index(t => t.SiteId);
            
            CreateTable(
                "dbo.ProductSubCategory",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ProductCategoryId = c.Int(nullable: false),
                        Name = c.String(nullable: false, maxLength: 200),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.ProductCategory", t => t.ProductCategoryId)
                .Index(t => t.ProductCategoryId);
            
            CreateTable(
                "dbo.ProductCategory",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 40),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Shift",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 40),
                        StartTime = c.DateTime(nullable: false),
                        EndTime = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.RoadType",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 40),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.ProductCostHistory",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ProductId = c.Int(nullable: false),
                        SiteId = c.Int(nullable: false),
                        StantardCost = c.Decimal(nullable: false, precision: 18, scale: 2),
                        StartDate = c.DateTime(nullable: false),
                        EndDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Product", t => t.ProductId)
                .ForeignKey("dbo.Site", t => t.SiteId)
                .Index(t => t.ProductId)
                .Index(t => t.SiteId);
            
            CreateTable(
                "dbo.ProductListPriceHistory",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ProductId = c.Int(nullable: false),
                        SiteId = c.Int(nullable: false),
                        ListPrice = c.Decimal(nullable: false, precision: 18, scale: 2),
                        StartDate = c.DateTime(nullable: false),
                        EndDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Product", t => t.ProductId)
                .ForeignKey("dbo.Site", t => t.SiteId)
                .Index(t => t.ProductId)
                .Index(t => t.SiteId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.ProductListPriceHistory", "SiteId", "dbo.Site");
            DropForeignKey("dbo.ProductListPriceHistory", "ProductId", "dbo.Product");
            DropForeignKey("dbo.ProductCostHistory", "SiteId", "dbo.Site");
            DropForeignKey("dbo.ProductCostHistory", "ProductId", "dbo.Product");
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
            DropForeignKey("dbo.Supplier", "UserId", "dbo.User");
            DropForeignKey("dbo.Product", "SupplierId", "dbo.Supplier");
            DropForeignKey("dbo.Product", "SiteId", "dbo.Site");
            DropForeignKey("dbo.Product", "ProductSubCategoryId", "dbo.ProductSubCategory");
            DropForeignKey("dbo.ProductSubCategory", "ProductCategoryId", "dbo.ProductCategory");
            DropForeignKey("dbo.ProductInventory", "SiteId", "dbo.Site");
            DropForeignKey("dbo.ProductInventory", "ProductId", "dbo.Product");
            DropForeignKey("dbo.Supplier", "AddressId", "dbo.Address");
            DropForeignKey("dbo.User", "RoleId", "dbo.Role");
            DropForeignKey("dbo.Permission", "RoleId", "dbo.Role");
            DropForeignKey("dbo.Permission", "ModuleId", "dbo.Module");
            DropForeignKey("dbo.Employee", "MaritalStatusId", "dbo.MaritalStatus");
            DropForeignKey("dbo.Employee", "GenderId", "dbo.Gender");
            DropForeignKey("dbo.Employee", "AddressId", "dbo.Address");
            DropForeignKey("dbo.EmployeeDepartmentHistory", "DepartmentId", "dbo.Department");
            DropForeignKey("dbo.JobTitle", "DepartmentId", "dbo.Department");
            DropForeignKey("dbo.Site", "CompanyId", "dbo.Company");
            DropForeignKey("dbo.Site", "AddressId", "dbo.Address");
            DropForeignKey("dbo.Company", "RegimenFiscalId", "dbo.RegimenFiscal");
            DropForeignKey("dbo.Company", "AddressSATId", "dbo.AddressSAT");
            DropForeignKey("dbo.Company", "AddressId", "dbo.Address");
            DropForeignKey("dbo.AddressSAT", "CityId", "dbo.City");
            DropForeignKey("dbo.City", "StateProvinceId", "dbo.StateProvince");
            DropForeignKey("dbo.StateProvince", "CountryRegionId", "dbo.CountryRegion");
            DropForeignKey("dbo.AddressSAT", "AddressTypeId", "dbo.AddressType");
            DropIndex("dbo.ProductListPriceHistory", new[] { "SiteId" });
            DropIndex("dbo.ProductListPriceHistory", new[] { "ProductId" });
            DropIndex("dbo.ProductCostHistory", new[] { "SiteId" });
            DropIndex("dbo.ProductCostHistory", new[] { "ProductId" });
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
            DropIndex("dbo.Supplier", new[] { "UserId" });
            DropIndex("dbo.Product", new[] { "SupplierId" });
            DropIndex("dbo.Product", new[] { "SiteId" });
            DropIndex("dbo.Product", new[] { "ProductSubCategoryId" });
            DropIndex("dbo.ProductSubCategory", new[] { "ProductCategoryId" });
            DropIndex("dbo.ProductInventory", new[] { "SiteId" });
            DropIndex("dbo.ProductInventory", new[] { "ProductId" });
            DropIndex("dbo.Supplier", new[] { "AddressId" });
            DropIndex("dbo.User", new[] { "RoleId" });
            DropIndex("dbo.Permission", new[] { "RoleId" });
            DropIndex("dbo.Permission", new[] { "ModuleId" });
            DropIndex("dbo.Employee", new[] { "MaritalStatusId" });
            DropIndex("dbo.Employee", new[] { "GenderId" });
            DropIndex("dbo.Employee", new[] { "AddressId" });
            DropIndex("dbo.EmployeeDepartmentHistory", new[] { "DepartmentId" });
            DropIndex("dbo.JobTitle", new[] { "DepartmentId" });
            DropIndex("dbo.Site", new[] { "CompanyId" });
            DropIndex("dbo.Site", new[] { "AddressId" });
            DropIndex("dbo.Company", new[] { "RegimenFiscalId" });
            DropIndex("dbo.Company", new[] { "AddressSATId" });
            DropIndex("dbo.Company", new[] { "AddressId" });
            DropIndex("dbo.AddressSAT", new[] { "CityId" });
            DropIndex("dbo.City", new[] { "StateProvinceId" });
            DropIndex("dbo.StateProvince", new[] { "CountryRegionId" });
            DropIndex("dbo.AddressSAT", new[] { "AddressTypeId" });
            DropTable("dbo.ProductListPriceHistory");
            DropTable("dbo.ProductCostHistory");
            DropTable("dbo.RoadType");
            DropTable("dbo.Shift");
            DropTable("dbo.ProductCategory");
            DropTable("dbo.ProductSubCategory");
            DropTable("dbo.ProductInventory");
            DropTable("dbo.Product");
            DropTable("dbo.Supplier");
            DropTable("dbo.Module");
            DropTable("dbo.Permission");
            DropTable("dbo.Role");
            DropTable("dbo.User");
            DropTable("dbo.MaritalStatus");
            DropTable("dbo.Gender");
            DropTable("dbo.Employee");
            DropTable("dbo.JobTitle");
            DropTable("dbo.Department");
            DropTable("dbo.EmployeeDepartmentHistory");
            DropTable("dbo.Site");
            DropTable("dbo.RegimenFiscal");
            DropTable("dbo.Company");
            DropTable("dbo.CountryRegion");
            DropTable("dbo.StateProvince");
            DropTable("dbo.City");
            DropTable("dbo.AddressSAT");
            DropTable("dbo.AddressType");
            DropTable("dbo.Address");
        }
    }
}
