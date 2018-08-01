using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viper.BusinessEntities;

namespace Viper.DataAccessLayer
{
    public class EmployeeDAL
    {
        /// <summary>
        /// DbContext is an important class in Entity Framework API. It is a bridge between your domain or entity classes and the database.
        /// </summary>
        public static ViperContext dbCtx = new ViperContext();

        #region updatePassword
        /// <summary>
        /// Update password form oompany administrator
        /// </summary>
        /// <param name="pwd">Password</param>
        /// <param name="entityID">Entity ID</param>
        /// <returns>Message</returns>
        public static string updatePassword(string pwd, int entityID)
        {
            string message = string.Empty;
            bool isUpdate = false;

            using (var dbCtxTran = dbCtx.Database.BeginTransaction())
            {
                try
                {
                    //Validar si la base de datos existe
                    bool isDataBaseExist = Database.Exists(dbCtx.Database.Connection);

                    if (isDataBaseExist)
                    {
                        //Validar si la tabla utilizada existe
                        bool isTableExist = dbCtx.Database
                     .SqlQuery<int?>(@"
                               SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'User'")
                     .SingleOrDefault() != null;

                        if (isTableExist)
                        {
                            var entity = dbCtx.Users.Where(x => x.Id == entityID).FirstOrDefault();

                            entity.PasswordEncrypted = pwd;
                            entity.IsWelcome = false;

                            dbCtx.Users.Attach(entity);
                            dbCtx.Entry(entity).State = EntityState.Modified;

                            isUpdate = dbCtx.SaveChanges() > 0;

                            if (isUpdate == true && string.IsNullOrEmpty(message))
                            {
                                dbCtxTran.Commit();
                            }
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
                    var entity = ex.Entries.Single().GetDatabaseValues();

                    if (entity == null)
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

        #region obtainLoginIDGeneratedAutomatic

        /// <summary>
        /// Method to obtain LoginID generated automatic
        /// </summary>
        /// <returns></returns>
        public static string obtainLoginIDGeneratedAutomatic()
        {
            int inc = 0;

            bool isEN = dbCtx.Employees.ToList().Count() > 0;//verificar si hay empleados

            if (isEN)
            {
                //traer ultimo codigo de empleado registrado
                string clave = dbCtx.Employees.ToList().Last().EmployeeIDNumber;

                //usar metodo substring para sacar numeros del codigo para incrementar
                string numero = clave.Substring(clave.Length - 4, 4);
                int numcl = Convert.ToInt32(numero);

                //incrementar
                inc = numcl + 1;
            }
            else
            {
                //igualar a uno en caso de que sea el primero
                inc = 1;
            }

            return string.Format("VIPER-EMP-{0:0000}", inc);
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
