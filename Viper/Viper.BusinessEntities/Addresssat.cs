using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class Addresssat
    {
        public int Id { get; set; }



        public int RoadTypeId { get; set; }



        public int AddressTypeId { get; set; }




        public string AddressLine1 { get; set; }




        public string AddressLine2 { get; set; }



        public int CountryRegionId { get; set; }




        public int StateProvinceId { get; set; }




        public int CityId { get; set; }




        public string PostalCode { get; set; }



        public DateTime CreatedDate { get; set; }



        public string CreateBy { get; set; }



        public DateTime ModifiedDate { get; set; }



        public string ModifiedBy { get; set; }
    }
}
