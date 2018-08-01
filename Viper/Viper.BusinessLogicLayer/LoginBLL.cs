using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessLogicLayer
{
    public class LoginBLL
    {
        #region authorize_by_credentials
        /// <summary>
        /// metodo para iniciar sesion
        /// </summary>
        /// <param name="us">parametro para nombre de usuario</param>
        /// <param name="pwd">parametro para contraseña</param>
        /// <returns>mensaje</returns>
        public static DataTable authorize_by_credentials(string us, string pwd)
        {
            DataTable dt = new DataTable();

            string passwordEncrypted = EncryptionDecryption.EncriptarSHA1(pwd);

            dt = DataAccessLayer.LoginDAL.authorize_by_credentials(us, passwordEncrypted);

            if (dt.Rows.Count > 0)
            {
                return dt;
            }
            else
            {
                dt = null;
                return dt;
            }
        }
        #endregion
    }
}
