using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viper.BusinessEntities;

namespace Viper.DataAccessLayer
{
    public class DropDownListHelperDAL
    {
        #region GetGendersDropDownList

        // <summary>
        // Metodo para obtener el sexo de una persona
        // </summary>
        // <returns>List</returns>
        public static List<Gender> GetGendersDropDownList()
        {
            List<Gender> items = new List<Gender>();

            using (ViperDbContext db = new ViperDbContext())
            {
                items = db.Genders.ToList();
                items.Add(new Gender { Id = -1, Name = "--SELECCIONE--" });

                return items.OrderBy(x => x.Id).ToList();
            }
        }

        #endregion

        #region GetMaritalStatusDropDownList

        /// <summary>
        /// Metodo para obtener el estado civil de una persona
        /// </summary>
        /// <returns>List</returns>
        public static List<MaritalStatus> GetMaritalStatusDropDownList()
        {
            List<MaritalStatus> items = new List<MaritalStatus>();

            using (ViperDbContext db = new ViperDbContext())
            {
                items = db.MaritalsStatus.ToList();
                items.Add(new MaritalStatus { Id = -1, Name = "--SELECCIONE--" });

                return items.OrderBy(x => x.Id).ToList();
            }
        }

        #endregion

        #region GetAddressTypeDropDownList

        /// <summary>
        /// Metodo para obtener los tipos de domicilio
        /// </summary>
        /// <returns>List</returns>
        public static List<AddressType> GetAddressTypeDropDownList()
        {
            List<AddressType> items = new List<AddressType>();

            using (ViperDbContext db = new ViperDbContext())
            {
                items = db.AddressesType.ToList();
                items.Add(new AddressType { Id = -1, Name = "--SELECCIONE--" });

                return items.OrderBy(x => x.Id).ToList();
            }
        }

        #endregion

        #region GetRoadTypeDropDownList

        /// <summary>
        /// Metodo para obtener los tipos de vialidad
        /// </summary>
        /// <returns>List</returns>
        public static List<RoadType> GetRoadTypeDropDownList()
        {
            List<RoadType> items = new List<RoadType>();

            using (ViperDbContext db = new ViperDbContext())
            {
                items = db.RoadsType.ToList();
                items.Add(new RoadType { Id = -1, Name = "--SELECCIONE--" });

                return items.OrderBy(x => x.Id).ToList();
            }
        }

        #endregion

        #region GetRolesDropDownList

        /// <summary>
        /// Metodo para obtener los roles para los usuarios
        /// </summary>
        /// <returns>List</returns>
        public static List<Role> GetRolesDropDownList()
        {
            List<Role> items = new List<Role>();

            using (ViperDbContext db = new ViperDbContext())
            {
                items = db.Roles.ToList();
                items.Add(new Role { Id = -1, Name = "--SELECCIONE--" });

                return items.OrderBy(x => x.Id).ToList();
            }
        }

        #endregion

        #region GetDepartmentDropDownList

        /// <summary>
        /// Metodo para obtener los departamentos donde se puede desempeñar un empleado
        /// </summary>
        /// <returns>List</returns>
        public static List<Department> GetDepartmentDropDownList()
        {
            List<Department> items = new List<Department>();

            using (ViperDbContext db = new ViperDbContext())
            {
                items = db.Departments.ToList();
                items.Add(new Department { Id = -1, Name = "--SELECCIONE--" });

                return items.OrderBy(x => x.Id).ToList();
            }
        }

        #endregion

        #region GetShiftDropDownList

        /// <summary>
        /// Metodo para obtener los horarios en los cuales puede trabajar un empleado
        /// </summary>
        /// <returns>List</returns>
        public static List<Shift> GetShiftDropDownList()
        {
            List<Shift> items = new List<Shift>();

            using (ViperDbContext db = new ViperDbContext())
            {
                items = db.Shifts.ToList();
                items.Add(new Shift { Id = -1, Name = "--SELECCIONE--" });

                return items.OrderBy(x => x.Id).ToList();
            }
        }

        #endregion

        #region GetJobTitleDropDownList

        /// <summary>
        /// Metodo para obtener los puestos que puede tener un empleado
        /// </summary>
        /// <returns>List</returns>
        public static List<JobTitle> GetJobTitleDropDownList()
        {
            List<JobTitle> items = new List<JobTitle>();

            using (ViperDbContext db = new ViperDbContext())
            {
                items = db.JobsTitle.ToList();
                items.Add(new JobTitle { Id = -1, Name = "--SELECCIONE--" });

                return items.OrderBy(x => x.Id).ToList();
            }
        }

        #endregion

        #region GetCountryRegionDropDownList

        public static List<CountryRegion> GetCountryRegionDropDownList()
        {
            List<CountryRegion> items = new List<CountryRegion>();

            using (ViperDbContext db = new ViperDbContext())
            {
                items = db.CountriesRegion.ToList();
                items.Add(new CountryRegion { Id = -1, Description = "--SELECCIONE--" });

                return items.OrderBy(x => x.Id).ToList();
            }
        }

        #endregion

        #region GetStateProvinceDropDownList

        /// <summary>
        /// Metodo para obtener los estados de Mexico
        /// </summary>
        /// <returns>List</returns>
        public static List<StateProvince> GetStateProvinceDropDownList()
        {
            List<StateProvince> items = new List<StateProvince>();

            using (ViperDbContext db = new ViperDbContext())
            {
                items = db.StatesProvince.Where(x => x.CountryRegionId == 159).ToList();
                items.Add(new StateProvince { Id = -1, Description = "--SELECCIONE--" });

                return items.OrderBy(x => x.Id).ToList();
            }
        }

        #endregion

        #region GetCityDropDownList

        /// <summary>
        /// Metodo para obtener los municipios de Mexico
        /// </summary>
        /// <param name="StateProvinceID">ID Estado</param>
        /// <returns>List</returns>
        public static List<City> GetCityDropDownList(int StateProvinceID)
        {
            List<City> items = new List<City>();

            using (ViperDbContext db = new ViperDbContext())
            {
                items = db.Cities.Where(x => x.StateProvinceId == StateProvinceID).ToList();
                items.Add(new City { Id = -1, Description = "--SELECCIONE--" });

                return items.OrderBy(x => x.Id).ToList();
            }
        }

        #endregion
    }
}
