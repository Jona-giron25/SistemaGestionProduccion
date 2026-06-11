<%@ Page Title="Clientes"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Clientes.aspx.cs"
    Inherits="SistemaGestionProduccion.Pages.Clientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">

        <!-- Encabezado -->
        <div class="d-flex justify-content-between align-items-center mb-4">

            <div>
                <h1 class="fw-bold">Gestión de Clientes</h1>
                <p class="text-muted mb-0">
                    Administración y seguimiento de clientes registrados
                </p>
            </div>

            <asp:Button
    ID="btnMostrarFormulario"
    runat="server"
    Text="+ Nuevo Cliente"
    CssClass="btn btn-primary"
    OnClick="btnMostrarFormulario_Click" />

        </div>
        <asp:Panel
    ID="pnlNuevoCliente"
    runat="server"
    Visible="false">

    <div class="card border-0 shadow-sm mb-4">

        <div class="card-header bg-primary text-white">
            Nuevo Cliente
        </div>

        <div class="card-body">

            <div class="row">

                <div class="col-md-6 mb-3">
                    <label>Nombre</label>
                    <asp:TextBox
                        ID="txtNombre"
                        runat="server"
                        CssClass="form-control" />
                </div>
                                    <asp:HiddenField
    ID="hfIdCliente"
    runat="server" />
<div class="col-md-6 mb-3">
    <label>RTN</label>

    <asp:TextBox
        ID="txtRTN"
        runat="server"
        CssClass="form-control" />
</div>

                <div class="col-md-6 mb-3">
                    <label>Teléfono</label>
                    <asp:TextBox
                        ID="txtTelefono"
                        runat="server"
                        CssClass="form-control" />
                </div>

                <div class="col-md-6 mb-3">
                    <label>Correo</label>
                    <asp:TextBox
                        ID="txtCorreo"
                        runat="server"
                        CssClass="form-control" />
                </div>

                <div class="col-md-6 mb-3">
                    <label>Dirección</label>
                    <asp:TextBox
                        ID="txtDireccion"
                        runat="server"
                        CssClass="form-control" />
                </div>

            </div>

            <asp:Button
    ID="btnGuardar"
    runat="server"
    Text="Guardar Cliente"
    CssClass="btn btn-success"
    OnClick="btnGuardar_Click" />

        </div>

    </div>

</asp:Panel>
        <!-- KPIs -->
        <div class="row mb-4">

            <div class="col-md-3">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <h6 class="text-muted">Clientes Totales</h6>
                        <h2 class="fw-bold text-primary">
    <asp:Label
        ID="lblTotalClientes"
        runat="server"
        Text="0">
    </asp:Label>
</h2>
                        <small class="text-muted">Registrados</small>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <h6 class="text-muted">Clientes Activos</h6>
                        <h2 class="fw-bold text-success">0</h2>
                        <small class="text-muted">Con pedidos recientes</small>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <h6 class="text-muted">Pedidos Asociados</h6>
                        <h2 class="fw-bold text-warning">0</h2>
                        <small class="text-muted">Pedidos registrados</small>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <h6 class="text-muted">Nuevos este Mes</h6>
                        <h2 class="fw-bold text-info">0</h2>
                        <small class="text-muted">Clientes agregados</small>
                    </div>
                </div>
            </div>

        </div>

        <!-- Tabla -->
        <div class="card border-0 shadow-sm">

            <div class="card-header bg-white">

                <div class="row align-items-center">

                    <div class="col-md-6">
                        <h5 class="fw-bold mb-0">Clientes Registrados
                        </h5>
                    </div>

                    <div class="col-md-6">
                        <input type="text"
                            class="form-control"
                            placeholder="Buscar cliente..." />
                    </div>

                </div>

            </div>

            <div class="card-body">

                <div class="table-responsive">

                    <asp:GridView
    ID="gvClientes"
    runat="server"
    CssClass="table table-hover align-middle"
    AutoGenerateColumns="False"
    GridLines="None"
    OnRowCommand="gvClientes_RowCommand">

                        <Columns>

                            <asp:BoundField
                                DataField="IdCliente"
                                HeaderText="ID" />

                            <asp:BoundField
                                DataField="Nombre"
                                HeaderText="Nombre" />
                            <asp:BoundField
    DataField="RTN"
    HeaderText="RTN" />

                            <asp:BoundField
                                DataField="Telefono"
                                HeaderText="Teléfono" />

                            <asp:BoundField
                                DataField="Correo"
                                HeaderText="Correo" />

                            <asp:BoundField
                                DataField="Direccion"
                                HeaderText="Dirección" />

                            <asp:TemplateField HeaderText="Acciones">

    <ItemTemplate>

        <asp:Button
            ID="btnEditar"
            runat="server"
            Text="Editar"
            CssClass="btn btn-sm btn-outline-primary me-2"
            CommandName="Editar"
            CommandArgument='<%# Eval("IdCliente") %>' />

        <asp:Button
            ID="btnEliminar"
            runat="server"
            Text="Eliminar"
            CssClass="btn btn-sm btn-outline-danger"
            CommandName="Eliminar"
            CommandArgument='<%# Eval("IdCliente") %>'
            OnClientClick="return confirm('¿Desea eliminar este cliente?');" />

    </ItemTemplate>

</asp:TemplateField>

                        </Columns>

                        <HeaderStyle CssClass="table-light" />

                    </asp:GridView>

                </div>

            </div>

        </div>

    </div>

    <style>
        .card {
            border-radius: 15px;
        }

        .btn {
            border-radius: 10px;
        }

        .table th {
            font-weight: 600;
        }

        .table tbody tr:hover {
            background: #f8fafc;
        }
    </style>

</asp:Content>
