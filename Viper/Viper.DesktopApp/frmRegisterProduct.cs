/*
 * ---------------------------------------------------------
 * LIBRERIAS UTILIZADAS EN EL FORMULARIO "frmRegisterProduct.cs"
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
    /// CLASE QUE PERMITE EL DAR DE ALTA PRODUCTOS DENTRO DEL 
    /// SISTEMA DE PUNTO DE VENTA PARA FARMACIAS CON VENTA DE 
    /// GENERICOS
    /// </summary>
    public partial class frmRegisterProduct : Form
    {
        /*
         * ---------------------------------------------------------
         * VARIABLES, OBJETOS, Y COMPONENTES UTILIZADOS EN EL FORMULARIO "frmRegisterProduct.cs"
         * ---------------------------------------------------------
         */

        #region Variables, Objetos y Componentes 

        RadButton objButton = null;
        String rutaIcono = String.Empty;

        #endregion

        /*
         * ---------------------------------------------------------
         * CONSTRUCTORES UTILIZADOS EN EL FORMULARIO "frmRegisterProduct.cs"
         * ---------------------------------------------------------
         */

        #region Constructor

        public frmRegisterProduct()
        {
            InitializeComponent();
        }

        #endregion

        /*
         * ---------------------------------------------------------
         * EVENTOS UTILIZADOS EN EL FORMULARIO "frmRegisterProduct.cs"
         * ---------------------------------------------------------
         */

        #region Eventos

        public void Button_Click(Object sender, EventArgs args)
        {
            objButton = (RadButton)sender;

            switch (objButton.Name)
            {
                case "btnAceptar":
                    break;
                case "btnCancelar":
                    break;
                case "btnExaminar":
                    uploadFotografia();
                    break;
            }
        }

        private void frmAddProduct_Load(object sender, EventArgs e)
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

            ToolTip toolTip1 = new ToolTip();

            // Set up the delays for the ToolTip.
            toolTip1.AutoPopDelay = 5000;
            toolTip1.InitialDelay = 1000;
            toolTip1.ReshowDelay = 500;
            // Force the ToolTip text to be displayed whether or not the form is active.
            toolTip1.ShowAlways = true;

            // Set up the ToolTip text for the Button and Checkbox.
            toolTip1.SetToolTip(this.btnAceptar, "Para poder agregar un producto , favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnCancelar, "Para poder cancelar el proceso, favor de dar clic en este boton");

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
         * METODOS UTILIZADOS EN EL FORMULARIO "frmRegisterProduct.cs"
         * ---------------------------------------------------------
         */

        #region Metodos

        private void uploadFotografia()
        {
            OpenFileDialog BuscarImagen = new OpenFileDialog();
            BuscarImagen.Filter = ".bmp;*.gif;*.jpg;*.png|*.bmp;*.gif;*.jpg;*.png|Imagen Jpg(*.jpg)|*.jpg|Imagen PNG(*.png)|*.png|Imagen Gif(*.gif*)|*.gif";
            BuscarImagen.FileName = "";
            BuscarImagen.Title = "Examinar Imagen";
            if (BuscarImagen.ShowDialog() == DialogResult.OK)
            {
                rutaIcono = BuscarImagen.FileName;
                String Direccion = BuscarImagen.FileName;
                picMedicamento.ImageLocation = Direccion;
                picMedicamento.SizeMode = PictureBoxSizeMode.StretchImage;
            }
        }

        private void savePicture()
        {
            bool isNullOrEmpty = picMedicamento == null || picMedicamento.Image == null;

            if (!isNullOrEmpty)
            {
                string folder = @"\images\product_pictures\";
                string appPath = Path.GetDirectoryName(Application.StartupPath);
                string folderToSave = appPath.Substring(0, appPath.Length - 4) + folder;

                if (Directory.Exists(folderToSave) == false)
                {
                    Directory.CreateDirectory(folderToSave);
                }

                string barCode = Codigo_Barras.Text.Trim().ToString();
                string filename = barCode + ".jpg";

                picMedicamento.Image.Save(folderToSave + filename, ImageFormat.Jpeg);
            }
            else
            {
                MessageBox.Show(new Form { TopMost = true }, "La imagen del producto no se ha podido almacenar correctamente", "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        public static byte[] ImageToByte(Image img)
        {
            ImageConverter converter = new ImageConverter();
            return (byte[])converter.ConvertTo(img, typeof(byte[]));
        }

        #endregion
    }
}
