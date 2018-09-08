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
    public class CompanyBLL
    {
        #region procInsertCompanyToSystem

        /// <summary>
        /// Metodo para registrar las licencias adquiridas por diferentes negocios,
        /// para trabajar con el Viper Sistema de Punto de Venta para Farmacias
        /// </summary>
        /// <param name="entityCompany">Entidad Empresa</param>
        /// <param name="entityAddress">Entidad Direccion</param>
        /// <param name="entityAddressSAT">Entidad Direccion Fiscal</param>
        /// <param name="RoleID">ID del Rol</param>
        /// <param name="entitySite">Entidad Sucursal</param>
        /// <returns>Message</returns>
        public static string procInsertCompanyToSystem(Company entityCompany, Address entityAddress, AddressSAT entityAddressSAT, int RoleID, Site entitySite)
        {
            String message = String.Empty;

            ICollection<ValidationResult> results = null;

            String companyName = entityCompany.CompanyName;
            String RFC = entityCompany.RFC;

            bool isCompanyRegistered = DataAccessLayer.CompanyDAL.procIsCompanyRegisteredToDataBase(companyName, RFC);

            if (isCompanyRegistered)
            {
                message = "Los datos de la licencia que intenta registrar ya existen en nuestra base de datos, favor de verificar los datos";
            }
            else
            {
                String loginID = entityCompany.RFC;
                String pwdEncrypted = EncryptionDecryption.EncriptarSHA1("admin");

                message = DataAccessLayer.UserDAL.procInsertUserToSystem(loginID, pwdEncrypted, RoleID);

                if (String.IsNullOrEmpty(message))
                {
                    int UserID = DataAccessLayer.UserDAL.procGetLastIDToUserRegistered();

                    entityCompany.UserId = UserID;

                    if (!validate(entityCompany, out results))
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
                            if (!validate(entityAddressSAT, out results))
                            {
                                message = String.Join("\n", results.Select(o => o.ErrorMessage));
                            }
                            else
                            {
                                if (!validate(entitySite, out results))
                                {
                                    message = String.Join("\n", results.Select(o => o.ErrorMessage));
                                }
                                else
                                {
                                    message = DataAccessLayer.CompanyDAL.procInsertCompanyToSystem(entityCompany, entityAddress, entityAddressSAT, entitySite);
                                }
                            }
                        }
                    }
                }
            }

            return message;

        }

        #endregion

        #region procIsCompanyRegistered

        /// <summary>
        /// Metodo para saber si existen compañias registradas en la BD
        /// </summary>
        /// <returns>Boolean</returns>
        public static bool procIsCompanyRegistered()
        {
            bool isCompaniesRegistered = false;

            isCompaniesRegistered = DataAccessLayer.CompanyDAL.procIsCompanyRegistered();

            return isCompaniesRegistered;
        }

        #endregion

        #region procObtainCompanyKeyGeneratedAutomatic

        /// <summary>
        /// Metodo para obtener la clave de la compañia para poder loguearse en la app web/app movil
        /// </summary>
        /// <returns>Clave</returns>
        public static string obtainCompanyKeyGeneratedAutomatic()
        {
            //Variable to recover the key of the company
            String companyKey = String.Empty;

            //To obtain the key of the company by means of the layer DataAccess
            companyKey = DataAccessLayer.CompanyDAL.procObtainCompanyKeyGeneratedAutomatic();

            //To return the value of the variable companyKey
            return companyKey;
        }

        #endregion

        #region procFindRegimenFiscalByID

        /// <summary>
        /// Metodo para obtener el regimen fiscal en base al ID
        /// </summary>
        /// <param name="RegimenID">ID Regimen Fiscal</param>
        /// <returns>Regimen Fiscal</returns>
        public static string procFindRegimenFiscalByID(int RegimenID)
        {
            string RegimenFiscal = String.Empty;

            RegimenFiscal = DataAccessLayer.CompanyDAL.procFindRegimenFiscalByID(RegimenID);

            return RegimenFiscal;
        }

        #endregion

        #region procGetCompanyObjectByCompanyID

        /// <summary>
        /// Metodo para obtener los datos de la empresa que adquirio la licencia 
        /// del Sistema de Punto de Venta para Farmacias Viper
        /// </summary>
        /// <param name="CompanyID">ID Compañia</param>
        /// <returns>Object</returns>
        public static Company procGetCompanyObjectByCompanyID(int CompanyID)
        {
            Company company = null;

            company = DataAccessLayer.CompanyDAL.procGetCompanyObjectByCompanyID(CompanyID);

            return company;
        }

        #endregion

        #region procGetRegimenFiscalToDataTable

        /// <summary>
        /// Metodo para obtener los regimenes fiscales existentes en la base de datos
        /// </summary>
        /// <returns>DataTable</returns>
        public static DataTable procGetRegimenFiscalToDataTable()
        {
            DataTable dataTable = null;

            dataTable = DataAccessLayer.CompanyDAL.procGetRegimenFiscalToDataTable();

            return dataTable;
        }

        #endregion

        #region procGetRegimenFiscalByNameToDataTable

        /// <summary>
        /// Metodo para filtrar los regimenes fiscales existentes en la base de datos 
        /// </summary>
        /// <param name="filter">Regimen Fiscal</param>
        /// <returns>DataTable</returns>
        public static DataTable procGetRegimenFiscalByNameToDataTable(string filter)
        {
            DataTable dataTable = new DataTable();

            dataTable = DataAccessLayer.CompanyDAL.procGetRegimenFiscalByNameToDataTable(filter);

            return dataTable;
        }

        #endregion

        #region procGetRegimenFiscalIdByName

        /// <summary>
        /// Metodo para obtener el ID del regimen fiscal
        /// </summary>
        /// <param name="RegimenFiscalName">Nombre del Regimen Fiscal</param>
        /// <returns>ID</returns>
        public static int procGetRegimenFiscalIdByName(string RegimenFiscalName)
        {
            int RegimenID = 0;

            RegimenID = DataAccessLayer.CompanyDAL.procGetRegimenFiscalIdByName(RegimenFiscalName);

            return RegimenID;
        }

        #endregion

        #region procGetCompanyIdByName

        /// <summary>
        /// Metodo para obtener el ID de la compañia por medio del nombre de la compañia
        /// </summary>
        /// <param name="companyName">Nombre de la Compañia</param>
        /// <returns>ID</returns>
        public static int procGetCompanyIdByName(string companyName)
        {
            int CompanyID = 0;

            CompanyID = DataAccessLayer.CompanyDAL.procGetCompanyIdByName(companyName);

            return CompanyID;
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
