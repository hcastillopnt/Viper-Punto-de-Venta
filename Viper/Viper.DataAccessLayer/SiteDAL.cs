using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viper.BusinessEntities;

namespace Viper.DataAccessLayer
{
    public class SiteDAL
    {
        #region getSitesByCompany

        /// <summary>
        /// Metodo para obtener todas las sucursales registradas de tal compañia
        /// </summary>
        /// <param name="CompanyName">Company Name</param>
        /// <returns>DataTable</returns>
        public static DataTable getSitesByCompany(string CompanyName)
        {
            bool isExistente = false;

            //Se crea el DataTable
            DataTable dt = new DataTable();

            //Crear las columnas del DataTable
            dt.Columns.AddRange(new DataColumn[]{
                                new DataColumn("Id", typeof(int)),
                                new DataColumn("Site", typeof(string))
                            });

            using (ViperDbContext dbCtx = new ViperDbContext())
            {
                isExistente = Database.Exists(dbCtx.Database.Connection);

                if (isExistente)
                {
                    var result = (from s in dbCtx.Sites
                                  join c in dbCtx.Companies on s.CompanyId equals c.Id
                                  where c.CompanyName == CompanyName
                                  select new
                                  {
                                      s.Id,
                                      Site = s.UniquePhysicalID + " " + s.SiteName
                                  }).ToList();

                    //Crear una fila nueva
                    var rowBlank = dt.NewRow();

                    //Cargar los datos de la fila
                    rowBlank["Id"] = -1;
                    rowBlank["Site"] = "--SELECCIONE--";

                    //Añadir fila al DataTable
                    dt.Rows.Add(rowBlank);

                    //Guardar los datos recuperados en una fila del DataTable
                    result.ToList().ForEach(x =>
                    {
                        //Crear una fila nueva
                        var row = dt.NewRow();

                        //Cargar los datos de la fila
                        row["Id"] = x.Id;
                        row["Site"] = x.Site;

                        //Añadir fila al DataTable
                        dt.Rows.Add(row);
                    });
                }
            }

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
            bool isExistente = false;

            List<Site> sites = new List<Site>();

            using (ViperDbContext dbCtx = new ViperDbContext())
            {
                isExistente = Database.Exists(dbCtx.Database.Connection);

                if (isExistente)
                {
                    sites = dbCtx.Sites.Where(x => x.SiteName == siteName).ToList();
                }
            }

            return sites;
        }

        #endregion
    }
}
