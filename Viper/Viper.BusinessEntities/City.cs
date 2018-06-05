using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class City
    {
        /// <summary>
        /// Campo Id
        /// </summary>
        [Key]
        public int Id { get; set; }

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
        /// Campo CveEnt
        /// </summary>
        [Required(ErrorMessage = "El campo CveEnt es obligatorio")]
        [StringLength(2, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string CveEnt { get; set; }

        /// <summary>
        /// Campo CveCity
        /// </summary>
        [Required(ErrorMessage = "El campo CveCity es obligatorio")]
        [StringLength(3, MinimumLength = 3)]
        [DataType(DataType.Text)]
        public string CveCity { get; set; }

        /// <summary>
        /// Campo Descripcion
        /// </summary>
        [Required(ErrorMessage = "El campo Description es obligatorio")]
        [StringLength(500, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string Description { get; set; }

        /// <summary>
        /// Campo CveCab
        /// </summary>
        [Required(ErrorMessage = "El campo CveCab es obligatorio")]
        [StringLength(4, MinimumLength = 4)]
        [DataType(DataType.Text)]
        public string CveCab { get; set; }

        /// <summary>
        /// Campo NameCab
        /// </summary>
        [Required(ErrorMessage = "El campo NameCab es obligatorio")]
        [StringLength(100, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string NameCab { get; set; }

        /// <summary>
        /// Campo PTOT
        /// </summary>
        [Required(ErrorMessage = "El campo PTOT es obligatorio")]
        [StringLength(10, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string PTOT { get; set; }

        /// <summary>
        /// Campo PMAS
        /// </summary>
        [Required(ErrorMessage = "El campo PMAS es obligatorio")]
        [StringLength(10, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string PMAS { get; set; }

        /// <summary>
        /// Campo PFEM
        /// </summary>
        [Required(ErrorMessage = "El campo PFEM es obligatorio")]
        [StringLength(10, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string PFEM { get; set; }

        /// <summary>
        /// Campo VTOT
        /// </summary>
        [Required(ErrorMessage = "El campo VTOT es obligatorio")]
        [StringLength(10, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string VTOT { get; set; }
    }
}
