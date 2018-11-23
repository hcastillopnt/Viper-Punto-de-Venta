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
    public class ProductDAL
    {
        /// <summary>
        /// A DbContext instance represents a combination of the Unit Of Work and Repository patterns 
        /// such that it can be used to query from a database and group together changes that will 
        /// then be written back to the store as a unit. 
        /// DbContext is conceptually similar to ObjectContext. 
        /// DbContext is the primary class that is responsible for interacting with the database.
        /// </summary>
        private static ViperDbContext dbCtx = new ViperDbContext();

        #region procInsertProductToSystem

        /// <summary>
        /// Metodo para registrar los productos para vender con el 
        /// Viper Sistema de Punto de Venta para Farmacias
        /// </summary>
        /// <param name="entityProduct">Entidad Producto</param>
        /// <returns>Message</returns>
        public static string procInsertProductToSystem(Product entityProduct)
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
                        dbCtx.Products.Add(entityProduct);

                        isInserted = dbCtx.SaveChanges() > 0;

                        if (isInserted == true)
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

        #region procInsertProductInventoryToSystem

        /// <summary>
        /// Metodo para registrar los inventarios de los productos para vender con el 
        /// Viper Sistema de Punto de Venta para Farmacias
        /// </summary>
        /// <param name="UnitsInStock">Stock Actual</param>
        /// <param name="SiteID">ID Sucursal</param>
        /// <returns>Message</returns>
        public static string procInsertProductInventoryToSystem(int ProductID, int UnitsInStock, int SiteID)
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
                        ProductInventory productInventory = new ProductInventory()
                        {
                            ProductId = ProductID,
                            UnitsInStock = UnitsInStock,
                            SiteId = SiteID,
                        };

                        dbCtx.Entry(productInventory).State = productInventory.Id == 0 ? EntityState.Added : EntityState.Modified;

                        isInserted = dbCtx.SaveChanges() > 0;

                        if (isInserted == true)
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

        #region procInsertProductToSystem

        /// <summary>
        /// Metodo para registrar los productos para vender con el 
        /// Viper Sistema de Punto de Venta para Farmacias
        /// </summary>
        /// <param name="listPrice">Precio de Venta</param>
        /// <param name="standardCost">Precio de Compra</param>
        /// <param name="productID">ID Producto</param>
        /// <param name="siteID">ID Sucursal</param>
        /// <returns></returns>
        public static string procInsertProductHistoryToSystem(decimal listPrice, decimal standardCost, int productID, int siteID)
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
                        ProductCostHistory productCostHistory = new ProductCostHistory();

                        productCostHistory.ProductId = productID;
                        productCostHistory.SiteId = siteID;
                        productCostHistory.StantardCost = standardCost;
                        productCostHistory.StartDate = DateTime.Now;
                        //productCostHistory.EndDate = DateTime.Now.AddMonths(1);

                        dbCtx.ProductsCostHistory.Add(productCostHistory);

                        isInserted = dbCtx.SaveChanges() > 0;

                        if (isInserted)
                        {
                            ProductListPriceHistory productListPriceHistory = new ProductListPriceHistory();

                            productListPriceHistory.ProductId = productID;
                            productListPriceHistory.SiteId = siteID;
                            productListPriceHistory.ListPrice = listPrice;
                            productListPriceHistory.StartDate = DateTime.Now;
                            //productListPriceHistory.EndDate = DateTime.Now.AddMonths(1);

                            dbCtx.ProductsListPriceHistory.Add(productListPriceHistory);

                            isInserted = dbCtx.SaveChanges() > 0;

                            if (isInserted == true)
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

        #region procGetLastIDToEmployeeRegistered

        /// <summary>
        /// Metodo para obtener el ultimo ID de los productos registrados
        /// </summary>
        /// <returns>Id</returns>
        public static int procGetLastIDToProductRegistered()
        {
            bool isExistente = false;

            int ProductID = 0;

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                ProductID = dbCtx.Products.OrderByDescending(x => x.Id).FirstOrDefault().Id;
            }

            return ProductID;
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
