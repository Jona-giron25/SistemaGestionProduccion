<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="dashboard-layout">

    

    <!-- Contenido -->
    <div class="main-content">

    <!-- KPI -->
    <div class="cards">

        <div class="card-kpi">
            <div class="kpi-icon">📋</div>
            <h3>
    <asp:Label ID="lblTotalPedidos"
        runat="server" />
</h3>
            <p>Pedidos Activos</p>
        </div>

        <div class="card-kpi">
            <div class="kpi-icon">🎨</div>
            <h3>
    <asp:Label ID="lblDiseno"
        runat="server" />
</h3>
            <p>En Diseño</p>
        </div>

        <div class="card-kpi">
            <div class="kpi-icon">🏭</div>
            <h3>
    <asp:Label ID="lblProduccion"
        runat="server" />
</h3>
            <p>En Producción</p>
        </div>

        <div class="card-kpi">
            <div class="kpi-icon">✅</div>
            <h3>
    <asp:Label ID="lblFinalizados"
        runat="server" />
</h3>
            <p>Entregados</p>
        </div>

    </div>

    <!-- Dashboard Grid -->

    <div class="dashboard-grid">

        <!-- Actividad -->

        <div class="activity-card">

            <h3>Actividad Reciente</h3>

            <asp:Repeater
    ID="rptActividad"
    runat="server">

    <ItemTemplate>

        <li>

            <strong>
                <%# Convert.ToDateTime(Eval("Fecha")).ToString("dd/MM") %>
            </strong>

            -

            <%# Eval("Comentario") %>

        </li>

    </ItemTemplate>

</asp:Repeater>

        </div>

        <!-- Resumen -->

        <div class="summary-card">

            <h3>Resumen del Mes</h3>

            <div class="summary-item">
                Ventas: <strong>L. 125,000</strong>
            </div>

            <div class="summary-item">
                Clientes:
<strong>
    <asp:Label ID="lblClientes"
        runat="server" />
</strong>
            </div>

            <div class="summary-item">
                Pedidos:
<strong>
    <asp:Label ID="lblPedidosResumen"
        runat="server" />
</strong>
            </div>

            <div class="summary-item">
                Producción: <strong>12</strong>
            </div>

        </div>

    </div>

    <!-- Tabla -->

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
                    <%# Eval("Estado") %>
                </td>

            </tr>

        </ItemTemplate>

    </asp:Repeater>

</tbody>

</div>

</div>

</asp:Content>