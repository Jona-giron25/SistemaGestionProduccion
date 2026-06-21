using System;
using SistemaGestionProduccion.Data;
using SistemaGestionProduccion.Models;

namespace SistemaGestionProduccion.Pages
{
    public partial class DetallePedido : System.Web.UI.Page
    {
        PedidoDAO pedidoDAO = new PedidoDAO();

        SeguimientoPedidoDAO seguimientoDAO =
            new SeguimientoPedidoDAO();

        protected string ObtenerClaseEstado(string estado)
        {
            switch (estado)
            {
                case "Cotización":
                    return "estado-cotizacion";

                case "Aprobación":
                    return "estado-aprobacion";

                case "Diseño":
                    return "estado-diseno";

                case "Producción":
                    return "estado-produccion";

                case "Entrega":
                    return "estado-entrega";

                case "Finalizado":
                    return "estado-finalizado";

                default:
                    return "";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPedido();
                CargarSeguimientos();
            }
        }

        private void CargarPedido()
        {
            if (Request.QueryString["id"] == null)
                return;

            int idPedido =
                Convert.ToInt32(Request.QueryString["id"]);

            Pedido pedido =
                pedidoDAO.ObtenerPedidoPorId(idPedido);

            if (pedido == null)
                return;

            lblCodigo.Text =
                "PED-" + pedido.IdPedido.ToString("D3");

            lblCliente.Text =
                pedido.NombreCliente;

            lblFecha.Text =
                pedido.FechaPedido.ToString("dd/MM/yyyy");

            lblEstado.Text =
                pedido.Estado;

            lblTipoTrabajo.Text =
                pedido.TipoTrabajo;

            lblFechaEntrega.Text =
                pedido.FechaEntrega.ToString("dd/MM/yyyy");

            lblDescripcion.Text =
                pedido.Descripcion;

            lblTotal.Text =
                "L. " + pedido.Total.ToString("N2");

            lblSaldo.Text =
                "L. " + pedido.Total.ToString("N2");

            lblEstadoSeguimiento.Text =
                pedido.Estado;

            lblEstadoActual.Text = pedido.Estado;
            switch (pedido.Estado)
            {
                case "Aprobación":

                    progressFill.Style["width"] = "25%";
                    lblPorcentaje.Text = "25%";

                    break;

                case "Diseño":

                    progressFill.Style["width"] = "50%";
                    lblPorcentaje.Text = "50%";

                    break;

                case "Producción":

                    progressFill.Style["width"] = "75%";
                    lblPorcentaje.Text = "75%";

                    break;

                case "Finalizado":

                    progressFill.Style["width"] = "100%";
                    lblPorcentaje.Text = "100%";

                    break;

                default:

                    progressFill.Style["width"] = "10%";
                    lblPorcentaje.Text = "10%";

                    break;
            }
        }

        private void CargarSeguimientos()
        {
            if (Request.QueryString["id"] == null)
                return;

            int idPedido =
                Convert.ToInt32(Request.QueryString["id"]);

            rptSeguimientos.DataSource =
                seguimientoDAO.ObtenerSeguimientos(idPedido);

            rptSeguimientos.DataBind();
        }

        protected void btnGuardarSeguimiento_Click(
            object sender,
            EventArgs e)
        {
            try
            {
                int idPedido =
                    Convert.ToInt32(Request.QueryString["id"]);

                SeguimientoPedido seguimiento =
                    new SeguimientoPedido();

                seguimiento.IdPedido = idPedido;

                seguimiento.Fecha = DateTime.Now;

                seguimiento.Estado =
                    ddlEstadoNuevo.SelectedValue;

                seguimiento.Etapa =
                    ddlEtapa.SelectedValue;

                seguimiento.Comentario =
                    txtComentario.Text;

                seguimiento.Usuario =
                    Session["Nombre"]?.ToString() ?? "Sistema";

                seguimientoDAO.GuardarSeguimiento(
    seguimiento);

                NotificacionDAO noti = new NotificacionDAO();

                noti.InsertarNotificacion(
                    "Seguimiento Actualizado",
                    "Pedido PED-" +
                    idPedido.ToString("D3") +
                    " actualizado a " +
                    ddlEstadoNuevo.SelectedValue
                );

                pedidoDAO.ActualizarEstadoEtapa(
                    idPedido,
                    ddlEstadoNuevo.SelectedValue,
                    ddlEstadoNuevo.SelectedValue);

                txtComentario.Text = "";

                CargarPedido();
                CargarSeguimientos();

                Response.Write(
                    "<script>alert('Seguimiento guardado correctamente');</script>");
            }
            catch (Exception ex)
            {
                Response.Write(
                    "<script>alert('Error: " +
                    ex.Message.Replace("'", "") +
                    "');</script>");
            }
        }
    }
}