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
    public partial class frmAddProvider : Form
    {
        public frmAddProvider()
        {
            InitializeComponent();
        }



        #region CONTROLAR TABORDER

        // TAB DE WEB A TELEFONO
        private void Web_Leave(object sender, EventArgs e)
        {
            Telefono.Focus();
        }


        // TAB DE CELULAR A BTNEXAMINAR
        private void Celular_Leave(object sender, EventArgs e)
        {
            btnExaminar.Focus();
        }


        // TAB DE CODIGO POSTAL A NUMERO EXTERIOR
        private void Código_Postal_Leave(object sender, EventArgs e)
        {
            No_Ext.Focus();
        }

        // TAB DE NUMERO EXTERIOR A NUMERO INTERIOR
        private void No_Ext_Leave(object sender, EventArgs e)
        {
            No_Int.Focus();
        }

        // TAB DE NUMERO INTERIOR A COLONIA
        private void No_Int_Leave(object sender, EventArgs e)
        {
            Colonia.Focus();
        }

        // TAB ORDER DE BOTON EXAMINAR A CBOTIPODEINMUEBLE
        private void btnExaminar_Leave(object sender, EventArgs e)
        {
            cboTipoDeInmueble.Focus();
        }

        // TAB ORDER DE CBOESTADO A CBOLOCALIDAD
        private void cboEstado_Leave(object sender, EventArgs e)
        {
            cboLocalidad.Focus();
        }

        //TAB ORDER DE LOCALIDAD A BTNACEPTAR
        private void cboLocalidad_Leave(object sender, EventArgs e)
        {
            btnAceptar.Focus();
        }

        //TAB ORDER DE VIALIDAD A CODIGO POSTAL
        private void Vialidad_Leave(object sender, EventArgs e)
        {
            Código_Postal.Focus();
        }


        #endregion

    }
}
