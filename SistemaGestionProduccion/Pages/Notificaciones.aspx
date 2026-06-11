<%@ Page Title="Notificaciones" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Notificaciones.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.Notificaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid">

```
<!-- Encabezado -->
<div class="d-flex justify-content-between align-items-center mb-4">

    <div>
        <h1 class="fw-bold">Centro de Notificaciones</h1>
        <p class="text-muted mb-0">
            Actividad reciente y eventos importantes del sistema
        </p>
    </div>

    <button class="btn btn-primary">
        <i class="fas fa-check-double me-2"></i>
        Marcar Todo como Leído
    </button>

</div>

<!-- KPIs -->
<div class="row mb-4">

    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <h6 class="text-muted">Sin Leer</h6>
                <h2 class="fw-bold text-danger">12</h2>
                <small class="text-muted">Pendientes</small>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <h6 class="text-muted">Pedidos</h6>
                <h2 class="fw-bold text-primary">8</h2>
                <small class="text-muted">Actualizaciones</small>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <h6 class="text-muted">Pagos</h6>
                <h2 class="fw-bold text-success">3</h2>
                <small class="text-muted">Confirmados</small>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <h6 class="text-muted">Urgentes</h6>
                <h2 class="fw-bold text-warning">4</h2>
                <small class="text-muted">Requieren atención</small>
            </div>
        </div>
    </div>

</div>

<div class="row">

    <!-- Lista Principal -->
    <div class="col-lg-8">

        <div class="card border-0 shadow-sm">

            <div class="card-header bg-white">
                <h5 class="fw-bold mb-0">
                    Actividad Reciente
                </h5>
            </div>

            <div class="card-body">

                <div class="notification-item notification-primary">
                    <div class="icon">
                        <i class="fas fa-file-alt"></i>
                    </div>

                    <div>
                        <strong>Nuevo Pedido Registrado</strong>
                        <p class="mb-1">
                            Se creó el pedido PED-025 para CEUTEC.
                        </p>
                        <small class="text-muted">
                            Hace 5 minutos
                        </small>
                    </div>
                </div>

                <div class="notification-item notification-success">
                    <div class="icon">
                        <i class="fas fa-money-bill-wave"></i>
                    </div>

                    <div>
                        <strong>Pago Confirmado</strong>
                        <p class="mb-1">
                            Promerica realizó un pago de L 18,500.
                        </p>
                        <small class="text-muted">
                            Hace 20 minutos
                        </small>
                    </div>
                </div>

                <div class="notification-item notification-warning">
                    <div class="icon">
                        <i class="fas fa-palette"></i>
                    </div>

                    <div>
                        <strong>Diseño Aprobado</strong>
                        <p class="mb-1">
                            El pedido PED-018 pasó a Producción.
                        </p>
                        <small class="text-muted">
                            Hace 1 hora
                        </small>
                    </div>
                </div>

                <div class="notification-item notification-danger">
                    <div class="icon">
                        <i class="fas fa-exclamation-triangle"></i>
                    </div>

                    <div>
                        <strong>Entrega Próxima</strong>
                        <p class="mb-1">
                            El pedido PED-012 debe entregarse mañana.
                        </p>
                        <small class="text-muted">
                            Hace 2 horas
                        </small>
                    </div>
                </div>

                <div class="notification-item notification-info">
                    <div class="icon">
                        <i class="fas fa-cogs"></i>
                    </div>

                    <div>
                        <strong>Producción Finalizada</strong>
                        <p class="mb-1">
                            PED-020 está listo para entrega.
                        </p>
                        <small class="text-muted">
                            Hoy
                        </small>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Panel Derecho -->
    <div class="col-lg-4">

        <div class="card border-0 shadow-sm mb-4">

            <div class="card-header bg-white">
                <h5 class="fw-bold mb-0">
                    Resumen del Día
                </h5>
            </div>

            <div class="card-body">

                <div class="summary-item">
                    <span>Pedidos Nuevos</span>
                    <strong>6</strong>
                </div>

                <div class="summary-item">
                    <span>Diseños Aprobados</span>
                    <strong>4</strong>
                </div>

                <div class="summary-item">
                    <span>Pagos Recibidos</span>
                    <strong>3</strong>
                </div>

                <div class="summary-item">
                    <span>Entregas</span>
                    <strong>5</strong>
                </div>

            </div>

        </div>

        <div class="card border-0 shadow-sm">

            <div class="card-header bg-white">
                <h5 class="fw-bold mb-0">
                    Prioridades
                </h5>
            </div>

            <div class="card-body">

                <div class="alert alert-danger">
                    PED-012 - Entrega Mañana
                </div>

                <div class="alert alert-warning">
                    4 Diseños Pendientes
                </div>

                <div class="alert alert-info">
                    Revisión de Producción
                </div>

            </div>

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

.notification-item{
    display:flex;
    gap:15px;
    padding:18px;
    border-radius:12px;
    margin-bottom:15px;
    border-left:5px solid;
}

.notification-primary{
    background:#eef4ff;
    border-color:#0d6efd;
}

.notification-success{
    background:#eefbf3;
    border-color:#198754;
}

.notification-warning{
    background:#fff8e6;
    border-color:#ffc107;
}

.notification-danger{
    background:#fff0f0;
    border-color:#dc3545;
}

.notification-info{
    background:#eef8ff;
    border-color:#0dcaf0;
}

.icon{
    font-size:22px;
    width:35px;
}

.summary-item{
    display:flex;
    justify-content:space-between;
    padding:12px 0;
    border-bottom:1px solid #eee;
}

.summary-item:last-child{
    border-bottom:none;
}

</style>

</asp:Content>
