/*
 * ---------------------------------------------------------
 * LIBRERIAS UTILIZADAS EN EL FORMULARIO "frmUploadDataToDataBase.cs"
 * ---------------------------------------------------------
 */

#region using directives

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

#endregion

namespace Viper.DesktopApp
{
    /// <summary>
    /// CLASE QUE PERMITE CARGAR LA INFORMACION DEFAULT DENTRO DEL 
    /// SISTEMA DE PUNTO DE VENTA PARA FARMACIAS CON VENTA DE GENERICOS
    /// </summary>
    public partial class frmUploadDataToDataBase : Form
    {
        /*
         * ---------------------------------------------------------
         * VARIABLES, OBJETOS, Y COMPONENTES UTILIZADAS EN EL FORMULARIO "frmUploadDataToDataBase.cs"
         * ---------------------------------------------------------
         */
        #region Variables, Objetos y Componentes

        Thread t = null;

        #endregion

        /*
         * ---------------------------------------------------------
         * CONSTRUCTORES UTILIZADOS EN EL FORMULARIO "frmUploadDataToDataBase.cs"
         * ---------------------------------------------------------
         */

        #region Constructor

        public frmUploadDataToDataBase()
        {
            InitializeComponent();

            //t = new Thread(new ThreadStart(initializeDatabase));
            //t.Start();
        }

        #endregion

        /*
         * ---------------------------------------------------------
         * METODOS UTILIZADOS EN EL FORMULARIO "frmUploadDataToDataBase.cs"
         * ---------------------------------------------------------
         */

        #region Metodos

        private void initializeDatabase()
        {
            using (var ctx = new Viper.BusinessEntities.ViperDbContext())
            {
                // Inicializar la Base de Datos
                //new Viper.BusinessEntities.ViperDbInitializer().InitializeDatabase(ctx);
                //Application.Run(new frmRegisterCompany(true));
                //this.Hide();
                //t.Abort();
            }
        }

        #endregion
    }
}
