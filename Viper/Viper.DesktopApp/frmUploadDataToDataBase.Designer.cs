namespace Viper.DesktopApp
{
    partial class frmUploadDataToDataBase
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmUploadDataToDataBase));
            this.picLogotipoApp = new System.Windows.Forms.PictureBox();
            this.picLogotipoCompany = new System.Windows.Forms.PictureBox();
            this.lblMensaje = new System.Windows.Forms.Label();
            this.progressBar1 = new System.Windows.Forms.ProgressBar();
            this.tlpPrincipal = new System.Windows.Forms.TableLayoutPanel();
            this.tlpCargaDatos = new System.Windows.Forms.TableLayoutPanel();
            this.tlpLogotipo = new System.Windows.Forms.TableLayoutPanel();
            ((System.ComponentModel.ISupportInitialize)(this.picLogotipoApp)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.picLogotipoCompany)).BeginInit();
            this.tlpPrincipal.SuspendLayout();
            this.tlpCargaDatos.SuspendLayout();
            this.tlpLogotipo.SuspendLayout();
            this.SuspendLayout();
            // 
            // picLogotipoApp
            // 
            this.picLogotipoApp.Dock = System.Windows.Forms.DockStyle.Fill;
            this.picLogotipoApp.Image = ((System.Drawing.Image)(resources.GetObject("picLogotipoApp.Image")));
            this.picLogotipoApp.Location = new System.Drawing.Point(3, 272);
            this.picLogotipoApp.Name = "picLogotipoApp";
            this.picLogotipoApp.Size = new System.Drawing.Size(1360, 365);
            this.picLogotipoApp.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picLogotipoApp.TabIndex = 0;
            this.picLogotipoApp.TabStop = false;
            // 
            // picLogotipoCompany
            // 
            this.picLogotipoCompany.Dock = System.Windows.Forms.DockStyle.Fill;
            this.picLogotipoCompany.Image = ((System.Drawing.Image)(resources.GetObject("picLogotipoCompany.Image")));
            this.picLogotipoCompany.Location = new System.Drawing.Point(909, 3);
            this.picLogotipoCompany.Name = "picLogotipoCompany";
            this.picLogotipoCompany.Size = new System.Drawing.Size(448, 257);
            this.picLogotipoCompany.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picLogotipoCompany.TabIndex = 1;
            this.picLogotipoCompany.TabStop = false;
            // 
            // lblMensaje
            // 
            this.lblMensaje.AutoSize = true;
            this.lblMensaje.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblMensaje.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMensaje.Location = new System.Drawing.Point(3, 0);
            this.lblMensaje.Name = "lblMensaje";
            this.lblMensaje.Size = new System.Drawing.Size(1354, 61);
            this.lblMensaje.TabIndex = 3;
            this.lblMensaje.Text = "Cargando la informacion de la base de datos, por favor espere un momento";
            this.lblMensaje.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // progressBar1
            // 
            this.progressBar1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.progressBar1.Location = new System.Drawing.Point(3, 64);
            this.progressBar1.MarqueeAnimationSpeed = 50;
            this.progressBar1.Name = "progressBar1";
            this.progressBar1.Size = new System.Drawing.Size(1354, 55);
            this.progressBar1.Style = System.Windows.Forms.ProgressBarStyle.Marquee;
            this.progressBar1.TabIndex = 4;
            // 
            // tlpPrincipal
            // 
            this.tlpPrincipal.ColumnCount = 1;
            this.tlpPrincipal.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpPrincipal.Controls.Add(this.picLogotipoApp, 0, 1);
            this.tlpPrincipal.Controls.Add(this.tlpCargaDatos, 0, 2);
            this.tlpPrincipal.Controls.Add(this.tlpLogotipo, 0, 0);
            this.tlpPrincipal.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpPrincipal.Location = new System.Drawing.Point(0, 0);
            this.tlpPrincipal.Name = "tlpPrincipal";
            this.tlpPrincipal.RowCount = 3;
            this.tlpPrincipal.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 35.02604F));
            this.tlpPrincipal.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 48.30729F));
            this.tlpPrincipal.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16.53646F));
            this.tlpPrincipal.Size = new System.Drawing.Size(1366, 768);
            this.tlpPrincipal.TabIndex = 5;
            // 
            // tlpCargaDatos
            // 
            this.tlpCargaDatos.ColumnCount = 1;
            this.tlpCargaDatos.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpCargaDatos.Controls.Add(this.lblMensaje, 0, 0);
            this.tlpCargaDatos.Controls.Add(this.progressBar1, 0, 1);
            this.tlpCargaDatos.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpCargaDatos.Location = new System.Drawing.Point(3, 643);
            this.tlpCargaDatos.Name = "tlpCargaDatos";
            this.tlpCargaDatos.RowCount = 2;
            this.tlpCargaDatos.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpCargaDatos.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpCargaDatos.Size = new System.Drawing.Size(1360, 122);
            this.tlpCargaDatos.TabIndex = 1;
            // 
            // tlpLogotipo
            // 
            this.tlpLogotipo.ColumnCount = 3;
            this.tlpLogotipo.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tlpLogotipo.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tlpLogotipo.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tlpLogotipo.Controls.Add(this.picLogotipoCompany, 2, 0);
            this.tlpLogotipo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpLogotipo.Location = new System.Drawing.Point(3, 3);
            this.tlpLogotipo.Name = "tlpLogotipo";
            this.tlpLogotipo.RowCount = 1;
            this.tlpLogotipo.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpLogotipo.Size = new System.Drawing.Size(1360, 263);
            this.tlpLogotipo.TabIndex = 2;
            // 
            // frmUploadDataToDataBase
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Window;
            this.ClientSize = new System.Drawing.Size(1366, 768);
            this.Controls.Add(this.tlpPrincipal);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmUploadDataToDataBase";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "frmUploadDataToDataBase";
            ((System.ComponentModel.ISupportInitialize)(this.picLogotipoApp)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.picLogotipoCompany)).EndInit();
            this.tlpPrincipal.ResumeLayout(false);
            this.tlpCargaDatos.ResumeLayout(false);
            this.tlpCargaDatos.PerformLayout();
            this.tlpLogotipo.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.PictureBox picLogotipoApp;
        private System.Windows.Forms.PictureBox picLogotipoCompany;
        private System.Windows.Forms.Label lblMensaje;
        private System.Windows.Forms.ProgressBar progressBar1;
        private System.Windows.Forms.TableLayoutPanel tlpPrincipal;
        private System.Windows.Forms.TableLayoutPanel tlpCargaDatos;
        private System.Windows.Forms.TableLayoutPanel tlpLogotipo;
    }
}