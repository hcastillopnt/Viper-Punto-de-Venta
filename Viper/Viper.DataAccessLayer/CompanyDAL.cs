using Viper.BusinessEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data.MySqlClient;
using System.Data.Entity;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Data;

namespace Viper.DataAccessLayer
{
    public class CompanyDAL
    {
        #region sp_insert_company

        /// <summary>
        /// Metodo para registrar los datos generales y fiscales, de los clientes que adquieran Viper Sistema de Punto de Venta para Farmacias
        /// </summary>
        /// <param name="company">Objeto Compañia</param>
        /// <param name="address">Objeto Direccion</param>
        /// <param name="addressSAT">Objeto Direccion Fiscal</param>
        /// <param name="user">Objeto Usuario</param>
        /// <returns>Mensaje (String)</returns>
        public static string sp_insert_company(Company company, Address address, AddressSAT addressSAT, User user)
        {
            string message = string.Empty;
            bool isInserted = false;

            using (ViperDbContext dbCtx = new ViperDbContext())
            {
                using (var dbCtxTran = dbCtx.Database.BeginTransaction())
                {
                    try
                    {
                        bool isDataBaseExist = Database.Exists(dbCtx.Database.Connection);

                        if (isDataBaseExist)
                        {
                            dbCtx.Addresses.Add(address);
                            isInserted = dbCtx.SaveChanges() > 0;

                            if (isInserted)
                            {
                                isInserted = false;

                                var addressID = dbCtx.Addresses.OrderByDescending(x => x.Id).FirstOrDefault().Id;

                                if (addressID > 0)
                                {
                                    isInserted = false;
                                    dbCtx.AddressesSAT.Add(addressSAT);
                                    isInserted = dbCtx.SaveChanges() > 0;

                                    var addressSATID = dbCtx.AddressesSAT.OrderByDescending(x => x.Id).FirstOrDefault().Id;

                                    if (addressSATID > 0)
                                    {
                                        if (isInserted)
                                        {
                                            isInserted = false;

                                            company.AddressSATId = addressSATID;
                                            company.AddressId = addressID;
                                            dbCtx.Companies.Add(company);
                                            isInserted = dbCtx.SaveChanges() > 0;

                                            var companyId = dbCtx.Companies.OrderByDescending(x => x.Id).FirstOrDefault().Id;

                                            if (companyId > 0)
                                            {
                                                dbCtx.Users.Add(user);
                                                isInserted = dbCtx.SaveChanges() > 0;

                                                if (isInserted == true && string.IsNullOrEmpty(message))
                                                {
                                                    dbCtxTran.Commit();
                                                }
                                            }
                                        }
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
                    finally
                    {
                        Console.WriteLine("Ocurrio un error inesperado");
                    }
                }
            }

            return message;
        }

        #endregion

        #region updatePassword

        /// <summary>
        /// Metodo para actualizar el password de un cliente que adquirio Viper Sistema de Punto de Venta para Farmacias
        /// </summary>
        /// <param name="pwd">Contraseña anterior</param>
        /// <param name="loginID">Nombre de usuario</param>
        /// <returns>Mensaje (String)</returns>
        public static string updatePassword(string pwd, string LoginID)
        {
            string message = string.Empty;
            bool isUpdate = false;

            using (ViperDbContext dbCtx = new ViperDbContext())
            {
                using (var dbCtxTran = dbCtx.Database.BeginTransaction())
                {
                    try
                    {
                        bool isDataBaseExist = Database.Exists(dbCtx.Database.Connection);

                        if (isDataBaseExist)
                        {
                            var entity = dbCtx.Users.Where(x => x.LoginID == LoginID).FirstOrDefault();

                            entity.PasswordEncrypted = pwd;

                            dbCtx.Users.Attach(entity);
                            dbCtx.Entry(entity).State = EntityState.Modified;

                            isUpdate = dbCtx.SaveChanges() > 0;

                            if (isUpdate == true && string.IsNullOrEmpty(message))
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
                    finally
                    {
                        Console.WriteLine("Ocurrio un error inesperado");
                    }
                }
            }

            return message;
        }

        #endregion

        #region isCompanyRegistered

        /// <summary>
        /// Metodo para saber si existen compañias registradas en la BD
        /// </summary>
        /// <returns>Existen o No Existen</returns>
        public static bool isCompanyRegistered()
        {
            using (ViperDbContext dbCtx = new ViperDbContext())
            {
                var result = dbCtx.Companies.Count() > 0;

                return result;
            }
        }

        #endregion

        #region obtainCompanyKeyGeneratedAutomatic

        /// <summary>
        /// Metodo para obtener la clave de la compañia para poder loguearse en la app web/app movil
        /// </summary>
        /// <returns>Clave</returns>
        public static string obtainCompanyKeyGeneratedAutomatic()
        {
            using (ViperDbContext dbCtx = new ViperDbContext())
            {
                int inc = 0;

                bool isEN = dbCtx.Companies.ToList().Count() > 0;

                if (isEN)
                {
                    string clave = dbCtx.Companies.ToList().Last().CompanyKey;

                    string numero = clave.Substring(clave.Length - 4, 4);

                    int numcl = Convert.ToInt32(numero);

                    inc = numcl + 1;
                }
                else
                {
                    inc = 1;
                }

                return string.Format("EMPOWTK{0:0000}", inc);
            }
        }

        #endregion

        #region getRegimenFiscalByID

        /// <summary>
        /// Metodo para obtener el regimen fiscal en base al ID
        /// </summary>
        /// <param name="RegimenID">Regimen Fiscal ID</param>
        /// <returns>Regimen Fiscal</returns>
        public static string getRegimenFiscalByID(int RegimenID)
        {
            using (ViperDbContext dbCtx = new ViperDbContext())
            {
                var result = dbCtx.RegimenesFiscales.Where(x => x.Id == RegimenID).FirstOrDefault().Description;

                return result;
            }
        }

        #endregion

        #region getCompanyRegisteredByCompanyID

        /// <summary>
        /// Metodo para obtener la informacion de la compañia
        /// </summary>
        /// <param name="CompanyID">ID Compañia</param>
        /// <returns>Objeto Compañia</returns>
        public static Company getCompanyRegisteredByCompanyID(int CompanyID)
        {
            using (ViperDbContext dbCtx = new ViperDbContext())
            {
                var result = dbCtx.Companies.Where(x => x.Id == CompanyID).SingleOrDefault();

                return result;
            }
        }

        #endregion

        #region getCompanyAddressSATRegisteredByID

        /// <summary>
        /// Metodo para obtener la direccion de la compañia por medio del Id
        /// </summary>
        /// <param name="AddressID">ID Direccion</param>
        /// <returns>Objeto Direccion</returns>
        public static Address getCompanyAddressRegisteredByCompanyID(int AddressID)
        {
            using (ViperDbContext dbCtx = new ViperDbContext())
            {
                var result = dbCtx.Addresses.Where(x => x.Id == AddressID).SingleOrDefault();

                return result;
            }
        }

        #endregion

        #region getCompanyAddressSATRegisteredByID

        /// <summary>
        /// Metodo para obtener la direccion fiscal de la compañia
        /// </summary>
        /// <param name="AddressSATID">ID Direccion Fiscal</param>
        /// <returns>Objeto Direccion Fiscal</returns>
        public static AddressSAT getCompanyAddressSATRegisteredByCompanyID(int AddressSATID)
        {
            using (ViperDbContext dbCtx = new ViperDbContext())
            {
                var result = dbCtx.AddressesSAT.Where(x => x.Id == AddressSATID).SingleOrDefault();

                return result;
            }
        }

        #endregion

        #region getCatalogOfRegimenFiscal

        /// <summary>
        /// Metodo para obtener los regimenes fiscales existentes en la base de datos
        /// </summary>
        /// <returns>Tabla con la informacion</returns>
        public static DataTable getCatalogOfRegimenFiscal()
        {
            DataTable dataTable = new DataTable();

            using (ViperDbContext dbCtx = new ViperDbContext())
            {
                var result = dbCtx.RegimenesFiscales.OrderBy(x => x.Description).ToList();

                dataTable.Columns.AddRange(new DataColumn[]{
                new DataColumn("Regimen Fiscal", typeof(string)),
                new DataColumn("Fisica", typeof(bool)),
                new DataColumn("Moral", typeof(bool))
            });

                result.ToList().ForEach(x =>
                {
                    var row = dataTable.NewRow();

                    row["Regimen Fiscal"] = x.Description;
                    row["Fisica"] = x.Fisica;
                    row["Moral"] = x.Moral;

                    dataTable.Rows.Add(row);
                });
            }

            return dataTable;
        }

        #endregion

        #region getCatalogOfRegimenFiscalByName

        /// <summary>
        /// Metodo para filtrar los regimenes fiscales existentes en la base de datos 
        /// </summary>
        /// <param name="filter">Regimen Fiscal</param>
        /// <returns>Tabla con la informacion</returns>
        public static DataTable getCatalogOfRegimenFiscalByName(string filter)
        {
            DataTable dataTable = new DataTable();

            using (ViperDbContext dbCtx = new ViperDbContext())
            {
                var result = dbCtx.RegimenesFiscales
                .Where(x => x.Description.Contains(filter))
                .OrderBy(x => x.Description)
                .ToList();

                dataTable.Columns.AddRange(new DataColumn[]{
                new DataColumn("Regimen Fiscal", typeof(string)),
                new DataColumn("Fisica", typeof(bool)),
                new DataColumn("Moral", typeof(bool))
            });

                result.ToList().ForEach(x =>
                {
                    var row = dataTable.NewRow();

                    row["Regimen Fiscal"] = x.Description;
                    row["Fisica"] = x.Fisica;
                    row["Moral"] = x.Moral;

                    dataTable.Rows.Add(row);
                });
            }

            return dataTable;
        }

        #endregion

        #region getRegimenIdByName

        /// <summary>
        /// Metodo para obtener el ID del regimen fiscal
        /// </summary>
        /// <param name="RegimenName">Regimen Fiscal</param>
        /// <returns>ID</returns>
        public static int getRegimenIdByName(string RegimenName)
        {
            using (ViperDbContext dbCtx = new ViperDbContext())
            {
                var result = dbCtx.RegimenesFiscales.Where(x => x.Description == RegimenName).FirstOrDefault().Id;

                return result;
            }
        }

        #endregion

        #region getCompanyIdByName

        /// <summary>
        /// Metodo para obtener el ID de la compañia por medio del nombre de la compañia
        /// </summary>
        /// <param name="companyName">Nombre de la Compañia</param>
        /// <returns>ID</returns>
        public static int getCompanyIdByName(string companyName)
        {
            using (ViperDbContext dbCtx = new ViperDbContext())
            {
                int result = dbCtx.Companies.Where(x => x.CompanyName == companyName).FirstOrDefault().Id;

                return result;
            }
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
