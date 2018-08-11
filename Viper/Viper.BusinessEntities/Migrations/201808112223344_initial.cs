namespace Viper.BusinessEntities.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial : DbMigration
    {
        public override void Up()
        {
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
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.City", "StateProvinceId", "dbo.StateProvince");
            DropForeignKey("dbo.StateProvince", "CountryRegionId", "dbo.CountryRegion");
            DropIndex("dbo.City", new[] { "StateProvinceId" });
            DropIndex("dbo.StateProvince", new[] { "CountryRegionId" });
            DropTable("dbo.CountryRegion");
            DropTable("dbo.StateProvince");
            DropTable("dbo.City");
        }
    }
}
