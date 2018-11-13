/*
 * ---------------------------------------------------------
 * LIBRERIAS UTILIZADAS EN EL FORMULARIO "frmRegisterProduct.cs"
 * ---------------------------------------------------------
 */

#region using directives 

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Telerik.WinControls.UI;
using Viper.BusinessEntities;

#endregion

namespace Viper.DesktopApp
{
    /// <summary>
    /// CLASE QUE PERMITE EL DAR DE ALTA PRODUCTOS DENTRO DEL 
    /// SISTEMA DE PUNTO DE VENTA PARA FARMACIAS CON VENTA DE 
    /// GENERICOS
    /// </summary>
    public partial class frmRegisterProduct : Form
    {
        /*
         * ---------------------------------------------------------
         * VARIABLES, OBJETOS, Y COMPONENTES UTILIZADOS EN EL FORMULARIO "frmRegisterProduct.cs"
         * ---------------------------------------------------------
         */

        #region Variables, Objetos y Componentes 

        String rutaIcono = String.Empty;
        RadButton objButton = null;
        RadTextBox objTextbox = null;
        RadDropDownList objDropDownList = null;
        RadCheckBox objChekBox = null;
        DateTime f = DateTime.Now;
        Product product = null;
        int UnitsInStock = 0;

        #endregion

        /*
         * ---------------------------------------------------------
         * CONSTRUCTORES UTILIZADOS EN EL FORMULARIO "frmRegisterProduct.cs"
         * ---------------------------------------------------------
         */

        #region Constructor

        public frmRegisterProduct()
        {
            InitializeComponent();

            fillDropDownList();
        }

        #endregion

        /*
         * ---------------------------------------------------------
         * EVENTOS UTILIZADOS EN EL FORMULARIO "frmRegisterProduct.cs"
         * ---------------------------------------------------------
         */

        #region Eventos

        private void frmAddProduct_Load(object sender, EventArgs e)
        {
            //Set default configuration to UI
            this.AcceptButton = btnAceptar;
            this.CancelButton = btnCancelar;
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

            //Establecer el foco en el primer campo
            this.ActiveControl = btnSinReceta;
            this.btnSinReceta.Focus();

            ToolTip toolTip1 = new ToolTip();

            // Set up the delays for the ToolTip.
            toolTip1.AutoPopDelay = 5000;
            toolTip1.InitialDelay = 1000;
            toolTip1.ReshowDelay = 500;
            // Force the ToolTip text to be displayed whether or not the form is active.
            toolTip1.ShowAlways = true;

            // Set up the ToolTip text for the Button and Checkbox.
            toolTip1.SetToolTip(this.btnAceptar, "Para poder agregar un producto , favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnCancelar, "Para poder cancelar el proceso, favor de dar clic en este boton");

        }

        public void Button_Click(Object sender, EventArgs args)
        {
            objButton = (RadButton)sender;

            switch (objButton.Name)
            {
                case "btnAceptar":
                    registerProductInSystem();
                    break;
                case "btnCancelar":
                    setToDefaultFields();
                    break;
                case "btnExaminar":
                    uploadFotografia();
                    break;
                case "btnSinReceta":
                    LockedAndUnlockedFields(objButton.Name);
                    break;
                case "btnAntibiotico":
                    LockedAndUnlockedFields(objButton.Name);
                    break;
                case "btnOtroProducto":
                    LockedAndUnlockedFields(objButton.Name);
                    break;
            }
        }

        private void OnlyNumbersToDecimal_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) &&
        (e.KeyChar != '.'))
            {
                e.Handled = true;
            }

            // only allow one decimal point
            if ((e.KeyChar == '.') && ((sender as RadTextBox).Text.IndexOf('.') > -1))
            {
                e.Handled = true;
            }
        }

        private void OnlyNumbers_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!(char.IsNumber(e.KeyChar)) && (e.KeyChar != (char)Keys.Back))
            {
                e.Handled = true;
                return;
            }

            if (e.KeyChar == (char)(Keys.Enter))
            {
                e.Handled = true;
                SendKeys.Send("{TAB}");
            }
        }

        private void OnlyLetters_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (Char.IsLetter(e.KeyChar))
            {
                e.Handled = false;
            }
            else if (Char.IsControl(e.KeyChar))
            {
                e.Handled = false;
            }
            else if (Char.IsSeparator(e.KeyChar))
            {
                e.Handled = false;
            }
            else
            {
                e.Handled = true;
            }

            if (e.KeyChar == (char)(Keys.Enter))
            {
                e.Handled = true;
                SendKeys.Send("{TAB}");
            }
        }

        private void OnlyLettersAndNumbers_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (Char.IsLetter(e.KeyChar))
            {
                e.Handled = false;
            }
            else if (Char.IsDigit(e.KeyChar))
            {
                e.Handled = false;
            }
            else if (Char.IsControl(e.KeyChar))
            {
                e.Handled = false;
            }
            else if (Char.IsSeparator(e.KeyChar))
            {
                e.Handled = false;
            }
            else
            {
                e.Handled = true;
            }

            if (e.KeyChar == (char)(Keys.Enter))
            {
                e.Handled = true;
                SendKeys.Send("{TAB}");
            }
        }

        private void Departamento_SelectedIndexChanged(object sender, Telerik.WinControls.UI.Data.PositionChangedEventArgs e)
        {
            Categoria.Items.Clear();

            if (Departamento.SelectedIndex > 0)
            {
                int DepartamentoID = Convert.ToInt32(Departamento.SelectedValue.ToString());

                this.Categoria.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetProductSubCategoryDropDownList(DepartamentoID);
                this.Categoria.DisplayMember = "Name";
                this.Categoria.ValueMember = "Id";
                this.Categoria.SelectedIndex = 0;
            }
            else
            {
                Categoria.Items.Add("--SELECCIONE--");
            }
        }

        private void Control_Leave(object sender, EventArgs e)
        {
            if (sender is RadTextBox)
            {
                objTextbox = (RadTextBox)sender;

                switch (objTextbox.Name)
                {
                    //tab 1
                    case "Codigo_Barras":
                        pvAddProduct.SelectedPage = pvpDatosBasicos;
                        Clave_Alterna.Focus();
                        Clave_Alterna.Select();
                        break;

                    //tab 2
                    case "Clave_Alterna":
                        pvAddProduct.SelectedPage = pvpDatosBasicos;
                        Descripcion.Focus();
                        Descripcion.Select();
                        break;

                    //tab 3
                    case "Apellido_Materno":
                        pvAddProduct.SelectedPage = pvpDatosBasicos;
                        Descripcion.Focus();
                        Descripcion.Select();
                        break;

                    //tab 4
                    case "Descripcion":
                        pvAddProduct.SelectedPage = pvpDatosBasicos;
                        Sustancia_Activa.Focus();
                        Sustancia_Activa.Select();
                        break;

                    //tab 5
                    case "Sustancia_Activa":
                        pvAddProduct.SelectedPage = pvpDatosBasicos;
                        Departamento.Focus();
                        Departamento.Select();
                        break;

                    //tab 14
                    case "Precio_Compra_Sin_Impuestos":
                        pvAddProduct.SelectedPage = pvpDatosAdicionales;
                        chkImpuestoCompra.Focus();
                        break;

                    //tab 16
                    case "Precio_Venta_Sin_Impuestos":
                        pvAddProduct.SelectedPage = pvpDatosAdicionales;
                        chkImpuestoVenta.Focus();
                        break;

                    //tab 18
                    case "Inventario_Minimo":
                        pvAddProduct.SelectedPage = pvpDatosAdicionales;
                        Inventario_Maximo.Focus();
                        Inventario_Maximo.Select();
                        break;

                    //tab 19
                    case "Inventario_Maximo":
                        pvAddProduct.SelectedPage = pvpDatosAdicionales;
                        Stock_Actual.Focus();
                        Stock_Actual.Select();
                        break;

                    //tab 20
                    case "Stock_Actual":
                        pvAddProduct.SelectedPage = pvpDatosBasicos;
                        btnAceptar.Focus();
                        break;

                    //tab 22
                    case "Ubicacion":
                        pvAddProduct.SelectedPage = pvpDatosAdicionales;
                        btnExaminar.Focus();
                        break;
                }
            }
            else if (sender is RadButton)
            {
                objButton = (RadButton)sender;

                switch (objButton.Name)
                {
                    //tab 9
                    case "btnSinReceta":
                        pvAddProduct.SelectedPage = pvpDatosBasicos;
                        btnAntibiotico.Focus();
                        break;

                    //tab 10
                    case "btnAntibiotico":
                        pvAddProduct.SelectedPage = pvpDatosBasicos;
                        btnOtroProducto.Focus();
                        break;

                    //tab 11
                    case "btnOtroProducto":
                        pvAddProduct.SelectedPage = pvpDatosBasicos;
                        Codigo_Barras.Focus();
                        break;

                    //tab 12
                    case "btnExaminar":
                        pvAddProduct.SelectedPage = pvpDatosAdicionales;
                        chkUtilizaInventario.Focus();
                        break;

                    //tab 21
                    case "btnAceptar":
                        pvAddProduct.SelectedPage = pvpDatosBasicos;
                        btnCancelar.Focus();
                        break;

                    //tab 22
                    case "btnCancelar":
                        pvAddProduct.SelectedPage = pvpDatosBasicos;
                        btnSinReceta.Focus();
                        break;
                }
            }
            else if (sender is RadCheckBox)
            {
                objChekBox = (RadCheckBox)sender;

                switch (objChekBox.Name)
                {
                    //tab 13
                    case "chkUtilizaInventario":
                        pvAddProduct.SelectedPage = pvpDatosAdicionales;
                        Precio_Compra_Sin_Impuestos.Focus();
                        Precio_Compra_Sin_Impuestos.Select();
                        break;

                    //tab 15
                    case "chkImpuestoCompra":
                        pvAddProduct.SelectedPage = pvpDatosAdicionales;
                        Precio_Venta_Sin_Impuestos.Focus();
                        Precio_Venta_Sin_Impuestos.Select();
                        break;

                    //tab 17
                    case "chkImpuestoVenta":
                        pvAddProduct.SelectedPage = pvpDatosAdicionales;
                        Inventario_Minimo.Focus();
                        Inventario_Minimo.Select();
                        break;
                }
            }
            else if (sender is RadDropDownList)
            {
                objDropDownList = (RadDropDownList)sender;

                switch (objDropDownList.Name)
                {
                    //tab 6
                    case "Departamento":
                        pvAddProduct.SelectedPage = pvpDatosBasicos;
                        Categoria.Focus();
                        break;

                    //tab 7
                    case "Categoria":
                        pvAddProduct.SelectedPage = pvpDatosBasicos;
                        Proveedor.Focus();
                        break;

                    //tab 8
                    case "Proveedor":
                        pvAddProduct.SelectedPage = pvpDatosBasicos;
                        Ubicacion.Focus();
                        Ubicacion.Select();
                        break;
                }
            }
        }

        private void chkImpuestoCompra_ToggleStateChanged(object sender, StateChangedEventArgs args)
        {
            if(chkImpuestoCompra.Checked)
            {
                decimal totalCompra = 0.0M;
                decimal standardCost = 0.0M;
                decimal iva = 0.0M;

                standardCost = Convert.ToDecimal(Precio_Compra_Sin_Impuestos.Text.Trim().ToString());
                iva = standardCost * 0.16M;

                totalCompra = Math.Truncate((standardCost +iva) * 10000 / (100 + 18)) / 100;

                Precio_Compra_Con_Impuestos.Text = totalCompra.ToString();
            }
            else
            {
                Precio_Compra_Con_Impuestos.Text = string.Empty;
            }
        }

        private void chkImpuestoVenta_ToggleStateChanged(object sender, StateChangedEventArgs args)
        {
            if (chkImpuestoCompra.Checked)
            {
                decimal totalVenta = 0.0M;
                decimal listPrice = 0.0M;
                decimal iva = 0.0M;

                listPrice = Convert.ToDecimal(Precio_Venta_Sin_Impuestos.Text.Trim().ToString());
                iva = listPrice * 0.16M;

                totalVenta = Math.Truncate((listPrice + iva) * 10000 / (100 + 18)) / 100;

                Precio_Venta_Con_Impuestos.Text = totalVenta.ToString();
            }
            else
            {
                Precio_Venta_Con_Impuestos.Text = string.Empty;
            }
        }

        #endregion

        /*
         * ---------------------------------------------------------
         * METODOS UTILIZADOS EN EL FORMULARIO "frmRegisterProduct.cs"
         * ---------------------------------------------------------
         */

        #region Metodos

        private void uploadFotografia()
        {
            OpenFileDialog BuscarImagen = new OpenFileDialog();
            BuscarImagen.Filter = ".bmp;*.gif;*.jpg;*.png|*.bmp;*.gif;*.jpg;*.png|Imagen Jpg(*.jpg)|*.jpg|Imagen PNG(*.png)|*.png|Imagen Gif(*.gif*)|*.gif";
            BuscarImagen.FileName = "";
            BuscarImagen.Title = "Examinar Imagen";
            if (BuscarImagen.ShowDialog() == DialogResult.OK)
            {
                rutaIcono = BuscarImagen.FileName;
                String Direccion = BuscarImagen.FileName;
                picMedicamento.ImageLocation = Direccion;
                picMedicamento.SizeMode = PictureBoxSizeMode.StretchImage;
            }
        }

        private void savePicture()
        {
            bool isNullOrEmpty = picMedicamento == null || picMedicamento.Image == null;

            if (!isNullOrEmpty)
            {
                string folder = @"\images\product_pictures\";
                string appPath = Path.GetDirectoryName(Application.StartupPath);
                string folderToSave = appPath.Substring(0, appPath.Length - 4) + folder;

                if (Directory.Exists(folderToSave) == false)
                {
                    Directory.CreateDirectory(folderToSave);
                }

                string barCode = Codigo_Barras.Text.Trim().ToString();
                string filename = barCode + ".jpg";

                picMedicamento.Image.Save(folderToSave + filename, ImageFormat.Jpeg);
            }
            else
            {
                MessageBox.Show(new Form { TopMost = true }, "La imagen del producto no se ha podido almacenar correctamente", "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        public static byte[] ImageToByte(Image img)
        {
            ImageConverter converter = new ImageConverter();
            return (byte[])converter.ConvertTo(img, typeof(byte[]));
        }

        private void fillDropDownList()
        {
            this.Departamento.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetProductCategoryDropDownList();
            this.Departamento.DisplayMember = "Name";
            this.Departamento.ValueMember = "Id";
            this.Departamento.SelectedIndex = 0;

            this.Proveedor.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetSupplierDropDownList();
            this.Proveedor.DisplayMember = "SupplierName";
            this.Proveedor.ValueMember = "Id";
            this.Proveedor.SelectedIndex = 0;

            this.Categoria.SelectedIndex = 0;
        }

        private void LockedAndUnlockedFields(string buttonName)
        {
            switch(buttonName)
            {
                case "btnSinReceta":
                    Sustancia_Activa.Enabled = true;
                    btnSinReceta.Enabled = false;
                    btnAntibiotico.Enabled = true;
                    btnOtroProducto.Enabled = true;
                    break;

                case "btnAntibiotico":
                    Sustancia_Activa.Enabled = true;
                    btnSinReceta.Enabled = true;
                    btnAntibiotico.Enabled = false;
                    btnOtroProducto.Enabled = true;
                    break;

                case "btnOtroProducto":
                    Sustancia_Activa.Enabled = false;
                    btnSinReceta.Enabled = true;
                    btnAntibiotico.Enabled = true;
                    btnOtroProducto.Enabled = false;
                    break;
            }
        }

        private void recoveryInformationObjectByProductInterface()
        {
            if (product == null)
                product = new Product();

            product.BarCode = Codigo_Barras.Text.ToUpper().Trim().ToString();
            product.AlternativeCode = Clave_Alterna.Text.ToUpper().Trim().ToString();
            product.ActiveSubstance = Sustancia_Activa.Text.ToUpper().Trim().ToString();
            product.Description = Descripcion.Text.ToUpper().Trim().ToString();
            product.Location = Ubicacion.Text.ToUpper().Trim().ToString();
            product.ProductSubCategoryId = Convert.ToInt32(Categoria.SelectedValue);

            if (chkImpuestoCompra.Checked)
            {
                product.StandardCost = Convert.ToDecimal(Precio_Compra_Sin_Impuestos.Text.Trim().ToString());
                product.ListPrice = Convert.ToDecimal(Precio_Venta_Sin_Impuestos.Text.Trim().ToString());
            }
            else
            {
                product.StandardCost = Convert.ToDecimal(Precio_Compra_Con_Impuestos.Text.Trim().ToString());
                product.ListPrice = Convert.ToDecimal(Precio_Venta_Con_Impuestos.Text.Trim().ToString());
            }

            product.IsUseInStock = chkUtilizaInventario.Checked;
            product.IsDiscontinued = false;
            product.IsLot = false;

            if (btnAntibiotico.Enabled == false)
                product.IsRecipe = true;
            else
                product.IsRecipe = false;

            product.IsActive = true;
            product.DiscontinuedDate = String.Empty;
            product.InvMin = Convert.ToInt32(Inventario_Minimo.Text.Trim().ToString());
            product.InvMax = Convert.ToInt32(Inventario_Maximo.Text.Trim().ToString());
            product.SupplierId = Convert.ToInt32(Proveedor.SelectedValue);
            product.SiteId = Convert.ToInt32(frmMain.cboSucursales.SelectedValue);
            product.CreatedDate = f;
            product.CreatedBy = "HECP";
            product.LastUpdatedDate = f;
            product.LastUpdatedBy = "HECP";

            UnitsInStock = Convert.ToInt32(Stock_Actual.Text.Trim().ToString());
        }

        private void setToDefaultFields()
        {
            this.Codigo_Barras.Text = String.Empty;
            this.Clave_Alterna.Text = String.Empty;
            this.Sustancia_Activa.Text = String.Empty;
            this.Descripcion.Text = String.Empty;
            this.Ubicacion.Text = String.Empty;
            this.Departamento.SelectedIndex = 0;
            this.Categoria.SelectedIndex = 0;
            this.chkImpuestoCompra.Checked = false;
            this.chkUtilizaInventario.Checked = false;
            this.chkImpuestoVenta.Checked = false;
            this.chkImpuestoCompra.Checked = false;
            this.Inventario_Minimo.Text = String.Empty;
            this.Inventario_Maximo.Text = String.Empty;
            this.Proveedor.SelectedIndex = 0;

            string folder = @"\images\icon\";
            string appPath = Path.GetDirectoryName(Application.StartupPath);
            string fullPath = appPath.Substring(0, appPath.Length - 4) + folder;
            string fileNamePath = fullPath + "pastillas.png";

            //this.picEmpleado.Image = ((System.Drawing.Image)(resources.GetObject("picLogotipo.Image")));
            this.picMedicamento.ImageLocation = fileNamePath;
        }

        private void registerProductInSystem()
        {
            string message = String.Empty;

            if (frmMain.cboSucursales.SelectedIndex > 0)
            {
                recoveryInformationObjectByProductInterface();

                message = BusinessLogicLayer.ProductBLL.procRegisterProduct(product, UnitsInStock, product.SiteId);

                if (String.IsNullOrEmpty(message))
                {
                    savePicture();

                    MessageBox.Show(new Form { TopMost = true }, "Producto registrado correctamente", "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    setToDefaultFields();

                    this.Hide();
                }
                else
                {
                    MessageBox.Show(new Form { TopMost = true }, message, "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            else
            {
                MessageBox.Show(new Form { TopMost = true }, "Favor de seleccionar una sucursal para dar de alta el producto en ella", "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                this.Hide();
            }
        }

        #endregion
    }
}
