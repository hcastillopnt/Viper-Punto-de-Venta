namespace Viper.DesktopApp
{
    partial class frmMain
    {
        /// <summary>
        /// Variable del diseñador requerida.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén utilizando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben eliminar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido del método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMain));
            this.BarraTitulo = new System.Windows.Forms.Panel();
            this.lblPuesto = new System.Windows.Forms.Label();
            this.lblNombre = new System.Windows.Forms.Label();
            this.picFotoPerfil = new System.Windows.Forms.PictureBox();
            this.picReloj = new System.Windows.Forms.PictureBox();
            this.lblFechaActual = new System.Windows.Forms.Label();
            this.MenuVertical = new System.Windows.Forms.Panel();
            this.tlpContenedorVertical = new System.Windows.Forms.TableLayoutPanel();
            this.btnCerrarSesion = new System.Windows.Forms.Button();
            this.tlpMenuVertical = new System.Windows.Forms.TableLayoutPanel();
            this.picLogotipo = new System.Windows.Forms.PictureBox();
            this.pnlContenedor = new System.Windows.Forms.Panel();
            this.timer = new System.Windows.Forms.Timer(this.components);
            this.BarraTitulo.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picFotoPerfil)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.picReloj)).BeginInit();
            this.MenuVertical.SuspendLayout();
            this.tlpContenedorVertical.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picLogotipo)).BeginInit();
            this.SuspendLayout();
            // 
            // BarraTitulo
            // 
            this.BarraTitulo.BackColor = System.Drawing.Color.SlateGray;
            this.BarraTitulo.Controls.Add(this.lblPuesto);
            this.BarraTitulo.Controls.Add(this.lblNombre);
            this.BarraTitulo.Controls.Add(this.picFotoPerfil);
            this.BarraTitulo.Controls.Add(this.picReloj);
            this.BarraTitulo.Controls.Add(this.lblFechaActual);
            this.BarraTitulo.Dock = System.Windows.Forms.DockStyle.Top;
            this.BarraTitulo.Location = new System.Drawing.Point(0, 0);
            this.BarraTitulo.Name = "BarraTitulo";
            this.BarraTitulo.Size = new System.Drawing.Size(1366, 54);
            this.BarraTitulo.TabIndex = 0;
            // 
            // lblPuesto
            // 
            this.lblPuesto.AutoSize = true;
            this.lblPuesto.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPuesto.ForeColor = System.Drawing.SystemColors.Window;
            this.lblPuesto.Location = new System.Drawing.Point(86, 28);
            this.lblPuesto.Name = "lblPuesto";
            this.lblPuesto.Size = new System.Drawing.Size(75, 20);
            this.lblPuesto.TabIndex = 0;
            this.lblPuesto.Text = "[Puesto]";
            // 
            // lblNombre
            // 
            this.lblNombre.AutoSize = true;
            this.lblNombre.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNombre.ForeColor = System.Drawing.SystemColors.Window;
            this.lblNombre.Location = new System.Drawing.Point(86, 4);
            this.lblNombre.Name = "lblNombre";
            this.lblNombre.Size = new System.Drawing.Size(81, 20);
            this.lblNombre.TabIndex = 0;
            this.lblNombre.Text = "[Nombre]";
            // 
            // picFotoPerfil
            // 
            this.picFotoPerfil.Image = ((System.Drawing.Image)(resources.GetObject("picFotoPerfil.Image")));
            this.picFotoPerfil.Location = new System.Drawing.Point(4, 4);
            this.picFotoPerfil.Name = "picFotoPerfil";
            this.picFotoPerfil.Size = new System.Drawing.Size(63, 44);
            this.picFotoPerfil.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.picFotoPerfil.TabIndex = 2;
            this.picFotoPerfil.TabStop = false;
            // 
            // picReloj
            // 
            this.picReloj.Image = ((System.Drawing.Image)(resources.GetObject("picReloj.Image")));
            this.picReloj.Location = new System.Drawing.Point(993, 0);
            this.picReloj.Name = "picReloj";
            this.picReloj.Size = new System.Drawing.Size(86, 54);
            this.picReloj.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.picReloj.TabIndex = 1;
            this.picReloj.TabStop = false;
            // 
            // lblFechaActual
            // 
            this.lblFechaActual.AutoSize = true;
            this.lblFechaActual.Font = new System.Drawing.Font("Microsoft Sans Serif", 25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFechaActual.ForeColor = System.Drawing.SystemColors.Window;
            this.lblFechaActual.Location = new System.Drawing.Point(1085, 9);
            this.lblFechaActual.Name = "lblFechaActual";
            this.lblFechaActual.Size = new System.Drawing.Size(137, 39);
            this.lblFechaActual.TabIndex = 0;
            this.lblFechaActual.Text = "[Fecha]";
            // 
            // MenuVertical
            // 
            this.MenuVertical.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(26)))), ((int)(((byte)(32)))), ((int)(((byte)(40)))));
            this.MenuVertical.Controls.Add(this.tlpContenedorVertical);
            this.MenuVertical.Dock = System.Windows.Forms.DockStyle.Left;
            this.MenuVertical.Location = new System.Drawing.Point(0, 54);
            this.MenuVertical.Name = "MenuVertical";
            this.MenuVertical.Size = new System.Drawing.Size(220, 714);
            this.MenuVertical.TabIndex = 1;
            // 
            // tlpContenedorVertical
            // 
            this.tlpContenedorVertical.ColumnCount = 1;
            this.tlpContenedorVertical.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpContenedorVertical.Controls.Add(this.btnCerrarSesion, 0, 2);
            this.tlpContenedorVertical.Controls.Add(this.tlpMenuVertical, 0, 1);
            this.tlpContenedorVertical.Controls.Add(this.picLogotipo, 0, 0);
            this.tlpContenedorVertical.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpContenedorVertical.Location = new System.Drawing.Point(0, 0);
            this.tlpContenedorVertical.Name = "tlpContenedorVertical";
            this.tlpContenedorVertical.RowCount = 3;
            this.tlpContenedorVertical.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 15.26611F));
            this.tlpContenedorVertical.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 75.63025F));
            this.tlpContenedorVertical.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 9.243697F));
            this.tlpContenedorVertical.Size = new System.Drawing.Size(220, 714);
            this.tlpContenedorVertical.TabIndex = 0;
            // 
            // btnCerrarSesion
            // 
            this.btnCerrarSesion.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(26)))), ((int)(((byte)(32)))), ((int)(((byte)(40)))));
            this.btnCerrarSesion.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnCerrarSesion.FlatAppearance.BorderSize = 0;
            this.btnCerrarSesion.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(80)))), ((int)(((byte)(200)))));
            this.btnCerrarSesion.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCerrarSesion.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCerrarSesion.ForeColor = System.Drawing.Color.White;
            this.btnCerrarSesion.Image = ((System.Drawing.Image)(resources.GetObject("btnCerrarSesion.Image")));
            this.btnCerrarSesion.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCerrarSesion.Location = new System.Drawing.Point(3, 650);
            this.btnCerrarSesion.Name = "btnCerrarSesion";
            this.btnCerrarSesion.Size = new System.Drawing.Size(214, 61);
            this.btnCerrarSesion.TabIndex = 10;
            this.btnCerrarSesion.Text = "Cerrar Sesion";
            this.btnCerrarSesion.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnCerrarSesion.UseVisualStyleBackColor = false;
            // 
            // tlpMenuVertical
            // 
            this.tlpMenuVertical.ColumnCount = 1;
            this.tlpMenuVertical.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpMenuVertical.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpMenuVertical.Location = new System.Drawing.Point(3, 111);
            this.tlpMenuVertical.Name = "tlpMenuVertical";
            this.tlpMenuVertical.RowCount = 9;
            this.tlpMenuVertical.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.11111F));
            this.tlpMenuVertical.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.11111F));
            this.tlpMenuVertical.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.11111F));
            this.tlpMenuVertical.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.11111F));
            this.tlpMenuVertical.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.11111F));
            this.tlpMenuVertical.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.11111F));
            this.tlpMenuVertical.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.11111F));
            this.tlpMenuVertical.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.11111F));
            this.tlpMenuVertical.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.11111F));
            this.tlpMenuVertical.Size = new System.Drawing.Size(214, 533);
            this.tlpMenuVertical.TabIndex = 17;
            // 
            // picLogotipo
            // 
            this.picLogotipo.Cursor = System.Windows.Forms.Cursors.Hand;
            this.picLogotipo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.picLogotipo.Image = ((System.Drawing.Image)(resources.GetObject("picLogotipo.Image")));
            this.picLogotipo.Location = new System.Drawing.Point(3, 3);
            this.picLogotipo.Name = "picLogotipo";
            this.picLogotipo.Size = new System.Drawing.Size(214, 102);
            this.picLogotipo.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.picLogotipo.TabIndex = 0;
            this.picLogotipo.TabStop = false;
            // 
            // pnlContenedor
            // 
            this.pnlContenedor.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(52)))), ((int)(((byte)(58)))), ((int)(((byte)(64)))));
            this.pnlContenedor.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlContenedor.Location = new System.Drawing.Point(220, 54);
            this.pnlContenedor.Name = "pnlContenedor";
            this.pnlContenedor.Size = new System.Drawing.Size(1146, 714);
            this.pnlContenedor.TabIndex = 2;
            // 
            // timer
            // 
            this.timer.Tick += new System.EventHandler(this.timer_Tick);
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.ClientSize = new System.Drawing.Size(1366, 768);
            this.ControlBox = false;
            this.Controls.Add(this.pnlContenedor);
            this.Controls.Add(this.MenuVertical);
            this.Controls.Add(this.BarraTitulo);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "frmMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.frmMain_KeyDown);
            this.BarraTitulo.ResumeLayout(false);
            this.BarraTitulo.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picFotoPerfil)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.picReloj)).EndInit();
            this.MenuVertical.ResumeLayout(false);
            this.tlpContenedorVertical.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.picLogotipo)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel BarraTitulo;
        private System.Windows.Forms.Panel MenuVertical;
        private System.Windows.Forms.Panel pnlContenedor;
        private System.Windows.Forms.PictureBox picLogotipo;
        private System.Windows.Forms.PictureBox picReloj;
        private System.Windows.Forms.Label lblFechaActual;
        private System.Windows.Forms.Timer timer;
        private System.Windows.Forms.Label lblPuesto;
        private System.Windows.Forms.Label lblNombre;
        private System.Windows.Forms.PictureBox picFotoPerfil;
        private System.Windows.Forms.TableLayoutPanel tlpContenedorVertical;
        private System.Windows.Forms.TableLayoutPanel tlpMenuVertical;
        private System.Windows.Forms.Button btnCerrarSesion;
    }
}

