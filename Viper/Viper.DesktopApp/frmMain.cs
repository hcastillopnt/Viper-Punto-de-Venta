/*
 * ---------------------------------------------------------
 * LIBRERIAS UTILIZADAS EN EL FORMULARIO "frmMain.cs"
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
using System.Runtime.InteropServices;
using Viper.BusinessEntities;
using System.IO;
using Telerik.WinControls.UI;

#endregion

namespace Viper.DesktopApp
{
    /// <summary>
    /// CLASE QUE PERMITE MOSTRAR EL MENU LATERAL DE OPCIONES, CAMBIANDO
    /// DINAMICAMENTE SEGUN EL ROL DEL USUARIO QUE SE HAYA AUTENTICADO
    /// EN EL SISTEMA DE PUNTO DE VENTA PARA FARMACIAS CON VENTA DE GENERICOS
    /// </summary>
    public partial class frmMain : Form
    {
        /*
         * ---------------------------------------------------------
         * VARIABLES, OBJETOS, Y COMPONENTES UTILIZADAS EN EL FORMULARIO "frmMain.cs"
         * ---------------------------------------------------------
         */

        #region Variables, Objetos y Componentes

        public static RadDropDownList cboSucursales;
        private Button objButton = null;
        string rol;
        string nomcomp;
        string puest;

        #endregion

        /*
         * ---------------------------------------------------------
         * CONSTRUCTORES UTILIZADOS EN EL FORMULARIO "frmMain.cs"
         * ---------------------------------------------------------
         */

        #region Constructor

        public frmMain(string rol, string fullname, string puesto)
        {
            //Inicializar variables del constructor
            this.rol = rol;
            this.nomcomp = fullname;
            this.puest = puesto;

            //Inicializar la interfaz grafica
            InitializeComponent();

            //Cargar combobox de sucursales
            uploadControlSucursales();
        }

        #endregion

        /*
         * ---------------------------------------------------------
         * EVENTOS UTILIZADOS EN EL FORMULARIO "frmMain.cs"
         * ---------------------------------------------------------
         */

        #region Eventos

        private void timer_Tick(object sender, EventArgs e)
        {
            lblReloj.Text = DateTime.Now.ToLongTimeString();
        }

        private void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            this.Hide();
            frmLogin frm = new frmLogin();
            frm.Show();
        }

        private void picLogotipo_Click(object sender, EventArgs e)
        {
            AgregarFormularioEnPanel(new frmDashboard());
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            //Set default configuration to UI
            //this.AcceptButton = btnIngresar;
            this.CancelButton = btnCerrarSesion;
            this.AutoSize = true;
            this.ControlBox = false;
            //this.FormBorderStyle = FormBorderStyle.None;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.StartPosition = FormStartPosition.CenterScreen;
            this.Text = "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions";

            int height = Screen.PrimaryScreen.Bounds.Height; //Obtiene el alto de la pantalla principal en pixeles.
            int width = Screen.PrimaryScreen.Bounds.Width; //Obtiene el ancho de la pantalla principal en pixeles.

            if (width >= 1920 && height >= 1080)
            {
                //Establecer la resolucion de la ventana
                //StartPosition was set to FormStartPosition.Manual in the properties window. 
                Rectangle screen = Screen.PrimaryScreen.WorkingArea;
                int w = Width >= screen.Width ? screen.Width : (screen.Width + Width) / 2;
                int h = Height >= screen.Height ? screen.Height : (screen.Height + Height) / 2;
                this.Location = new Point((screen.Width - w) / 2, (screen.Height - h) / 2);
                this.Size = new Size(w, h);
            }
            else
            {
                this.WindowState = FormWindowState.Maximized;
            }

            if (rol == "ADMINISTRADOR")
            {
                //Obtenemos el nombre de la compañia
                string companyName = frmLogin.dt.Rows[0].Field<String>("CompanyName");

                //Si el usuario logueado es un administrador, mostramos todas las sucursales
                cboSucursales.DataSource = BusinessLogicLayer.SiteBLL.procGetSitesByCompanyName(companyName);
                cboSucursales.ValueMember = "Id";
                cboSucursales.DisplayMember = "Site";
            }
            else
            {
                //Obtenemos el nombre de la sucursal
                string siteName = frmLogin.dt.Rows[0].Field<String>("Subsidiary");

                //Si el usuario logueado es un empleado, mostramos la sucursal en la que se encuentra registrado
                cboSucursales.DataSource = BusinessLogicLayer.SiteBLL.procFindSiteBySiteName(siteName);
                cboSucursales.ValueMember = "Id";
                cboSucursales.DisplayMember = "UniquePhysicalID";

                cboSucursales.SelectedIndex = 0;

                //Bloqueamos la sucursal
                cboSucursales.Enabled = false;
            }

            //Agregar el Dashboard inicial
            AgregarFormularioEnPanel(new frmDashboard());

            //Inicializar el Time para mostrar la hora actual
            timer.Start();

            //Cargar menu de opciones
            CargarMenuVertical(rol);

            //Colocar nombre del puesto
            lblPuesto.Text = puest.ToUpper();

            //Colocar nombre de la persona
            lblNombre.Text = nomcomp.ToUpper();

            //Cargar el logotipo de la compañia
            CargarLogotipo();
        }

        public void Menu_Click(object sender, EventArgs e)
        {
            objButton = (Button)sender;

            string name = objButton.Name;
            string text = objButton.Text;

            switch (name)
            {
                case "btnVentas":
                    AgregarFormularioEnPanel(new frmShoppingCart());
                    break;

                case "btnProductos":
                    AgregarFormularioEnPanel(new frmAdminProducts());
                    break;

                case "btnInventario":
                    //AgregarFormularioEnPanel(new frmAddProductToInventory());
                    break;

                case "btnOperaciones":
                    AgregarFormularioEnPanel(new frmPanelButtons(text, rol));
                    break;

                case "btnConfiguracion":
                    AgregarFormularioEnPanel(new frmPanelButtons(text, rol));
                    break;

                case "btnCorte":
                    //AgregarFormularioEnPanel(new frmCutCash());
                    break;

                case "btnReportes":
                    AgregarFormularioEnPanel(new frmPanelButtons(text, rol));
                    break;

                case "btnEstadisticas":
                    AgregarFormularioEnPanel(new frmPanelButtons(text, rol));
                    break;

                case "btnMedico":
                    //AgregarFormularioEnPanel(new frmDoctor());
                    break;
            }
        }

        #endregion

        /*
         * ---------------------------------------------------------
         * METODOS UTILIZADOS EN EL FORMULARIO "frmMain.cs"
         * ---------------------------------------------------------
         */

        #region Metodos

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

        private void CargarMenuVertical(string role)
        {
            List<Module> modules = new List<Module>();
            DataTable dtModules = new DataTable();
            Module module = null;

            dtModules = BusinessLogicLayer.MenuBLL.procUploadMenuByRolName(role);

            foreach (DataRow row in dtModules.Rows)
            {
                module = new Module();

                module.Name = row["Name"].ToString();
                module.Menu = row["Menu"].ToString();
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
                Panel pnlOption = new Panel();
                TableLayoutPanel tlpOption = new TableLayoutPanel();

                string folder = @"\images\icon\";
                string appPath = Path.GetDirectoryName(Application.StartupPath);
                string folderPath = appPath.Substring(0, appPath.Length - 4) + folder;

                // 
                // pnlOption
                // 
                pnlOption.BackColor = Color.FromArgb(0, 80, 200);
                pnlOption.Dock = DockStyle.Fill;
                pnlOption.Location = new Point(3, 3);
                pnlOption.Name = "pnl" + item.ControlName;
                pnlOption.Size = new Size(4, 47);
                tlpOption.TabIndex = 0;
                // 
                // btnOption
                //
                btnOption.BackColor = Color.FromArgb(26, 32, 40);
                btnOption.Dock = DockStyle.Fill;
                btnOption.FlatAppearance.BorderSize = 0;
                btnOption.FlatAppearance.MouseOverBackColor = Color.FromArgb(52, 58, 64);
                btnOption.FlatStyle = FlatStyle.Flat;
                btnOption.Font = new Font("Microsoft Sans Serif", 18F, FontStyle.Regular, GraphicsUnit.Point, ((byte)(0)));
                btnOption.ForeColor = Color.White;
                btnOption.Image = Image.FromFile(folderPath + item.ControlImage);
                btnOption.ImageAlign = ContentAlignment.MiddleLeft;
                btnOption.Location = new Point(13, 3);
                btnOption.Name = item.ControlName;
                btnOption.Size = new Size(192, 47);
                btnOption.TabIndex = i;
                btnOption.Text = item.Menu;
                btnOption.UseVisualStyleBackColor = false;
                btnOption.TextImageRelation = TextImageRelation.ImageBeforeText;
                btnOption.Enabled = item.IsActive;
                btnOption.Click += Menu_Click;
                // 
                // tlpOption
                // 
                tlpOption.ColumnCount = 2;
                tlpOption.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 5F));
                tlpOption.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 95F));
                tlpOption.Controls.Add(pnlOption, 0, 0);
                tlpOption.Controls.Add(btnOption, 1, 0);
                tlpOption.Dock = DockStyle.Fill;
                tlpOption.Location = new Point(3, 3);
                tlpOption.Name = "tlpBoton" + item.ControlName;
                tlpOption.RowCount = 1;
                tlpOption.RowStyles.Add(new RowStyle(SizeType.Percent, 100F));
                tlpOption.Size = new Size(208, 53);
                tlpOption.TabIndex = 0;

                //Añadir los controles a los contenedores correspondientes
                tlpMenuVertical.Controls.Add(tlpOption);

                //TabIndex
                i++;
            }
        }

        private void CargarLogotipo()
        {
            string folder = @"\images\company_logo\";
            string appPath = Path.GetDirectoryName(Application.StartupPath);
            string folderToSave = appPath.Substring(0, appPath.Length - 4) + folder;

            if (Directory.Exists(folderToSave))
            {
                string companyKey = frmLogin.dt.Rows[0].Field<String>("CompanyKey");
                string filename = companyKey + ".jpg";
                string curFile = folderToSave + filename;

                if (File.Exists(curFile))
                {
                    this.picLogotipo.Image = Image.FromFile(folderToSave + filename);
                    this.picLogotipo.SizeMode = PictureBoxSizeMode.StretchImage;
                }
            }
        }

        private void uploadControlSucursales()
        {
            cboSucursales = new Telerik.WinControls.UI.RadDropDownList();

            ((System.ComponentModel.ISupportInitialize)(cboSucursales)).BeginInit();

            this.tlpLogotipo.Controls.Add(cboSucursales, 0, 1);

            cboSucursales.Dock = System.Windows.Forms.DockStyle.Fill;
            cboSucursales.DropDownStyle = Telerik.WinControls.RadDropDownStyle.DropDownList;
            cboSucursales.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            cboSucursales.Location = new System.Drawing.Point(3, 92);
            cboSucursales.Name = "cboSucursales";
            cboSucursales.NullText = "--Seleccione--";
            cboSucursales.Size = new System.Drawing.Size(274, 46);
            cboSucursales.TabIndex = 1;
            cboSucursales.ThemeName = "VisualStudio2012Light";

            ((System.ComponentModel.ISupportInitialize)(cboSucursales)).EndInit();
        }

        #endregion
    }
}
