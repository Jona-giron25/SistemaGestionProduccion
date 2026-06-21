using System;
using SistemaGestionProduccion.Data;

namespace SistemaGestionProduccion.Pages
{
    public partial class HistorialPagos : System.Web.UI.Page
    {
        PagoDAO pagoDAO = new PagoDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarHistorial();
            }
        }

        private void CargarHistorial()
        {
            int idPedido =
                Convert.ToInt32(Request.QueryString["id"]);

            var resumen =
                pagoDAO.ObtenerResumenPorPedido(idPedido);

            lblTotal.Text =
                "L. " + resumen.Total.ToString("N2");

            lblPagado.Text =
                "L. " + resumen.Pagado.ToString("N2");

            lblSaldo.Text =
                "L. " + resumen.Saldo.ToString("N2");

            rptHistorial.DataSource =
                pagoDAO.ObtenerPagosPorPedido(idPedido);

            rptHistorial.DataBind();
        }
    }
}