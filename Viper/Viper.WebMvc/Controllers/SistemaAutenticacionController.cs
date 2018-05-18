using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Viper.WebMvc.Controllers
{
    public class SistemaAutenticacionController : Controller
    {
        // GET: SistemaAutenticacion
        public ActionResult Autenticacion()
        {
            return View();
        }

        public ActionResult InicioSesion()
        {
            return View();
        }
    }
}