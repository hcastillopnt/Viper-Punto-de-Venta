#region using directives 

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viper.BusinessEntities;

#endregion

namespace Viper.BusinessLogicLayer
{
    public class CompanyBLL
    {
        #region sp_insert_company

        /// <summary>
        /// Method to realize the record of the information of the person who acquires a license with the company OwalTek Innovation Solutions, of the software Viper
        /// </summary>
        /// <param name="company">Company Object</param>
        /// <param name="address">Address Object</param>
        /// <param name="addressSAT">Address SAT Object</param>
        /// <returns>Message</returns>
        public static string sp_insert_company(Company company, Address address, AddressSAT addressSAT)
        {
            //Variable to recover the messages of mistake produced in the layer of BusinessLogic
            string message = string.Empty;

            //To validate the entities of the class by means of the DataAnnotations assigned in the layer of BusinessEntities
            message = validateWithDataAnnotations(company, address, addressSAT);

            //If it does not contain mistakes, we proceed to realize the following operation
            if (string.IsNullOrEmpty(message))
            {
                //To encrypt the password by means of the algorithm SHA1
                company.PasswordEncrypted = EncryptionDecryption.EncriptarSHA1(company.PasswordEncrypted);

                //After validating quite the logic of business, one proceeds to realize the record by means of the layer DataAccess
                message = DataAccessLayer.CompanyDAL.sp_insert_company(company, address, addressSAT);
            }

            //To return the value of the variable message
            return message;
        }

        #endregion

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
                message = DataAccessLayer.CompanyDAL.updatePassword(PasswordEncrypted, entityID);
            }

            //To return the value of the variable message
            return message;
        }
        #endregion

        #region getPasswordSaved
        /// <summary>
        /// Get password saved in database
        /// </summary>
        /// <param name="EntityID">Entity ID</param>
        /// <returns>Password Encrypted</returns>
        public static string getPasswordSaved(int EntityID)
        {
            string Password = String.Empty;
            string EncryptedPassword = String.Empty;

            EncryptedPassword = DataAccessLayer.CompanyDAL.getPasswordSaved(EntityID);

            Password = EncryptionDecryption.DesencriptarSHA1(EncryptedPassword);

            return Password;
        }
        #endregion

        #region obtainCompanyKeyGeneratedAutomatic

        /// <summary>
        /// Method to obtain the key generated automatic of the company
        /// </summary>
        /// <returns>String (Key)</returns>
        public static string obtainCompanyKeyGeneratedAutomatic()
        {
            //Variable to recover the key of the company
            string companyKey = String.Empty;

            //To obtain the key of the company by means of the layer DataAccess
            companyKey = DataAccessLayer.CompanyDAL.obtainCompanyKeyGeneratedAutomatic();

            //To return the value of the variable companyKey
            return companyKey;
        }

        #endregion

        #region getRegimenFiscalByID
        /// <summary>
        /// Metodo para obtener el regimen fiscal en base al ID
        /// </summary>
        /// <param name="RegimenID">Regimen Fiscal ID</param>
        /// <returns>RegimenFiscal Name</returns>
        public static string getRegimenFiscalByID(int RegimenID)
        {
            string RegimenFiscal = String.Empty;

            RegimenFiscal = DataAccessLayer.CompanyDAL.getRegimenFiscalByID(RegimenID);

            return RegimenFiscal;
        }
        #endregion

        #region getCompanyRegisteredByCompanyID
        /// <summary>
        /// Metodo para obtener la informacion de la compañia por medio del Id
        /// </summary>
        /// <param name="CompanyID">Company ID</param>
        /// <returns>Entity</returns>
        public static Company getCompanyRegisteredByCompanyID(int CompanyID)
        {
            Company company = null;

            company = DataAccessLayer.CompanyDAL.getCompanyRegisteredByCompanyID(CompanyID);

            return company;
        }
        #endregion

        #region getCompanyAddressSATRegisteredByID
        /// <summary>
        /// Metodo para obtener la direccion de la compañia por medio del Id
        /// </summary>
        /// <param name="AddressID">Address ID</param>
        /// <returns>Entity</returns>
        public static Address getCompanyAddressRegisteredByCompanyID(int AddressID)
        {
            Address address = null;

            address = DataAccessLayer.CompanyDAL.getCompanyAddressRegisteredByCompanyID(AddressID);

            return address;
        }
        #endregion

        #region getCompanyAddressSATRegisteredByID
        /// <summary>
        /// Metodo para obtener la direccion fiscal de la compañia por medio del Id
        /// </summary>
        /// <param name="AddressSATID">AddressSATID ID</param>
        /// <returns>Entity</returns>
        public static AddressSAT getCompanyAddressSATRegisteredByCompanyID(int AddressSATID)
        {
            AddressSAT addressSAT = null;

            addressSAT = DataAccessLayer.CompanyDAL.getCompanyAddressSATRegisteredByCompanyID(AddressSATID);

            return addressSAT;
        }
        #endregion

        #region getCatalogOfRegimenFiscal

        /// <summary>
        /// Method to obtain the available options of fiscal regime
        /// </summary>
        /// <returns>DataTable</returns>
        public static DataTable getCatalogOfRegimenFiscal()
        {
            DataTable dataTable = null;

            dataTable = DataAccessLayer.CompanyDAL.getCatalogOfRegimenFiscal();

            return dataTable;
        }

        #endregion

        #region getCatalogOfRegimenFiscalByName

        /// <summary>
        /// Method to obtain the available options of fiscal regime by name
        /// </summary>
        /// <param name="filter">Regimen Fiscal</param>
        /// <returns>DataTable</returns>
        public static DataTable getCatalogOfRegimenFiscalByName(string filter)
        {
            DataTable dataTable = new DataTable();

            dataTable = DataAccessLayer.CompanyDAL.getCatalogOfRegimenFiscalByName(filter);

            return dataTable;
        }

        #endregion

        #region getRegimenIdByName

        /// <summary>
        /// Method to obtain the ID fiscal regime by Name
        /// </summary>
        /// <param name="RegimenName">Regimen Fiscal</param>
        /// <returns></returns>
        public static int getRegimenIdByName(string RegimenName)
        {
            int RegimenID = 0;

            RegimenID = DataAccessLayer.CompanyDAL.getRegimenIdByName(RegimenName);

            return RegimenID;
        }

        #endregion

        #region getCompanyIdByName
        /// <summary>
        /// Metodo para obtener el ID de la compañia por medio del nombre de la compañia
        /// </summary>
        /// <param name="companyName">Nombre de la Compañia</param>
        /// <returns>ID</returns>
        public static int getCompanyIdByName(string companyName)
        {
            int CompanyID = 0;

            CompanyID = DataAccessLayer.CompanyDAL.getCompanyIdByName(companyName);

            return CompanyID;
        }
        #endregion

        #region validateWithDataAnnotations

        /// <summary>
        /// 
        /// </summary>
        /// <param name="company"></param>
        /// <param name="address"></param>
        /// <param name="addressSAT"></param>
        /// <returns></returns>
        public static string validateWithDataAnnotations(Company company, Address address, AddressSAT addressSAT)
        {
            ICollection<ValidationResult> results = null;
            string message = String.Empty;

            if (!validate(company, out results))
            {
                message = String.Join("\n", results.Select(o => o.ErrorMessage));
            }
            else
            {
                if (!validate(address, out results))
                {
                    message = String.Join("\n", results.Select(o => o.ErrorMessage));
                }
                else
                {
                    if (!validate(addressSAT, out results))
                    {
                        message = String.Join("\n", results.Select(o => o.ErrorMessage));
                    }
                }
            }

            return message;
        }

        #endregion

        #region validateAddressWithDataAnnotations

        /// <summary>
        /// 
        /// </summary>
        /// <param name="address"></param>
        /// <returns></returns>
        public static string validateAddressWithDataAnnotations(Address address)
        {
            ICollection<ValidationResult> results = null;
            string message = String.Empty;

            if (!validate(address, out results))
            {
                message = String.Join("\n", results.Select(o => o.ErrorMessage));
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
