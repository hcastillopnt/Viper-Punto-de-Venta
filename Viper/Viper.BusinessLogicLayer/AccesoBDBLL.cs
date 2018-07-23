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
    public class AccesoBDBLL
    {
        
        public static string insertarSucursal(Site s, Address a)
        {
            return DataAccessLayer.AccesoBDDAL.sp_insert_sucursal(s, a);
        }

        public static string checkCompanyName()
        {
            return DataAccessLayer.AccesoBDDAL.checkCompanyName();
        }

        public static int checkIdCompany()
        {
            return DataAccessLayer.AccesoBDDAL.checkIdCompany();
        }

        public static string checkEmpId()
        {
            return DataAccessLayer.AccesoBDDAL.checkEmployeeNumber();
        }

        public static string checkCompId()
        {
            return DataAccessLayer.AccesoBDDAL.checkCompanyNumber();
        }

        public static string codigoSucursal(string municipio, string colonia)
        {
            return DataAccessLayer.AccesoBDDAL.codigoSucursal(municipio, colonia);
        }
        public static bool delete_company(int id)
        {
            return DataAccessLayer.AccesoBDDAL.delete_company(id);
        }

        public static bool update_company(Company c)
        {
            return DataAccessLayer.AccesoBDDAL.update_company(c);
        }

        public static List<Supplier> getSupplierId(int id)
        {
            List<Supplier> lista = new List<Supplier>();

            lista = DataAccessLayer.AccesoBDDAL.getSupList(id);

            return lista;
        }

        public static string insertSup(Supplier sup, Address ad, AddressSAT ads)
        {
            return DataAccessLayer.AccesoBDDAL.sp_insert_supplier(sup, ad, ads);
        }

        public static List<Company> getCompanies()
        {
            List<Company> companies = new List<Company>();

            companies = DataAccessLayer.AccesoBDDAL.getCompanies();

            return companies;
        }

        public static List<Site> getSites(int comp_id)
        {
            List<Site> sites= new List<Site>();

            sites = DataAccessLayer.AccesoBDDAL.getSites(comp_id);

            return sites;
        }

        public static string insertProduct(Product p)
        {
            return DataAccessLayer.AccesoBDDAL.insertProduct(p);
        }
        public static DataTable getProducts()
        {
            return DataAccessLayer.AccesoBDDAL.getProducts();
        }

        public static DataTable getProduct(string barcode)
        {
            return DataAccessLayer.AccesoBDDAL.getProduct(barcode);
        }

        public static DataTable getSuppliers()
        {
            return DataAccessLayer.AccesoBDDAL.getSuppliers();
        }

        public static DataTable getSupplier(string supplierkey)
        {
            return DataAccessLayer.AccesoBDDAL.getSupplier(supplierkey);
        }

        public static DataTable getCustomers()
        {
            return DataAccessLayer.AccesoBDDAL.getCustomers();
        }

        public static DataTable getCustomer(string customerkey)
        {
            return DataAccessLayer.AccesoBDDAL.getCustomer(customerkey);
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
