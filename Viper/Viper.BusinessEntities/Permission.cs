using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessEntities
{
    public class Permission
    {
        /// <summary>
        /// Campo Id
        /// </summary>
        [Key]
        public int Id { get; set; }

        /// <summary>
        /// Campo RoleId
        /// </summary>
        [Required(ErrorMessage = "El campo RoleId es obligatorio")]
        public int RoleId { get; set; }

        /// <summary>
        /// Campo ModuleId
        /// </summary>
        [Required(ErrorMessage = "El campo ModuleId es obligatorio")]
        public int ModuleId { get; set; }
    }
}