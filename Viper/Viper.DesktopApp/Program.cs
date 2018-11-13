using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Viper.DesktopApp
{
    static class Program
    {
        /// <summary>
        /// Punto de entrada principal para la aplicación.
        /// </summary>
        [STAThread]
        static void Main()
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

                    Application.EnableVisualStyles();
                    Application.SetCompatibleTextRenderingDefault(false);

                    if (isExistsCompany)
                        Application.Run(new frmLogin());
                    else
                        Application.Run(new frmRegisterCompany(true));
                }
                catch (Exception ex)
                {
                    MessageBox.Show(new Form { TopMost = true }, ex.Message, "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
    }
}
