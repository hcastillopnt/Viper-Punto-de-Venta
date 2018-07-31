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

        private void btnSalir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void frmLogin_Load(object sender, EventArgs e)
        {
            Nombre_de_Usuario.Focus();

            ToolTip toolTip1 = new ToolTip();

            // Set up the delays for the ToolTip.
            toolTip1.AutoPopDelay = 5000;
            toolTip1.InitialDelay = 1000;
            toolTip1.ReshowDelay = 500;
            // Force the ToolTip text to be displayed whether or not the form is active.
            toolTip1.ShowAlways = true;

            // Set up the ToolTip text for the Button and Checkbox.
            toolTip1.SetToolTip(this.btnIngresar, "Para ingresar , favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnSalir, "Para salir, favor de dar clic a este boton");


        }
        #endregion
    }
}
