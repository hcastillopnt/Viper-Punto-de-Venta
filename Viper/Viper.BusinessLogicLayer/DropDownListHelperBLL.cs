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
        //public static List<Gender> GetGendersDropDownList()
        //{
        //    return DataAccess.DropDownListHelperDAL.GetGendersDropDownList();
        //}
        #endregion

        #region GetMaritalStatusDropDownList
        /// <summary>
        /// Metodo para obtener el estado civil de una persona
        /// </summary>
        /// <returns>List</returns>
        //public static List<MaritalStatus> GetMaritalStatusDropDownList()
        //{
        //    return DataAccess.DropDownListHelperDAL.GetMaritalStatusDropDownList();
        //}
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

        #region GetCountry
        /// <summary>
        /// Metodo para obtener los estados de Mexico
        /// </summary>
        /// <returns>List</returns>
        public static List<CountryRegion> GetCountry()
        {
            return DataAccessLayer.DropDownListHelperDAL.GetCountry();
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

        #region GetPhoneNumberType
        /// <summary>
        /// Metodo para obtener los tipos de numero de telefono
        /// </summary>
        /// <returns>List</returns>
        //public static List<PhoneNumberType> GetPhoneNumberType()
        //{
        //    return DataAccess.DropDownListHelperDAL.GetPhoneNumberType();
        //}
        #endregion

        #region GetProductCategories
        /// <summary>
        /// Metodo para obtener las categorias de un producto
        /// </summary>
        /// <returns>List</returns>
        //public static List<ProductCategory> GetProductCategories()
        //{
        //    return DataAccess.DropDownListHelperDAL.GetProductCategories();
        //}
        #endregion

        #region GetProductSubCategories
        /// <summary>
        /// Metodo para obtener las subcategorias a la que pertenece un producto
        /// </summary>
        /// <param name="ProductCategoryID">ID de la Cateogoria del Producto</param>
        /// <returns></returns>
        //public static List<ProductSubCategory> GetProductSubCategories(int ProductCategoryID)
        //{
        //    return DataAccess.DropDownListHelperDAL.GetProductSubCategories(ProductCategoryID);
        //}
        #endregion
    }
}
