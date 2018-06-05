using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class RolePermission
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
        [StringLength(11, MinimumLength = 11)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favro ingresa un numero entero valido")]
        public int RoleId { get; set; }

        /// <summary>
        /// Campo PermissionId
        /// </summary>
        [Required(ErrorMessage = "El campo PermissionId es obligatorio")]
        [StringLength(11, MinimumLength = 11)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favro ingresa un numero entero valido")]
        public int PermissionId { get; set; }

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