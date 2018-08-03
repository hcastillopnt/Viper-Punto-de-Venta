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
    public partial class frmRegisterCompany : Form
    {
        #region Variables and Objects of Class

        DateTime f = DateTime.Today;
        ComponentResourceManager resources = new ComponentResourceManager(typeof(frmRegisterCompany));
        RadButton objButton = null;
        String rutaLogotipo = String.Empty;
        Company company = null;
        Address address = null;
        AddressSAT addressSAT = null;
        string RegimenFiscal = String.Empty;

        public static RadTextBox Regimen_Fiscal;

        #endregion

        #region Constructor

        public frmRegisterCompany()
        {
            InitializeComponent();

            uploadControlRegimenFiscalByCode();

            fillDropDownList();
        }

        public frmRegisterCompany(int CompanyID)
        {
            InitializeComponent();

            uploadControlRegimenFiscalByCode();

            uploadDataCompany(CompanyID);
        }

        #endregion

        #region Events of the controls 

        public void frmLogin_FormClosing(object sender, FormClosingEventArgs args)
        {
            args.Cancel = args.CloseReason == CloseReason.UserClosing;
        }

        private void frmRegisterCompany_Load(object sender, EventArgs e)
        {
            //Set default configuration to UI
            this.AcceptButton = btnAceptar;
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
            //this.Icon = new Icon("Resources/application_icon.ico");

            //Set Event to form
            this.FormClosing += new FormClosingEventHandler(frmLogin_FormClosing);

            //Establecer los eventos a los controles
            this.btnRegimenFiscal.Click += Button_Click;
            this.btnExaminar.Click += Button_Click;
            this.btnAceptar.Click += Button_Click;
            this.btnCancelar.Click += Button_Click;
            this.btnCuentasBanco.Click += Button_Click;
            this.btnImportarDatosFiscales.Click += Button_Click;
            this.Entidad_Federativa.SelectedIndexChanged += cboEstado_SelectedIndexChanged;
            this.Entidad_Federativa_Fiscal.SelectedIndexChanged += cboEstadoFiscal_SelectedIndexChanged;
            this.Giro_Comercial.KeyPress += OnlyLetters_KeyPress;
            this.Nombre_Empresa.KeyPress += OnlyLetters_KeyPress;
            this.Vialidad.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.Codigo_Postal.KeyPress += OnlyNumbers_KeyPress;
            this.No_Ext.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.No_Int.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.Colonia.KeyPress += OnlyLettersAndNumbers_KeyPress;
            //this.eMail.TabIndex = 12;
            this.Telefono.KeyPress += OnlyNumbers_KeyPress;
            this.Celular.KeyPress += OnlyNumbers_KeyPress;
            this.Nombre_Fiscal.KeyPress += OnlyLetters_KeyPress;
            this.RFC.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.CURP.KeyPress += OnlyLettersAndNumbers_KeyPress;
            Regimen_Fiscal.KeyPress += OnlyLetters_KeyPress;
            this.Vialidad_Fiscal.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.Codigo_Postal_Fiscal.KeyPress += OnlyNumbers_KeyPress;
            this.No_Ext_Fiscal.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.No_Int_Fiscal.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.Colonia_Fiscal.KeyPress += OnlyLettersAndNumbers_KeyPress;

            //Establecer el foco en el primer campo
            this.ActiveControl = Nombre_Empresa;
            this.Nombre_Empresa.Focus();

            // Create the ToolTip and associate with the Form container.
            ToolTip toolTip1 = new ToolTip();

            // Set up the delays for the ToolTip.
            toolTip1.AutoPopDelay = 5000;
            toolTip1.InitialDelay = 1000;
            toolTip1.ReshowDelay = 500;
            // Force the ToolTip text to be displayed whether or not the form is active.
            toolTip1.ShowAlways = true;

            // Set up the ToolTip text for the Button and Checkbox.
            toolTip1.SetToolTip(this.btnAceptar, "Para poder guardar los datos de la compañia registrada y sus datos fiscales, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnCancelar, "Para limpiar el formulario, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnCuentasBanco, "Para añadir alguna cuenta de banco ligada a su negocio, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnImportarDatosFiscales, "Para copiar los datos proporcionado en la parte superior como fiscales, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnRegimenFiscal, "Para seleccionar el regimen fiscal correspondiente a su giro de negocio, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnExaminar, "Para buscar el logotipo de su negocio almacenado en su pc, favor de dar clic en este boton");

            // Set up the ToolTip text for the TextBox and ComboBox Control.
            toolTip1.SetToolTip(this.Giro_Comercial, UtilMessages.GIRO_COMPAÑIA);
            toolTip1.SetToolTip(this.eMail, UtilMessages.EMAIL_COMPAÑIA);
            toolTip1.SetToolTip(this.Tipo_Inmueble, UtilMessages.TIPO_INMUEBLE_COMPAÑIA);
            toolTip1.SetToolTip(this.lblTipoInmuebleFiscal, UtilMessages.TIPO_DE_INMUEBLE_FISCAL_COMPAÑIA);
            toolTip1.SetToolTip(this.Vialidad, UtilMessages.NOMBRE_VIALIDAD_COMPAÑIA);
            toolTip1.SetToolTip(this.Vialidad_Fiscal, UtilMessages.NOMBRE_VIALIDAD_FISCAL_COMPAÑIA);
            toolTip1.SetToolTip(this.Entidad_Federativa, UtilMessages.ESTADO_COMPAÑIA);
            toolTip1.SetToolTip(this.Entidad_Federativa_Fiscal, UtilMessages.ESTADO_FISCAL_COMPAÑIA);
            toolTip1.SetToolTip(this.Municipio, UtilMessages.LOCALIDAD_COMPAÑIA);
            toolTip1.SetToolTip(this.Municipio_Fiscal, UtilMessages.LOCALIDAD_FISCAL_COMPAÑIA);
            toolTip1.SetToolTip(this.Colonia, UtilMessages.COLONIA_COMPAÑIA);
            toolTip1.SetToolTip(this.Colonia_Fiscal, UtilMessages.COLONIA_FISCAL_COMPAÑIA);
            toolTip1.SetToolTip(this.Codigo_Postal, UtilMessages.CODIGO_POSTAL_COMPAÑIA);
            toolTip1.SetToolTip(this.Codigo_Postal_Fiscal, UtilMessages.CODIGO_POSTAL_FISCAL_COMPAÑIA);
            toolTip1.SetToolTip(this.No_Int, UtilMessages.NUMERO_INTERIOR_COMPAÑIA);
            toolTip1.SetToolTip(this.No_Int_Fiscal, UtilMessages.NUMERO_INTERIOR_FISCAL_COMPAÑIA);
            toolTip1.SetToolTip(this.No_Ext, UtilMessages.NUMERO_EXTERIOR_COMPAÑIA);
            toolTip1.SetToolTip(this.No_Ext_Fiscal, UtilMessages.NUMERO_EXTERIOR_FISCAL_COMPAÑIA);
            toolTip1.SetToolTip(this.RFC, UtilMessages.RFC_FISCAL_COMPAÑIA);
            toolTip1.SetToolTip(this.CURP, UtilMessages.CURP_FISCAL_COMPAÑIA);

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
                    registerCompanyInSystem();
                    break;

                case "btnCancelar":
                    setToDefaultFields();
                    break;
            }
        }

        private void cboEstado_SelectedIndexChanged(object sender, Telerik.WinControls.UI.Data.PositionChangedEventArgs e)
        {
            Municipio.Items.Clear();

            if (Entidad_Federativa.SelectedIndex > 0)
            {
                Municipio.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetCityDropDownList(Convert.ToInt32(Entidad_Federativa.SelectedValue));
                Municipio.DisplayMember = "Description";
                Municipio.ValueMember = "Id";
                Municipio.SelectedIndex = 0;
            }
            else
            {
                Municipio.Items.Add("--SELECCIONE--");
            }
        }

        private void cboEstadoFiscal_SelectedIndexChanged(object sender, Telerik.WinControls.UI.Data.PositionChangedEventArgs e)
        {
            Municipio_Fiscal.Items.Clear();

            if (Entidad_Federativa_Fiscal.SelectedIndex > 0)
            {
                Municipio_Fiscal.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetCityDropDownList(Convert.ToInt32(Entidad_Federativa_Fiscal.SelectedValue));
                Municipio_Fiscal.DisplayMember = "Description";
                Municipio_Fiscal.ValueMember = "Id";
                Municipio_Fiscal.SelectedIndex = 0;
            }
            else
            {
                Municipio_Fiscal.Items.Add("--SELECCIONE--");
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

        private String extractValueOfString(String cadena, String stringInicial, String stringFinal)
        {
            int terminaString = cadena.LastIndexOf(stringFinal);
            String nuevoString = cadena.Substring(0, terminaString);
            int offset = stringInicial.Length;
            int iniciaString = nuevoString.LastIndexOf(stringInicial) + offset;
            int cortar = nuevoString.Length - iniciaString;
            nuevoString = nuevoString.Substring(iniciaString, cortar);
            return nuevoString;
        }

        private void uploadDataCompany(int CompanyID)
        {
            company = BusinessLogicLayer.CompanyBLL.getCompanyRegisteredByCompanyID(CompanyID);
            address = BusinessLogicLayer.CompanyBLL.getCompanyAddressRegisteredByCompanyID(company.AddressId);
            addressSAT = BusinessLogicLayer.CompanyBLL.getCompanyAddressSATRegisteredByCompanyID(company.AddressSATId);

            this.Tipo_Inmueble.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetAddressTypeDropDownList();
            this.Tipo_Inmueble.DisplayMember = "Name";
            this.Tipo_Inmueble.ValueMember = "Id";

            this.Tipo_Vialidad.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetRoadTypeDropDownList();
            this.Tipo_Vialidad.DisplayMember = "Name";
            this.Tipo_Vialidad.ValueMember = "Id";

            this.Entidad_Federativa.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetStateProvinceDropDownList(); ;
            this.Entidad_Federativa.DisplayMember = "Description";
            this.Entidad_Federativa.ValueMember = "Id";

            this.Municipio.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetCityDropDownList(address.StateProvinceId);
            this.Municipio.DisplayMember = "Description";
            this.Municipio.ValueMember = "Id";

            this.Giro_Comercial.Items.Add("FARMACIA");
            this.Giro_Comercial.SelectedIndex = 1;

            this.Nombre_Empresa.Text = company.CompanyName;
            this.Tipo_Inmueble.SelectedValue = address.AddressTypeId;
            this.Tipo_Vialidad.SelectedValue = address.RoadTypeId;
            this.Codigo_Postal.Text = address.PostalCode;
            if (address.AddressLine1.Contains("NO. INT: "))
            {
                this.Vialidad.Text = extractValueOfString(address.AddressLine1, "CALLE: ", ", NO. EXT:");
                this.No_Ext.Text = extractValueOfString(address.AddressLine1, "NO. EXT: ", ",");
                this.No_Int.Text = extractValueOfString(address.AddressLine1, "NO. INT: ", ";");
            }
            else
            {
                this.Vialidad.Text = extractValueOfString(address.AddressLine1, "CALLE: ", ",");
                this.No_Ext.Text = extractValueOfString(address.AddressLine1, "NO. EXT: ", ";");
            }
            this.Colonia.Text = extractValueOfString(address.AddressLine2, "COLONIA: ", ";");
            this.Entidad_Federativa.SelectedValue = address.StateProvinceId;
            this.Municipio.SelectedValue = address.CityId;
            this.eMail.Text = company.EmailAddress;
            this.Telefono.Text = company.PhoneNumber;
            this.Celular.Text = company.CellphoneNumber;
            this.Nombre_Fiscal.Text = company.FiscalName;
            this.RFC.Text = company.RFC;
            this.CURP.Text = company.CURP;
            Regimen_Fiscal.Text = BusinessLogicLayer.CompanyBLL.getRegimenFiscalByID(company.RegimenFiscalId);

            this.Tipo_Vialidad_Fiscal.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetRoadTypeDropDownList();
            this.Tipo_Vialidad_Fiscal.DisplayMember = "Name";
            this.Tipo_Vialidad_Fiscal.ValueMember = "Id";

            this.Tipo_Inmueble_Fiscal.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetAddressTypeDropDownList();
            this.Tipo_Inmueble_Fiscal.DisplayMember = "Name";
            this.Tipo_Inmueble_Fiscal.ValueMember = "Id";

            this.Entidad_Federativa_Fiscal.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetStateProvinceDropDownList();
            this.Entidad_Federativa_Fiscal.DisplayMember = "Description";
            this.Entidad_Federativa_Fiscal.ValueMember = "Id";

            this.Municipio_Fiscal.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetCityDropDownList(addressSAT.StateProvinceId);
            this.Municipio_Fiscal.DisplayMember = "Description";
            this.Municipio_Fiscal.ValueMember = "Id";

            this.Tipo_Inmueble_Fiscal.SelectedValue = addressSAT.AddressTypeId;
            this.Tipo_Vialidad_Fiscal.SelectedValue = addressSAT.RoadTypeId;
            this.Codigo_Postal_Fiscal.Text = addressSAT.PostalCode;
            if (addressSAT.AddressLine1.Contains("NO. INT: "))
            {
                this.Vialidad_Fiscal.Text = extractValueOfString(addressSAT.AddressLine1, "CALLE: ", ", NO. EXT:");
                this.No_Ext_Fiscal.Text = extractValueOfString(addressSAT.AddressLine1, "NO. EXT: ", ",");
                this.No_Int_Fiscal.Text = extractValueOfString(addressSAT.AddressLine1, "NO. INT: ", ";");
            }
            else
            {
                this.Vialidad_Fiscal.Text = extractValueOfString(addressSAT.AddressLine1, "CALLE: ", ",");
                this.No_Ext_Fiscal.Text = extractValueOfString(addressSAT.AddressLine1, "NO. EXT: ", ";");
            }
            this.Colonia_Fiscal.Text = extractValueOfString(addressSAT.AddressLine2, "COLONIA: ", ";");
            this.Entidad_Federativa_Fiscal.SelectedValue = addressSAT.StateProvinceId;
            this.Municipio_Fiscal.SelectedValue = addressSAT.CityId;

            this.btnCancelar.Enabled = false;
            this.btnAceptar.Enabled = false;
            this.btnExaminar.Enabled = false;
            this.btnImportarDatosFiscales.Enabled = false;
            this.btnRegimenFiscal.Enabled = false;

            string folder = @"\images\company_logo\";
            string appPath = Path.GetDirectoryName(Application.StartupPath);
            string folderToSave = appPath.Substring(0, appPath.Length - 4) + folder;

            if (Directory.Exists(folderToSave))
            {
                string companyName = Nombre_Empresa.Text.Trim().ToString();
                string filename = companyName + ".jpg";
                string curFile = folderToSave + filename;

                if (File.Exists(curFile))
                {
                    this.picLogotipo.Image = Image.FromFile(folderToSave + filename);
                    this.picLogotipo.SizeMode = PictureBoxSizeMode.StretchImage;
                }
            }

            this.Giro_Comercial.Enabled = false;
            this.Nombre_Empresa.Enabled = false;
            this.Tipo_Inmueble.Enabled = false;
            this.Tipo_Vialidad.Enabled = false;
            this.Vialidad.Enabled = false;
            this.Codigo_Postal.Enabled = false;
            this.No_Ext.Enabled = false;
            this.No_Int.Enabled = false;
            this.Colonia.Enabled = false;
            this.Entidad_Federativa.Enabled = false;
            this.Municipio.Enabled = false;
            this.eMail.Enabled = false;
            this.Telefono.Enabled = false;
            this.Celular.Enabled = false;
            this.Nombre_Fiscal.Enabled = false;
            this.RFC.Enabled = false;
            this.CURP.Enabled = false;
            Regimen_Fiscal.Enabled = false;
            this.Tipo_Inmueble_Fiscal.SelectedIndex = 0;
            this.Tipo_Vialidad_Fiscal.SelectedIndex = 0;
            this.Vialidad_Fiscal.Enabled = false;
            this.Codigo_Postal_Fiscal.Enabled = false;
            this.No_Ext_Fiscal.Enabled = false;
            this.No_Int_Fiscal.Enabled = false;
            this.Colonia_Fiscal.Enabled = false;
            this.Entidad_Federativa_Fiscal.Enabled = false;
            this.Municipio_Fiscal.Enabled = false;
            this.Tipo_Inmueble_Fiscal.Enabled = false;
            this.Tipo_Vialidad_Fiscal.Enabled = false;
            this.Vialidad_Fiscal.Enabled = false;
            this.No_Ext_Fiscal.Enabled = false;
            this.No_Int_Fiscal.Enabled = false;
            this.Codigo_Postal_Fiscal.Enabled = false;
            this.Colonia_Fiscal.Enabled = false;
            this.Entidad_Federativa_Fiscal.Enabled = false;
            this.Municipio_Fiscal.Enabled = false;
        }

        private void uploadControlRegimenFiscalByCode()
        {
            //Create control RadTextBox to Regimen_Fiscal, because is static control to can receive value in TextBox of here
            Regimen_Fiscal = new Telerik.WinControls.UI.RadTextBox();

            ((System.ComponentModel.ISupportInitialize)(Regimen_Fiscal)).BeginInit();

            this.tlpDC_01.Controls.Add(Regimen_Fiscal, 0, 0);

            Regimen_Fiscal.AutoSize = false;
            Regimen_Fiscal.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            Regimen_Fiscal.Dock = System.Windows.Forms.DockStyle.Fill;
            Regimen_Fiscal.Enabled = false;
            Regimen_Fiscal.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            Regimen_Fiscal.Location = new System.Drawing.Point(3, 3);
            Regimen_Fiscal.Name = "Regimen_Fiscal";
            Regimen_Fiscal.NullText = "REGIMEN FISCAL";
            Regimen_Fiscal.Size = new System.Drawing.Size(683, 20);
            Regimen_Fiscal.ThemeName = "VisualStudio2012Light";

            ((System.ComponentModel.ISupportInitialize)(Regimen_Fiscal)).EndInit();
        }

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
            address.CountryRegionId = 159;
            address.StateProvinceId = Convert.ToInt32(Entidad_Federativa.SelectedValue);
            address.CityId = Convert.ToInt32(Municipio.SelectedValue);
            address.PostalCode = Codigo_Postal.Text.Trim();
            address.CreatedDate = f;
            address.CreateBy = "HECP";
            address.ModifiedDate = f;
            address.ModifiedBy = "HECP";

            message = BusinessLogicLayer.CompanyBLL.validateAddressWithDataAnnotations(address);

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
            this.Giro_Comercial.Items.Add("FARMACIA");
            this.Giro_Comercial.SelectedIndex = 1;

            this.Nombre_Empresa.Text = String.Empty;
            this.Tipo_Inmueble.SelectedIndex = 0;
            this.Tipo_Vialidad.SelectedIndex = 0;
            this.Vialidad.Text = String.Empty;
            this.Codigo_Postal.Text = String.Empty;
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
            this.CURP.Text = String.Empty;
            Regimen_Fiscal.Text = String.Empty;
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

            company = null;
            address = null;
            addressSAT = null;

            rutaLogotipo = String.Empty;
            RegimenFiscal = String.Empty;

            this.picLogotipo.Image = ((System.Drawing.Image)(resources.GetObject("picLogotipo.Image")));
        }

        private void registerCompanyInSystem()
        {
            string message = String.Empty;

            recoveryInformationObjectsByUserInterface();

            message = BusinessLogicLayer.CompanyBLL.sp_insert_company(company, address, addressSAT);

            if (String.IsNullOrEmpty(message))
            {
                savePicture();

                MessageBox.Show(new Form { TopMost = true }, "Empresa registrada correctamente", "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Information);

                setToDefaultFields();
            }
            else
            {
                MessageBox.Show(new Form { TopMost = true }, message, "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
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
            address.CountryRegionId = 159;
            address.StateProvinceId = Convert.ToInt32(Entidad_Federativa.SelectedValue);
            address.CityId = Convert.ToInt32(Municipio.SelectedValue);
            address.PostalCode = Codigo_Postal.Text.Trim();
            address.CreatedDate = f;
            address.CreateBy = "HECP";
            address.ModifiedDate = f;
            address.ModifiedBy = "HECP";

            if (addressSAT == null)
                addressSAT = new AddressSAT();

            addressSAT.RoadTypeId = Convert.ToInt32(Tipo_Vialidad_Fiscal.SelectedValue);
            addressSAT.AddressTypeId = Convert.ToInt32(Tipo_Inmueble_Fiscal.SelectedValue);
            if (!string.IsNullOrEmpty(No_Int_Fiscal.Text.Trim().ToString()))
                addressSAT.AddressLine1 = "CALLE: " + Vialidad_Fiscal.Text.Trim() + ", NO. EXT: " + No_Ext_Fiscal.Text.Trim() + ", NO. INT:" + No_Int_Fiscal.Text.Trim() + ";";
            else
                addressSAT.AddressLine1 = "CALLE: " + Vialidad_Fiscal.Text.Trim() + ", NO. EXT: " + No_Ext_Fiscal.Text.Trim() + ";";
            addressSAT.AddressLine2 = "COLONIA: " + Colonia_Fiscal.Text.Trim() + ";";
            addressSAT.CountryRegionId = 159;
            addressSAT.StateProvinceId = Convert.ToInt32(Entidad_Federativa_Fiscal.SelectedValue);
            addressSAT.CityId = Convert.ToInt32(Municipio_Fiscal.SelectedValue);
            addressSAT.PostalCode = Codigo_Postal_Fiscal.Text.Trim();
            addressSAT.CreatedDate = f;
            addressSAT.CreateBy = "HECP";
            addressSAT.ModifiedDate = f;
            addressSAT.ModifiedBy = "HECP";

            if (company == null)
                company = new Company();

            company.BusinessActivity = Giro_Comercial.SelectedItem.ToString();
            company.CompanyName = Nombre_Empresa.Text.Trim().ToUpper();
            company.CompanyKey = BusinessLogicLayer.CompanyBLL.obtainCompanyKeyGeneratedAutomatic();

            if (string.IsNullOrEmpty(Telefono.Text.Trim().ToString()) || Telefono.Text.Contains("(__)___-_____"))
                company.PhoneNumber = null;
            else
                company.PhoneNumber = Telefono.Text.Trim();

            if (string.IsNullOrEmpty(Celular.Text.Trim().ToString()) || Celular.Text.Contains("(___)___-___-____"))
                company.CellphoneNumber = null;
            else
                company.CellphoneNumber = Celular.Text.Trim();

            company.EmailAddress = eMail.Text.Trim();
            company.FiscalName = Nombre_Fiscal.Text.Trim().ToUpper();
            company.RFC = RFC.Text.Trim().ToUpper();
            company.CURP = CURP.Text.Trim().ToUpper();
            company.LoginID = company.RFC;
            company.PasswordEncrypted = "admin";

            if (!string.IsNullOrEmpty(Regimen_Fiscal.Text.Trim().ToString()))
                company.RegimenFiscalId = BusinessLogicLayer.CompanyBLL.getRegimenIdByName(Regimen_Fiscal.Text.Trim().ToString());

            //company.Logo = ImageToByte(picLogotipo.Image);
            company.CreatedDate = f;
            company.CreateBy = "HECP";
            company.ModifiedDate = f;
            company.ModifiedBy = "HECP";
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

                string companyName = Nombre_Empresa.Text.Trim().ToString();
                string filename = companyName + ".jpg";

                picLogotipo.Image.Save(folderToSave + filename, ImageFormat.Jpeg);
            }
            else
            {
                MessageBox.Show(new Form { TopMost = true }, "El logotipo no se ha podido almacenar correctamente", "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        public static byte[] ImageToByte(Image img)
        {
            ImageConverter converter = new ImageConverter();
            return (byte[])converter.ConvertTo(img, typeof(byte[]));
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

            this.Giro_Comercial.Items.Add("FARMACIA");
            this.Giro_Comercial.SelectedIndex = 1;

            this.Municipio.SelectedIndex = 0;
            this.Municipio_Fiscal.SelectedIndex = 0;
        }

        #endregion
    }
}
