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
    public class AddressDAL
    {
        /// <summary>
        /// A DbContext instance represents a combination of the Unit Of Work and Repository patterns 
        /// such that it can be used to query from a database and group together changes that will 
        /// then be written back to the store as a unit. 
        /// DbContext is conceptually similar to ObjectContext. 
        /// DbContext is the primary class that is responsible for interacting with the database.
        /// </summary>
        private static ViperDbContext dbCtx = new ViperDbContext();

        #region procInsertAddressToSystem

        /// <summary>
        /// Metodo para registrar la direccion de un empleado, un negocio (licencia), un proveedor,
        /// una sucursal, entre otros objetos en el sistema viper
        /// </summary>
        /// <param name="entity">Entidad Direccion</param>
        /// <returns>Message</returns>
        public static string procInsertAddressToSystem(Address entity)
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
                        dbCtx.Addresses.Add(entity);

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

        #region procGetAddressObjectByAddressId

        /// <summary>
        /// Metodo para obtener los datos de la direccion que adquirio la licencia 
        /// del Sistema de Punto de Venta para Farmacias Viper
        /// </summary>
        /// <param name="AddressID">ID Direccion</param>
        /// <returns>Object</returns>
        public static Address procGetAddressObjectByAddressId(int AddressID)
        {
            bool isExistente = false;

            Address address = new Address();

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                address = dbCtx.Addresses.Where(x => x.Id == AddressID).SingleOrDefault();
            }

            return address;
        }

        #endregion

        #region procGetAddressSATObjectByAddressId

        /// <summary>
        /// Metodo para obtener los datos de la direccion fiscal que adquirio la licencia 
        /// del Sistema de Punto de Venta para Farmacias Viper
        /// </summary>
        /// <param name="AddressSATID">ID Direccion Fiscal</param>
        /// <returns>Object</returns>
        public static AddressSAT procGetAddressSATObjectByAddressId(int AddressSATID)
        {
            bool isExistente = false;

            AddressSAT addressSAT = new AddressSAT();

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                addressSAT = dbCtx.AddressesSAT.Where(x => x.Id == AddressSATID).SingleOrDefault();
            }

            return addressSAT;
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
