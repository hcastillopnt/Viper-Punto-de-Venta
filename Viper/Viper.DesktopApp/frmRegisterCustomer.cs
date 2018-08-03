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

namespace Viper.DesktopApp
{
    public partial class frmRegisterCustomer : Form
    {
        #region Variables and Objects of the class
        RadButton objButton = null;
        String rutaLogotipo = String.Empty;

        #endregion

        #region Constructor
        public frmRegisterCustomer()
        {
            InitializeComponent();
        }
        #endregion
        
        #region  CONTROLAR TAB ORDER


        // DATOS BÁSICOS
        //TAB DE RFC A TELEFONO
        private void RFC_Leave_1(object sender, EventArgs e)
        {
          Telefono.Focus();
        }

        //TAB DE CELULAR A BTN EXAMINAR
        private void Celular_Leave_1(object sender, EventArgs e)
        {
         btnExaminar.Focus();
        }

        //TAB DE BTN EXAMINAR A LÍMITE DE CREDITO
        private void btnExaminar_Leave_1(object sender, EventArgs e)
        {
         Límite_De_Credito.Focus();
        }

        //TAB DE EMAIL A RFC
        private void Email_Leave_1(object sender, EventArgs e)
        {
         RFC.Focus();
        }

        #endregion

        #region Events of the controls
        private void frmAddClient_Load(object sender, EventArgs e)
        {
            //Set default configuration to UI
            this.AcceptButton = btnAceptar_;
            this.AutoSize = true;
            this.ControlBox = true;
            this.FormBorderStyle = FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.StartPosition = FormStartPosition.CenterScreen;
            this.Text = "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions";
            this.Size = new Size(1000, 600);
            this.Top = (Screen.PrimaryScreen.WorkingArea.Height - this.Height) / 2;
            this.Left = (Screen.PrimaryScreen.WorkingArea.Width - this.Width) / 2;

            this.Razón_Social_Fiscal.Focus();
            this.btnAceptar_.Click += Button_Click;
            this.btnAceptarFiscal.Click += Button_Click;
            this.btnBuscar.Click += Button_Click;
            this.btnExaminar.Click += Button_Click;
            this.Nombre.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.Apellidos.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.Email.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.RFC.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.Telefono.KeyPress += OnlyNumbers_KeyPress;
            this.Celular.KeyPress += OnlyNumbers_KeyPress;
            this.Límite_De_Credito.KeyPress += OnlyNumbers_KeyPress;
            this.Monedero_Electrónico.KeyPress += OnlyNumbers_KeyPress;
            this.Saldo.KeyPress += OnlyNumbers_KeyPress;
            this.Saldo_Vencido.KeyPress += OnlyNumbers_KeyPress;
            this.Fecha_De_Captura.KeyPress += OnlyLettersAndNumbers_KeyPress;

            ToolTip toolTip1 = new ToolTip();

            // Set up the delays for the ToolTip.
            toolTip1.AutoPopDelay = 5000;
            toolTip1.InitialDelay = 1000;
            toolTip1.ReshowDelay = 500;
            // Force the ToolTip text to be displayed whether or not the form is active.
            toolTip1.ShowAlways = true;

            // Set up the ToolTip text for the Button and Checkbox.
            toolTip1.SetToolTip(this.btnAceptar_, "Para poder registrar los datos del cliente , favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnAceptarFiscal, "Para poder registrar los datos fiscales del cliente, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnExaminar, "Para seleccionar una imagen del equipo, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnBuscar , "Para buscar los datos de un cliente, favor de dar clic en este boton");

            // Set up the ToolTip text for the TextBox and ComboBox Control.
            // Datos Básicos
            toolTip1.SetToolTip(this.Email, UtilMessages.EMAIL_AGREGAR_CLIENTE);
            toolTip1.SetToolTip(this.Monedero_Electrónico, UtilMessages.MONEDERO_ELECTRONICO_AGREGAR_CLIENTE);
            toolTip1.SetToolTip(this.Límite_De_Credito, UtilMessages.LIMITE_CREDITO_AGREGAR_CLIENTE);
            toolTip1.SetToolTip(this.Saldo, UtilMessages.SALDO_AGREGAR_CLIENTE);
            toolTip1.SetToolTip(this.Saldo_Vencido, UtilMessages.SALDO_VENCIDO_AGREGAR_CLIENTE);
            toolTip1.SetToolTip(this.RFC, UtilMessages.RFC_AGREGAR_CLIENTE);
            toolTip1.SetToolTip(this.Numero_De_Cliente , UtilMessages .CLAVE_AGREGAR_CLIENTE );
            // Datos de facturación
            toolTip1.SetToolTip(this.Razón_Social_Fiscal, UtilMessages.RAZON_SOCIAL_AGREGAR_CLIENTE);
            toolTip1.SetToolTip(this.RFC_Fiscal, UtilMessages.RFC_FISCAL_AGREGAR_CLIENTE);
            toolTip1.SetToolTip(this.CURP_Fiscal , UtilMessages.CURP_FISCAL_AGREGAR_CLIENTE );
            toolTip1.SetToolTip(this.Calle_Fiscal, UtilMessages.CALLE_POSTAL_FISCAL_AGREGAR_CLIENTE);
            toolTip1.SetToolTip(this.Código_Postal_Fiscal, UtilMessages.CODIGO_POSTAL_FISCAL_AGREGAR_CLIENTE);
            toolTip1.SetToolTip(this.Número_Interior_Fiscal, UtilMessages.NUMERO_INTERIOR_FISCAL_AGREGAR_CLIENTE);
            toolTip1.SetToolTip(this.Número_Exterior_Fiscal, UtilMessages.NUMERO_EXTERIOR_FISCAL_AGREGAR_CLIENTE);
            toolTip1.SetToolTip(this.Colonia_Fiscal, UtilMessages.COLONIA_FISCAL_AGREGAR_CLIENTE);
            toolTip1.SetToolTip(this.cboMunicipio_Fiscal, UtilMessages.MUNICIPIO_FISCAL_AGREGAR_CLIENTE);
            toolTip1.SetToolTip(this.cboEstado_Fiscal , UtilMessages .ESTADO_FISCAL_AGREGAR_CLIENTE );
            toolTip1.SetToolTip(this.cboPais_Fiscal, UtilMessages.PAIS_FISCAL_AGREGAR_CLIENTE);



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

        public void Button_Click(Object sender, EventArgs args)
        {
            objButton = (RadButton)sender;

            switch (objButton.Name)
            {
                case "btnAceptar_":
                    break;
                case "btnAceptarFiscal":
                    break;
                case "btnBuscar":

                    break;
                case "btnExaminar":
                    examinar();
                    break;


            }
        }
        #endregion

        #region Methods of the class
        private void examinar()
        {
            OpenFileDialog BuscarImagen = new OpenFileDialog();
            BuscarImagen.Filter = ".bmp;*.gif;*.jpg;*.png|*.bmp;*.gif;*.jpg;*.png|Imagen Jpg(*.jpg)|*.jpg|Imagen PNG(*.png)|*.png|Imagen Gif(*.gif*)|*.gif";
            BuscarImagen.FileName = "";
            BuscarImagen.Title = "Examinar Imagen";
            if (BuscarImagen.ShowDialog() == DialogResult.OK)
            {
                rutaLogotipo = BuscarImagen.FileName;
                String Direccion = BuscarImagen.FileName;
                picImageCliente.ImageLocation = Direccion;
                picImageCliente.SizeMode = PictureBoxSizeMode.StretchImage;
            }
        }
        #endregion 

    }
}
