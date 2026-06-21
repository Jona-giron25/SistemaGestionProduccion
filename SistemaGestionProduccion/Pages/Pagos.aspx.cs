using SistemaGestionProduccion.Data;
using SistemaGestionProduccion.Models;
using System;
using System.Web.UI.WebControls;

namespace SistemaGestionProduccion.Pages
{
    public partial class Pagos : System.Web.UI.Page
    {
        PagoDAO pagoDAO = new PagoDAO();
        PedidoDAO pedidoDAO = new PedidoDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPedidos();
                CargarPagos();
                CargarKPIs();
            }
        }
        private void CargarPedidos()
        {
            ddlPedido.Items.Clear();

            ddlPedido.Items.Add(
                new ListItem(
                    "-- Seleccione un pedido --",
                    ""
                )
            );

            var pedidos = pedidoDAO.ObtenerPedidos();

            foreach (var pedido in pedidos)
            {
                ddlPedido.Items.Add(
                    new ListItem(
                        $"PED-{pedido.IdPedido:D3} | {pedido.NombreCliente}",
                        pedido.IdPedido.ToString()
                    )
                );
            }
        }
        private void CargarPagos()
        {
            rptPagos.DataSource =
                pagoDAO.ObtenerResumenPagos();

            rptPagos.DataBind();
        }

        private void CargarKPIs()
        {
            decimal ingresos =
                pagoDAO.ObtenerIngresosTotales();

            decimal pendiente =
                pagoDAO.ObtenerSaldoPendiente();

            int pagados =
                pagoDAO.ObtenerPedidosPagados();

            lblIngresos.Text = ingresos.ToString("N2");

            lblPendiente.Text = pendiente.ToString("N2");

            lblPagados.Text = pagados.ToString();

            lblAnticipos.Text =
                pagoDAO.ObtenerPedidosAnticipo().ToString();
        }

        protected string ObtenerClaseEstado(string estado)
        {
            switch (estado)
            {
                case "Pagado":
                    return "badge bg-success";

                case "Anticipo":
                    return "badge bg-warning text-dark";

                default:
                    return "badge bg-danger";
            }
        }
        protected void btnGuardarPago_Click(object sender, EventArgs e)
        {
            decimal saldoDisponible = 0;

            decimal.TryParse(
                txtSaldo.Text.Replace(",", ""),
                out saldoDisponible
            );

            if (string.IsNullOrEmpty(ddlPedido.SelectedValue))
            {
                Response.Write(
                    "<script>alert('Seleccione un pedido.');</script>"
                );
                return;
            }

            Pago pago = new Pago();

            pago.IdPedido =
                Convert.ToInt32(ddlPedido.SelectedValue);

            pago.Monto =
                Convert.ToDecimal(txtMonto.Text);

            pago.TipoPago =
                ddlTipoPago.SelectedValue;

            pago.UsuarioCobro =
    Session["Nombre"].ToString();

            if (pago.Monto > Convert.ToDecimal(txtSaldo.Text))
            {
                Response.Write(
                    "<script>alert('El monto excede el saldo pendiente.');</script>"
                );
                return;

            }
            if (pago.Monto <= 0)
            {
                Response.Write(
                    "<script>alert('Ingrese un monto válido.');</script>"
                );
                return;
            }

            if (pagoDAO.InsertarPago(pago))
            {
                CargarPagos();
                CargarKPIs();

                // Limpiar formulario
                ddlPedido.SelectedIndex = 0;
                ddlTipoPago.SelectedIndex = 0;
                txtMonto.Text = "";
                txtSaldo.Text = "";

                // Reiniciar resumen
                lblTotalPedido.Text = "L. 0.00";
                lblPagadoPedido.Text = "L. 0.00";
                lblPendientePedido.Text = "L. 0.00";

                Response.Write(
                    "<script>alert('Pago registrado correctamente');</script>"

                );
            }
            NotificacionDAO noti =
    new NotificacionDAO();

            noti.InsertarNotificacion(
                "Pago Registrado",
                "Se registró un pago de L. "
                + pago.Monto.ToString("N2")
                + " para el pedido PED-"
                + pago.IdPedido.ToString("D3")
            );
        }
        protected void ddlPedido_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarResumenPedido();
        }
        private void CargarResumenPedido()
        {
            if (string.IsNullOrEmpty(ddlPedido.SelectedValue))
            {
                lblTotalPedido.Text = "L. 0.00";
                lblPagadoPedido.Text = "L. 0.00";
                lblPendientePedido.Text = "L. 0.00";

                txtSaldo.Text = "";

                return;
            }

            if (ddlPedido.Items.Count == 0)
                return;

            int idPedido =
                Convert.ToInt32(ddlPedido.SelectedValue);

            PagoResumen resumen =
                pagoDAO.ObtenerResumenPorPedido(idPedido);

            if (resumen != null)
            {
                lblTotalPedido.Text =
                    "L. " + resumen.Total.ToString("N2");

                lblPagadoPedido.Text =
                    "L. " + resumen.Pagado.ToString("N2");

                lblPendientePedido.Text =
                    "L. " + resumen.Saldo.ToString("N2");

                txtSaldo.Text =
                    resumen.Saldo.ToString("N2");
            }
        }
    }
}