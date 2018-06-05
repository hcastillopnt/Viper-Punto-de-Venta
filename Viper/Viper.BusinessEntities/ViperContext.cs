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
    public class ViperContext : DbContext
    {
        public ViperContext():base("ViperContext")
        {

        }

        public DbSet<AccountBank> AccountBanks { get; set; }
        public DbSet<Address> Addresses { get; set; }
        public DbSet<AddressSAT> AddressesSAT { get; set; }
        public DbSet<AddressType> AddressTypes { get; set; }
        public DbSet<Bank> Banks { get; set; }
        public DbSet<City> Cities { get; set; }
        public DbSet<Company> Companies { get; set; }
        public DbSet<CountryRegion> CountryRegions { get; set; }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<EmployeeDepartmentHistory> EmployeesDepartmentHistory { get; set; }
        public DbSet<Gender> Genders { get; set; }
        public DbSet<Membership> Memberships { get; set; }
        public DbSet<Permission> Permissions { get; set; }
        public DbSet<RegimenFiscal> RegimenesFiscal { get; set; }
        public DbSet<RoadType> RoadTypes { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<RolePermission> RolePermissions { get; set; }
        public DbSet<Shift> Shifts { get; set; }
        public DbSet<Site> Sites { get; set; }
        public DbSet<StateProvince> StateProvinces { get; set; }
        public DbSet<UserRole> UserRoles { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }
    }
}
