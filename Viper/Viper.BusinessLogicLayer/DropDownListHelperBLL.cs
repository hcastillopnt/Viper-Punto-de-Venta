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

        #region GetRolesDropDownList

        /// <summary>
        /// Metodo para obtener los roles para los usuarios
        /// </summary>
        /// <returns>List</returns>
        public static List<Role> GetRolesDropDownList()
        {
            return DataAccessLayer.DropDownListHelperDAL.GetRolesDropDownList();
        }

        #endregion

        #region GetDepartmentDropDownList

        /// <summary>
        /// Metodo para obtener los departamentos donde se puede desempeñar un empleado
        /// </summary>
        /// <returns>List</returns>
        public static List<Department> GetDepartmentDropDownList()
        {
            return DataAccessLayer.DropDownListHelperDAL.GetDepartmentDropDownList();
        }

        #endregion

        #region GetShiftDropDownList

        /// <summary>
        /// Metodo para obtener los horarios en los cuales puede trabajar un empleado
        /// </summary>
        /// <returns>List</returns>
        public static List<Shift> GetShiftDropDownList()
        {
            return DataAccessLayer.DropDownListHelperDAL.GetShiftDropDownList();
        }

        #endregion

        #region GetJobTitleDropDownList

        /// <summary>
        /// Metodo para obtener los puestos que puede tener un empleado
        /// </summary>
        /// <param name="DepartmentID">ID Departamento</param>
        /// <returns>List</returns>
        public static List<JobTitle> GetJobTitleDropDownList(int DepartmentID)
        {
            return DataAccessLayer.DropDownListHelperDAL.GetJobTitleDropDownList(DepartmentID);
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

        #region GetAbrevStateProvince

        /// <summary>
        /// Metodo para obtener la abreviatura del estado
        /// </summary>
        /// <param name="StateID">ID del estado</param>
        /// <returns>String</returns>
        public static String GetAbrevStateProvince(int StateID)
        {
            return DataAccessLayer.DropDownListHelperDAL.GetAbrevStateProvince(StateID);
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

        #region GetCityName
        /// <summary>
        /// Metodo para obtener el nombre del municipio
        /// </summary>
        /// <param name="cityID">ID Municipio</param>
        /// <returns>List</returns>
        public static String GetCityName(int cityID)
        {
            return DataAccessLayer.DropDownListHelperDAL.GetCityName(cityID);
        }
        #endregion
    }
}
