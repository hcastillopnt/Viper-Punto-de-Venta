using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class Employee
    {
        /// <summary>
        /// Campo Id
        /// </summary>
        [Key]
        public int Id { get; set; }

        /// <summary>
        /// Campo EmployeeIDNumber
        /// </summary>
        [Required(ErrorMessage = "El campo EmployeeIDNumer es obligatorio")]
        [StringLength(100, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string EmployeeIDNumber { get; set; }

        /// <summary>
        /// Campo IS
        /// </summary>
        [Required(ErrorMessage = "El campo IS es obligatorio")]
        [StringLength(5, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string IS { get; set; }

        /// <summary>
        /// Campo FisrtName
        /// </summary>
        [Required(ErrorMessage = "El campo FirstName es obligatorio")]
        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string FirstName { get; set; }

        /// <summary>
        /// Campo MiddleName
        /// </summary>
        [Required(ErrorMessage = "El campo MiddleName es obligatorio")]
        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string MiddleName { get; set; }

        /// <summary>
        /// Campo LastName
        /// </summary>
        [Required(ErrorMessage = "El campo LastName es obligatorio")]
        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string LastName { get; set; }

        /// <summary>
        /// Campo FullName
        /// </summary>
        [Required(ErrorMessage = "El campo FullName es obligatorio")]
        [StringLength(50, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string FullName { get; set; }

        /// <summary>
        /// Campo PhoneNumber
        /// </summary>
        [Required(ErrorMessage = "El campo PhoneNumber es obligatorio")]
        [StringLength(10, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string PhoneNumber { get; set; }

        /// <summary>
        /// Campo CellphoneNumber
        /// </summary>
        [Required(ErrorMessage = "El campo CellphoneNumber es obligatorio")]
        [StringLength(13, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string CellphoneNumber { get; set; }

        /// <summary>
        /// Campo LoginID
        /// </summary>
        [Required(ErrorMessage = "El campo LoginID es obligatorio")]
        [StringLength(256, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string LoginID { get; set; }

        /// <summary>
        /// Campo JobTitle
        /// </summary>
        [Required(ErrorMessage = "El campo JobTitle es obligatorio")]
        [StringLength(50, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string JobTitle { get; set; }

        /// <summary>
        /// Campo BirthDate
        /// </summary>
        [Required(ErrorMessage = "El campo BirthDate es obligatorio")]
        [StringLength(10, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string BirthDate { get; set; }

        /// <summary>
        /// Campo MaritalStatusID
        /// </summary>
        [Required(ErrorMessage = "El campo ID es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int MaritalStatusId { get; set; }

        /// <summary>
        /// Campo GenderID
        /// </summary>
        [Required(ErrorMessage = "El campo GenderID es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int GenderId { get; set; }

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
        /// Campo NSS
        /// </summary>
        [Required(ErrorMessage = "El campo NSS es obligatorio")]
        [StringLength(16, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string NSS { get; set; }

        /// <summary>
        /// Campo ProfilePhoto
        /// </summary>
        public byte[] ProfilePhoto { get; set; }

        /// <summary>
        /// Campo FingerPrint
        /// </summary>
        public byte[] FingerPrint { get; set; }

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
