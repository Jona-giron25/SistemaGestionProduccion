using System;
using System.Web.UI.WebControls;
using SistemaGestionProduccion.Data;
using SistemaGestionProduccion.Models;

namespace SistemaGestionProduccion.Pages
{
    public partial class NuevoPedido : System.Web.UI.Page
    {
        ClienteDAO clienteDAO = new ClienteDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarClientes();
            }
        }

        protected void ddlClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlClientes.SelectedValue))
            {
                int idCliente = Convert.ToInt32(ddlClientes.SelectedValue);

                Cliente cliente = clienteDAO.ObtenerClientePorId(idCliente);

                if (cliente != null)
                {
                    txtRTN.Text = cliente.RTN;
                    txtTelefono.Text = cliente.Telefono;
                    txtCorreo.Text = cliente.Correo;
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(ddlClientes.SelectedValue))
                {
                    Response.Write("<script>alert('Seleccione un cliente');</script>");
                    return;
                }

                Pedido pedido = new Pedido();

                pedido.IdCliente = Convert.ToInt32(ddlClientes.SelectedValue);
                pedido.FechaPedido = DateTime.Now;
                pedido.FechaEntrega = Convert.ToDateTime(txtFechaEntrega.Text);
                pedido.TipoTrabajo = txtTipoTrabajo.Text;
                pedido.Descripcion = txtDescripcion.Text;
                pedido.Estado = ddlEstado.SelectedValue;
                pedido.Total = Convert.ToDecimal(txtTotal.Text);

                PedidoDAO pedidoDAO = new PedidoDAO();

                bool resultado = pedidoDAO.GuardarPedido(pedido);

                if (resultado)
                {
                    Response.Write("<script>alert('Pedido guardado correctamente');</script>");

                    LimpiarFormulario();
                }
                else
                {
                    Response.Write("<script>alert('No se pudo guardar el pedido');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " +
                    ex.Message.Replace("'", "") +
                    "');</script>");
            }
        }

        private void CargarClientes()
        {
            ddlClientes.DataSource = clienteDAO.ObtenerClientes();

            ddlClientes.DataTextField = "Nombre";
            ddlClientes.DataValueField = "IdCliente";

            ddlClientes.DataBind();

            ddlClientes.Items.Insert(0,
                new ListItem("-- Seleccione un Cliente --", ""));
        }

        private void LimpiarFormulario()
        {
            ddlClientes.SelectedIndex = 0;

            txtRTN.Text = "";
            txtTelefono.Text = "";
            txtCorreo.Text = "";

            txtDescripcion.Text = "";
            txtCantidad.Text = "";
            txtTipoTrabajo.Text = "";
            txtFechaEntrega.Text = "";
            txtTotal.Text = "";

            ddlEstado.SelectedIndex = 0;
        }
    }
}