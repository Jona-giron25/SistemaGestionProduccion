using System;
using System.Linq;
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
                CargarGraficos();

                lblNombreUsuario.Text =
                    "Bienvenido, " +
                    Session["Nombre"];

                lblRolUsuario.Text =
                    "Rol: " +
                    Session["Rol"];

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

            lblClientesKPI.Text =
    dashboardDAO.ObtenerTotalClientes().ToString();

            lblClientes.Text =
                dashboardDAO.ObtenerTotalClientes().ToString();

            lblPedidosResumen.Text =
                dashboardDAO.ObtenerTotalPedidos().ToString();

            lblVentas.Text =
                dashboardDAO.ObtenerVentasTotales()
                .ToString("N2");

            
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

        private void CargarGraficos()
        {
            var estados =
                dashboardDAO.ObtenerPedidosPorEstado();

            hfEstadosLabels.Value =
                string.Join(",",
                estados.Select(x =>
                "'" + x.Nombre + "'"));

            hfEstadosValores.Value =
                string.Join(",",
                estados.Select(x =>
                x.Total));
            var ventas =
    dashboardDAO.ObtenerVentasPorMes();

            hfVentasLabels.Value =
                string.Join(",",
                ventas.Select(x =>
                "'" + x.Nombre + "'"));

            hfVentasValores.Value =
                string.Join(",",
                ventas.Select(x =>
                x.Total));

            var mensual =
                dashboardDAO.ObtenerProduccionMensual();

            hfMesesLabels.Value =
                string.Join(",",
                mensual.Select(x =>
                "'" + x.Nombre + "'"));

            hfMesesValores.Value =
                string.Join(",",
                mensual.Select(x =>
                x.Total));
        }
    }
}