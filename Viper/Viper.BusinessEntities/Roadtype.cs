﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class RoadType
    {
        /// <summary>
        /// Campo Id
        /// </summary>
        [Key]
        public int Id { get; set; }

        /// <summary>
        /// Campo Name
        /// </summary>
        [Required(ErrorMessage = "El campo Name es obligatorio")]
        [StringLength(100, MinimumLength = 2)]
        [DataType(DataType.Text)]
        public string Name { get; set; }
    }
}
