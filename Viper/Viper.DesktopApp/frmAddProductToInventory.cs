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
