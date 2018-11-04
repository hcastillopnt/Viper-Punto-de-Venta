/*
 * ---------------------------------------------------------
 * LIBRERIAS UTILIZADAS EN EL FORMULARIO "frmLoadingStart.cs"
 * ---------------------------------------------------------
 */

#region using directives

using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
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
    public partial class frmLoadingStart : Form
    {
        /*
         * ---------------------------------------------------------
         * VARIABLES, OBJETOS, Y COMPONENTES UTILIZADAS EN EL FORMULARIO "frmLoadingStart.cs"
         * ---------------------------------------------------------
         */
        #region Variables, Objetos y Componentes

        Thread t = null;

        #endregion

        /*
         * ---------------------------------------------------------
         * CONSTRUCTORES UTILIZADOS EN EL FORMULARIO "frmLoadingStart.cs"
         * ---------------------------------------------------------
         */

        #region Constructor

        public frmLoadingStart()
        {
            InitializeComponent();

            //t = new Thread(new ThreadStart(initializeDatabase));
            //t.Start();
        }

        #endregion

        /*
         * ---------------------------------------------------------
         * EVENTOS UTILIZADOS EN EL FORMULARIO "frmRegisterCompany.cs"
         * ---------------------------------------------------------
         */

        #region Eventos 

        private void timer1_Tick(object sender, EventArgs e)
        {
            int i = 0;

            for (i = 0; i < progressBar1.Maximum; i++)
            {
                progressBar1.Value = i;
                Thread.Sleep(100);
            }

            if (i == progressBar1.Maximum)
            {
                ConnectionStringSettingsCollection connections = ConfigurationManager.ConnectionStrings;
                String connectionName = String.Empty;

                if (connections.Count != 0)
                {
                    foreach (ConnectionStringSettings connection in connections)
                    {
                        connectionName = connection.Name;
                    }
                }

                string connectionString = ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;

                if (string.IsNullOrEmpty(connectionString))
                {
                    MessageBox.Show(new Form { TopMost = true }, "La cadena de conexion no ha sido configurada", "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    try
                    {
                        MySqlConnection connection = new MySqlConnection(connectionString);
                        connection.Open();
                        Console.WriteLine("MySQL version: " + connection.ServerVersion);
                        connection.Close();

                        BusinessLogicLayer.MenuBLL.procUploadPermissionsToMenuByAdministrator();
                        BusinessLogicLayer.MenuBLL.procUploadPermissionsToMenuByBasic();

                        bool isExistsCompany = false;

                        isExistsCompany = BusinessLogicLayer.CompanyBLL.procIsCompanyRegistered();

                        this.Hide();

                        if (isExistsCompany)
                        {
                            timer1.Enabled = false;
                            //Application.Run(new frmLogin());
                            frmLogin form = new frmLogin();
                            form.Show();
                        }
                        else
                        {
                            timer1.Enabled = false;
                            //Application.Run(new frmRegisterCompany(true));
                            frmRegisterCompany form = new frmRegisterCompany(true);
                            form.Show();
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(new Form { TopMost = true }, ex.Message, "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
            }
        }

        #endregion

        /*
         * ---------------------------------------------------------
         * METODOS UTILIZADOS EN EL FORMULARIO "frmLoadingStart.cs"
         * ---------------------------------------------------------
         */

        #region Metodos

        private void initializeDatabase()
        {
            //using (var ctx = new Viper.BusinessEntities.ViperDbContext())
            //{
            //    // Inicializar la Base de Datos
            //    new Viper.BusinessEntities.ViperDbInitializer().InitializeDatabase(ctx);
            //    Application.Run(new frmRegisterCompany(true));
            //    this.Hide();
            //    t.Abort();
            //}
        }

        #endregion
    }
}
