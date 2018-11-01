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
                                new DataColumn("CompanyKey",typeof(string)),
                                new DataColumn("Role",typeof(string)),
                                new DataColumn("IsWelcome",typeof(bool)),
                                new DataColumn("AccessFailed",typeof(int))
                            });

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
                                   c.CompanyKey,
                                   Role = r.Name,
                                   u.IsWelcome,
                                   u.AccessFailedCount
                               }).ToList();

                if (result1.Count > 0)
                {
                    var Role = result1.FirstOrDefault().Name;

                    switch (Role)
                    {
                        //DUEÑO DE NEGOCIO CON PRIVILEGIOS DE ADMINISTRADOR DEL SISTEMA
                        case "ADMINISTRADOR":

                            //Recuperar el nombre de la compañia donde se registro el negocio
                            var CompanyData = dbCtx.Companies    // your starting point - table in the "from" statement
                                   .Join(dbCtx.Users, // the source table of the inner join
                                      c => c.UserId,        // Select the primary key (the first part of the "on" clause in an sql "join" statement)
                                      u => u.Id,   // Select the foreign key (the second part of the "on" clause)
                                      (c, u) => new { c.CompanyName, c.CompanyKey, u.LoginID, u.PasswordEncrypted }) // selection
                                   .Where(a => a.LoginID == usr && a.PasswordEncrypted == pwd)
                                   .ToList();

                            //Guardar los datos recuperados en una fila del DataTable
                            //Crear una fila nueva
                            var rowAdmin = dt.NewRow();

                            //Cargar los datos de la fila
                            rowAdmin["EmployeeIDNumber"] = "XXXXXXXXXXXXX";
                            rowAdmin["FullName"] = "N/A";
                            rowAdmin["Department"] = "EJECUTIVO";
                            rowAdmin["JobTitle"] = "DUEÑO DE NEGOCIO";
                            rowAdmin["StartTime"] = Convert.ToDateTime("07:00:00");
                            rowAdmin["EndTime"] = Convert.ToDateTime("23:00:00");
                            rowAdmin["Subsidiary"] = "N/A";
                            rowAdmin["CompanyName"] = CompanyData.FirstOrDefault().CompanyName;
                            rowAdmin["CompanyKey"] = CompanyData.FirstOrDefault().CompanyKey;
                            rowAdmin["Role"] = "ADMINISTRADOR";
                            rowAdmin["IsWelcome"] = true;
                            rowAdmin["AccessFailed"] = 0;

                            //Añadir fila al DataTable
                            dt.Rows.Add(rowAdmin);

                            break;

                        //EMPLEADO CON PRIVILEGIOS BASICOS PARA ATENDER LA FARMACIA
                        case "BASICO":

                            if (result2.Count > 0)
                            {
                                result2.ToList().ForEach(x =>
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

                                    //Añadir fila al DataTable
                                    dt.Rows.Add(rowBasic);
                                });
                            }

                            break;
                    }
                }
            }

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
                        var entity = new User
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

                        dbCtx.Users.Add(entity);

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

        #region procGetLastIDToUserRegistered

        /// <summary>
        /// Metodo para obtener el ultimo ID de los usuarios registrados
        /// </summary>
        /// <param name="RFC">RFC Registrado</param>
        /// <returns>Id</returns>
        public static int procGetLastIDToUserRegistered(string RFC)
        {
            bool isExistente = false;

            int UserID = 0;

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                UserID = dbCtx.Users
                    .Where(x=>x.LoginID == RFC)
                    .OrderByDescending(x => x.Id)
                    .FirstOrDefault()
                    .Id;
            }

            return UserID;
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
