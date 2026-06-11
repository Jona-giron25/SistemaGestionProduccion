using System;
using SistemaGestionProduccion.Data;

namespace SistemaGestionProduccion.Pages
{
    public partial class Pedidos : System.Web.UI.Page
    {
        PedidoDAO pedidoDAO = new PedidoDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPedidos();
            }
        }

        private void CargarPedidos()
        {
            rptPedidos.DataSource =
                pedidoDAO.ObtenerPedidos();

            rptPedidos.DataBind();
        }
    }
}