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
    public partial class frmCrudProvider : Form
    {
        #region Variables and Objects of Class
        RadButton objButton = null;
        #endregion

        #region Constructor
        public frmCrudProvider()
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
                    dgvCrudProvider.DataSource = null;
                    dgvCrudProvider.DataSource = BusinessLogicLayer.AccesoBDBLL.getSuppliers();
                    break;

                case "btnBuscar":
                    dgvCrudProvider.DataSource = null;
                    dgvCrudProvider.DataSource = BusinessLogicLayer.AccesoBDBLL.getSupplier(Clave_Proveedor.Text);

                    break;
                case "btnAgregar":
                    frmAddProvider add = new frmAddProvider();
                    add.ShowDialog();
                    add.TopMost = true;
                    break;
                case "btnEditar":
                    
                    break;
                case "btnEliminar":
                    
                    break;


            }
        }
        private void frmCrudProvider_Load(object sender, EventArgs e)
        {
            this.btnAgregar.Click += Button_Click;
            this.btnBuscar.Click += Button_Click;
            this.btnEditar.Click += Button_Click;
            this.btnEliminar.Click += Button_Click;
            this.btnRecargar.Click += Button_Click;
            dgvCrudProvider.DataSource = null;
            dgvCrudProvider.DataSource = BusinessLogicLayer.AccesoBDBLL.getSuppliers();




            // Create the ToolTip and associate with the Form container.
            ToolTip toolTip1 = new ToolTip();

            // Set up the delays for the ToolTip.
            toolTip1.AutoPopDelay = 5000;
            toolTip1.InitialDelay = 1000;
            toolTip1.ReshowDelay = 500;
            // Force the ToolTip text to be displayed whether or not the form is active.
            toolTip1.ShowAlways = true;

            // Set up the ToolTip text for the Button and Checkbox.
            toolTip1.SetToolTip(this.btnAgregar, "Para poder agregar a un nuevo proveedor, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnEditar , "Para editar los datos de un proveedor, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnBuscar , "Para buscar los datos de un proveedor, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnEliminar , "Para eliminar los datos de un proveedor, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnRecargar, "Para racargar los datos, favor de dar clic en este boton");

            // Set up the ToolTip text for the TextBox and ComboBox Control.
            toolTip1.SetToolTip(this.Clave_Proveedor , UtilMessages.BUSCAR_CLAVE_PROVEEDOR );
        }
        #endregion
    }
}
