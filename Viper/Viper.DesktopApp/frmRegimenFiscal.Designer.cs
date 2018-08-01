namespace Viper.DesktopApp
{
    partial class frmRegimenFiscal
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmRegimenFiscal));
            Telerik.WinControls.UI.TableViewDefinition tableViewDefinition1 = new Telerik.WinControls.UI.TableViewDefinition();
            this.btnAceptar = new Telerik.WinControls.UI.RadButton();
            this.lblRegimenFiscal = new Telerik.WinControls.UI.RadLabel();
            this.dgvRegimenFiscal = new Telerik.WinControls.UI.RadGridView();
            this.visualStudio2012LightTheme1 = new Telerik.WinControls.Themes.VisualStudio2012LightTheme();
            this.picEmpresa = new System.Windows.Forms.PictureBox();
            this.lblRegimen = new System.Windows.Forms.Label();
            this.txtRegimen = new Telerik.WinControls.UI.RadTextBox();
            ((System.ComponentModel.ISupportInitialize)(this.btnAceptar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.lblRegimenFiscal)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvRegimenFiscal)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvRegimenFiscal.MasterTemplate)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.picEmpresa)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtRegimen)).BeginInit();
            this.SuspendLayout();
            // 
            // btnAceptar
            // 
            this.btnAceptar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAceptar.Image = ((System.Drawing.Image)(resources.GetObject("btnAceptar.Image")));
            this.btnAceptar.Location = new System.Drawing.Point(286, 402);
            this.btnAceptar.Name = "btnAceptar";
            this.btnAceptar.Size = new System.Drawing.Size(230, 48);
            this.btnAceptar.TabIndex = 6;
            this.btnAceptar.Text = "Aceptar";
            this.btnAceptar.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnAceptar.ThemeName = "VisualStudio2012Light";
            // 
            // lblRegimenFiscal
            // 
            this.lblRegimenFiscal.BackColor = System.Drawing.SystemColors.Control;
            this.lblRegimenFiscal.Font = new System.Drawing.Font("Microsoft Sans Serif", 25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblRegimenFiscal.Location = new System.Drawing.Point(286, 53);
            this.lblRegimenFiscal.Name = "lblRegimenFiscal";
            this.lblRegimenFiscal.Size = new System.Drawing.Size(260, 44);
            this.lblRegimenFiscal.TabIndex = 0;
            this.lblRegimenFiscal.Text = "Régimen Fiscal";
            // 
            // dgvRegimenFiscal
            // 
            this.dgvRegimenFiscal.AutoScroll = true;
            this.dgvRegimenFiscal.AutoSizeRows = true;
            this.dgvRegimenFiscal.EnableCustomFiltering = true;
            this.dgvRegimenFiscal.EnableHotTracking = false;
            this.dgvRegimenFiscal.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.dgvRegimenFiscal.Location = new System.Drawing.Point(12, 174);
            // 
            // 
            // 
            this.dgvRegimenFiscal.MasterTemplate.AllowAddNewRow = false;
            this.dgvRegimenFiscal.MasterTemplate.AllowCellContextMenu = false;
            this.dgvRegimenFiscal.MasterTemplate.AllowColumnChooser = false;
            this.dgvRegimenFiscal.MasterTemplate.AllowColumnHeaderContextMenu = false;
            this.dgvRegimenFiscal.MasterTemplate.AllowColumnReorder = false;
            this.dgvRegimenFiscal.MasterTemplate.AllowColumnResize = false;
            this.dgvRegimenFiscal.MasterTemplate.AllowDeleteRow = false;
            this.dgvRegimenFiscal.MasterTemplate.AllowDragToGroup = false;
            this.dgvRegimenFiscal.MasterTemplate.AllowEditRow = false;
            this.dgvRegimenFiscal.MasterTemplate.AllowRowHeaderContextMenu = false;
            this.dgvRegimenFiscal.MasterTemplate.AllowRowResize = false;
            this.dgvRegimenFiscal.MasterTemplate.AutoSizeColumnsMode = Telerik.WinControls.UI.GridViewAutoSizeColumnsMode.Fill;
            this.dgvRegimenFiscal.MasterTemplate.EnableCustomFiltering = true;
            this.dgvRegimenFiscal.MasterTemplate.EnableFiltering = true;
            this.dgvRegimenFiscal.MasterTemplate.EnableGrouping = false;
            this.dgvRegimenFiscal.MasterTemplate.EnableSorting = false;
            this.dgvRegimenFiscal.MasterTemplate.ShowFilteringRow = false;
            this.dgvRegimenFiscal.MasterTemplate.ViewDefinition = tableViewDefinition1;
            this.dgvRegimenFiscal.Name = "dgvRegimenFiscal";
            this.dgvRegimenFiscal.ShowGroupPanel = false;
            this.dgvRegimenFiscal.ShowGroupPanelScrollbars = false;
            this.dgvRegimenFiscal.Size = new System.Drawing.Size(760, 216);
            this.dgvRegimenFiscal.TabIndex = 0;
            this.dgvRegimenFiscal.ThemeName = "VisualStudio2012Light";
            // 
            // picEmpresa
            // 
            this.picEmpresa.Image = ((System.Drawing.Image)(resources.GetObject("picEmpresa.Image")));
            this.picEmpresa.Location = new System.Drawing.Point(161, 22);
            this.picEmpresa.Name = "picEmpresa";
            this.picEmpresa.Size = new System.Drawing.Size(98, 75);
            this.picEmpresa.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            this.picEmpresa.TabIndex = 7;
            this.picEmpresa.TabStop = false;
            // 
            // lblRegimen
            // 
            this.lblRegimen.AutoSize = true;
            this.lblRegimen.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblRegimen.Location = new System.Drawing.Point(12, 136);
            this.lblRegimen.Name = "lblRegimen";
            this.lblRegimen.Size = new System.Drawing.Size(146, 24);
            this.lblRegimen.TabIndex = 8;
            this.lblRegimen.Text = "Regimen Fiscal:";
            // 
            // txtRegimen
            // 
            this.txtRegimen.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.txtRegimen.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtRegimen.Location = new System.Drawing.Point(164, 136);
            this.txtRegimen.Name = "txtRegimen";
            this.txtRegimen.NullText = "Escribe la actividad que deseas buscar";
            this.txtRegimen.Size = new System.Drawing.Size(608, 27);
            this.txtRegimen.TabIndex = 9;
            this.txtRegimen.ThemeName = "VisualStudio2012Light";
            // 
            // frmRegimenFiscal
            // 
            this.AcceptButton = this.btnAceptar;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(784, 462);
            this.Controls.Add(this.txtRegimen);
            this.Controls.Add(this.lblRegimen);
            this.Controls.Add(this.picEmpresa);
            this.Controls.Add(this.lblRegimenFiscal);
            this.Controls.Add(this.btnAceptar);
            this.Controls.Add(this.dgvRegimenFiscal);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmRegimenFiscal";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Sistema de Punto de Venta Viper-OwalTek Innovation Solutions";
            //this.TopMost = true;
            this.Load += new System.EventHandler(this.frmRegimenFiscal_Load);
            ((System.ComponentModel.ISupportInitialize)(this.btnAceptar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.lblRegimenFiscal)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvRegimenFiscal.MasterTemplate)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvRegimenFiscal)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.picEmpresa)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtRegimen)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private Telerik.WinControls.UI.RadButton btnAceptar;
        private Telerik.WinControls.UI.RadLabel lblRegimenFiscal;
        private Telerik.WinControls.UI.RadGridView dgvRegimenFiscal;
        private Telerik.WinControls.Themes.VisualStudio2012LightTheme visualStudio2012LightTheme1;
        private System.Windows.Forms.PictureBox picEmpresa;
        private System.Windows.Forms.Label lblRegimen;
        private Telerik.WinControls.UI.RadTextBox txtRegimen;
    }
}