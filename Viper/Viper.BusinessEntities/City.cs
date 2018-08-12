using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessEntities
{
    public class City
    {
        [Key]
        public int Id { get; set; }

        [ForeignKey("StateProvince")]
        [Required(ErrorMessage = "The field StateProvinceId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field StateProvinceId must be a number.")]
        public int StateProvinceId { get; set; }
        public StateProvince StateProvince { get; set; }

        [ScaffoldColumn(false)]
        [Required(ErrorMessage = "The field CveEnt is required")]
        [StringLength(2, ErrorMessage = "The field CveEnt must have max length of 2 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field CveEnt must be a string")]
        public String CveEnt { get; set; }

        [ScaffoldColumn(false)]
        [Required(ErrorMessage = "The field CveCity is required")]
        [StringLength(3, ErrorMessage = "The field CveCity must have max length of 3 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field CveCity must be a string")]
        public String CveCity { get; set; }

        [Required(ErrorMessage = "The field Description is required")]
        [StringLength(100, ErrorMessage = "The field Description must have max length of 100 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field Description must be a string")]
        public String Description { get; set; }

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

        public virtual ICollection<Address> Addresses { get; set; }
        public virtual ICollection<AddressSAT> AddressesSAT { get; set; }
    }
}
