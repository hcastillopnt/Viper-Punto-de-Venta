using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viper.BusinessEntities;

namespace Viper.BusinessLogicLayer
{
    public class EmployeeBLL
    {
        #region procRegisterEmployee

        /// <summary>
        /// Metodo para registrar los empleados para trabajar con el 
        /// Viper Sistema de Punto de Venta para Farmacias
        /// <param name="entityAddress">Entidad Direccion</param>
        /// <param name="entityEmployee">Entidad Empleado</param>
        /// <param name="entityEDH">Entidad Historial del Empleado</param>
        /// <param name="RoleID">ID del Tipo de Rol</param>
        /// <returns>Message</returns>
        public static string procRegisterEmployee(Address entityAddress, Employee entityEmployee, EmployeeDepartmentHistory entityEDH, int RoleID)
        {
            String message = String.Empty;

            ICollection<ValidationResult> results = null;

            String loginID = entityEmployee.CURP;
            String pwdEncrypted = EncryptionDecryption.EncriptarSHA1("12345");

            message = DataAccessLayer.UserDAL.procInsertUserToSystem(loginID, pwdEncrypted, RoleID);

            if (String.IsNullOrEmpty(message))
            {
                int UserID = DataAccessLayer.UserDAL.procGetLastIDToUserRegistered();

                entityEmployee.EmployeeNumber = DataAccessLayer.EmployeeDAL.procObtainEmployeeNumberGeneratedAutomatic();
                entityEmployee.UserId = UserID;

                if (!validate(entityAddress, out results))
                {
                    message = String.Join("\n", results.Select(o => o.ErrorMessage));
                }
                else
                {
                    if (!validate(entityEmployee, out results))
                    {
                        message = String.Join("\n", results.Select(o => o.ErrorMessage));
                    }
                    else
                    {
                        message = DataAccessLayer.EmployeeDAL.procInsertEmployeeToSystem(entityAddress, entityEmployee);

                        if (String.IsNullOrEmpty(message))
                        {
                            if (!validate(entityEDH, out results))
                            {
                                message = String.Join("\n", results.Select(o => o.ErrorMessage));
                            }
                            else
                            {
                                message = DataAccessLayer.EmployeeDAL.procInsertEmployeeHistoryToSystem(entityEDH);
                            }
                        }
                    }
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
