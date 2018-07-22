using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using Viper.WebAPI.Models;

namespace Viper.WebAPI.Controllers
{
    public class AccountController : ApiController
    {

        // GET: api/Account

        public List<Company> GetLogin(string usr, string pwd, string compk)
        {
            using (ViperContext db = new ViperContext())
            {
                var query = db.Companies
                    .Where(c => c.LoginID == usr && c.PasswordEncrypted == pwd && c.CompanyKey == compk)
                .ToList();

                return query;
            }
        }

        // POST: api/Account
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Account/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Account/5
        public void Delete(int id)
        {
        }
    }
}
