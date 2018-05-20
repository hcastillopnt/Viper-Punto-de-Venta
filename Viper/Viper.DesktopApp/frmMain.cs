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
        private Button objButton = null;

        public frmMain()
        {
            //Inicializar la interfaz grafica
            InitializeComponent();

            //Inicializar el Time para mostrar la hora actual
            timer.Start();

            //Cargar menu de opciones
            CargarMenuVertical();
        }

        private void btnsalir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void timer_Tick(object sender, EventArgs e)
        {
            lblFechaActual.Text = DateTime.Now.ToLongTimeString();
        }

        private void frmMain_KeyDown(object sender, KeyEventArgs e)
        {
            switch (e.KeyCode)
            {
                case Keys.F1:
                    //AgregarFormularioEnPanel(new frmPointSale());
                    break;

                case Keys.F3:
                    //AgregarFormularioEnPanel(new frmAdminProducts());
                    break;
            }
        }

        public void Menu_Click(object sender, EventArgs e)
        {
            objButton = (Button)sender;

            string name = objButton.Name;

            switch (name)
            {
                //Ventas
                case "btnVentas":
                    //AgregarFormularioEnPanel(new frmPointSale());
                    break;

                //Productos
                case "btnProductos":
                    //AgregarFormularioEnPanel(new frmAdminProducts());
                    break;
            }
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

        private void CargarMenuVertical()
        {
            List<Permission> permissions = new List<Permission>();
            DataTable dtPermissions = new DataTable();
            Permission permission = null;

            dtPermissions = BusinessLogicLayer.MenuBLL.CargarMenuPorRol("ADMINISTRADOR");

            foreach(DataRow row in dtPermissions.Rows)
            {
                permission = new Permission();

                permission.Name = row["Name"].ToString();
                permission.ControlName = row["ControlName"].ToString();
                permission.ControlText = row["ControlText"].ToString();
                permission.ControlImage = row["ControlImage"].ToString();

                permissions.Add(permission);
            }

            int rows = dtPermissions.Rows.Count;
            int i = 1;

            foreach(var item in permissions)
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
                pnlOption.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(80)))), ((int)(((byte)(200)))));
                pnlOption.Dock = System.Windows.Forms.DockStyle.Fill;
                pnlOption.Location = new System.Drawing.Point(3, 3);
                pnlOption.Name = "pnl" + item.Name;
                pnlOption.Size = new System.Drawing.Size(4, 47);
                tlpOption.TabIndex = 0;
                // 
                // btnOption
                // 
                btnOption.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(26)))), ((int)(((byte)(32)))), ((int)(((byte)(40)))));
                btnOption.Dock = System.Windows.Forms.DockStyle.Fill;
                btnOption.FlatAppearance.BorderSize = 0;
                btnOption.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(80)))), ((int)(((byte)(200)))));
                btnOption.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
                btnOption.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
                btnOption.ForeColor = System.Drawing.Color.White;
                btnOption.Image = Image.FromFile(folderPath + item.ControlImage);
                btnOption.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
                btnOption.Location = new System.Drawing.Point(13, 3);
                btnOption.Name = item.ControlName;
                btnOption.Size = new System.Drawing.Size(192, 47);
                btnOption.TabIndex = i;
                btnOption.Text = item.ControlText;
                btnOption.UseVisualStyleBackColor = false;
                btnOption.TextImageRelation = TextImageRelation.ImageBeforeText;
                btnOption.Click += Menu_Click;
                // 
                // tlpOption
                // 
                tlpOption.ColumnCount = 2;
                tlpOption.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 5F));
                tlpOption.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 95F));
                tlpOption.Controls.Add(pnlOption, 0, 0);
                tlpOption.Controls.Add(btnOption, 1, 0);
                tlpOption.Dock = System.Windows.Forms.DockStyle.Fill;
                tlpOption.Location = new System.Drawing.Point(3, 3);
                tlpOption.Name = "tlpBoton" + item.Name;
                tlpOption.RowCount = 1;
                tlpOption.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
                tlpOption.Size = new System.Drawing.Size(208, 53);
                tlpOption.TabIndex = 0;

                //Añadir los controles a los contenedores correspondientes
                tlpMenuVertical.Controls.Add(tlpOption);

                //TabIndex
                i++;
            }
        }
    }
}
