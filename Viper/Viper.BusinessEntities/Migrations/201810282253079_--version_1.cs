namespace Viper.BusinessEntities.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class version_1 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Supplier", "RegimenFiscalId", c => c.Int(nullable: false));
            AddColumn("dbo.Supplier", "FiscalName", c => c.String(maxLength: 50, unicode: false, storeType: "nvarchar"));
            AddColumn("dbo.Supplier", "BusinessActivity", c => c.String(maxLength: 30, unicode: false, storeType: "nvarchar"));
            CreateIndex("dbo.Supplier", "RegimenFiscalId");
            AddForeignKey("dbo.Supplier", "RegimenFiscalId", "dbo.RegimenFiscal", "Id", cascadeDelete: true);
            DropColumn("dbo.Supplier", "ContactName");
            DropColumn("dbo.Supplier", "CURP");
            DropColumn("dbo.Supplier", "CreditLimit");
            DropColumn("dbo.Supplier", "DaysCredit");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Supplier", "DaysCredit", c => c.Int(nullable: false));
            AddColumn("dbo.Supplier", "CreditLimit", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            AddColumn("dbo.Supplier", "CURP", c => c.String(maxLength: 18, unicode: false, storeType: "nvarchar"));
            AddColumn("dbo.Supplier", "ContactName", c => c.String(nullable: false, maxLength: 100, unicode: false, storeType: "nvarchar"));
            DropForeignKey("dbo.Supplier", "RegimenFiscalId", "dbo.RegimenFiscal");
            DropIndex("dbo.Supplier", new[] { "RegimenFiscalId" });
            DropColumn("dbo.Supplier", "BusinessActivity");
            DropColumn("dbo.Supplier", "FiscalName");
            DropColumn("dbo.Supplier", "RegimenFiscalId");
        }
    }
}
