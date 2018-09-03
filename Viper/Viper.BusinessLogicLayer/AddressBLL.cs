using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viper.BusinessEntities;

namespace Viper.BusinessLogicLayer
{
    public class AddressBLL
    {
        #region procInsertAddressToSystem

        /// <summary>
        /// Metodo para registrar la direccion de un empleado, un negocio (licencia), un proveedor,
        /// una sucursal, entre otros objetos en el sistema viper
        /// </summary>
        /// <param name="entity">Entidad Direccion</param>
        /// <returns>Message</returns>
        public static string procInsertAddressToSystem(Address entity)
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
                message = DataAccessLayer.AddressDAL.procInsertAddressToSystem(entity);
            }

            //To return the value of the variable message
            return message;
        }

        #endregion

        #region procGetAddressObjectByAddressId

        /// <summary>
        /// Metodo para obtener los datos de la direccion que adquirio la licencia 
        /// del Sistema de Punto de Venta para Farmacias Viper
        /// </summary>
        /// <param name="AddressID">ID Direccion</param>
        /// <returns>Object</returns>
        public static Address procGetAddressObjectByAddressId(int AddressID)
        {
            Address address = null;

            address = DataAccessLayer.AddressDAL.procGetAddressObjectByAddressId(AddressID);

            return address;
        }

        #endregion

        #region procGetAddressSATObjectByAddressId

        /// <summary>
        /// Metodo para obtener los datos de la direccion fiscal que adquirio la licencia 
        /// del Sistema de Punto de Venta para Farmacias Viper
        /// </summary>
        /// <param name="AddressSATID">ID Direccion Fiscal</param>
        /// <returns>Object</returns>
        public static AddressSAT procGetAddressSATObjectByAddressId(int AddressSATID)
        {
            AddressSAT addressSAT = null;

            addressSAT = DataAccessLayer.AddressDAL.procGetAddressSATObjectByAddressId(AddressSATID);

            return addressSAT;
        }

        #endregion

        #region validateEmptyFieldsInForm

        /// <summary>
        /// Metodo para validar los espacios vacios de la entidad de direccion
        /// </summary>
        /// <param name="entity">Entidad Direccion</param>
        /// <returns>Message</returns>
        public static string validateEmptyFieldsInForm(Address entity)
        {
            //Variable to recover the messages of mistake produced in the layer of BusinessLogic
            String message = String.Empty;

            ICollection<ValidationResult> results = null;

            //To validate the entities of the class by means of the DataAnnotations assigned in the layer of BusinessEntities
            if (!validate(entity, out results))
            {
                message = String.Join("\n", results.Select(o => o.ErrorMessage));
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
