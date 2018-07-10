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
    public class LoginDAL
    {
        /// <summary>
		/// Metodo para iniciar sesion
		/// </summary>
		/// <param name="us">parametro para el nombre de usuario</param>
		/// <param name="pwd">parametro para la contraseña</param>
		/// <returns>true o false</returns>
		public static DataTable iniciarSesion(string us, string pwd)
        {
            DataTable dt = new DataTable();
            //asignar valor nulo a variable de cadena contraseña
            bool isExistente = false;
            using (ViperContext db = new ViperContext())
            {
                isExistente = Database.Exists(db.Database.Connection);
                if (isExistente)
                {
                    //Validar si la tabla utilizada existe
                    isExistente = db.Database
                 .SqlQuery<int?>(@"
                         SELECT COUNT(*) FROM information_schema.tables WHERE 
                            table_name = 'Role' OR table_name = 'Employee' OR table_name = 'User'")
                 .SingleOrDefault() != null;

                    if (isExistente)
                    {
                        var result = (from e in db.Employees
                                      join m in db.Memberships on e.Id equals m.EmployeeId
                                      join r in db.Roles on m.RoleId equals r.Id
                                      join jt in db.jobtitles on e.JobTitleId equals jt.Id
                                      where m.LoginID == us && m.PasswordEncrypted == pwd
                                      select new
                                      {
                                          m.LoginID,
                                          r.Name,
                                          //jt.Name,
                                          e.FullName

                                      }).ToList();
                        //Crear las columnas del DataTable
                        dt.Columns.AddRange(new DataColumn[]{
                                new DataColumn("Usuario", typeof(string)),
                                new DataColumn("Rol", typeof(string)),
                                new DataColumn("Puesto", typeof(string)),
                                new DataColumn("NombreCompleto",typeof(string))

                            });

                        //Guardar los datos recuperados en una fila del DataTable
                        result.ToList().ForEach(x =>
                        {
                            //Crear una fila nueva
                            var row = dt.NewRow();

                            //Cargar los datos de la fila
                            row["Usuario"] = x.LoginID;
                            row["Rol"] = x.Name;
                            row["Puesto"] = x.Name;
                            row["NombreCompleto"] = x.FullName;

                            //Añadir fila al DataTable
                            dt.Rows.Add(row);
                        });
                    }


                }
                return dt;
            }
        }

    }
}
