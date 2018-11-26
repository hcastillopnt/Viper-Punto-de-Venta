using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viper.BusinessEntities.Common;

namespace Viper.BusinessEntities
{
    public class Employee : AuditableEntity<Employee>
    {
        [Required(ErrorMessage = "The field EmployeeNumber is required")]
        [StringLength(100, ErrorMessage = "The field EmployeeNumber must have max length of 100 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field EmployeeNumber must be a string")]
        public String EmployeeNumber { get; set; }

        [Required(ErrorMessage = "The field IS is required")]
        [StringLength(6, ErrorMessage = "The field IS must have max length of 6 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field IS must be a string")]
        public String IS { get; set; }

        [Required(ErrorMessage = "The field FirstName is required")]
        [StringLength(50, ErrorMessage = "The field FirstName must have max length of 50 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field FirstName must be a string")]
        public String FirstName { get; set; }

        [Required(ErrorMessage = "The field MiddleName is required")]
        [StringLength(50, ErrorMessage = "The field MiddleName must have max length of 50 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field MiddleName must be a string")]
        public String MiddleName { get; set; }

        [Required(ErrorMessage = "The field LastName is required")]
        [StringLength(50, ErrorMessage = "The field LastName must have max length of 50 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field LastName must be a string")]
        public String LastName { get; set; }

        [Required(ErrorMessage = "The field FullName is required")]
        [StringLength(150, ErrorMessage = "The field FullName must have max length of 150 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field FullName must be a string")]
        public String FullName { get; set; }

        [StringLength(10, ErrorMessage = "The field PhoneNumber must have max length of 10 characters")]
        [DataType(DataType.PhoneNumber, ErrorMessage = "The field PhoneNumber must be a PhoneNumber valid")]
        public String PhoneNumber { get; set; }

        [StringLength(13, ErrorMessage = "The field CellphoneNumber must have max length of 13 characters")]
        [DataType(DataType.PhoneNumber, ErrorMessage = "The field CellphoneNumber must be a CellphoneNumber valid")]
        public String CellphoneNumber { get; set; }

        [StringLength(8, ErrorMessage = "The field BirthDate must have max length of 8 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field BirthDate must be a string")]
        public String BirthDate { get; set; }

        [ForeignKey("MaritalStatus")]
        [Required(ErrorMessage = "The field MaritalStatusId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field MaritalStatusId must be a number.")]
        public int MaritalStatusId { get; set; }
        public MaritalStatus MaritalStatus { get; set; }

        [ForeignKey("Gender")]
        [Required(ErrorMessage = "The field GenderId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field GenderId must be a number.")]
        public int GenderId { get; set; }
        public Gender Gender { get; set; }

        [ForeignKey("Address")]
        [Required(ErrorMessage = "The field AddressId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field AddressId must be a number.")]
        public int AddressId { get; set; }
        public Address Address { get; set; }

        [StringLength(13, ErrorMessage = "The field BirthDate must have max length of 13 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field BirthDate must be a string")]
        public String RFC { get; set; }

        [Required(ErrorMessage = "The field C.U.R.P. is required")]
        [StringLength(18, ErrorMessage = "The field C.U.R.P. must have max length of 18 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field C.U.R.P. must be a string")]
        public String CURP { get; set; }

        [Required(ErrorMessage = "The field NSS is required")]
        [StringLength(16, ErrorMessage = "The field NSS must have max length of 16 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field NSS must be a string")]
        public String NSS { get; set; }

        [ForeignKey("User")]
        [Required(ErrorMessage = "The field UserId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field UserId must be a number.")]
        public int UserId { get; set; }
        public User User { get; set; }

        public byte[] Photo { get; set; }

        public byte[] FingerPrint { get; set; }

        [Required(ErrorMessage = "The field StartDate is required")]
        [DataType(DataType.Date, ErrorMessage = "The field StartDate must be a Date")]
        public DateTime StartDate { get; set; }

        public DateTime? EndDate { get; set; }

        [Required(ErrorMessage = "The field IsActive is required")]
        public bool IsActive { get; set; }

        public virtual ICollection<EmployeeDepartmentHistory> EmployeesDepartmentHistory { get; set; }
    }
}
