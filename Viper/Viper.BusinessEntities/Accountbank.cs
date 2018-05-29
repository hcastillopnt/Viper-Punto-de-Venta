using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class Accountbank
    {
        public int Id { get; set; }



        public string Account { get; set; }



        public string BankBranch { get; set; }



        public int Key { get; set; }



        public int BankId { get; set; }



        public DateTime CreatedDate { get; set; }



        public string CreateBy { get; set; }



        public DateTime ModifiedDate { get; set; }



        public string ModifiedBy { get; set; }
    }
}
