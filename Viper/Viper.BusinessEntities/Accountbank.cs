using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class Accountbank
    {
        /// <summary>
        /// Campo Id
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(11, MinimumLength = 1)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int Id { get; set; }


        /// <summary>
        /// Campo Account
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string Account { get; set; }


        /// <summary>
        /// Campo BankBranch
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string BankBranch { get; set; }


        /// <summary>
        /// Campo Key
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(11, MinimumLength = 1)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int Key { get; set; }


        /// <summary>
        /// Campo BankId
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(11, MinimumLength = 1)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int BankId { get; set; }



        /// <summary>
        /// Campo CreatedDate
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [DataType(DataType.Date)]
        public DateTime CreatedDate { get; set; }


        /// <summary>
        /// Campo CreateBy
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(6, MinimumLength = 1)]
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
        [StringLength(6, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string ModifiedBy { get; set; }
    }
}
