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

        //<--Migration initial-->
        public DbSet<CountryRegion> CountriesRegion { get; set; }
        public DbSet<StateProvince> StatesProvince { get; set; }
        public DbSet<City> Cities { get; set; }

        //<--Migration ViperDbContext_v1-->
        public DbSet<RoadType> RoadsType { get; set; }
        public DbSet<AddressType> AddressesType { get; set; }
        public DbSet<Gender> Genders { get; set; }
        public DbSet<MaritalStatus> MaritalsStatus { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Shift> Shifts {get;set;}
        public DbSet<Department> Departments { get; set; }
        public DbSet<JobTitle> JobsTitle { get; set; }

        //<--Migration ViperDbContext_v2-->
        public DbSet<RegimenFiscal> RegimenesFiscales { get; set; }
        public DbSet<Module> Modules { get; set; }
        public DbSet<Permission> Permissions { get; set; }

        //<--Migration ViperDbContext_v3-->
        public DbSet<Address> Addresses { get; set; }
        public DbSet<AddressSAT> AddressesSAT { get; set; }
        public DbSet<Company> Companies { get; set; }

        //<--Migration ViperDbContext_v4-->
        public DbSet<Site> Sites { get; set; }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<EmployeeDepartmentHistory> EmployeesDepartmentHistory { get; set; }
        public DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }
    }
}
