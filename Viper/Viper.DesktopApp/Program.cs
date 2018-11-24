using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.Data.SqlClient;
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
            Console.WriteLine("ConnectionString: " + connectionString);

            if (string.IsNullOrEmpty(connectionString))
            {
                MessageBox.Show(new Form { TopMost = true }, "La cadena de conexion no ha sido configurada", "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                try
                {
                    if(connectionString.Contains("Data Source"))
                    {
                        //MSSQLSERVER
                        SqlConnection sqlConn = new SqlConnection(connectionString);
                        sqlConn.Open();
                        Console.WriteLine("MSSQLSERVER version: " + sqlConn.ServerVersion);
                        sqlConn.Close();
                    }
                    else if(connectionString.Contains("Server"))
                    {
                        //MYSQLSERVER
                        MySqlConnection mysqlConn = new MySqlConnection(connectionString);
                        mysqlConn.Open();
                        Console.WriteLine("MySQL version: " + mysqlConn.ServerVersion);
                        mysqlConn.Close();
                    }

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
