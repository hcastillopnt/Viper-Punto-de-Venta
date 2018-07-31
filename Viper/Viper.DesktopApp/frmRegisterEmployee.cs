using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Viper.DesktopApp
{
    public partial class frmRegisterEmployee : Form
    {
        public frmRegisterEmployee()
        {
            InitializeComponent();
        }
        

       

        #region EVENTO LEAVE PARA CONTROLAR EL TAB ORDER
        // TAB DE CODIGO POSTAL FISCAL A NUMERO EXTERIOR
        private void Codigo_Postal_Leave(object sender, EventArgs e)
        {
            Numero_Exterior.Focus();
        }

        // TAB DE NUMERO EXTERIOR A NUMERO INTERIOR
        private void No_Ext_Leave(object sender, EventArgs e)
        {
            Numero_Interior.Focus();
        }

        // TAB DE NUMERO INTERIOR A COLONIA
        private void No_Int_Leave(object sender, EventArgs e)
        {
            Colonia.Focus();
        }
      

        // TAB DE VIALIDAD A CODIGO POSTAL
        private void Vialidad_Leave(object sender, EventArgs e)
        {
            Codigo_Postal.Focus();
        }

        // TAB DE ESTADO A LOCALIDAD
        private void cboEstado_Leave(object sender, EventArgs e)
        {
            cboLocalidad.Focus();
        }

        // TAB DE LOCALIDAD A TELEFONO
        private void cboLocalidad_Leave(object sender, EventArgs e)
        {
            Tipo_de_Telefono.Focus();
        }


        #endregion

        private void frmRegisterEmployee_Load(object sender, EventArgs e)
        {
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



            // Set up the ToolTip text for the TextBox and ComboBox Control.
            //Datos generales
            toolTip1.SetToolTip(this.NSS, UtilMessages.NSS_EMPLEADO);
            toolTip1.SetToolTip(this.Correo_Electronico, UtilMessages.EMAIL_EMPLEADO);
            toolTip1.SetToolTip(this.Clave_Lada, UtilMessages.LADA_EMPLEADO);
            toolTip1.SetToolTip(this.cboTipoInmueble, UtilMessages.TIPO_INMUEBLE_EMPLEADO);
            toolTip1.SetToolTip(this.cboTipoVialidad, UtilMessages.TIPO_VIALIDAD_EMPLEADO);
            toolTip1.SetToolTip(this.Vialidad, UtilMessages.NOMBRE_VIALIDAD_EMPLEADO);
            toolTip1.SetToolTip(this.cboLocalidad, UtilMessages.LOCALIDAD_EMPLEADO);
            //Acceso al sistema
            toolTip1.SetToolTip(this.Usuario, UtilMessages.USUARIO);
            toolTip1.SetToolTip(this.Password, UtilMessages.CONTRASEÑA);
            toolTip1.SetToolTip(this.ConfirmarPassword, UtilMessages.CONFIRMAR_CONTRASEÑA);
            toolTip1.SetToolTip(this.cboRol, UtilMessages.ROL_EMPLEADO);
            //Información del empleado
            toolTip1.SetToolTip(this.ID_Checador, UtilMessages.ID_CHECADOR);
            toolTip1.SetToolTip(this.cboTurno, UtilMessages.TURNO);
            toolTip1.SetToolTip(this.dtpFechaInicioLabores, UtilMessages.INICIO_DE_LABORES);
            toolTip1.SetToolTip(this.cboVacaciones, UtilMessages.VACACIONES);

        }
    }
}
