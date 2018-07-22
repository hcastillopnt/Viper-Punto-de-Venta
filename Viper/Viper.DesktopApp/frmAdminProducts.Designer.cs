namespace Viper.DesktopApp
{
    partial class frmAdminProducts
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
            Telerik.WinControls.UI.TableViewDefinition tableViewDefinition2 = new Telerik.WinControls.UI.TableViewDefinition();
            this.tlpPrincipal = new System.Windows.Forms.TableLayoutPanel();
            this.panelIzq = new Telerik.WinControls.UI.RadPanel();
            this.panelDer = new Telerik.WinControls.UI.RadPanel();
            this.tlpCentro = new System.Windows.Forms.TableLayoutPanel();
            this.gvProducts = new Telerik.WinControls.UI.RadGridView();
            this.tlp02 = new System.Windows.Forms.TableLayoutPanel();
            this.Código_de_barras = new Telerik.WinControls.UI.RadTextBox();
            this.btnBuscar = new Telerik.WinControls.UI.RadButton();
            this.picArticulo = new System.Windows.Forms.PictureBox();
            this.tlp01 = new System.Windows.Forms.TableLayoutPanel();
            this.btnEliminar = new Telerik.WinControls.UI.RadButton();
            this.btnAgregar = new Telerik.WinControls.UI.RadButton();
            this.btnRecargar = new Telerik.WinControls.UI.RadButton();
            this.btnEditar = new Telerik.WinControls.UI.RadButton();
            this.visualStudio2012LightTheme1 = new Telerik.WinControls.Themes.VisualStudio2012LightTheme();
            this.tlpPrincipal.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.panelIzq)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.panelDer)).BeginInit();
            this.tlpCentro.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gvProducts)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gvProducts.MasterTemplate)).BeginInit();
            this.tlp02.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Código_de_barras)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnBuscar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.picArticulo)).BeginInit();
            this.tlp01.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.btnEliminar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnAgregar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnRecargar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnEditar)).BeginInit();
            this.SuspendLayout();
            // 
            // tlpPrincipal
            // 
            this.tlpPrincipal.AutoSize = true;
            this.tlpPrincipal.ColumnCount = 3;
            this.tlpPrincipal.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.tlpPrincipal.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 70F));
            this.tlpPrincipal.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.tlpPrincipal.Controls.Add(this.panelIzq, 0, 0);
            this.tlpPrincipal.Controls.Add(this.panelDer, 2, 0);
            this.tlpPrincipal.Controls.Add(this.tlpCentro, 1, 0);
            this.tlpPrincipal.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpPrincipal.Location = new System.Drawing.Point(0, 0);
            this.tlpPrincipal.Name = "tlpPrincipal";
            this.tlpPrincipal.RowCount = 1;
            this.tlpPrincipal.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpPrincipal.Size = new System.Drawing.Size(1366, 749);
            this.tlpPrincipal.TabIndex = 2;
            // 
            // panelIzq
            // 
            this.panelIzq.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(52)))), ((int)(((byte)(58)))), ((int)(((byte)(64)))));
            this.panelIzq.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelIzq.Location = new System.Drawing.Point(3, 3);
            this.panelIzq.Name = "panelIzq";
            this.panelIzq.Size = new System.Drawing.Size(198, 743);
            this.panelIzq.TabIndex = 0;
            this.panelIzq.TabStop = false;
            this.panelIzq.ThemeName = "VisualStudio2012Light";
            // 
            // panelDer
            // 
            this.panelDer.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(52)))), ((int)(((byte)(58)))), ((int)(((byte)(64)))));
            this.panelDer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelDer.Location = new System.Drawing.Point(1163, 3);
            this.panelDer.Name = "panelDer";
            this.panelDer.Size = new System.Drawing.Size(200, 743);
            this.panelDer.TabIndex = 0;
            this.panelDer.TabStop = false;
            this.panelDer.ThemeName = "VisualStudio2012Light";
            // 
            // tlpCentro
            // 
            this.tlpCentro.ColumnCount = 1;
            this.tlpCentro.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpCentro.Controls.Add(this.gvProducts, 0, 3);
            this.tlpCentro.Controls.Add(this.tlp02, 0, 2);
            this.tlpCentro.Controls.Add(this.tlp01, 0, 1);
            this.tlpCentro.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpCentro.Location = new System.Drawing.Point(207, 3);
            this.tlpCentro.Name = "tlpCentro";
            this.tlpCentro.RowCount = 4;
            this.tlpCentro.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 5F));
            this.tlpCentro.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 9F));
            this.tlpCentro.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 9F));
            this.tlpCentro.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 77F));
            this.tlpCentro.Size = new System.Drawing.Size(950, 743);
            this.tlpCentro.TabIndex = 0;
            // 
            // gvProducts
            // 
            this.gvProducts.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gvProducts.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gvProducts.Location = new System.Drawing.Point(3, 172);
            // 
            // 
            // 
            this.gvProducts.MasterTemplate.AllowAddNewRow = false;
            this.gvProducts.MasterTemplate.AutoSizeColumnsMode = Telerik.WinControls.UI.GridViewAutoSizeColumnsMode.Fill;
            this.gvProducts.MasterTemplate.ViewDefinition = tableViewDefinition2;
            this.gvProducts.Name = "gvProducts";
            this.gvProducts.ReadOnly = true;
            this.gvProducts.Size = new System.Drawing.Size(944, 568);
            this.gvProducts.TabIndex = 3;
            this.gvProducts.TabStop = false;
            this.gvProducts.ThemeName = "VisualStudio2012Light";
            // 
            // tlp02
            // 
            this.tlp02.ColumnCount = 3;
            this.tlp02.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 9.398497F));
            this.tlp02.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 65.41354F));
            this.tlp02.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25.06266F));
            this.tlp02.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlp02.Controls.Add(this.Código_de_barras, 1, 0);
            this.tlp02.Controls.Add(this.btnBuscar, 2, 0);
            this.tlp02.Controls.Add(this.picArticulo, 0, 0);
            this.tlp02.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlp02.Location = new System.Drawing.Point(3, 106);
            this.tlp02.Name = "tlp02";
            this.tlp02.RowCount = 1;
            this.tlp02.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlp02.Size = new System.Drawing.Size(944, 60);
            this.tlp02.TabIndex = 1;
            // 
            // Código_de_barras
            // 
            this.Código_de_barras.AutoSize = false;
            this.Código_de_barras.Dock = System.Windows.Forms.DockStyle.Top;
            this.Código_de_barras.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Código_de_barras.Location = new System.Drawing.Point(91, 3);
            this.Código_de_barras.Name = "Código_de_barras";
            this.Código_de_barras.NullText = "CÓDIGO DE BARRAS";
            this.Código_de_barras.Size = new System.Drawing.Size(612, 50);
            this.Código_de_barras.TabIndex = 1;
            this.Código_de_barras.ThemeName = "VisualStudio2012Light";
            // 
            // btnBuscar
            // 
            this.btnBuscar.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnBuscar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnBuscar.Location = new System.Drawing.Point(709, 3);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(232, 54);
            this.btnBuscar.TabIndex = 2;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.ThemeName = "VisualStudio2012Light";
            this.btnBuscar.Click += new System.EventHandler(this.btnBuscar_Click);
            // 
            // picArticulo
            // 
            this.picArticulo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.picArticulo.Location = new System.Drawing.Point(3, 3);
            this.picArticulo.Name = "picArticulo";
            this.picArticulo.Size = new System.Drawing.Size(82, 54);
            this.picArticulo.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.picArticulo.TabIndex = 3;
            this.picArticulo.TabStop = false;
            // 
            // tlp01
            // 
            this.tlp01.BackColor = System.Drawing.Color.White;
            this.tlp01.ColumnCount = 4;
            this.tlp01.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tlp01.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tlp01.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tlp01.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tlp01.Controls.Add(this.btnEliminar, 3, 0);
            this.tlp01.Controls.Add(this.btnAgregar, 0, 0);
            this.tlp01.Controls.Add(this.btnRecargar, 2, 0);
            this.tlp01.Controls.Add(this.btnEditar, 1, 0);
            this.tlp01.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlp01.Location = new System.Drawing.Point(3, 40);
            this.tlp01.Name = "tlp01";
            this.tlp01.RowCount = 1;
            this.tlp01.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlp01.Size = new System.Drawing.Size(944, 60);
            this.tlp01.TabIndex = 2;
            // 
            // btnEliminar
            // 
            this.btnEliminar.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnEliminar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnEliminar.Location = new System.Drawing.Point(711, 3);
            this.btnEliminar.Name = "btnEliminar";
            this.btnEliminar.Size = new System.Drawing.Size(230, 54);
            this.btnEliminar.TabIndex = 4;
            this.btnEliminar.Text = "Eliminar";
            this.btnEliminar.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnEliminar.ThemeName = "VisualStudio2012Light";
            // 
            // btnAgregar
            // 
            this.btnAgregar.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnAgregar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAgregar.Location = new System.Drawing.Point(3, 3);
            this.btnAgregar.Name = "btnAgregar";
            this.btnAgregar.Size = new System.Drawing.Size(230, 54);
            this.btnAgregar.TabIndex = 1;
            this.btnAgregar.Text = "Agregar";
            this.btnAgregar.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnAgregar.ThemeName = "VisualStudio2012Light";
            this.btnAgregar.Click += new System.EventHandler(this.Button_Click);
            // 
            // btnRecargar
            // 
            this.btnRecargar.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnRecargar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRecargar.Location = new System.Drawing.Point(475, 3);
            this.btnRecargar.Name = "btnRecargar";
            this.btnRecargar.Size = new System.Drawing.Size(230, 54);
            this.btnRecargar.TabIndex = 3;
            this.btnRecargar.Text = "Recargar";
            this.btnRecargar.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnRecargar.ThemeName = "VisualStudio2012Light";
            this.btnRecargar.Click += new System.EventHandler(this.btnRecargar_Click);
            // 
            // btnEditar
            // 
            this.btnEditar.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnEditar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnEditar.Location = new System.Drawing.Point(239, 3);
            this.btnEditar.Name = "btnEditar";
            this.btnEditar.Size = new System.Drawing.Size(230, 54);
            this.btnEditar.TabIndex = 2;
            this.btnEditar.Text = "Editar";
            this.btnEditar.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnEditar.ThemeName = "VisualStudio2012Light";
            // 
            // frmAdminProducts
            // 
            this.AutoSize = true;
            this.ClientSize = new System.Drawing.Size(1366, 749);
            this.ControlBox = false;
            this.Controls.Add(this.tlpPrincipal);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmAdminProducts";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Sistema de Punto de Venta Viper-Owaltek S.A. de C.V.";
            this.TopMost = true;
            this.Load += new System.EventHandler(this.frmAdminProducts_Load);
            this.tlpPrincipal.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.panelIzq)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.panelDer)).EndInit();
            this.tlpCentro.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.gvProducts.MasterTemplate)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gvProducts)).EndInit();
            this.tlp02.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.Código_de_barras)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnBuscar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.picArticulo)).EndInit();
            this.tlp01.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.btnEliminar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnAgregar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnRecargar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnEditar)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }



        #endregion

        private System.Windows.Forms.TableLayoutPanel tlpPrincipal;
        private System.Windows.Forms.TableLayoutPanel tlpCentro;
        private System.Windows.Forms.TableLayoutPanel tlp02;
        private Telerik.WinControls.UI.RadTextBox Código_de_barras;
        private Telerik.WinControls.UI.RadButton btnBuscar;
        private System.Windows.Forms.TableLayoutPanel tlp01;
        private Telerik.WinControls.UI.RadButton btnEliminar;
        private Telerik.WinControls.UI.RadButton btnAgregar;
        private Telerik.WinControls.UI.RadButton btnRecargar;
        private Telerik.WinControls.UI.RadButton btnEditar;
        private Telerik.WinControls.UI.RadPanel panelIzq;
        private Telerik.WinControls.UI.RadPanel panelDer;
        private Telerik.WinControls.Themes.VisualStudio2012LightTheme visualStudio2012LightTheme1;
        private System.Windows.Forms.PictureBox picArticulo;
        private Telerik.WinControls.UI.RadGridView gvProducts;
    }
}