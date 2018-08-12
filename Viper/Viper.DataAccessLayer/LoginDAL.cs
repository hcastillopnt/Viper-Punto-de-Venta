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
        #region authorize_by_credentials

        /// <summary>
        /// Metodo para iniciar sesion en la aplicacion
        /// </summary>
        /// <param name="us">parametro para el nombre de usuario</param>
        /// <param name="pwd">parametro para la contraseña</param>
        /// <returns>DataTable</returns>
        public static DataTable authorize_by_credentials(string usr, string pwd)
        {
            bool isExistente = false;

            //Se crea el DataTable
            DataTable dt = new DataTable();

            //Crear las columnas del DataTable
            dt.Columns.AddRange(new DataColumn[]{
                                new DataColumn("EmployeeIDNumber", typeof(string)),
                                new DataColumn("FullName", typeof(string)),
                                new DataColumn("Department", typeof(string)),
                                new DataColumn("JobTitle",typeof(string)),
                                new DataColumn("StartTime",typeof(DateTime)),
                                new DataColumn("EndTime",typeof(DateTime)),
                                new DataColumn("Subsidiary",typeof(string)),
                                new DataColumn("CompanyName",typeof(string)),
                                new DataColumn("Role",typeof(string)),
                                new DataColumn("IsWelcome",typeof(bool)),
                                new DataColumn("AccessFailed",typeof(int))
                            });

            using (ViperDbContext dbCtx = new ViperDbContext())
            {
                isExistente = Database.Exists(dbCtx.Database.Connection);

                if (isExistente)
                {
                    var result1 = (from u in dbCtx.Users
                                   join rl in dbCtx.Roles on u.RoleId equals rl.Id
                                   where
                                    u.LoginID == usr && u.PasswordEncrypted == pwd
                                   select new
                                   {
                                       u.LoginID,
                                       u.PasswordEncrypted,
                                       rl.Name
                                   }).ToList();

                    var result2 = (from edh in dbCtx.EmployeesDepartmentHistory
                                   join d in dbCtx.Departments on edh.DepartmentId equals d.Id
                                   join e in dbCtx.Employees on edh.EmployeeId equals e.Id
                                   join u in dbCtx.Users on e.UserId equals u.Id
                                   join jt in dbCtx.JobsTitle on edh.JobTitleId equals jt.Id
                                   join s in dbCtx.Shifts on edh.ShiftId equals s.Id
                                   join st in dbCtx.Sites on edh.SiteId equals st.Id
                                   join c in dbCtx.Companies on st.CompanyId equals c.Id
                                   join r in dbCtx.Roles on u.RoleId equals r.Id
                                   where
                                    u.LoginID == usr && u.PasswordEncrypted == pwd
                                   select new
                                   {
                                       e.EmployeeNumber,
                                       e.FullName,
                                       Department = d.Name,
                                       JobTitle = jt.Name,
                                       s.StartTime,
                                       s.EndTime,
                                       Subsidiary = st.SiteName,
                                       c.CompanyName,
                                       Role = r.Name,
                                       u.IsWelcome,
                                       u.AccessFailedCount
                                   }).ToList();

                    //Get RoleID
                    var Role = result1.FirstOrDefault().Name;

                    switch (Role)
                    {
                        //ADMINISTRADOR COMPANY
                        case "ADMINISTRADOR COMPANY":

                            //Guardar los datos recuperados en una fila del DataTable
                            //Crear una fila nueva
                            var rowAdmin = dt.NewRow();

                            //Cargar los datos de la fila
                            rowAdmin["EmployeeIDNumber"] = "XXXXXXXXXXXXX";
                            rowAdmin["FullName"] = "N/A";
                            rowAdmin["Department"] = "EXECUTIVE";
                            rowAdmin["JobTitle"] = "DUEÑO DE NEGOCIO";
                            rowAdmin["StartTime"] = Convert.ToDateTime("07:00:00");
                            rowAdmin["EndTime"] = Convert.ToDateTime("23:00:00");
                            rowAdmin["Subsidiary"] = "N/A";
                            rowAdmin["CompanyName"] = "";
                            rowAdmin["Role"] = "ADMINISTRADOR COMPANY";
                            rowAdmin["IsWelcome"] = true;
                            rowAdmin["AccessFailed"] = 0;

                            //Añadir fila al DataTable
                            dt.Rows.Add(rowAdmin);

                            break;
                    }
                }
            }

            return dt;
        }

        #endregion
    }
}
