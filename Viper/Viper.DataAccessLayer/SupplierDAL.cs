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
        /// <param name="entitySupplier">Entidad Sucursal</param>
        /// <param name="entityAddress">Entidad Direccion</param>
        /// <returns>Message</returns>
        public static string procInsertSupplierToSystem(Supplier entitySupplier, Address entityAddress)
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

                            var addressID = dbCtx.Addresses.OrderByDescending(x => x.Id).FirstOrDefault().Id;

                            if (addressID > 0)
                            {
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

                Image img = Image.FromFile(@folder + result.FirstOrDefault().SupplierKey + ".jpg");
                img = Resize(img, 100, 50);

                result.ToList().ForEach(x =>
                {
                    var row = dataTable.NewRow();

                    row["PROVEEDOR"] = x.SupplierName;
                    row["TELEFONO"] = x.PhoneNumber;
                    row["LOGOTIPO"] = imageToByteArray(img);

                    dataTable.Rows.Add(row);
                });
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

                Image img = Image.FromFile(@folder + result.FirstOrDefault().SupplierKey + ".jpg");
                img = Resize(img, 100, 50);

                result.ToList().ForEach(x =>
                {
                    var row = dataTable.NewRow();

                    row["PROVEEDOR"] = x.SupplierName;
                    row["TELEFONO"] = x.PhoneNumber;
                    row["LOGOTIPO"] = imageToByteArray(img);

                    dataTable.Rows.Add(row);
                });
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

        #region Resize

        private static Image Resize(Image Imagen, int Ancho, int Alto, int resolucion)
        {
            //Bitmap sera donde trabajaremos los cambios
            using (Bitmap imagenBitmap = new Bitmap(Ancho, Alto, PixelFormat.Format32bppRgb))
            {
                imagenBitmap.SetResolution(resolucion, resolucion);
                //Hacemos los cambios a ImagenBitmap usando a ImagenGraphics y la Imagen Original(Imagen)
                //ImagenBitmap se comporta como un objeto de referenciado
                using (Graphics imagenGraphics = Graphics.FromImage(imagenBitmap))
                {
                    imagenGraphics.SmoothingMode = SmoothingMode.AntiAlias;
                    imagenGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    imagenGraphics.PixelOffsetMode = PixelOffsetMode.HighQuality;
                    imagenGraphics.DrawImage(Imagen, new Rectangle(0, 0, Ancho, Alto), new Rectangle(0, 0, Imagen.Width, Imagen.Height), GraphicsUnit.Pixel);
                    //todos los cambios hechos en imagenBitmap lo llevaremos un Image(Imagen) con nuevos datos a travez de un MemoryStream
                    MemoryStream imagenMemoryStream = new MemoryStream();
                    imagenBitmap.Save(imagenMemoryStream, ImageFormat.Jpeg);
                    Imagen = Image.FromStream(imagenMemoryStream);
                }
            }
            return Imagen;
        }

        private static Image Resize(Image image, int SizeHorizontalPercent, int SizeVerticalPercent)
        {
            //Obntenemos el ancho y el alto a partir del porcentaje de tamaño solicitado
            int anchoDestino = image.Width * SizeHorizontalPercent / 100;
            int altoDestino = image.Height * SizeVerticalPercent / 100;
            //Obtenemos la resolucion original 
            int resolucion = Convert.ToInt32(image.HorizontalResolution);

            return Resize(image, anchoDestino, altoDestino, resolucion);
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
