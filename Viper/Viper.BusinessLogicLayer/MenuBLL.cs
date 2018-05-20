using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessLogicLayer
{
    public class MenuBLL
    {
        /// <summary>
        /// Metodo para cargar las opciones del menu por medio del rol que tenga el usuario logueado
        /// </summary>
        /// <param name="RolName">Nombre del Rol</param>
        /// <returns>DataTable</returns>
        public static DataTable CargarMenuPorRol(string RolName)
        {
            DataTable dt = new DataTable();

            dt = DataAccessLayer.MenuDAL.CargarMenuPorRol(RolName);

            return dt;
        }
    }
}
