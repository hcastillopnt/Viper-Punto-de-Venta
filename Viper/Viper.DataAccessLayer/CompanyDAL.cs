#region using directives 

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

#endregion

namespace Viper.DataAccessLayer
{
    public class CompanyDAL
    {
        /// <summary>
        /// DbContext is an important class in Entity Framework API. It is a bridge between your domain or entity classes and the database.
        /// </summary>
        public static ViperContext dbCtx = new ViperContext();

        #region sp_insert_company

        /// <summary>
        /// Method to realize the record of the information of the person who acquires a license with the company OwalTek Innovation Solutions, of the software Viper
        /// </summary>
        /// <param name="company">Company Object</param>
        /// <param name="address">Address Object</param>
        /// <param name="addressSAT">Address SAT Object</param>
        /// <returns>Message</returns>
        public static string sp_insert_company(Company company, Address address, AddressSAT addressSAT)
        {
            string message = string.Empty;
            bool isInserted = false;

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
                               SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'Company' OR table_name='Address' OR table_name='AddressSAT'")
                     .SingleOrDefault() != null;

                        if (isTableExist)
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

        #region obtainCompanyKeyGeneratedAutomatic

        /// <summary>
        /// Method to obtain the key generated automatic of the company
        /// </summary>
        /// <returns>String (Key)</returns>
        public static string obtainCompanyKeyGeneratedAutomatic()
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

        #endregion

        #region obtainLoginIDGeneratedAutomatic

        /// <summary>
        /// 
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

            //return string.Format("VIPER-EMP-{0:0000}", inc);
            return string.Format("VIPER-ADMIN-{0:0000}", inc);
        }

        #endregion

        #region getCatalogOfRegimenFiscal

        /// <summary>
        /// Method to obtain the available options of fiscal regime
        /// </summary>
        /// <returns>DataTable</returns>
        public static DataTable getCatalogOfRegimenFiscal()
        {
            DataTable dataTable = new DataTable();

            var result = dbCtx.RegimenesFiscal.OrderBy(x => x.Description).ToList();

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

            return dataTable;
        }

        #endregion

        #region getCatalogOfRegimenFiscalByName

        /// <summary>
        /// Method to obtain the available options of fiscal regime by name
        /// </summary>
        /// <param name="filter">Regimen Fiscal</param>
        /// <returns>DataTable</returns>
        public static DataTable getCatalogOfRegimenFiscalByName(string filter)
        {
            DataTable dataTable = new DataTable();

            var result = dbCtx.RegimenesFiscal
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

            return dataTable;
        }

        #endregion

        #region getRegimenIdByName

        /// <summary>
        /// Method to obtain the ID fiscal regime by Name
        /// </summary>
        /// <param name="RegimenName">Regimen Fiscal</param>
        /// <returns></returns>
        public static int getRegimenIdByName(string RegimenName)
        {
            var result = dbCtx.RegimenesFiscal.Where(x => x.Description == RegimenName).FirstOrDefault().Id;

            return result;
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
