namespace Viper.DesktopApp
{
    partial class frmCrudClient
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
            Telerik.WinControls.UI.TableViewDefinition tableViewDefinition1 = new Telerik.WinControls.UI.TableViewDefinition();
            this.tlpPrincipal = new System.Windows.Forms.TableLayoutPanel();
            this.tplCentro = new System.Windows.Forms.TableLayoutPanel();
            this.tpl2 = new System.Windows.Forms.TableLayoutPanel();
            this.Clave_cliente = new Telerik.WinControls.UI.RadTextBox();
            this.btnBuscar = new Telerik.WinControls.UI.RadButton();
            this.tpl1 = new System.Windows.Forms.TableLayoutPanel();
            this.btnEliminar = new Telerik.WinControls.UI.RadButton();
            this.btnAgregar = new Telerik.WinControls.UI.RadButton();
            this.btnRecargar = new Telerik.WinControls.UI.RadButton();
            this.btnEditar = new Telerik.WinControls.UI.RadButton();
            this.tpl3 = new System.Windows.Forms.TableLayoutPanel();
            this.dgvCrudClient = new Telerik.WinControls.UI.RadGridView();
            this.panelIzq = new Telerik.WinControls.UI.RadPanel();
            this.panelDer = new Telerik.WinControls.UI.RadPanel();
            this.tlpPrincipal.SuspendLayout();
            this.tplCentro.SuspendLayout();
            this.tpl2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Clave_cliente)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnBuscar)).BeginInit();
            this.tpl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.btnEliminar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnAgregar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnRecargar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnEditar)).BeginInit();
            this.tpl3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCrudClient)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCrudClient.MasterTemplate)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.panelIzq)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.panelDer)).BeginInit();
            this.SuspendLayout();
            // 
            // tlpPrincipal
            // 
            this.tlpPrincipal.ColumnCount = 3;
            this.tlpPrincipal.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.tlpPrincipal.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 70F));
            this.tlpPrincipal.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.tlpPrincipal.Controls.Add(this.tplCentro, 1, 0);
            this.tlpPrincipal.Controls.Add(this.panelIzq, 0, 0);
            this.tlpPrincipal.Controls.Add(this.panelDer, 2, 0);
            this.tlpPrincipal.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpPrincipal.Location = new System.Drawing.Point(0, 0);
            this.tlpPrincipal.Name = "tlpPrincipal";
            this.tlpPrincipal.RowCount = 1;
            this.tlpPrincipal.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpPrincipal.Size = new System.Drawing.Size(1130, 695);
            this.tlpPrincipal.TabIndex = 0;
            // 
            // tplCentro
            // 
            this.tplCentro.ColumnCount = 1;
            this.tplCentro.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 34.92958F));
            this.tplCentro.Controls.Add(this.tpl2, 0, 2);
            this.tplCentro.Controls.Add(this.tpl1, 0, 1);
            this.tplCentro.Controls.Add(this.tpl3, 0, 3);
            this.tplCentro.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tplCentro.Location = new System.Drawing.Point(172, 3);
            this.tplCentro.Name = "tplCentro";
            this.tplCentro.RowCount = 4;
            this.tplCentro.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tplCentro.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 60F));
            this.tplCentro.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 56F));
            this.tplCentro.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 567F));
            this.tplCentro.Size = new System.Drawing.Size(785, 689);
            this.tplCentro.TabIndex = 0;
            // 
            // tpl2
            // 
            this.tpl2.ColumnCount = 4;
            this.tpl2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 11.23457F));
            this.tpl2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 88.76543F));
            this.tpl2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 245F));
            this.tpl2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 251F));
            this.tpl2.Controls.Add(this.Clave_cliente, 1, 0);
            this.tpl2.Controls.Add(this.btnBuscar, 2, 0);
            this.tpl2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tpl2.Location = new System.Drawing.Point(3, 69);
            this.tpl2.Name = "tpl2";
            this.tpl2.RowCount = 1;
            this.tpl2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tpl2.Size = new System.Drawing.Size(779, 50);
            this.tpl2.TabIndex = 1;
            // 
            // Clave_cliente
            // 
            this.Clave_cliente.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.Clave_cliente.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Clave_cliente.Location = new System.Drawing.Point(34, 20);
            this.Clave_cliente.Name = "Clave_cliente";
            this.Clave_cliente.NullText = "CLAVE DEL CLIENTE";
            this.Clave_cliente.Size = new System.Drawing.Size(245, 27);
            this.Clave_cliente.TabIndex = 1;
            // 
            // btnBuscar
            // 
            this.btnBuscar.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnBuscar.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnBuscar.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(21)))), ((int)(((byte)(66)))), ((int)(((byte)(139)))));
            this.btnBuscar.Location = new System.Drawing.Point(285, 3);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(239, 44);
            this.btnBuscar.TabIndex = 2;
            this.btnBuscar.Text = "Buscar";
            // 
            // tpl1
            // 
            this.tpl1.BackColor = System.Drawing.Color.White;
            this.tpl1.ColumnCount = 4;
            this.tpl1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 49.58848F));
            this.tpl1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50.41152F));
            this.tpl1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 244F));
            this.tpl1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 251F));
            this.tpl1.Controls.Add(this.btnEliminar, 3, 0);
            this.tpl1.Controls.Add(this.btnAgregar, 0, 0);
            this.tpl1.Controls.Add(this.btnRecargar, 2, 0);
            this.tpl1.Controls.Add(this.btnEditar, 1, 0);
            this.tpl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tpl1.Location = new System.Drawing.Point(3, 9);
            this.tpl1.Name = "tpl1";
            this.tpl1.RowCount = 1;
            this.tpl1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tpl1.Size = new System.Drawing.Size(779, 54);
            this.tpl1.TabIndex = 2;
            // 
            // btnEliminar
            // 
            this.btnEliminar.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnEliminar.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnEliminar.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(21)))), ((int)(((byte)(66)))), ((int)(((byte)(139)))));
            this.btnEliminar.Location = new System.Drawing.Point(530, 3);
            this.btnEliminar.Name = "btnEliminar";
            this.btnEliminar.Size = new System.Drawing.Size(246, 48);
            this.btnEliminar.TabIndex = 4;
            this.btnEliminar.Text = "Eliminar";
            // 
            // btnAgregar
            // 
            this.btnAgregar.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnAgregar.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAgregar.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(21)))), ((int)(((byte)(66)))), ((int)(((byte)(139)))));
            this.btnAgregar.Location = new System.Drawing.Point(3, 3);
            this.btnAgregar.Name = "btnAgregar";
            this.btnAgregar.Size = new System.Drawing.Size(134, 48);
            this.btnAgregar.TabIndex = 1;
            this.btnAgregar.Text = "Agregar";
            // 
            // btnRecargar
            // 
            this.btnRecargar.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnRecargar.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRecargar.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(21)))), ((int)(((byte)(66)))), ((int)(((byte)(139)))));
            this.btnRecargar.Location = new System.Drawing.Point(286, 3);
            this.btnRecargar.Name = "btnRecargar";
            this.btnRecargar.Size = new System.Drawing.Size(238, 48);
            this.btnRecargar.TabIndex = 3;
            this.btnRecargar.Text = "Recargar";
            // 
            // btnEditar
            // 
            this.btnEditar.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnEditar.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnEditar.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(21)))), ((int)(((byte)(66)))), ((int)(((byte)(139)))));
            this.btnEditar.Location = new System.Drawing.Point(143, 3);
            this.btnEditar.Name = "btnEditar";
            this.btnEditar.Size = new System.Drawing.Size(137, 48);
            this.btnEditar.TabIndex = 2;
            this.btnEditar.Text = "Editar";
            // 
            // tpl3
            // 
            this.tpl3.ColumnCount = 3;
            this.tpl3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 0.8547009F));
            this.tpl3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 99.1453F));
            this.tpl3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 13F));
            this.tpl3.Controls.Add(this.dgvCrudClient, 1, 1);
            this.tpl3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tpl3.Location = new System.Drawing.Point(3, 125);
            this.tpl3.Name = "tpl3";
            this.tpl3.RowCount = 3;
            this.tpl3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.604651F));
            this.tpl3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 91.39535F));
            this.tpl3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 130F));
            this.tpl3.Size = new System.Drawing.Size(779, 561);
            this.tpl3.TabIndex = 0;
            // 
            // dgvCrudClient
            // 
            this.dgvCrudClient.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvCrudClient.Location = new System.Drawing.Point(9, 40);
            // 
            // 
            // 
            this.dgvCrudClient.MasterTemplate.ViewDefinition = tableViewDefinition1;
            this.dgvCrudClient.Name = "dgvCrudClient";
            this.dgvCrudClient.Size = new System.Drawing.Size(753, 387);
            this.dgvCrudClient.TabIndex = 0;
            this.dgvCrudClient.TabStop = false;
            this.dgvCrudClient.Text = "radGridView1";
            // 
            // panelIzq
            // 
            this.panelIzq.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(52)))), ((int)(((byte)(58)))), ((int)(((byte)(64)))));
            this.panelIzq.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelIzq.Location = new System.Drawing.Point(3, 3);
            this.panelIzq.Name = "panelIzq";
            this.panelIzq.Size = new System.Drawing.Size(163, 689);
            this.panelIzq.TabIndex = 0;
            this.panelIzq.TabStop = false;
            // 
            // panelDer
            // 
            this.panelDer.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(52)))), ((int)(((byte)(58)))), ((int)(((byte)(64)))));
            this.panelDer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelDer.Location = new System.Drawing.Point(963, 3);
            this.panelDer.Name = "panelDer";
            this.panelDer.Size = new System.Drawing.Size(164, 689);
            this.panelDer.TabIndex = 0;
            this.panelDer.TabStop = false;
            // 
            // frmCrudClient
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1130, 695);
            this.ControlBox = false;
            this.Controls.Add(this.tlpPrincipal);
            this.Name = "frmCrudClient";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Sistema de Punto de Venta Viper-Owaltek S.A de C.V.";
            this.tlpPrincipal.ResumeLayout(false);
            this.tplCentro.ResumeLayout(false);
            this.tpl2.ResumeLayout(false);
            this.tpl2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Clave_cliente)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnBuscar)).EndInit();
            this.tpl1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.btnEliminar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnAgregar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnRecargar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnEditar)).EndInit();
            this.tpl3.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvCrudClient.MasterTemplate)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCrudClient)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.panelIzq)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.panelDer)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tlpPrincipal;
        private System.Windows.Forms.TableLayoutPanel tplCentro;
        private System.Windows.Forms.TableLayoutPanel tpl2;
        private Telerik.WinControls.UI.RadTextBox Clave_cliente;
        private Telerik.WinControls.UI.RadButton btnBuscar;
        private System.Windows.Forms.TableLayoutPanel tpl1;
        private Telerik.WinControls.UI.RadButton btnEliminar;
        private Telerik.WinControls.UI.RadButton btnAgregar;
        private Telerik.WinControls.UI.RadButton btnRecargar;
        private Telerik.WinControls.UI.RadButton btnEditar;
        private System.Windows.Forms.TableLayoutPanel tpl3;
        private Telerik.WinControls.UI.RadGridView dgvCrudClient;
        private Telerik.WinControls.UI.RadPanel panelIzq;
        private Telerik.WinControls.UI.RadPanel panelDer;
    }
}