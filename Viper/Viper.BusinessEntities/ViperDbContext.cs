using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessEntities
{
    [DbConfigurationType(typeof(MySql.Data.Entity.MySqlEFConfiguration))]
    public class ViperDbContext : DbContext
    {
        public ViperDbContext() : base("ViperContext")
        {
            Database.SetInitializer<ViperDbContext>(
                new DropCreateDatabaseIfModelChanges<ViperDbContext>());

            //Database.SetInitializer<ViperDbContext>(
            //    new CreateDatabaseIfNotExists<ViperDbContext>());
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }
    }
}
