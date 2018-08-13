using System;
using System.Collections.Generic;
using System.Linq;
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
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);


            bool isExistsCompany = false;

            isExistsCompany = BusinessLogicLayer.CompanyBLL.isCompanyRegistered();

            if (isExistsCompany)
            {
                Application.Run(new frmLogin());
            }
            else
            {
                Application.Run(new frmRegisterCompany(true));
            }
        }
    }
}
