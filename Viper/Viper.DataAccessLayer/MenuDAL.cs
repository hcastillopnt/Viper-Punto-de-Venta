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
        /// Metodo para cargar los menus disponibles para un administrador
        /// </summary>
        /// <returns>True/False</returns>
        public static bool uploadMenuToAdministrator()
        {
            bool isExistente = false;

            using (ViperDbContext dbCtx = new ViperDbContext())
            {
                isExistente = Database.Exists(dbCtx.Database.Connection);

                if(isExistente)
                {
                    isExistente = false;

                    var result = dbCtx.Permissions.ToList().Count > 0;

                    if(!result)
                    {
                        dbCtx.Database.ExecuteSqlCommand("INSERT INTO Permission (RoleId, ModuleId) SELECT 2, Id FROM Module;");

                        isExistente = dbCtx.SaveChanges() > 0;
                    }
                }
            }

            return isExistente;
        }

        /// <summary>
        /// Metodo para cargar las opciones del menu por medio del rol que tenga el usuario logueado
        /// </summary>
        /// <param name="RolName">Nombre del Rol</param>
        /// <returns>DataTable</returns>
        public static DataTable CargarMenuPorRol(string RolName)
        {
            DataTable dt = new DataTable();
            bool isExistente = false;

            using (ViperDbContext ctx = new ViperDbContext())
            {
                //Validar si la base de datos existe
                isExistente = Database.Exists(ctx.Database.Connection);

                if (isExistente)
                {
                    //Validar si la tabla utilizada existe
                    isExistente = ctx.Database
                 .SqlQuery<int?>(@"
                         SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'Permission' 
                            OR table_name = 'Role' OR table_name = 'Module'")
                 .SingleOrDefault() != null;

                    if (isExistente)
                    {
                        //Recuperar el menu de opciones
                        var result = (from p in ctx.Permissions
                                      join r in ctx.Roles on p.RoleId equals r.Id
                                      join m in ctx.Modules on p.ModuleId equals m.Id
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
                }
            }

            return dt;
        }

        /// <summary>
        /// Metodo para cargar las opciones del menu por medio del rol que tenga el usuario logueado
        /// </summary>
        /// <param name="RolName">Nombre del Rol</param>
        /// <param name="Menu">Nombre del Menu</param>
        /// <returns>DataTable</returns>
        public static DataTable CargarSubmenuPorRol(string RolName, string Menu)
        {
            DataTable dt = new DataTable();
            bool isExistente = false;

            using (ViperDbContext ctx = new ViperDbContext())
            {
                //Validar si la base de datos existe
                isExistente = Database.Exists(ctx.Database.Connection);

                if (isExistente)
                {
                    //Validar si la tabla utilizada existe
                    isExistente = ctx.Database
                 .SqlQuery<int?>(@"
                         SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'Permission' 
                            OR table_name = 'Role' OR table_name = 'Module'")
                 .SingleOrDefault() != null;

                    if (isExistente)
                    {
                        //Recuperar el menu de opciones
                        var result = (from p in ctx.Permissions
                                      join r in ctx.Roles on p.RoleId equals r.Id
                                      join m in ctx.Modules on p.ModuleId equals m.Id
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
                }
            }

            return dt;
        }
    }
}
