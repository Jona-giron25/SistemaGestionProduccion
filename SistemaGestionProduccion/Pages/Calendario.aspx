<%@ Page Title="Calendario" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Calendario.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.Calendario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid">

    <!-- ENCABEZADO -->
    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>
            <h1 class="fw-bold">Calendario General</h1>
            <p class="text-muted mb-0">
                Gestión de entregas y planificación de producción
            </p>
        </div>

    </div>

    <!-- KPIs -->
    <div class="row mb-4">

        <div class="col-md-3">

            <div class="card shadow-sm border-0">

                <div class="card-body">

                    <h6 class="text-muted">
                        Eventos Hoy
                    </h6>

                    <h2 class="fw-bold text-primary">

                        <asp:Label
                            ID="lblEventosHoy"
                            runat="server"
                            Text="0" />

                    </h2>

                    <small class="text-muted">
                        Entregas programadas
                    </small>

                </div>

            </div>

        </div>

        <div class="col-md-3">

            <div class="card shadow-sm border-0">

                <div class="card-body">

                    <h6 class="text-muted">
                        Producción
                    </h6>

                    <h2 class="fw-bold text-warning">

                        <asp:Label
                            ID="lblProduccion"
                            runat="server"
                            Text="0" />

                    </h2>

                    <small class="text-muted">
                        Pedidos activos
                    </small>

                </div>

            </div>

        </div>

        <div class="col-md-3">

            <div class="card shadow-sm border-0">

                <div class="card-body">

                    <h6 class="text-muted">
                        Entregas
                    </h6>

                    <h2 class="fw-bold text-success">

                        <asp:Label
                            ID="lblEntregas"
                            runat="server"
                            Text="0" />

                    </h2>

                    <small class="text-muted">
                        Pendientes
                    </small>

                </div>

            </div>

        </div>

        <div class="col-md-3">

            <div class="card shadow-sm border-0">

                <div class="card-body">

                    <h6 class="text-muted">
                        Urgentes
                    </h6>

                    <h2 class="fw-bold text-danger">

                        <asp:Label
                            ID="lblUrgentes"
                            runat="server"
                            Text="0" />

                    </h2>

                    <small class="text-muted">
                        Próximos 3 días
                    </small>

                </div>

            </div>

        </div>

    </div>
    <div class="row">

    <!-- CALENDARIO -->
    <div class="col-lg-8">

        <div class="card border-0 shadow-sm mb-4">

            <div class="card-header bg-white">
                <div class="d-flex justify-content-between align-items-center">

                    <h5 class="fw-bold mb-0">
                        <asp:Label ID="lblMesActual"
    runat="server" />
                    </h5>

                    <div>
                        <asp:LinkButton ID="btnAnterior"
    runat="server"
    CssClass="btn btn-outline-secondary btn-sm"
    OnClick="btnAnterior_Click">
    <i class="fas fa-chevron-left"></i>
</asp:LinkButton>

<asp:LinkButton ID="btnSiguiente"
    runat="server"
    CssClass="btn btn-outline-secondary btn-sm"
    OnClick="btnSiguiente_Click">
    <i class="fas fa-chevron-right"></i>
</asp:LinkButton>
                    </div>

                </div>
            </div>

            <div class="card-body">

                <div class="calendar-container">
    <asp:Literal ID="litCalendario" runat="server"></asp:Literal>
</div>

            </div>

        </div>

    </div>

    <!-- PANEL DERECHO -->
    <div class="col-lg-4">

        <div class="card border-0 shadow-sm">

            <div class="card-header bg-white">
                <h5 class="fw-bold mb-0">
                    Próximas Entregas
                </h5>
            </div>

            <div class="card-body">

                <asp:Repeater ID="rptEntregas" runat="server">

    <ItemTemplate>

        <div class="activity-card">

            <a href='DetallePedido.aspx?id=<%# Eval("IdPedido") %>'
               class="text-decoration-none">

                <div class="fw-bold text-primary">
                    PED-<%# Eval("IdPedido") %>
                </div>

            </a>

            <div>
                <%# Eval("NombreCliente") %>
            </div>

            <small class="text-muted">
                <%# Convert.ToDateTime(Eval("FechaEntrega")).ToString("dd/MM/yyyy") %>
            </small>

        </div>

    </ItemTemplate>

</asp:Repeater>

            </div>

        </div>

    </div>

</div>

    <!-- TABLA DE ENTREGAS -->
    <div class="row">

        <div class="col-lg-8">

            <div class="card border-0 shadow-sm">

                <div class="card-header bg-white">

                    <h5 class="fw-bold mb-0">
                        Próximas Entregas
                    </h5>

                </div>

                <div class="card-body">

                    <asp:GridView
                        ID="gvCalendario"
                        runat="server"
                        CssClass="table table-hover"
                        AutoGenerateColumns="False"
                        GridLines="None">

                        <Columns>

                            <asp:BoundField
                                DataField="IdPedido"
                                HeaderText="Pedido" />

                            <asp:BoundField
                                DataField="NombreCliente"
                                HeaderText="Cliente" />

                            <asp:BoundField
                                DataField="TipoTrabajo"
                                HeaderText="Trabajo" />

                            <asp:BoundField
                                DataField="Estado"
                                HeaderText="Estado" />

                            <asp:BoundField
                                DataField="FechaEntrega"
                                HeaderText="Entrega"
                                DataFormatString="{0:dd/MM/yyyy}" />

                        </Columns>

                    </asp:GridView>

                </div>

            </div>

        </div>

    </div>

</div>

<style>

.card{
    border-radius:15px;
}

.table th{
    font-weight:600;
}

.alert{
    border-radius:12px;
}
.calendar-table td {
    height: 120px;
    width: 14%;
    vertical-align: top;
    padding: 8px;
}

.calendar-table td:hover {
    background: #f8fafc;
    transition: .3s;
}

.event-design {
    background: #dbeafe;
    color: #1d4ed8;
    padding: 4px 8px;
    border-radius: 8px;
    margin-top: 5px;
    font-size: 12px;
}

.event-production {
    background: #fef3c7;
    color: #b45309;
    padding: 4px 8px;
    border-radius: 8px;
    margin-top: 5px;
    font-size: 12px;
}

.event-delivery {
    background: #dcfce7;
    color: #15803d;
    padding: 4px 8px;
    border-radius: 8px;
    margin-top: 5px;
    font-size: 12px;
}

.event-urgent {
    background: #fee2e2;
    color: #dc2626;
    padding: 4px 8px;
    border-radius: 8px;
    margin-top: 5px;
    font-size: 12px;
}

.activity-card {
    background: #f8fafc;
    border-radius: 12px;
    padding: 12px;
    margin-bottom: 12px;
    border-left: 4px solid #2563eb;
}
.calendar-table td{
    height:95px;
    vertical-align:top;
}

.calendar-table strong{
    display:block;
    margin-bottom:8px;
    font-size:18px;
}

.event-design,
.event-production,
.event-delivery,
.event-urgent{
    margin-bottom:5px;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
.event-design,
.event-production,
.event-delivery{
    padding:6px;
    margin-top:4px;
    font-size:11px;
}
.event-design,
.event-production,
.event-delivery{
    cursor:pointer;
    transition:.2s;
}
.event-design:hover,
.event-production:hover,
.event-delivery:hover{
    transform:scale(1.04);
    opacity:.9;
}
.calendar-table {
    table-layout: fixed;
}

.calendar-table td {
    height: 110px;
    vertical-align: top;
    position: relative;
}

.calendar-table strong {
    display: block;
    margin-bottom: 6px;
    font-size: 18px;
}

.event-design,
.event-production,
.event-delivery {
    display: block;
    text-decoration: none;
    padding: 6px;
    margin-top: 4px;
    border-radius: 10px;
    font-size: 11px;
    font-weight: 600;
    transition: .2s;
}

.event-design:hover,
.event-production:hover,
.event-delivery:hover {
    transform: translateY(-2px);
    opacity: .9;
}

.activity-card {
    background: #f8fafc;
    border-left: 4px solid #2563eb;
    border-radius: 12px;
    padding: 14px;
    margin-bottom: 12px;
    transition: .2s;
}

.activity-card:hover {
    background: #eef4ff;
}
.calendar-today{
    background:#eff6ff !important;
    border:2px solid #2563eb !important;
}

.calendar-table td{
    height:110px;
    vertical-align:top;
    position:relative;
}

.calendar-table strong{
    display:block;
    margin-bottom:6px;
}

.event-design,
.event-production,
.event-delivery{
    display:block;
    margin-top:5px;
    padding:8px;
    border-radius:10px;
    text-decoration:none !important;
    transition:.2s;
}

.event-design:hover,
.event-production:hover,
.event-delivery:hover{
    transform:translateY(-2px);
    opacity:.95;
}

.event-design small,
.event-production small,
.event-delivery small{
    display:block;
    margin-top:4px;
    font-size:11px;
}

</style>

</asp:Content>