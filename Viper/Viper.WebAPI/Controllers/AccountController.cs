using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Viper.WebAPI.Models;

namespace Viper.WebAPI.Controllers
{
    public class AccountController : ApiController
    {
        [HttpGet]
        [ActionName("GetByLogin")]
        public List<Company> GetAccount(string usr, string pwd, string compk)
        {
            using (ViperContext db = new ViperContext())
            {

                var emme = (from c in db.Companies
                            where c.LoginID == usr && c.PasswordEncrypted == pwd && c.CompanyKey == compk
                            select c).ToList();
                           //select new
                           //{
                           //    c.LoginID,
                           //    c.PasswordEncrypted,
                           //    c.CompanyKey

                           //};

                return emme.ToList();

            }
        }
    }
}

