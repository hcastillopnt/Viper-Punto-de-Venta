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
        [StringLength(5, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string IS { get; set; }

        /// <summary>
        /// Campo FisrtName
        /// </summary>

        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string FirstName { get; set; }

        /// <summary>
        /// Campo MiddleName
        /// </summary>

        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string MiddleName { get; set; }

        /// <summary>
        /// Campo LastName
        /// </summary>

        [StringLength(30, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string LastName { get; set; }

        /// <summary>
        /// Campo FullName
        /// </summary>

        [StringLength(50, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string FullName { get; set; }

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
        /// Campo JobTitleId
        /// </summary>
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int JobTitleId { get; set; }

        /// <summary>
        /// Campo BirthDate
        /// </summary>
        [StringLength(10, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string BirthDate { get; set; }

        /// <summary>
        /// Campo MaritalStatusID
        /// </summary>
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int MaritalStatusId { get; set; }

        /// <summary>
        /// Campo GenderID
        /// </summary>
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int GenderId { get; set; }

        /// <summary>
        /// Campo EmployeeId
        /// </summary>
        [Required(ErrorMessage = "El campo EmployeeID es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int AddressId { get; set; }

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
        /// Campo ShiftId
        /// </summary>
        [Required(ErrorMessage = "El campo ShiftID es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int ShiftId { get; set; }

        /// <summary>
        /// Campo StartDate
        /// </summary>
        [Required(ErrorMessage = "El campo StartDate es obligatorio")]
        [DataType(DataType.DateTime)]
        public DateTime StartDate { get; set; }

        /// <summary>
        /// Campo StartDate
        /// </summary>
        [Required(ErrorMessage = "El campo EndDate es obligatorio")]
        [DataType(DataType.DateTime)]
        public DateTime EndDate { get; set; }


        /// <summary>
        /// Campo IsActive
        /// </summary>
        [Required(ErrorMessage = "El campo IsActive es obligatorio")]
        public byte IsActive { get; set; }
        
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
