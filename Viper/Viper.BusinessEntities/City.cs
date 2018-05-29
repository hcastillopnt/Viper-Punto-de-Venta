using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class City
    {
        public int Id { get; set; }


        public int CountryRegionId { get; set; }


        public int StateProvinceId { get; set; }


        public string CveEnt { get; set; }


        public string CveCity { get; set; }


        public string Description { get; set; }


        public string CveCab { get; set; }


        public string NameCab { get; set; }


        public string PTOT { get; set; }


        public string PMAS { get; set; }


        public string PFEM { get; set; }


        public string VTOT { get; set; }
    }
}
