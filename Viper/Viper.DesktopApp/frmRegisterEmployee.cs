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

    }
}
