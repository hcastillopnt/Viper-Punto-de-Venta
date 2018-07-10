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
    public partial class frmAddClient : Form
    {
        public frmAddClient()
        {
            InitializeComponent();
        }


        #region  CONTROLAR TAB ORDER


        // DATOS BÁSICOS
        //TAB DE RFC A TELEFONO
        private void RFC_Leave_1(object sender, EventArgs e)
        {
          Telefono.Focus();
        }

        //TAB DE CELULAR A BTN EXAMINAR
        private void Celular_Leave_1(object sender, EventArgs e)
        {
         btnExaminar.Focus();
        }

        //TAB DE BTN EXAMINAR A LÍMITE DE CREDITO
        private void btnExaminar_Leave_1(object sender, EventArgs e)
        {
         Límite_De_Credito.Focus();
        }

        //TAB DE EMAIL A RFC
        private void Email_Leave_1(object sender, EventArgs e)
        {
         RFC.Focus();
        }

        #endregion

        private void frmAddClient_Load(object sender, EventArgs e)
        {
            this.Razón_Social_Fiscal.Focus();
        }
    }
}
