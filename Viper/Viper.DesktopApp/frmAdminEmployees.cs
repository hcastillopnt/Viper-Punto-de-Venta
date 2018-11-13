/*
 * ---------------------------------------------------------
 * LIBRERIAS UTILIZADAS EN EL FORMULARIO "frmAdminEmployees.cs"
 * ---------------------------------------------------------
 */

#region using directives

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
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
    public partial class frmAdminEmployees : Form
    {
        /*
         * ---------------------------------------------------------
         * VARIABLES, OBJETOS, Y COMPONENTES UTILIZADOS EN EL FORMULARIO "frmAdminEmployees.cs"
         * ---------------------------------------------------------
         */

        #region Variables, Objetos y Componentes

        int companyID = 0;
        string folder = String.Empty;
        string appPath = String.Empty;
        string folderToSave = String.Empty;
        String companyName = String.Empty;
        RadButton objButton = null;

        #endregion

        /*
         * ---------------------------------------------------------
         * CONSTRUCTORES UTILIZADOS EN EL FORMULARIO "frmAdminEmployees.cs"
         * ---------------------------------------------------------
         */

        #region Constructor

        public frmAdminEmployees()
        {
            InitializeComponent();

            companyName = frmLogin.dt.Rows[0].Field<String>("CompanyName");
            companyID = BusinessLogicLayer.CompanyBLL.procGetCompanyIdByName(companyName);

            folder = @"\images\profile_pictures\";
            appPath = Path.GetDirectoryName(Application.StartupPath);
            folderToSave = appPath.Substring(0, appPath.Length - 4) + folder;
        }

        #endregion

        /*
         * ---------------------------------------------------------
         * EVENTOS UTILIZADOS EN EL FORMULARIO "frmAdminEmployees.cs"
         * ---------------------------------------------------------
         */

        #region Eventos

        public void Button_Click(Object sender, EventArgs args)
        {
            objButton = (RadButton)sender;

            switch (objButton.Name)
            {
                case "btnAgregar":
                    frmRegisterEmployee frmRegisterEmployee = new frmRegisterEmployee();
                    frmRegisterEmployee.ShowDialog();
                    break;

                case "btnBuscar":
                    string employeeName = Empleado.Text.Trim().ToString();

                    if(string.IsNullOrEmpty(employeeName))
                    {
                        MessageBox.Show(new Form { TopMost = true }, "Favor de introducir el nombre del empleado a buscar", "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }
                    else
                    {
                        gvEmployees.DataSource = null;
                        gvEmployees.DataSource = BusinessLogicLayer.EmployeeBLL.procGetEmployeesByNameToDataTable(companyID, employeeName, folder);
                    }
                    break;

                case "btnRecargar":
                    gvEmployees.DataSource = null;
                    gvEmployees.DataSource = BusinessLogicLayer.EmployeeBLL.procGetEmployeesToDataTable(companyID, folder);
                    break;

                case "btnEliminar":
                    break;

                case "btnEditar":
                    break;
            }
        }

        private void frmAdminEmployees_Load(object sender, EventArgs e)
        {
            //Set default configuration to UI
            this.AutoSize = true;
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Text = "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions";
            this.KeyPreview = true;

            //Establecer la resolucion de la ventana
            //StartPosition was set to FormStartPosition.Manual in the properties window. 
            Rectangle screen = Screen.PrimaryScreen.WorkingArea;
            int w = Width >= screen.Width ? screen.Width : (screen.Width + Width) / 2;
            int h = Height >= screen.Height ? screen.Height : (screen.Height + Height) / 2;
            this.Location = new Point((screen.Width - w) / 2, (screen.Height - h) / 2);
            this.Size = new Size(w, h);
            this.WindowState = FormWindowState.Maximized;

            //Cargar todos los empleados registrados
            gvEmployees.DataSource = null;
            gvEmployees.DataSource = BusinessLogicLayer.EmployeeBLL.procGetEmployeesToDataTable(companyID, folder);

            //Ajustar contenido de las celdas
            if (gvEmployees.Rows.Count > 0)
            {
                gvEmployees.AutoSizeRows = true;
                gvEmployees.Columns[0].WrapText = true;
            }

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

        private void Empleado_TextChanged(object sender, EventArgs e)
        {
            string filter = Empleado.Text.Trim().ToString();

            gvEmployees.DataSource = null;
            gvEmployees.DataSource = BusinessLogicLayer.EmployeeBLL.procGetEmployeesByNameToDataTable(companyID, filter, folder);
        }

        #endregion
    }
}
