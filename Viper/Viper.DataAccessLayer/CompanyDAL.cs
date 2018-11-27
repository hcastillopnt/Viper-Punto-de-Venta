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
        /// <summary>
        /// A DbContext instance represents a combination of the Unit Of Work and Repository patterns 
        /// such that it can be used to query from a database and group together changes that will 
        /// then be written back to the store as a unit. 
        /// DbContext is conceptually similar to ObjectContext. 
        /// DbContext is the primary class that is responsible for interacting with the database.
        /// </summary>
        private static ViperDbContext dbCtx = new ViperDbContext();

        #region procInsertCompanyToSystem

        /// <summary>
        /// Metodo para registrar las licencias adquiridas por diferentes negocios,
        /// para trabajar con el Viper Sistema de Punto de Venta para Farmacias
        /// </summary>
        /// <param name="loginID">Nombre de Usuario (R.F.C.)</param>
        /// <param name="pwdEncrypted">Contraseña encriptada con SHA1</param>
        /// <param name="roleID">Rol ID</param>
        /// <param name="entityCompany">Entidad Empresa</param>
        /// <param name="entityAddress">Entidad Direccion</param>
        /// <param name="entityAddressSAT">Entidad Direccion Fiscal</param>
        /// <param name="entitySite">Entidad Sucursal</param>
        /// <returns>Message</returns>
        public static string procInsertCompanyToSystem(string loginID, string pwdEncrypted, int roleID, Company entityCompany, Address entityAddress, AddressSAT entityAddressSAT, Site entitySite)
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
                            PasswordEncrypted = pwdEncrypted,
                            RoleId = roleID,
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
                            dbCtx.Addresses.Add(entityAddress);

                            isInserted = dbCtx.SaveChanges() > 0;

                            if (isInserted)
                            {
                                int addressID = dbCtx.Addresses.OrderByDescending(x => x.Id).FirstOrDefault().Id;

                                if (addressID > 0)
                                {
                                    dbCtx.AddressesSAT.Add(entityAddressSAT);

                                    isInserted = dbCtx.SaveChanges() > 0;

                                    if (isInserted)
                                    {
                                        int addressSATID = dbCtx.AddressesSAT.OrderByDescending(x => x.Id).FirstOrDefault().Id;

                                        if (addressSATID > 0)
                                        {
                                            int UserID = dbCtx.Users.Where(x => x.LoginID == loginID).OrderByDescending(x => x.Id).FirstOrDefault().Id;

                                            entityCompany.UserId = UserID;
                                            entityCompany.AddressSATId = addressSATID;
                                            entityCompany.AddressId = addressID;

                                            dbCtx.Companies.Add(entityCompany);

                                            isInserted = dbCtx.SaveChanges() > 0;

                                            if (isInserted)
                                            {
                                                int CompanyID = dbCtx.Companies.OrderByDescending(x => x.Id).FirstOrDefault().Id;

                                                if (CompanyID > 0)
                                                {
                                                    entitySite.AddressId = addressID;
                                                    entitySite.CompanyId = CompanyID;

                                                    dbCtx.Sites.Add(entitySite);

                                                    isInserted = dbCtx.SaveChanges() > 0;

                                                    if (isInserted)
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
                catch(Exception ex)
                {
                    message = ex.Message;

                    dbCtxTran.Rollback();
                }
            }

            return message;
        }

        #endregion

        #region procIsCompanyRegisteredToDataBase

        /// <summary>
        /// Metodo para validar si una empresa ya ha sido registrada en la base de datos
        /// </summary>
        /// <param name="companyName">Nombre de la Empresa</param>
        /// <param name="RFC">RFC registrado ante el SAT</param>
        /// <returns>Boolean</returns>
        public static bool procIsCompanyRegisteredToDataBase(string companyName, string RFC)
        {
            bool isExistente = false;
            bool isCompaniesRegistered = false;

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                isCompaniesRegistered = dbCtx.Companies.Where(x => x.CompanyName == companyName && x.RFC == RFC).ToList().Count > 0;
            }

            return isCompaniesRegistered;
        }

        #endregion

        #region procIsCompanyRegistered

        /// <summary>
        /// Metodo para saber si existen compañias registradas en la BD
        /// </summary>
        /// <returns>Boolean</returns>
        public static bool procIsCompanyRegistered()
        {
            bool isExistente = false;
            bool isCompaniesRegistered = false;

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                isCompaniesRegistered = dbCtx.Companies.Count() > 0;
            }

            return isCompaniesRegistered;
        }

        #endregion

        #region procObtainCompanyKeyGeneratedAutomatic

        /// <summary>
        /// Metodo para obtener la clave de la empresa generada automaticamente,
        /// para cada licencia que se vaya a registrar en el sistema viper
        /// </summary>
        /// <returns>Clave</returns>
        public static string procObtainCompanyKeyGeneratedAutomatic()
        {
            bool isExistente = false;

            int inc = 0;

            String CompanyKey = String.Empty;

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
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
            }

            CompanyKey = string.Format("EMPOWTK{0:0000}", inc);

            return CompanyKey;
        }

        #endregion

        #region procFindRegimenFiscalByID

        /// <summary>
        /// Metodo para obtener el regimen fiscal en base al ID
        /// </summary>
        /// <param name="RegimenID">ID Regimen Fiscal</param>
        /// <returns>Regimen Fiscal</returns>
        public static string procFindRegimenFiscalByID(int RegimenID)
        {
            bool isExistente = false;

            String regimenFiscal = String.Empty;

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                regimenFiscal = dbCtx.RegimenesFiscales.Where(x => x.Id == RegimenID).FirstOrDefault().Description;
            }

            return regimenFiscal;
        }

        #endregion

        #region procGetCompanyObjectByCompanyID

        /// <summary>
        /// Metodo para obtener los datos de la empresa que adquirio la licencia 
        /// del Sistema de Punto de Venta para Farmacias Viper
        /// </summary>
        /// <param name="CompanyID">ID Compañia</param>
        /// <returns>Object</returns>
        public static Company procGetCompanyObjectByCompanyID(int CompanyID)
        {
            bool isExistente = false;

            Company company = new Company();

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                company = dbCtx.Companies.Where(x => x.Id == CompanyID).SingleOrDefault();
            }

            return company;
        }

        #endregion

        #region procGetRegimenFiscalToDataTable

        /// <summary>
        /// Metodo para obtener los regimenes fiscales existentes en la base de datos
        /// </summary>
        /// <returns>DataTable</returns>
        public static DataTable procGetRegimenFiscalToDataTable()
        {
            bool isExistente = false;

            DataTable dataTable = new DataTable();

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
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

        #region procGetRegimenFiscalByNameToDataTable

        /// <summary>
        /// Metodo para filtrar los regimenes fiscales existentes en la base de datos 
        /// </summary>
        /// <param name="filter">Regimen Fiscal</param>
        /// <returns>DataTable</returns>
        public static DataTable procGetRegimenFiscalByNameToDataTable(string filter)
        {
            bool isExistente = false;

            DataTable dataTable = new DataTable();

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
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

        #region procGetRegimenFiscalIdByName

        /// <summary>
        /// Metodo para obtener el ID del regimen fiscal
        /// </summary>
        /// <param name="RegimenFiscalName">Regimen Fiscal</param>
        /// <returns>ID</returns>
        public static int procGetRegimenFiscalIdByName(string RegimenFiscalName)
        {
            bool isExistente = false;

            int RegimenFiscalId = 0;

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                RegimenFiscalId = dbCtx.RegimenesFiscales.Where(x => x.Description == RegimenFiscalName).FirstOrDefault().Id;
            }

            return RegimenFiscalId;
        }

        #endregion

        #region procGetCompanyIdByName

        /// <summary>
        /// Metodo para obtener el ID de la compañia por medio del nombre de la compañia
        /// </summary>
        /// <param name="companyName">Nombre de la Compañia</param>
        /// <returns>ID</returns>
        public static int procGetCompanyIdByName(string companyName)
        {
            bool isExistente = false;

            int CompanyId = 0;

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                CompanyId = dbCtx.Companies.Where(x => x.CompanyName == companyName).FirstOrDefault().Id;
            }

            return CompanyId;
        }

        #endregion

        #region procGetLastIDToCompanyRegistered

        /// <summary>
        /// Metodo para obtener el ultimo ID de las empresas registradas
        /// </summary>
        /// <returns>Id</returns>
        public static int procGetLastIDToCompanyRegistered()
        {
            bool isExistente = false;

            int CompanyID = 0;

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                CompanyID = dbCtx.Companies.OrderByDescending(x => x.Id).FirstOrDefault().Id;
            }

            return CompanyID;
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
