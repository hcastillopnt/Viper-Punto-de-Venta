using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessLogicLayer
{
    public class LoginBLL
    {
        /// <summary>
		/// metodo para iniciar sesion
		/// </summary>
		/// <param name="us">parametro para nombre de usuario</param>
		/// <param name="pwd">parametro para contraseña</param>
		/// <returns>mensaje</returns>
		public static DataTable iniciarSesion(string us, string pwd)
        {
            DataTable dt = new DataTable();

            dt = DataAccessLayer.LoginDAL.iniciarSesion(us, pwd);
            if (dt.Rows.Count > 0)
            {
                return dt;
            }
            else
            {
                dt = null;
                return dt;
            }

        }

    }
}
