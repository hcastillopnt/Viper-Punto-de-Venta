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
    public class Address : AuditableEntity<Address>
    {
        [ForeignKey("RoadType")]
        [Required(ErrorMessage = "The field RoadTypeId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field RoadTypeId must be a number.")]
        public int RoadTypeId { get; set; }
        public RoadType RoadType { get; set; }

        [ForeignKey("AddressType")]
        [Required(ErrorMessage = "The field AddressTypeId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field AddressTypeId must be a number.")]
        public int AddressTypeId { get; set; }
        public AddressType AddressType { get; set; }

        [Required(ErrorMessage = "The field AddressLine1 is required")]
        [StringLength(100, ErrorMessage = "The field AddressLine1 must have max length of 100 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field AddressLine1 must be a string")]
        public String AddressLine1 { get; set; }

        [Required(ErrorMessage = "The field AddressLine2 is required")]
        [StringLength(100, ErrorMessage = "The field AddressLine2 must have max length of 100 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field AddressLine2 must be a string")]
        public String AddressLine2 { get; set; }

        [ForeignKey("CountryRegion")]
        [Required(ErrorMessage = "The field CountryRegionId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field CountryRegionId must be a number.")]
        public int CountryRegionId { get; set; }
        public CountryRegion CountryRegion { get; set; }

        [ForeignKey("StateProvince")]
        [Required(ErrorMessage = "The field StateProvinceId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field StateProvinceId must be a number.")]
        public int StateProvinceId { get; set; }
        public StateProvince StateProvince { get; set; }

        [ForeignKey("City")]
        [Required(ErrorMessage = "The field CityId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field CityId must be a number.")]
        public int CityId { get; set; }
        public City City { get; set; }

        [Required(ErrorMessage = "The field PostalCode is required")]
        [StringLength(5, ErrorMessage = "The field PostalCode must have max length of 5 characters")]
        [DataType(DataType.PostalCode, ErrorMessage = "The field PostalCode must be a Postal Code valid")]
        public String PostalCode { get; set; }

        public virtual ICollection<Company> Companies { get; set; }
        public virtual ICollection<Site> Sites { get; set; }
        public virtual ICollection<Employee> Employees { get; set; }
    }
}
