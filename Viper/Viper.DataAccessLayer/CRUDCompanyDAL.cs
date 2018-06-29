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

namespace Viper.DataAccessLayer
{
    public class CRUDCompanyDAL
    {
        public static ViperContext db = new ViperContext();

        #region insertarEmpresa
        public static string sp_insert_company(Company c, Address a, AddressSAT ads, Employee e, User m)
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
                               SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'Company' OR table_name='Address' OR table_name='AddressSAT'")
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

                                                c.AddressSATId = addressSATID;
                                                c.AddressId = addressID;
                                                ctx.Companies.Add(c);
                                                isInserted = ctx.SaveChanges() > 0;

                                                var companyId = ctx.Companies.OrderByDescending(x => x.Id).FirstOrDefault().Id;
                                                if (companyId > 0)
                                                {
                                                    if (isInserted)
                                                    {
                                                        e.AddressId = addressID;
                                                        ctx.Employees.Add(e);
                                                        isInserted = ctx.SaveChanges() > 0;

                                                        var employeeId = ctx.Employees.OrderByDescending(x => x.Id).FirstOrDefault().Id;
                                                        if (companyId > 0)
                                                        {
                                                            if (isInserted)
                                                            {
                                                                isInserted = false;
                                                                m.EmployeeId = employeeId;
                                                                ctx.Memberships.Add(m);
                                                                isInserted = ctx.SaveChanges() > 0;

                                            
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
            comp.AccountBankId = c.AccountBankId;
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
