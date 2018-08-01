using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viper.BusinessLogicLayer
{
    public class EmployeeBLL
    {
        #region updatePassword
        /// <summary>
        /// Update password form oompany administrator
        /// </summary>
        /// <param name="pwd">Password</param>
        /// <param name="entityID">Entity ID</param>
        /// <returns>Message</returns>
        public static string updatePassword(string pwd, int entityID)
        {
            //Variable to recover the messages of mistake produced in the layer of BusinessLogic
            string message = string.Empty;

            if (string.IsNullOrEmpty(pwd) && entityID == 0)
            {
                message = "Favor de introducir la contraseña a actualizar";
            }
            else
            {
                //To encrypt the password by means of the algorithm SHA1
                string PasswordEncrypted = EncryptionDecryption.EncriptarSHA1(pwd);

                //After validating quite the logic of business, one proceeds to realize the record by means of the layer DataAccess
                message = DataAccessLayer.EmployeeDAL.updatePassword(PasswordEncrypted, entityID);
            }

            //To return the value of the variable message
            return message;
        }
        #endregion
    }
}
