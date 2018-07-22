using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class Site
    {
        /// <summary>
        /// Campo Id
        /// </summary>
        [Key]
        public int Id { get; set; }

        /// <summary>
        /// Campo CompanyId
        /// </summary>
        [Required(ErrorMessage = "El campo CompanyId es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int CompanyId { get; set; }

        /// <summary>
        /// Campo AddressId
        /// </summary>
        [Required(ErrorMessage = "El campo AddressId es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int AddressId { get; set; }

        /// <summary>
        /// Campo Name
        /// </summary>
        [Required(ErrorMessage = "El campo Name es obligatorio")]
        [StringLength(100, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string Name { get; set; }

        /// <summary>
        /// Campo CompanyName
        /// </summary>
        [Required(ErrorMessage = "El campo CompanyName es obligatorio")]
        [StringLength(100, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string CompanyName { get; set; }


        /// <summary>
        /// Campo ContactName
        /// </summary>
        [Required(ErrorMessage = "El campo ContactName es obligatorio")]
        [StringLength(100, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string ContactName { get; set; }

        /// <summary>
        /// Campo PhoneNumber
        /// </summary>
        [Required(ErrorMessage = "El campo PhoneNumber es obligatorio")]
        [StringLength(100, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string PhoneNumber { get; set; }

        /// <summary>
        /// Campo UniquePhysicalID
        /// </summary>
        [Required(ErrorMessage = "El campo UniquePhysicalID es obligatorio")]
        [StringLength(100, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string UniquePhysicalID { get; set; }

        /// <summary>
        /// Campo IsValid
        /// </summary>
        [Required(ErrorMessage = "El campo IsValid es obligatorio")]
        public byte IsValid { get; set; }

        /// <summary>
        /// Campo Photo
        /// </summary>
        public byte[] Photo { get; set; }

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
