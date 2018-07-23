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
        /// Metodo para cargar las opciones del menu por medio del rol que tenga el usuario logueado
        /// </summary>
        /// <param name="RolName">Nombre del Rol</param>
        /// <returns>DataTable</returns>
        public static DataTable CargarMenuPorRol(string RolName)
        {
            DataTable dt = new DataTable();
            bool isExistente = false;

            using (ViperContext ctx = new ViperContext())
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
                                      where r.Name == "ADMINISTRADOR" && m.SubMenu == "NULL"
                                      select new
                                      {
                                          m.Name,
                                          m.Menu,
                                          m.ControlName,
                                          m.ControlImage
                                      }).ToList();

                        //Crear las columnas del DataTable
                        dt.Columns.AddRange(new DataColumn[]{
                                new DataColumn("Name", typeof(string)),
                                new DataColumn("Menu", typeof(string)),
                                new DataColumn("ControlName", typeof(string)),
                                new DataColumn("ControlImage", typeof(string))
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
