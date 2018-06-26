using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Web;

namespace Viper.WebAPI.Models
{
    [DbConfigurationType(typeof(MySql.Data.Entity.MySqlEFConfiguration))]
    public class ViperContext : DbContext
    {
        public ViperContext() : base("ViperContext")
        {

        }

        public DbSet<Employee> Employees { get; set; }
        public DbSet<Membership> Memberships { get; set; }
        public DbSet<Product> products { get; set; }
        public DbSet<Productinventory> productinventories { get; set; }
        public DbSet<EmployeeDepartmentHistory> EmployeeDepartmentHistories { get; set; }
        public DbSet<Company> Companies { get; set; }


        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

           // modelBuilder.Entity<Membership>().HasRequired(x => x.Employee).WithMany().HasForeignKey(x => x.EmployeeId);

        }
    }
}