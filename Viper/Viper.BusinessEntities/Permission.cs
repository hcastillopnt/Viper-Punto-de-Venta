using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessEntities
{
    public class Permission
    {
        [Key]
        public int Id { get; set; }

        [ForeignKey("Role")]
        [Required(ErrorMessage = "The field RoleId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field RoleId must be a number.")]
        public int RoleId { get; set; }
        public Role Role { get; set; }

        [ForeignKey("Module")]
        [Required(ErrorMessage = "The field ModuleId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field ModuleId must be a number.")]
        public int ModuleId { get; set; }
        public Module Module { get; set; }
    }
}
