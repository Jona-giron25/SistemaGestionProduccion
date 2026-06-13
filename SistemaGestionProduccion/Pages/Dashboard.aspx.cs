using System;
using SistemaGestionProduccion.Data;
using System.Linq;
using SistemaGestionProduccion.Models;

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
                CargarGraficos();
            }
        }
        private void CargarGraficos()
        {
            var estados =
                dashboardDAO.ObtenerPedidosPorEstado();

            hfEstadosLabels.Value =
                string.Join(",",
                estados.Select(x => "'" + x.Nombre + "'"));

            hfEstadosValores.Value =
                string.Join(",",
                estados.Select(x => x.Total));

            var etapas =
                dashboardDAO.ObtenerPedidosPorEtapa();

            hfEtapasLabels.Value =
                string.Join(",",
                etapas.Select(x => "'" + x.Nombre + "'"));

            hfEtapasValores.Value =
                string.Join(",",
                etapas.Select(x => x.Total));

            var mensual =
                dashboardDAO.ObtenerProduccionMensual();

            hfMesesLabels.Value =
                string.Join(",",
                mensual.Select(x => "'" + x.Nombre + "'"));

            hfMesesValores.Value =
                string.Join(",",
                mensual.Select(x => x.Total));
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

            lblCrecimientoPedidos.Text =
    dashboardDAO.ObtenerCrecimientoPedidos()
    .ToString("0") + "% vs mes anterior";
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