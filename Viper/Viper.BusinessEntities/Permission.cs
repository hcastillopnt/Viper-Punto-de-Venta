using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessEntities
{
    public class Permission
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string ControlName { get; set; }
        public string ControlText { get; set; }
        public string ControlImage { get; set; }
        public DateTime CreatedDate { get; set; }
        public string CreateBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string ModifiedBy { get; set; }
    }
}
