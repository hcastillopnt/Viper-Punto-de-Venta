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
        /// Metodo para iniciar sesion
        /// </summary>
        /// <param name="us">parametro para el nombre de usuario</param>
        /// <param name="pwd">parametro para la contraseña</param>
        /// <returns>DataTable</returns>
        public static DataTable authorize_by_credentials(string usr, string pwd)
        {
            bool isExistente = false;
            int RoleID = 0;
            int EntityID = 0;

            //Se crea el DataTable
            DataTable dt = new DataTable();

            //Crear las columnas del DataTable
            dt.Columns.AddRange(new DataColumn[]{
                                new DataColumn("EntityID", typeof(int)),
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
                                new DataColumn("AccessFailed",typeof(int)),
                            });

            using (ViperDbContext dbCtx = new ViperDbContext())
            {
                isExistente = Database.Exists(dbCtx.Database.Connection);

                if (isExistente)
                {
                    var result1 = (from u in dbCtx.Users
                                   where u.LoginID == usr && u.PasswordEncrypted == pwd
                                   select new
                                   {
                                       u.Id,
                                       u.LoginID,
                                       u.PasswordEncrypted,
                                       u.RoleId
                                   })
                                 .Union(from c in dbCtx.Companies
                                        where c.LoginID == usr && c.PasswordEncrypted == pwd
                                        select new
                                        {
                                            c.Id,
                                            c.LoginID,
                                            c.PasswordEncrypted,
                                            c.RoleId
                                        }).ToList();

                    if (result1.Count() > 0)
                    {
                        //Get RoleID
                        RoleID = result1.FirstOrDefault().RoleId;

                        //Get EntityID
                        EntityID = result1.FirstOrDefault().Id;

                        switch (RoleID)
                        {
                            //Administrator
                            case 1:

                                //Guardar los datos recuperados en una fila del DataTable
                                //Crear una fila nueva
                                var rowAdmin = dt.NewRow();

                                //Cargar los datos de la fila
                                rowAdmin["EntityID"] = EntityID;
                                rowAdmin["EmployeeIDNumber"] = "XXXXXXXXXXXXX";
                                rowAdmin["FullName"] = "N/A";
                                rowAdmin["Department"] = "EXECUTIVE";
                                rowAdmin["JobTitle"] = "DUEÑO DE NEGOCIO";
                                rowAdmin["StartTime"] = Convert.ToDateTime("07:00:00");
                                rowAdmin["EndTime"] = Convert.ToDateTime("23:00:00");
                                rowAdmin["Subsidiary"] = "N/A";
                                rowAdmin["CompanyName"] = CompanyDAL.obtainCompanyName(usr, pwd);
                                rowAdmin["Role"] = dbCtx.Roles.Where(r => r.Id == RoleID).FirstOrDefault().Name;
                                rowAdmin["IsWelcome"] = true;
                                rowAdmin["AccessFailed"] = 0;

                                //Añadir fila al DataTable
                                dt.Rows.Add(rowAdmin);

                                break;

                            //Basic
                            case 2:

                                var result2 = (from edh in dbCtx.EmployeesDepartmentHistory
                                               join d in dbCtx.Departments on edh.DepartmentId equals d.Id
                                               join e in dbCtx.Employees on edh.EmployeeId equals e.Id
                                               join jt in dbCtx.JobTitles on edh.JobTitleId equals jt.Id
                                               join s in dbCtx.Shifts on edh.ShiftId equals s.Id
                                               join st in dbCtx.Sites on edh.SiteId equals st.Id
                                               join c in dbCtx.Companies on st.CompanyId equals c.Id
                                               join u in dbCtx.Users on edh.EmployeeId equals u.EmployeeId
                                               join r in dbCtx.Roles on u.RoleId equals r.Id
                                               where 
                                                u.LoginID == usr 
                                                && u.PasswordEncrypted == pwd
                                                && u.IsEnabled == true
                                                && u.IsApproved == true
                                               select new
                                               {
                                                   u.Id,
                                                   e.EmployeeIDNumber,
                                                   e.FullName,
                                                   Department = d.Name,
                                                   JobTitle = jt.Name,
                                                   s.StartTime,
                                                   s.EndTime,
                                                   Subsidiary = st.CompanyName,
                                                   c.CompanyName,
                                                   Role = r.Name,
                                                   u.IsWelcome,
                                                   u.AccessFailed
                                               }).ToList();

                                //Guardar los datos recuperados en una fila del DataTable
                                result2.ToList().ForEach(x =>
                                {
                                    //Crear una fila nueva
                                    var row = dt.NewRow();

                                    //Cargar los datos de la fila
                                    row["EntityID"] = x.Id;
                                    row["EmployeeIDNumber"] = x.EmployeeIDNumber;
                                    row["FullName"] = x.FullName;
                                    row["Department"] = x.Department;
                                    row["JobTitle"] = x.JobTitle;
                                    row["StartTime"] = x.StartTime;
                                    row["EndTime"] = x.EndTime;
                                    row["Subsidiary"] = x.Subsidiary;
                                    row["CompanyName"] = x.CompanyName;
                                    row["Role"] = x.Role;
                                    row["IsWelcome"] = x.IsWelcome;
                                    row["AccessFailed"] = x.AccessFailed;

                                    //Añadir fila al DataTable
                                    dt.Rows.Add(row);
                                });

                                break;

                            //Doctor
                            case 3:
                                break;
                        }
                    }
                }

                return dt;
            }
        }
        #endregion
    }
}
