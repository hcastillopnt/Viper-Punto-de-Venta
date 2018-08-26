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
    public class SiteDAL
    {
        #region getSitesByCompany

        /// <summary>
        /// Metodo para obtener todas las sucursales registradas de tal compañia
        /// </summary>
        /// <param name="CompanyName">Company Name</param>
        /// <returns>DataTable</returns>
        public static DataTable getSitesByCompany(string CompanyName)
        {
            bool isExistente = false;

            //Se crea el DataTable
            DataTable dt = new DataTable();

            //Crear las columnas del DataTable
            dt.Columns.AddRange(new DataColumn[]{
                                new DataColumn("Id", typeof(int)),
                                new DataColumn("Site", typeof(string))
                            });

            using (ViperDbContext dbCtx = new ViperDbContext())
            {
                isExistente = Database.Exists(dbCtx.Database.Connection);

                if (isExistente)
                {
                    var result = (from s in dbCtx.Sites
                                  join c in dbCtx.Companies on s.CompanyId equals c.Id
                                  where c.CompanyName == CompanyName
                                  select new
                                  {
                                      s.Id,
                                      Site = s.UniquePhysicalID + " " + s.SiteName
                                  }).ToList();

                    //Crear una fila nueva
                    var rowBlank = dt.NewRow();

                    //Cargar los datos de la fila
                    rowBlank["Id"] = -1;
                    rowBlank["Site"] = "--SELECCIONE--";

                    //Añadir fila al DataTable
                    dt.Rows.Add(rowBlank);

                    //Guardar los datos recuperados en una fila del DataTable
                    result.ToList().ForEach(x =>
                    {
                        //Crear una fila nueva
                        var row = dt.NewRow();

                        //Cargar los datos de la fila
                        row["Id"] = x.Id;
                        row["Site"] = x.Site;

                        //Añadir fila al DataTable
                        dt.Rows.Add(row);
                    });
                }
            }

            return dt;
        }

        #endregion

        #region findSiteBySiteName

        /// <summary>
        /// Metodo para obtener la sucursal en la cual se encuentra logueado el usuario
        /// </summary>
        /// <param name="siteName">Name of Site</param>
        /// <returns>List</returns>
        public static List<Site> findSiteBySiteName(string siteName)
        {
            bool isExistente = false;

            List<Site> sites = new List<Site>();

            using (ViperDbContext dbCtx = new ViperDbContext())
            {
                isExistente = Database.Exists(dbCtx.Database.Connection);

                if (isExistente)
                {
                    sites = dbCtx.Sites.Where(x => x.SiteName == siteName).ToList();
                }
            }

            return sites;
        }

        #endregion

        #region sp_insert_site

        /// <summary>
        /// Metodo para registrar los datos generales de la sucursal a registrar
        /// </summary>
        /// <param name="site">Objeto Sucursal</param>
        /// <returns>Mensaje (String)</returns>
        public static string sp_insert_site(Site site)
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
                            var companyID = dbCtx.Companies.OrderByDescending(x => x.Id).FirstOrDefault().Id;

                            var addressID = dbCtx.Addresses.OrderByDescending(x => x.Id).FirstOrDefault().Id;

                            site.CompanyId = companyID;
                            site.AddressId = addressID;

                            dbCtx.Sites.Add(site);
                            isInserted = dbCtx.SaveChanges() > 0;

                            if (isInserted == true && string.IsNullOrEmpty(message))
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
