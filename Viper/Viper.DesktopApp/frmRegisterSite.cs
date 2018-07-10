using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Viper.BusinessEntities;

namespace Viper.DesktopApp
{
    public partial class frmRegisterSite : Form
    {
        public string nom;
        public int companyId;
        public string cod;
        public frmRegisterSite(String nm,int cId)
        {
            this.nom = nm;
            this.companyId = cId;
            InitializeComponent();
        }

        #region CONTROLAR TAB ORDER
        // TAB DE CODIGO POSTAL A NUMERO EXTERIOR 
        private void Codigo_Postal_Leave(object sender, EventArgs e)
        {
            No_Ext_Fiscal.Focus();
        }


        // TAB DE NUMERO EXTERIOR A NUMERO INTERIOR
        private void No_Ext_Fiscal_Leave(object sender, EventArgs e)
        {
            No_Int_Fiscal.Focus();
        }

        // TAB DE NO INTERIOR A COLONIA FISCAL
        private void No_Int_Fiscal_Leave(object sender, EventArgs e)
        {
            Colonia_Fiscal.Focus();
        }

        // TAB DE TIPO DE VIALIDAD A VIALIDAD FISCAL
        private void cboTipoVialidadFiscal_Leave(object sender, EventArgs e)
        {
            Vialidad_Fiscal.Focus();
        }

        // TAB DE VIALIDAD A CODIGO POSTAL
        private void Vialidad_Fiscal_Leave(object sender, EventArgs e)
        {
            Codigo_Postal.Focus();
        }

        // TAB DE ESTADO FISCAL A LOCALIDAD FISCAL
        private void cboEstadoFiscal_Leave(object sender, EventArgs e)
        {
            cboLocalidadFiscal.Focus();
        }


        #endregion

        private void btnGuardarSucursal_Click(object sender, EventArgs e)
        {
            int CID = BusinessLogicLayer.CRUDCompanyBLL.checkIdCompany();
            Site s = new Site();
            DateTime f = DateTime.Today;
            Address a = new Address();

            s.CompanyId = CID;
            s.Name = Nombre_Sucursal.Text;
            s.UniquePhysicalID = Id_Sucursal.Text;
            s.ContactName = Representante.Text;
            s.PhoneNumber = Telefono.Text;
            s.CreatedDate = f;
            s.ModifiedDate = f;

            Address ad = new Address();
            ad.RoadTypeId = Convert.ToInt32(cboTipoVialidadFiscal.SelectedValue);
            ad.AddressTypeId = Convert.ToInt32(cboTipoInmuebleFiscal.SelectedValue);
            ad.AddressLine1 = Vialidad_Fiscal.Text.Trim() + ", " + No_Ext_Fiscal.Text.Trim() + ", " + Colonia_Fiscal.Text.Trim();
            ad.AddressLine2 = No_Int_Fiscal.Text.Trim();


            //ad.CountryRegionId = Convert.ToInt32(cboPaisFiscal.SelectedValue);
            ad.StateProvinceId = Convert.ToInt32(cboEstadoFiscal.SelectedValue);
            ad.CityId = Convert.ToInt32(cboLocalidadFiscal.SelectedValue);
            ad.PostalCode = Codigo_Postal.Text.Trim();
            ad.CreatedDate = f;
            ad.ModifiedDate = f;

            gvSucursales.DataSource = BusinessLogicLayer.CRUDCompanyBLL.getSites(companyId);
        }

        private void frmRegisterSite_Load(object sender, EventArgs e)
        {
            Empresa.Text = nom;
            cboTipoInmuebleFiscal.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetAddressTypeDropDownList();
            cboTipoInmuebleFiscal.DisplayMember = "Name";
            cboTipoInmuebleFiscal.ValueMember = "Id";

            cboTipoVialidadFiscal.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetRoadTypeDropDownList();
            cboTipoVialidadFiscal.DisplayMember = "Name";
            cboTipoVialidadFiscal.ValueMember = "Id";

            //cargar en combobox los estados para el estado fiscal
            cboEstadoFiscal.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetStateProvinceDropDownList();
            cboEstadoFiscal.DisplayMember = "Description";
            cboEstadoFiscal.ValueMember = "Id";

            //poner el indice cero por defecto en los combobox
            cboTipoInmuebleFiscal.SelectedIndex = 0;
            cboTipoVialidadFiscal.SelectedIndex = 0;
            cboLocalidadFiscal.SelectedIndex = 0;
            cboEstadoFiscal.SelectedIndex = 0;
            Id_Sucursal.Clear();
            gvSucursales.DataSource = BusinessLogicLayer.CRUDCompanyBLL.getSites(companyId);
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

        private void cboLocalidadFiscal_SelectedIndexChanged(object sender, Telerik.WinControls.UI.Data.PositionChangedEventArgs e)
        {
            if (cboLocalidadFiscal.SelectedIndex > 0)
            {
                Id_Sucursal.Text = "SUC-" + Colonia_Fiscal.Text.ToUpper().Trim().Replace(" ", "_") + "-" + cboLocalidadFiscal.Text;

            }
        }

        private void Colonia_Fiscal_TextChanging(object sender, Telerik.WinControls.TextChangingEventArgs e)
        {
            if (cboLocalidadFiscal.SelectedIndex > 0)
            {
                Id_Sucursal.Text = "SUC-" + Colonia_Fiscal.Text.ToUpper().Trim().Replace(" ","_") + "-" + cboLocalidadFiscal.Text;

            }
        }
    }
}
