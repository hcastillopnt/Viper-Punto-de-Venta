using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Viper.BusinessEntities
{
    public class Countryregion
    {
        public int Id { get; set; }


        public string Descripcion { get; set; }



        public string FIPS104 { get; set; }



        public string ISO2 { get; set; }



        public string ISO3 { get; set; }



        public string ISON { get; set; }



        public string Internet { get; set; }



        public string Capital { get; set; }



        public string MapReference { get; set; }



        public string NationalitySingular { get; set; }



        public string NationalityPlural { get; set; }



        public string Currency { get; set; }



        public string CurrencyCode { get; set; }



        public long Population { get; set; }



        public string Title { get; set; }



        public string Comment { get; set; }
    }
}
