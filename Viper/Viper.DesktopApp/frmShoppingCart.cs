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
            cargarColumnasCarritoGrid();
            formatearColumnas();
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
