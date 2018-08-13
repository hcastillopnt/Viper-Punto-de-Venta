using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viper.BusinessEntities.Migrations;

namespace Viper.BusinessEntities
{
    [DbConfigurationType(typeof(MySql.Data.Entity.MySqlEFConfiguration))]
    public class ViperDbContext : DbContext
    {
        public ViperDbContext() : base("ViperDbContext")
        {
            //Database.SetInitializer(new MigrateDatabaseToLatestVersion<ViperDbContext, BusinessEntities.Migrations.Configuration>());
            //Database.SetInitializer<ViperDbContext>(new CreateDatabaseIfNotExists<ViperDbContext>());
        }

        public DbSet<CountryRegion> CountriesRegion { get; set; }
        public DbSet<StateProvince> StatesProvince { get; set; }
        public DbSet<City> Cities { get; set; }
        public DbSet<RoadType> RoadsType { get; set; }
        public DbSet<AddressType> AddressesType { get; set; }
        public DbSet<Gender> Genders { get; set; }
        public DbSet<MaritalStatus> MaritalsStatus { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Shift> Shifts {get;set;}
        public DbSet<Department> Departments { get; set; }
        public DbSet<JobTitle> JobsTitle { get; set; }
        public DbSet<RegimenFiscal> RegimenesFiscales { get; set; }
        public DbSet<Module> Modules { get; set; }
        public DbSet<Permission> Permissions { get; set; }
        public DbSet<Address> Addresses { get; set; }
        public DbSet<AddressSAT> AddressesSAT { get; set; }
        public DbSet<Company> Companies { get; set; }
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
