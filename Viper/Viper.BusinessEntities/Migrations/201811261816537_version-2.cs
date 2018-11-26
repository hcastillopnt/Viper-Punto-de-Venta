namespace Viper.BusinessEntities.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class version2 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Employee", "EndDate", c => c.DateTime());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Employee", "EndDate", c => c.DateTime(nullable: false));
        }
    }
}
