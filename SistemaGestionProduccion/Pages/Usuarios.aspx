<%@ Page Title="Usuarios" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Usuarios.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid">

```
<!-- Encabezado -->
<div class="d-flex justify-content-between align-items-center mb-4">
    <div>
        <h1 class="fw-bold">Gestión de Usuarios</h1>
        <p class="text-muted mb-0">
            Administración de accesos y permisos del sistema
        </p>
    </div>

    <button class="btn btn-primary">
        <i class="fas fa-user-plus me-2"></i>
        Nuevo Usuario
    </button>
</div>

<!-- KPIs -->
<div class="row mb-4">

    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <h6 class="text-muted">Usuarios Totales</h6>
                <h2 class="fw-bold text-primary">15</h2>
                <small class="text-muted">Registrados</small>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <h6 class="text-muted">Administradores</h6>
                <h2 class="fw-bold text-danger">2</h2>
                <small class="text-muted">Acceso completo</small>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <h6 class="text-muted">Usuarios Activos</h6>
                <h2 class="fw-bold text-success">13</h2>
                <small class="text-muted">Conectados recientemente</small>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <h6 class="text-muted">Roles</h6>
                <h2 class="fw-bold text-warning">5</h2>
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

                    <tr>
                        <td>admin</td>
                        <td>César Girón</td>
                        <td>admin@brandsolutions.com</td>

                        <td>
                            <span class="badge bg-danger">
                                Administrador
                            </span>
                        </td>

                        <td>
                            <span class="badge bg-success">
                                Activo
                            </span>
                        </td>

                        <td>Hoy 08:15 AM</td>

                        <td>
                            <button class="btn btn-sm btn-outline-primary">
                                Editar
                            </button>

                            <button class="btn btn-sm btn-outline-danger">
                                Bloquear
                            </button>
                        </td>
                    </tr>

                    <tr>
                        <td>diseno01</td>
                        <td>Ana López</td>
                        <td>diseno@brandsolutions.com</td>

                        <td>
                            <span class="badge bg-primary">
                                Diseño
                            </span>
                        </td>

                        <td>
                            <span class="badge bg-success">
                                Activo
                            </span>
                        </td>

                        <td>Ayer</td>

                        <td>
                            <button class="btn btn-sm btn-outline-primary">
                                Editar
                            </button>

                            <button class="btn btn-sm btn-outline-danger">
                                Bloquear
                            </button>
                        </td>
                    </tr>

                    <tr>
                        <td>produccion01</td>
                        <td>Carlos Mejía</td>
                        <td>produccion@brandsolutions.com</td>

                        <td>
                            <span class="badge bg-warning text-dark">
                                Producción
                            </span>
                        </td>

                        <td>
                            <span class="badge bg-success">
                                Activo
                            </span>
                        </td>

                        <td>Hoy 07:30 AM</td>

                        <td>
                            <button class="btn btn-sm btn-outline-primary">
                                Editar
                            </button>

                            <button class="btn btn-sm btn-outline-danger">
                                Bloquear
                            </button>
                        </td>
                    </tr>

                    <tr>
                        <td>ventas01</td>
                        <td>María Flores</td>
                        <td>ventas@brandsolutions.com</td>

                        <td>
                            <span class="badge bg-info">
                                Ventas
                            </span>
                        </td>

                        <td>
                            <span class="badge bg-secondary">
                                Inactivo
                            </span>
                        </td>

                        <td>Hace 3 días</td>

                        <td>
                            <button class="btn btn-sm btn-outline-primary">
                                Editar
                            </button>

                            <button class="btn btn-sm btn-outline-success">
                                Activar
                            </button>
                        </td>
                    </tr>

                </tbody>

            </table>

        </div>

    </div>

</div>
```

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
