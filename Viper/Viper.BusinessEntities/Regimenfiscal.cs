using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class RegimenFiscal
    {
        /// <summary>
        /// Campo Id
        /// </summary>
        [Key]
        public int Id { get; set; }

        /// <summary>
        /// Campo Key
        /// </summary>
        [Required(ErrorMessage = "El campo Key es obligatorio")]
        [StringLength(5, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string Key { get; set; }

        /// <summary>
        /// Campo Description
        /// </summary>
        [Required(ErrorMessage = "El campo Description es obligatorio")]
        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string Description { get; set; }

        /// <summary>
        /// Campo Fisica
        /// </summary>
        [Required(ErrorMessage = "El campo Fisica es obligatorio")]
        [StringLength(4, MinimumLength = 1)]
        public byte Fisica { get; set; }

        /// <summary>
        /// Campo Moral
        /// </summary>
        [Required(ErrorMessage = "El campo Moral es obligatorio")]
        [StringLength(4, MinimumLength = 1)]
        public byte Moral { get; set; }

        /// <summary>
        /// Campo CreatedDate
        /// </summary>
        [Required(ErrorMessage = "El campo CreatedDate es obligatorio")]
        [DataType(DataType.DateTime)]
        public DateTime CreatedDate { get; set; }

        /// <summary>
        /// Campo CreateBy
        /// </summary>
        [Required(ErrorMessage = "El campo CreateBy es obligatorio")]
        [StringLength(6, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string CreateBy { get; set; }

        /// <summary>
        /// Campo ModifiedDate
        /// </summary>
        [Required(ErrorMessage = "El campo ModifiedDate es obligatorio")]
        [DataType(DataType.DateTime)]
        public DateTime ModifiedDate { get; set; }

        /// <summary>
        /// Campo ModifiedBy
        /// </summary>
        [Required(ErrorMessage = "El campo ModifiedBy es obligatorio")]
        [StringLength(6, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string ModifiedBy { get; set; }
    }
}
