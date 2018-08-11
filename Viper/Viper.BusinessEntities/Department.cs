using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessEntities
{
    public class Department
    {
        [Key]
        public int Id { get; set; }

        [Required(ErrorMessage = "The field Name is required")]
        [StringLength(40, ErrorMessage = "The field Name must have max length of 40 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field Name must be a string")]
        public String Name { get; set; }

        [Required(ErrorMessage = "The field GroupName is required")]
        [StringLength(100, ErrorMessage = "The field GroupName must have max length of 100 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field GroupName must be a string")]
        public String GroupName { get; set; }

        public virtual ICollection<JobTitle> JobsTitle { get; set; }
    }
}
