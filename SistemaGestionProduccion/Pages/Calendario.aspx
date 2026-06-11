<%@ Page Title="Calendario" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Calendario.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.Calendario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid">

```
<!-- Encabezado -->
<div class="d-flex justify-content-between align-items-center mb-4">
    <div>
        <h1 class="fw-bold">Calendario General</h1>
        <p class="text-muted mb-0">
            Gestión de actividades, producción y entregas
        </p>
    </div>

    <button class="btn btn-primary">
        <i class="fas fa-plus me-2"></i>
        Nuevo Evento
    </button>
</div>

<!-- KPIs -->
<div class="row mb-4">

    <div class="col-md-3">
        <div class="card shadow-sm border-0">
            <div class="card-body">
                <h6 class="text-muted">Eventos Hoy</h6>
                <h2 class="fw-bold text-primary mb-1">12</h2>
                <small class="text-muted">Actividades programadas</small>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card shadow-sm border-0">
            <div class="card-body">
                <h6 class="text-muted">Producción</h6>
                <h2 class="fw-bold text-warning mb-1">18</h2>
                <small class="text-muted">Pedidos activos</small>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card shadow-sm border-0">
            <div class="card-body">
                <h6 class="text-muted">Entregas</h6>
                <h2 class="fw-bold text-success mb-1">24</h2>
                <small class="text-muted">Programadas</small>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card shadow-sm border-0">
            <div class="card-body">
                <h6 class="text-muted">Urgentes</h6>
                <h2 class="fw-bold text-danger mb-1">7</h2>
                <small class="text-muted">Alta prioridad</small>
            </div>
        </div>
    </div>

</div>

<div class="row">

    <!-- Calendario -->
    <div class="col-lg-9">

        <div class="card border-0 shadow-sm">

            <div class="card-header bg-white">
                <div class="d-flex justify-content-between align-items-center">

                    <h5 class="fw-bold mb-0">
                        Junio 2026
                    </h5>

                    <div>
                        <button class="btn btn-outline-secondary btn-sm">
                            <i class="fas fa-chevron-left"></i>
                        </button>

                        <button class="btn btn-outline-secondary btn-sm">
                            <i class="fas fa-chevron-right"></i>
                        </button>
                    </div>

                </div>
            </div>

            <div class="card-body">

                <table class="table table-bordered text-center align-middle calendar-table">

                    <thead class="table-light">
                        <tr>
                            <th>Lun</th>
                            <th>Mar</th>
                            <th>Mié</th>
                            <th>Jue</th>
                            <th>Vie</th>
                            <th>Sáb</th>
                            <th>Dom</th>
                        </tr>
                    </thead>

                    <tbody>

                        <tr>
                            <td>1</td>
                            <td>2</td>
                            <td>3</td>

                            <td>
                                <strong>4</strong>
                                <div class="event-design">
                                    Diseño PED-001
                                </div>
                            </td>

                            <td>
                                <strong>5</strong>
                                <div class="event-production">
                                    Producción PED-004
                                </div>
                            </td>

                            <td>6</td>
                            <td>7</td>
                        </tr>

                        <tr>

                            <td>
                                <strong>8</strong>
                                <div class="event-delivery">
                                    Entrega PED-006
                                </div>
                            </td>

                            <td>9</td>

                            <td>10</td>

                            <td>
                                <strong>11</strong>
                                <div class="event-urgent">
                                    Instalación Urgente
                                </div>
                            </td>

                            <td>12</td>
                            <td>13</td>
                            <td>14</td>

                        </tr>

                        <tr>
                            <td>15</td>
                            <td>16</td>
                            <td>17</td>
                            <td>18</td>
                            <td>19</td>
                            <td>20</td>
                            <td>21</td>
                        </tr>

                        <tr>
                            <td>22</td>
                            <td>23</td>
                            <td>24</td>
                            <td>25</td>
                            <td>26</td>
                            <td>27</td>
                            <td>28</td>
                        </tr>

                        <tr>
                            <td>29</td>
                            <td>30</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

    <!-- Panel Derecho -->
    <div class="col-lg-3">

        <div class="card border-0 shadow-sm mb-4">

            <div class="card-header bg-white">
                <h5 class="fw-bold mb-0">
                    Próximas Actividades
                </h5>
            </div>

            <div class="card-body">

                <div class="activity-item">
                    <strong>PED-001</strong><br />
                    Diseño Final<br />
                    <small>05 Junio</small>
                </div>

                <hr />

                <div class="activity-item">
                    <strong>PED-004</strong><br />
                    Producción<br />
                    <small>06 Junio</small>
                </div>

                <hr />

                <div class="activity-item">
                    <strong>PED-006</strong><br />
                    Entrega Cliente<br />
                    <small>08 Junio</small>
                </div>

            </div>

        </div>

        <div class="card border-0 shadow-sm">

            <div class="card-header bg-white">
                <h5 class="fw-bold mb-0">
                    Filtros
                </h5>
            </div>

            <div class="card-body">

                <div class="form-check mb-2">
                    <input class="form-check-input" checked type="checkbox">
                    <label class="form-check-label">Diseño</label>
                </div>

                <div class="form-check mb-2">
                    <input class="form-check-input" checked type="checkbox">
                    <label class="form-check-label">Producción</label>
                </div>

                <div class="form-check mb-2">
                    <input class="form-check-input" checked type="checkbox">
                    <label class="form-check-label">Entregas</label>
                </div>

                <div class="form-check">
                    <input class="form-check-input" checked type="checkbox">
                    <label class="form-check-label">Urgentes</label>
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

.calendar-table td{
    height:120px;
    min-width:120px;
    vertical-align:top;
    font-size:14px;
}

.calendar-table td:hover{
    background:#f8fafc;
    transition:.3s;
    cursor:pointer;
}

.event-design{
    background:#dbeafe;
    color:#1d4ed8;
    padding:6px;
    border-radius:8px;
    margin-top:5px;
    font-size:12px;
}

.event-production{
    background:#fef3c7;
    color:#b45309;
    padding:6px;
    border-radius:8px;
    margin-top:5px;
    font-size:12px;
}

.event-delivery{
    background:#dcfce7;
    color:#15803d;
    padding:6px;
    border-radius:8px;
    margin-top:5px;
    font-size:12px;
}

.event-urgent{
    background:#fee2e2;
    color:#dc2626;
    padding:6px;
    border-radius:8px;
    margin-top:5px;
    font-size:12px;
}

.activity-item{
    line-height:1.8;
}

</style>

</asp:Content>
