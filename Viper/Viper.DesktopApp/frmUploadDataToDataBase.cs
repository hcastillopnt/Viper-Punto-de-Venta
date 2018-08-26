using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Viper.DesktopApp
{
    public partial class frmUploadDataToDataBase : Form
    {
        Thread t = null;

        public frmUploadDataToDataBase()
        {
            InitializeComponent();

            t = new Thread(new ThreadStart(initializeDatabase));
            t.Start();
        }

        private void initializeDatabase()
        {
            using (var ctx = new Viper.BusinessEntities.ViperDbContext())
            {
                // Inicializar la Base de Datos
                new Viper.BusinessEntities.ViperDbInitializer().InitializeDatabase(ctx);
                this.Hide();
                Application.Run(new frmRegisterCompany(true));
                t.Abort();
            }
        }
    }
}
