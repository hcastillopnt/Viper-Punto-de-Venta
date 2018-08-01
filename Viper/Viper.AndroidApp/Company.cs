using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.AndroidApp
{
    public class Company
    {
        /// <summary>
        /// Campo Id
        /// </summary>

        public int Id { get; set; }

        /// <summary>
        /// Campo CompanyName
        /// </summary>
        public string CompanyName { get; set; }

        /// <summary>
        /// Campo CompanyKey
        /// </summary>
        
        public string CompanyKey { get; set; }

        /// <summary>
        /// Campo AddressId
        /// </summary>
    
        public int AddressId { get; set; }

        /// <summary>
        /// Campo PhoneNumber
        /// </summary>
     
        public string PhoneNumber { get; set; }

        /// <summary>
        /// Campo CellphoneNumber
        /// </summary>
     
        public string CellphoneNumber { get; set; }

        /// <summary>
        /// Campo EmailAddress
        /// </summary>
     
        public string EmailAddress { get; set; }

        /// <summary>
        /// Campo FiscalName
        /// </summary>

        public string FiscalName { get; set; }

        /// <summary>
        /// Campo AddressSATId
        /// </summary>

        public int AddressSATId { get; set; }

        /// <summary>
        /// Campo RegimenFiscalId
        /// </summary>
       
        public int RegimenFiscalId { get; set; }

        /// <summary>
        /// Campo AccountBankId
        /// </summary>

        public int AccountBankId { get; set; }

        /// <summary>
        /// Campo RFC
        /// </summary>
  
        public string RFC { get; set; }

        /// <summary>
        /// Campo CURP
        /// </summary>
   
        public string CURP { get; set; }

        /// <summary>
        /// Campo ApiKey
        /// </summary>
  
        public string ApiKey { get; set; }

        /// <summary>
        /// Campo BusinessActivity
        /// </summary>
     
        public string BusinessActivity { get; set; }

        /// <summary>
        /// Campo CreatedDate
        /// </summary>
  
        public DateTime CreatedDate { get; set; }

        /// <summary>
        /// Campo CreateBy
        /// </summary>
      
        public string CreateBy { get; set; }

        /// <summary>
        /// Campo ModifiedDate
        /// </summary>
      
        public DateTime ModifiedDate { get; set; }

        /// <summary>
        /// Campo ModifiedBy
        /// </summary>

        public string ModifiedBy { get; set; }

        /// <summary>
        /// Campo LoginID
        /// </summary>
      
        public string LoginID { get; set; }

        /// <summary>
        /// Campo PasswordEncrypted
        /// </summary>
       
        public string PasswordEncrypted { get; set; }

    }
}
