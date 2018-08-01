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
        /// <summary>
        /// Campo Id
        /// </summary>
        [Key]
        public int Id { get; set; }

        /// <summary>
        /// Campo Name
        /// </summary>
        [Required(ErrorMessage = "El campo Name es obligatorio")]
        [StringLength(50, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string Name { get; set; }

        /// <summary>
        /// Campo Menu
        /// </summary>
        [Required(ErrorMessage = "El campo Menu es obligatorio")]
        [StringLength(50, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string Menu { get; set; }

        /// <summary>
        /// Campo SubMenu
        /// </summary>
        [Required(ErrorMessage = "El campo SubMenu es obligatorio")]
        [StringLength(50, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string SubMenu { get; set; }

        /// <summary>
        /// Campo ControlName
        /// </summary>
        [Required(ErrorMessage = "El campo ControlName es obligatorio")]
        [StringLength(30, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string ControlName { get; set; }

        /// <summary>
        /// Campo ControlImage
        /// </summary>
        [Required(ErrorMessage = "El campo ControlImage es obligatorio")]
        [StringLength(100, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string ControlImage { get; set; }

        /// <summary>
        /// Campo IsActive
        /// </summary>
        [Required(ErrorMessage = "El campo IsActive es obligatorio")]
        public bool IsActive { get; set; }
    }
}
