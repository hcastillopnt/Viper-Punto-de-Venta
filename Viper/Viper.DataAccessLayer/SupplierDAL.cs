using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viper.BusinessEntities;

namespace Viper.DataAccessLayer
{
    public class SupplierDAL
    {
        /// <summary>
        /// A DbContext instance represents a combination of the Unit Of Work and Repository patterns 
        /// such that it can be used to query from a database and group together changes that will 
        /// then be written back to the store as a unit. 
        /// DbContext is conceptually similar to ObjectContext. 
        /// DbContext is the primary class that is responsible for interacting with the database.
        /// </summary>
        private static ViperDbContext dbCtx = new ViperDbContext();

        #region procInsertSupplierToSystem

        /// <summary>
        /// Metodo para registrar los distintos proveedores de medicamento y otros,
        /// para trabajar con el Viper Sistema de Punto de Venta para Farmacias
        /// </summary>
        /// <param name="loginID">Nombre de Usuario (R.F.C.)</param>
        /// <param name="entitySupplier">Entidad Sucursal</param>
        /// <param name="entityAddress">Entidad Direccion</param>
        /// <returns>Message</returns>
        public static string procInsertSupplierToSystem(string loginID, string pwdEncrypted, int roleID,  Supplier entitySupplier, Address entityAddress)
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
                                    int UserID = dbCtx.Users.Where(x => x.LoginID == loginID).OrderByDescending(x => x.Id).FirstOrDefault().Id;

                                    entitySupplier.UserId = UserID;
                                    entitySupplier.AddressId = addressID;

                                    dbCtx.Suppliers.Add(entitySupplier);

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
                }
            }

            return message;
        }

        #endregion

        #region procGetSuppliersToDataTable

        /// <summary>
        /// Metodo para obtener todos los proveedores registrados en el Sistema de Punto de Venta para Farmacias
        /// con Venta de Genericos
        /// </summary>
        /// <param name="folder">Folder donde se almacenan los logotipos de los proveedores</param>
        /// <returns>DataTable</returns>
        public static DataTable procGetSuppliersToDataTable(string folder)
        {
            bool isExistente = false;

            DataTable dataTable = new DataTable();

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                int rows = dbCtx.Suppliers.Count();

                if (rows > 0)
                {
                    var result = (from s in dbCtx.Suppliers
                                  select new
                                  {
                                      s.SupplierKey,
                                      s.SupplierName,
                                      s.PhoneNumber
                                  })
                                  .OrderBy(x => x.SupplierName)
                                  .ToList();

                    dataTable.Columns.AddRange(new DataColumn[]{
                new DataColumn("PROVEEDOR", typeof(string)),
                new DataColumn("TELEFONO", typeof(string)),
                new DataColumn("LOGOTIPO", typeof(byte[]))
            });
                    result.ToList().ForEach(x =>
                    {
                        var row = dataTable.NewRow();

                        string fileURL = @folder + x.SupplierKey + ".jpg";

                        row["PROVEEDOR"] = x.SupplierName;
                        row["TELEFONO"] = x.PhoneNumber;
                        row["LOGOTIPO"] = imageToByteArray(ScaleImage(Image.FromFile(fileURL), 200, 100));

                        dataTable.Rows.Add(row);
                    });
                }
            }

            return dataTable;
        }

        #endregion

        #region procGetSuppliersByNameToDataTable

        /// <summary>
        /// Metodo para buscar un proveedor registrado en el Sistema de Punto de Venta para Farmacias
        /// con Venta de Genericos
        /// </summary>
        /// <param name="name">Proveedor</param>
        /// <param name="folder">Folder donde se almacenan los logotipos de los proveedores</param>
        /// <returns>DataTable</returns>
        public static DataTable procGetSuppliersByNameToDataTable(string name, string folder)
        {
            bool isExistente = false;

            DataTable dataTable = new DataTable();

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                int rows = dbCtx.Suppliers.Count();

                if (rows > 0)
                {
                    var result = (from s in dbCtx.Suppliers
                                  where s.SupplierName.Contains(name)
                                  select new
                                  {
                                      s.SupplierKey,
                                      s.SupplierName,
                                      s.PhoneNumber
                                  })
                              .OrderBy(x => x.SupplierName)
                              .ToList();

                    dataTable.Columns.AddRange(new DataColumn[]{
                new DataColumn("PROVEEDOR", typeof(string)),
                new DataColumn("TELEFONO", typeof(string)),
                new DataColumn("LOGOTIPO", typeof(byte[]))
            });

                    result.ToList().ForEach(x =>
                    {
                        var row = dataTable.NewRow();

                        string fileURL = @folder + x.SupplierKey + ".jpg";

                        row["PROVEEDOR"] = x.SupplierName;
                        row["TELEFONO"] = x.PhoneNumber;
                        row["LOGOTIPO"] = imageToByteArray(ScaleImage(Image.FromFile(fileURL), 200, 100));

                        dataTable.Rows.Add(row);
                    });
                }
            }

            return dataTable;
        }

        #endregion

        #region imageToByteArray

        public static byte[] imageToByteArray(System.Drawing.Image imageIn)
        {
            MemoryStream ms = new MemoryStream();
            imageIn.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
            return ms.ToArray();
        }

        #endregion

        #region ScaleImage

        public static Image ScaleImage(Image image, int maxWidth, int maxHeight)
        {
            var ratioX = (double)maxWidth / image.Width;
            var ratioY = (double)maxHeight / image.Height;
            var ratio = Math.Min(ratioX, ratioY);

            var newWidth = (int)(image.Width * ratio);
            var newHeight = (int)(image.Height * ratio);

            var newImage = new Bitmap(newWidth, newHeight);

            using (var graphics = Graphics.FromImage(newImage))
                graphics.DrawImage(image, 0, 0, newWidth, newHeight);

            return newImage;
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
