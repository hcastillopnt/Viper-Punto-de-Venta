using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viper.BusinessEntities;

namespace Viper.BusinessLogicLayer
{
    public class DropDownListHelperBLL
    {
        #region GetGendersDropDownList
        /// <summary>
        /// Metodo para obtener el sexo de una persona
        /// </summary>
        /// <returns>List</returns>
        public static List<Gender> GetGendersDropDownList()
        {
            return DataAccessLayer.DropDownListHelperDAL.GetGendersDropDownList();
        }
        #endregion

        #region GetMaritalStatusDropDownList
        /// <summary>
        /// Metodo para obtener el estado civil de una persona
        /// </summary>
        /// <returns>List</returns>
        public static List<MaritalStatus> GetMaritalStatusDropDownList()
        {
            return DataAccessLayer.DropDownListHelperDAL.GetMaritalStatusDropDownList();
        }
        #endregion

        #region GetAddressTypeDropDownList
        /// <summary>
        /// Metodo para obtener los tipos de domicilio
        /// </summary>
        /// <returns>List</returns>
        public static List<AddressType> GetAddressTypeDropDownList()
        {
            return Viper.DataAccessLayer.DropDownListHelperDAL.GetAddressTypeDropDownList();
        }
        #endregion

        #region GetRoadTypeDropDownList
        /// <summary>
        /// Metodo para obtener los tipos de vialidad
        /// </summary>
        /// <returns>List</returns>
        public static List<RoadType> GetRoadTypeDropDownList()
        {
            return DataAccessLayer.DropDownListHelperDAL.GetRoadTypeDropDownList();
        }
        #endregion

        #region GetCountryRegionDropDownList
        /// <summary>
        /// Metodo para obtener los estados de Mexico
        /// </summary>
        /// <returns>List</returns>
        public static List<CountryRegion> GetCountryDropDownList()
        {
            return DataAccessLayer.DropDownListHelperDAL.GetCountryRegionDropDownList();
        }
        #endregion

        #region GetStateProvinceDropDownList
        /// <summary>
        /// Metodo para obtener los estados de Mexico
        /// </summary>
        /// <returns>List</returns>
        public static List<StateProvince> GetStateProvinceDropDownList()
        {
            return DataAccessLayer.DropDownListHelperDAL.GetStateProvinceDropDownList();
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
            return DataAccessLayer.DropDownListHelperDAL.GetCityDropDownList(StateProvinceID);
        }
        #endregion
    }
}
