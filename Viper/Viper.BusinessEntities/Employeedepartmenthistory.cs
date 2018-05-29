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
        public int Id { get; set; }


        public int EmployeeId { get; set; }


        public int SiteId { get; set; }


        public int ShiftId { get; set; }


        public DateTime StartDate { get; set; }


        public DateTime EndDate { get; set; }


        public DateTime ModifiedDate { get; set; }

    }
}
