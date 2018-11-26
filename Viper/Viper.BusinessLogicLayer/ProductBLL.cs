using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;
using Viper.BusinessEntities;

namespace Viper.BusinessLogicLayer
{
    public class ProductBLL
    {
        #region procRegisterProduct

        /// <summary>
        /// Metodo para registrar los productos para vender con el 
        /// Viper Sistema de Punto de Venta para Farmacias
        /// </summary>
        /// <param name="entityProduct">Entidad Producto</param>
        /// <param name="UnitsInStock">Stock Actual</param>
        /// <param name="SiteID">ID Sucursal</param>
        /// <returns>Message</returns>
        public static string procRegisterProduct(Product entityProduct, int UnitsInStock, int SiteID)
        {
            String message = String.Empty;
            ICollection<ValidationResult> results = null;

            if (!validate(entityProduct, out results))
            {
                message = String.Join("\n", results.Select(o => o.ErrorMessage));
            }
            else
            {
                if (string.IsNullOrEmpty(message))
                {
                    message = DataAccessLayer.ProductDAL.procInsertProductToSystem(entityProduct, UnitsInStock, SiteID);
                }
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
