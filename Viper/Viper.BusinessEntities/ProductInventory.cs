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
    public class ProductInventory
    {
        [Key]
        public int Id { get; set; }

        [ForeignKey("Product")]
        [Required(ErrorMessage = "The field ProductId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field ProductId must be a number.")]
        public int ProductId { get; set; }
        public Product Product { get; set; }

        [ForeignKey("Site")]
        [Required(ErrorMessage = "The field SiteId is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field SiteId must be a number.")]
        public int SiteId { get; set; }
        public Site Site { get; set; }

        [Required(ErrorMessage = "The field UnitsInStock is required")]
        [Range(0, int.MaxValue, ErrorMessage = "The field UnitsInStock must be a number.")]
        public int UnitsInStock { get; set; }
    }
}
