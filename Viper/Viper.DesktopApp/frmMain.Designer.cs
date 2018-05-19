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
            this.picReloj = new System.Windows.Forms.PictureBox();
            this.lblFechaActual = new System.Windows.Forms.Label();
            this.MenuVertical = new System.Windows.Forms.Panel();
            this.btnventas = new System.Windows.Forms.Button();
            this.pnl01 = new System.Windows.Forms.Panel();
            this.btninicio = new System.Windows.Forms.PictureBox();
            this.pnlContenedor = new System.Windows.Forms.Panel();
            this.timer = new System.Windows.Forms.Timer(this.components);
            this.picFotoPerfil = new System.Windows.Forms.PictureBox();
            this.lblNombre = new System.Windows.Forms.Label();
            this.lblPuesto = new System.Windows.Forms.Label();
            this.tlpMenuVertical = new System.Windows.Forms.TableLayoutPanel();
            this.tlpContenedorVertical = new System.Windows.Forms.TableLayoutPanel();
            this.tlpBoton01 = new System.Windows.Forms.TableLayoutPanel();
            this.button1 = new System.Windows.Forms.Button();
            this.BarraTitulo.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picReloj)).BeginInit();
            this.MenuVertical.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.btninicio)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.picFotoPerfil)).BeginInit();
            this.tlpMenuVertical.SuspendLayout();
            this.tlpContenedorVertical.SuspendLayout();
            this.tlpBoton01.SuspendLayout();
            this.SuspendLayout();
            // 
            // BarraTitulo
            // 
            this.BarraTitulo.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(80)))), ((int)(((byte)(200)))));
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
            // btnventas
            // 
            this.btnventas.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(26)))), ((int)(((byte)(32)))), ((int)(((byte)(40)))));
            this.btnventas.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnventas.FlatAppearance.BorderSize = 0;
            this.btnventas.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(80)))), ((int)(((byte)(200)))));
            this.btnventas.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnventas.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnventas.ForeColor = System.Drawing.Color.White;
            this.btnventas.Image = ((System.Drawing.Image)(resources.GetObject("btnventas.Image")));
            this.btnventas.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnventas.Location = new System.Drawing.Point(13, 3);
            this.btnventas.Name = "btnventas";
            this.btnventas.Size = new System.Drawing.Size(192, 47);
            this.btnventas.TabIndex = 7;
            this.btnventas.Text = "F1 Ventas";
            this.btnventas.UseVisualStyleBackColor = false;
            // 
            // pnl01
            // 
            this.pnl01.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(80)))), ((int)(((byte)(200)))));
            this.pnl01.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnl01.Location = new System.Drawing.Point(3, 3);
            this.pnl01.Name = "pnl01";
            this.pnl01.Size = new System.Drawing.Size(4, 47);
            this.pnl01.TabIndex = 2;
            // 
            // btninicio
            // 
            this.btninicio.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btninicio.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btninicio.Image = ((System.Drawing.Image)(resources.GetObject("btninicio.Image")));
            this.btninicio.Location = new System.Drawing.Point(3, 3);
            this.btninicio.Name = "btninicio";
            this.btninicio.Size = new System.Drawing.Size(214, 102);
            this.btninicio.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.btninicio.TabIndex = 0;
            this.btninicio.TabStop = false;
            // 
            // pnlContenedor
            // 
            this.pnlContenedor.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(49)))), ((int)(((byte)(66)))), ((int)(((byte)(82)))));
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
            // lblNombre
            // 
            this.lblNombre.AutoSize = true;
            this.lblNombre.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNombre.ForeColor = System.Drawing.SystemColors.Window;
            this.lblNombre.Location = new System.Drawing.Point(86, 4);
            this.lblNombre.Name = "lblNombre";
            this.lblNombre.Size = new System.Drawing.Size(81, 20);
            this.lblNombre.TabIndex = 3;
            this.lblNombre.Text = "[Nombre]";
            // 
            // lblPuesto
            // 
            this.lblPuesto.AutoSize = true;
            this.lblPuesto.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPuesto.ForeColor = System.Drawing.SystemColors.Window;
            this.lblPuesto.Location = new System.Drawing.Point(86, 28);
            this.lblPuesto.Name = "lblPuesto";
            this.lblPuesto.Size = new System.Drawing.Size(75, 20);
            this.lblPuesto.TabIndex = 4;
            this.lblPuesto.Text = "[Puesto]";
            // 
            // tlpMenuVertical
            // 
            this.tlpMenuVertical.ColumnCount = 1;
            this.tlpMenuVertical.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpMenuVertical.Controls.Add(this.tlpBoton01, 0, 0);
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
            // tlpContenedorVertical
            // 
            this.tlpContenedorVertical.ColumnCount = 1;
            this.tlpContenedorVertical.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpContenedorVertical.Controls.Add(this.button1, 0, 2);
            this.tlpContenedorVertical.Controls.Add(this.tlpMenuVertical, 0, 1);
            this.tlpContenedorVertical.Controls.Add(this.btninicio, 0, 0);
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
            // tlpBoton01
            // 
            this.tlpBoton01.ColumnCount = 2;
            this.tlpBoton01.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 5F));
            this.tlpBoton01.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 95F));
            this.tlpBoton01.Controls.Add(this.pnl01, 0, 0);
            this.tlpBoton01.Controls.Add(this.btnventas, 1, 0);
            this.tlpBoton01.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBoton01.Location = new System.Drawing.Point(3, 3);
            this.tlpBoton01.Name = "tlpBoton01";
            this.tlpBoton01.RowCount = 1;
            this.tlpBoton01.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpBoton01.Size = new System.Drawing.Size(208, 53);
            this.tlpBoton01.TabIndex = 0;
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(26)))), ((int)(((byte)(32)))), ((int)(((byte)(40)))));
            this.button1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.button1.FlatAppearance.BorderSize = 0;
            this.button1.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(80)))), ((int)(((byte)(200)))));
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.ForeColor = System.Drawing.Color.White;
            this.button1.Image = ((System.Drawing.Image)(resources.GetObject("button1.Image")));
            this.button1.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.button1.Location = new System.Drawing.Point(3, 650);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(214, 61);
            this.button1.TabIndex = 18;
            this.button1.Text = "ESC\r\nCerrar Sesion";
            this.button1.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.button1.UseVisualStyleBackColor = false;
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
            this.BarraTitulo.ResumeLayout(false);
            this.BarraTitulo.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picReloj)).EndInit();
            this.MenuVertical.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.btninicio)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.picFotoPerfil)).EndInit();
            this.tlpMenuVertical.ResumeLayout(false);
            this.tlpContenedorVertical.ResumeLayout(false);
            this.tlpBoton01.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel BarraTitulo;
        private System.Windows.Forms.Panel MenuVertical;
        private System.Windows.Forms.Panel pnlContenedor;
        private System.Windows.Forms.PictureBox btninicio;
        private System.Windows.Forms.Panel pnl01;
        private System.Windows.Forms.Button btnventas;
        private System.Windows.Forms.PictureBox picReloj;
        private System.Windows.Forms.Label lblFechaActual;
        private System.Windows.Forms.Timer timer;
        private System.Windows.Forms.Label lblPuesto;
        private System.Windows.Forms.Label lblNombre;
        private System.Windows.Forms.PictureBox picFotoPerfil;
        private System.Windows.Forms.TableLayoutPanel tlpContenedorVertical;
        private System.Windows.Forms.TableLayoutPanel tlpMenuVertical;
        private System.Windows.Forms.TableLayoutPanel tlpBoton01;
        private System.Windows.Forms.Button button1;
    }
}

