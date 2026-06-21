<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="main-content">
    <div class="welcome-section">

    <h1>
    ¡Bienvenido,
    <asp:Label ID="lblNombreUsuario" runat="server" />
    👋
</h1>

    <p>
        <asp:Label ID="lblRolUsuario"
                   runat="server" />
        ,
        <%= DateTime.Now.ToString("dddd dd MMMM yyyy") %>
    </p>

</div>
  <!-- KPI -->
<div class="dashboard-kpis">

    <div class="kpi-card pedidos">

        <div class="kpi-icon-box">
            <i class="fas fa-clipboard-list"></i>
        </div>

        <h2>
            <asp:Label ID="lblTotalPedidos" runat="server" />
        </h2>

        <p>Pedidos Activos</p>

    </div>

    <div class="kpi-card diseno">

        <div class="kpi-icon-box">
            <i class="fas fa-palette"></i>
        </div>

        <h2>
            <asp:Label ID="lblDiseno" runat="server" />
        </h2>

        <p>En Diseño</p>

    </div>

    <div class="kpi-card produccion">

        <div class="kpi-icon-box">
            <i class="fas fa-industry"></i>
        </div>

        <h2>
            <asp:Label ID="lblProduccion" runat="server" />
        </h2>

        <p>Producción</p>

    </div>

    <div class="kpi-card entregados">

        <div class="kpi-icon-box">
            <i class="fas fa-check-circle"></i>
        </div>

        <h2>
            <asp:Label ID="lblFinalizados" runat="server" />
        </h2>

        <p>Entregados</p>

    </div>

    <div class="kpi-card clientes">

        <div class="kpi-icon-box">
            <i class="fas fa-users"></i>
        </div>

        <h2>
            <asp:Label ID="lblClientesKPI" runat="server" />
        </h2>

        <p>Clientes</p>

    </div>

    <div class="kpi-card ventas">

        <div class="kpi-icon-box">
            <i class="fas fa-sack-dollar"></i>
        </div>

        <h2>
            L.
            <asp:Label ID="lblVentas" runat="server" />
        </h2>

        <p>Ingresos Totales</p>

    </div>

</div>
    <asp:HiddenField ID="hfEstadosLabels" runat="server" />
<asp:HiddenField ID="hfEstadosValores" runat="server" />
    <asp:HiddenField
    ID="hfVentasLabels"
    runat="server" />

<asp:HiddenField
    ID="hfVentasValores"
    runat="server" />
<asp:HiddenField ID="hfMesesLabels" runat="server" />
<asp:HiddenField ID="hfMesesValores" runat="server" />
   <div class="charts-grid">

    <div class="chart-card">

        <h3>Pedidos por Estado</h3>

        <div class="chart-container">
            <canvas id="chartEstados"></canvas>
        </div>

    </div>
<div class="chart-card">

    <h3>Ventas por Mes</h3>

    <div class="chart-container">
        <canvas id="chartVentas"></canvas>
    </div>

</div>

</div>

<div class="charts-grid">

    <div class="chart-card">

        <h3>Pedidos por Mes</h3>

        <canvas id="chartMensual"></canvas>

    </div>

    <div class="chart-card">

        <h3>Próximas Entregas</h3>

        <div class="entregas-list">

            <div class="entrega-item">
                <span>PED-004</span>
                <strong>15 Jun</strong>
            </div>

            <div class="entrega-item">
                <span>PED-003</span>
                <strong>18 Jun</strong>
            </div>

            <div class="entrega-item">
                <span>PED-002</span>
                <strong>20 Jun</strong>
            </div>

        </div>

    </div>

</div>
    <!-- Grid principal -->

    <div class="dashboard-grid">

        <!-- Actividad reciente -->

        <div class="activity-card">

            <h3>Actividad Reciente</h3>

            <div class="timeline">

                <asp:Repeater ID="rptActividad" runat="server">

                    <ItemTemplate>

                        <div class="timeline-item">

                            <div class="timeline-dot"></div>

                            <div class="timeline-content">

                                <span class="pedido-badge">
                                    PED-<%# Eval("IdPedido") %>
                                </span>

                                <p>
                                    <%# Eval("Comentario") %>
                                </p>

                                <small>
                                    <%# Convert.ToDateTime(Eval("Fecha")).ToString("dd/MM/yyyy HH:mm") %>
                                </small>

                            </div>

                        </div>

                    </ItemTemplate>

                </asp:Repeater>

            </div>

        </div>

        <!-- Resumen -->

        <div class="summary-card">

            <h3>Resumen del Mes</h3>

            <div class="summary-item">
                Ventas:
                <strong>L. 125,000</strong>
            </div>

            <div class="summary-item">
                Clientes:
                <strong>
                    <asp:Label ID="lblClientes" runat="server" />
                </strong>
            </div>

            <div class="summary-item">
                Pedidos:
                <strong>
                    <asp:Label ID="lblPedidosResumen" runat="server" />
                </strong>
            </div>

            <div class="summary-item">
                Producción:
                <strong>12</strong>
            </div>

        </div>

    </div>

    <!-- Últimos pedidos -->

    <div class="ultimos-pedidos-card">

        <h3>Últimos Pedidos Registrados</h3>

        <table class="tabla-dashboard">

            <thead>

                <tr>
                    <th>Pedido</th>
                    <th>Cliente</th>
                    <th>Estado</th>
                </tr>

            </thead>

            <tbody>

                <asp:Repeater
                    ID="rptUltimosPedidos"
                    runat="server">

                    <ItemTemplate>

                        <tr>

                            <td>
                                PED-<%# Eval("IdPedido") %>
                            </td>

                            <td>
                                <%# Eval("NombreCliente") %>
                            </td>

                            <td>

                                <span class="estado-badge">
                                    <%# Eval("Estado") %>
                                </span>

                            </td>

                        </tr>

                    </ItemTemplate>

                </asp:Repeater>

            </tbody>

        </table>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>

    window.onload = function () {

        // ESTADOS

        new Chart(
            document.getElementById('chartEstados'),
            {
                type: 'bar',
                data: {
                    labels: [<%= hfEstadosLabels.Value %>],
            datasets: [{
                label: 'Pedidos',
                data: [<%= hfEstadosValores.Value %>],

                        backgroundColor: [
                            '#8B5CF6', // Diseño
                            '#F97316', // Finalizado
                            '#22C55E', // Producción
                            '#3B82F6', // Entregado
                            '#EF4444'  // Cancelado
                        ],

                        borderRadius: 12,
                        borderWidth: 0
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,

                    plugins: {
                        legend: {
                            display: false
                        }
                    },

                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                stepSize: 1
                            }
                        }
                    }
                }
            });

            //Ventas
        new Chart(
            document.getElementById('chartVentas'),
            {
                type: 'line',

                data: {
                    labels: [<%= hfVentasLabels.Value %>],

            datasets: [{
                label: 'Ventas (L.)',

                            data: [<%= hfVentasValores.Value %>],

                            borderColor: '#22c55e',

                            backgroundColor:
                                'rgba(34,197,94,0.15)',

                            fill: true,

                            tension: 0.4
                        }]
                    },

                    options: {
                        responsive: true,
                        maintainAspectRatio: false
                    }
                });

    // PRODUCCION MENSUAL

    new Chart(
        document.getElementById('chartMensual'),
        {
            type: 'line',
            data: {
                labels: [<%= hfMesesLabels.Value %>],
                datasets: [{
                    label: 'Pedidos',
                    data: [<%= hfMesesValores.Value %>],
                    borderColor: '#2563eb',
                    backgroundColor: 'rgba(37,99,235,0.1)',
                    tension: 0.4,
                    fill: true
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });

    };

</script>

</div>
   
</asp:Content>