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
    public partial class frmRegisterSite : Form
    {
        public frmRegisterSite()
        {
            InitializeComponent();
        }

        private void btnRegisterCompany_Click(object sender, EventArgs e)
        {
            frmRegisterCompany frm = new frmRegisterCompany();
            frm.Show();
            this.Hide();
        }

        private void lblIdSucursal_Click(object sender, EventArgs e)
        {

        }

        private void tableLayoutPanel10_Paint(object sender, PaintEventArgs e)
        {

        }

        private void tableLayoutPanel13_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
