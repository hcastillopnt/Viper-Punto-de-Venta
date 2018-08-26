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
    public class SiteBLL
    {
        #region getSitesByCompany
        /// <summary>
        /// Metodo para obtener todas las sucursales registradas de tal compañia
        /// </summary>
        /// <param name="CompanyName">Company Name</param>
        /// <returns>DataTable</returns>
        public static DataTable getSitesByCompany(string CompanyName)
        {
            DataTable dt = new DataTable();

            dt = DataAccessLayer.SiteDAL.getSitesByCompany(CompanyName);

            return dt;
        }
        #endregion

        #region findSiteBySiteName
        /// <summary>
        /// Metodo para obtener la sucursal en la cual se encuentra logueado el usuario
        /// </summary>
        /// <param name="siteName">Name of Site</param>
        /// <returns>List</returns>
        public static List<Site> findSiteBySiteName(string siteName)
        {
            List<Site> sites = new List<Site>();

            sites = DataAccessLayer.SiteDAL.findSiteBySiteName(siteName);

            return sites;
        }
        #endregion

        #region sp_insert_site

        /// <summary>
        /// Metodo para registrar los datos generales de la sucursal a registrar
        /// </summary>
        /// <param name="site">Objeto Sucursal</param>
        /// <returns>Mensaje (String)</returns>
        public static string sp_insert_site(Site site)
        {
            //Variable to recover the messages of mistake produced in the layer of BusinessLogic
            string message = string.Empty;

            //To validate the entities of the class by means of the DataAnnotations assigned in the layer of BusinessEntities
            message = validateWithDataAnnotations(site);

            //If it does not contain mistakes, we proceed to realize the following operation
            if (string.IsNullOrEmpty(message))
            {
                //After validating quite the logic of business, one proceeds to realize the record by means of the layer DataAccess
                message = DataAccessLayer.SiteDAL.sp_insert_site(site);
            }

            //To return the value of the variable message
            return message;
        }

        #endregion

        #region validateWithDataAnnotations

        /// <summary>
        /// 
        /// </summary>
        /// <param name="site"></param>
        /// <returns></returns>
        public static string validateWithDataAnnotations(Site site)
        {
            ICollection<ValidationResult> results = null;
            string message = String.Empty;

            if (!validate(site, out results))
            {
                message = String.Join("\n", results.Select(o => o.ErrorMessage));
            }

            return message;
        }

        #endregion

        #region validate<T>

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="obj"></param>
        /// <param name="results"></param>
        /// <returns></returns>
        public static bool validate<T>(T obj, out ICollection<ValidationResult> results)
        {
            results = new List<ValidationResult>();

            return Validator.TryValidateObject(obj, new ValidationContext(obj), results, true);
        }

        #endregion
    }
}
