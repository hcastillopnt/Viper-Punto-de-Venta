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
using System.Drawing.Imaging;
using System.IO;
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
        RadTextBox objTextbox = null;
        RadDropDownList objDropDownList = null;
        RadMaskedEditBox objMaskedEditBox = null;
        DateTime f = DateTime.Now;
        Supplier supplier = null;
        Address address = null;

        public static RadTextBox Regimen_Fiscal;

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

            fillDropDownList();
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
                case "btnExaminar":
                    uploadLogotipo();
                    break;

                case "btnAceptar":
                    registerSupplierInSystem();
                    break;

                case "btnCancelar":
                    setToDefaultFields();
                    break;
            }
        }

        private void EntidadFederativa_SelectedIndexChanged(object sender, Telerik.WinControls.UI.Data.PositionChangedEventArgs e)
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

        private void Control_Leave(object sender, EventArgs e)
        {
            if (sender is RadTextBox)
            {
                objTextbox = (RadTextBox)sender;

                switch (objTextbox.Name)
                {
                    //tab 2
                    case "Nombre_Fiscal":
                        pvAddSupplier.SelectedPage = pvpDatosGenerales;
                        RFC.Focus();
                        break;

                    //tab 3
                    case "RFC":
                        pvAddSupplier.SelectedPage = pvpDatosGenerales;
                        Tipo_Inmueble.Focus();
                        break;

                    //tab 6
                    case "Vialidad":
                        pvAddSupplier.SelectedPage = pvpDatosGenerales;
                        Codigo_Postal.Focus();
                        break;

                    //tab 8
                    case "No_Ext":
                        pvAddSupplier.SelectedPage = pvpDatosGenerales;
                        No_Int.Focus();
                        break;

                    //tab 9
                    case "No_Int":
                        pvAddSupplier.SelectedPage = pvpDatosGenerales;
                        Colonia.Focus();
                        break;

                    //tab 10
                    case "Colonia":
                        pvAddSupplier.SelectedPage = pvpDatosGenerales;
                        Entidad_Federativa.Focus();
                        break;

                    //tab 13
                    case "eMail":
                        pvAddSupplier.SelectedPage = pvpDatosGenerales;
                        Telefono.Focus();
                        break;

                    //tab 16
                    case "Cuenta_Banco":
                        pvAddSupplier.SelectedPage = pvpDatosGenerales;
                        btnExaminar.Focus();
                        break;
                }
            }
            else if (sender is RadMaskedEditBox)
            {
                objMaskedEditBox = (RadMaskedEditBox)sender;

                switch (objMaskedEditBox.Name)
                {
                    //tab 7
                    case "Codigo_Postal":
                        pvAddSupplier.SelectedPage = pvpDatosGenerales;
                        No_Ext.Focus();
                        break;

                    //tab 14
                    case "Telefono":
                        pvAddSupplier.SelectedPage = pvpDatosGenerales;
                        Celular.Focus();
                        break;

                    //tab 15
                    case "Celular":
                        pvAddSupplier.SelectedPage = pvpDatosGenerales;
                        Cuenta_Banco.Focus();
                        break;
                }
            }
            else if (sender is RadDropDownList)
            {
                objDropDownList = (RadDropDownList)sender;

                switch (objDropDownList.Name)
                {
                    //tab 1
                    case "Giro_Comercial":
                        pvAddSupplier.SelectedPage = pvpDatosGenerales;
                        Nombre_Fiscal.Focus();
                        break;

                    //tab 4
                    case "Tipo_Inmueble":
                        pvAddSupplier.SelectedPage = pvpDatosGenerales;
                        Tipo_Vialidad.Focus();
                        break;

                    //tab 5
                    case "Tipo_Vialidad":
                        pvAddSupplier.SelectedPage = pvpDatosGenerales;
                        Vialidad.Focus();
                        break;

                    //tab 11
                    case "Entidad_Federativa":
                        pvAddSupplier.SelectedPage = pvpDatosGenerales;
                        Municipio.Focus();
                        break;

                    //tab 12
                    case "Municipio":
                        pvAddSupplier.SelectedPage = pvpDatosGenerales;
                        eMail.Focus();
                        break;
                }
            }
            else if (sender is RadButton)
            {
                objButton = (RadButton)sender;

                switch (objButton.Name)
                {
                    //tab 17
                    case "btnExaminar":
                        pvAddSupplier.SelectedPage = pvpDatosGenerales;
                        btnAceptar.Focus();
                        break;

                    //tab 18
                    case "btnAceptar":
                        pvAddSupplier.SelectedPage = pvpDatosGenerales;
                        btnCancelar.Focus();
                        break;
                }
            }
        }

        #endregion

        /*
         * ---------------------------------------------------------
         * METODOS UTILIZADOS EN EL FORMULARIO "frmRegisterSupplier.cs"
         * ---------------------------------------------------------
         */

        #region Metodos

        private void uploadLogotipo()
        {
            OpenFileDialog BuscarImagen = new OpenFileDialog();
            BuscarImagen.Filter = ".bmp;*.gif;*.jpg;*.png|*.bmp;*.gif;*.jpg;*.png|Imagen Jpg(*.jpg)|*.jpg|Imagen PNG(*.png)|*.png|Imagen Gif(*.gif*)|*.gif";
            BuscarImagen.FileName = "";
            BuscarImagen.Title = "Examinar Imagen";
            if (BuscarImagen.ShowDialog() == DialogResult.OK)
            {
                rutaLogotipo = BuscarImagen.FileName;
                picLogotipo.ImageLocation = rutaLogotipo;
                picLogotipo.SizeMode = PictureBoxSizeMode.StretchImage;
            }
        }

        private void setToDefaultFields()
        {
            this.Giro_Comercial.Items.Add("--SELECCIONE--");
            this.Giro_Comercial.Items.Add("DISTRIBUIDORA DE MEDICAMENTOS");
            this.Giro_Comercial.Items.Add("ABARROTES");
            this.Giro_Comercial.Items.Add("SALUD Y BELLEZA");
            this.Giro_Comercial.Items.Add("CUIDADO DERMATOLOGICO");
            this.Giro_Comercial.Items.Add("LIMPIEZA DEL HOGAR");

            this.Giro_Comercial.SelectedIndex = 0;

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

            supplier = null;
            address = null;

            rutaLogotipo = String.Empty;

            this.picLogotipo.Image = ((System.Drawing.Image)(resources.GetObject("picLogotipo.Image")));
        }

        private void fillDropDownList()
        {
            this.Tipo_Inmueble.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetAddressTypeDropDownList();
            this.Tipo_Inmueble.DisplayMember = "Name";
            this.Tipo_Inmueble.ValueMember = "Id";
            this.Tipo_Inmueble.SelectedIndex = 0;

            this.Tipo_Vialidad.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetRoadTypeDropDownList();
            this.Tipo_Vialidad.DisplayMember = "Name";
            this.Tipo_Vialidad.ValueMember = "Id";
            this.Tipo_Vialidad.SelectedIndex = 0;

            this.Entidad_Federativa.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetStateProvinceDropDownList(); ;
            this.Entidad_Federativa.DisplayMember = "Description";
            this.Entidad_Federativa.ValueMember = "Id";
            this.Entidad_Federativa.SelectedIndex = 0;

            this.Giro_Comercial.Items.Add("--SELECCIONE--");
            this.Giro_Comercial.Items.Add("DISTRIBUIDORA DE MEDICAMENTOS");
            this.Giro_Comercial.Items.Add("ABARROTES");
            this.Giro_Comercial.Items.Add("SALUD Y BELLEZA");
            this.Giro_Comercial.Items.Add("CUIDADO DERMATOLOGICO");
            this.Giro_Comercial.Items.Add("LIMPIEZA DEL HOGAR");

            this.Giro_Comercial.SelectedIndex = 0;

            this.Municipio.SelectedIndex = 0;
        }

        private void recoveryInformationObjectsByUserInterface()
        {
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

            if (supplier == null)
                supplier = new Supplier();

            if (Giro_Comercial.SelectedIndex > 0)
                supplier.BusinessActivity = Giro_Comercial.SelectedItem.ToString();

            supplier.SupplierName = Nombre_Fiscal.Text.Trim().ToUpper().ToString();

            if (string.IsNullOrEmpty(Telefono.Text.Trim().ToString()) || Telefono.Text.Contains("(__)___-_____"))
                supplier.PhoneNumber = null;
            else
                supplier.PhoneNumber = Telefono.Value.ToString().Trim();

            if (string.IsNullOrEmpty(Celular.Text.Trim().ToString()) || Celular.Text.Contains("(___)___-___-____"))
                supplier.CellphoneNumber = null;
            else
                supplier.CellphoneNumber = Celular.Value.ToString().Trim();

            supplier.EmailAddress = eMail.Text.Trim();
            supplier.RFC = RFC.Text.Trim().ToUpper();

            char[] delimiterChars = { ' ' };
            string[] arr = Nombre_Fiscal.Text.Trim().ToUpper().Split(delimiterChars);
            string provKey = String.Empty;
            string rfc_homoclave = String.Empty;
            string abrev_stateprovince = String.Empty;
            string city = String.Empty;

            StringBuilder sb = new StringBuilder();

            foreach (var i in arr)
            {
                if (i.Length > 3)
                {
                    sb.Append(i.Substring(0, 3));
                }
            }

            if (supplier.RFC.Length == 13)
                rfc_homoclave = supplier.RFC.Substring(10, 3);
            else if (supplier.RFC.Length == 12)
                rfc_homoclave = supplier.RFC.Substring(9, 3);

            abrev_stateprovince = BusinessLogicLayer.DropDownListHelperBLL.GetAbrevStateProvince(address.StateProvinceId);
            city = BusinessLogicLayer.DropDownListHelperBLL.GetCityName(address.CityId);

            provKey = sb.ToString();

            supplier.SupplierKey = "OWTK-" + provKey + rfc_homoclave + abrev_stateprovince;

            supplier.CreatedDate = f;
            supplier.CreatedBy = "HECP";
            supplier.LastUpdatedDate = f;
            supplier.LastUpdatedBy = "HECP";

            //Valores automaticos
            supplier.AddressId = 0;
            supplier.UserId = 0;
        }

        private void savePicture()
        {
            bool isNullOrEmpty = picLogotipo == null || picLogotipo.Image == null;

            if (!isNullOrEmpty)
            {
                string folder = @"\images\company_logo\";
                string appPath = Path.GetDirectoryName(Application.StartupPath);
                string folderToSave = appPath.Substring(0, appPath.Length - 4) + folder;

                if (Directory.Exists(folderToSave) == false)
                {
                    Directory.CreateDirectory(folderToSave);
                }

                string companyName = supplier.SupplierKey;
                string filename = companyName + ".jpg";

                picLogotipo.Image.Save(folderToSave + filename, ImageFormat.Jpeg);
            }
            else
            {
                MessageBox.Show(new Form { TopMost = true }, "El logotipo no se ha podido almacenar correctamente", "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void registerSupplierInSystem()
        {
            string message = String.Empty;

            recoveryInformationObjectsByUserInterface();

            message = BusinessLogicLayer.SupplierBLL.procInsertSupplierToSystem(supplier, address, 3);

            if (String.IsNullOrEmpty(message))
            {
                savePicture();

                MessageBox.Show(new Form { TopMost = true }, "Proveedor registrado correctamente", "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Information);

                setToDefaultFields();
            }
            else
            {
                MessageBox.Show(new Form { TopMost = true }, message, "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        #endregion
    }
}
