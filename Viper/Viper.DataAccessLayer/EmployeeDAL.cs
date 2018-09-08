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
    public class EmployeeDAL
    {
        /// <summary>
        /// A DbContext instance represents a combination of the Unit Of Work and Repository patterns 
        /// such that it can be used to query from a database and group together changes that will 
        /// then be written back to the store as a unit. 
        /// DbContext is conceptually similar to ObjectContext. 
        /// DbContext is the primary class that is responsible for interacting with the database.
        /// </summary>
        private static ViperDbContext dbCtx = new ViperDbContext();

        #region procInsertEmployeeToSystem

        /// <summary>
        /// Metodo para registrar los empleados para trabajar con el 
        /// Viper Sistema de Punto de Venta para Farmacias
        /// </summary>
        /// <param name="entityAddress">Entidad Direccion</param>
        /// <param name="entityEmployee">Entidad Empleado</param>
        /// <returns>Message</returns>
        public static string procInsertEmployeeToSystem(Address entityAddress, Employee entityEmployee)
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
                        dbCtx.Addresses.Add(entityAddress);

                        isInserted = dbCtx.SaveChanges() > 0;

                        if (isInserted)
                        {
                            isInserted = false;

                            var AddressID = dbCtx.Addresses.OrderByDescending(x => x.Id).FirstOrDefault().Id;

                            if (AddressID > 0)
                            {
                                entityEmployee.AddressId = AddressID;

                                dbCtx.Employees.Add(entityEmployee);

                                isInserted = dbCtx.SaveChanges() > 0;

                                if (isInserted == true)
                                {
                                    dbCtxTran.Commit();
                                }
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

        #region procGetEmployeesToDataTable

        /// <summary>
        /// Metodo para obtener todos los empleados registrados en el Sistema de Punto de Venta para Farmacias
        /// con Venta de Genericos
        /// </summary>
        /// <param name="CompanyID">Clave Empresa</param>
        /// <returns>DataTable</returns>
        public static DataTable procGetEmployeesToDataTable(int CompanyID)
        {
            bool isExistente = false;

            DataTable dataTable = new DataTable();

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                var result = (from e in dbCtx.Employees
                              join edh in dbCtx.EmployeesDepartmentHistory on e.Id equals edh.EmployeeId
                              join u in dbCtx.Users on e.UserId equals u.Id
                              join s in dbCtx.Sites on edh.SiteId equals s.Id
                              join c in dbCtx.Companies on s.CompanyId equals c.Id
                              join j in dbCtx.JobsTitle on edh.JobTitleId equals j.Id
                              join d in dbCtx.Departments on j.DepartmentId equals d.Id
                              where c.Id == CompanyID
                              select new
                              {
                                  EmployeeNumber = e.EmployeeNumber,
                                  Fullname = e.FullName,
                                  PhoneNumber = e.PhoneNumber,
                                  CellPhone = e.CellphoneNumber,
                                  IS = e.IS,
                                  LoginID = u.LoginID,
                                  Password = u.PasswordEncrypted,
                                  UniquePhysicalID = s.UniquePhysicalID,
                                  CompanyKey = c.CompanyKey,
                                  JobTitle = j.Name,
                                  Department = d.Name
                              })
                              .OrderBy(x => x.Fullname)
                              .ToList();

                dataTable.Columns.AddRange(new DataColumn[]{
                new DataColumn("NUMERO_EMPLEADO", typeof(string)),
                new DataColumn("NOMBRE_EMPLEADO", typeof(string)),
                new DataColumn("TELEFONO", typeof(string)),
                new DataColumn("CELULAR", typeof(string)),
                new DataColumn("IS", typeof(string)),
                new DataColumn("PUESTO_TRABAJO", typeof(string)),
                new DataColumn("DEPARTAMENTO", typeof(string)),
                new DataColumn("NOMBRE_USUARIO", typeof(string)),
                new DataColumn("CONTRASEÑA", typeof(string)),
                new DataColumn("CLAVE_SUCURSAL", typeof(string)),
                new DataColumn("CLAVE_EMPRESA", typeof(string))
            });

                result.ToList().ForEach(x =>
                {
                    var row = dataTable.NewRow();

                    row["NUMERO_EMPLEADO"] = x.EmployeeNumber;
                    row["NOMBRE_EMPLEADO"] = x.Fullname;
                    row["TELEFONO"] = x.PhoneNumber;
                    row["CELULAR"] = x.CellPhone;
                    row["IS"] = x.IS;
                    row["PUESTO_TRABAJO"] = x.JobTitle;
                    row["DEPARTAMENTO"] = x.Department;
                    row["NOMBRE_USUARIO"] = x.LoginID;
                    row["CONTRASEÑA"] = "****************";
                    row["CLAVE_SUCURSAL"] = x.UniquePhysicalID;
                    row["CLAVE_EMPRESA"] = x.CompanyKey;

                    dataTable.Rows.Add(row);
                });
            }

            return dataTable;
        }

        #endregion

        #region procIsRFCExists

        /// <summary>
        /// Metodo para validar si un RFC ya ha sido registrado anteriormente
        /// </summary>
        /// <param name="RFC">RFC registrado ante el SAT</param>
        /// <returns>Boolean</returns>
        public static bool procIsRFCExists(string RFC)
        {
            bool isExistente = false;
            bool isRFCExistente = false;

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                isRFCExistente = dbCtx.Employees.Where(x => x.RFC == RFC).ToList().Count > 0;
            }

            return isRFCExistente;
        }

        #endregion

        #region procIsCURPExists

        /// <summary>
        /// Metodo para validar si un CURP ya ha sido registrado anteriormente
        /// </summary>
        /// <param name="CURP">CURP del empleado registrado</param>
        /// <returns>Boolean</returns>
        public static bool procIsCURPExists(string CURP)
        {
            bool isExistente = false;
            bool isCURPExistente = false;

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                isCURPExistente = dbCtx.Employees.Where(x => x.CURP == CURP).ToList().Count > 0;
            }

            return isCURPExistente;
        }

        #endregion

        #region procInsertEmployeeHistoryToSystem

        /// <summary>
        /// Metodo para registrar el historial de un empleado registrado en el sistema
        /// viper, guardando el puesto, departamento, sucursal, horario, etc.
        /// </summary>
        /// <param name="entity">Entidad Historial del Empleado</param>
        /// <returns>Message</returns>
        public static string procInsertEmployeeHistoryToSystem(EmployeeDepartmentHistory entity)
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
                        dbCtx.EmployeesDepartmentHistory.Add(entity);

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

        #region procObtainEmployeeNumberGeneratedAutomatic

        /// <summary>
        /// Metodo para obtener el numero de empleado generado automaticamente,
        /// para cada empleado que se vaya a registrar en el sistema viper
        /// </summary>
        /// <returns>Numero de Empleado</returns>
        public static string procObtainEmployeeNumberGeneratedAutomatic()
        {
            int inc = 0;
            String numero = String.Empty;
            String EmployeeNumber = String.Empty;

            bool isEN = dbCtx.Employees.ToList().Count() > 0;//verificar si hay empleados

            if (isEN)
            {
                //traer ultimo codigo de empleado registrado
                string clave = dbCtx.Employees.ToList().Last().EmployeeNumber;

                //usar metodo substring para sacar numeros del codigo para incrementar
                numero = clave.Substring(clave.Length - 4, 4);

                int numcl = Convert.ToInt32(numero);

                //incrementar
                inc = numcl + 1;
            }
            else
            {
                //igualar a uno en caso de que sea el primero
                inc = 1;
            }

            EmployeeNumber = string.Format("VIPER-EMP-{0:0000}", inc);

            return EmployeeNumber;
        }

        #endregion

        #region procGetLastIDToEmployeeRegistered

        /// <summary>
        /// Metodo para obtener el ultimo ID de los empleados registrados
        /// </summary>
        /// <returns>Id</returns>
        public static int procGetLastIDToEmployeeRegistered()
        {
            bool isExistente = false;

            int EmployeeID = 0;

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                EmployeeID = dbCtx.Employees.OrderByDescending(x => x.Id).FirstOrDefault().Id;
            }

            return EmployeeID;
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
