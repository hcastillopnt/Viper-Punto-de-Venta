using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class StateProvince
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
        /// Campo CveEnt
        /// </summary>
        [Required(ErrorMessage = "El campo CveEnt es obligatorio")]
        [StringLength(2, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string CveEnt { get; set; }

        /// <summary>
        /// Campo Description
        /// </summary>
        [Required(ErrorMessage = "El campo Description es obligatorio")]
        [StringLength(500, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string Description { get; set; }

        /// <summary>
        /// Campo Abrev
        /// </summary>
        [Required(ErrorMessage = "El campo Abrev es obligatorio")]
        [StringLength(10, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string Abrev { get; set; }

        /// <summary>
        /// Campo CveCab
        /// </summary>
        [Required(ErrorMessage = "El campo CveCab es obligatorio")]
        [StringLength(7, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string CveCab { get; set; }

        /// <summary>
        /// Campo NameCab
        /// </summary>
        [Required(ErrorMessage = "El campo NameCab es obligatorio")]
        [StringLength(100, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string NameCab { get; set; }

        /// <summary>
        /// Campo PTOT
        /// </summary>
        [Required(ErrorMessage = "El campo PTOT es obligatorio")]
        [StringLength(10, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string PTOT { get; set; }

        /// <summary>
        /// Campo PMAS
        /// </summary>
        [Required(ErrorMessage = "El campo PMAS es obligatorio")]
        [StringLength(10, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string PMAS { get; set; }

        /// <summary>
        /// Campo PFEM
        /// </summary>
        [Required(ErrorMessage = "El campo PFEM es obligatorio")]
        [StringLength(10, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string PFEM { get; set; }

        /// <summary>
        /// Campo VTOT
        /// </summary>
        [Required(ErrorMessage = "El campo VTOT es obligatorio")]
        [StringLength(10, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string VTOT { get; set; }
    }
}
