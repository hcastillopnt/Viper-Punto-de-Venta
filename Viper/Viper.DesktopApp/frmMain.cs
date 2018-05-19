using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Runtime.InteropServices;

namespace Viper.DesktopApp
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            //Inicializar la interfaz grafica
            InitializeComponent();

            //Inicializar el Time para mostrar la hora actual
            timer.Start();
        }

        private void btnsalir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void timer_Tick(object sender, EventArgs e)
        {
            lblFechaActual.Text = DateTime.Now.ToLongTimeString();
        }

        public void AgregarFormularioEnPanel(object _frmHijo)
        {
            if (this.pnlContenedor.Controls.Count > 0)
                this.pnlContenedor.Controls.RemoveAt(0);
            Form fh = _frmHijo as Form;
            fh.TopLevel = false;
            fh.FormBorderStyle = FormBorderStyle.None;
            fh.Dock = DockStyle.Fill;
            this.pnlContenedor.Controls.Add(fh);
            this.pnlContenedor.Tag = _frmHijo;
            fh.Show();
        }
    }
}
