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
            ((System.ComponentModel.ISupportInitialize)(this.picLogotipoApp)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.picLogotipoCompany)).BeginInit();
            this.SuspendLayout();
            // 
            // picLogotipoApp
            // 
            this.picLogotipoApp.Image = ((System.Drawing.Image)(resources.GetObject("picLogotipoApp.Image")));
            this.picLogotipoApp.Location = new System.Drawing.Point(2, 142);
            this.picLogotipoApp.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.picLogotipoApp.Name = "picLogotipoApp";
            this.picLogotipoApp.Size = new System.Drawing.Size(796, 186);
            this.picLogotipoApp.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picLogotipoApp.TabIndex = 0;
            this.picLogotipoApp.TabStop = false;
            // 
            // picLogotipoCompany
            // 
            this.picLogotipoCompany.Image = ((System.Drawing.Image)(resources.GetObject("picLogotipoCompany.Image")));
            this.picLogotipoCompany.Location = new System.Drawing.Point(576, 2);
            this.picLogotipoCompany.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.picLogotipoCompany.Name = "picLogotipoCompany";
            this.picLogotipoCompany.Size = new System.Drawing.Size(222, 136);
            this.picLogotipoCompany.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picLogotipoCompany.TabIndex = 1;
            this.picLogotipoCompany.TabStop = false;
            // 
            // lblMensaje
            // 
            this.lblMensaje.AutoSize = true;
            this.lblMensaje.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMensaje.Location = new System.Drawing.Point(40, 345);
            this.lblMensaje.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.lblMensaje.Name = "lblMensaje";
            this.lblMensaje.Size = new System.Drawing.Size(715, 24);
            this.lblMensaje.TabIndex = 3;
            this.lblMensaje.Text = "Cargando la informacion de la base de datos, por favor espere un momento";
            // 
            // progressBar1
            // 
            this.progressBar1.Location = new System.Drawing.Point(2, 371);
            this.progressBar1.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.progressBar1.MarqueeAnimationSpeed = 50;
            this.progressBar1.Name = "progressBar1";
            this.progressBar1.Size = new System.Drawing.Size(796, 28);
            this.progressBar1.Style = System.Windows.Forms.ProgressBarStyle.Marquee;
            this.progressBar1.TabIndex = 4;
            // 
            // frmUploadDataToDataBase
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Window;
            this.ClientSize = new System.Drawing.Size(800, 400);
            this.Controls.Add(this.progressBar1);
            this.Controls.Add(this.lblMensaje);
            this.Controls.Add(this.picLogotipoCompany);
            this.Controls.Add(this.picLogotipoApp);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmUploadDataToDataBase";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "frmUploadDataToDataBase";
            ((System.ComponentModel.ISupportInitialize)(this.picLogotipoApp)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.picLogotipoCompany)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox picLogotipoApp;
        private System.Windows.Forms.PictureBox picLogotipoCompany;
        private System.Windows.Forms.Label lblMensaje;
        private System.Windows.Forms.ProgressBar progressBar1;
    }
}