using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Viper.DesktopApp
{
    public partial class frmLogin : Form
    {
        #region Constructor
        public frmLogin()
        {
            InitializeComponent();
        }
        #endregion

        #region Events of the controls
        private void btnIngresar_Click(object sender, EventArgs e)
        {
            string username = Nombre_de_Usuario.Text.Trim().ToString();
            string password = Contraseña.Text.Trim().ToString();

            if (string.IsNullOrEmpty(username) && string.IsNullOrEmpty(password))
            {
                MessageBox.Show("Favor de no dejar espacios en blanco", "Error", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
            else
            {
                DataTable dt = new DataTable();

                dt = BusinessLogicLayer.LoginBLL.authorize_by_credentials(username, password);

                if (dt != null)
                {
                    frmMain frm = new frmMain("ADMINISTRADOR", "HORACIO ENRIQUE CASTILLO PUENTE", "DUEÑO DE NEGOCIO");
                    frm.Show();
                    this.Hide();
                }
                else
                {
                    MessageBox.Show("Usuario o contraseña incorrectos", "Error", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
            }
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void frmLogin_Load(object sender, EventArgs e)
        {
            Nombre_de_Usuario.Focus();
        }
        #endregion
    }
}
