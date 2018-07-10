using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viper.BusinessEntities;

namespace Viper.BusinessLogicLayer
{
    public class CRUDCompanyBLL
    {
        #region insertarEmpresa
        public static string sp_insert_company(Address a, Company c, AddressSAT ads, Employee e, User m)
        {
            ICollection<ValidationResult> results = null;
            string message = string.Empty;

            if (!Validate(a, out results))
            {
                message = String.Join("\n", results.Select(o => o.ErrorMessage));
            }
            else
            {




                if (!Validate(ads, out results))
                {
                    message = String.Join("\n", results.Select(o => o.ErrorMessage));
                }
                else
                {
                    if (!Validate(c, out results))
                    {
                        message = String.Join("\n", results.Select(o => o.ErrorMessage));
                    }
                    else
                    {
                        if (!Validate(e, out results))
                        {
                            message = String.Join("\n", results.Select(o => o.ErrorMessage));
                        }
                        else
                        {
                            if (!Validate(m, out results))
                            {
                                message = String.Join("\n", results.Select(o => o.ErrorMessage));
                            }
                            else
                            {
                                message = DataAccessLayer.CRUDCompanyDAL.sp_insert_company(c, a, ads, e, m);

                            }
                        }
                    }
                }


            }

            return message;
        }
        #endregion

        public static string checkCompanyName()
        {
            return DataAccessLayer.CRUDCompanyDAL.checkCompanyName();
        }

        public static int checkIdCompany()
        {
            return DataAccessLayer.CRUDCompanyDAL.checkIdCompany();
        }

        public static string checkEmpId()
        {
            return DataAccessLayer.CRUDCompanyDAL.checkEmployeeNumber();
        }

        public static string checkCompId()
        {
            return DataAccessLayer.CRUDCompanyDAL.checkCompanyNumber();
        }

        public static string codigoSucursal(string municipio, string colonia)
        {
            return DataAccessLayer.CRUDCompanyDAL.codigoSucursal(municipio, colonia);
        }
        public static bool delete_company(int id)
        {
            return DataAccessLayer.CRUDCompanyDAL.delete_company(id);
        }

        public static bool update_company(Company c)
        {
            return DataAccessLayer.CRUDCompanyDAL.update_company(c);
        }

        public static List<Company> getCompanies()
        {
            List<Company> companies = new List<Company>();

            companies = DataAccessLayer.CRUDCompanyDAL.getCompanies();

            return companies;
        }

        public static List<Site> getSites(int comp_id)
        {
            List<Site> sites= new List<Site>();

            sites = DataAccessLayer.CRUDCompanyDAL.getSites(comp_id);

            return sites;
        }

        public static DataTable getProducts()
        {
            return DataAccessLayer.CRUDCompanyDAL.getProducts();
        }

        public static DataTable getProduct(string barcode)
        {
            return DataAccessLayer.CRUDCompanyDAL.getProduct(barcode);
        }

        public static DataTable getSuppliers()
        {
            return DataAccessLayer.CRUDCompanyDAL.getSuppliers();
        }

        public static DataTable getSupplier(string supplierkey)
        {
            return DataAccessLayer.CRUDCompanyDAL.getSupplier(supplierkey);
        }

        public static DataTable getCustomers()
        {
            return DataAccessLayer.CRUDCompanyDAL.getCustomers();
        }

        public static DataTable getCustomer(string customerkey)
        {
            return DataAccessLayer.CRUDCompanyDAL.getCustomer(customerkey);
        }

        #region Validate<T>
        public static bool Validate<T>(T obj, out ICollection<ValidationResult> results)
        {
            results = new List<ValidationResult>();

            return Validator.TryValidateObject(obj, new ValidationContext(obj), results, true);
        }
        #endregion
    }
}
