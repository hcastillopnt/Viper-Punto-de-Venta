using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class AddressSAT
    {
        /// <summary>
        /// Campo Id
        /// </summary>
        [Key]
        public int Id { get; set; }

        /// <summary>
        /// Campo RoadTypeId
        /// </summary>
        [Required(ErrorMessage = "El campo RoadTypeId es obligatorio")]
        [StringLength(11, MinimumLength = 1)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int RoadTypeId { get; set; }

        /// <summary>
        /// Campo AddressTypeId
        /// </summary>
        [Required(ErrorMessage = "El campo AddressTypeId es obligatorio")]
        [StringLength(11, MinimumLength = 1)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int AddressTypeId { get; set; }

        /// <summary>
        /// Campo AddressLine1
        /// </summary>
        [Required(ErrorMessage = "El campo AddressLine1 es obligatorio")]
        [StringLength(20, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string AddressLine1 { get; set; }

        /// <summary>
        /// Campo AddressLine2
        /// </summary>
        [Required(ErrorMessage = "El campo AddressLine2 es obligatorio")]
        [StringLength(20, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string AddressLine2 { get; set; }

        /// <summary>
        /// Campo CountryRegionId
        /// </summary>
        [Required(ErrorMessage = "El campo CountryRegionId es obligatorio")]
        [StringLength(11, MinimumLength = 1)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int CountryRegionId { get; set; }

        /// <summary>
        /// Campo StateProvinceId
        /// </summary>
        [Required(ErrorMessage = "El campo StateProvinceId es obligatorio")]
        [StringLength(11, MinimumLength = 1)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int StateProvinceId { get; set; }

        /// <summary>
        /// Campo Id
        /// </summary>
        [Required(ErrorMessage = "El campo CityId es obligatorio")]
        [StringLength(11, MinimumLength = 1)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int CityId { get; set; }

        /// <summary>
        /// Campo PostalCode
        /// </summary>
        [Required(ErrorMessage = "El campo PostalCode es obligatorio")]
        [StringLength(5, MinimumLength = 5)]
        [DataType(DataType.Text)]
        public string PostalCode { get; set; }

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
