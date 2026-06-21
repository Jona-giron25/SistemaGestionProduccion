<%@ Page Title="Reportes" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Reportes.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.Reportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid">
    <asp:HiddenField ID="hfVentasLabels" runat="server" />
<asp:HiddenField ID="hfVentasValores" runat="server" />

<asp:HiddenField ID="hfEstadosLabels" runat="server" />
<asp:HiddenField ID="hfEstadosValores" runat="server" />

    <!-- Encabezado -->
    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>
            <h1 class="fw-bold">Reportes y Estadísticas</h1>
            <p class="text-muted mb-0">
                Indicadores clave del negocio y rendimiento operativo
            </p>
        </div>

        <asp:Button
    ID="btnExportarPDF"
    runat="server"
    Text="Exportar Reporte PDF"
    CssClass="btn btn-primary"
    OnClick="btnExportarPDF_Click" />

    </div>

    <!-- KPIs -->
    <div class="row mb-4">

        <div class="col-md-4">

            <div class="card border-0 shadow-sm">

                <div class="card-body">

                    <h6 class="text-muted">
                        Ventas Totales
                    </h6>

                    <h2 class="fw-bold text-success">
                        L.
                        <asp:Label
                            ID="lblVentas"
                            runat="server"
                            Text="0.00" />
                    </h2>

                    <small class="text-success">
                        Pagos registrados
                    </small>

                </div>

            </div>

        </div>

        <div class="col-md-4">

            <div class="card border-0 shadow-sm">

                <div class="card-body">

                    <h6 class="text-muted">
                        Total Pedidos
                    </h6>

                    <h2 class="fw-bold text-primary">

                        <asp:Label
                            ID="lblPedidos"
                            runat="server"
                            Text="0" />

                    </h2>

                    <small class="text-primary">
                        Pedidos registrados
                    </small>

                </div>

            </div>

        </div>

        <div class="col-md-4">

            <div class="card border-0 shadow-sm">

                <div class="card-body">

                    <h6 class="text-muted">
                        Clientes Activos
                    </h6>

                    <h2 class="fw-bold text-info">

                        <asp:Label
                            ID="lblClientes"
                            runat="server"
                            Text="0" />

                    </h2>

                    <small class="text-info">
                        Clientes registrados
                    </small>

                </div>

            </div>

        </div>

    </div>

    <!-- Gráficos -->
    <div class="row mb-4">

        <div class="col-lg-8">

            <div class="card border-0 shadow-sm">

                <div class="card-header bg-white">
                    <h5 class="fw-bold mb-0">
                        Ventas Mensuales
                    </h5>
                </div>

                <div class="card-body text-center">

                    <canvas id="ventasChart"></canvas>

                </div>

            </div>

        </div>

        <div class="col-lg-4">

            <div class="card border-0 shadow-sm">

                <div class="card-header bg-white">
                    <h5 class="fw-bold mb-0">
                        Estado de Pedidos
                    </h5>
                </div>

                <div class="card-body text-center">

                   <canvas id="estadoChart"></canvas>

                </div>

            </div>

        </div>

    </div>

    <!-- Tablas -->
    <div class="row">

        <!-- Top Clientes -->
        <div class="col-lg-6">

            <div class="card border-0 shadow-sm">

                <div class="card-header bg-white">
                    <h5 class="fw-bold mb-0">
                        Top Clientes
                    </h5>
                </div>

                <div class="card-body">

                    <table class="table table-hover">

                        <thead>

                            <tr>
                                <th>Cliente</th>
                                <th>Pedidos</th>
                                <th>Facturación</th>
                            </tr>

                        </thead>

                        <tbody>

                            <asp:Repeater
                                ID="rptTopClientes"
                                runat="server">

                                <ItemTemplate>

                                    <tr>

                                        <td>
                                            <%# Eval("Cliente") %>
                                        </td>

                                        <td>
                                            <%# Eval("Pedidos") %>
                                        </td>

                                        <td>
                                            L. <%# Eval("Facturacion","{0:N2}") %>
                                        </td>

                                    </tr>

                                </ItemTemplate>

                            </asp:Repeater>

                        </tbody>

                    </table>

                </div>

            </div>

        </div>

        <!-- Últimos Pagos -->
        <div class="col-lg-6">

            <div class="card border-0 shadow-sm">

                <div class="card-header bg-white">
                    <h5 class="fw-bold mb-0">
                        Últimos Pagos
                    </h5>
                </div>

                <div class="card-body">

                    <table class="table table-hover">

                        <thead>

                            <tr>
                                <th>Fecha</th>
                                <th>Monto</th>
                                <th>Usuario</th>
                            </tr>

                        </thead>

                        <tbody>

                            <asp:Repeater
                                ID="rptUltimosPagos"
                                runat="server">

                                <ItemTemplate>

                                    <tr>

                                        <td>
                                            <%# Eval("Fecha","{0:dd/MM/yyyy HH:mm}") %>
                                        </td>

                                        <td>
                                            L. <%# Eval("Monto","{0:N2}") %>
                                        </td>

                                        <td>
                                            <%# Eval("Usuario") %>
                                        </td>

                                    </tr>

                                </ItemTemplate>

                            </asp:Repeater>

                        </tbody>

                    </table>

                </div>

            </div>

        </div>

    </div>

</div>

<style>

.card{
    border-radius:15px;
}

.btn{
    border-radius:10px;
}

.table th{
    font-weight:600;
}

.table td{
    vertical-align:middle;
}

</style>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>

window.onload = function () {

    // Grafico Ventas

    const ventasCtx =
        document.getElementById('ventasChart');

    new Chart(ventasCtx, {

        type: 'line',

        data: {

            labels: [
                <%= hfVentasLabels.Value %>
            ],

            datasets: [{

                label: 'Ventas',

                data: [
                    <%= hfVentasValores.Value %>
                ],

                borderWidth: 3,
                fill: false

            }]
        }
    });

    // Grafico Estados

    const estadoCtx =
        document.getElementById('estadoChart');

    new Chart(estadoCtx, {

        type: 'doughnut',

        data: {

            labels: [
                <%= hfEstadosLabels.Value %>
            ],

            datasets: [{

                data: [
                    <%= hfEstadosValores.Value %>
                ]

            }]
        }
    });

};

</script>

</asp:Content>
