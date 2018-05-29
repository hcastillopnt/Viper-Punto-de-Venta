using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class Company
    {
        public int Id { get; set; }


        public string CompanyName { get; set; }


        public string CompanyKey { get; set; }


        public int AddressId { get; set; }


        public string PhoneNumber { get; set; }


        public string CellphoneNumber { get; set; }


        public string EmailAddress { get; set; }


        public string FiscalName { get; set; }


        public int AddressSATId { get; set; }


        public int RegimenFiscalId { get; set; }


        public int AccountBankId { get; set; }


        public string RFC { get; set; }


        public string CURP { get; set; }


        public string ApiKey { get; set; }


        public string BusinessActivity { get; set; }


        public DateTime CreatedDate { get; set; }



        public string CreateBy { get; set; }



        public DateTime ModifiedDate { get; set; }



        public string ModifiedBy { get; set; }
    }
}
