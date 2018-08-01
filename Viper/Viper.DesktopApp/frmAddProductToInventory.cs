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
    public partial class frmAddProductToInventory : Form
    {
        #region Variables and objects of class
        RadButton objButton = null;
        #endregion

        #region Constructor
        public frmAddProductToInventory()
        {
            InitializeComponent();
        }
        #endregion

        #region Events of the controls
        private void frmAddProductToInventory_Load(object sender, EventArgs e)
        {
            //Set default configuration to UI
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

            this.btnAgregarAlInventario.Click += Button_Click;
            this.btnRemplazarInventario.Click += Button_Click;
            this.Codigo_de_barras_A.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.Codigo_de_barras_Remplazar.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.Cantidad.KeyPress += OnlyNumbers_KeyPress;
            this.Cantidad_ActuaL_A.KeyPress += OnlyNumbers_KeyPress;
            this.Cantidad_Actual_Remplazar.KeyPress += OnlyNumbers_KeyPress;
            this.Descripcion_A.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.Descripcion_Remplazar.KeyPress += OnlyLettersAndNumbers_KeyPress;
            this.Nueva_Cantidad.KeyPress += OnlyNumbers_KeyPress;
            this.Diferencia.KeyPress += OnlyNumbers_KeyPress;

            ToolTip toolTip1 = new ToolTip();

            // Set up the delays for the ToolTip.
            toolTip1.AutoPopDelay = 5000;
            toolTip1.InitialDelay = 1000;
            toolTip1.ReshowDelay = 500;
            // Force the ToolTip text to be displayed whether or not the form is active.
            toolTip1.ShowAlways = true;

            // Set up the ToolTip text for the Button and Checkbox.
            toolTip1.SetToolTip(this.btnAgregarAlInventario, "Para poder agregar un producto al inventario, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnAgregarAlInventario, "Para poder remplazar un producto en el inventario, favor de dar clic en este boton");

            // Set up the ToolTip text for the TextBox and ComboBox Control.
            //Agregar producto al invetario
            toolTip1.SetToolTip(this.Codigo_de_barras_A, UtilMessages.CODIGO_DE_BARRAS_AGREGAR_PRODUCTO_INVENTARIO);
            toolTip1.SetToolTip(this.Cantidad, UtilMessages.CANTIDAD_AGREGAR_PRODUCTO_INVENTARIO);
            toolTip1.SetToolTip(this.Descripcion_A, UtilMessages.DESCRIPCION_AGREGAR_PRODUCTO_INVENTARIO);
            //Remplazar producto al invetario
            toolTip1.SetToolTip(this.Codigo_de_barras_Remplazar, UtilMessages.CODIGO_DE_BARRAS_REMPLAZAR_PRODUCTO);
            toolTip1.SetToolTip(this.Nueva_Cantidad, UtilMessages.NUEVA_CANTIDAD_REMPLAZAR_PRODUCTO);
            toolTip1.SetToolTip(this.Descripcion_Remplazar, UtilMessages.DESCRIPCION_REMPLAZAR_PRODUCTO);

        }

        public void Button_Click(Object sender, EventArgs args)
        {
            objButton = (RadButton)sender;

            switch (objButton.Name)
            {
                case "btnAgregarAlInventario":
                    break;
                case "btnRemplazarInventario":
                    break;
             


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

        #region Methods of the class
        #endregion

    }
}
