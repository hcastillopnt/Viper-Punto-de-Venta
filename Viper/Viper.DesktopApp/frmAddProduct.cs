using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Viper.DesktopApp
{
    public partial class frmAddProduct : Form
    {
        public frmAddProduct()
        {
            InitializeComponent();
        }


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

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Hide();
        }
    }
}
