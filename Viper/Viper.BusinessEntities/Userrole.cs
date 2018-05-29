using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class Userrole
    {
        public int Id { get; set; }



        public int EmployeeId { get; set; }



        public int RoleId { get; set; }



        public DateTime CreatedDate { get; set; }



        public string CreateBy { get; set; }



        public DateTime ModifiedDate { get; set; }



        public string ModifiedBy { get; set; }
    }
}
