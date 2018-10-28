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
    public class Supplier : AuditableEntity<Supplier>
    {
        [Required(ErrorMessage = "The field SupplierName is required")]
        [StringLength(50, ErrorMessage = "The field SupplierName must have max length of 50 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field SupplierName must be a string")]
        public String SupplierName { get; set; }

        [Required(ErrorMessage = "The field SupplierKey is required")]
        [StringLength(30, ErrorMessage = "The field SupplierKey must have max length of 30 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field SupplierKey must be a string")]
        public String SupplierKey { get; set; }

        //[Required(ErrorMessage = "The field ContactName is required")]
        //[StringLength(100, ErrorMessage = "The field ContactName must have max length of 100 characters")]
        //[DataType(DataType.Text, ErrorMessage = "The field ContactName must be a string")]
        //public String ContactName { get; set; }

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

        [Required(ErrorMessage = "The field R.F.C. is required")]
        [StringLength(13, ErrorMessage = "The field R.F.C. must have max length of 13 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field R.F.C. must be a string")]
        public String RFC { get; set; }

        [StringLength(50, ErrorMessage = "The field FiscalName must have max length of 50 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field FiscalName must be a string")]
        public String FiscalName { get; set; }

        //[DataType(DataType.Currency, ErrorMessage = "The field CreditLimit must be a money")]
        //public Decimal CreditLimit { get; set; }

        //[Range(0, int.MaxValue, ErrorMessage = "The field DaysCredit must be a number.")]
        //public int DaysCredit { get; set; }

        [StringLength(30, ErrorMessage = "The field BusinessActivity must have max length of 30 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field BusinessActivity must be a string")]
        public String BusinessActivity { get; set; }

        [ForeignKey("User")]
        [Required(ErrorMessage = "The field UserId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field UserId must be a number.")]
        public int UserId { get; set; }
        public User User { get; set; }

        //[ForeignKey("Site")]
        //[Required(ErrorMessage = "The field SiteId is required")]
        //[Range(0, int.MaxValue, ErrorMessage = "The field SiteId must be a number.")]
        //public int SiteId { get; set; }
        //public Site Site { get; set; }

        [Required(ErrorMessage = "The field IsActive is required")]
        public bool IsActive { get; set; }

        public byte[] Logo { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
