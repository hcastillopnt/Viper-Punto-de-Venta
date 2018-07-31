#region using directives

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

#endregion

namespace Viper.BusinessEntities
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
        [StringLength(50, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string CompanyName { get; set; }

        /// <summary>
        /// Campo CompanyKey
        /// </summary>
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
        [StringLength(13, MinimumLength = 8)]
        [DataType(DataType.PhoneNumber)]
        public string PhoneNumber { get; set; }

        /// <summary>
        /// Campo CellphoneNumber
        /// </summary>
        [StringLength(17, MinimumLength = 10)]
        [DataType(DataType.PhoneNumber)]
        public string CellphoneNumber { get; set; }

        /// <summary>
        /// Campo EmailAddress
        /// </summary>
        [StringLength(50, MinimumLength = 2)]
        [DataType(DataType.EmailAddress)]
        public string EmailAddress { get; set; }

        /// <summary>
        /// Campo FiscalName
        /// </summary>
        [StringLength(50, MinimumLength = 2)]
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
        /// Campo RFC
        /// </summary>
        [Required(ErrorMessage = "El campo RFC es obligatorio")]
        [StringLength(13, MinimumLength = 13)]
        [DataType(DataType.Text)]
        public string RFC { get; set; }

        /// <summary>
        /// Campo CURP
        /// </summary>
        [StringLength(18, MinimumLength = 18)]
        [DataType(DataType.Text)]
        public string CURP { get; set; }

        /// <summary>
        /// Campo ApiKey
        /// </summary>
        [StringLength(100, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string ApiKey { get; set; }

        /// <summary>
        /// Campo BusinessActivity
        /// </summary>
        [StringLength(50, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string BusinessActivity { get; set; }

        /// <summary>
        /// Campo LoginID (Nombre de usuario)
        /// </summary>
        [Required(ErrorMessage = "El campo LoginID es obligatorio")]
        [StringLength(256, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string LoginID { get; set; }

        /// <summary>
        /// Campo PasswordEncrypted (Contraseña encriptada)
        /// </summary>
        [Required(ErrorMessage = "El campo PasswordEncrypted es obligatorio")]
        [StringLength(256, MinimumLength = 2)]
        [DataType(DataType.Password)]
        public string PasswordEncrypted { get; set; }

        /// <summary>
        /// Campo Logo
        /// </summary>
        public byte[] Logo { get; set; }

        [Required(ErrorMessage = "El campo RoleId es obligatorio")]
        public int RoleId { get; set; }

        /// <summary>
        /// Campo CreatedDate
        /// </summary>
        [DataType(DataType.DateTime)]
        public DateTime CreatedDate { get; set; }

        /// <summary>
        /// Campo CreateBy
        /// </summary>
        [StringLength(6, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string CreateBy { get; set; }

        /// <summary>
        /// Campo ModifiedDate
        /// </summary>
        [DataType(DataType.DateTime)]
        public DateTime ModifiedDate { get; set; }

        /// <summary>
        /// Campo ModifiedBy
        /// </summary>
        [StringLength(6, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string ModifiedBy { get; set; }
    }
}
