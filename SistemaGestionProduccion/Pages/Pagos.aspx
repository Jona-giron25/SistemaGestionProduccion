<%@ Page Title="Pagos" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Pagos.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.Pagos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid">

```
<!-- Encabezado -->
<div class="d-flex justify-content-between align-items-center mb-4">
    <div>
        <h1 class="fw-bold">Gestión de Pagos</h1>
        <p class="text-muted mb-0">
            Control financiero y seguimiento de cobros
        </p>
    </div>

    <button class="btn btn-success">
        <i class="fas fa-plus me-2"></i>
        Registrar Pago
    </button>
</div>

<!-- KPIs -->
<div class="row mb-4">

    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <h6 class="text-muted">Ingresos del Mes</h6>
                <h2 class="fw-bold text-success">L 245,000</h2>
                <small class="text-muted">Pagos recibidos</small>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <h6 class="text-muted">Pendiente de Cobro</h6>
                <h2 class="fw-bold text-danger">L 85,000</h2>
                <small class="text-muted">Saldo pendiente</small>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <h6 class="text-muted">Pedidos Pagados</h6>
                <h2 class="fw-bold text-primary">42</h2>
                <small class="text-muted">Completados</small>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <h6 class="text-muted">Anticipos</h6>
                <h2 class="fw-bold text-warning">18</h2>
                <small class="text-muted">En proceso</small>
            </div>
        </div>
    </div>

</div>

<div class="row">

    <!-- Tabla Principal -->
    <div class="col-lg-9">

        <div class="card border-0 shadow-sm">

            <div class="card-header bg-white">
                <div class="d-flex justify-content-between align-items-center">
                    <h5 class="fw-bold mb-0">Estado de Pagos</h5>

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

                            <tr>
                                <td>PED-001</td>
                                <td>CEUTEC</td>
                                <td>L 15,000</td>
                                <td>L 15,000</td>
                                <td>L 0</td>

                                <td>
                                    <span class="badge bg-success">
                                        Pagado
                                    </span>
                                </td>

                                <td>
                                    <button class="btn btn-sm btn-outline-primary">
                                        Ver
                                    </button>
                                </td>
                            </tr>

                            <tr>
                                <td>PED-002</td>
                                <td>UNAH</td>
                                <td>L 25,000</td>
                                <td>L 10,000</td>
                                <td>L 15,000</td>

                                <td>
                                    <span class="badge bg-warning text-dark">
                                        Anticipo
                                    </span>
                                </td>

                                <td>
                                    <button class="btn btn-sm btn-outline-primary">
                                        Ver
                                    </button>
                                </td>
                            </tr>

                            <tr>
                                <td>PED-003</td>
                                <td>Banco Atlántida</td>
                                <td>L 42,000</td>
                                <td>L 0</td>
                                <td>L 42,000</td>

                                <td>
                                    <span class="badge bg-danger">
                                        Pendiente
                                    </span>
                                </td>

                                <td>
                                    <button class="btn btn-sm btn-outline-primary">
                                        Ver
                                    </button>
                                </td>
                            </tr>

                            <tr>
                                <td>PED-004</td>
                                <td>Promerica</td>
                                <td>L 18,500</td>
                                <td>L 18,500</td>
                                <td>L 0</td>

                                <td>
                                    <span class="badge bg-success">
                                        Pagado
                                    </span>
                                </td>

                                <td>
                                    <button class="btn btn-sm btn-outline-primary">
                                        Ver
                                    </button>
                                </td>
                            </tr>

                        </tbody>

                    </table>

                </div>

            </div>

        </div>

    </div>

    <!-- Panel Derecho -->
    <div class="col-lg-3">

        <div class="card border-0 shadow-sm mb-4">

            <div class="card-header bg-white">
                <h5 class="fw-bold mb-0">
                    Resumen Financiero
                </h5>
            </div>

            <div class="card-body">

                <div class="mb-3">
                    <small class="text-muted">
                        Cobrado
                    </small>

                    <div class="progress mt-1">
                        <div class="progress-bar bg-success"
                             style="width:75%">
                            75%
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <small class="text-muted">
                        Pendiente
                    </small>

                    <div class="progress mt-1">
                        <div class="progress-bar bg-danger"
                             style="width:25%">
                            25%
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <div class="card border-0 shadow-sm">

            <div class="card-header bg-white">
                <h5 class="fw-bold mb-0">
                    Últimos Pagos
                </h5>
            </div>

            <div class="card-body">

                <div class="payment-item">
                    <strong>CEUTEC</strong><br />
                    L 15,000<br />
                    <small>Hace 1 hora</small>
                </div>

                <hr />

                <div class="payment-item">
                    <strong>Promerica</strong><br />
                    L 18,500<br />
                    <small>Hoy</small>
                </div>

                <hr />

                <div class="payment-item">
                    <strong>Diunsa</strong><br />
                    L 22,000<br />
                    <small>Ayer</small>
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

</style>

</asp:Content>
