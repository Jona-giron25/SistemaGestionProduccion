<%@ Page Title="Pagos" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Pagos.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.Pagos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid">

    <!-- Encabezado -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h1 class="fw-bold">Gestión de Pagos</h1>
            <p class="text-muted mb-0">
                Control financiero y seguimiento de cobros
            </p>
        </div>
    </div>

    <!-- KPIs -->
    <div class="row mb-4">

        <div class="col-md-3">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <h6 class="text-muted">Ingresos Totales</h6>

                    <h2 class="fw-bold text-success">
                        L.
                        <asp:Label ID="lblIngresos"
                            runat="server"
                            Text="0.00" />
                    </h2>

                    <small class="text-muted">
                        Pagos recibidos
                    </small>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <h6 class="text-muted">Pendiente de Cobro</h6>

                    <h2 class="fw-bold text-danger">
                        L.
                        <asp:Label ID="lblPendiente"
                            runat="server"
                            Text="0.00" />
                    </h2>

                    <small class="text-muted">
                        Saldo pendiente
                    </small>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <h6 class="text-muted">Pedidos Pagados</h6>

                    <h2 class="fw-bold text-primary">
                        <asp:Label ID="lblPagados"
                            runat="server"
                            Text="0" />
                    </h2>

                    <small class="text-muted">
                        Completados
                    </small>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <h6 class="text-muted">Anticipos</h6>

                    <h2 class="fw-bold text-warning">
                        <asp:Label ID="lblAnticipos"
                            runat="server"
                            Text="0" />
                    </h2>

                    <small class="text-muted">
                        En proceso
                    </small>
                </div>
            </div>
        </div>

    </div>
            <!-- Panel Pagos -->
        
       <div class="card border-0 shadow-sm mb-4">

    <div class="card-header bg-white">
        <h5 class="fw-bold mb-0">
            Registrar Pago
        </h5>
    </div>

    <div class="card-body">

        <div class="row g-3">

            <div class="col-md-4">
                <label class="form-label">Pedido</label>

                <asp:DropDownList
    ID="ddlPedido"
    runat="server"
    CssClass="form-select"
    AutoPostBack="true"
    OnSelectedIndexChanged="ddlPedido_SelectedIndexChanged">
</asp:DropDownList>
            </div>

            <div class="col-md-2">
                <label class="form-label">Tipo Pago</label>

                <asp:DropDownList
                    ID="ddlTipoPago"
                    runat="server"
                    CssClass="form-select">

                    <asp:ListItem Text="Anticipo" />
                    <asp:ListItem Text="Pago Final" />

                </asp:DropDownList>
            </div>

            <div class="col-md-2">
                <label class="form-label">Monto</label>

                <asp:TextBox
                    ID="txtMonto"
                    runat="server"
                    CssClass="form-control pago-input"
                    TextMode="Number">
                </asp:TextBox>
            </div>

            <div class="col-md-2">
                <label class="form-label">Saldo</label>

                <asp:TextBox
                    ID="txtSaldo"
                    runat="server"
                    CssClass="form-control"
                    ReadOnly="true">
                </asp:TextBox>
            </div>

            <div class="col-md-2 d-flex align-items-end">

                <asp:Button
                    ID="btnGuardarPago"
                    runat="server"
                    Text="Guardar"
                    CssClass="btn btn-success w-100"
                    OnClick="btnGuardarPago_Click" />

            </div>

        </div>

        <hr />

        <div class="row text-center">

            <div class="col-md-4">
                <div class="border rounded p-3 bg-light">
                    <small class="text-muted">Total Pedido</small>
                    <h5 class="mb-0">
                        <asp:Label ID="lblTotalPedido"
                            runat="server"
                            Text="L. 0.00" />
                    </h5>
                </div>
            </div>

            <div class="col-md-4">
                <div class="border rounded p-3 bg-light">
                    <small class="text-muted">Pagado</small>
                    <h5 class="mb-0 text-success">
                        <asp:Label ID="lblPagadoPedido"
                            runat="server"
                            Text="L. 0.00" />
                    </h5>
                </div>
            </div>

            <div class="col-md-4">
                <div class="border rounded p-3 bg-light">
                    <small class="text-muted">Pendiente</small>
                    <h5 class="mb-0 text-danger">
                        <asp:Label ID="lblPendientePedido"
                            runat="server"
                            Text="L. 0.00" />
                    </h5>
                </div>
            </div>

        </div>

    </div>

</div>

        <!-- Tabla Principal -->
       <div class="card border-0 shadow-sm">

                <div class="card-header bg-white">
                    <div class="d-flex justify-content-between align-items-center">

                        <h5 class="fw-bold mb-0">
                            Estado de Pagos
                        </h5>

                        <input type="text"
                            class="form-control w-25"
                            placeholder="Buscar pedido..." />

                    </div>
                </div>

                <div class="card-body">

                    <div class="table-responsive">

                        <table class="table table-hover align-middle">

                            <thead class="table-light">

                                <tr>
                                    <th>Pedido</th>
                                    <th>Cliente</th>
                                    <th>Total</th>
                                    <th>Pagado</th>
                                    <th>Saldo</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>

                            </thead>

                            <tbody>

                                <asp:Repeater ID="rptPagos" runat="server">

                                    <ItemTemplate>

                                        <tr>

                                            <td>
                                                PED-<%# String.Format("{0:D3}", Eval("IdPedido")) %>
                                            </td>

                                            <td>
                                                <%# Eval("Cliente") %>
                                            </td>

                                            <td>
                                                L. <%# Convert.ToDecimal(Eval("Total")).ToString("N2") %>
                                            </td>

                                            <td>
                                                L. <%# Convert.ToDecimal(Eval("Pagado")).ToString("N2") %>
                                            </td>

                                            <td>
                                                L. <%# Convert.ToDecimal(Eval("Saldo")).ToString("N2") %>
                                            </td>

                                            <td>

                                                <span class='<%# ObtenerClaseEstado(Eval("EstadoPago").ToString()) %>'>

                                                    <%# Eval("EstadoPago") %>

                                                </span>

                                            </td>

                                            <td>

                                                <a href='DetallePedido.aspx?id=<%# Eval("IdPedido") %>'
                                                    class="btn btn-sm btn-outline-primary">

                                                    Ver

                                                </a>

                                            </td>

                                            <td>
       <a href='HistorialPagos.aspx?id=<%# Eval("IdPedido") %>'
       class="btn btn-sm btn-outline-success">
        Pagos
    </a>
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

<style>

.card{
    border-radius:15px;
}

.table th{
    font-weight:600;
}

.payment-item{
    line-height:1.8;
}

.progress{
    height:20px;
    border-radius:10px;
}

.btn{
    border-radius:10px;
}

.badge{
    font-size:12px;
    padding:8px 12px;
}
.form-select,
.form-control,
.pago-input{
    height:55px !important;
    border-radius:12px;
}

.btn-success{
    height:55px;
}
.pago-input,
.form-control,
.form-select{
    height:55px;
    border-radius:12px;
}

.border.rounded{
    min-height:85px;
}
</style>

</asp:Content>