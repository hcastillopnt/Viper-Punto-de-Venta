using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessEntities
{
    public class ProductSubCategory
    {
        [Key]
        public int Id { get; set; }

        [ForeignKey("ProductCategory")]
        [Required(ErrorMessage = "The field ProductCategoryId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field ProductCategoryId must be a number.")]
        public int ProductCategoryId { get; set; }
        public ProductCategory ProductCategory { get; set; }

        [Required(ErrorMessage = "The field Name is required")]
        [StringLength(40, ErrorMessage = "The field Name must have max length of 40 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field Name must be a string")]
        public String Name { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
