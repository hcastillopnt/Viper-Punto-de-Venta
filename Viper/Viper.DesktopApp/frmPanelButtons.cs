using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Viper.BusinessEntities;

namespace Viper.DesktopApp
{
    public partial class frmPanelButtons : Form
    {
        string menuSeleccionado = String.Empty;

        public frmPanelButtons(string menu, string rol)
        {
            //Initialize UI
            InitializeComponent();

            //Value of menu parameter
            this.menuSeleccionado = menu;

            //Upload submenu items
            uploadSubmenuItemsToPanel();
        }

        private void uploadSubmenuItemsToPanel()
        {
            List<Module> modules = new List<Module>();
            DataTable dtModules = new DataTable();
            Module module = null;

            dtModules = BusinessLogicLayer.MenuBLL.CargarSubmenuPorRol("ADMINISTRADOR", menuSeleccionado);

            if (dtModules.Rows.Count > 0)
            {
                foreach (DataRow row in dtModules.Rows)
                {
                    module = new Module();

                    module.Name = row["Name"].ToString();
                    module.SubMenu = row["SubMenu"].ToString();
                    module.ControlName = row["ControlName"].ToString();
                    module.ControlImage = row["ControlImage"].ToString();

                    modules.Add(module);
                }

                int rows = dtModules.Rows.Count;
                int i = 1;

                foreach (var item in modules)
                {
                    Button btnOption = new Button();

                    string folder = @"\images\icon\";
                    string appPath = Path.GetDirectoryName(Application.StartupPath);
                    string folderPath = appPath.Substring(0, appPath.Length - 4) + folder;

                    // 
                    // btnOption
                    // 
                    btnOption.Dock = DockStyle.Fill;
                    btnOption.Image = Image.FromFile(folderPath + item.ControlImage);
                    //btnOption.ImageAlign = ContentAlignment.TopCenter;
                    btnOption.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F);
                    btnOption.Name = item.ControlName;
                    btnOption.TabIndex = i;
                    btnOption.Text = item.SubMenu;
                    btnOption.TextAlign = ContentAlignment.BottomCenter;
                    btnOption.TextImageRelation = TextImageRelation.ImageAboveText;

                    //Añadir los controles a los contenedores correspondientes
                    tlpCentro.Controls.Add(btnOption);

                    //TabIndex
                    i++;
                }
            }
        }
    }
}
