﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Viper.DesktopApp
{
    public partial class frmLogin : Form
    {
        #region Variables and Objects of Class

        public static DataTable dt = new DataTable();
        frmMain frm = null;
        string msgError = String.Empty;

        #endregion

        #region Constructor
        public frmLogin()
        {
            InitializeComponent();
        }
        #endregion

        #region Events of the controls

        public void frmLogin_FormClosing(object sender, FormClosingEventArgs args)
        {
            args.Cancel = args.CloseReason == CloseReason.UserClosing;
        }

        private void btnIngresar_Click(object sender, EventArgs e)
        {
            string username = Nombre_de_Usuario.Text.Trim().ToString();
            string password = Contraseña.Text.Trim().ToString();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                MessageBox.Show(new Form { TopMost = true }, "Existen campos vacios, favor de intentarlo nuevamente", "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
            else
            {
                dt = BusinessLogicLayer.LoginBLL.authorize_by_credentials(username, password);

                if (dt != null)
                {
                    int EntityId = dt.Rows[0].Field<int>("EntityID");
                    string fullname = dt.Rows[0].Field<String>("FullName");
                    string company = dt.Rows[0].Field<String>("CompanyName");
                    string role = dt.Rows[0].Field<String>("Role");
                    string jobTitle = dt.Rows[0].Field<String>("JobTitle");
                    DateTime startTime = dt.Rows[0].Field<DateTime>("StartTime");
                    DateTime endTime = dt.Rows[0].Field<DateTime>("EndTime");
                    int acccessFailed = dt.Rows[0].Field<int>("AccessFailed");
                    bool isWelcome = dt.Rows[0].Field<bool>("IsWelcome");

                    if (acccessFailed < 3 || role == "ADMINISTRADOR")
                    {
                        string passSaved = BusinessLogicLayer.CompanyBLL.getPasswordSaved(EntityId);

                        if (isWelcome == false  || passSaved == "admin")
                        {
                            bool bandera = false;

                            do
                            {
                                //Set buttons language Czech/English/German/Slovakian/Spanish (default English)
                                InputBox.SetLanguage(InputBox.Language.Spanish);

                                //Save the DialogResult as res
                                DialogResult res = InputBox.ShowDialog("Favor de actualizar la contraseña para mayor seguridad, introduzca la nueva contraseña:",
                                "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions",   //Text message (mandatory), Title (optional)
                                    InputBox.Icon.Information, //Set icon type (default info)
                                    InputBox.Buttons.OkCancel, //Set buttons (default ok)
                                    InputBox.Type.TextBox //Set type (default nothing)
                                    );

                                if (res == System.Windows.Forms.DialogResult.OK || res == System.Windows.Forms.DialogResult.Yes)
                                {
                                    string newPassword = InputBox.ResultValue;

                                    switch (role)
                                    {
                                        case "ADMINISTRADOR":
                                            msgError = BusinessLogicLayer.CompanyBLL.updatePassword(newPassword, EntityId);
                                            break;

                                        case "BASICO":
                                            msgError = BusinessLogicLayer.EmployeeBLL.updatePassword(newPassword, EntityId);
                                            break;

                                        case "DOCTOR":
                                            break;
                                    }

                                    if (string.IsNullOrEmpty(msgError))
                                    {
                                        MessageBox.Show(new Form { TopMost = true }, "Contraseña actualizada correctamente", "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                        bandera = true;
                                    }
                                    else
                                    {
                                        MessageBox.Show(new Form { TopMost = true }, msgError, "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                                    }
                                }
                            } while (!bandera);
                        }

                        switch (role)
                        {
                            case "ADMINISTRADOR":
                                frm = new frmMain(role, company, jobTitle);
                                frm.Show();
                                this.Hide();
                                break;

                            case "BASICO":
                                frm = new frmMain(role, fullname, jobTitle);
                                frm.Show();
                                this.Hide();
                                break;

                            case "DOCTOR":
                                break;
                        }
                    }
                    else
                    {
                        MessageBox.Show(new Form { TopMost = true }, "Usuario bloqueado, favor de reportarse con el administrador", "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                else
                {
                    MessageBox.Show(new Form { TopMost = true }, "Usuario y/o contraseña no validos, favor de intentarlo nuevamente", "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
            }
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void frmLogin_Load(object sender, EventArgs e)
        {
            //Set default configuration to UI
            this.AcceptButton = btnIngresar;
            this.CancelButton = btnSalir;
            this.AutoSize = true;
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.StartPosition = FormStartPosition.CenterScreen;
            this.Text = "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions";
            this.TopMost = true;
            this.Size = new Size(1366, 768);
            this.WindowState = FormWindowState.Maximized;
            this.Icon = new Icon("Resources/application_icon.ico");

            //Establecer el foco en el primer campo
            this.ActiveControl = Nombre_de_Usuario;
            this.Nombre_de_Usuario.Focus();

            ToolTip toolTip1 = new ToolTip();

            // Set up the delays for the ToolTip.
            toolTip1.AutoPopDelay = 5000;
            toolTip1.InitialDelay = 1000;
            toolTip1.ReshowDelay = 500;
            // Force the ToolTip text to be displayed whether or not the form is active.
            toolTip1.ShowAlways = true;

            // Set up the ToolTip text for the Button and Checkbox.
            toolTip1.SetToolTip(this.btnIngresar, "Para ingresar , favor de dar clic en este boton");
            toolTip1.SetToolTip(this.btnSalir, "Para salir, favor de dar clic a este boton");

            //Set Event to form
            this.FormClosing += new FormClosingEventHandler(frmLogin_FormClosing);
        }
        #endregion
    }
}
