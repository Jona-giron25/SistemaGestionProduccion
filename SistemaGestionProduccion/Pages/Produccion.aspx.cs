using System;
using SistemaGestionProduccion.Data;
using SistemaGestionProduccion.Models;

namespace SistemaGestionProduccion.Pages
{
    public partial class Produccion : System.Web.UI.Page
    {
        PedidoDAO pedidoDAO =
            new PedidoDAO();

        SeguimientoPedidoDAO seguimientoDAO =
            new SeguimientoPedidoDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPedidos();
            }
        }

        private void CargarPedidos()
        {
            rptProduccion.DataSource =
                pedidoDAO.ObtenerPedidosPorEstado("Producción");

            rptProduccion.DataBind();
        }

        protected void btnFinalizar_Command(
            object sender,
            System.Web.UI.WebControls.CommandEventArgs e)
        {
            int idPedido =
                Convert.ToInt32(e.CommandArgument);

            pedidoDAO.ActualizarEstadoEtapa(
                idPedido,
                "Finalizado",
                "Finalizado");

            SeguimientoPedido seguimiento =
                new SeguimientoPedido();

            seguimiento.IdPedido = idPedido;
            seguimiento.Fecha = DateTime.Now;
            seguimiento.Estado = "Finalizado";
            seguimiento.Etapa = "Finalizado";
            seguimiento.Comentario =
                "Producción completada y lista para entrega";

            seguimiento.Usuario =
                Session["Usuario"]?.ToString();

            seguimientoDAO.GuardarSeguimiento(
                seguimiento);

            CargarPedidos();
        }
    }
}