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
    public class EmployeeDepartmentHistory : AuditableEntity<EmployeeDepartmentHistory>
    {
        [ForeignKey("Employee")]
        [Required(ErrorMessage = "The field EmployeeId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field EmployeeId must be a number.")]
        public int EmployeeId { get; set; }
        public Employee Employee { get; set; }

        [ForeignKey("JobTitle")]
        [Required(ErrorMessage = "The field JobTitleId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field JobTitleId must be a number.")]
        public int JobTitleId { get; set; }
        public JobTitle JobTitle { get; set; }

        [ForeignKey("Department")]
        [Required(ErrorMessage = "The field DepartmentId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field DepartmentId must be a number.")]
        public int DepartmentId { get; set; }
        public Department Department { get; set; }

        [ForeignKey("Site")]
        [Required(ErrorMessage = "The field SiteId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field SiteId must be a number.")]
        public int SiteId { get; set; }
        public Site Site { get; set; }

        [ForeignKey("Shift")]
        [Required(ErrorMessage = "The field ShiftId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field ShiftId must be a number.")]
        public int ShiftId { get; set; }
        public Shift Shift { get; set; }
    }
}
