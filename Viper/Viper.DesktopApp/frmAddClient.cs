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
    public partial class frmAddClient : Form
    {
        #region Variables and Objects of the class
        RadButton objButton = null;
        String rutaLogotipo = String.Empty;

        #endregion

        #region Constructor
        public frmAddClient()
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
