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
    public partial class frmAdminProducts : Form
    {
        #region Variables and Objects of Class
        RadButton objButton = null;
        #endregion

        #region Constructor
        public frmAdminProducts()
        {
            InitializeComponent();
        }
        #endregion

        #region Events of the controls
        public void Button_Click(Object sender, EventArgs args)
        {
            objButton = (RadButton)sender;

            switch(objButton.Name)
            {
                case "btnAgregar":
                    frmAddProduct form = new frmAddProduct();
                    form.ShowDialog();
                    form.TopMost = true;
                    break;
                case "btnBuscar":
                    gvProducts.DataSource = null;
                    gvProducts.DataSource = BusinessLogicLayer.AccesoBDBLL.getProduct(Código_de_barras.Text);
                    break;
                case "btnRecargar":
                    gvProducts.DataSource = null;
                    gvProducts.DataSource = BusinessLogicLayer.AccesoBDBLL.getProducts();
                    break;
                case "btnEliminar":
                    break;
                case "btnEditar":
                    break;



            }
        }

        private void frmAdminProducts_Load(object sender, EventArgs e)
        {
            this.btnAgregar.KeyPress += Button_Click;
            this.btnEditar.KeyPress += Button_Click;
            this.btnRecargar.KeyPress += Button_Click;
            this.btnEliminar.KeyPress += Button_Click;
            this.btnBuscar.KeyPress += Button_Click;
            gvProducts.DataSource = null;
            gvProducts.DataSource= BusinessLogicLayer.AccesoBDBLL.getProducts();
        }
        #endregion
    }
}
