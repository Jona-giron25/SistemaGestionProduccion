<%@ Page Title="Reportes" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Reportes.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.Reportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid">

```
<!-- Encabezado -->
<div class="d-flex justify-content-between align-items-center mb-4">
    <div>
        <h1 class="fw-bold">Reportes y Estadísticas</h1>
        <p class="text-muted mb-0">
            Indicadores clave del negocio y rendimiento operativo
        </p>
    </div>

    <button class="btn btn-primary">
        <i class="fas fa-file-pdf me-2"></i>
        Exportar Reporte
    </button>
</div>

<!-- KPIs -->
<div class="row mb-4">

    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <h6 class="text-muted">Ventas Totales</h6>
                <h2 class="fw-bold text-success">L 1.2M</h2>
                <small class="text-success">
                    <i class="fas fa-arrow-up"></i> +12%
                </small>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <h6 class="text-muted">Pedidos</h6>
                <h2 class="fw-bold text-primary">154</h2>
                <small class="text-primary">
                    Este mes
                </small>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <h6 class="text-muted">Producción</h6>
                <h2 class="fw-bold text-warning">87%</h2>
                <small class="text-warning">
                    Eficiencia
                </small>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <h6 class="text-muted">Clientes Activos</h6>
                <h2 class="fw-bold text-info">68</h2>
                <small class="text-info">
                    Registrados
                </small>
            </div>
        </div>
    </div>

</div>

<!-- Graficos -->
<div class="row mb-4">

    <div class="col-lg-8">

        <div class="card border-0 shadow-sm">

            <div class="card-header bg-white">
                <h5 class="fw-bold mb-0">
                    Ventas Mensuales
                </h5>
            </div>

            <div class="card-body">

                <div class="mb-3">
                    <label>Enero - L 120,000</label>
                    <div class="progress">
                        <div class="progress-bar bg-primary"
                             style="width:60%">
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label>Febrero - L 145,000</label>
                    <div class="progress">
                        <div class="progress-bar bg-success"
                             style="width:72%">
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label>Marzo - L 180,000</label>
                    <div class="progress">
                        <div class="progress-bar bg-info"
                             style="width:85%">
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label>Abril - L 210,000</label>
                    <div class="progress">
                        <div class="progress-bar bg-warning"
                             style="width:95%">
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label>Mayo - L 230,000</label>
                    <div class="progress">
                        <div class="progress-bar bg-danger"
                             style="width:100%">
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <div class="col-lg-4">

        <div class="card border-0 shadow-sm">

            <div class="card-header bg-white">
                <h5 class="fw-bold mb-0">
                    Estado de Pedidos
                </h5>
            </div>

            <div class="card-body">

                <div class="report-item">
                    <span>Diseño</span>
                    <span class="badge bg-primary">18</span>
                </div>

                <div class="report-item">
                    <span>Producción</span>
                    <span class="badge bg-warning text-dark">24</span>
                </div>

                <div class="report-item">
                    <span>Entrega</span>
                    <span class="badge bg-success">35</span>
                </div>

                <div class="report-item">
                    <span>Finalizados</span>
                    <span class="badge bg-dark">77</span>
                </div>

            </div>

        </div>

    </div>

</div>

<!-- Tablas -->
<div class="row">

    <div class="col-lg-6">

        <div class="card border-0 shadow-sm">

            <div class="card-header bg-white">
                <h5 class="fw-bold mb-0">
                    Clientes Principales
                </h5>
            </div>

            <div class="card-body">

                <table class="table table-hover">

                    <thead>
                        <tr>
                            <th>Cliente</th>
                            <th>Pedidos</th>
                            <th>Ingresos</th>
                        </tr>
                    </thead>

                    <tbody>

                        <tr>
                            <td>CEUTEC</td>
                            <td>24</td>
                            <td>L 250,000</td>
                        </tr>

                        <tr>
                            <td>UNAH</td>
                            <td>18</td>
                            <td>L 180,000</td>
                        </tr>

                        <tr>
                            <td>Banco Atlántida</td>
                            <td>15</td>
                            <td>L 170,000</td>
                        </tr>

                        <tr>
                            <td>Promerica</td>
                            <td>12</td>
                            <td>L 145,000</td>
                        </tr>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

    <div class="col-lg-6">

        <div class="card border-0 shadow-sm">

            <div class="card-header bg-white">
                <h5 class="fw-bold mb-0">
                    Producción por Área
                </h5>
            </div>

            <div class="card-body">

                <div class="mb-3">
                    <label>Diseño Gráfico</label>
                    <div class="progress">
                        <div class="progress-bar bg-primary"
                             style="width:85%">
                            85%
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label>Impresión</label>
                    <div class="progress">
                        <div class="progress-bar bg-success"
                             style="width:92%">
                            92%
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label>Rotulación</label>
                    <div class="progress">
                        <div class="progress-bar bg-warning"
                             style="width:78%">
                            78%
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label>Instalación</label>
                    <div class="progress">
                        <div class="progress-bar bg-danger"
                             style="width:70%">
                            70%
                        </div>
                    </div>
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

.progress{
    height:22px;
    border-radius:12px;
}

.report-item{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:12px 0;
    border-bottom:1px solid #eee;
}

.badge{
    padding:8px 12px;
    font-size:12px;
}

.btn{
    border-radius:10px;
}

</style>

</asp:Content>
