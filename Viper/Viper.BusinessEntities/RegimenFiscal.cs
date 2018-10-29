using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessEntities
{
    public class RegimenFiscal
    {
        [Key]
        public int Id { get; set; }

        [Required(ErrorMessage = "The field Key is required")]
        [StringLength(6, ErrorMessage = "The field Key must have max length of 6 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field Key must be a string")]
        public String Key { get; set; }

        [Required(ErrorMessage = "The field Description is required")]
        [StringLength(400, ErrorMessage = "The field Description must have max length of 400 characters")]
        [DataType(DataType.Text, ErrorMessage = "The field Description must be a string")]
        public String Description { get; set; }

        [Required(ErrorMessage = "The field Fisica is required")]
        public bool Fisica { get; set; }

        [Required(ErrorMessage = "The field Moral is required")]
        public bool Moral { get; set; }

        public virtual ICollection<Company> Companies { get; set; }
        //public virtual ICollection<Supplier> Suppliers { get; set; }
    }
}
