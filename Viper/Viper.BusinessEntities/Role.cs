﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessEntities
{
    public class Role
    {
        /// <summary>
        /// Campo Id
        /// </summary>
        [Required(ErrorMessage = "El campo ID es obligatorio")]
        [StringLength(11, MinimumLength = 1)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int Id { get; set; }



        /// <summary>
        /// Campo Name
        /// </summary>
        [Required(ErrorMessage = "El campo Name es obligatorio")]
        [StringLength(50, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string Name { get; set; }



        /// <summary>
        /// Campo Description
        /// </summary>
        [Required(ErrorMessage = "El campo Description es obligatorio")]
        [StringLength(100, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string Description { get; set; }



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
