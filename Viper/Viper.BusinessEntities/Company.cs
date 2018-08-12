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
    public class Company : AuditableEntity<Company>
    {
        [Required(ErrorMessage = "The field CompanyName is required")]
        [StringLength(50, ErrorMessage = "The field CompanyName must have max length of 50 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field CompanyName must be a string")]
        public String CompanyName { get; set; }

        [Required(ErrorMessage = "The field CompanyKey is required")]
        [StringLength(30, ErrorMessage = "The field CompanyKey must have max length of 30 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field CompanyKey must be a string")]
        public String CompanyKey { get; set; }

        [ForeignKey("Address")]
        [Required(ErrorMessage = "The field AddressId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field AddressId must be a number.")]
        public int AddressId { get; set; }
        public Address Address { get; set; }

        [ForeignKey("AddressSAT")]
        [Required(ErrorMessage = "The field AddressSATId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field AddressSATId must be a number.")]
        public int AddressSATId { get; set; }
        public AddressSAT AddressSAT { get; set; }

        [ForeignKey("RegimenFiscal")]
        [Required(ErrorMessage = "The field RegimenFiscalId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field RegimenFiscalId must be a number.")]
        public int RegimenFiscalId { get; set; }
        public RegimenFiscal RegimenFiscal { get; set; }

        [StringLength(10, ErrorMessage = "The field PhoneNumber must have max length of 10 characters")]
        [DataType(DataType.PhoneNumber, ErrorMessage = "The field PhoneNumber must be a PhoneNumber valid")]
        public String PhoneNumber { get; set; }

        [StringLength(13, ErrorMessage = "The field CellphoneNumber must have max length of 13 characters")]
        [DataType(DataType.PhoneNumber, ErrorMessage = "The field CellphoneNumber must be a CellphoneNumber valid")]
        public String CellphoneNumber { get; set; }

        [StringLength(50, ErrorMessage = "The field EmailAddress must have max length of 50 characters")]
        [DataType(DataType.EmailAddress, ErrorMessage = "The field EmailAddress must be a Email valid")]
        public String EmailAddress { get; set; }

        [StringLength(50, ErrorMessage = "The field FiscalName must have max length of 50 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field FiscalName must be a string")]
        public String FiscalName { get; set; }

        [Required(ErrorMessage = "The field R.F.C. is required")]
        [StringLength(13, ErrorMessage = "The field R.F.C. must have max length of 13 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field R.F.C. must be a string")]
        public String RFC { get; set; }

        [Required(ErrorMessage = "The field C.U.R.P. is required")]
        [StringLength(18, ErrorMessage = "The field C.U.R.P. must have max length of 18 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field C.U.R.P. must be a string")]
        public String CURP { get; set; }

        [StringLength(100, ErrorMessage = "The field ApiKey must have max length of 100 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field ApiKey must be a string")]
        public String ApiKey { get; set; }

        [StringLength(30, ErrorMessage = "The field BusinessActivity must have max length of 30 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field BusinessActivity must be a string")]
        public String BusinessActivity { get; set; }

        [ForeignKey("User")]
        [Required(ErrorMessage = "The field UserId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field UserId must be a number.")]
        public int UserId { get; set; }
        public User User { get; set; }

        public byte[] Logo { get; set; }

        public virtual ICollection<Site> Sites { get; set; }
    }
}
