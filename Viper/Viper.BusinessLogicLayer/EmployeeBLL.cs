﻿using System;
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
        #region procInsertEmployeeToSystem

        /// <summary>
        /// Metodo para registrar los empleados para trabajar con el 
        /// Viper Sistema de Punto de Venta para Farmacias
        /// <param name="entityAddress">Entidad Direccion</param>
        /// <param name="entityEmployee">Entidad Empleado</param>
        /// <param name="entityEDH">Entidad Historial del Empleado</param>
        /// <param name="roleID">ID del Tipo de Rol</param>
        /// <returns>Message</returns>
        public static string procInsertEmployeeToSystem(Address entityAddress, Employee entityEmployee, EmployeeDepartmentHistory entityEDH, int roleID)
        {
            String message = String.Empty;
            String CURP = entityEmployee.CURP;
            String RFC = entityEmployee.RFC;
            String loginID = entityEmployee.CURP;
            String pwdEncrypted = EncryptionDecryption.EncriptarSHA1("12345");

            ICollection<ValidationResult> results = null;

            bool isExistente = DataAccessLayer.EmployeeDAL.procIsCURPExists(CURP);

            if (isExistente)
            {
                message = "Se ha denegado el registro, por duplicidad debido en el C.U.R.P. que se intenta que registrar";
            }
            else
            {
                isExistente = DataAccessLayer.EmployeeDAL.procIsRFCExists(RFC);

                if (isExistente)
                {
                    message = "Se ha denegado el registro, por duplicidad debido en el R.F.C que se intenta que registrar";
                }
                else
                {
                    if (String.IsNullOrEmpty(message))
                    {
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
                                if (!validate(entityEDH, out results))
                                {
                                    message = String.Join("\n", results.Select(o => o.ErrorMessage));
                                }
                                else
                                {
                                    message = DataAccessLayer.EmployeeDAL.procInsertEmployeeToSystem(loginID, pwdEncrypted, roleID, entityAddress, entityEmployee, entityEDH);
                                }
                            }
                        }
                    }
                }
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
        /// <param name="folder">Folder donde se almacenan los logotipos de los proveedores</param>
        /// <returns>DataTable</returns>
        public static DataTable procGetEmployeesToDataTable(int CompanyID, string folder)
        {
            DataTable dataTable = new DataTable();

            dataTable = DataAccessLayer.EmployeeDAL.procGetEmployeesToDataTable(CompanyID, folder);

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
        /// <param name="folder">Folder donde se almacenan los logotipos de los proveedores</param>
        /// <returns>DataTable</returns>
        public static DataTable procGetEmployeesByNameToDataTable(int CompanyID, string name, string folder)
        {
            DataTable dataTable = new DataTable();

            dataTable = DataAccessLayer.EmployeeDAL.procGetEmployeesByNameToDataTable(CompanyID, name, folder);

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
