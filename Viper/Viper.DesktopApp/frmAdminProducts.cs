/*
 * ---------------------------------------------------------
 * LIBRERIAS UTILIZADAS EN EL FORMULARIO "frmAdminProducts.cs"
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
using Telerik.WinControls.UI;

#endregion

namespace Viper.DesktopApp
{
    /// <summary>
    /// CLASE QUE PERMITE VISUALIZAR TODOS LOS PRODUCTOS REGISTRADOS EN EL 
    /// SISTEMA DE PUNTO DE VENTA PARA FARMACIAS CON VENTA DE GENERICOS
    /// </summary>
    public partial class frmAdminProducts : Form
    {
        /*
         * ---------------------------------------------------------
         * VARIABLES, OBJETOS, Y COMPONENTES UTILIZADOS EN EL FORMULARIO "frmAdminProducts.cs"
         * ---------------------------------------------------------
         */

        #region Variables, Objetos y Componentes

        RadButton objButton = null;

        #endregion

        /*
         * ---------------------------------------------------------
         * CONSTRUCTORES UTILIZADOS EN EL FORMULARIO "frmAdminProducts.cs"
         * ---------------------------------------------------------
         */

        #region Constructor

        public frmAdminProducts()
        {
            InitializeComponent();
        }

        #endregion

        /*
         * ---------------------------------------------------------
         * EVENTOS UTILIZADOS EN EL FORMULARIO "frmAdminProducts.cs"
         * ---------------------------------------------------------
         */

        #region Eventos

        public void Button_Click(Object sender, EventArgs args)
        {
            objButton = (RadButton)sender;

            switch (objButton.Name)
            {
                case "btnAgregar":
                    break;

                case "btnBuscar":
                    break;

                case "btnRecargar":
                    break;

                case "btnEliminar":
                    break;

                case "btnEditar":
                    break;
            }
        }

        private void frmAdminProducts_Load(object sender, EventArgs e)
        {
            //Set default configuration to UI
            this.AutoSize = true;
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Text = "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions";
            this.KeyPreview = true;
            this.Size = new Size(1366, 768);
            this.WindowState = FormWindowState.Maximized;

            this.btnAgregar.KeyPress += Button_Click;
            this.btnEditar.KeyPress += Button_Click;
            this.btnRecargar.KeyPress += Button_Click;
            this.btnEliminar.KeyPress += Button_Click;
            this.btnBuscar.KeyPress += Button_Click;

            // Create the ToolTip and associate with the Form container.
            ToolTip toolTip1 = new ToolTip();

            // Set up the delays for the ToolTip.
            toolTip1.AutoPopDelay = 5000;
            toolTip1.InitialDelay = 1000;
            toolTip1.ReshowDelay = 500;
            // Force the ToolTip text to be displayed whether or not the form is active.
            toolTip1.ShowAlways = true;

            // Set up the ToolTip text for the Button and Checkbox.
            toolTip1.SetToolTip(this.btnAgregar, "Para poder agregar a un nuevo producto, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnEditar, "Para editar los datos de un producto, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnBuscar, "Para buscar los datos de un producto, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnEliminar, "Para eliminar los datos de un producto, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnRecargar, "Para racargar los datos, favor de dar clic en este boton");
        }

        #endregion
    }
}
