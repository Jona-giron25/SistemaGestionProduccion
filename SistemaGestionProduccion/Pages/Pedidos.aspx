<%@ Page Title="Pedidos"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Pedidos.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.Pedidos" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="page-header">

    <h1>Gestión de Pedidos</h1>

    <a href="NuevoPedido.aspx" class="btn-primary">
        + Nuevo Pedido
    </a>

</div>

<div class="filter-section">

    <input type="text"
        placeholder="Buscar pedido..."
        class="search-input" />

</div>

<div class="table-container">

    <table class="orders-table">

        <thead>

            <tr>
    <th>Código</th>
    <th>Cliente</th>
    <th>Estado</th>
    <th>Etapa</th>
    <th>Fecha</th>
    <th>Total</th>
    <th>Acciones</th>
</tr>

        </thead>

        <tbody>

            <asp:Repeater
                ID="rptPedidos"
                runat="server">

                <ItemTemplate>

                    <tr>

                        <td>
                            PED-<%# String.Format("{0:D3}", Eval("IdPedido")) %>
                        </td>

                        <td>
                            <%# Eval("NombreCliente") %>
                        </td>

                        <td>
                            <%# Eval("Estado") %>
                        </td>

                        <td>
    <%# Eval("EtapaActual") %>
</td>

                        <td>
                            <%# Convert.ToDateTime(Eval("FechaPedido")).ToString("dd/MM/yyyy") %>
                        </td>

                        <td>
                            L. <%# Eval("Total") %>
                        </td>

                        <td class="action-buttons">

                            <a href='DetallePedido.aspx?id=<%# Eval("IdPedido") %>'
                                class="btn-action btn-view">

                                <i class="fas fa-eye"></i>
                                <span>Ver</span>

                            </a>

                        </td>

                    </tr>

                </ItemTemplate>

            </asp:Repeater>

        </tbody>

    </table>

</div>

</asp:Content>