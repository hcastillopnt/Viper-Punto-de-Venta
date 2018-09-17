/*
 * ---------------------------------------------------------
 * LIBRERIAS UTILIZADAS EN EL FORMULARIO "frmDashboard.cs"
 * ---------------------------------------------------------
 */

#region using directives 

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

#endregion

namespace Viper.DesktopApp
{
    /// <summary>
    /// CLASE QUE PERMITE MOSTRAR EL DASHBOARD PARA GRAFICAR ESTADISTICAS SOBRE EL NEGOCIO
    /// </summary>
    public partial class frmDashboard : Form
    {
        /*
         * ---------------------------------------------------------
         * CONSTRUCTORES UTILIZADOS EN EL FORMULARIO "frmDashboard.cs"
         * ---------------------------------------------------------
         */

        #region Constructor

        public frmDashboard()
        {
            InitializeComponent();
        }

        #endregion

        /*
         * ---------------------------------------------------------
         * EVENTOS UTILIZADOS EN EL FORMULARIO "frmDashboard.cs"
         * ---------------------------------------------------------
         */

        #region Eventos

        private void frmDashboard_Load(object sender, EventArgs e)
        {
            //Set default configuration to UI
            this.AutoSize = true;
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.StartPosition = FormStartPosition.CenterScreen;
            this.Text = "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions";
            this.WindowState = FormWindowState.Maximized;
        }

        #endregion
    }
}
