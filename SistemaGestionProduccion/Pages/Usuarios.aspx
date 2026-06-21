<%@ Page Title="Usuarios" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Usuarios.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid">

<!-- Encabezado -->
<div class="d-flex justify-content-between align-items-center mb-4">
    <div>
        <h1 class="fw-bold">Gestión de Usuarios</h1>
        <p class="text-muted mb-0">
            Administración de accesos y permisos del sistema
        </p>
    </div>

    <asp:HyperLink
    ID="btnNuevoUsuario"
    runat="server"
    NavigateUrl="~/Pages/NuevoUsuario.aspx"
    CssClass="btn btn-primary">

    <i class="fas fa-user-plus me-2"></i>
    Nuevo Usuario

</asp:HyperLink>
</div>

<!-- KPIs -->
<div class="row mb-4">

    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <h6 class="text-muted">Usuarios Totales</h6>
                <h2 class="fw-bold text-success">
    <asp:Label
        ID="lblActivos"
        runat="server"
        Text="0" />
</h2>
                <small class="text-muted">Registrados</small>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <h6 class="text-muted">Administradores</h6>
                <h2 class="fw-bold text-danger">
    <asp:Label
        ID="lblAdministradores"
        runat="server"
        Text="0" />
</h2>
                <small class="text-muted">Acceso completo</small>
            </div>
        </div>
    </div>

    <div class="col-md-3">
    <div class="card border-0 shadow-sm">
        <div class="card-body">
            <h6 class="text-muted">Usuarios Totales</h6>
<h2 class="fw-bold text-success">
    <asp:Label
        ID="lblTotalUsuarios"
        runat="server"
        Text="0" />
</h2>

<small class="text-muted">
    Habilitados en el sistema
</small>
        </div>
    </div>
</div>

    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <h6 class="text-muted">Roles</h6>
                <h2 class="fw-bold text-warning">
    <asp:Label
        ID="lblRoles"
        runat="server"
        Text="0" />
</h2>
                <small class="text-muted">Configurados</small>
            </div>
        </div>
    </div>

</div>

<!-- Tabla -->
<div class="card border-0 shadow-sm">

    <div class="card-header bg-white">

        <div class="row align-items-center">

            <div class="col-md-6">
                <h5 class="fw-bold mb-0">
                    Usuarios del Sistema
                </h5>
            </div>

            <div class="col-md-6">
                <input type="text"
                       class="form-control"
                       placeholder="Buscar usuario..." />
            </div>

        </div>

    </div>

    <div class="card-body">

        <div class="table-responsive">

            <table class="table table-hover align-middle">

                <thead class="table-light">

                    <tr>
                        <th>Usuario</th>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Rol</th>
                        <th>Estado</th>
                        <th>Último Acceso</th>
                        <th>Acciones</th>
                    </tr>

                </thead>

                <tbody>

<asp:Repeater
    ID="rptUsuarios"
    runat="server">

<ItemTemplate>

<tr>

    <td>
        <%# Eval("UsuarioLogin") %>
    </td>

    <td>
        <%# Eval("Nombre") %>
    </td>

    <td>
        <%# Eval("Correo") %>
    </td>

    <td>

        <span class='badge <%# ObtenerClaseRol(Eval("Rol").ToString()) %>'>

            <%# Eval("Rol") %>

        </span>

    </td>

    <td>

        <span class='badge <%# Convert.ToBoolean(Eval("Estado")) ? "bg-success" : "bg-secondary" %>'>

            <%# Convert.ToBoolean(Eval("Estado")) ? "Activo" : "Inactivo" %>

        </span>

    </td>

    <td>
        Sistema
    </td>

    <td>

        <a href='EditarUsuario.aspx?id=<%# Eval("IdUsuario") %>'
   class="btn btn-sm btn-outline-primary">

    Editar

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

.btn{
    border-radius:10px;
}

.badge{
    padding:8px 12px;
    font-size:12px;
}

.table th{
    font-weight:600;
}

.table tbody tr:hover{
    background:#f8fafc;
}

</style>

</asp:Content>
