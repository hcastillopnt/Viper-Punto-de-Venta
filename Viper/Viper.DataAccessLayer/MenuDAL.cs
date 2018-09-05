using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viper.BusinessEntities;

namespace Viper.DataAccessLayer
{
    public class MenuDAL
    {
        /// <summary>
        /// A DbContext instance represents a combination of the Unit Of Work and Repository patterns 
        /// such that it can be used to query from a database and group together changes that will 
        /// then be written back to the store as a unit. 
        /// DbContext is conceptually similar to ObjectContext. 
        /// DbContext is the primary class that is responsible for interacting with the database.
        /// </summary>
        private static ViperDbContext dbCtx = new ViperDbContext();

        #region procUploadMenuToAdministrator

        /// <summary>
        /// Metodo para cargar los menus disponibles para un administrador
        /// </summary>
        /// <returns>void</returns>
        public static void procUploadPermissionsToMenuByAdministrator()
        {
            bool isExistente = false;

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                var result = dbCtx.Permissions.ToList().Count > 0;

                if (!result)
                {
                    dbCtx.Database.ExecuteSqlCommand("INSERT INTO Permission (RoleId, ModuleId) SELECT 1, Id FROM Module;");

                    dbCtx.SaveChanges();
                }
            }
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
            bool isExistente = false;

            DataTable dt = new DataTable();

            //Validar si la base de datos existe
            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                //Recuperar el menu de opciones
                var result = (from p in dbCtx.Permissions
                              join r in dbCtx.Roles on p.RoleId equals r.Id
                              join m in dbCtx.Modules on p.ModuleId equals m.Id
                              where r.Name == RolName && m.Submenu == "NULL"
                              select new
                              {
                                  m.Name,
                                  m.Menu,
                                  m.ControlName,
                                  m.ControlImage,
                                  m.IsActive
                              }).ToList();

                //Crear las columnas del DataTable
                dt.Columns.AddRange(new DataColumn[]{
                                new DataColumn("Name", typeof(string)),
                                new DataColumn("Menu", typeof(string)),
                                new DataColumn("ControlName", typeof(string)),
                                new DataColumn("ControlImage", typeof(string)),
                                new DataColumn("IsActive", typeof(string))
                            });

                //Guardar los datos recuperados en una fila del DataTable
                result.ToList().ForEach(x =>
                {
                    //Crear una fila nueva
                    var row = dt.NewRow();

                    //Cargar los datos de la fila
                    row["Name"] = x.Name;
                    row["Menu"] = x.Menu;
                    row["ControlName"] = x.ControlName;
                    row["ControlImage"] = x.ControlImage;
                    row["IsActive"] = x.IsActive;

                    //Añadir fila al DataTable
                    dt.Rows.Add(row);
                });
            }

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
            bool isExistente = false;

            DataTable dt = new DataTable();

            //Validar si la base de datos existe
            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                //Recuperar el menu de opciones
                var result = (from p in dbCtx.Permissions
                              join r in dbCtx.Roles on p.RoleId equals r.Id
                              join m in dbCtx.Modules on p.ModuleId equals m.Id
                              where r.Name == RolName && m.Menu == Menu && m.Submenu != "NULL"
                              select new
                              {
                                  m.Name,
                                  m.Submenu,
                                  m.ControlName,
                                  m.ControlImage,
                                  m.IsActive
                              }).ToList();

                //Crear las columnas del DataTable
                dt.Columns.AddRange(new DataColumn[]{
                                new DataColumn("Name", typeof(string)),
                                new DataColumn("SubMenu", typeof(string)),
                                new DataColumn("ControlName", typeof(string)),
                                new DataColumn("ControlImage", typeof(string)),
                                new DataColumn("IsActive", typeof(string))
                            });

                //Guardar los datos recuperados en una fila del DataTable
                result.ToList().ForEach(x =>
                {
                    //Crear una fila nueva
                    var row = dt.NewRow();

                    //Cargar los datos de la fila
                    row["Name"] = x.Name;
                    row["SubMenu"] = x.Submenu;
                    row["ControlName"] = x.ControlName;
                    row["ControlImage"] = x.ControlImage;
                    row["IsActive"] = x.IsActive;

                    //Añadir fila al DataTable
                    dt.Rows.Add(row);
                });
            }

            return dt;
        }

        #endregion
    }
}
