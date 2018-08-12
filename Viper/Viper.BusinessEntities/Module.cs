using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessEntities
{
    public class Module
    {
        [Key]
        public int Id { get; set; }

        [Required(ErrorMessage = "The field Name is required")]
        [StringLength(50, ErrorMessage = "The field Name must have max length of 50 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field Name must be a string")]
        public String Name { get; set; }

        [Required(ErrorMessage = "The field Menu is required")]
        [StringLength(50, ErrorMessage = "The field Menu must have max length of 50 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field Menu must be a string")]
        public String Menu { get; set; }

        [StringLength(50, ErrorMessage = "The field Submenu must have max length of 50 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field Submenu must be a string")]
        public String Submenu { get; set; }

        [Required(ErrorMessage = "The field ControlName is required")]
        [StringLength(50, ErrorMessage = "The field ControlName must have max length of 50 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field ControlName must be a string")]
        public String ControlName { get; set; }

        [Required(ErrorMessage = "The field ControlImage is required")]
        [StringLength(50, ErrorMessage = "The field ControlImage must have max length of 50 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field ControlImage must be a string")]
        public String ControlImage { get; set; }

        [Required(ErrorMessage = "The field IsActive is required")]
        public bool IsActive { get; set; }

        public virtual ICollection<Permission> Permissions { get; set; }
    }
}
