using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.WebAPI.Models
{
    public class Company
    {
        /// <summary>
        /// Campo Id
        /// </summary>
        [Key]
        public int Id { get; set; }

        /// <summary>
        /// Campo CompanyName
        /// </summary>
        [Required(ErrorMessage = "El campo CompanyName es obligatorio")]
        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string CompanyName { get; set; }

        /// <summary>
        /// Campo CompanyKey
        /// </summary>
        [Required(ErrorMessage = "El campo CompanyKey es obligatorio")]
        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string CompanyKey { get; set; }

        /// <summary>
        /// Campo AddressId
        /// </summary>
        [Required(ErrorMessage = "El campo AddressId es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int AddressId { get; set; }

        /// <summary>
        /// Campo PhoneNumber
        /// </summary>
        [Required(ErrorMessage = "El campo PhoneNumber es obligatorio")]
        [StringLength(10, MinimumLength = 10)]
        [DataType(DataType.Text)]
        public string PhoneNumber { get; set; }

        /// <summary>
        /// Campo CellphoneNumber
        /// </summary>
        [Required(ErrorMessage = "El campo CellphoneNumber es obligatorio")]
        [StringLength(13, MinimumLength = 13)]
        [DataType(DataType.Text)]
        public string CellphoneNumber { get; set; }

        /// <summary>
        /// Campo EmailAddress
        /// </summary>
        [Required(ErrorMessage = "El campo EmailAddress es obligatorio")]
        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string EmailAddress { get; set; }

        /// <summary>
        /// Campo FiscalName
        /// </summary>
        [Required(ErrorMessage = "El campo FiscalName es obligatorio")]
        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string FiscalName { get; set; }

        /// <summary>
        /// Campo AddressSATId
        /// </summary>
        [Required(ErrorMessage = "El campo AddressSATId es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int AddressSATId { get; set; }

        /// <summary>
        /// Campo RegimenFiscalId
        /// </summary>
        [Required(ErrorMessage = "El campo RegimenFiscalId es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int RegimenFiscalId { get; set; }

        /// <summary>
        /// Campo AccountBankId
        /// </summary>
        [Required(ErrorMessage = "El campo AccountBankId es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int AccountBankId { get; set; }

        /// <summary>
        /// Campo RFC
        /// </summary>
        [Required(ErrorMessage = "El campo RFC es obligatorio")]
        [StringLength(13, MinimumLength = 13)]
        [DataType(DataType.Text)]
        public string RFC { get; set; }

        /// <summary>
        /// Campo CURP
        /// </summary>
        [Required(ErrorMessage = "El campo CURP es obligatorio")]
        [StringLength(25, MinimumLength = 25)]
        [DataType(DataType.Text)]
        public string CURP { get; set; }

        /// <summary>
        /// Campo ApiKey
        /// </summary>
        [Required(ErrorMessage = "El campo ApiKey es obligatorio")]
        [StringLength(100, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string ApiKey { get; set; }

        /// <summary>
        /// Campo BusinessActivity
        /// </summary>
        [Required(ErrorMessage = "El campo BusinessActivity es obligatorio")]
        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string BusinessActivity { get; set; }

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

        /// <summary>
        /// Campo LoginID
        /// </summary>
        [Required(ErrorMessage = "El campo LoginID es obligatorio")]
        [StringLength(256, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string LoginID { get; set; }

        /// <summary>
        /// Campo PasswordEncrypted
        /// </summary>
        [Required(ErrorMessage = "El campo PasswordEncrypted es obligatorio")]
        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string PasswordEncrypted { get; set; }

    }
}
