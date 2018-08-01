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

namespace Viper.DesktopApp
{
    public partial class frmCrudClient : Form
    {
        #region Variables and Objects of Class
        RadButton objButton = null;
        #endregion

        #region Constructor
        public frmCrudClient()
        {
            InitializeComponent();
        }
        #endregion

        #region Events of the controls
        public void Button_Click(Object sender, EventArgs args)
        {
            objButton = (RadButton)sender;

            switch (objButton.Name)
            {
                case "btnRecargar":
                    dgvCrudClient.DataSource = null;
                    dgvCrudClient.DataSource = BusinessLogicLayer.AccesoBDBLL.getCustomers();
                    break;

                case "btnBuscar":
                    dgvCrudClient.DataSource = null;
                    dgvCrudClient.DataSource = BusinessLogicLayer.AccesoBDBLL.getCustomer(Clave_cliente.Text);
                    break;
                case "btnEditar":
                    dgvCrudClient.DataSource = null;
                    dgvCrudClient.DataSource = BusinessLogicLayer.AccesoBDBLL.getCustomer(Clave_cliente.Text);
                    break;
                case "btnAgregar":
                    frmAddClient ad = new frmAddClient();
                    ad.ShowDialog();
                    ad.TopMost = true;
                    break;
                case "btnEliminar":
                    break;



            }
        }
        private void frmCrudClient_Load(object sender, EventArgs e)
        {
            //Set default configuration to UI
            this.AutoSize = true;
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.StartPosition = FormStartPosition.CenterScreen;
            this.Text = "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions";
            this.TopMost = true;
            this.Size = new Size(1366, 768);
            this.WindowState = FormWindowState.Maximized;
            this.Icon = new Icon("Resources/application_icon.ico");

            this.btnAgregar.Click += Button_Click;
            this.btnBuscar.Click += Button_Click;
            this.btnEditar.Click += Button_Click;
            this.btnEliminar.Click += Button_Click;
            this.btnRecargar.Click += Button_Click;
            dgvCrudClient.DataSource = null;
            dgvCrudClient.DataSource = BusinessLogicLayer.AccesoBDBLL.getCustomers();

            // Create the ToolTip and associate with the Form container.
            ToolTip toolTip1 = new ToolTip();

            // Set up the delays for the ToolTip.
            toolTip1.AutoPopDelay = 5000;
            toolTip1.InitialDelay = 1000;
            toolTip1.ReshowDelay = 500;
            // Force the ToolTip text to be displayed whether or not the form is active.
            toolTip1.ShowAlways = true;

            // Set up the ToolTip text for the Button and Checkbox.
            toolTip1.SetToolTip(this.btnAgregar, "Para poder agregar a un nuevo cliente, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnEditar, "Para editar los datos de un cliente, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnBuscar, "Para buscar los datos de un cliente, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnEliminar, "Para eliminar los datos de un cliente, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnRecargar, "Para racargar los datos, favor de dar clic en este boton");

            // Set up the ToolTip text for the TextBox and ComboBox Control.
            toolTip1.SetToolTip(this.Clave_cliente , UtilMessages.BUSCAR_CLAVE_CLIENTE);
        }
        #endregion
    }
}
