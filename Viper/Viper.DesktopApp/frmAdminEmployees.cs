/*
 * ---------------------------------------------------------
 * LIBRERIAS UTILIZADAS EN EL FORMULARIO "frmAdminEmployees.cs"
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

#endregion

namespace Viper.DesktopApp
{
    public partial class frmAdminEmployees : Form
    {
        /*
         * ---------------------------------------------------------
         * VARIABLES, OBJETOS, Y COMPONENTES UTILIZADOS EN EL FORMULARIO "frmAdminEmployees.cs"
         * ---------------------------------------------------------
         */

        private FilterInfoCollection DispositivosDeVideo;
        private VideoCaptureDevice FuenteDeVideo = null;
        String rutaLogotipo = String.Empty;
        bool ExistenDispositivos = false;

        /*
         * ---------------------------------------------------------
         * CONSTRUCTORES UTILIZADOS EN EL FORMULARIO "frmAdminEmployees.cs"
         * ---------------------------------------------------------
         */

        public frmAdminEmployees()
        {
            InitializeComponent();

            //Cargar todos los dispositivos de camara
            buscarDispositivos();

            //Cargar todos los combo box con la informacion correspondiente
            fillDropDownList();
        }

        /*
         * ---------------------------------------------------------
         * EVENTOS UTILIZADOS EN EL FORMULARIO "frmAdminEmployees.cs"
         * ---------------------------------------------------------
         */

        private void btnCapturar_Click(object sender, EventArgs e)
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

        private void frmRegisterEmployee_Load(object sender, EventArgs e)
        {
            //Set default configuration to UI
            this.AcceptButton = btnAceptar;
            this.AutoSize = true;
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Text = "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions";
            this.KeyPreview = true;
            this.Size = new Size(1366, 768);
            this.WindowState = FormWindowState.Maximized;

            //Establecer el foco en el primer campo
            this.ActiveControl = Nombre;
            this.Nombre.Focus();

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

        private void cboEstado_SelectedIndexChanged(object sender, Telerik.WinControls.UI.Data.PositionChangedEventArgs e)
        {
            Municipio.Items.Clear();

            if (Entidad_Federativa.SelectedIndex > 0)
            {
                Municipio.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetCityDropDownList(Convert.ToInt32(Entidad_Federativa.SelectedValue));
                Municipio.DisplayMember = "Description";
                Municipio.ValueMember = "Id";
                Municipio.SelectedIndex = 0;
            }
            else
            {
                Municipio.Items.Add("--SELECCIONE--");
            }
        }

        /*
         * ---------------------------------------------------------
         * METODOS UTILIZADOS EN EL FORMULARIO "frmAdminEmployees.cs"
         * ---------------------------------------------------------
         */

        private void uploadFotografia()
        {
            OpenFileDialog BuscarImagen = new OpenFileDialog();
            BuscarImagen.Filter = ".bmp;*.gif;*.jpg;*.png|*.bmp;*.gif;*.jpg;*.png|Imagen Jpg(*.jpg)|*.jpg|Imagen PNG(*.png)|*.png|Imagen Gif(*.gif*)|*.gif";
            BuscarImagen.FileName = "";
            BuscarImagen.Title = "Examinar Imagen";
            if (BuscarImagen.ShowDialog() == DialogResult.OK)
            {
                rutaLogotipo = BuscarImagen.FileName;
                String Direccion = BuscarImagen.FileName;
                picEmpleado.ImageLocation = Direccion;
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
                MessageBox.Show(new Form { TopMost = true }, "El logotipo no se ha podido almacenar correctamente", "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Error);
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

            this.Turno.DataSource = BusinessLogicLayer.DropDownListHelperBLL.GetShiftDropDownList();
            this.Turno.DisplayMember = "Name";
            this.Turno.ValueMember = "Id";
            this.Turno.SelectedIndex = 0;
        }
    }
}
