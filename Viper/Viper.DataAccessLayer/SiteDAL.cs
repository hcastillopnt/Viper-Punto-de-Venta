﻿using System;
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
        /// <summary>
        /// A DbContext instance represents a combination of the Unit Of Work and Repository patterns 
        /// such that it can be used to query from a database and group together changes that will 
        /// then be written back to the store as a unit. 
        /// DbContext is conceptually similar to ObjectContext. 
        /// DbContext is the primary class that is responsible for interacting with the database.
        /// </summary>
        private static ViperDbContext dbCtx = new ViperDbContext();

        #region procGetSitesByCompanyName

        /// <summary>
        /// Metodo para obtener todas las sucursales registradas por medio del nombre de la empresa
        /// registrada con una licencia adquirida
        /// </summary>
        /// <param name="CompanyName">Nombre de la Empresa</param>
        /// <returns>DataTable</returns>
        public static DataTable procGetSitesByCompanyName(string CompanyName)
        {
            bool isExistente = false;

            //Se crea el DataTable
            DataTable dt = new DataTable();

            //Crear las columnas del DataTable
            dt.Columns.AddRange(new DataColumn[]{
                                new DataColumn("Id", typeof(int)),
                                new DataColumn("Site", typeof(string))
                            });

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                var result = (from s in dbCtx.Sites
                              join c in dbCtx.Companies on s.CompanyId equals c.Id
                              where c.CompanyName == CompanyName
                              select new
                              {
                                  s.Id,
                                  Site = s.UniquePhysicalID
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

            return dt;
        }

        #endregion

        #region procFindSiteBySiteName

        /// <summary>
        /// Metodo para obtener la sucursal en la cual se encuentra registrado el usuario
        /// que se logueo en el sistema viper
        /// </summary>
        /// <param name="siteName">Nombre de la sucursal</param>
        /// <returns>List</returns>
        public static List<Site> procFindSiteBySiteName(string siteName)
        {
            bool isExistente = false;

            List<Site> sites = new List<Site>();

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                sites = dbCtx.Sites.Where(x => x.SiteName == siteName).ToList();
            }

            return sites;
        }

        #endregion

        #region procInsertSiteToSystem

        /// <summary>
        /// Metodo para registrar los datos de las sucursales que tiene ligadas la empresa
        /// que adquirio la licencia del sistema viper
        /// </summary>
        /// <param name="entity">Entidad Sucursal</param>
        /// <returns>Message</returns>
        public static string procInsertSiteToSystem(Site entity)
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
                        dbCtx.Sites.Add(entity);

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
