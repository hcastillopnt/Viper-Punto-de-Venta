using System;
using System.Collections.Generic;
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
    }
}
