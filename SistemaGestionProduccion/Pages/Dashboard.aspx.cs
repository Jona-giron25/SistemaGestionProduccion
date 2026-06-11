using System;
using SistemaGestionProduccion.Data;

namespace SistemaGestionProduccion.Pages
{
    public partial class Dashboard : System.Web.UI.Page
    {
        DashboardDAO dashboardDAO =
            new DashboardDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarIndicadores();
                CargarActividadReciente();
                CargarUltimosPedidos();
            }
        }

        private void CargarIndicadores()
        {
            lblTotalPedidos.Text =
                dashboardDAO.ObtenerTotalPedidos().ToString();

            lblDiseno.Text =
                dashboardDAO.ObtenerPedidosDiseno().ToString();

            lblProduccion.Text =
                dashboardDAO.ObtenerPedidosProduccion().ToString();

            lblFinalizados.Text =
                dashboardDAO.ObtenerPedidosFinalizados().ToString();

            lblClientes.Text =
                dashboardDAO.ObtenerTotalClientes().ToString();

            lblPedidosResumen.Text =
                dashboardDAO.ObtenerTotalPedidos().ToString();
        }
        private void CargarActividadReciente()
        {
            rptActividad.DataSource =
                dashboardDAO.ObtenerUltimosSeguimientos();

            rptActividad.DataBind();
        }
        private void CargarUltimosPedidos()
        {
            rptUltimosPedidos.DataSource =
                dashboardDAO.ObtenerUltimosPedidos();

            rptUltimosPedidos.DataBind();
        }
    }
}