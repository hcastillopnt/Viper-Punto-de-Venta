/*
 * ---------------------------------------------------------
 * LIBRERIAS UTILIZADAS EN EL FORMULARIO "frmRegisterSupplier.cs"
 * ---------------------------------------------------------
 */

#region using directives

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

#endregion

namespace Viper.DesktopApp
{
    /// <summary>
    /// CLASE QUE PERMITE EL DAR DE ALTA PROVEEDORES DENTRO DEL 
    /// SISTEMA DE PUNTO DE VENTA PARA FARMACIAS CON VENTA DE 
    /// GENERICOS
    /// </summary>
    public partial class frmRegisterSupplier : Form
    {
        /*
         * ---------------------------------------------------------
         * VARIABLES, OBJETOS, Y COMPONENTES UTILIZADOS EN EL FORMULARIO "frmRegisterSupplier.cs"
         * ---------------------------------------------------------
         */
        #region Variables, Objetos y Componentes

        ComponentResourceManager resources = new ComponentResourceManager(typeof(frmRegisterSupplier));
        string rutaLogotipo = String.Empty;
        RadButton objButton = null;
        DateTime f = DateTime.Today;
        Supplier supplier = null;
        Address address = null;
        AddressSAT addressSAT = null;

        #endregion

        /*
        * ---------------------------------------------------------
        * CONSTRUCTORES UTILIZADOS EN EL FORMULARIO "frmRegisterSupplier.cs"
        * ---------------------------------------------------------
        */
        #region Constructor

        public frmRegisterSupplier()
        {
            InitializeComponent();
        }

        #endregion

        /*
         * ---------------------------------------------------------
         * EVENTOS UTILIZADOS EN EL FORMULARIO "frmRegisterSupplier.cs"
         * ---------------------------------------------------------
         */

        #region Eventos

        private void frmRegisterSupplier_Load(object sender, EventArgs e)
        {
            //Set default configuration to UI
            this.AcceptButton = btnAceptar;
            this.CancelButton = btnCancelar;
            this.AutoSize = true;
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Text = "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions";
            this.KeyPreview = true;

            //Establecer la resolucion de la ventana
            //StartPosition was set to FormStartPosition.Manual in the properties window. 
            Rectangle screen = Screen.PrimaryScreen.WorkingArea;
            int w = Width >= screen.Width ? screen.Width : (screen.Width + Width) / 2;
            int h = Height >= screen.Height ? screen.Height : (screen.Height + Height) / 2;
            this.Location = new Point((screen.Width - w) / 2, (screen.Height - h) / 2);
            this.Size = new Size(w, h);

            //Establecer el foco en el primer campo
            this.ActiveControl = Giro_Comercial;
            this.Giro_Comercial.Focus();

            ToolTip toolTip1 = new ToolTip();

            // Set up the delays for the ToolTip.
            toolTip1.AutoPopDelay = 5000;
            toolTip1.InitialDelay = 1000;
            toolTip1.ReshowDelay = 500;
            // Force the ToolTip text to be displayed whether or not the form is active.
            toolTip1.ShowAlways = true;

            // Set up the ToolTip text for the Button and Checkbox.
            toolTip1.SetToolTip(this.btnAceptar, "Para poder guardar los datos del proveedor, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnCancelar, "Para cancelar la operacion y volver al formulario inicial, favor de dar clic a este boton");
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

                case "btnImportarDatosFiscales":
                    importFiscalData();
                    break;

                case "btnExaminar":
                    uploadLogotipo();
                    break;

                case "btnAceptar":
                    //registerCompanyInSystem();
                    break;

                case "btnCancelar":
                    setToDefaultFields();
                    break;
            }
        }

        private void cboEstado_SelectedIndexChanged(object sender, Telerik.WinControls.UI.Data.PositionChangedEventArgs e)
        {
            this.Municipio.Items.Clear();

            if (this.Entidad_Federativa.SelectedIndex > 0)
            {
                this.Municipio.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetCityDropDownList(Convert.ToInt32(Entidad_Federativa.SelectedValue));
                this.Municipio.DisplayMember = "Description";
                this.Municipio.ValueMember = "Id";
                this.Municipio.SelectedIndex = 0;
            }
            else
            {
                this.Municipio.Items.Add("--SELECCIONE--");
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

        /*
         * ---------------------------------------------------------
         * METODOS UTILIZADOS EN EL FORMULARIO "frmRegisterSupplier.cs"
         * ---------------------------------------------------------
         */

        #region Metodos

        private void importFiscalData()
        {
            string message = String.Empty;

            if (address == null)
                address = new Address();

            address.RoadTypeId = Convert.ToInt32(Tipo_Vialidad.SelectedValue);
            address.AddressTypeId = Convert.ToInt32(Tipo_Inmueble.SelectedValue);
            if (!string.IsNullOrEmpty(No_Int.Text.Trim().ToString()))
                address.AddressLine1 = "CALLE: " + Vialidad.Text.Trim() + ", NO. EXT: " + No_Ext.Text.Trim() + ", NO. INT:" + No_Int.Text.Trim() + ";";
            else
                address.AddressLine1 = "CALLE: " + Vialidad.Text.Trim() + ", NO. EXT: " + No_Ext.Text.Trim() + ";";
            address.AddressLine2 = "COLONIA: " + Colonia.Text.Trim() + ";";
            address.CountryRegionId = 1;
            address.StateProvinceId = Convert.ToInt32(Entidad_Federativa.SelectedValue);
            address.CityId = Convert.ToInt32(Municipio.SelectedValue);
            address.PostalCode = Codigo_Postal.Text.Trim();
            address.CreatedDate = f;
            address.CreatedBy = "HECP";
            address.LastUpdatedDate = f;
            address.LastUpdatedBy = "HECP";

            message = BusinessLogicLayer.AddressBLL.validateEmptyFieldsInForm(address);

            if (string.IsNullOrEmpty(message))
            {
                this.Tipo_Inmueble_Fiscal.SelectedValue = address.AddressTypeId;
                this.Tipo_Vialidad_Fiscal.SelectedValue = address.RoadTypeId;
                this.Vialidad_Fiscal.Text = Vialidad.Text.Trim().ToString();
                this.No_Ext_Fiscal.Text = No_Ext.Text.Trim().ToString();
                this.No_Int_Fiscal.Text = No_Int.Text.Trim().ToString();
                this.Codigo_Postal_Fiscal.Text = Codigo_Postal.Text.Trim().ToString();
                this.Colonia_Fiscal.Text = Colonia.Text.Trim().ToString();
                this.Entidad_Federativa_Fiscal.SelectedValue = address.StateProvinceId;
                this.Municipio_Fiscal.SelectedValue = address.CityId;

                this.Tipo_Inmueble_Fiscal.Enabled = false;
                this.Tipo_Vialidad_Fiscal.Enabled = false;
                this.Vialidad_Fiscal.Enabled = false;
                this.No_Ext_Fiscal.Enabled = false;
                this.No_Int_Fiscal.Enabled = false;
                this.Codigo_Postal_Fiscal.Enabled = false;
                this.Colonia_Fiscal.Enabled = false;
                this.Entidad_Federativa_Fiscal.Enabled = false;
                this.Municipio_Fiscal.Enabled = false;
                this.btnImportarDatosFiscales.Enabled = false;
            }
            else
            {
                MessageBox.Show(new Form { TopMost = true }, "El sistema no puede importar la informacion, favor de completar los campos anteriores", "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
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
                picLogotipo.ImageLocation = Direccion;
                picLogotipo.SizeMode = PictureBoxSizeMode.StretchImage;
            }
        }

        private void setToDefaultFields()
        {
            this.Nombre_Empresa.Text = String.Empty;
            this.Tipo_Inmueble.SelectedIndex = 0;
            this.Tipo_Vialidad.SelectedIndex = 0;
            this.Vialidad.Text = String.Empty;
            this.Codigo_Postal.Text = "_____";
            this.No_Ext.Text = String.Empty;
            this.No_Int.Text = String.Empty;
            this.Colonia.Text = String.Empty;
            this.Entidad_Federativa.SelectedIndex = 0;
            this.Municipio.SelectedIndex = 0;
            this.eMail.Text = String.Empty;
            this.Telefono.Text = "(__)___-_____";
            this.Celular.Text = "(___)___-___-____";
            this.Nombre_Fiscal.Text = String.Empty;
            this.RFC.Text = String.Empty;
            //Regimen_Fiscal.Text = String.Empty;
            this.Tipo_Inmueble_Fiscal.SelectedIndex = 0;
            this.Tipo_Vialidad_Fiscal.SelectedIndex = 0;
            this.Vialidad_Fiscal.Text = String.Empty;
            this.Codigo_Postal_Fiscal.Text = "_____";
            this.No_Ext_Fiscal.Text = String.Empty;
            this.No_Int_Fiscal.Text = String.Empty;
            this.Colonia_Fiscal.Text = String.Empty;
            this.Entidad_Federativa_Fiscal.SelectedIndex = 0;
            this.Municipio_Fiscal.SelectedIndex = 0;
            this.Tipo_Inmueble_Fiscal.Enabled = true;
            this.Tipo_Vialidad_Fiscal.Enabled = true;
            this.Vialidad_Fiscal.Enabled = true;
            this.No_Ext_Fiscal.Enabled = true;
            this.No_Int_Fiscal.Enabled = true;
            this.Codigo_Postal_Fiscal.Enabled = true;
            this.Colonia_Fiscal.Enabled = true;
            this.Entidad_Federativa_Fiscal.Enabled = true;
            this.Municipio_Fiscal.Enabled = true;
            this.btnImportarDatosFiscales.Enabled = true;

            supplier = null;
            address = null;
            addressSAT = null;

            rutaLogotipo = String.Empty;
            //RegimenFiscal = String.Empty;

            this.picLogotipo.Image = ((System.Drawing.Image)(resources.GetObject("picLogotipo.Image")));
        }

        private void fillDropDownList()
        {
            this.Tipo_Inmueble.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetAddressTypeDropDownList();
            this.Tipo_Inmueble.DisplayMember = "Name";
            this.Tipo_Inmueble.ValueMember = "Id";
            this.Tipo_Inmueble.SelectedIndex = 0;

            this.Tipo_Inmueble_Fiscal.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetAddressTypeDropDownList();
            this.Tipo_Inmueble_Fiscal.DisplayMember = "Name";
            this.Tipo_Inmueble_Fiscal.ValueMember = "Id";
            this.Tipo_Inmueble_Fiscal.SelectedIndex = 0;

            this.Tipo_Vialidad.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetRoadTypeDropDownList();
            this.Tipo_Vialidad.DisplayMember = "Name";
            this.Tipo_Vialidad.ValueMember = "Id";
            this.Tipo_Vialidad.SelectedIndex = 0;

            this.Tipo_Vialidad_Fiscal.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetRoadTypeDropDownList();
            this.Tipo_Vialidad_Fiscal.DisplayMember = "Name";
            this.Tipo_Vialidad_Fiscal.ValueMember = "Id";
            this.Tipo_Vialidad_Fiscal.SelectedIndex = 0;

            this.Entidad_Federativa.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetStateProvinceDropDownList(); ;
            this.Entidad_Federativa.DisplayMember = "Description";
            this.Entidad_Federativa.ValueMember = "Id";
            this.Entidad_Federativa.SelectedIndex = 0;

            this.Entidad_Federativa_Fiscal.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetStateProvinceDropDownList();
            this.Entidad_Federativa_Fiscal.DisplayMember = "Description";
            this.Entidad_Federativa_Fiscal.ValueMember = "Id";
            this.Entidad_Federativa_Fiscal.SelectedIndex = 0;

            this.Municipio.SelectedIndex = 0;
            this.Municipio_Fiscal.SelectedIndex = 0;
        }
        #endregion
    }
}
