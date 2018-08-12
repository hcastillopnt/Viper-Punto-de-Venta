namespace Viper.BusinessEntities.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ViperDbContext_v2 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.RegimenFiscal", "Description", c => c.String(nullable: false, maxLength: 400, unicode: false, storeType: "nvarchar"));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.RegimenFiscal", "Description", c => c.String(nullable: false, maxLength: 200, unicode: false, storeType: "nvarchar"));
        }
    }
}
