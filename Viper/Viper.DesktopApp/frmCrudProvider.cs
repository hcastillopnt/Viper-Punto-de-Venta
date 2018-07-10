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
    public partial class frmCrudProvider : Form
    {
        public frmCrudProvider()
        {
            InitializeComponent();
        }

        private void frmCrudProvider_Load(object sender, EventArgs e)
        {
            dgvCrudProvider.DataSource = null;
            dgvCrudProvider.DataSource = BusinessLogicLayer.CRUDCompanyBLL.getSuppliers();
        }

        private void btnRecargar_Click(object sender, EventArgs e)
        {
            dgvCrudProvider.DataSource = null;
            dgvCrudProvider.DataSource = BusinessLogicLayer.CRUDCompanyBLL.getSuppliers();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            dgvCrudProvider.DataSource = null;
            dgvCrudProvider.DataSource = BusinessLogicLayer.CRUDCompanyBLL.getSupplier(Clave_Proveedor.Text);
        }
    }
}
