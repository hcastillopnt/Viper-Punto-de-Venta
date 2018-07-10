﻿using System;
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
    public partial class frmCrudClient : Form
    {
        public frmCrudClient()
        {
            InitializeComponent();
        }

        private void frmCrudClient_Load(object sender, EventArgs e)
        {
            dgvCrudClient.DataSource = null;
            dgvCrudClient.DataSource = BusinessLogicLayer.CRUDCompanyBLL.getCustomers();
        }

        private void btnRecargar_Click(object sender, EventArgs e)
        {
            dgvCrudClient.DataSource = null;
            dgvCrudClient.DataSource = BusinessLogicLayer.CRUDCompanyBLL.getCustomers();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            dgvCrudClient.DataSource = null;
            dgvCrudClient.DataSource = BusinessLogicLayer.CRUDCompanyBLL.getCustomer(Clave_cliente.Text);
        }
    }
}
