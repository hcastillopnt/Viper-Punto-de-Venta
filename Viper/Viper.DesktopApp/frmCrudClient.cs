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
    public partial class frmCrudClient : Form
    {
        #region Variables and Objects of Class
        RadButton objButton = null;
        #endregion

        #region Constructor
        public frmCrudClient()
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
                    dgvCrudClient.DataSource = null;
                    dgvCrudClient.DataSource = BusinessLogicLayer.AccesoBDBLL.getCustomers();
                    break;

                case "btnBuscar":
                    dgvCrudClient.DataSource = null;
                    dgvCrudClient.DataSource = BusinessLogicLayer.AccesoBDBLL.getCustomer(Clave_cliente.Text);
                    break;
                case "btnEditar":
                    dgvCrudClient.DataSource = null;
                    dgvCrudClient.DataSource = BusinessLogicLayer.AccesoBDBLL.getCustomer(Clave_cliente.Text);
                    break;
                case "btnAgregar":
                    frmAddClient ad = new frmAddClient();
                    ad.ShowDialog();
                    ad.TopMost = true;
                    break;
                case "btnEliminar":
                    break;



            }
        }
        private void frmCrudClient_Load(object sender, EventArgs e)
        {
            this.btnAgregar.Click += Button_Click;
            this.btnBuscar.Click += Button_Click;
            this.btnEditar.Click += Button_Click;
            this.btnEliminar.Click += Button_Click;
            this.btnRecargar.Click += Button_Click;
            dgvCrudClient.DataSource = null;
            dgvCrudClient.DataSource = BusinessLogicLayer.AccesoBDBLL.getCustomers();
        }
        #endregion
    }
}
