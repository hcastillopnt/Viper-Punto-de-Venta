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
        #region procGetSitesByCompanyName

        /// <summary>
        /// Metodo para obtener todas las sucursales registradas por medio del nombre de la empresa
        /// registrada con una licencia adquirida
        /// </summary>
        /// <param name="CompanyName">Nombre de la Empresa</param>
        /// <returns>DataTable</returns>
        public static DataTable procGetSitesByCompanyName(string CompanyName)
        {
            DataTable dt = new DataTable();

            dt = DataAccessLayer.SiteDAL.procGetSitesByCompanyName(CompanyName);

            return dt;
        }

        #endregion

        #region procFindSiteBySiteName

        /// <summary>
        /// Metodo para obtener la sucursal en la cual se encuentra registrado el usuario
        /// que se logueo en el sistema viper
        /// </summary>
        /// <param name="siteName">Nombre de la sucursal</param>
        /// <returns>List</returns>
        public static List<Site> procFindSiteBySiteName(string siteName)
        {
            List<Site> sites = new List<Site>();

            sites = DataAccessLayer.SiteDAL.procFindSiteBySiteName(siteName);

            return sites;
        }

        #endregion

        #region procInsertSiteToSystem

        /// <summary>
        /// Metodo para registrar los datos de las sucursales que tiene ligadas la empresa
        /// que adquirio la licencia del sistema viper
        /// </summary>
        /// <param name="entity">Entidad Sucursal</param>
        /// <returns>Message</returns>
        public static string procInsertSiteToSystem(Site entity)
        {
            //Variable to recover the messages of mistake produced in the layer of BusinessLogic
            String message = String.Empty;

            ICollection<ValidationResult> results = null;

            //To validate the entities of the class by means of the DataAnnotations assigned in the layer of BusinessEntities
            if (!validate(entity, out results))
            {
                message = String.Join("\n", results.Select(o => o.ErrorMessage));
            }
            else
            {
                //If it does not contain mistakes, we proceed to realize the following operation
                //After validating quite the logic of business, one proceeds to realize the record by means of the layer DataAccess
                message = DataAccessLayer.SiteDAL.procInsertSiteToSystem(entity);
            }

            //To return the value of the variable message
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
