using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessLogicLayer
{
    public class UserBLL
    {
        #region procAuthorizeByLogin

        /// <summary>
        /// Metodo para iniciar sesion en la aplicacion, por medio del usuario y la contraseña encriptada
        /// con el metodo SHA1 
        /// </summary>
        /// <param name="us">Nombre de usuario</param>
        /// <param name="pwd">Contraseña encriptada</param>
        /// <returns>DataTable</returns>
        public static DataTable procAuthorizeByLogin(string usr, string pwd)
        {
            DataTable dt = new DataTable();

            String passwordEncrypted = EncryptionDecryption.EncriptarSHA1(pwd);

            dt = DataAccessLayer.UserDAL.procAuthorizeByLogin(usr, passwordEncrypted);

            return dt;
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
