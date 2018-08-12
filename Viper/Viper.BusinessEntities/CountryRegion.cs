using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessEntities
{
    public class CountryRegion
    {
        [Key]
        public int Id { get; set; }

        [Required(ErrorMessage = "The field Description is required")]
        [StringLength(100, ErrorMessage = "The field Description must have max length of 100 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field Description must be a string")]
        public String Description { get; set; }

        [ScaffoldColumn(false)]
        [Required(ErrorMessage = "The field FIPS104 is required")]
        [StringLength(2, ErrorMessage = "The field FIPS0104 must have max length of 2 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field FIPS104 must be a string")]
        public String FIPS104 { get; set; }

        [ScaffoldColumn(false)]
        [Required(ErrorMessage = "The field ISO2 is required")]
        [StringLength(2, ErrorMessage = "The field ISO2 must have max length of 2 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field ISO2 must be a string")]
        public String ISO2 { get; set; }

        [ScaffoldColumn(false)]
        [Required(ErrorMessage = "The field ISO3 is required")]
        [StringLength(3, ErrorMessage = "The field ISO3 must have max length of 3 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field ISO3 must be a string")]
        public String ISO3 { get; set; }

        [ScaffoldColumn(false)]
        [Required(ErrorMessage = "The field ISON is required")]
        [StringLength(30, ErrorMessage = "The field ISON must have max length of 30 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field ISON must be a string")]
        public String ISON { get; set; }

        [ScaffoldColumn(false)]
        [StringLength(2, ErrorMessage = "The field Internet must have max length of 2 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field Internet must be a string")]
        public String Internet { get; set; }

        [ScaffoldColumn(false)]
        [StringLength(25, ErrorMessage = "The field Capital must have max length of 25 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field Capital must be a string")]
        public String Capital { get; set; }

        [ScaffoldColumn(false)]
        [StringLength(50, ErrorMessage = "The field MapReference must have max length of 50 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field MapReference must be a string")]
        public String MapReference { get; set; }

        [ScaffoldColumn(false)]
        [StringLength(35, ErrorMessage = "The field NationalitySingular must have max length of 35 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field NationalitySingular must be a string")]
        public String NationalitySingular { get; set; }

        [ScaffoldColumn(false)]
        [StringLength(35, ErrorMessage = "The field NationalityPlural must have max length of 35 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field NationalityPlural must be a string")]
        public String NationalityPlural { get; set; }

        [ScaffoldColumn(false)]
        [StringLength(30, ErrorMessage = "The field Currency must have max length of 30 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field Currency must be a string")]
        public String Currency { get; set; }

        [ScaffoldColumn(false)]
        [StringLength(3, ErrorMessage = "The field CurrencyCode must have max length of 3 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field CurrencyCode must be a string")]
        public String CurrencyCode { get; set; }

        [ScaffoldColumn(false)]
        [Range(0, Int64.MaxValue, ErrorMessage = "The field Population must be a number")]
        [Column(TypeName = "bigint")]
        public Int64 Population { get; set; }

        [ScaffoldColumn(false)]
        [StringLength(50, ErrorMessage = "The field Title must have max length of 50 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field Title must be a string")]
        public String Title { get; set; }

        [ScaffoldColumn(false)]
        [StringLength(2048, ErrorMessage = "The field Comment must have max length of 2048 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field Comment must be a string")]
        public String Comment { get; set; }

        public virtual ICollection<StateProvince> StatesProvince { get; set; }
        public virtual ICollection<Address> Addresses { get; set; }
        public virtual ICollection<AddressSAT> AddressesSAT { get; set; }
    }
}
