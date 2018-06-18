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
    public partial class frmRegisterSite : Form
    {
        public frmRegisterSite()
        {
            InitializeComponent();
        }



        #region CONTROLAR TAB ORDER
        // TAB DE CODIGO POSTAL A NUMERO EXTERIOR 
        private void Codigo_Postal_Leave(object sender, EventArgs e)
        {
            No_Ext_Fiscal.Focus();
        }


        // TAB DE NUMERO EXTERIOR A NUMERO INTERIOR
        private void No_Ext_Fiscal_Leave(object sender, EventArgs e)
        {
            No_Int_Fiscal.Focus();
        }

        // TAB DE NO INTERIOR A COLONIA FISCAL
        private void No_Int_Fiscal_Leave(object sender, EventArgs e)
        {
            Colonia_Fiscal.Focus();
        }

        // TAB DE TIPO DE VIALIDAD A VIALIDAD FISCAL
        private void cboTipoVialidadFiscal_Leave(object sender, EventArgs e)
        {
            Vialidad_Fiscal.Focus();
        }

        // TAB DE VIALIDAD A CODIGO POSTAL
        private void Vialidad_Fiscal_Leave(object sender, EventArgs e)
        {
            Codigo_Postal.Focus();
        }

        // TAB DE ESTADO FISCAL A LOCALIDAD FISCAL
        private void cboEstadoFiscal_Leave(object sender, EventArgs e)
        {
            cboLocalidadFiscal.Focus();
        }

        #endregion

      
    }
}
