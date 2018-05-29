using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class Regimenfiscal
    {
        public int Id { get; set; }


        public string Key { get; set; }


        public string Description { get; set; }


        public byte Fisica { get; set; }


        public byte Moral { get; set; }



        public DateTime CreatedDate { get; set; }



        public string CreateBy { get; set; }



        public DateTime ModifiedDate { get; set; }



        public string ModifiedBy { get; set; }
    }
}
