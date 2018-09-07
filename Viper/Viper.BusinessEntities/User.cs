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
    public class User : AuditableEntity<User>
    {
        [Required(ErrorMessage = "The field LoginID is required")]
        [StringLength(20, ErrorMessage = "The field LoginID must have max length of 20 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field LoginID must be a string")]
        public String LoginID { get; set; }

        [Required(ErrorMessage = "The field PasswordEncrypted is required")]
        [StringLength(256, ErrorMessage = "The field PasswordEncrypted must have max length of 256 characters")]
        [DataType(DataType.Password, ErrorMessage = "The field PasswordEncrypted must be a Password valid")]
        public String PasswordEncrypted { get; set; }

        [StringLength(100, ErrorMessage = "The field PasswordQuestion must have max length of 100 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field PasswordQuestion must be a string")]
        public String PasswordQuestion { get; set; }

        [StringLength(100, ErrorMessage = "The field PasswordAnswer must have max length of 100 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field PasswordAnswer must be a string")]
        public String PasswordAnswer { get; set; }

        [ForeignKey("Role")]
        [Required(ErrorMessage = "The field RoleId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field RoleId must be a number.")]
        public int RoleId { get; set; }
        public Role Role { get; set; }

        [Required(ErrorMessage = "The field AccessFailedCount is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field AccessFailedCount must be a number.")]
        public int AccessFailedCount { get; set; }

        [Required(ErrorMessage = "The field IsWelcome is required")]
        public bool IsWelcome { get; set; }

        [Required(ErrorMessage = "The field IsActive is required")]
        public bool IsActive { get; set; }

        public virtual ICollection<Employee> Employees { get; set; }
        public virtual ICollection<Company> Companies { get; set; }
        public virtual ICollection<Supplier> Suppliers { get; set; }
    }
}
