using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Telerik.WinControls.UI;
using Viper.BusinessEntities;

namespace Viper.DesktopApp
{
    public partial class frmRegisterCompany : Form
    {
        RadButton objButton = null;

        public frmRegisterCompany()
        {
            InitializeComponent();
        }

        public void Button_Click(Object sender, EventArgs args)
        {
            objButton = (RadButton)sender;

            switch (objButton.Name)
            {
                case "btnRegimenFiscal":
                    frmRegimenFiscal form = new frmRegimenFiscal();
                    form.ShowDialog();
                    form.TopMost = true;
                    break;
            }
        }

        private void frmRegisterCompany_Load(object sender, EventArgs e)
        {
            btnRegimenFiscal.Click += Button_Click;
        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            DateTime f = DateTime.Today;
            Company c = new Company();

            //Guardado de objetos al dar clic en guardar

            #region Direccion
            Address ad = new Address();
            ad.RoadTypeId = Convert.ToInt32(cboTipoVialidad.SelectedValue);
            ad.AddressTypeId = Convert.ToInt32(cboTipoInmueble.SelectedValue);
            ad.AddressLine1 = Vialidad.Text.Trim() + ", " + No_Ext.Text.Trim() + ", " + Colonia.Text.Trim();
            ad.AddressLine2 = No_Int.Text.Trim();


            //ad.CountryRegionId = Convert.ToInt32(cboPaisFiscal.SelectedValue);
            ad.StateProvinceId = Convert.ToInt32(cboEstado.SelectedValue);
            ad.CityId = Convert.ToInt32(cboLocalidad.SelectedValue);
            ad.PostalCode = Codigo_Postal.Text.Trim();
            ad.CreatedDate = f;
            ad.CreateBy = "ADMIN";
            ad.ModifiedBy = "ADMIN";
            ad.ModifiedDate = f;
            #endregion

            #region DireccionFiscal
            AddressSAT ads = new AddressSAT();
            ads.RoadTypeId = Convert.ToInt32(cboTipoVialidadFiscal.SelectedValue);
            ads.AddressTypeId = Convert.ToInt32(cboTipoInmuebleFiscal.SelectedValue);
            ads.AddressLine1 = No_Ext_Fiscal.Text.Trim();
            ads.AddressLine2 = No_Int_Fiscal.Text.Trim();
            //ads.CountryRegionId = Convert.ToInt32(cbo.SelectedValue);
            ads.StateProvinceId = Convert.ToInt32(cboEstadoFiscal.SelectedValue);
            ads.CityId = Convert.ToInt32(cboLocalidadFiscal.SelectedValue);
            ads.PostalCode = Codigo_Postal_Fiscal.Text.Trim();
            ads.CreatedDate = f;
            ads.CreateBy = "ADMIN";
            ads.ModifiedDate = f;
            ads.ModifiedBy = "ADMIN";

            #endregion

            #region Empresa
            c.BusinessActivity = cboGiro.SelectedItem.ToString();
            c.CompanyName = NombreEmpresa.Text.Trim().ToUpper();
            c.CompanyKey = BusinessLogicLayer.CRUDCompanyBLL.checkCompId();
            //c.PhoneNumber = Telefono.Text.Trim();
            //c.CellphoneNumber = Celular.Text.Trim();
            //c.EmailAddress = Email.Text.Trim();
            c.FiscalName = Nombre_Fiscal.Text.Trim().ToUpper();
            c.RFC = RFC.Text.Trim().ToUpper();
            c.CURP = CURP.Text.Trim().ToUpper();
            c.CreatedDate = f;
            c.CreateBy = "ADMIN";
            //checar que hacer con los id de regimen fiscal y cuenta de banco
            c.AccountBankId = 1;
            c.RegimenFiscalId = 1;
            //---------------------------
            c.ModifiedDate = f;
            c.ModifiedBy = "ADMIN";
            #endregion

            #region Empleado
            Employee emp = new Employee();
            emp.CreatedDate = f;
            emp.CreateBy = "ADMIN";
            emp.CURP = CURP.Text;
            emp.EmployeeIDNumber = BusinessLogicLayer.CRUDCompanyBLL.checkEmpId();
            emp.ModifiedBy = "ADMIN";
            emp.ModifiedDate = f;
            emp.RFC = RFC.Text;
            emp.ShiftId = 4;
            emp.StartDate = f;
            emp.JobTitleId = 1;
            //agregar en base de datos, informacion por defecto sobre los siguientes dos campos
            emp.GenderId = 3;
            emp.MaritalStatusId = 6;
            //---------------
            #endregion

            #region Usuario
            User mem = new User();
            mem.LoginID = "admin.viper.1";
            mem.AccessFailed = 0;
            mem.CreateBy = "admin";
            mem.EmailAddress = "NA";
            mem.CreatedDate = f;
            mem.IsActive = 1;
            mem.IsApproved = 1;
            mem.IsEnabled = 1;
            mem.IsWelcome = 1;
            mem.MobilePIN = "NA";
            mem.ModifiedBy = "admin";
            mem.ModifiedDate = f;
            mem.PasswordAnswer = "NA";
            mem.PasswordEncrypted = "12345";
            mem.PasswordQuestion = "NA";
            mem.RoleId = 1;
            #endregion



            string message = BusinessLogicLayer.CRUDCompanyBLL.sp_insert_company(ad, c, ads, emp, mem);

            if (message != "")
            {
                MessageBox.Show(message);
            }
            else
            {
                MessageBox.Show("Sucursal registrada exitosamente");
                string nom=BusinessLogicLayer.CRUDCompanyBLL.checkCompanyName();
                int cId = BusinessLogicLayer.CRUDCompanyBLL.checkIdCompany();
                frmRegisterSite form = new frmRegisterSite(nom,cId);
                form.ShowDialog();
                form.TopMost = true;
                this.Hide();
            }

        }

        private void frmRegisterCompany_Load_1(object sender, EventArgs e)
        {
            //cargar en combobox los tipos de inmueble por medio del metodo correspondiente
            //NOTA: POR ALGUNA RAZON NO FUNCIONA EL METODO SI HAY UN CAMPO NULO
            cboTipoInmueble.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetAddressTypeDropDownList();
            cboTipoInmueble.DisplayMember = "Name";
            cboTipoInmueble.ValueMember = "Id";

            cboTipoInmuebleFiscal.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetAddressTypeDropDownList();
            cboTipoInmuebleFiscal.DisplayMember = "Name";
            cboTipoInmuebleFiscal.ValueMember = "Id";

            //cargar en combobo los tipos de vialidad
            //NOTA: POR ALGUNA RAZON NO FUNCIONA EL METODO SI HAY UN CAMPO NULO
            cboTipoVialidad.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetRoadTypeDropDownList();
            cboTipoVialidad.DisplayMember = "Name";
            cboTipoVialidad.ValueMember = "Id";

            cboTipoVialidadFiscal.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetRoadTypeDropDownList();
            cboTipoVialidadFiscal.DisplayMember = "Name";
            cboTipoVialidadFiscal.ValueMember = "Id";

            //cargar en combobox los estados por medio del metodo correspondiente
            cboEstado.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetStateProvinceDropDownList(); ;
            cboEstado.DisplayMember = "Description";
            cboEstado.ValueMember = "Id";

            cboEstadoFiscal.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetStateProvinceDropDownList();
            cboEstadoFiscal.DisplayMember = "Description";
            cboEstadoFiscal.ValueMember = "Id";

            //poner el indice cero por defecto en los combobox
            cboTipoInmueble.SelectedIndex = 0;
            cboTipoVialidad.SelectedIndex = 0;
            cboEstado.SelectedIndex = 0;
            cboLocalidad.SelectedIndex = 0;
            cboEstadoFiscal.SelectedIndex = 0;
            cboLocalidad.SelectedIndex = 0;
        }

        private void cboEstado_SelectedIndexChanged(object sender, Telerik.WinControls.UI.Data.PositionChangedEventArgs e)
        {
            cboLocalidad.Items.Clear();
            if (cboEstado.SelectedIndex > 0)
            {
                cboLocalidad.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetCityDropDownList(Convert.ToInt32(cboEstado.SelectedValue));
                cboLocalidad.DisplayMember = "Description";
                cboLocalidad.ValueMember = "Id";
            }
            else
            {
                cboLocalidad.Items.Add("--SELECCIONE--");
            }
        }

        private void cboEstadoFiscal_SelectedIndexChanged(object sender, Telerik.WinControls.UI.Data.PositionChangedEventArgs e)
        {
            cboLocalidadFiscal.Items.Clear();
            if (cboEstadoFiscal.SelectedIndex > 0)
            {
                cboLocalidadFiscal.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetCityDropDownList(Convert.ToInt32(cboEstadoFiscal.SelectedValue));
                cboLocalidadFiscal.DisplayMember = "Description";
                cboLocalidadFiscal.ValueMember = "Id";
            }
            else
            {
                cboLocalidadFiscal.Items.Add("--SELECCIONE--");
            }
        }
    }
}
