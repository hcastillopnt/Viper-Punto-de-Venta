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
    public class Product : AuditableEntity<Product>
    {
        [Required(ErrorMessage = "The field BarCode is required")]
        [StringLength(21, ErrorMessage = "The field BarCode must have max length of 21 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field BarCode must be a string")]
        public String BarCode { get; set; }

        [StringLength(21, ErrorMessage = "The field AlternateCode must have max length of 21 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field AlternateCode must be a string")]
        public String AlternativeCode { get; set; }

        [StringLength(100, ErrorMessage = "The field ActiveSubstance must have max length of 100 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field ActiveSubstance must be a string")]
        public String ActiveSubstance { get; set; }

        [Required(ErrorMessage = "The field Description is required")]
        [StringLength(100, ErrorMessage = "The field Description must have max length of 100 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field Description must be a string")]
        public String Description { get; set; }

        [StringLength(10, ErrorMessage = "The field Location must have max length of 21 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field Location must be a string")]
        public String Location { get; set; }

        [ForeignKey("ProductSubCategory")]
        [Required(ErrorMessage = "The field ProductSubCategoryId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field ProductSubCategoryId must be a number.")]
        public int ProductSubCategoryId { get; set; }
        public ProductSubCategory ProductSubCategory { get; set; }

        public Decimal StandardCost { get; set; }

        public Decimal ListPrice { get; set; }

        [Required(ErrorMessage = "The field IsUseInStock is required")]
        public Boolean IsUseInStock { get; set; }

        [Required(ErrorMessage = "The field IsDiscontinued is required")]
        public Boolean IsDiscontinued { get; set; }

        [Required(ErrorMessage = "The field IsLot is required")]
        public Boolean IsLot { get; set; }

        [Required(ErrorMessage = "The field IsRecipe is required")]
        public Boolean IsRecipe { get; set; }

        [Required(ErrorMessage = "The field IsActive is required")]
        public Boolean IsActive { get; set; }

        public string DiscontinuedDate { get; set; }

        [Required(ErrorMessage = "The field InvMin is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field InvMin must be a number.")]
        public int InvMin { get; set; }

        [Required(ErrorMessage = "The field InvMax is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field InvMax must be a number.")]
        public int InvMax { get; set; }

        [ForeignKey("Supplier")]
        [Required(ErrorMessage = "The field SupplierId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field SupplierId must be a number.")]
        public int SupplierId { get; set; }
        public Supplier Supplier { get; set; }

        [ForeignKey("Site")]
        [Required(ErrorMessage = "The field SiteId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field SiteId must be a number.")]
        public int SiteId { get; set; }
        public Site Site { get; set; }

        public virtual ICollection<ProductInventory> ProductsInventory { get; }
    }
}
