using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class Employee
    {
        public int id { get; set; }



        public string EmployeeIDNumber { get; set; }



        public string IS { get; set; }



        public string FirstName { get; set; }



        public string MiddleName { get; set; }



        public string LastName { get; set; }



        public string FullName { get; set; }



        public string PhoneNumber { get; set; }



        public string CellphoneNumber { get; set; }



        public string LoginID { get; set; }



        public string JobTitle { get; set; }



        public string BirthDate { get; set; }



        public int MaritalStatusId { get; set; }



        public int GenderId { get; set; }



        public string RFC { get; set; }



        public string CURP { get; set; }



        public string NSS { get; set; }


        /*
        public longblob ProfilePhoto { get; set; }



        public longblob FingerPrint { get; set; }
        */


        public DateTime CreatedDate { get; set; }



        public string CreateBy { get; set; }



        public DateTime ModifiedDate { get; set; }



        public string ModifiedBy { get; set; }
    }
}
