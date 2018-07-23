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
    public partial class frmCrudProvider : Form
    {
        #region Variables and Objects of Class
        RadButton objButton = null;
        #endregion

        #region Constructor
        public frmCrudProvider()
        {
            InitializeComponent();
        }
        #endregion

        #region Events of the controls
        public void Button_Click(Object sender, EventArgs args)
        {
            objButton = (RadButton)sender;

            switch (objButton.Name)
            {
                case "btnRecargar":
                    dgvCrudProvider.DataSource = null;
                    dgvCrudProvider.DataSource = BusinessLogicLayer.AccesoBDBLL.getSuppliers();
                    break;

                case "btnBuscar":
                    dgvCrudProvider.DataSource = null;
                    dgvCrudProvider.DataSource = BusinessLogicLayer.AccesoBDBLL.getSupplier(Clave_Proveedor.Text);

                    break;
                case "btnAgregar":
                    frmAddProvider add = new frmAddProvider();
                    add.ShowDialog();
                    add.TopMost = true;
                    break;
                case "btnEditar":
                    
                    break;
                case "btnEliminar":
                    
                    break;


            }
        }
        private void frmCrudProvider_Load(object sender, EventArgs e)
        {
            this.btnAgregar.Click += Button_Click;
            this.btnBuscar.Click += Button_Click;
            this.btnEditar.Click += Button_Click;
            this.btnEliminar.Click += Button_Click;
            this.btnRecargar.Click += Button_Click;
            dgvCrudProvider.DataSource = null;
            dgvCrudProvider.DataSource = BusinessLogicLayer.AccesoBDBLL.getSuppliers();
        }
        #endregion
    }
}
