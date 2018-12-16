using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viper.BusinessEntities;

namespace Viper.DataAccessLayer
{
    public class UserDAL
    {
        /// <summary>
        /// A DbContext instance represents a combination of the Unit Of Work and Repository patterns 
        /// such that it can be used to query from a database and group together changes that will 
        /// then be written back to the store as a unit. 
        /// DbContext is conceptually similar to ObjectContext. 
        /// DbContext is the primary class that is responsible for interacting with the database.
        /// </summary>
        private static ViperDbContext dbCtx = new ViperDbContext();

        #region procAuthorizeByLogin

        /// <summary>
        /// Metodo para iniciar sesion en la aplicacion, por medio del usuario y la contraseña encriptada
        /// con el metodo SHA1 
        /// </summary>
        /// <param name="us">Nombre de usuario</param>
        /// <param name="pwd">Contraseña encriptada</param>
        /// <returns>DataTable</returns>
        public static DataTable procAuthorizeByLogin(string usr, string pwd)
        {
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
                                new DataColumn("CompanyKey",typeof(string)),
                                new DataColumn("Role",typeof(string)),
                                new DataColumn("IsWelcome",typeof(bool)),
                                new DataColumn("AccessFailed",typeof(int))
                            });

            //Variable para almacenar la validacion de la base de datos existente
            bool isDatabaseExists = Database.Exists(dbCtx.Database.Connection);

            //Si la base de datos existe se procedera a crear la sentencia sql/linq para obtener la informacion solicitada
            if (isDatabaseExists)
            {
                //Se crea una sentencia sql/linq para recuperar el perfil del usuario el cual contiene (nombre de usuario, contraseña encriptada 
                //y tipo de perfil) relacionado al usuario logueado
                var userProfile = dbCtx.Users    // your starting point - table in the "from" statement
                       .Join(dbCtx.Roles, // the source table of the inner join
                          u => u.RoleId,        // Select the primary key (the first part of the "on" clause in an sql "join" statement)
                          r => r.Id,   // Select the foreign key (the second part of the "on" clause)
                          (u, r) => new {
                              u.LoginID,
                              u.PasswordEncrypted,
                              r.Name,
                              u.IsWelcome,
                              u.AccessFailedCount,
                              u.IsActive
                          }) // selection
                       .Where(u => u.LoginID == usr && u.PasswordEncrypted == pwd && u.IsActive == true)
                       .ToList();

                //Si la consulta a la base de datos, donde se recupera el perfil del usuario existe, se procedera a obtenerla informacion de este mismo
                if (userProfile.Count > 0)
                {
                    //Se recupera el tipo de perfil al que pertenece el usuario logueado
                    var userRole = userProfile.FirstOrDefault().Name;

                    switch (userRole)
                    {
                        //DUEÑO DE NEGOCIO CON PRIVILEGIOS DE ADMINISTRADOR DEL SISTEMA
                        case "ADMINISTRADOR":

                            //Se recupera informacion importante para loguearse como administrador del sistema, al que pertenece el usuario logueado
                            var adminLogin = dbCtx.Companies
                                .Join(dbCtx.Users,
                                      c => c.UserId,
                                      u => u.Id,
                                      (c, u) => new { c, u })
                                .Join(dbCtx.Roles,
                                      ur => ur.u.RoleId,
                                      rl => rl.Id,
                                      (ur, rl) => new { ur, rl })
                                .Select(x => new
                                {
                                    x.ur.c.CompanyName,
                                    x.ur.c.CompanyKey,
                                    x.ur.u.LoginID,
                                    x.ur.u.PasswordEncrypted,
                                    x.ur.u.IsWelcome,
                                    x.ur.u.AccessFailedCount,
                                    x.rl.Name
                                    // other assignments
                                }) // selection
                                .Where(x => x.LoginID == usr && x.PasswordEncrypted == pwd)
                                .ToList();

                            //Crear una fila nueva en el DataTable
                            var rowAdmin = dt.NewRow();

                            //Cargar los datos de la fila
                            rowAdmin["EmployeeIDNumber"] = "N/A";
                            rowAdmin["FullName"] = adminLogin.FirstOrDefault().CompanyName;
                            rowAdmin["Department"] = "EJECUTIVO";
                            rowAdmin["JobTitle"] = "DUEÑO DE NEGOCIO";
                            rowAdmin["StartTime"] = Convert.ToDateTime("08:00:00");
                            rowAdmin["EndTime"] = Convert.ToDateTime("22:00:00");
                            rowAdmin["Subsidiary"] = "N/A";
                            rowAdmin["CompanyName"] = adminLogin.FirstOrDefault().CompanyName;
                            rowAdmin["CompanyKey"] = adminLogin.FirstOrDefault().CompanyKey;
                            rowAdmin["Role"] = adminLogin.FirstOrDefault().Name;
                            rowAdmin["IsWelcome"] = adminLogin.FirstOrDefault().IsWelcome;
                            rowAdmin["AccessFailed"] = adminLogin.FirstOrDefault().AccessFailedCount;

                            //Añadir la fila precargada al DataTable
                            dt.Rows.Add(rowAdmin);

                            break;

                        //EMPLEADO CON PRIVILEGIOS BASICOS PARA ATENDER LA FARMACIA
                        case "BASICO":

                            //Se crea una sentencia sql/linq para recuperar la informacion relacionada al usuario logueado
                            var userData = (from edh in dbCtx.EmployeesDepartmentHistory
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
                                                c.CompanyKey,
                                                Role = r.Name,
                                                u.IsWelcome,
                                                u.AccessFailedCount
                                            }).ToList();

                            //Si la consulta a la base de datos, donde se recupera la informacion del usuario existe, se procedera a cargar 
                            //la informacion en la estructura DataTable
                            if (userData.Count > 0)
                            {
                                userData.ToList().ForEach(x =>
                                {

                                    //Guardar los datos recuperados en una fila del DataTable
                                    //Crear una fila nueva
                                    var rowBasic = dt.NewRow();

                                    //Cargar los datos de la fila
                                    rowBasic["EmployeeIDNumber"] = x.EmployeeNumber;
                                    rowBasic["FullName"] = x.FullName;
                                    rowBasic["Department"] = x.Department;
                                    rowBasic["JobTitle"] = x.JobTitle;
                                    rowBasic["StartTime"] = x.StartTime;
                                    rowBasic["EndTime"] = x.EndTime;
                                    rowBasic["Subsidiary"] = x.Subsidiary;
                                    rowBasic["CompanyName"] = x.CompanyName;
                                    rowBasic["CompanyKey"] = x.CompanyKey;
                                    rowBasic["Role"] = x.Role;
                                    rowBasic["IsWelcome"] = x.IsWelcome;
                                    rowBasic["AccessFailed"] = x.AccessFailedCount;

                                    //Añadir la fila precargada al DataTable
                                    dt.Rows.Add(rowBasic);
                                });
                            }

                            break;
                    }
                }
            }

            //Regresa la estructura DataTable, precargada con la informacion solicitada segun el perfil de usuario con el que se logueo en el sistema
            return dt;
        }

        #endregion

        #region procInsertUserToSystem

        /// <summary>
        /// Metodo para registrar un usuario con valores default, dentro del sistema viper
        /// </summary>
        /// <param name="loginID">Nombre de usuario</param>
        /// <param name="passwordEncrypted">Contraseña encriptada</param>
        /// <param name="RoleID">ID identificador del rol para asignar</param>
        /// <returns>Message</returns>
        public static string procInsertUserToSystem(string loginID, string passwordEncrypted, int RoleID)
        {
            String message = String.Empty;

            bool isInserted = false;

            using (var dbCtxTran = dbCtx.Database.BeginTransaction())
            {
                try
                {
                    bool isDataBaseExist = Database.Exists(dbCtx.Database.Connection);

                    if (isDataBaseExist)
                    {
                        User user = new User()
                        {
                            LoginID = loginID,
                            PasswordEncrypted = passwordEncrypted,
                            RoleId = RoleID,
                            AccessFailedCount = 0,
                            IsWelcome = true,
                            IsActive = true,
                            CreatedBy = "HECP",
                            CreatedDate = DateTime.Now,
                            LastUpdatedBy = "HECP",
                            LastUpdatedDate = DateTime.Now
                        };

                        dbCtx.Users.Add(user);

                        isInserted = dbCtx.SaveChanges() > 0;

                        if (isInserted)
                        {
                            dbCtxTran.Commit();
                        }
                    }
                }
                catch (DbEntityValidationException ex)
                {
                    var errorMessages = ex.EntityValidationErrors
                            .SelectMany(x => x.ValidationErrors)
                            .Select(x => x.ErrorMessage);
                    var fullErrorMessage = string.Join("; ", errorMessages);
                    var exceptionMessage = string.Concat(ex.Message, " The validation errors are: ", fullErrorMessage);
                    message = exceptionMessage + "\n" + ex.EntityValidationErrors;

                    dbCtxTran.Rollback();
                }
                catch (DbUpdateConcurrencyException ex)
                {
                    var entityObj = ex.Entries.Single().GetDatabaseValues();

                    if (entityObj == null)
                        message = "The entity being updated is already deleted by another user";
                    else
                        message = "The entity being updated has already been updated by another user";

                    dbCtxTran.Rollback();
                }
                catch (DbUpdateException ex)
                {
                    var exception = HandleDbUpdateException(ex);
                    message = exception.Message;

                    dbCtxTran.Rollback();
                }
            }

            return message;
        }

        #endregion

        #region HandleDbUpdateException
        private static Exception HandleDbUpdateException(DbUpdateException dbu)
        {
            var builder = new StringBuilder("A DbUpdateException was caught while saving changes. ");

            try
            {
                foreach (var result in dbu.Entries)
                {
                    builder.AppendFormat("Type: {0} was part of the problem. ", result.Entity.GetType().Name);
                }
            }
            catch (Exception e)
            {
                builder.Append("Error parsing DbUpdateException: " + e.ToString());
            }

            string message = builder.ToString();
            return new Exception(message, dbu);
        }
        #endregion
    }
}
