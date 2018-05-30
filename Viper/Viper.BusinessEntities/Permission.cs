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
        /// Campo ID
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(11, MinimumLength = 11)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favro ingresa un numero entero valido")]
        public int Id { get; set; }

        /// <summary>
        /// Campo Name
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(50, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string Name { get; set; }


        /*
        public string ControlName { get; set; }


        public string ControlText { get; set; }


        public string ControlImage { get; set; }
        */


        /// <summary>
        /// Cammpo CreatedDate
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [DataType(DataType.Date)]
        public DateTime CreatedDate { get; set; }

        /// <summary>
        /// Campo CreateBy
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(6, MinimumLength = 6)]
        [DataType(DataType.Text)]
        public string CreateBy { get; set; }


        /// <summary>
        /// Campo ModifiedDate
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [DataType(DataType.Date)]
        public DateTime ModifiedDate { get; set; }


        /// <summary>
        /// Campo ModifiedBy
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(6, MinimumLength = 6)]
        [DataType(DataType.Text)]
        public string ModifiedBy { get; set; }
    }
}