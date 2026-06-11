<%@ Page Title="Producción" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Produccion.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.Produccion" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="page-header">
    <h1>Gestión de Producción</h1>
</div>

<div class="kanban-board">

    <!-- Pendiente -->

    <div class="kanban-column">

        <div class="column-header pending">
            Pendiente (2)
        </div>

        <div class="kanban-card">

            <div class="card-top">
                <h4>PED-001</h4>
                <span class="priority high">Alta</span>
            </div>

            <p>Rótulo Acrílico Exterior</p>

            <span class="client-name">CEUTEC</span>

            <div class="card-footer">
                Entrega: 10/06/2026
            </div>

        </div>

        <div class="kanban-card">

            <div class="card-top">
                <h4>PED-002</h4>
                <span class="priority medium">Media</span>
            </div>

            <p>Banner Publicitario</p>

            <span class="client-name">UNAH</span>

            <div class="card-footer">
                Entrega: 12/06/2026
            </div>

        </div>

    </div>

    <!-- En Proceso -->

    <div class="kanban-column">

        <div class="column-header progress">
            En Proceso (2)
        </div>

        <div class="kanban-card">

            <div class="card-top">
                <h4>PED-003</h4>
                <span class="priority high">Alta</span>
            </div>

            <p>Vinil Vehicular</p>

            <span class="client-name">Banco Atlántida</span>

            <div class="progress-bar">
                <div class="progress-fill" style="width:70%;"></div>
            </div>

            <div class="card-footer">
                Avance: 70%
            </div>

        </div>

        <div class="kanban-card">

            <div class="card-top">
                <h4>PED-004</h4>
                <span class="priority medium">Media</span>
            </div>

            <p>Rotulación Interna</p>

            <span class="client-name">Promerica</span>

            <div class="progress-bar">
                <div class="progress-fill" style="width:45%;"></div>
            </div>

            <div class="card-footer">
                Avance: 45%
            </div>

        </div>

    </div>

    <!-- Finalizado -->

    <div class="kanban-column">

        <div class="column-header completed">
            Finalizado (2)
        </div>

        <div class="kanban-card">

            <div class="card-top">
                <h4>PED-005</h4>
                <span class="priority low">Completado</span>
            </div>

            <p>Rótulo Luminoso</p>

            <span class="client-name">Diunsa</span>

            <div class="card-footer">
                Finalizado ✓
            </div>

        </div>

        <div class="kanban-card">

            <div class="card-top">
                <h4>PED-006</h4>
                <span class="priority low">Completado</span>
            </div>

            <p>Display Comercial</p>

            <span class="client-name">Tigo</span>

            <div class="card-footer">
                Finalizado ✓
            </div>

        </div>

    </div>

</div>

</asp:Content>