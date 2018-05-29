using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class Membership
    {
        public int Id { get; set; }

        
        public int EmployeeId { get; set; }


        public string Password { get; set; }


        public string PasswordSHA1 { get; set; }


        public string PasswordTripleDES { get; set; }



        public string MobilePIN { get; set; }


        public string EmailAddress { get; set; }


        public string PasswordQuestion { get; set; }


        public string PasswordAnswer { get; set; }


        public int AccessFailed { get; set; }


        public byte IsWelcome { get; set; }


        public byte IsApproved { get; set; }


        public byte IsActive { get; set; }


        public byte IsEnabled { get; set; }


        public DateTime CreatedDate { get; set; }



        public string CreateBy { get; set; }



        public DateTime ModifiedDate { get; set; }



        public string ModifiedBy { get; set; }
    }
}
