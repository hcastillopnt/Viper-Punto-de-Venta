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
        /// <param name="folder">Folder donde se almacenan las fotos de perfil de los empleados</param>
        /// <returns>DataTable</returns>
        public static DataTable procGetEmployeesToDataTable(int CompanyID, string folder)
        {
            bool isExistente = false;

            DataTable dataTable = new DataTable();

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                int rows = dbCtx.Employees.Count();

                if (rows > 0)
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
                                      e.EmployeeNumber,
                                      e.FullName,
                                      e.PhoneNumber

                                  })
                                  .OrderBy(x => x.FullName)
                                  .ToList();

                    dataTable.Columns.AddRange(new DataColumn[]{
                new DataColumn("NOMBRE_EMPLEADO", typeof(string)),
                new DataColumn("TELEFONO", typeof(string)),
                new DataColumn("LOGOTIPO", typeof(byte[]))
            });

                    Image img = Image.FromFile(@folder + result.FirstOrDefault().EmployeeNumber + ".jpg");
                    img = Resize(img, 100, 50);

                    result.ToList().ForEach(x =>
                    {
                        var row = dataTable.NewRow();

                        row["NOMBRE_EMPLEADO"] = x.FullName;
                        row["TELEFONO"] = x.PhoneNumber;
                        row["LOGOTIPO"] = imageToByteArray(img);

                        dataTable.Rows.Add(row);
                    });
                }
            }

            return dataTable;
        }

        #endregion

        #region procGetEmployeesByNameToDataTable

        /// <summary>
        /// Metodo para buscar un empleado registrado en el Sistema de Punto de Venta para Farmacias
        /// con Venta de Genericos
        /// </summary>
        /// <param name="CompanyID">Clave Empresa</param>
        /// <param name="name">Nombre del Empleado</param>
        /// <param name="folder">Folder donde se almacenan las fotos de perfil de los empleados</param>
        /// <returns>DataTable</returns>
        public static DataTable procGetEmployeesByNameToDataTable(int CompanyID, string name, string folder)
        {
            bool isExistente = false;

            DataTable dataTable = new DataTable();

            isExistente = Database.Exists(dbCtx.Database.Connection);

            if (isExistente)
            {
                int rows = dbCtx.Employees.Count();

                if (rows > 0)
                {
                    var result = (from e in dbCtx.Employees
                                  join edh in dbCtx.EmployeesDepartmentHistory on e.Id equals edh.EmployeeId
                                  join u in dbCtx.Users on e.UserId equals u.Id
                                  join s in dbCtx.Sites on edh.SiteId equals s.Id
                                  join c in dbCtx.Companies on s.CompanyId equals c.Id
                                  join j in dbCtx.JobsTitle on edh.JobTitleId equals j.Id
                                  join d in dbCtx.Departments on j.DepartmentId equals d.Id
                                  where c.Id == CompanyID && e.FullName.Contains(name)
                                  select new
                                  {
                                      e.EmployeeNumber,
                                      e.FullName,
                                      e.PhoneNumber

                                  })
                              .OrderBy(x => x.FullName)
                              .ToList();

                    dataTable.Columns.AddRange(new DataColumn[]{
                new DataColumn("NOMBRE_EMPLEADO", typeof(string)),
                new DataColumn("TELEFONO", typeof(string)),
                new DataColumn("LOGOTIPO", typeof(byte[]))
            });

                    Image img = Image.FromFile(@folder + result.FirstOrDefault().EmployeeNumber + ".jpg");
                    img = Resize(img, 100, 50);

                    result.ToList().ForEach(x =>
                    {
                        var row = dataTable.NewRow();

                        row["NOMBRE_EMPLEADO"] = x.FullName;
                        row["TELEFONO"] = x.PhoneNumber;
                        row["LOGOTIPO"] = imageToByteArray(img);

                        dataTable.Rows.Add(row);
                    });
                }
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
