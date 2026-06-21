<%@ Page Title="Kanban" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Kanban.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.Kanban" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>
            <h1 class="fw-bold">Tablero Kanban</h1>
            <p class="text-muted mb-0">
                Seguimiento visual de pedidos por etapa
            </p>
        </div>

    </div>

    <div class="kanban-board">

        <!-- COTIZACION -->
        <div class="kanban-column">

            <div class="kanban-header pending">
                Cotización
                (<asp:Label ID="lblCotizacion" runat="server" Text="0" />)
            </div>

            <asp:Repeater ID="rptCotizacion" runat="server">

                <ItemTemplate>

                    <div class="kanban-card">

                        <div class="card-top">

                            <h5>
                                PED-<%# Eval("IdPedido") %>
                            </h5>

                            <span class="priority medium">
                                Normal
                            </span>

                        </div>

                        <p>
                            <%# Eval("TipoTrabajo") %>
                        </p>

                        <span class="client-name">
                            <%# Eval("NombreCliente") %>
                        </span>

                        <div class="pedido-total">
                            L. <%# Convert.ToDecimal(Eval("Total")).ToString("N2") %>
                        </div>

                        <div class="card-footer">
                            Entrega:
                            <%# Convert.ToDateTime(Eval("FechaEntrega")).ToString("dd/MM/yyyy") %>
                        </div>

                        <div class="progress-bar-kanban">
                            <div class="progress-fill-kanban" style="width:20%"></div>
                        </div>

                        <a href='DetallePedido.aspx?id=<%# Eval("IdPedido") %>'
                           class="btn-detalle">
                            Ver Detalle
                        </a>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>

        <!-- APROBACION -->
        <div class="kanban-column">

            <div class="kanban-header approval">
                Aprobación
                (<asp:Label ID="lblAprobacion" runat="server" Text="0" />)
            </div>

            <asp:Repeater ID="rptAprobacion" runat="server">

                <ItemTemplate>

                    <div class="kanban-card">

                        <div class="card-top">
                            <h5>PED-<%# Eval("IdPedido") %></h5>
                            <span class="priority medium">Normal</span>
                        </div>

                        <p><%# Eval("TipoTrabajo") %></p>

                        <span class="client-name">
                            <%# Eval("NombreCliente") %>
                        </span>

                        <div class="pedido-total">
                            L. <%# Convert.ToDecimal(Eval("Total")).ToString("N2") %>
                        </div>

                        <div class="card-footer">
                            Entrega:
                            <%# Convert.ToDateTime(Eval("FechaEntrega")).ToString("dd/MM/yyyy") %>
                        </div>

                        <div class="progress-bar-kanban">
                            <div class="progress-fill-kanban" style="width:40%"></div>
                        </div>

                        <a href='DetallePedido.aspx?id=<%# Eval("IdPedido") %>'
                           class="btn-detalle">
                            Ver Detalle
                        </a>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>

        <!-- DISEÑO -->
        <div class="kanban-column">

            <div class="kanban-header design">
                Diseño
                (<asp:Label ID="lblDiseno" runat="server" Text="0" />)
            </div>

            <asp:Repeater ID="rptDiseno" runat="server">

                <ItemTemplate>

                    <div class="kanban-card">

                        <div class="card-top">
                            <h5>PED-<%# Eval("IdPedido") %></h5>
                            <span class="priority medium">Normal</span>
                        </div>

                        <p><%# Eval("TipoTrabajo") %></p>

                        <span class="client-name">
                            <%# Eval("NombreCliente") %>
                        </span>

                        <div class="pedido-total">
                            L. <%# Convert.ToDecimal(Eval("Total")).ToString("N2") %>
                        </div>

                        <div class="card-footer">
                            Entrega:
                            <%# Convert.ToDateTime(Eval("FechaEntrega")).ToString("dd/MM/yyyy") %>
                        </div>

                        <div class="progress-bar-kanban">
                            <div class="progress-fill-kanban" style="width:60%"></div>
                        </div>

                        <a href='DetallePedido.aspx?id=<%# Eval("IdPedido") %>'
                           class="btn-detalle">
                            Ver Detalle
                        </a>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>

        <!-- PRODUCCION -->
        <div class="kanban-column">

            <div class="kanban-header production">
                Producción
                (<asp:Label ID="lblProduccion" runat="server" Text="0" />)
            </div>

            <asp:Repeater ID="rptProduccion" runat="server">

                <ItemTemplate>

                    <div class="kanban-card">

                        <div class="card-top">
                            <h5>PED-<%# Eval("IdPedido") %></h5>
                            <span class="priority medium">Normal</span>
                        </div>

                        <p><%# Eval("TipoTrabajo") %></p>

                        <span class="client-name">
                            <%# Eval("NombreCliente") %>
                        </span>

                        <div class="pedido-total">
                            L. <%# Convert.ToDecimal(Eval("Total")).ToString("N2") %>
                        </div>

                        <div class="card-footer">
                            Entrega:
                            <%# Convert.ToDateTime(Eval("FechaEntrega")).ToString("dd/MM/yyyy") %>
                        </div>

                        <div class="progress-bar-kanban">
                            <div class="progress-fill-kanban" style="width:80%"></div>
                        </div>

                        <a href='DetallePedido.aspx?id=<%# Eval("IdPedido") %>'
                           class="btn-detalle">
                            Ver Detalle
                        </a>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>

        <!-- FINALIZADO -->
        <div class="kanban-column">

            <div class="kanban-header completed">
                Finalizado
                (<asp:Label ID="lblFinalizado" runat="server" Text="0" />)
            </div>

            <asp:Repeater ID="rptFinalizado" runat="server">

                <ItemTemplate>

                    <div class="kanban-card">

                        <div class="card-top">
                            <h5>PED-<%# Eval("IdPedido") %></h5>
                            <span class="priority low">Completado</span>
                        </div>

                        <p><%# Eval("TipoTrabajo") %></p>

                        <span class="client-name">
                            <%# Eval("NombreCliente") %>
                        </span>

                        <div class="pedido-total">
                            L. <%# Convert.ToDecimal(Eval("Total")).ToString("N2") %>
                        </div>

                        <div class="card-footer">
                            Entrega:
                            <%# Convert.ToDateTime(Eval("FechaEntrega")).ToString("dd/MM/yyyy") %>
                        </div>

                        <div class="progress-bar-kanban">
                            <div class="progress-fill-kanban" style="width:100%"></div>
                        </div>

                        <a href='DetallePedido.aspx?id=<%# Eval("IdPedido") %>'
                           class="btn-detalle">
                            Ver Detalle
                        </a>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>

    </div>

</div>

</asp:Content>