using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessEntities
{
    class Usersite
    {
        public int Id { get; set; }



        public int EmployeeId { get; set; }



        public int SiteId { get; set; }



        public DateTime CreatedDate { get; set; }



        public string CreateBy { get; set; }



        public DateTime ModifiedDate { get; set; }



        public string ModifiedBy { get; set; }
    }
}
