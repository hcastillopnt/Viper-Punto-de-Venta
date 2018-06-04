using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class Employeedepartmenthistory
    {
        /// <summary>
        /// Campo Id
        /// </summary>
        [Required(ErrorMessage = "El campo ID es obligatorio")]
        [StringLength(11, MinimumLength = 1)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int Id { get; set; }

        /// <summary>
        /// Campo EmployeeId
        /// </summary>
        [Required(ErrorMessage = "El campo EmployeeID es obligatorio")]
        [StringLength(11, MinimumLength = 1)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int EmployeeId { get; set; }

        /// <summary>
        /// Campo SiteId
        /// </summary>
        [Required(ErrorMessage = "El campo SiteId es obligatorio")]
        [StringLength(11, MinimumLength = 1)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int SiteId { get; set; }

        /// <summary>
        /// Campo ShiftId
        /// </summary>
        [Required(ErrorMessage = "El campo ShiftID es obligatorio")]
        [StringLength(11, MinimumLength = 1)]
        [Range(0, int.MaxValue, ErrorMessage = "Por favor ingresa un numero entero valido")]
        public int ShiftId { get; set; }

        /// <summary>
        /// Campo StartDate
        /// </summary>
        [Required(ErrorMessage = "El campo StartDate es obligatorio")]
        [DataType(DataType.Date)]
        public DateTime StartDate { get; set; }

        /// <summary>
        /// Campo EndDate
        /// </summary>
        [Required(ErrorMessage = "El campo EndDate es obligatorio")]
        [DataType(DataType.Date)]
        public DateTime EndDate { get; set; }

        /// <summary>
        /// Campo ModifiedDate
        /// </summary>
        [Required(ErrorMessage = "El campo ModifiedDate es obligatorio")]
        [DataType(DataType.DateTime)]
        public DateTime ModifiedDate { get; set; }

    }
}
