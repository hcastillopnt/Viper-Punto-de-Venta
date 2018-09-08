using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viper.BusinessEntities.Common;

namespace Viper.BusinessEntities
{
    public class Site : AuditableEntity<Site>
    {
        [ForeignKey("Company")]
        [Required(ErrorMessage = "The field CompanyId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field CompanyId must be a number.")]
        public int CompanyId { get; set; }
        public Company Company { get; set; }

        [Required(ErrorMessage = "The field SiteName is required")]
        [StringLength(256, ErrorMessage = "The field SiteName must have max length of 256 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field SiteName must be a string")]
        public String SiteName { get; set; }

        [Required(ErrorMessage = "The field UniquePhysicalID is required")]
        [StringLength(100, ErrorMessage = "The field UniquePhysicalID must have max length of 100 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field UniquePhysicalID must be a string")]
        public String UniquePhysicalID { get; set; }

        [ForeignKey("Address")]
        [Required(ErrorMessage = "The field AddressId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field AddressId must be a number.")]
        public int AddressId { get; set; }
        public Address Address { get; set; }

        [Required(ErrorMessage = "The field ResponsibleName is required")]
        [StringLength(100, ErrorMessage = "The field ResponsibleName must have max length of 100 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field ResponsibleName must be a string")]
        public String ResponsibleName { get; set; }

        [StringLength(10, ErrorMessage = "The field PhoneNumber must have max length of 10 characters")]
        [DataType(DataType.PhoneNumber, ErrorMessage = "The field PhoneNumber must be a PhoneNumber valid")]
        public String PhoneNumber { get; set; }

        [Required(ErrorMessage = "The field IsActive is required")]
        public bool IsActive { get; set; }

        public byte[] Photo;

        public virtual ICollection<EmployeeDepartmentHistory> EmployeesDepartmentHistory { get; set; }
        public virtual ICollection<Supplier> Suppliers { get; set; }
        public virtual ICollection<ProductInventory> ProductsInventory { get; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
