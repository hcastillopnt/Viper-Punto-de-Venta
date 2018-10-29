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
            String loginID = entityEmployee.CURP;
            String pwdEncrypted = EncryptionDecryption.EncriptarSHA1("12345");
            String CURP = entityEmployee.CURP;
            ICollection<ValidationResult> results = null;

            try
            {
                bool isExistente = DataAccessLayer.EmployeeDAL.procIsCURPExists(CURP);

                if (isExistente)
                {
                    message = "Se ha denegado el registro, por duplicidad debido en el C.U.R.P. que se intenta que registrar";
                }
                else
                {
                    String RFC = entityEmployee.RFC;

                    isExistente = DataAccessLayer.EmployeeDAL.procIsRFCExists(RFC);

                    if (isExistente)
                    {
                        message = "Se ha denegado el registro, por duplicidad debido en el R.F.C que se intenta que registrar";
                    }
                    else
                    {
                        message = DataAccessLayer.UserDAL.procInsertUserToSystem(loginID, pwdEncrypted, RoleID);

                        if (String.IsNullOrEmpty(message))
                        {
                            int UserID = DataAccessLayer.UserDAL.procGetLastIDToUserRegistered(loginID);

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
                                            int EmployeeID = DataAccessLayer.EmployeeDAL.procGetLastIDToEmployeeRegistered();

                                            entityEDH.EmployeeId = EmployeeID;

                                            message = DataAccessLayer.EmployeeDAL.procInsertEmployeeHistoryToSystem(entityEDH);
                                        }
                                    }
                                }
                            }
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

        #region procGetEmployeesToDataTable

        /// <summary>
        /// Metodo para obtener todos los empleados registrados en el Sistema de Punto de Venta para Farmacias
        /// con Venta de Genericos
        /// </summary>
        /// <param name="CompanyID">Clave Empresa</param>
        /// <returns>DataTable</returns>
        public static DataTable procGetEmployeesToDataTable(int CompanyID)
        {
            DataTable dataTable = new DataTable();

            dataTable = DataAccessLayer.EmployeeDAL.procGetEmployeesToDataTable(CompanyID);

            return dataTable;
        }

        #endregion

        #region procGetEmployeesByNameToDataTable

        /// <summary>
        /// Metodo para buscar un empleado registrado en el Sistema de Punto de Venta para Farmacias
        /// con Venta de Genericos
        /// </summary>
        /// <param name="CompanyID">Clave Empresa</param>
        /// <param name="name">Nombre del Empleado</param>
        /// <returns>DataTable</returns>
        public static DataTable procGetEmployeesByNameToDataTable(int CompanyID, string name)
        {
            DataTable dataTable = new DataTable();

            dataTable = DataAccessLayer.EmployeeDAL.procGetEmployeesByNameToDataTable(CompanyID, name);

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
