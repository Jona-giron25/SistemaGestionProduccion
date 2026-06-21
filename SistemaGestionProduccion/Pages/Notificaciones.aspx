<%@ Page Title="Notificaciones" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Notificaciones.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.Notificaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid">

    <!-- Encabezado -->
    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>
            <h1 class="fw-bold">Centro de Notificaciones</h1>
            <p class="text-muted mb-0">
                Actividad reciente y eventos importantes del sistema
            </p>
        </div>

        <asp:Button
            ID="btnMarcarLeidas"
            runat="server"
            Text="Marcar Todo como Leído"
            CssClass="btn btn-primary"
            OnClick="btnMarcarLeidas_Click" />

    </div>

    <!-- KPIs -->
    <div class="row mb-4">

        <div class="col-md-3">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <h6 class="text-muted">Sin Leer</h6>

                    <h2 class="fw-bold text-danger">
                        <asp:Label
                            ID="lblNoLeidas"
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
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <h6 class="text-muted">Total Notificaciones</h6>

                    <h2 class="fw-bold text-primary">
                        <asp:Label
                            ID="lblTotal"
                            runat="server"
                            Text="0" />
                    </h2>

                    <small class="text-muted">
                        Registradas
                    </small>
                </div>
            </div>
        </div>

    </div>

    <!-- Lista -->
    <div class="card border-0 shadow-sm">

        <div class="card-header bg-white">
            <h5 class="fw-bold mb-0">
                Actividad Reciente
            </h5>
        </div>

        <div class="card-body">

            <asp:Repeater
                ID="rptNotificaciones"
                runat="server">

                <ItemTemplate>

                    <div class="notification-item notification-info">

                        <div class="icon">
                            <i class="fas fa-bell"></i>
                        </div>

                        <div class="flex-grow-1">

                            <strong>
                                <%# Eval("Titulo") %>
                            </strong>

                            <p class="mb-1">
                                <%# Eval("Mensaje") %>
                            </p>

                            <small class="text-muted">

                                <%# Convert.ToDateTime(Eval("Fecha"))
                                .ToString("dd/MM/yyyy HH:mm") %>

                            </small>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

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

.notification-item{
    display:flex;
    gap:15px;
    padding:18px;
    border-radius:12px;
    margin-bottom:15px;
    border-left:5px solid #0dcaf0;
    background:#eef8ff;
}

.icon{
    font-size:22px;
    width:35px;
    color:#0dcaf0;
}

</style>

</asp:Content>