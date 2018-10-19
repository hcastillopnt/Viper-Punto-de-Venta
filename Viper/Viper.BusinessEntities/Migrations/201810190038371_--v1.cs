namespace Viper.BusinessEntities.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class v1 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.ProductInventory", "UnitsInStock", c => c.Int(nullable: false));
            DropColumn("dbo.Product", "QuantityPerUnit");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Product", "QuantityPerUnit", c => c.Int(nullable: false));
            DropColumn("dbo.ProductInventory", "UnitsInStock");
        }
    }
}
