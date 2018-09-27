using System;
using System.Collections.Generic;
using System.Configuration;
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
        public ViperDbContext() : base(ViperDbContext.getConnectionStringName())
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<ViperDbContext, BusinessEntities.Migrations.Configuration>());
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
        public DbSet<ProductCategory> ProductsCategory { get; set; }
        public DbSet<ProductSubCategory> ProductsSubCategory { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<ProductInventory> ProductsInventory { get; set; }
        public DbSet<ProductCostHistory> ProductsCostHistory { get; set; }
        public DbSet<ProductListPriceHistory> ProductsListPriceHistory { get; set; }
        public DbSet<Supplier> Suppliers { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }

        private static string getConnectionStringName()
        {
            ConnectionStringSettingsCollection connections = ConfigurationManager.ConnectionStrings;
            String CONNECTIONSTRING = String.Empty;

            if (connections.Count != 0)
            {
                foreach (ConnectionStringSettings connection in connections)
                {
                    CONNECTIONSTRING = connection.Name;
                }
            }

            return CONNECTIONSTRING;
        }
    }
}
