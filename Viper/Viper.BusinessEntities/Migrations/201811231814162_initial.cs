namespace Viper.BusinessEntities.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial : DbMigration
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
                "dbo.AddressType",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 40, unicode: false, storeType: "nvarchar"),
                    })
                .PrimaryKey(t => t.Id);
            
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
                "dbo.City",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        StateProvinceId = c.Int(nullable: false),
                        CveEnt = c.String(nullable: false, maxLength: 2, unicode: false, storeType: "nvarchar"),
                        CveCity = c.String(nullable: false, maxLength: 3, unicode: false, storeType: "nvarchar"),
                        Description = c.String(nullable: false, maxLength: 100, unicode: false, storeType: "nvarchar"),
                        CveCab = c.String(maxLength: 7, unicode: false, storeType: "nvarchar"),
                        NameCab = c.String(maxLength: 100, unicode: false, storeType: "nvarchar"),
                        PTOT = c.String(maxLength: 10, unicode: false, storeType: "nvarchar"),
                        PMAS = c.String(maxLength: 10, unicode: false, storeType: "nvarchar"),
                        PFEM = c.String(maxLength: 10, unicode: false, storeType: "nvarchar"),
                        VTOT = c.String(maxLength: 10, unicode: false, storeType: "nvarchar"),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.StateProvince", t => t.StateProvinceId, cascadeDelete: true)
                .Index(t => t.StateProvinceId);
            
            CreateTable(
                "dbo.StateProvince",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CountryRegionId = c.Int(nullable: false),
                        CveEnt = c.String(nullable: false, maxLength: 2, unicode: false, storeType: "nvarchar"),
                        Description = c.String(nullable: false, maxLength: 100, unicode: false, storeType: "nvarchar"),
                        Abrev = c.String(nullable: false, maxLength: 10, unicode: false, storeType: "nvarchar"),
                        CveCab = c.String(maxLength: 7, unicode: false, storeType: "nvarchar"),
                        NameCab = c.String(maxLength: 100, unicode: false, storeType: "nvarchar"),
                        PTOT = c.String(maxLength: 10, unicode: false, storeType: "nvarchar"),
                        PMAS = c.String(maxLength: 10, unicode: false, storeType: "nvarchar"),
                        PFEM = c.String(maxLength: 10, unicode: false, storeType: "nvarchar"),
                        VTOT = c.String(maxLength: 10, unicode: false, storeType: "nvarchar"),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.CountryRegion", t => t.CountryRegionId, cascadeDelete: true)
                .Index(t => t.CountryRegionId);
            
            CreateTable(
                "dbo.CountryRegion",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Description = c.String(nullable: false, maxLength: 100, unicode: false, storeType: "nvarchar"),
                        FIPS104 = c.String(nullable: false, maxLength: 2, unicode: false, storeType: "nvarchar"),
                        ISO2 = c.String(nullable: false, maxLength: 2, unicode: false, storeType: "nvarchar"),
                        ISO3 = c.String(nullable: false, maxLength: 3, unicode: false, storeType: "nvarchar"),
                        ISON = c.String(nullable: false, maxLength: 30, unicode: false, storeType: "nvarchar"),
                        Internet = c.String(maxLength: 2, unicode: false, storeType: "nvarchar"),
                        Capital = c.String(maxLength: 25, unicode: false, storeType: "nvarchar"),
                        MapReference = c.String(maxLength: 50, unicode: false, storeType: "nvarchar"),
                        NationalitySingular = c.String(maxLength: 35, unicode: false, storeType: "nvarchar"),
                        NationalityPlural = c.String(maxLength: 35, unicode: false, storeType: "nvarchar"),
                        Currency = c.String(maxLength: 30, unicode: false, storeType: "nvarchar"),
                        CurrencyCode = c.String(maxLength: 3, unicode: false, storeType: "nvarchar"),
                        Population = c.Long(nullable: false),
                        Title = c.String(maxLength: 50, unicode: false, storeType: "nvarchar"),
                        Comment = c.String(maxLength: 2048, unicode: false, storeType: "nvarchar"),
                    })
                .PrimaryKey(t => t.Id);
            
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
                "dbo.RegimenFiscal",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Key = c.String(nullable: false, maxLength: 6, unicode: false, storeType: "nvarchar"),
                        Description = c.String(nullable: false, maxLength: 400, unicode: false, storeType: "nvarchar"),
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
                "dbo.Department",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 40, unicode: false, storeType: "nvarchar"),
                        GroupName = c.String(nullable: false, maxLength: 100, unicode: false, storeType: "nvarchar"),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.JobTitle",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 40, unicode: false, storeType: "nvarchar"),
                        DepartmentId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Department", t => t.DepartmentId, cascadeDelete: true)
                .Index(t => t.DepartmentId);
            
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
                "dbo.Gender",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 40, unicode: false, storeType: "nvarchar"),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.MaritalStatus",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 40, unicode: false, storeType: "nvarchar"),
                    })
                .PrimaryKey(t => t.Id);
            
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
            
            CreateTable(
                "dbo.Role",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 40, unicode: false, storeType: "nvarchar"),
                        Description = c.String(nullable: false, maxLength: 100, unicode: false, storeType: "nvarchar"),
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
                .ForeignKey("dbo.Module", t => t.ModuleId, cascadeDelete: true)
                .ForeignKey("dbo.Role", t => t.RoleId, cascadeDelete: true)
                .Index(t => t.ModuleId)
                .Index(t => t.RoleId);
            
            CreateTable(
                "dbo.Module",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 50, unicode: false, storeType: "nvarchar"),
                        Menu = c.String(nullable: false, maxLength: 50, unicode: false, storeType: "nvarchar"),
                        Submenu = c.String(maxLength: 50, unicode: false, storeType: "nvarchar"),
                        ControlName = c.String(nullable: false, maxLength: 50, unicode: false, storeType: "nvarchar"),
                        ControlImage = c.String(nullable: false, maxLength: 50, unicode: false, storeType: "nvarchar"),
                        IsActive = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Supplier",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        SupplierName = c.String(nullable: false, maxLength: 50, unicode: false, storeType: "nvarchar"),
                        SupplierKey = c.String(nullable: false, maxLength: 30, unicode: false, storeType: "nvarchar"),
                        AddressId = c.Int(nullable: false),
                        PhoneNumber = c.String(maxLength: 10, unicode: false, storeType: "nvarchar"),
                        CellphoneNumber = c.String(maxLength: 13, unicode: false, storeType: "nvarchar"),
                        EmailAddress = c.String(maxLength: 50, unicode: false, storeType: "nvarchar"),
                        RFC = c.String(nullable: false, maxLength: 13, unicode: false, storeType: "nvarchar"),
                        BusinessActivity = c.String(maxLength: 30, unicode: false, storeType: "nvarchar"),
                        UserId = c.Int(nullable: false),
                        IsActive = c.Boolean(nullable: false),
                        Logo = c.Binary(),
                        CreatedDate = c.DateTime(nullable: false, precision: 0),
                        CreatedBy = c.String(unicode: false),
                        LastUpdatedDate = c.DateTime(nullable: false, precision: 0),
                        LastUpdatedBy = c.String(unicode: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Address", t => t.AddressId, cascadeDelete: true)
                .ForeignKey("dbo.User", t => t.UserId, cascadeDelete: true)
                .Index(t => t.AddressId)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.Product",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        BarCode = c.String(nullable: false, maxLength: 21, unicode: false, storeType: "nvarchar"),
                        AlternativeCode = c.String(maxLength: 21, unicode: false, storeType: "nvarchar"),
                        ActiveSubstance = c.String(maxLength: 100, unicode: false, storeType: "nvarchar"),
                        Description = c.String(nullable: false, maxLength: 100, unicode: false, storeType: "nvarchar"),
                        Location = c.String(maxLength: 10, unicode: false, storeType: "nvarchar"),
                        ProductSubCategoryId = c.Int(nullable: false),
                        StandardCost = c.Decimal(nullable: false, precision: 18, scale: 2),
                        ListPrice = c.Decimal(nullable: false, precision: 18, scale: 2),
                        IsUseInStock = c.Boolean(nullable: false),
                        IsDiscontinued = c.Boolean(nullable: false),
                        IsLot = c.Boolean(nullable: false),
                        IsRecipe = c.Boolean(nullable: false),
                        IsActive = c.Boolean(nullable: false),
                        DiscontinuedDate = c.String(unicode: false),
                        InvMin = c.Int(nullable: false),
                        InvMax = c.Int(nullable: false),
                        SupplierId = c.Int(nullable: false),
                        SiteId = c.Int(nullable: false),
                        CreatedDate = c.DateTime(nullable: false, precision: 0),
                        CreatedBy = c.String(unicode: false),
                        LastUpdatedDate = c.DateTime(nullable: false, precision: 0),
                        LastUpdatedBy = c.String(unicode: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.ProductSubCategory", t => t.ProductSubCategoryId, cascadeDelete: true)
                .ForeignKey("dbo.Site", t => t.SiteId, cascadeDelete: true)
                .ForeignKey("dbo.Supplier", t => t.SupplierId, cascadeDelete: true)
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
                .ForeignKey("dbo.Product", t => t.ProductId, cascadeDelete: true)
                .ForeignKey("dbo.Site", t => t.SiteId, cascadeDelete: true)
                .Index(t => t.ProductId)
                .Index(t => t.SiteId);
            
            CreateTable(
                "dbo.ProductSubCategory",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ProductCategoryId = c.Int(nullable: false),
                        Name = c.String(nullable: false, maxLength: 200, unicode: false, storeType: "nvarchar"),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.ProductCategory", t => t.ProductCategoryId, cascadeDelete: true)
                .Index(t => t.ProductCategoryId);
            
            CreateTable(
                "dbo.ProductCategory",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 40, unicode: false, storeType: "nvarchar"),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Shift",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 40, unicode: false, storeType: "nvarchar"),
                        StartTime = c.DateTime(nullable: false, precision: 0),
                        EndTime = c.DateTime(nullable: false, precision: 0),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.RoadType",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 40, unicode: false, storeType: "nvarchar"),
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
                        StartDate = c.DateTime(nullable: false, precision: 0),
                        EndDate = c.DateTime(nullable: false, precision: 0),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Product", t => t.ProductId, cascadeDelete: true)
                .ForeignKey("dbo.Site", t => t.SiteId, cascadeDelete: true)
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
                        StartDate = c.DateTime(nullable: false, precision: 0),
                        EndDate = c.DateTime(nullable: false, precision: 0),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Product", t => t.ProductId, cascadeDelete: true)
                .ForeignKey("dbo.Site", t => t.SiteId, cascadeDelete: true)
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
