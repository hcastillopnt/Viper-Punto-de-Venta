using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessEntities
{
    public class Supplier
    {
        /// <summary>
        /// Campo Id
        /// </summary>
        [Key]
        public int Id { get; set; }


        /// <summary>
        /// Campo SupplierKey
        /// </summary>
        [Required(ErrorMessage = "El campo SupplierKey es obligatorio")]
        [StringLength(120, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string SupplierKey { get; set; }

        /// <summary>
        /// Campo CompanyName
        /// </summary>
        [Required(ErrorMessage = "El campo CompanyName es obligatorio")]
        [StringLength(120, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string CompanyName { get; set; }

        /// <summary>
        /// Campo ContactName
        /// </summary>
        [Required(ErrorMessage = "El campo ContactName es obligatorio")]
        [StringLength(120, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string ContactName { get; set; }

        /// <summary>
        /// Campo AddressId
        /// </summary>
        [Required(ErrorMessage = "El campo AddressId es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int AddressId { get; set; }

        /// <summary>
        /// Campo AddressSATId
        /// </summary>
        [Required(ErrorMessage = "El campo AddressSATId es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int AddressSATId { get; set; }

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
        [StringLength(18, MinimumLength = 18)]
        [DataType(DataType.Text)]
        public string CURP { get; set; }

        /// <summary>
        /// Campo PhoneNumber
        /// </summary>
        [StringLength(10, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string PhoneNumber { get; set; }

        /// <summary>
        /// Campo CellphoneNumber
        /// </summary>
        [StringLength(13, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string CellphoneNumber { get; set; }

        /// <summary>
        /// Campo EmailAddress
        /// </summary>
        [StringLength(50, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string EmailAddress { get; set; }

        /// <summary>
        /// Campo Comment
        /// </summary>
        [StringLength(255, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string Comment { get; set; }


        /// <summary>
        /// Campo IsActive
        /// </summary>
        [Required(ErrorMessage = "El campo IsActive es obligatorio")]
        public byte IsActive { get; set; }

        /// <summary>
        /// Campo CreditLimit
        /// </summary>
        [Required(ErrorMessage = "El campo CreditLimit es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero valido")]
        public double CreditLimit { get; set; }
        
        /// <summary>
        /// Campo DaysCredit
        /// </summary>
        [Required(ErrorMessage = "El campo DaysCredit es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int DaysCredit { get; set; }
        
        
        /// <summary>
        /// Campo ProfilePhoto
        /// </summary>
        public byte[] Logo { get; set; }

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
