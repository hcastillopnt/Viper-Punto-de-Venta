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
    public class SupplierBLL
    {
        #region procInsertSupplierToSystem

        /// <summary>
        /// Metodo para registrar los distintos proveedores de medicamento y otros,
        /// para trabajar con el Viper Sistema de Punto de Venta para Farmacias
        /// </summary>
        /// <param name="entitySupplier">Entidad Sucursal</param>
        /// <param name="entityAddress">Entidad Direccion</param>
        /// <returns>Message</returns>
        public static string procInsertSupplierToSystem(Supplier entitySupplier, Address entityAddress, int RoleID)
        {
            String message = String.Empty;
            String loginID = entitySupplier.RFC;
            String pwdEncrypted = EncryptionDecryption.EncriptarSHA1("admin");
            ICollection<ValidationResult> results = null;

            try
            {
                message = DataAccessLayer.UserDAL.procInsertUserToSystem(loginID, pwdEncrypted, RoleID);

                if (String.IsNullOrEmpty(message))
                {
                    int UserID = DataAccessLayer.UserDAL.procGetLastIDToUserRegisteredByRFC(loginID);

                    entitySupplier.UserId = UserID;

                    if (!validate(entitySupplier, out results))
                    {
                        message = String.Join("\n", results.Select(o => o.ErrorMessage));
                    }
                    else
                    {
                        if (!validate(entityAddress, out results))
                        {
                            message = String.Join("\n", results.Select(o => o.ErrorMessage));
                        }
                        else
                        {
                            message = DataAccessLayer.SupplierDAL.procInsertSupplierToSystem(entitySupplier, entityAddress);
                        }
                    }
                }
            }
            catch(Exception ex)
            {
                message = ex.Message;
            }

            return message;

        }

        #endregion

        #region procGetSuppliersToDataTable

        /// <summary>
        /// Metodo para obtener todos los proveedores registrados en el Sistema de Punto de Venta para Farmacias
        /// con Venta de Genericos
        /// </summary>
        /// <param name="folder">Folder donde se almacenan los logotipos de los proveedores</param>
        /// <returns>DataTable</returns>
        public static DataTable procGetSuppliersToDataTable(string folder)
        {
            DataTable dataTable = new DataTable();

            dataTable = DataAccessLayer.SupplierDAL.procGetSuppliersToDataTable(folder);

            return dataTable;
        }

        #endregion

        #region procGetSuppliersByNameToDataTable

        /// <summary>
        /// Metodo para buscar un proveedor registrado en el Sistema de Punto de Venta para Farmacias
        /// con Venta de Genericos
        /// </summary>
        /// <param name="name">Proveedor</param>
        /// <param name="folder">Folder donde se almacenan los logotipos de los proveedores</param>
        /// <returns>DataTable</returns>
        public static DataTable procGetSuppliersByNameToDataTable(string name, string folder)
        {
            DataTable dataTable = new DataTable();

            dataTable = DataAccessLayer.SupplierDAL.procGetSuppliersByNameToDataTable(name, folder);

            return dataTable;
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
