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
using Viper.BusinessEntities;

namespace Viper.DesktopApp
{
    public partial class frmPanelButtons : Form
    {
        private Button objButton = null;
        string menuSeleccionado = String.Empty;
        string companyName = String.Empty;
        int companyID = 0;

        public frmPanelButtons(string menu, string rol)
        {
            //Initialize UI
            InitializeComponent();

            //Value of menu parameter
            this.menuSeleccionado = menu;

            //Upload submenu items
            uploadSubmenuItemsToPanel();
        }

        private void AgregarFormularioEnPanel(object _frmHijo)
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

        public void Menu_Click(object sender, EventArgs e)
        {
            objButton = (Button)sender;

            string name = objButton.Name;

            switch(name)
            {
                //F4 Operaciones
                //case "btnClientes":
                //    AgregarFormularioEnPanel(new frmAdminCustomers());
                //    break;

                //case "btnProveedores":
                //    AgregarFormularioEnPanel(new frmAdminSuppliers());
                //    break;

                //F5 Configuracion
                case "btnEmpresa":
                    companyName = frmLogin.dt.Rows[0].Field<String>("CompanyName");
                    companyID = BusinessLogicLayer.CompanyBLL.getCompanyIdByName(companyName);

                    AgregarFormularioEnPanel(new frmRegisterCompany(companyID));
                    break;

                //case "btnSucursales":
                //    companyName = frmLogin.dt.Rows[0].Field<String>("CompanyName");
                //    companyID = BusinessLogicLayer.CompanyBLL.getCompanyIdByName(companyName);

                //    AgregarFormularioEnPanel(new frmAdminSites(companyName, companyID));
                //    break;

                case "btnEmpleados":
                    AgregarFormularioEnPanel(new frmAdminEmployees());
                    break;
            }
        }

            private void uploadSubmenuItemsToPanel()
        {
            List<Module> modules = new List<Module>();
            DataTable dtModules = new DataTable();
            Module module = null;

            dtModules = BusinessLogicLayer.MenuBLL.CargarSubmenuPorRol("ADMINISTRADOR", menuSeleccionado);

            if (dtModules.Rows.Count > 0)
            {
                foreach (DataRow row in dtModules.Rows)
                {
                    module = new Module();

                    module.Name = row["Name"].ToString();
                    module.Submenu = row["Submenu"].ToString();
                    module.ControlName = row["ControlName"].ToString();
                    module.ControlImage = row["ControlImage"].ToString();
                    module.IsActive = Convert.ToBoolean(row["IsActive"].ToString());

                    modules.Add(module);
                }

                int rows = dtModules.Rows.Count;
                int i = 1;

                foreach (var item in modules)
                {
                    Button btnOption = new Button();

                    string folder = @"\images\icon\";
                    string appPath = Path.GetDirectoryName(Application.StartupPath);
                    string folderPath = appPath.Substring(0, appPath.Length - 4) + folder;

                    // 
                    // btnOption
                    // 
                    btnOption.Dock = DockStyle.Fill;
                    btnOption.Image = Image.FromFile(folderPath + item.ControlImage);
                    //btnOption.ImageAlign = ContentAlignment.TopCenter;
                    btnOption.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F);
                    btnOption.Name = item.ControlName;
                    btnOption.TabIndex = i;
                    btnOption.Text = item.Submenu;
                    btnOption.TextAlign = ContentAlignment.BottomCenter;
                    btnOption.TextImageRelation = TextImageRelation.ImageAboveText;
                    btnOption.Enabled = item.IsActive;
                    btnOption.Click += Menu_Click;

                    //Añadir los controles a los contenedores correspondientes
                    tlpCentro.Controls.Add(btnOption);

                    //TabIndex
                    i++;
                }
            }
        }

        private void frmPanelButtons_Load(object sender, EventArgs e)
        {
            //Set default configuration to UI
            this.AutoSize = true;
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.StartPosition = FormStartPosition.CenterScreen;
            this.Text = "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions";
            //this.TopMost = true;
            this.Size = new Size(1366, 768);
            this.WindowState = FormWindowState.Maximized;
        }
    }
}
