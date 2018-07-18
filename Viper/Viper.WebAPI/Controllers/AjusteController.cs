using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Viper.WebAPI.Models;

namespace Viper.WebAPI.Controllers
{
    public class AjusteController : ApiController
    {
       

        // GET: api/Ajuste
        public IHttpActionResult GetProduct()
        {
            using (ViperContext db = new ViperContext())
            {

                var emme = from p in db.products
                           join pi in db.productinventories
                           on p.Id equals pi.Id

                           select new
                           {
                               p.Description,
                               pi.UnitsInStock
                               
                           };

                return Ok(emme.ToList());

            }
        }

            // POST: api/Ajuste
            public void Post([FromBody]string value)
        {
        }

        // PUT: api/Ajuste/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Ajuste/5
        public void Delete(int id)
        {
        }
    }
}
