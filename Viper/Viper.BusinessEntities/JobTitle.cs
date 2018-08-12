using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessEntities
{
    public class JobTitle
    {
        [Key]
        public int Id { get; set; }

        [Required(ErrorMessage = "The field Name is required")]
        [StringLength(40, ErrorMessage = "The field Name must have max length of 40 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field Name must be a string")]
        public String Name { get; set; }

        [ForeignKey("Department")]
        [Required(ErrorMessage = "The field DepartmentId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field DepartmentId must be a number.")]
        public int DepartmentId { get; set; }
        public Department Department { get; set; }

        public virtual ICollection<EmployeeDepartmentHistory> EmployeesDepartmentHistory { get; set; }
    }
}
