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
        #region procUploadMenuToAdministrator

        /// <summary>
        /// Metodo para cargar los menus disponibles para un administrador
        /// </summary>
        /// <returns>void</returns>
        public static void procUploadPermissionsToMenuByAdministrator()
        {
            DataAccessLayer.MenuDAL.procUploadPermissionsToMenuByAdministrator();
        }

        #endregion

        #region procUploadMenuByRolName

        /// <summary>
        /// Metodo para cargar las opciones del menu por medio del rol que tenga el usuario logueado
        /// </summary>
        /// <param name="RolName">Nombre del Rol</param>
        /// <returns>DataTable</returns>
        public static DataTable procUploadMenuByRolName(string RolName)
        {
            DataTable dt = new DataTable();

            dt = DataAccessLayer.MenuDAL.procUploadMenuByRolName(RolName);

            return dt;
        }

        #endregion

        #region procUploadSubmenuByRolName

        /// <summary>
        /// Metodo para cargar las opciones del menu por medio del rol que tenga el usuario logueado
        /// </summary>
        /// <param name="RolName">Nombre del Rol</param>
        /// <param name="Menu">Nombre del Menu</param>
        /// <returns>DataTable</returns>
        public static DataTable procUploadSubmenuByRolName(string RolName, string Menu)
        {
            DataTable dt = new DataTable();

            dt = DataAccessLayer.MenuDAL.procUploadSubmenuByRolName(RolName, Menu);

            return dt;
        }

        #endregion
    }
}
