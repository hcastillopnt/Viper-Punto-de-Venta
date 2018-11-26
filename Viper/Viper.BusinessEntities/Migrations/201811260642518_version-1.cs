namespace Viper.BusinessEntities.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class version1 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.ProductCostHistory", "EndDate", c => c.DateTime());
            AlterColumn("dbo.ProductListPriceHistory", "EndDate", c => c.DateTime());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.ProductListPriceHistory", "EndDate", c => c.DateTime(nullable: false));
            AlterColumn("dbo.ProductCostHistory", "EndDate", c => c.DateTime(nullable: false));
        }
    }
}
