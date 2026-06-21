using SistemaGestionProduccion.Data;
using System;
using System.Linq;

namespace SistemaGestionProduccion.Pages
{
    public partial class Calendario : System.Web.UI.Page
    {
        CalendarioDAO calendarioDAO =
            new CalendarioDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["MesActual"] =
                    new DateTime(2026, 6, 1);

                CargarKPIs();
                CargarCalendario();
                CargarEntregas();
            }
        }

        private void CargarKPIs()
        {
            lblEventosHoy.Text =
                calendarioDAO.ObtenerEventosHoy().ToString();

            lblProduccion.Text =
                calendarioDAO.ObtenerProduccion().ToString();

            lblEntregas.Text =
    calendarioDAO.ObtenerTotalEntregas().ToString();

            lblUrgentes.Text =
                calendarioDAO.ObtenerUrgentes().ToString();
        }

        private void CargarCalendario()
        {
            DateTime fecha = (DateTime)ViewState["MesActual"];

            int mes = fecha.Month;
            int anio = fecha.Year;

            lblMesActual.Text = fecha.ToString("MMMM yyyy");

            int diasMes = DateTime.DaysInMonth(anio, mes);

            DateTime primerDia = new DateTime(anio, mes, 1);

            int inicio = ((int)primerDia.DayOfWeek == 0)
                ? 7
                : (int)primerDia.DayOfWeek;

            var pedidos = calendarioDAO.ObtenerPedidosMes(mes, anio);

            DateTime hoy = DateTime.Today;

            string html = @"
    <table class='table table-bordered calendar-table'>
        <thead>
            <tr>
                <th>Lun</th>
                <th>Mar</th>
                <th>Mié</th>
                <th>Jue</th>
                <th>Vie</th>
                <th>Sáb</th>
                <th>Dom</th>
            </tr>
        </thead>
        <tbody>";

            int dia = 1;

            for (int fila = 0; fila < 6; fila++)
            {
                html += "<tr>";

                for (int col = 1; col <= 7; col++)
                {
                    if ((fila == 0 && col < inicio) || dia > diasMes)
                    {
                        html += "<td></td>";
                    }
                    else
                    {
                        bool esHoy =
                            dia == hoy.Day &&
                            mes == hoy.Month &&
                            anio == hoy.Year;

                        string claseDia = esHoy
                            ? "calendar-today"
                            : "";

                        html += $"<td class='{claseDia}'>";

                        html += $"<strong>{dia}</strong>";

                        foreach (var pedido in pedidos)
                        {
                            if (pedido.FechaEntrega.Day == dia)
                            {
                                string clase = "event-delivery";

                                if (pedido.Estado == "Diseño")
                                    clase = "event-design";

                                else if (pedido.Estado == "Producción")
                                    clase = "event-production";

                                else if (pedido.Estado == "Finalizado")
                                    clase = "event-delivery";

                                string tooltip =
                                    $"Cliente: {pedido.NombreCliente}\n" +
                                    $"Trabajo: {pedido.TipoTrabajo}\n" +
                                    $"Estado: {pedido.Estado}\n" +
                                    $"Entrega: {pedido.FechaEntrega:dd/MM/yyyy}";

                                html += $@"
<a href='DetallePedido.aspx?id={pedido.IdPedido}'
   class='{clase}'
   title='{tooltip}'
   style='text-decoration:none; display:block;'>

    <strong>PED-{pedido.IdPedido}</strong>
    <small>{pedido.TipoTrabajo}</small>

</a>";
                            }
                        }

                        html += "</td>";

                        dia++;
                    }
                }

                html += "</tr>";

                if (dia > diasMes)
                    break;
            }

            html += "</tbody></table>";

            litCalendario.Text = html;
        }

        private DateTime MesActual
        {
            get
            {
                if (ViewState["MesActual"] == null)
                    ViewState["MesActual"] = DateTime.Today;

                return (DateTime)ViewState["MesActual"];
            }
            set
            {
                ViewState["MesActual"] = value;
            }
        }
        protected void btnAnterior_Click(object sender, EventArgs e)
        {
            DateTime fecha =
                (DateTime)ViewState["MesActual"];

            ViewState["MesActual"] =
                fecha.AddMonths(-1);

            CargarCalendario();
            CargarEntregas();
        }

        protected void btnSiguiente_Click(object sender, EventArgs e)
        {
            DateTime fecha =
                (DateTime)ViewState["MesActual"];

            ViewState["MesActual"] =
                fecha.AddMonths(1);

            CargarCalendario();
            CargarEntregas();
        }
        private void CargarEntregas()
        {
            var lista =
                calendarioDAO.ObtenerEntregas();

            gvCalendario.DataSource = lista;
            gvCalendario.DataBind();

            rptEntregas.DataSource =
                lista.Take(10).ToList();

            rptEntregas.DataBind();
        }
    }
}