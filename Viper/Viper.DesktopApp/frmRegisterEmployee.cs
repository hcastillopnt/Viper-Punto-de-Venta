﻿/*
 * ---------------------------------------------------------
 * LIBRERIAS UTILIZADAS EN EL FORMULARIO "frmRegisterEmployee.cs"
 * ---------------------------------------------------------
 */

#region using directives 

using AForge.Video;
using AForge.Video.DirectShow;
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
    /// CLASE QUE PERMITE EL DAR DE ALTA EMPLEADOS DENTRO DEL 
    /// SISTEMA DE PUNTO DE VENTA PARA FARMACIAS CON VENTA DE 
    /// GENERICOS
    /// </summary>
    public partial class frmRegisterEmployee : Form
    {
        /*
         * ---------------------------------------------------------
         * VARIABLES, OBJETOS, Y COMPONENTES UTILIZADOS EN EL FORMULARIO "frmRegisterEmployee.cs"
         * ---------------------------------------------------------
         */

        #region Variables, Objetos y Componentes 

        ComponentResourceManager resources = new ComponentResourceManager(typeof(frmRegisterCompany));
        FilterInfoCollection DispositivosDeVideo;
        VideoCaptureDevice FuenteDeVideo = null;
        String rutaFoto = String.Empty;
        bool ExistenDispositivos = false;
        RadButton objButton = null;
        RadTextBox objTextbox = null;
        RadDropDownList objDropDownList = null;
        RadMaskedEditBox objMaskedEditBox = null;
        RadDateTimePicker objDateTimePicker = null;
        DateTime f = DateTime.Now;
        EmployeeDepartmentHistory employeeDepartmentHistory = null;
        Employee employee = null;
        Address address = null;

        #endregion

        /*
         * ---------------------------------------------------------
         * CONSTRUCTORES UTILIZADOS EN EL FORMULARIO "frmRegisterEmployee.cs"
         * ---------------------------------------------------------
         */

        #region Constructor

        public frmRegisterEmployee()
        {
            InitializeComponent();

            //Cargar todos los dispositivos de camara
            buscarDispositivos();

            //Cargar todos los combo box con la informacion correspondiente
            fillDropDownList();
        }

        #endregion

        /*
         * ---------------------------------------------------------
         * EVENTOS UTILIZADOS EN EL FORMULARIO "frmRegisterEmployee.cs"
         * ---------------------------------------------------------
         */

        #region Eventos

        private void frmRegisterEmployee_Load(object sender, EventArgs e)
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
            this.ActiveControl = Nombre;
            this.Nombre.Focus();

            //Establecer usuario
            this.Password.Text = "123456";
            this.ConfirmarPassword.Text = "123456";

            ToolTip toolTip1 = new ToolTip();

            // Set up the delays for the ToolTip.
            toolTip1.AutoPopDelay = 5000;
            toolTip1.InitialDelay = 1000;
            toolTip1.ReshowDelay = 500;
            // Force the ToolTip text to be displayed whether or not the form is active.
            toolTip1.ShowAlways = true;

            // Set up the ToolTip text for the Button and Checkbox.
            toolTip1.SetToolTip(this.btnAceptar, "Para poder guardar los datos del empleado, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnCaptura, "Para iniciar la camara, favor de dar clic a este boton");
            toolTip1.SetToolTip(this.btnExaminar, "Para buscar el logotipo de su negocio almacenado en su pc, favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnEliminarIE, "Para eliminar, favor de dar cli a este boton");
            toolTip1.SetToolTip(this.btnCancelar, "Para cancelar la operacion y volver al formulario inicial, favor de dar clic a este boton");
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

        private void video_NuevoFrame(object sender, NewFrameEventArgs eventArgs)
        {
            Bitmap Imagen = (Bitmap)eventArgs.Frame.Clone();
            picEmpleado.Image = Imagen;
        }

        private void Departamento_SelectedIndexChanged(object sender, Telerik.WinControls.UI.Data.PositionChangedEventArgs e)
        {
            this.Puesto.Items.Clear();

            if (this.Departamento.SelectedIndex > 0)
            {
                this.Puesto.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetJobTitleDropDownList(Convert.ToInt32(Departamento.SelectedValue));
                this.Puesto.DisplayMember = "Name";
                this.Puesto.ValueMember = "Id";
                this.Puesto.SelectedIndex = 0;
            }
            else
            {
                this.Puesto.Items.Add("--SELECCIONE--");
            }
        }

        private void EntidadFederativa_SelectedIndexChanged(object sender, Telerik.WinControls.UI.Data.PositionChangedEventArgs e)
        {
            this.Municipio.Items.Clear();

            if (this.Entidad_Federativa.SelectedIndex > 0)
            {
                this.Municipio.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetCityDropDownList(Convert.ToInt32(Entidad_Federativa.SelectedValue));
                this.Municipio.DisplayMember = "Description";
                this.Municipio.ValueMember = "Id";
                this.Municipio.SelectedIndex = 0;
            }
            else
            {
                this.Municipio.Items.Add("--SELECCIONE--");
            }
        }

        private void CURP_TextChanged(object sender, EventArgs e)
        {
            this.Usuario.Text = CURP.Text.Trim().ToUpper().ToString();
        }

        private void Button_Click(object sender, EventArgs e)
        {
            objButton = (RadButton)sender;

            switch (objButton.Name)
            {
                case "btnAceptar":
                    registerEmployeeInSystem();
                    break;

                case "btnCancelar":
                    setToDefaultFields();
                    break;

                case "btnEliminarIE":
                    //No existe metodo aun
                    break;

                case "btnEliminarAS":
                    //No existe metodo aun
                    break;

                case "btnCaptura":
                    capturarFotografia();
                    break;

                case "btnExaminar":
                    uploadFotografia();
                    break;
            }
        }

        #endregion

        /*
         * ---------------------------------------------------------
         * METODOS UTILIZADOS EN EL FORMULARIO "frmRegisterEmployee.cs"
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
                rutaFoto = BuscarImagen.FileName;
                picEmpleado.ImageLocation = rutaFoto;
                picEmpleado.SizeMode = PictureBoxSizeMode.StretchImage;
            }
        }

        private void savePicture()
        {
            bool isNullOrEmpty = picEmpleado == null || picEmpleado.Image == null;

            if (!isNullOrEmpty)
            {
                string folder = @"\images\profile_pictures\";
                string appPath = Path.GetDirectoryName(Application.StartupPath);
                string folderToSave = appPath.Substring(0, appPath.Length - 4) + folder;

                if (Directory.Exists(folderToSave) == false)
                {
                    Directory.CreateDirectory(folderToSave);
                }

                string companyName = CURP.Text.Trim().ToString();
                string filename = companyName + ".jpg";

                picEmpleado.Image.Save(folderToSave + filename, ImageFormat.Jpeg);
            }
            else
            {
                MessageBox.Show(new Form { TopMost = true }, "La fotografia del empleado no se ha podido almacenar correctamente", "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        public static byte[] ImageToByte(Image img)
        {
            ImageConverter converter = new ImageConverter();
            return (byte[])converter.ConvertTo(img, typeof(byte[]));
        }

        public void cargarDispositivos(FilterInfoCollection Dispositivos)
        {
            //cboCamara.Items.Add("--SELECCIONE--");

            for (int i = 0; i < Dispositivos.Count; i++)
            {
                cboCamara.Items.Add(Dispositivos[i].Name.ToString().ToUpper());
            }

            cboCamara.SelectedIndex = 1;

            //cboCamara.Text = cboCamara.Items[0].ToString();
        }

        public void terminarFuenteDeVideo()
        {
            if (!(FuenteDeVideo == null))
                if (FuenteDeVideo.IsRunning)
                {
                    FuenteDeVideo.SignalToStop();
                    FuenteDeVideo = null;
                }
        }

        public void buscarDispositivos()
        {
            DispositivosDeVideo = new FilterInfoCollection(FilterCategory.VideoInputDevice);
            if (DispositivosDeVideo.Count == 0)
                ExistenDispositivos = false;
            else
            {
                ExistenDispositivos = true;
                cargarDispositivos(DispositivosDeVideo);
            }
        }

        private void fillDropDownList()
        {
            this.Genero.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetGendersDropDownList();
            this.Genero.DisplayMember = "Name";
            this.Genero.ValueMember = "Id";
            this.Genero.SelectedIndex = 0;

            this.Estado_Civil.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetMaritalStatusDropDownList();
            this.Estado_Civil.DisplayMember = "Name";
            this.Estado_Civil.ValueMember = "Id";
            this.Estado_Civil.SelectedIndex = 0;

            this.Tipo_Inmueble.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetAddressTypeDropDownList();
            this.Tipo_Inmueble.DisplayMember = "Name";
            this.Tipo_Inmueble.ValueMember = "Id";
            this.Tipo_Inmueble.SelectedIndex = 0;

            this.Tipo_Vialidad.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetRoadTypeDropDownList();
            this.Tipo_Vialidad.DisplayMember = "Name";
            this.Tipo_Vialidad.ValueMember = "Id";
            this.Tipo_Vialidad.SelectedIndex = 0;

            this.Entidad_Federativa.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetStateProvinceDropDownList(); ;
            this.Entidad_Federativa.DisplayMember = "Description";
            this.Entidad_Federativa.ValueMember = "Id";
            this.Entidad_Federativa.SelectedIndex = 0;

            this.Municipio.SelectedIndex = 0;

            this.Rol.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetRolesDropDownList();
            this.Rol.DisplayMember = "Name";
            this.Rol.ValueMember = "Id";
            this.Rol.SelectedIndex = 0;

            //Obtenemos el nombre de la compañia
            string companyName = frmLogin.dt.Rows[0].Field<String>("CompanyName");

            //Si el usuario logueado es un empleado, mostramos la sucursal en la que se encuentra registrado
            this.Sucursal.DataSource = BusinessLogicLayer.SiteBLL.procGetSitesByCompanyName(companyName);
            this.Sucursal.DisplayMember = "Site";
            this.Sucursal.ValueMember = "Id";
            this.Sucursal.SelectedIndex = 0;

            this.Departamento.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetDepartmentDropDownList();
            this.Departamento.DisplayMember = "Name";
            this.Departamento.ValueMember = "Id";
            this.Departamento.SelectedIndex = 0;

            this.Puesto.SelectedIndex = 0;

            this.Turno.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetShiftDropDownList();
            this.Turno.DisplayMember = "Name";
            this.Turno.ValueMember = "Id";
            this.Turno.SelectedIndex = 0;
        }

        private void capturarFotografia()
        {
            if (btnCaptura.Text == "Capturar [Iniciar]")
            {
                if (ExistenDispositivos)
                {
                    Console.WriteLine(cboCamara.SelectedIndex.ToString());
                    FuenteDeVideo = new VideoCaptureDevice(DispositivosDeVideo[cboCamara.SelectedIndex].MonikerString);
                    FuenteDeVideo.NewFrame += new NewFrameEventHandler(video_NuevoFrame);
                    FuenteDeVideo.Start();
                    btnCaptura.Text = "Capturar [Detener]";
                    cboCamara.Enabled = false;
                }
                else
                    MessageBox.Show("No se encuentra dispositivo", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                if (FuenteDeVideo.IsRunning)
                {
                    terminarFuenteDeVideo();
                    btnCaptura.Text = "Capturar [Iniciar]";
                    cboCamara.Enabled = true;
                }
            }
        }

        private void recoveryInformationObjectsByUserInterface()
        {
            if (employee == null)
                employee = new Employee();

            //Obtener las iniciales del nombre de una persona
            string fullname = Nombre.Text.Trim().ToUpper().ToString() + " " + Apellido_Paterno.Text.Trim().ToUpper().ToString() + " " + Apellido_Materno.Text.Trim().ToUpper().ToString();

            string IS = String.Empty;

            var datos = (from c in fullname.Split(' ') where Char.IsUpper(Convert.ToChar(c.Substring(0, 1))) select c.Substring(0, 1));

            foreach (string s in datos)
            {
                IS += s;
            }

            employee.IS = IS;
            employee.FirstName = Nombre.Text.Trim().ToUpper().ToString();
            employee.MiddleName = Apellido_Paterno.Text.Trim().ToUpper().ToString();
            employee.LastName = Apellido_Materno.Text.Trim().ToUpper().ToString();
            employee.FullName = fullname;

            if (string.IsNullOrEmpty(Telefono.Text.Trim().ToString()) || Telefono.Text.Contains("(__)___-_____"))
                employee.PhoneNumber = null;
            else
                employee.PhoneNumber = Telefono.Value.ToString().Trim();

            if (string.IsNullOrEmpty(Celular.Text.Trim().ToString()) || Celular.Text.Contains("(___)___-___-____"))
                employee.CellphoneNumber = null;
            else
                employee.CellphoneNumber = Celular.Value.ToString().Trim();

            employee.BirthDate = Fecha_de_Nacimiento.Value.ToString().Replace("/", "");
            employee.MaritalStatusId = Convert.ToInt32(Estado_Civil.SelectedValue);
            employee.GenderId = Convert.ToInt32(Genero.SelectedValue);
            employee.RFC = RFC.Text.Trim().ToUpper().ToString();
            employee.CURP = CURP.Text.Trim().ToUpper().ToString();
            employee.NSS = NSS.Text.Trim().ToString();
            employee.StartDate = f;
            employee.IsActive = true;
            employee.CreatedDate = f;
            employee.CreatedBy = "HECP";
            employee.LastUpdatedDate = f;
            employee.LastUpdatedBy = "HECP";

            if (address == null)
                address = new Address();

            address.RoadTypeId = Convert.ToInt32(Tipo_Vialidad.SelectedValue);
            address.AddressTypeId = Convert.ToInt32(Tipo_Inmueble.SelectedValue);
            if (!string.IsNullOrEmpty(No_Int.Text.Trim().ToString()))
            {
                if (!string.IsNullOrEmpty(Vialidad.Text.Trim().ToString()))
                    address.Street = Vialidad.Text.Trim().ToString();
                if (!string.IsNullOrEmpty(No_Ext.Text.Trim().ToString()))
                    address.No_Ext = No_Ext.Text.Trim().ToString();

                address.No_Int = No_Int.Text.Trim().ToString();
            }
            else
            {
                if (!string.IsNullOrEmpty(Vialidad.Text.Trim().ToString()))
                    address.Street = Vialidad.Text.Trim().ToString();
                if (!string.IsNullOrEmpty(No_Ext.Text.Trim().ToString()))
                    address.No_Ext = No_Ext.Text.Trim().ToString();
            }

            if(!string.IsNullOrEmpty(Colonia.Text.Trim().ToString()))
                address.Colony = Colonia.Text.Trim().ToString();

            address.CountryRegionId = 1;
            address.StateProvinceId = Convert.ToInt32(Entidad_Federativa.SelectedValue);
            address.CityId = Convert.ToInt32(Municipio.SelectedValue);
            address.PostalCode = Codigo_Postal.Text.Trim();
            address.CreatedDate = f;
            address.CreatedBy = "HECP";
            address.LastUpdatedDate = f;
            address.LastUpdatedBy = "HECP";

            if (employeeDepartmentHistory == null)
                employeeDepartmentHistory = new EmployeeDepartmentHistory();

            employeeDepartmentHistory.JobTitleId = Convert.ToInt32(Puesto.SelectedValue);
            employeeDepartmentHistory.DepartmentId = Convert.ToInt32(Departamento.SelectedValue);
            employeeDepartmentHistory.SiteId = Convert.ToInt32(Sucursal.SelectedValue);
            employeeDepartmentHistory.ShiftId = Convert.ToInt32(Turno.SelectedValue);
            employeeDepartmentHistory.CreatedDate = f;
            employeeDepartmentHistory.CreatedBy = "HECP";
            employeeDepartmentHistory.LastUpdatedDate = f;
            employeeDepartmentHistory.LastUpdatedBy = "HECP";

            //Valores automaticos
            employeeDepartmentHistory.EmployeeId = 0;
            employee.AddressId = 0;
            employee.EmployeeNumber = "DEFAULT";
            employee.UserId = 0;
        }

        private void registerEmployeeInSystem()
        {
            string message = String.Empty;

            recoveryInformationObjectsByUserInterface();

            message = BusinessLogicLayer.EmployeeBLL.procInsertEmployeeToSystem(address, employee, employeeDepartmentHistory, Convert.ToInt32(Rol.SelectedValue));

            if (String.IsNullOrEmpty(message))
            {
                savePicture();

                MessageBox.Show(new Form { TopMost = true }, "Empleado registrado correctamente", "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Information);

                setToDefaultFields();

                this.Hide();
            }
            else
            {
                MessageBox.Show(new Form { TopMost = true }, message, "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void setToDefaultFields()
        {
            this.Nombre.Text = String.Empty;
            this.Fecha_de_Nacimiento.Text = "__/__/____";
            this.Apellido_Paterno.Text = String.Empty;
            this.Apellido_Materno.Text = String.Empty;
            this.Genero.SelectedIndex = 0;
            this.Estado_Civil.SelectedIndex = 0;
            this.RFC.Text = String.Empty;
            this.CURP.Text = String.Empty;
            this.NSS.Text = "___-__-______";
            this.Tipo_Inmueble.SelectedIndex = 0;
            this.Tipo_Vialidad.SelectedIndex = 0;
            this.Vialidad.Text = String.Empty;
            this.Codigo_Postal.Text = "_____";
            this.No_Ext.Text = String.Empty;
            this.No_Int.Text = String.Empty;
            this.Colonia.Text = String.Empty;
            this.Entidad_Federativa.SelectedIndex = 0;
            this.Municipio.SelectedIndex = 0;
            this.eMail.Text = String.Empty;
            this.Telefono.Text = "(__)___-_____";
            this.Celular.Text = "(___)___-___-____";
            this.Usuario.Text = String.Empty;
            this.Password.Text = String.Empty;
            this.ConfirmarPassword.Text = String.Empty;
            this.Rol.SelectedIndex = 0;
            this.Turno.SelectedIndex = 0;
            this.Fecha_Inicio_Labores.Text = DateTime.Now.ToShortDateString();
            this.Fecha_Fin_Labores.Text = DateTime.Now.ToShortDateString();
            this.Sucursal.SelectedIndex = 0;
            this.Departamento.SelectedIndex = 0;
            this.Puesto.SelectedIndex = 0;

            rutaFoto = String.Empty;

            string folder = @"\images\icon\";
            string appPath = Path.GetDirectoryName(Application.StartupPath);
            string fullPath = appPath.Substring(0, appPath.Length - 4) + folder;
            string fileNamePath = fullPath + "empleado.png";

            //this.picEmpleado.Image = ((System.Drawing.Image)(resources.GetObject("picLogotipo.Image")));
            this.picEmpleado.ImageLocation = fileNamePath;
        }

        #endregion
    }
}
