using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using Telerik.WinControls.UI;
using Viper.DesktopApp.Properties;

namespace Viper.DesktopApp
{
    public partial class frmShoppingCart : Form
    {
        RadButton objButton = null;
        DataTable dtCarrito = new DataTable();
        static decimal total = 0.00M;
        static decimal subtotal = 0.00M;
        static decimal iva = 0.00M;
        Thread thread;

        public frmShoppingCart()
        {
            InitializeComponent();
            cargarCalculadoraConTocuch();
            cargarColumnasCarritoGrid();
            formatearColumnas();
        }

        private void cargarCalculadoraConTocuch()
        {
            // 
            // tlpCalculadora
            // 
            this.tlpCalculadora.AutoSize = true;
            this.tlpCalculadora.ColumnCount = 5;
            this.tlpCalculadora.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 20F));
            this.tlpCalculadora.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 20F));
            this.tlpCalculadora.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 20F));
            this.tlpCalculadora.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 20F));
            this.tlpCalculadora.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 20F));
            this.tlpCalculadora.Controls.Add(this.btn0, 0, 3);
            this.tlpCalculadora.Controls.Add(this.btn00, 1, 3);
            this.tlpCalculadora.Controls.Add(this.btn000, 2, 3);
            this.tlpCalculadora.Controls.Add(this.btn01, 0, 2);
            this.tlpCalculadora.Controls.Add(this.btn02, 1, 2);
            this.tlpCalculadora.Controls.Add(this.btn03, 2, 2);
            this.tlpCalculadora.Controls.Add(this.btn04, 0, 1);
            this.tlpCalculadora.Controls.Add(this.btn05, 1, 1);
            this.tlpCalculadora.Controls.Add(this.btn06, 2, 1);
            this.tlpCalculadora.Controls.Add(this.btn07, 0, 0);
            this.tlpCalculadora.Controls.Add(this.btn08, 1, 0);
            this.tlpCalculadora.Controls.Add(this.btn09, 2, 0);
            this.tlpCalculadora.Controls.Add(this.btnPunto, 3, 0);
            this.tlpCalculadora.Controls.Add(this.btnSubtotal, 3, 1);
            this.tlpCalculadora.Controls.Add(this.btnCobrar, 3, 2);
            this.tlpCalculadora.Controls.Add(this.btnVales, 4, 3);
            this.tlpCalculadora.Controls.Add(this.btnTarjeta, 4, 2);
            this.tlpCalculadora.Controls.Add(this.btnDolares, 4, 1);
            this.tlpCalculadora.Controls.Add(this.btnEfectivo, 4, 0);
            this.tlpCalculadora.Dock = DockStyle.Fill;
            this.tlpCalculadora.Name = "tlpCalculadora";
            this.tlpCalculadora.RowCount = 4;
            this.tlpCalculadora.RowStyles.Add(new RowStyle(SizeType.Percent, 20F));
            this.tlpCalculadora.RowStyles.Add(new RowStyle(SizeType.Percent, 20F));
            this.tlpCalculadora.RowStyles.Add(new RowStyle(SizeType.Percent, 20F));
            this.tlpCalculadora.RowStyles.Add(new RowStyle(SizeType.Percent, 20F));
            this.tlpCalculadora.TabIndex = 0;
            this.tlpDerecho.Controls.Add(this.tlpCalculadora, 0, 1);
            // 
            // btn0
            // 
            this.btn0.Dock = DockStyle.Fill;
            this.btn0.Font = new Font("Microsoft Sans Serif", 30F, FontStyle.Regular, GraphicsUnit.Point, 0);
            this.btn0.Location = new Point(3, 489);
            this.btn0.Name = "btn0";
            this.btn0.Size = new Size(131, 159);
            this.btn0.TabIndex = 0;
            this.btn0.Text = "0";
            this.btn0.ThemeName = "VisualStudio2012Light";
            // 
            // btn00
            // 
            this.btn00.Dock = DockStyle.Fill;
            this.btn00.Font = new Font("Microsoft Sans Serif", 30F, FontStyle.Regular, GraphicsUnit.Point, 0);
            this.btn00.Location = new Point(140, 489);
            this.btn00.Name = "btn00";
            this.btn00.Size = new Size(131, 159);
            this.btn00.TabIndex = 1;
            this.btn00.Text = "00";
            this.btn00.ThemeName = "VisualStudio2012Light";
            // 
            // btn000
            // 
            this.btn000.Dock = DockStyle.Fill;
            this.btn000.Font = new Font("Microsoft Sans Serif", 30F, FontStyle.Regular, GraphicsUnit.Point, 0);
            this.btn000.Location = new Point(277, 489);
            this.btn000.Name = "btn000";
            this.btn000.Size = new Size(131, 159);
            this.btn000.TabIndex = 2;
            this.btn000.Text = "000";
            this.btn000.ThemeName = "VisualStudio2012Light";
            // 
            // btn01
            // 
            this.btn01.Dock = DockStyle.Fill;
            this.btn01.Font = new Font("Microsoft Sans Serif", 30F, FontStyle.Regular, GraphicsUnit.Point, 0);
            this.btn01.Location = new Point(3, 327);
            this.btn01.Name = "btn01";
            this.btn01.Size = new Size(131, 156);
            this.btn01.TabIndex = 3;
            this.btn01.Text = "1";
            this.btn01.ThemeName = "VisualStudio2012Light";
            // 
            // btn02
            // 
            this.btn02.Dock = DockStyle.Fill;
            this.btn02.Font = new Font("Microsoft Sans Serif", 30F, FontStyle.Regular, GraphicsUnit.Point, 0);
            this.btn02.Location = new Point(140, 327);
            this.btn02.Name = "btn02";
            this.btn02.Size = new Size(131, 156);
            this.btn02.TabIndex = 4;
            this.btn02.Text = "2";
            this.btn02.ThemeName = "VisualStudio2012Light";
            // 
            // btn03
            // 
            this.btn03.Dock = DockStyle.Fill;
            this.btn03.Font = new Font("Microsoft Sans Serif", 30F, FontStyle.Regular, GraphicsUnit.Point, 0);
            this.btn03.Location = new Point(277, 327);
            this.btn03.Name = "btn03";
            this.btn03.Size = new Size(131, 156);
            this.btn03.TabIndex = 5;
            this.btn03.Text = "3";
            this.btn03.ThemeName = "VisualStudio2012Light";
            // 
            // btn04
            // 
            this.btn04.Dock = DockStyle.Fill;
            this.btn04.Font = new Font("Microsoft Sans Serif", 30F, FontStyle.Regular, GraphicsUnit.Point, 0);
            this.btn04.Location = new Point(3, 165);
            this.btn04.Name = "btn04";
            this.btn04.Size = new Size(131, 156);
            this.btn04.TabIndex = 6;
            this.btn04.Text = "4";
            this.btn04.ThemeName = "VisualStudio2012Light";
            // 
            // btn05
            // 
            this.btn05.Dock = DockStyle.Fill;
            this.btn05.Font = new Font("Microsoft Sans Serif", 30F, FontStyle.Regular, GraphicsUnit.Point, 0);
            this.btn05.Location = new Point(140, 165);
            this.btn05.Name = "btn05";
            this.btn05.Size = new Size(131, 156);
            this.btn05.TabIndex = 7;
            this.btn05.Text = "5";
            this.btn05.ThemeName = "VisualStudio2012Light";
            // 
            // btn06
            // 
            this.btn06.Dock = DockStyle.Fill;
            this.btn06.Font = new Font("Microsoft Sans Serif", 30F, FontStyle.Regular, GraphicsUnit.Point, 0);
            this.btn06.Location = new Point(277, 165);
            this.btn06.Name = "btn06";
            this.btn06.Size = new Size(131, 156);
            this.btn06.TabIndex = 8;
            this.btn06.Text = "6";
            this.btn06.ThemeName = "VisualStudio2012Light";
            // 
            // btn07
            // 
            this.btn07.Dock = DockStyle.Fill;
            this.btn07.Font = new Font("Microsoft Sans Serif", 30F, FontStyle.Regular, GraphicsUnit.Point, 0);
            this.btn07.Location = new Point(3, 3);
            this.btn07.Name = "btn07";
            this.btn07.Size = new Size(131, 156);
            this.btn07.TabIndex = 9;
            this.btn07.Text = "7";
            this.btn07.ThemeName = "VisualStudio2012Light";
            // 
            // btn08
            // 
            this.btn08.Dock = DockStyle.Fill;
            this.btn08.Font = new Font("Microsoft Sans Serif", 30F, FontStyle.Regular, GraphicsUnit.Point, 0);
            this.btn08.Location = new Point(140, 3);
            this.btn08.Name = "btn08";
            this.btn08.Size = new Size(131, 156);
            this.btn08.TabIndex = 10;
            this.btn08.Text = "8";
            this.btn08.ThemeName = "VisualStudio2012Light";
            // 
            // btn09
            // 
            this.btn09.Dock = DockStyle.Fill;
            this.btn09.Font = new Font("Microsoft Sans Serif", 30F, FontStyle.Regular, GraphicsUnit.Point, 0);
            this.btn09.Location = new Point(277, 3);
            this.btn09.Name = "btn09";
            this.btn09.Size = new Size(131, 156);
            this.btn09.TabIndex = 11;
            this.btn09.Text = "9";
            this.btn09.ThemeName = "VisualStudio2012Light";
            // 
            // btnPunto
            // 
            this.btnPunto.Dock = DockStyle.Fill;
            this.btnPunto.Font = new Font("Microsoft Sans Serif", 35F, FontStyle.Regular, GraphicsUnit.Point, 0);
            this.btnPunto.Location = new Point(414, 3);
            this.btnPunto.Name = "btnPunto";
            this.btnPunto.Size = new Size(131, 156);
            this.btnPunto.TabIndex = 21;
            this.btnPunto.Text = ".";
            this.btnPunto.ThemeName = "VisualStudio2012Light";
            // 
            // btnSubtotal
            // 
            this.btnSubtotal.BackColor = Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(204)))), ((int)(((byte)(204)))));
            this.btnSubtotal.Dock = DockStyle.Fill;
            this.btnSubtotal.Font = new Font("Microsoft Sans Serif", 12F, FontStyle.Bold, GraphicsUnit.Point, 0);
            this.btnSubtotal.Location = new Point(414, 165);
            this.btnSubtotal.Name = "btnSubtotal";
            this.btnSubtotal.Size = new Size(131, 156);
            this.btnSubtotal.TabIndex = 22;
            this.btnSubtotal.Text = "SUB\r\nTOTAL";
            this.btnSubtotal.ThemeName = "VisualStudio2012Light";
            // 
            // btnCobrar
            // 
            this.btnCobrar.BackColor = Color.PaleGreen;
            this.btnCobrar.Dock = DockStyle.Fill;
            this.btnCobrar.Font = new Font("Microsoft Sans Serif", 12F, FontStyle.Bold, GraphicsUnit.Point, 0);
            this.btnCobrar.Location = new Point(414, 327);
            this.btnCobrar.Name = "btnCobrar";
            this.tlpCalculadora.SetRowSpan(this.btnCobrar, 2);
            this.btnCobrar.Size = new Size(131, 321);
            this.btnCobrar.TabIndex = 23;
            this.btnCobrar.Text = "COBRAR";
            this.btnCobrar.ThemeName = "VisualStudio2012Light";

            string folder = @"\images\icon\";
            string appPath = Path.GetDirectoryName(Application.StartupPath);
            string folderPath = appPath.Substring(0, appPath.Length - 4) + folder;

            // 
            // btnVales
            // 
            this.btnVales.DisplayStyle = Telerik.WinControls.DisplayStyle.Image;
            this.btnVales.Dock = DockStyle.Fill;
            this.btnVales.Enabled = false;
            this.btnVales.Font = new Font("Microsoft Sans Serif", 20F, FontStyle.Regular, GraphicsUnit.Point, 0);
            this.btnVales.Image = Image.FromFile(folderPath + "vales.png");
            this.btnVales.ImageAlignment = ContentAlignment.MiddleCenter;
            this.btnVales.Location = new Point(551, 489);
            this.btnVales.Name = "btnVales";
            this.btnVales.Size = new Size(132, 159);
            this.btnVales.TabIndex = 15;
            this.btnVales.TextImageRelation = TextImageRelation.ImageBeforeText;
            this.btnVales.ThemeName = "VisualStudio2012Light";
            // 
            // btnTarjeta
            // 
            this.btnTarjeta.DisplayStyle = Telerik.WinControls.DisplayStyle.Image;
            this.btnTarjeta.Dock = DockStyle.Fill;
            this.btnTarjeta.Enabled = false;
            this.btnTarjeta.Font = new Font("Microsoft Sans Serif", 20F, FontStyle.Regular, GraphicsUnit.Point, 0);
            this.btnTarjeta.Image = Image.FromFile(folderPath + "tarjeta.png");
            this.btnTarjeta.ImageAlignment = ContentAlignment.MiddleCenter;
            this.btnTarjeta.Location = new Point(551, 327);
            this.btnTarjeta.Name = "btnTarjeta";
            this.btnTarjeta.Size = new Size(132, 156);
            this.btnTarjeta.TabIndex = 14;
            this.btnTarjeta.TextImageRelation = TextImageRelation.ImageBeforeText;
            this.btnTarjeta.ThemeName = "VisualStudio2012Light";
            // 
            // btnDolares
            // 
            this.btnDolares.DisplayStyle = Telerik.WinControls.DisplayStyle.Image;
            this.btnDolares.Dock = DockStyle.Fill;
            this.btnDolares.Font = new Font("Microsoft Sans Serif", 20F, FontStyle.Regular, GraphicsUnit.Point, 0);
            this.btnDolares.Image = Image.FromFile(folderPath + "intercambio.png");
            this.btnDolares.ImageAlignment = ContentAlignment.MiddleCenter;
            this.btnDolares.Location = new Point(551, 165);
            this.btnDolares.Name = "btnDolares";
            this.btnDolares.Size = new Size(132, 156);
            this.btnDolares.TabIndex = 13;
            this.btnDolares.TextImageRelation = TextImageRelation.ImageBeforeText;
            this.btnDolares.ThemeName = "VisualStudio2012Light";
            // 
            // btnEfectivo
            // 
            this.btnEfectivo.DisplayStyle = Telerik.WinControls.DisplayStyle.Image;
            this.btnEfectivo.Dock = DockStyle.Fill;
            this.btnEfectivo.Font = new Font("Microsoft Sans Serif", 20F, FontStyle.Regular, GraphicsUnit.Point, 0);
            this.btnEfectivo.Image = Image.FromFile(folderPath + "efectivo.png");
            this.btnEfectivo.ImageAlignment = ContentAlignment.MiddleCenter;
            this.btnEfectivo.Location = new Point(551, 3);
            this.btnEfectivo.Name = "btnEfectivo";
            this.btnEfectivo.Size = new Size(132, 156);
            this.btnEfectivo.TabIndex = 12;
            this.btnEfectivo.TextImageRelation = TextImageRelation.ImageBeforeText;
            this.btnEfectivo.ThemeName = "VisualStudio2012Light";
        }

        private void frmShoppingCart_Load(object sender, EventArgs e)
        {
            //Set default configuration to UI
            this.AutoSize = true;
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Text = "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions";
            this.KeyPreview = true;

            //Establecer resolucion de la ventana
            int height = Screen.PrimaryScreen.Bounds.Height; //Obtiene el alto de la pantalla principal en pixeles.
            int width = Screen.PrimaryScreen.Bounds.Width; //Obtiene el ancho de la pantalla principal en pixeles.

            this.Size = new Size(width, height);
            this.WindowState = FormWindowState.Maximized;

            thread = new Thread(new ThreadStart(cargarCarruselImagenes));
            thread.Start();
        }

        public void Button_Click(object sender, EventArgs e)
        {
            objButton = (RadButton)sender;

            string name = objButton.Name;

            switch (name)
            {
                case "btnServicios":
                    frmPanelServices frmPanelServices = new frmPanelServices();
                    frmPanelServices.ShowDialog();
                    break;

                case "btnEntradas":
                    frmInputMoney frmInputMoney = new frmInputMoney();
                    frmInputMoney.ShowDialog();
                    break;

                case "btnSalidas":
                    frmOutputMoney frmOutputMoney = new frmOutputMoney();
                    frmOutputMoney.ShowDialog();
                    break;
            }
        }

        public void cargarCarruselImagenes()
        {
            string folder = @"\images\promotions\";
            string appPath = Path.GetDirectoryName(Application.StartupPath);
            string folderPath = appPath.Substring(0, appPath.Length - 4) + folder;
            string[] dirs = Directory.GetFiles(folderPath, "*.png");
            int cantidad = dirs.Length;

            while (true)
            {
                for (int i = 1; i <= cantidad; i++)
                {
                    string filename = "promo_" + i + ".png";
                    string curFile = folderPath + filename;
                    picImagenes.Image = Image.FromFile(curFile);
                    picImagenes.SizeMode = PictureBoxSizeMode.StretchImage;
                    Thread.Sleep(7000);
                }
            }
        }

        public void cargarColumnasCarritoGrid()
        {
            //Crear las columnas del carrito
            dtCarrito.Columns.AddRange(new DataColumn[]{
                //new DataColumn("Codigo de Barras", typeof(string)),
                new DataColumn("Descripcion del Producto", typeof(string)),
                //new DataColumn("Precio Venta", typeof(string)),
                new DataColumn("Cant", typeof(string)),
                new DataColumn("Importe", typeof(string))
                //new DataColumn("IVA (16 %)", typeof(string))
            });

            //Cargar productos del carrito, si es que este contiene alguno
            gvCarritoCompras.DataSource = dtCarrito;

            //this.gvCarritoCompras.Columns["Codigo de Barras"].Width = 150;
            this.gvCarritoCompras.Columns["Descripcion del Producto"].Width = 300;
            //this.gvCarritoCompras.Columns["Precio Venta"].Width = 80;
            this.gvCarritoCompras.Columns["Cant"].Width = 80;
            this.gvCarritoCompras.Columns["Importe"].Width = 150;
            //this.gvCarritoCompras.Columns["IVA (16 %)"].Width = 80;

            this.gvCarritoCompras.AutoSizeColumnsMode = GridViewAutoSizeColumnsMode.Fill;
        }

        public void formatearColumnas()
        {
            //Generar array con el nombre de las columnas
            string[] arrayColumns = new string[] { "Descripcion del Producto", "Cant", "Importe" };

            foreach (var i in arrayColumns)
            {
                GridViewDataColumn column = this.gvCarritoCompras.Columns[i.ToString()];
                column.WrapText = true;
                column.TextAlignment = ContentAlignment.MiddleCenter;

                if (i.ToString() == "Precio Venta" || i.ToString() == "Importe" || i.ToString() == "IVA (16 %)")
                {
                    column.FormatString = "{0:C}";
                    column.FormatInfo = CultureInfo.CreateSpecificCulture("es-MX");
                    column.NullValue = 0;
                }
            }
        }

        private void frmShoppingCart_FormClosed(object sender, FormClosedEventArgs e)
        {
            thread.Abort();
        }
    }
}
