using System;
using SistemaGestionProduccion.Data;
using SistemaGestionProduccion.Models;

namespace SistemaGestionProduccion.Pages
{
    public partial class Diseno : System.Web.UI.Page
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
            rptDiseno.DataSource =
                pedidoDAO.ObtenerPedidosPorEstado("Diseño");

            rptDiseno.DataBind();
        }

        protected void btnAprobar_Command(
            object sender,
            System.Web.UI.WebControls.CommandEventArgs e)
        {
            int idPedido =
                Convert.ToInt32(e.CommandArgument);

            pedidoDAO.ActualizarEstadoEtapa(
                idPedido,
                "Producción",
                "Producción");

            SeguimientoPedido seguimiento =
                new SeguimientoPedido();

            seguimiento.IdPedido = idPedido;
            seguimiento.Fecha = DateTime.Now;
            seguimiento.Estado = "Producción";
            seguimiento.Etapa = "Producción";
            seguimiento.Comentario =
                "Diseño aprobado y enviado a producción";
            seguimiento.Usuario =
                Session["Usuario"]?.ToString();

            seguimientoDAO.GuardarSeguimiento(
                seguimiento);

            CargarPedidos();
        }
    }
}