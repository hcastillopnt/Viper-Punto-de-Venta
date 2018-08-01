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
    public partial class frmAddProduct : Form
    {
        #region Variables and objects of class
        RadButton objButton = null;
        String rutaLogotipo = String.Empty;

        #endregion

        #region Constructor
        public frmAddProduct()
        {
            InitializeComponent();
        }
        #endregion


        #region CONTROLAR TAB ORDER

        //TAB DE INVENTARIO MAXIMO AL BOTON AGREGAR PRODUCTO
        private void Inventario_Maximo_Leave(object sender, EventArgs e)
        {
            btnAgregarProducto.Focus();
        }
        

        //TAB DE BOTON AGREGAR PRODUCTO A CODIGO DE BARRAS

        private void btnAgregarProducto_Leave(object sender, EventArgs e)
        {
            Codigo_de_barras.Focus();
        }
        #endregion

        #region Events of the controls
        public void Button_Click(Object sender, EventArgs args)
        {
            objButton = (RadButton)sender;

            switch (objButton.Name)
            {
                case "btnAgregarProducto":
                    agregarProducto();
                    break;
                case "btnCancelar":
                    this.Hide();
                    break;
                case "btnEliminar":

                    break;
                case "btnAgregarImagen":
                    examinar();
                    break;


            }
        }

        private void frmAddProduct_Load(object sender, EventArgs e)
        {
            //Set default configuration to UI
            this.AcceptButton = btnAgregarProducto;
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
            //this.Icon = new Icon("Resources/application_icon.ico");

            this.btnAgregarProducto.Click += Button_Click;
            this.btnCancelar.Click += Button_Click;
            this.btnExaminar.Click += Button_Click;
            this.btnAgregarImagen.Click += Button_Click;
            this.Codigo_de_barras.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.Clave_Alterna.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.Sustancia_Activa.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.Descripcion.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.radTextBox1.KeyPress += OnlyNumbers_KeyPress;
            this.Precio_Venta.KeyPress += OnlyNumbers_KeyPress;
            this.Localización.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.Inv_Minimo.KeyPress += OnlyNumbers_KeyPress;
            this.Inv_Maximo.KeyPress += OnlyNumbers_KeyPress;
            this.Existencia.KeyPress += OnlyNumbers_KeyPress;

            ToolTip toolTip1 = new ToolTip();

            // Set up the delays for the ToolTip.
            toolTip1.AutoPopDelay = 5000;
            toolTip1.InitialDelay = 1000;
            toolTip1.ReshowDelay = 500;
            // Force the ToolTip text to be displayed whether or not the form is active.
            toolTip1.ShowAlways = true;

            // Set up the ToolTip text for the Button and Checkbox.
            toolTip1.SetToolTip(this.btnAgregarProducto, "Para poder agregar un producto , favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnCancelar, "Para poder cancelar el proceso, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnAgregarImagen, "Para agregar la imagen, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnExaminar, "Para seleccionar una imagen del equipo, favor de dar clic en este boton");

            // Set up the ToolTip text for the TextBox and ComboBox Control.
            // Datos Básicos
            toolTip1.SetToolTip(this.Codigo_de_barras, UtilMessages.CODIGO_DE_BARRAS_AGREGAR_PRODUCTO);
            toolTip1.SetToolTip(this.Clave_Alterna, UtilMessages.CLAVE_ALTERNA_AGREGAR_PRODUCTO);
            toolTip1.SetToolTip(this.lblSustanciaActiva, UtilMessages.SUSTANCIA_ACTIVA_AGREGAR_PRODUCTO);
            toolTip1.SetToolTip(this.Servicio, UtilMessages.SERVICIO_AGREGAR_PRODUCTO);
            toolTip1.SetToolTip(this.Medicamento, UtilMessages.MEDICAMENTO_AGREGAR_PRODUCTO);
            toolTip1.SetToolTip(this.radCheckBox1, UtilMessages.ARTICULO_AGREGAR_PRODUCTO);
            toolTip1.SetToolTip(this.Departamento, UtilMessages.DEPARTAMENTO_AGREGAR_PRODUCTO);
            toolTip1.SetToolTip(this.Categoría, UtilMessages.CATEGORIA_AGREGAR_PRODUCTO);
            toolTip1.SetToolTip(this.Descripcion, UtilMessages.DESCRIPCION_AGREGAR_PRODUCTO);
            toolTip1.SetToolTip(this.radTextBox1, UtilMessages.PRECIO_COSTO_AGREGAR_PRODUCTO);
            toolTip1.SetToolTip(this.Precio_Venta, UtilMessages.PRECIO_VENTA_AGREGAR_PRODUCTO);
            toolTip1.SetToolTip(this.Inv_Maximo, UtilMessages.IVENTARIO_MAXIMO_AGREGAR_PRODUCTO);
            toolTip1.SetToolTip(this.Inv_Minimo, UtilMessages.IVENTARIO_MINIMO_AGREGAR_PRODUCTO);
            toolTip1.SetToolTip(this.Receta, UtilMessages.RECETA_AGREGAR_PRODUCTO);
            toolTip1.SetToolTip(this.Existencia, UtilMessages.HAY_AGREGAR_PRODUCTO);
            //Imagen
            toolTip1.SetToolTip(this.Caracteristicas, UtilMessages.CARACTERISTICAS_AGREGAR_PRODUCTO);

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

        #region Methods of the class
        private void agregarProducto()
        {
            Product p = new Product();
            p.BarCode = Codigo_de_barras.Text;
            p.AlternateKey = Clave_Alterna.Text;
            p.ActiveSubstance = Sustancia_Activa.Text;
            p.InvMin = Convert.ToInt32(Inv_Minimo);
            p.InvMax = Convert.ToInt32(Inv_Maximo);
            p.Description = Descripcion.Text;
            p.StandardCost = Convert.ToDouble(radCheckBox1);
            p.QuantityPerUnit = Convert.ToInt32(Existencia);
            p.IsLot = Convert.ToByte(Lote);
            p.IsRecipe = Convert.ToByte(Receta);
            p.IsService = Convert.ToByte(Servicio);
            string message = BusinessLogicLayer.AccesoBDBLL.insertProduct(p);
            if (message == "")
            {
                MessageBox.Show(message);
            }
            else
            {
                MessageBox.Show("Producto agregado correctamente");
            }


        }

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
                picImagenProducto.ImageLocation = Direccion;
                picImagenProducto.SizeMode = PictureBoxSizeMode.StretchImage;
            }
        }
        #endregion

    }
}
