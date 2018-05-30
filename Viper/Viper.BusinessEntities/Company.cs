using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class Company
    {
        /// <summary>
        /// Campo Id
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(11, MinimumLength = 1)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int Id { get; set; }

        /// <summary>
        /// Campo CompanyName
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string CompanyName { get; set; }

        /// <summary>
        /// Campo CompanyKey
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string CompanyKey { get; set; }

        /// <summary>
        /// Campo AddressId
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(11, MinimumLength = 1)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int AddressId { get; set; }

        /// <summary>
        /// Campo PhoneNumber
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(10, MinimumLength = 10)]
        [DataType(DataType.Text)]
        public string PhoneNumber { get; set; }

        /// <summary>
        /// Campo CellphoneNumber
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(13, MinimumLength = 13)]
        [DataType(DataType.Text)]
        public string CellphoneNumber { get; set; }

        /// <summary>
        /// Campo EmailAddress
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string EmailAddress { get; set; }

        /// <summary>
        /// Campo FiscalName
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string FiscalName { get; set; }

        /// <summary>
        /// Campo AddressSATId
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(11, MinimumLength = 1)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int AddressSATId { get; set; }

        /// <summary>
        /// Campo RegimenFiscalId
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(11, MinimumLength = 1)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int RegimenFiscalId { get; set; }

        /// <summary>
        /// Campo AccountBankId
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(11, MinimumLength = 1)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int AccountBankId { get; set; }

        /// <summary>
        /// Campo RFC
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(13, MinimumLength = 13)]
        [DataType(DataType.Text)]
        public string RFC { get; set; }

        /// <summary>
        /// Campo CURP
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(25, MinimumLength = 25)]
        [DataType(DataType.Text)]
        public string CURP { get; set; }

        /// <summary>
        /// Campo ApiKey
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(100, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string ApiKey { get; set; }

        /// <summary>
        /// Campo BusinessActivity
        /// </summary>
        [Required(ErrorMessage = "Campo obligatorio")]
        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string BusinessActivity { get; set; }

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
