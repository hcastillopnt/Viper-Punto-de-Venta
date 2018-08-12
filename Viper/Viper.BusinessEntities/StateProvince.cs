using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessEntities
{
    public class StateProvince
    {
        [Key]
        public int Id { get; set; }

        [ForeignKey("CountryRegion")]
        [Required(ErrorMessage = "The field CountryRegionId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field CountryRegionId must be a number.")]
        public int CountryRegionId { get; set; }
        public CountryRegion CountryRegion { get; set; }

        [ScaffoldColumn(false)]
        [Required(ErrorMessage = "The field CveEnt is required")]
        [StringLength(2, ErrorMessage = "The field CveEnt must have max length of 2 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field CveEnt must be a string")]
        public String CveEnt { get; set; }

        [Required(ErrorMessage = "The field Description is required")]
        [StringLength(100, ErrorMessage = "The field Description must have max length of 100 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field Description must be a string")]
        public String Description { get; set; }

        [ScaffoldColumn(false)]
        [Required(ErrorMessage = "The field Abrev is required")]
        [StringLength(10, ErrorMessage = "The field Abrev must have max length of 10 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field Abrev must be a string")]
        public String Abrev { get; set; }

        [ScaffoldColumn(false)]
        [StringLength(7, ErrorMessage = "The field CveCab must have max length of 7 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field CveCab must be a string")]
        public String CveCab { get; set; }

        [ScaffoldColumn(false)]
        [StringLength(100, ErrorMessage = "The field NameCab must have max length of 100 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field NameCab must be a string")]
        public String NameCab { get; set; }

        [ScaffoldColumn(false)]
        [StringLength(10, ErrorMessage = "The field PTOT must have max length of 10 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field PTOT must be a string")]
        public String PTOT { get; set; }

        [ScaffoldColumn(false)]
        [StringLength(10, ErrorMessage = "The field PMAS must have max length of 10 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field PMAS must be a string")]
        public String PMAS { get; set; }

        [ScaffoldColumn(false)]
        [StringLength(10, ErrorMessage = "The field PFEM must have max length of 10 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field PFEM must be a string")]
        public String PFEM { get; set; }

        [ScaffoldColumn(false)]
        [StringLength(10, ErrorMessage = "The field VTOT must have max length of 10 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field VTOT must be a string")]
        public String VTOT { get; set; }

        public virtual ICollection<City> Cities { get; set; }
        public virtual ICollection<Address> Addresses { get; set; }
        public virtual ICollection<AddressSAT> AddressesSAT { get; set; }
    }
}
