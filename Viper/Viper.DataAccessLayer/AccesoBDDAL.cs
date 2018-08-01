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
    public class AccesoBDDAL
    {
        public static ViperContext db = new ViperContext();

        #region insertarSite
        public static string sp_insert_sucursal(Site s, Address a)
        {
            string message = string.Empty;
            bool isInserted = false;

            //Utilizar el contexto para acceder a la base de datos
            using (ViperContext ctx = new ViperContext())
            {
                using (var ctxTran = ctx.Database.BeginTransaction())
                {
                    try
                    {
                        //Validar si la base de datos existe
                        bool isDataBaseExist = Database.Exists(ctx.Database.Connection);

                        if (isDataBaseExist)
                        {
                            //Validar si la tabla utilizada existe
                            bool isTableExist = ctx.Database
                         .SqlQuery<int?>(@"
                               SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'Site' OR table_name='Address'")
                         .SingleOrDefault() != null;

                            if (isTableExist)
                            {
                                ctx.Addresses.Add(a);
                                isInserted = ctx.SaveChanges() > 0;

                                if (isInserted)
                                {
                                    isInserted = false;

                                    var addressID = ctx.Addresses.OrderByDescending(x => x.Id).FirstOrDefault().Id;

                                    if (addressID > 0)
                                    {
                                        isInserted = false;
                                        ctx.Sites.Add(s);
                                        isInserted = ctx.SaveChanges() > 0;

                                        
                                            if (isInserted)
                                            {
                                                isInserted = false;

                                                s.AddressId= addressID;
                                                ctx.Sites.Add(s);
                                                isInserted = ctx.SaveChanges() > 0;

                                                var siteId = ctx.Sites.OrderByDescending(x => x.Id).FirstOrDefault().Id;
                                                if (siteId > 0)
                                                {
                                                    if (isInserted)
                                                    {
                                                        if (isInserted == true && string.IsNullOrEmpty(message))
                                                        {

                                                            ctxTran.Commit();

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

                        ctxTran.Rollback();
                    }
                    catch (DbUpdateConcurrencyException ex)
                    {
                        var entity = ex.Entries.Single().GetDatabaseValues();

                        if (entity == null)
                            message = "The entity being updated is already deleted by another user";
                        else
                            message = "The entity being updated has already been updated by another user";

                        ctxTran.Rollback();
                    }
                    catch (DbUpdateException ex)
                    {
                        var exception = HandleDbUpdateException(ex);
                        message = exception.Message;

                        ctxTran.Rollback();
                    }
                }
            }

            return message;
        }

        #endregion

        public static string checkCompanyName()
        {
            string nombre=null;
            bool isComp = db.Companies.ToList().Count() > 0;
            if (isComp)
            {
                nombre = db.Companies.ToList().Last().CompanyName.ToUpper();

            }
            
            return nombre;
        }

        public static int checkIdCompany()
        {
            int Cid=0;
            bool isComp = db.Companies.ToList().Count() > 0;
            if (isComp)
            {
                Cid = db.Companies.ToList().Last().Id;
            }
            return Cid;
        }
        public static string checkEmployeeNumber()
        {
            int inc = 0;

            bool isEN = db.Employees.ToList().Count() > 0;//verificar si hay empleados
            if (isEN)
            {
                //traer ultimo codigo de empleado registrado
                string clave = db.Employees.ToList().Last().EmployeeIDNumber;

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
            //Retornar codigo
            return string.Format("VIPER-POS-{0:0000}", inc);
        }

        public static string checkCompanyNumber()
        {
            int inc = 0;

            bool isEN = db.Companies.ToList().Count() > 0;//el single trae la entidad completa con su informacion
            if (isEN)
            {

                string clave = db.Companies.ToList().Last().CompanyKey;

                //Retorna la cadena la
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

        public static string codigoSucursal(string munic, string colonia)
        {
            string codigo_sucursal = "SUC-" + munic.ToUpper().Trim() + "-" + colonia.ToUpper().Trim();
            return codigo_sucursal;
        }

        // metodo para eliminar por medio del id por LinQ
        public static bool delete_company(int id)
        {
            var query = db.Companies.Where(c => c.Id == id).Single();//el single trae la entidad completa con su informacion

            db.Companies.Remove(query);
            return db.SaveChanges() > 0;
        }

        // metodo para actualizar 
        public static bool update_company(Company c)
        {
            var comp = db.Companies.FirstOrDefault(x => x.Id == c.Id);
            #region ActualizandoConObjeto
            comp.Id = c.Id;
            comp.AddressId = c.AddressId;
            comp.AddressSATId = c.AddressSATId;
            comp.ApiKey = c.ApiKey;
            comp.BusinessActivity = c.BusinessActivity;
            comp.CellphoneNumber = c.CellphoneNumber;
            comp.CompanyKey = c.CompanyKey;
            comp.CompanyName = c.CompanyName;
            comp.CreateBy = c.CreateBy;
            comp.CreatedDate = c.CreatedDate;
            comp.CURP = c.CURP;
            comp.EmailAddress = c.EmailAddress;
            comp.FiscalName = c.FiscalName;
            comp.ModifiedBy = c.ModifiedBy;
            comp.ModifiedDate = c.ModifiedDate;
            comp.PhoneNumber = c.PhoneNumber;
            comp.RegimenFiscalId = c.RegimenFiscalId;
            comp.RFC = c.RFC;
            #endregion

            return db.SaveChanges() > 0;
        }

        public static List<Company> getCompanies()
        {
            List<Company> companies = new List<Company>();

            //Utilizar el contexto para acceder a la base de datos
            using (ViperContext ctx = new ViperContext())
            {
                try
                {
                    //Validar si la base de datos existe
                    bool isDataBaseExist = Database.Exists(ctx.Database.Connection);

                    if (isDataBaseExist)
                    {
                        //Validar si la tabla utilizada existe
                        bool isTableExist = ctx.Database
                     .SqlQuery<int?>(@"
                         SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'Company'")
                     .SingleOrDefault() != null;

                        if (isTableExist)
                        {
                            companies = ctx.Companies.OrderBy(x => x.CompanyName).ToList();
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }

            return companies;
        }

        public static List<Site> getSites(int id_comp)
        {
            List<Site> Sites= new List<Site>();

            //Utilizar el contexto para acceder a la base de datos
            using (ViperContext ctx = new ViperContext())
            {
                try
                {
                    //Validar si la base de datos existe
                    bool isDataBaseExist = Database.Exists(ctx.Database.Connection);

                    if (isDataBaseExist)
                    {
                        //Validar si la tabla utilizada existe
                        bool isTableExist = ctx.Database
                     .SqlQuery<int?>(@"
                         SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'Site'")
                     .SingleOrDefault() != null;

                        if (isTableExist)
                        {
                            Sites = ctx.Sites.Where(x=>x.CompanyId==id_comp).OrderBy(x => x.Name).ToList();
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }

            return Sites;
        }
        public static string insertProduct(Product p)
        {
            string message = string.Empty;
            bool isInserted = false;

            //Utilizar el contexto para acceder a la base de datos
            using (ViperContext ctx = new ViperContext())
            {
                using (var ctxTran = ctx.Database.BeginTransaction())
                {
                    try
                    {
                        //Validar si la base de datos existe
                        bool isDataBaseExist = Database.Exists(ctx.Database.Connection);

                        if (isDataBaseExist)
                        {
                            //Validar si la tabla utilizada existe
                            bool isTableExist = ctx.Database
                         .SqlQuery<int?>(@"
                               SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'Product'")
                         .SingleOrDefault() != null;

                            if (isTableExist)
                            {
                                ctx.Products.Add(p);
                                isInserted = ctx.SaveChanges() > 0;

                                if (isInserted)
                                {
                                    if (isInserted == true && string.IsNullOrEmpty(message))
                                    {

                                        ctxTran.Commit();

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

                        ctxTran.Rollback();
                    }
                    catch (DbUpdateConcurrencyException ex)
                    {
                        var entity = ex.Entries.Single().GetDatabaseValues();

                        if (entity == null)
                            message = "The entity being updated is already deleted by another user";
                        else
                            message = "The entity being updated has already been updated by another user";

                        ctxTran.Rollback();
                    }
                    catch (DbUpdateException ex)
                    {
                        var exception = HandleDbUpdateException(ex);
                        message = exception.Message;

                        ctxTran.Rollback();
                    }
                }
            }

            return message;
        }
        public static DataTable getProducts()
        {
            List<Product> Products = new List<Product>();
            DataTable dt = new DataTable();
            //Utilizar el contexto para acceder a la base de datos
            using (ViperContext ctx = new ViperContext())
            {
                try
                {
                    //Validar si la base de datos existe
                    bool isDataBaseExist = Database.Exists(ctx.Database.Connection);

                    if (isDataBaseExist)
                    {
                        //Validar si la tabla utilizada existe
                        bool isTableExist = ctx.Database
                     .SqlQuery<int?>(@"
                         SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'Product'")
                     .SingleOrDefault() != null;

                        if (isTableExist)
                        {
                            //Recuperar el menu de opciones
                            var result = (from pr in ctx.Products
               
                                          select new
                                          {
                                              pr.BarCode,
                                              pr.Description,
                                              pr.Location,
                                              pr.ActiveSubstance,
                                              pr.QuantityPerUnit,
                                              pr.StandardCost,
                                              pr.ListPrice,
                                              pr.IVA
                                          }).ToList();

                            //Crear las columnas del DataTable
                            dt.Columns.AddRange(new DataColumn[]{
                                new DataColumn("BarCode", typeof(string)),
                                new DataColumn("Description", typeof(string)),
                                new DataColumn("Location", typeof(string)),
                                new DataColumn("ActiveSubstance", typeof(string)),
                                new DataColumn("QuantityPerUnit", typeof(string)),
                                new DataColumn("StandardCost", typeof(string)),
                                new DataColumn("ListPrice", typeof(string)),
                                new DataColumn("IVA", typeof(string))
                            });

                            //Guardar los datos recuperados en una fila del DataTable
                            result.ToList().ForEach(x =>
                            {
                                //Crear una fila nueva
                                var row = dt.NewRow();

                                //Cargar los datos de la fila
                                row["BarCode"] = x.BarCode;
                                row["Description"] = x.Description;
                                row["Location"] = x.Location;
                                row["ActiveSubstance"] = x.ActiveSubstance;
                                row["QuantityPerUnit"] = x.QuantityPerUnit;
                                row["StandardCost"] = x.StandardCost;
                                row["ListPrice"] = x.ListPrice;
                                row["IVA"] = x.IVA;

                                //Añadir fila al DataTable
                                dt.Rows.Add(row);
                            });
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }

            return dt;
        }
        public static DataTable getProduct(string BarCode)
        {
            List<Product> Products = new List<Product>();
            DataTable dt = new DataTable();
            //Utilizar el contexto para acceder a la base de datos
            using (ViperContext ctx = new ViperContext())
            {
                try
                {
                    //Validar si la base de datos existe
                    bool isDataBaseExist = Database.Exists(ctx.Database.Connection);

                    if (isDataBaseExist)
                    {
                        //Validar si la tabla utilizada existe
                        bool isTableExist = ctx.Database
                     .SqlQuery<int?>(@"
                         SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'Product'")
                     .SingleOrDefault() != null;

                        if (isTableExist)
                        {
                            //Recuperar el menu de opciones
                            var result = (from pr in ctx.Products
                                          where pr.BarCode==BarCode
                                          select new
                                          {
                                              pr.BarCode,
                                              pr.Description,
                                              pr.Location,
                                              pr.ActiveSubstance,
                                              pr.QuantityPerUnit,
                                              pr.StandardCost,
                                              pr.ListPrice,
                                              pr.IVA
                                          }).ToList();

                            //Crear las columnas del DataTable
                            dt.Columns.AddRange(new DataColumn[]{
                                new DataColumn("BarCode", typeof(string)),
                                new DataColumn("Description", typeof(string)),
                                new DataColumn("Location", typeof(string)),
                                new DataColumn("ActiveSubstance", typeof(string)),
                                new DataColumn("QuantityPerUnit", typeof(string)),
                                new DataColumn("StandardCost", typeof(string)),
                                new DataColumn("ListPrice", typeof(string)),
                                new DataColumn("IVA", typeof(string))
                            });

                            //Guardar los datos recuperados en una fila del DataTable
                            result.ToList().ForEach(x =>
                            {
                                //Crear una fila nueva
                                var row = dt.NewRow();

                                //Cargar los datos de la fila
                                row["BarCode"] = x.BarCode;
                                row["Description"] = x.Description;
                                row["Location"] = x.Location;
                                row["ActiveSubstance"] = x.ActiveSubstance;
                                row["QuantityPerUnit"] = x.QuantityPerUnit;
                                row["StandardCost"] = x.StandardCost;
                                row["ListPrice"] = x.ListPrice;
                                row["IVA"] = x.IVA;

                                //Añadir fila al DataTable
                                dt.Rows.Add(row);
                            });
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }

            return dt;
        }     
        public static DataTable getSuppliers()
        {
            List<Supplier> Supplier = new List<Supplier>();
            DataTable dt = new DataTable();
            //Utilizar el contexto para acceder a la base de datos
            using (ViperContext ctx = new ViperContext())
            {
                try
                {
                    //Validar si la base de datos existe
                    bool isDataBaseExist = Database.Exists(ctx.Database.Connection);

                    if (isDataBaseExist)
                    {
                        //Validar si la tabla utilizada existe
                        bool isTableExist = ctx.Database
                     .SqlQuery<int?>(@"
                         SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'Supplier'")
                     .SingleOrDefault() != null;

                        if (isTableExist)
                        {
                            //Recuperar el menu de opciones
                            var result = (from sp in ctx.Suppliers

                                          select new
                                          {
                                              sp.SupplierKey,
                                              sp.CompanyName,
                                              sp.ContactName,
                                              sp.PhoneNumber,
                                              sp.CellphoneNumber,
                                              sp.EmailAddress,
                                              sp.Comment,
                                              sp.DaysCredit
                                                                                        
                                          }).ToList();

                            //Crear las columnas del DataTable
                            dt.Columns.AddRange(new DataColumn[]{
                                new DataColumn("SupplierKey", typeof(string)),
                                new DataColumn("CompanyName", typeof(string)),
                                new DataColumn("ContactName", typeof(string)),
                                new DataColumn("PhoneNumber", typeof(string)),
                                new DataColumn("CellphoneNumber", typeof(string)),
                                new DataColumn("EmailAddress", typeof(string)),
                                new DataColumn("Comment", typeof(string)),
                                new DataColumn("DaysCredit", typeof(string))
                            });

                            //Guardar los datos recuperados en una fila del DataTable
                            result.ToList().ForEach(x =>
                            {
                                //Crear una fila nueva
                                var row = dt.NewRow();

                                //Cargar los datos de la fila
                                row["SupplierKey"] = x.SupplierKey;
                                row["CompanyName"] = x.CompanyName;
                                row["ContactName"] = x.ContactName;
                                row["PhoneNumber"] = x.PhoneNumber;
                                row["CellphoneNumber"] = x.CellphoneNumber;
                                row["EmailAddress"] = x.EmailAddress;
                                row["Comment"] = x.Comment;
                                row["DaysCredit"] = x.DaysCredit;

                                //Añadir fila al DataTable
                                dt.Rows.Add(row);
                            });
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }

            return dt;
        }  
        public static DataTable getSupplier(string supplierkey)
        {
            List<Supplier> Supplier = new List<Supplier>();
            DataTable dt = new DataTable();
            //Utilizar el contexto para acceder a la base de datos
            using (ViperContext ctx = new ViperContext())
            {
                try
                {
                    //Validar si la base de datos existe
                    bool isDataBaseExist = Database.Exists(ctx.Database.Connection);

                    if (isDataBaseExist)
                    {
                        //Validar si la tabla utilizada existe
                        bool isTableExist = ctx.Database
                     .SqlQuery<int?>(@"
                         SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'Supplier'")
                     .SingleOrDefault() != null;

                        if (isTableExist)
                        {
                            //Recuperar el menu de opciones
                            var result = (from sp in ctx.Suppliers
                                          where sp.SupplierKey == supplierkey
                                          select new
                                          {
                                              sp.SupplierKey,
                                              sp.CompanyName,
                                              sp.ContactName,
                                              sp.PhoneNumber,
                                              sp.CellphoneNumber,
                                              sp.EmailAddress,
                                              sp.Comment,
                                              sp.DaysCredit

                                          }).ToList();

                            //Crear las columnas del DataTable
                            dt.Columns.AddRange(new DataColumn[]{
                                new DataColumn("SupplierKey", typeof(string)),
                                new DataColumn("CompanyName", typeof(string)),
                                new DataColumn("ContactName", typeof(string)),
                                new DataColumn("PhoneNumber", typeof(string)),
                                new DataColumn("CellphoneNumber", typeof(string)),
                                new DataColumn("EmailAddress", typeof(string)),
                                new DataColumn("Comment", typeof(string)),
                                new DataColumn("DaysCredit", typeof(string))
                            });

                            //Guardar los datos recuperados en una fila del DataTable
                            result.ToList().ForEach(x =>
                            {
                                //Crear una fila nueva
                                var row = dt.NewRow();

                                //Cargar los datos de la fila
                                row["SupplierKey"] = x.SupplierKey;
                                row["CompanyName"] = x.CompanyName;
                                row["ContactName"] = x.ContactName;
                                row["PhoneNumber"] = x.PhoneNumber;
                                row["CellphoneNumber"] = x.CellphoneNumber;
                                row["EmailAddress"] = x.EmailAddress;
                                row["Comment"] = x.Comment;
                                row["DaysCredit"] = x.DaysCredit;

                                //Añadir fila al DataTable
                                dt.Rows.Add(row);
                            });
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }

            return dt;
        }

        public static List<Supplier> getSupList(int id)
        {
            List<Supplier> lista = new List<Supplier>();
            using (ViperContext ctx = new ViperContext())
            {
                try
                {
                    //Validar si la base de datos existe
                    bool isDataBaseExist = Database.Exists(ctx.Database.Connection);

                    if (isDataBaseExist)
                    {
                        //Validar si la tabla utilizada existe
                        bool isTableExist = ctx.Database
                     .SqlQuery<int?>(@"
                         SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'Supplier'")
                     .SingleOrDefault() != null;

                        if (isTableExist)
                        {
                            lista = ctx.Suppliers.Where(x => x.Id == id).OrderBy(x => x.SupplierKey).ToList();
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }
            return lista;

        }

        public static string sp_insert_supplier(Supplier sup, Address a, AddressSAT ads)
        {
            string message = string.Empty;
            bool isInserted = false;

            //Utilizar el contexto para acceder a la base de datos
            using (ViperContext ctx = new ViperContext())
            {
                using (var ctxTran = ctx.Database.BeginTransaction())
                {
                    try
                    {
                        //Validar si la base de datos existe
                        bool isDataBaseExist = Database.Exists(ctx.Database.Connection);

                        if (isDataBaseExist)
                        {
                            //Validar si la tabla utilizada existe
                            bool isTableExist = ctx.Database
                         .SqlQuery<int?>(@"
                               SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'Supplier' OR table_name='Address' OR table_name='AddressSAT'")
                         .SingleOrDefault() != null;

                            if (isTableExist)
                            {
                                ctx.Addresses.Add(a);
                                isInserted = ctx.SaveChanges() > 0;

                                if (isInserted)
                                {
                                    isInserted = false;

                                    var addressID = ctx.Addresses.OrderByDescending(x => x.Id).FirstOrDefault().Id;

                                    if (addressID > 0)
                                    {
                                        isInserted = false;
                                        ctx.AddressesSAT.Add(ads);
                                        isInserted = ctx.SaveChanges() > 0;
                                        var addressSATID = ctx.AddressesSAT.OrderByDescending(x => x.Id).FirstOrDefault().Id;

                                        if (addressSATID > 0)
                                        {
                                            if (isInserted)
                                            {
                                                isInserted = false;

                                                sup.AddressSATId = addressSATID;
                                                sup.AddressId = addressID;
                                                ctx.Suppliers.Add(sup);
                                                isInserted = ctx.SaveChanges() > 0;

                                                var supId = ctx.Companies.OrderByDescending(x => x.Id).FirstOrDefault().Id;
                                                if (supId > 0)
                                                {

                                                    if (isInserted == true && string.IsNullOrEmpty(message))
                                                    {

                                                        ctxTran.Commit();

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

                        ctxTran.Rollback();
                    }
                    catch (DbUpdateConcurrencyException ex)
                    {
                        var entity = ex.Entries.Single().GetDatabaseValues();

                        if (entity == null)
                            message = "The entity being updated is already deleted by another user";
                        else
                            message = "The entity being updated has already been updated by another user";

                        ctxTran.Rollback();
                    }
                    catch (DbUpdateException ex)
                    {
                        var exception = HandleDbUpdateException(ex);
                        message = exception.Message;

                        ctxTran.Rollback();
                    }
                }
            }

            return message;
        }


        public static DataTable getCustomers()
        {
            List<Customer> Customer = new List<Customer>();
            DataTable dt = new DataTable();
            //Utilizar el contexto para acceder a la base de datos
            using (ViperContext ctx = new ViperContext())
            {
                try
                {
                    //Validar si la base de datos existe
                    bool isDataBaseExist = Database.Exists(ctx.Database.Connection);

                    if (isDataBaseExist)
                    {
                        //Validar si la tabla utilizada existe
                        bool isTableExist = ctx.Database
                     .SqlQuery<int?>(@"
                         SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'Customer'")
                     .SingleOrDefault() != null;

                        if (isTableExist)
                        {
                            //Recuperar el menu de opciones
                            var result = (from sp in ctx.customers

                                          select new
                                          {
                                              sp.CustomerKey,
                                              sp.FullName,
                                              sp.ContactName,
                                              sp.PhoneNumber,
                                              sp.CellphoneNumber,
                                              sp.EmailAddress,
                                              sp.Comment,
                                              sp.DaysCredit

                                          }).ToList();

                            //Crear las columnas del DataTable
                            dt.Columns.AddRange(new DataColumn[]{
                                new DataColumn("CustomerKey", typeof(string)),
                                new DataColumn("FullName", typeof(string)),
                                new DataColumn("ContactName", typeof(string)),
                                new DataColumn("PhoneNumber", typeof(string)),
                                new DataColumn("CellphoneNumber", typeof(string)),
                                new DataColumn("EmailAddress", typeof(string)),
                                new DataColumn("Comment", typeof(string)),
                                new DataColumn("DaysCredit", typeof(string))
                            });

                            //Guardar los datos recuperados en una fila del DataTable
                            result.ToList().ForEach(x =>
                            {
                                //Crear una fila nueva
                                var row = dt.NewRow();

                                //Cargar los datos de la fila
                                row["CustomerKey"] = x.CustomerKey;
                                row["FullName"] = x.FullName;
                                row["ContactName"] = x.ContactName;
                                row["PhoneNumber"] = x.PhoneNumber;
                                row["CellphoneNumber"] = x.CellphoneNumber;
                                row["EmailAddress"] = x.EmailAddress;
                                row["Comment"] = x.Comment;
                                row["DaysCredit"] = x.DaysCredit;

                                //Añadir fila al DataTable
                                dt.Rows.Add(row);
                            });
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }

            return dt;
        }
        public static DataTable getCustomer(string customerkey)
        {
            List<Customer> Customer = new List<Customer>();
            DataTable dt = new DataTable();
            //Utilizar el contexto para acceder a la base de datos
            using (ViperContext ctx = new ViperContext())
            {
                try
                {
                    //Validar si la base de datos existe
                    bool isDataBaseExist = Database.Exists(ctx.Database.Connection);

                    if (isDataBaseExist)
                    {
                        //Validar si la tabla utilizada existe
                        bool isTableExist = ctx.Database
                     .SqlQuery<int?>(@"
                         SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'Customer'")
                     .SingleOrDefault() != null;

                        if (isTableExist)
                        {
                            //Recuperar el menu de opciones
                            var result = (from sp in ctx.customers
                                          where sp.CustomerKey==customerkey
                                          select new
                                          {
                                              sp.CustomerKey,
                                              sp.FullName,
                                              sp.ContactName,
                                              sp.PhoneNumber,
                                              sp.CellphoneNumber,
                                              sp.EmailAddress,
                                              sp.Comment,
                                              sp.DaysCredit

                                          }).ToList();

                            //Crear las columnas del DataTable
                            dt.Columns.AddRange(new DataColumn[]{
                                new DataColumn("CustomerKey", typeof(string)),
                                new DataColumn("FullName", typeof(string)),
                                new DataColumn("ContactName", typeof(string)),
                                new DataColumn("PhoneNumber", typeof(string)),
                                new DataColumn("CellphoneNumber", typeof(string)),
                                new DataColumn("EmailAddress", typeof(string)),
                                new DataColumn("Comment", typeof(string)),
                                new DataColumn("DaysCredit", typeof(string))
                            });

                            //Guardar los datos recuperados en una fila del DataTable
                            result.ToList().ForEach(x =>
                            {
                                //Crear una fila nueva
                                var row = dt.NewRow();

                                //Cargar los datos de la fila
                                row["CustomerKey"] = x.CustomerKey;
                                row["FullName"] = x.FullName;
                                row["ContactName"] = x.ContactName;
                                row["PhoneNumber"] = x.PhoneNumber;
                                row["CellphoneNumber"] = x.CellphoneNumber;
                                row["EmailAddress"] = x.EmailAddress;
                                row["Comment"] = x.Comment;
                                row["DaysCredit"] = x.DaysCredit;

                                //Añadir fila al DataTable
                                dt.Rows.Add(row);
                            });
                        }
                    }
                }
                catch (Exception ex)
                {

                }
            }

            return dt;
        }

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
