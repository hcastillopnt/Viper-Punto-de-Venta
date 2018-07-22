using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessEntities
{
    public class Product
    {
        /// <summary>
        /// Campo Id
        /// </summary>
        [Key]
        public int Id { get; set; }

      
        /// <summary>
        /// Campo BarCode
        /// </summary>
        [Required(ErrorMessage = "El campo Barcode es obligatorio")]
        [StringLength(45, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string BarCode { get; set; }

        /// <summary>
        /// Campo AlternateKey
        /// </summary>
        [Required(ErrorMessage = "El campo AlternateKey es obligatorio")]
        [StringLength(45, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string AlternateKey { get; set; }

        /// <summary>
        /// Campo Description
        /// </summary>
        [Required(ErrorMessage = "El campo Description es obligatorio")]
        [StringLength(200, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string Description { get; set; }

        /// <summary>
        /// Campo IsService
        /// </summary>
        [Required(ErrorMessage = "El campo IsService es obligatorio")]
        public byte IsService { get; set; }

        /// <summary>
        /// Campo Location
        /// </summary>
        [Required(ErrorMessage = "El campo Location es obligatorio")]
        [StringLength(10, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string Location { get; set; }

        /// <summary>
        /// Campo ActiveSubstance
        /// </summary>
        [Required(ErrorMessage = "El campo ActiveSubstance es obligatorio")]
        [StringLength(200, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string ActiveSubstance { get; set; }

        /// <summary>
        /// Campo ProductSubCategoryId
        /// </summary>
        [Required(ErrorMessage = "El campo ProductSubCategoryId es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int ProductSubCategoryId { get; set; }

        /// <summary>
        /// Campo QuantityPerUnit
        /// </summary>
        [Required(ErrorMessage = "El campo QuantityPerUnit es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int QuantityPerUnit { get; set; }

        /// <summary>
        /// Campo StandardCost
        /// </summary>
        [Required(ErrorMessage = "El campo StandardCost es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero valido")]
        public double StandardCost { get; set; }

        /// <summary>
        /// Campo ListPrice
        /// </summary>
        [Required(ErrorMessage = "El campo ListPrice es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero valido")]
        public double ListPrice { get; set; }

        /// <summary>
        /// Campo IVA
        /// </summary>
        [Required(ErrorMessage = "El campo IVA es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero valido")]
        public double IVA { get; set; }

        /// <summary>
        /// Campo IsUseInStock
        /// </summary>
        [Required(ErrorMessage = "El campo IsUseInStock es obligatorio")]
        public byte IsUseInStock { get; set; }

        /// <summary>
        /// Campo IsDiscontinued
        /// </summary>
        [Required(ErrorMessage = "El campo IsDiscontinued es obligatorio")]
        public byte IsDiscontinued { get; set; }

        /// <summary>
        /// Campo DiscontinuedDate
        /// </summary>
        [Required(ErrorMessage = "El campo DiscontinuedDate es obligatorio")]
        [DataType(DataType.DateTime)]
        public DateTime DiscontinuedDate { get; set; }

        /// <summary>
        /// Campo InvMin
        /// </summary>
        [Required(ErrorMessage = "El campo InvMin es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int InvMin { get; set; }

        /// <summary>
        /// Campo InvMax
        /// </summary>
        [Required(ErrorMessage = "El campo InvMax es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int InvMax { get; set; }

        /// <summary>
        /// Campo IsLot
        /// </summary>
        [Required(ErrorMessage = "El campo IsLot es obligatorio")]
        public byte IsLot { get; set; }

        /// <summary>
        /// Campo IsRecipe
        /// </summary>
        [Required(ErrorMessage = "El campo IsRecipe es obligatorio")]
        public byte IsRecipe { get; set; }

        /// <summary>
        /// Campo IsActive
        /// </summary>
        [Required(ErrorMessage = "El campo IsActive es obligatorio")]
        public byte IsActive { get; set; }

        /// <summary>
        /// Campo SupplierId
        /// </summary>
        [Required(ErrorMessage = "El campo SupplierId es obligatorio")]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int SupplierId { get; set; }

        /// <summary>
        /// Campo CreatedDate
        /// </summary>
        [Required(ErrorMessage = "El campo CreatedDate es obligatorio")]
        [DataType(DataType.DateTime)]
        public DateTime CreatedDate { get; set; }

        /// <summary>
        /// Campo CreateBy
        /// </summary>
        [Required(ErrorMessage = "El campo CreateBy es obligatorio")]
        [StringLength(6, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string CreateBy { get; set; }

        /// <summary>
        /// Campo ModifiedDate
        /// </summary>
        [Required(ErrorMessage = "El campo ModifiedDate es obligatorio")]
        [DataType(DataType.DateTime)]
        public DateTime ModifiedDate { get; set; }

        /// <summary>
        /// Campo ModifiedBy
        /// </summary>
        [Required(ErrorMessage = "El campo ModifiedBy es obligatorio")]
        [StringLength(6, MinimumLength = 1)]
        [DataType(DataType.Text)]
        public string ModifiedBy { get; set; }
    }
}
