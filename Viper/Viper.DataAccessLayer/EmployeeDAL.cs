using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viper.BusinessEntities;

namespace Viper.DataAccessLayer
{
    public class EmployeeDAL
    {
        /// <summary>
        /// DbContext is an important class in Entity Framework API. It is a bridge between your domain or entity classes and the database.
        /// </summary>
        public static ViperContext dbCtx = new ViperContext();

        #region obtainLoginIDGeneratedAutomatic

        /// <summary>
        /// Method to obtain LoginID generated automatic
        /// </summary>
        /// <returns></returns>
        public static string obtainLoginIDGeneratedAutomatic()
        {
            int inc = 0;

            bool isEN = dbCtx.Employees.ToList().Count() > 0;//verificar si hay empleados

            if (isEN)
            {
                //traer ultimo codigo de empleado registrado
                string clave = dbCtx.Employees.ToList().Last().EmployeeIDNumber;

                //usar metodo substring para sacar numeros del codigo para incrementar
                string numero = clave.Substring(clave.Length - 4, 4);
                int numcl = Convert.ToInt32(numero);

                //incrementar
                inc = numcl + 1;
            }
            else
            {
                //igualar a uno en caso de que sea el primero
                inc = 1;
            }

            return string.Format("VIPER-EMP-{0:0000}", inc);
        }

        #endregion
    }
}
