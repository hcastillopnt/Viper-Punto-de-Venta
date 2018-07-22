using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Telerik.WinControls.UI;

namespace Viper.DesktopApp
{
    public static class HelperGrid
    {
        private static double[] ValidarPorcentajes(int columnas, double[] porcentajes)
        {
            if (porcentajes == null)
                return null;
            else if (columnas > porcentajes.Length)
            {
                List<double> values = new List<double>(porcentajes);
                double lastValue = porcentajes[porcentajes.Length - 1];
                int diferencia = columnas - porcentajes.Length;
                for (int j = columnas - diferencia; j < columnas; j++)
                    values.Add(lastValue);
                return values.ToArray();
            }
            return porcentajes;
        }
        private static int[] CalcularPorcentajes(double[] porcentajes, int width)
        {
            try
            {
                int[] c = new int[porcentajes.Length];

                int i = -1;
                foreach (double p in porcentajes)
                    c[++i] = Convert.ToInt32(Math.Truncate(width * (p / 100)));

                int tWidth = c.Sum();

                if (tWidth > width)
                    c[0] -= tWidth - width;
                else if (tWidth < width)
                    c[0] += width - tWidth;
                return c;
            }
            catch { throw; }
        }
        private static int ObtenerAnchoDeTrabajo(RadGridView gvw, int columnas, out bool offset)
        {
            try
            {
                int originalHeight, rowHeaderColumnSpace, height = 0, scrollSize = 17;

                originalHeight = gvw.GridViewElement.TableElement.RowHeaderColumnWidth;
                rowHeaderColumnSpace = gvw.MasterTemplate.ShowRowHeaderColumn ? originalHeight - columnas : 1 - columnas;
                if (!Convert.ToBoolean(gvw.Tag))
                {
                    int rowHeigth = gvw.GridViewElement.TableElement.RowHeight;
                    height = (gvw.Rows.Count * rowHeigth) + (gvw.SummaryRowsBottom.Count * originalHeight) + (gvw.SummaryRowsTop.Count * originalHeight) + originalHeight + scrollSize;
                }
                else
                {
                    foreach (GridViewDataRowInfo row in gvw.Rows)
                        if (row.Tag != null)
                        {
                            int value = Convert.ToInt32(row.Tag);
                            height += value > row.Height ? value : row.Height;
                            row.Tag = row.Height;
                        }
                        else
                        {
                            row.Tag = row.Height;
                            height += row.Height;
                        }
                    height += (gvw.SummaryRowsBottom.Count * originalHeight) + (gvw.SummaryRowsTop.Count * originalHeight) + originalHeight;
                }
                offset = height > gvw.Height;
                return gvw.Width - (offset ? rowHeaderColumnSpace + scrollSize : rowHeaderColumnSpace);
            }
            catch { throw; }
        }
        public static void CambiarAnchoColumnas(this RadGridView gvw, string[] nombreColumnas, params double[] porcentajes)
        {
            gvw.AutoSize = false;

            foreach (string nombre in nombreColumnas)
                if (!gvw.Columns.Contains(nombre))
                    throw new ArgumentException(String.Format("La columna \"{0}\" no se encuentra en la GridView", nombre));
            try
            {
                if (gvw.Tag == null)
                {
                    EventHandler handler = delegate
                    {
                        try { gvw.CambiarAnchoColumnas(nombreColumnas, porcentajes); }
                        catch { throw; }
                    };
                    gvw.SizeChanged += handler;
                    gvw.RowHeightChanged += (s, e) => { gvw.VerticalScrollState = ScrollState.AutoHide; };
                    gvw.ColumnWidthChanged += (s, e) => { gvw.HorizontalScrollState = ScrollState.AutoHide; };
                    gvw.Tag = gvw.AutoSizeRows;
                    if (gvw.AutoSizeRows)
                    {
                        PaintEventHandler enter = null;
                        enter = (sender, e) =>
                        {
                            if (gvw.IsDisplayed)
                            {
                                try
                                {
                                    handler(gvw, e);
                                    gvw.Paint -= enter;
                                }
                                catch { throw; }
                            }
                        };
                        gvw.Paint += enter;
                        return;
                    }
                }
                bool offset;
                porcentajes = ValidarPorcentajes(nombreColumnas.Length, porcentajes);
                int width = ObtenerAnchoDeTrabajo(gvw, nombreColumnas.Length, out offset);
                int[] c = CalcularPorcentajes(porcentajes, width);

                int i = -1;
                foreach (string columna in nombreColumnas)
                    gvw.Columns[columna].Width = c[++i];

                gvw.BackColor = gvw.TableElement.BackColor = System.Drawing.Color.Transparent;
                if (offset)
                {
                    gvw.HorizontalScrollState = ScrollState.AlwaysHide;
                    gvw.VerticalScrollState = ScrollState.AlwaysShow;
                }
                else
                    gvw.HorizontalScrollState = gvw.VerticalScrollState = ScrollState.AlwaysHide;
            }
            catch { throw; }
        }
        public static void WrapText(this RadGridView gvw, bool value)
        {
            try
            {
                foreach (var c in gvw.Columns)
                    if (c.IsVisible)
                        c.WrapText = value;
            }
            catch { throw; }
        }
    }
}
