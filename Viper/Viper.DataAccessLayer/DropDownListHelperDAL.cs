using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viper.BusinessEntities;

namespace Viper.DataAccessLayer
{
    public class DropDownListHelperDAL
    {
        #region GetGendersDropDownList

        // <summary>
        // Metodo para obtener el sexo de una persona
        // </summary>
        // <returns>List</returns>
        public static List<Gender> GetGendersDropDownList()
        {
            List<Gender> items = new List<Gender>();

            using (ViperContext db = new ViperContext())
            {
                items = db.Genders.ToList();
                items.Add(new Gender { Id = -1, Name = "--SELECCIONE--" });

                return items.OrderBy(x => x.Id).ToList();
            }
        }

        #endregion

        #region GetMaritalStatusDropDownList

        /// <summary>
        /// Metodo para obtener el estado civil de una persona
        /// </summary>
        /// <returns>List</returns>
        public static List<MaritalStatus> GetMaritalStatusDropDownList()
        {
            List<MaritalStatus> items = new List<MaritalStatus>();

            using (ViperContext db = new ViperContext())
            {
                items = db.MaritalStatuses.ToList();
                items.Add(new MaritalStatus { Id = -1, Name = "--SELECCIONE--" });

                return items.OrderBy(x => x.Id).ToList();
            }
        }

        #endregion

        #region GetAddressTypeDropDownList

        /// <summary>
        /// Metodo para obtener los tipos de domicilio
        /// </summary>
        /// <returns>List</returns>
        public static List<AddressType> GetAddressTypeDropDownList()
        {
            List<AddressType> items = new List<AddressType>();

            using (ViperContext db = new ViperContext())
            {
                items = db.AddressTypes.ToList();
                items.Add(new AddressType { Id = -1, Name = "--SELECCIONE--" });

                return items.OrderBy(x => x.Id).ToList();
            }
        }

        #endregion

        #region GetRoadTypeDropDownList

        /// <summary>
        /// Metodo para obtener los tipos de vialidad
        /// </summary>
        /// <returns>List</returns>
        public static List<RoadType> GetRoadTypeDropDownList()
        {
            List<RoadType> items = new List<RoadType>();

            using (ViperContext db = new ViperContext())
            {
                items = db.RoadTypes.ToList();
                items.Add(new RoadType { Id = -1, Name = "--SELECCIONE--" });

                return items.OrderBy(x => x.Id).ToList();
            }
        }

        #endregion

        #region GetCountryRegionDropDownList

        public static List<CountryRegion> GetCountryRegionDropDownList()
        {
            List<CountryRegion> items = new List<CountryRegion>();

            using (ViperContext db = new ViperContext())
            {
                items = db.CountryRegions.ToList();
                items.Add(new CountryRegion { Id = -1, Descripcion = "--SELECCIONE--" });

                return items.OrderBy(x => x.Id).ToList();
            }
        }

        #endregion

        #region GetStateProvinceDropDownList

        /// <summary>
        /// Metodo para obtener los estados de Mexico
        /// </summary>
        /// <returns>List</returns>
        public static List<StateProvince> GetStateProvinceDropDownList()
        {
            List<StateProvince> items = new List<StateProvince>();

            using (ViperContext db = new ViperContext())
            {
                items = db.StateProvinces.Where(x => x.CountryRegionId == 159).ToList();
                items.Add(new StateProvince { Id = -1, Description = "--SELECCIONE--" });

                return items.OrderBy(x => x.Id).ToList();
            }
        }

        #endregion

        #region GetCityDropDownList

        /// <summary>
        /// Metodo para obtener los municipios de Mexico
        /// </summary>
        /// <param name="StateProvinceID">ID Estado</param>
        /// <returns>List</returns>
        public static List<City> GetCityDropDownList(int StateProvinceID)
        {
            List<City> items = new List<City>();

            using (ViperContext db = new ViperContext())
            {
                items = db.Cities.Where(x => x.CountryRegionId == 159 && x.StateProvinceId == StateProvinceID).ToList();
                items.Add(new City { Id = -1, Description = "--SELECCIONE--" });

                return items.OrderBy(x => x.Id).ToList();
            }
        }

        #endregion
    }
}
