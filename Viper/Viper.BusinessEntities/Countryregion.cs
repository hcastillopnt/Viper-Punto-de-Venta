using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class CountryRegion
    {
        /// <summary>
        /// Campo Id
        /// </summary>
        [Key]
        public int Id { get; set; }

        /// <summary>
        /// Campo Descripcion
        /// </summary>
        [Required(ErrorMessage = "El campo Description es obligatorio")]
        [StringLength(128, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string Descripcion { get; set; }

        /// <summary>
        /// Campo FIPS104
        /// </summary>
        [Required(ErrorMessage = "El campo FIPS104 es obligatorio")]
        [StringLength(2, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string FIPS104 { get; set; }

        /// <summary>
        /// Campo ISO2
        /// </summary>
        [Required(ErrorMessage = "El campo ISO2 es obligatorio")]
        [StringLength(2, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string ISO2 { get; set; }

        /// <summary>
        /// Campo ISO3
        /// </summary>
        [Required(ErrorMessage = "El campo ISO3 es obligatorio")]
        [StringLength(3, MinimumLength = 3)]
        [DataType(DataType.Text)]
        public string ISO3 { get; set; }

        /// <summary>
        /// Campo ISON
        /// </summary>
        [Required(ErrorMessage = "El campo ISON es obligatorio")]
        [StringLength(3, MinimumLength = 3)]
        [DataType(DataType.Text)]
        public string ISON { get; set; }

        /// <summary>
        /// Campo Internet
        /// </summary>
        [Required(ErrorMessage = "El campo Internet es obligatorio")]
        [StringLength(2, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string Internet { get; set; }

        /// <summary>
        /// Campo Capital
        /// </summary>
        [Required(ErrorMessage = "El campo Capital es obligatorio")]
        [StringLength(25, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string Capital { get; set; }

        /// <summary>
        /// Campo MapReference
        /// </summary>
        [Required(ErrorMessage = "El campo MapReference es obligatorio")]
        [StringLength(50, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string MapReference { get; set; }

        /// <summary>
        /// Campo NationalitySingular
        /// </summary>
        [Required(ErrorMessage = "El campo NationalitySingular es obligatorio")]
        [StringLength(35, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string NationalitySingular { get; set; }

        /// <summary>
        /// Campo NationalityPlural
        /// </summary>
        [Required(ErrorMessage = "El campo NationalityPlural es obligatorio")]
        [StringLength(35, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string NationalityPlural { get; set; }

        /// <summary>
        /// Campo Currency
        /// </summary>
        [Required(ErrorMessage = "El campo Currency es obligatorio")]
        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string Currency { get; set; }

        /// <summary>
        /// Campo CurrencyCode
        /// </summary>
        [Required(ErrorMessage = "El campo CurrencyCode es obligatorio")]
        [StringLength(3, MinimumLength = 3)]
        [DataType(DataType.Text)]
        public string CurrencyCode { get; set; }

        /// <summary>
        /// Campo Population
        /// </summary>
        [Required(ErrorMessage = "El campo Population es obligatorio")]
        [StringLength(20, MinimumLength = 1)]
        public long Population { get; set; }

        /// <summary>
        /// Campo Title
        /// </summary>
        [Required(ErrorMessage = "El campo Title es obligatorio")]
        [StringLength(50, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string Title { get; set; }

        /// <summary>
        /// Campo Comment
        /// </summary>
        [Required(ErrorMessage = "El campo Comment es obligatorio")]
        [StringLength(2048, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string Comment { get; set; }
    }
}
