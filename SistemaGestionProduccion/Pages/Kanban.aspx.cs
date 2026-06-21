using System;
using SistemaGestionProduccion.Data;

namespace SistemaGestionProduccion.Pages
{
    public partial class Kanban : System.Web.UI.Page
    {
        PedidoDAO pedidoDAO = new PedidoDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarKanban();
            }
        }

        private void CargarKanban()
        {
            var cotizacion =
                pedidoDAO.ObtenerPedidosPorEstado("Cotización");

            rptCotizacion.DataSource = cotizacion;
            rptCotizacion.DataBind();

            lblCotizacion.Text =
                cotizacion.Count.ToString();


            var aprobacion =
                pedidoDAO.ObtenerPedidosPorEstado("Aprobación");

            rptAprobacion.DataSource = aprobacion;
            rptAprobacion.DataBind();

            lblAprobacion.Text =
                aprobacion.Count.ToString();


            var diseno =
                pedidoDAO.ObtenerPedidosPorEstado("Diseño");

            rptDiseno.DataSource = diseno;
            rptDiseno.DataBind();

            lblDiseno.Text =
                diseno.Count.ToString();


            var produccion =
                pedidoDAO.ObtenerPedidosPorEstado("Producción");

            rptProduccion.DataSource = produccion;
            rptProduccion.DataBind();

            lblProduccion.Text =
                produccion.Count.ToString();


            var finalizado =
                pedidoDAO.ObtenerPedidosPorEstado("Finalizado");

            rptFinalizado.DataSource = finalizado;
            rptFinalizado.DataBind();

            lblFinalizado.Text =
                finalizado.Count.ToString();
        }
    }
}