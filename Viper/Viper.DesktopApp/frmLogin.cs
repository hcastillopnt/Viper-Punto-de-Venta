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
        public frmLogin()
        {
            InitializeComponent();
        }

        private void btnIngresar_Click(object sender, EventArgs e)
        {

            if (Nombre_de_Usuario.Text == "" || Contraseña.Text == "")
            {
                MessageBox.Show("Favor de no dejar espacios en blanco", "Error", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
            else
            {
                DataTable dt = new DataTable();
                dt = BusinessLogicLayer.LoginBLL.iniciarSesion(Nombre_de_Usuario.Text, Contraseña.Text);


                if (dt != null)
                {
                    string rol = dt.Rows[0].ItemArray[1].ToString();
                    string puesto = dt.Rows[0].ItemArray[2].ToString();
                    string nomcomp = dt.Rows[0].ItemArray[3].ToString();
                    frmMain frm = new frmMain(rol, nomcomp, puesto);
                    frm.Show();
                    this.Hide();
                }
                else
                {
                    MessageBox.Show("Usuario o contraseña incorrectos", "Error", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
            }
        }
    }
}
