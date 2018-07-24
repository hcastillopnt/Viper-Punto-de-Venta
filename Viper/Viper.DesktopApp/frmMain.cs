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

namespace Viper.DesktopApp
{
    public partial class frmMain : Form
    {
        #region Variables and Objects of Class
        private Button objButton = null;
        public string rol;
        public string nomcomp;
        public string puest;
        #endregion

        #region Constructor
        public frmMain(string rol, string fullname, string puesto)
        {
            //Inicializar variables del constructor
            this.rol = rol;
            this.nomcomp = fullname;
            this.puest = puesto;

            //Inicializar la interfaz grafica
            InitializeComponent();

            //Inicializar el Time para mostrar la hora actual
            timer.Start();

            //Cargar menu de opciones
            CargarMenuVertical();

            //Colocar nombre del puesto
            lblPuesto.Text = puest.ToUpper();

            //Colocar nombre de la persona
            lblNombre.Text = nomcomp.ToUpper();

        }
        #endregion

        #region Events of the controls
        private void timer_Tick(object sender, EventArgs e)
        {
            lblFechaActual.Text = DateTime.Now.ToLongTimeString();
        }

        private void frmMain_KeyDown(object sender, KeyEventArgs e)
        {
            switch (e.KeyCode)
            {
                case Keys.F5:
                    AgregarFormularioEnPanel(new frmMenuConfiguration());
                    break;

                case Keys.Escape:
                    Application.Exit();
                    break;
            }
        }

        public void Menu_Click(object sender, EventArgs e)
        {
            objButton = (Button)sender;

            string name = objButton.Name;

            switch (name)
            {
                case "btnConfiguracion":
                    AgregarFormularioEnPanel(new frmMenuConfiguration());
                    break;
                case "btnCerrarSesion":
                    Application.Exit();
                    break;
            }
        }
        #endregion

        #region Methods of the class
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

        private void CargarMenuVertical()
        {
            List<Module> modules = new List<Module>();
            DataTable dtModules = new DataTable();
            Module module = null;

            dtModules = BusinessLogicLayer.MenuBLL.CargarMenuPorRol("ADMINISTRADOR");

            foreach (DataRow row in dtModules.Rows)
            {
                module = new Module();

                module.Name = row["Name"].ToString();
                module.Menu = row["Menu"].ToString();
                module.ControlName = row["ControlName"].ToString();
                module.ControlImage = row["ControlImage"].ToString();

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
                btnOption.Font = new Font("Microsoft Sans Serif", 12F, FontStyle.Regular, GraphicsUnit.Point, ((byte)(0)));
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
        #endregion

    }
}
