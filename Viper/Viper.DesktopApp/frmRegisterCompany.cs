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
    public partial class frmRegisterCompany : Form
    {
        public frmRegisterCompany()
        {
            InitializeComponent();
        }

        private void btnRegistrarSucursal_Click(object sender, EventArgs e)
        {
            frmRegisterSite frm = new frmRegisterSite();
            frm.Show();
            this.Hide();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {

        }

        private void tableLayoutPanel26_Paint(object sender, PaintEventArgs e)
        {

        }

        private void radTextBox6_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
