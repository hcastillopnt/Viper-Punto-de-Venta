using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Telerik.WinControls.UI;
using Viper.BusinessEntities;

namespace Viper.DesktopApp
{
    public partial class frmAdminSites : Form
    {
        #region Variables and Objects of class
        private RadButton objButton = null;
        String rutaLogotipo = String.Empty;
        public string nom;
        public int companyId;
        public string cod;
        #endregion

        #region Constructor
        public frmAdminSites(String nm,int cId)
        {
            this.nom = nm;
            this.companyId = cId;
            InitializeComponent();
        }
        #endregion

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
        
        #region Events of the controls
        public void Button_Click(object sender, EventArgs e)
        {
            objButton = (RadButton)sender;

            string name = objButton.Name;

            switch (name)
            {
                //Guardar
                case "btnGuardarSucursal":
                    guardarSucursal();
                    break;

                //Nueva sucursal
                case "btnNuevaSucursal":
                    nuevaSucursal();
                    break;
                case "btnCancelar":
                    this.Close();
                    break;
                case "btnExaminar":
                    uploadLogotipo();
                    break;
                case "btnFinalizar":
                    this.Close();
                    break;
            }
        }

        private void frmRegisterSite_Load(object sender, EventArgs e)
        {
            //Set default configuration to UI
            this.AcceptButton = btnFinalizar;
            this.CancelButton = btnCancelar;
            this.AutoSize = true;
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.StartPosition = FormStartPosition.CenterScreen;
            this.Text = "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions";
            //this.TopMost = true;
            this.Size = new Size(1366, 768);
            this.WindowState = FormWindowState.Maximized;

            //Colocar el nombre de la empresa
            Empresa.Text = nom;
            
            //poner el indice cero por defecto en los combobox
            cboTipoInmuebleFiscal.SelectedIndex = 0;
            cboTipoVialidadFiscal.SelectedIndex = 0;
            cboLocalidadFiscal.SelectedIndex = 0;
            cboEstadoFiscal.SelectedIndex = 0;
            Id_Sucursal.Clear();
            gvSucursales.DataSource = BusinessLogicLayer.AccesoBDBLL.getSites(companyId);

            //Establecer los eventos a los controles
            this.btnGuardarSucursal.Click += Button_Click;
            this.btnNuevaSucursal.Click += Button_Click;
            this.btnFinalizar.Click += Button_Click;
            this.btnExaminar.Click += Button_Click;
            this.btnCancelar.Click += Button_Click;
            this.Id_Sucursal.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.Empresa.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.Telefono.KeyPress += OnlyNumbers_KeyPress;
            this.Nombre_Sucursal.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.Representante.KeyPress += OnlyLetters_KeyPress;
            this.Codigo_Postal.KeyPress += OnlyNumbers_KeyPress;
            this.Vialidad_Fiscal.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.No_Ext_Fiscal.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.No_Int_Fiscal.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.Colonia_Fiscal.KeyPress += OnlyLettersAndNumbers_KeyPress;

            //establecer foco en primer campo
            this.ActiveControl = Empresa;
            this.Empresa.Focus();

            //cargar dropdownlist
            fillDropDownList();


            // Create the ToolTip and associate with the Form container.
            ToolTip toolTip1 = new ToolTip();

            // Set up the delays for the ToolTip.
            toolTip1.AutoPopDelay = 5000;
            toolTip1.InitialDelay = 1000;
            toolTip1.ReshowDelay = 500;
            // Force the ToolTip text to be displayed whether or not the form is active.
            toolTip1.ShowAlways = true;

            // Set up the ToolTip text for the Button and Checkbox.
            toolTip1.SetToolTip(this.btnGuardarSucursal, "Para poder guardar los datos de la sucursal registrada y sus datos fiscales, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnCancelar, "Para limpiar el formulario, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnFinalizar, "Para finalizar, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnNuevaSucursal, "Para empezar a registrar una nueva sucursal, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnExaminar, "Para buscar el logotipo de su negocio almacenado en su pc, favor de dar clic en este boton");



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
                Id_Sucursal.Text = "SUC-" + Colonia_Fiscal.Text.ToUpper().Trim().Replace(" ", "_") + "-" + cboLocalidadFiscal.Text;

            }
        }

        private void OnlyNumbers_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!(char.IsNumber(e.KeyChar)) && (e.KeyChar != (char)Keys.Back))
            {
                e.Handled = true;
                return;
            }

            if (e.KeyChar == (char)(Keys.Enter))
            {
                e.Handled = true;
                SendKeys.Send("{TAB}");
            }
        }

        private void OnlyLetters_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (Char.IsLetter(e.KeyChar))
            {
                e.Handled = false;
            }
            else if (Char.IsControl(e.KeyChar))
            {
                e.Handled = false;
            }
            else if (Char.IsSeparator(e.KeyChar))
            {
                e.Handled = false;
            }
            else
            {
                e.Handled = true;
            }

            if (e.KeyChar == (char)(Keys.Enter))
            {
                e.Handled = true;
                SendKeys.Send("{TAB}");
            }
        }

        private void OnlyLettersAndNumbers_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (Char.IsLetter(e.KeyChar))
            {
                e.Handled = false;
            }
            else if (Char.IsDigit(e.KeyChar))
            {
                e.Handled = false;
            }
            else if (Char.IsControl(e.KeyChar))
            {
                e.Handled = false;
            }
            else if (Char.IsSeparator(e.KeyChar))
            {
                e.Handled = false;
            }
            else
            {
                e.Handled = true;
            }

            if (e.KeyChar == (char)(Keys.Enter))
            {
                e.Handled = true;
                SendKeys.Send("{TAB}");
            }
        }
        #endregion

        #region Methods of class
        private void guardarSucursal()
        {
            int CID = BusinessLogicLayer.AccesoBDBLL.checkIdCompany();
            Site s = new Site();
            DateTime f = DateTime.Today;
            Address a = new Address();

            s.CompanyId = CID;
            s.CompanyName = Nombre_Sucursal.Text;
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
            string message = BusinessLogicLayer.AccesoBDBLL.insertarSucursal(s, ad);

            if (message != "")
            {
                MessageBox.Show(message);
            }
            else
            {
                MessageBox.Show("Sucursal registrada exitosamente");
                btnFinalizar.Enabled = true;
            }
            gvSucursales.DataSource = BusinessLogicLayer.AccesoBDBLL.getSites(companyId);
        }
        private void nuevaSucursal()
        {
            Telefono.Enabled = true;
            Nombre_Sucursal.Enabled = true;
            Representante.Enabled = true;
            cboTipoInmuebleFiscal.Enabled = true;
            cboTipoVialidadFiscal.Enabled = true;
            Vialidad_Fiscal.Enabled = true;
            Codigo_Postal.Enabled = true;
            No_Ext_Fiscal.Enabled = true;
            No_Int_Fiscal.Enabled = true;
            Colonia_Fiscal.Enabled = true;
            cboEstadoFiscal.Enabled = true;
            cboLocalidadFiscal.Enabled = true;
            gvSucursales.Enabled = true;
            btnGuardarSucursal.Enabled = true;
            btnCancelar.Enabled = true;
            //poner el indice cero por defecto en los combobox
            cboTipoInmuebleFiscal.SelectedIndex = 0;
            cboTipoVialidadFiscal.SelectedIndex = 0;
            cboLocalidadFiscal.SelectedIndex = 0;
            cboEstadoFiscal.SelectedIndex = 0;
            Id_Sucursal.Clear();
            gvSucursales.DataSource = BusinessLogicLayer.AccesoBDBLL.getSites(companyId);
        }

        public void fillDropDownList()
        {
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
        }

        private void uploadLogotipo()
        {
            OpenFileDialog BuscarImagen = new OpenFileDialog();
            BuscarImagen.Filter = ".bmp;*.gif;*.jpg;*.png|*.bmp;*.gif;*.jpg;*.png|Imagen Jpg(*.jpg)|*.jpg|Imagen PNG(*.png)|*.png|Imagen Gif(*.gif*)|*.gif";
            BuscarImagen.FileName = "";
            BuscarImagen.Title = "Examinar Imagen";
            if (BuscarImagen.ShowDialog() == DialogResult.OK)
            {
                rutaLogotipo = BuscarImagen.FileName;
                String Direccion = BuscarImagen.FileName;
                picSucursal.ImageLocation = Direccion;
                picSucursal.SizeMode = PictureBoxSizeMode.StretchImage;
            }
        }
        #endregion

    }
}
