<%@ Page Title="Diseño" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Diseno.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.Diseno" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="page-header">
    <h1>Gestión de Diseño</h1>
</div>

<div class="kanban-board">

    <!-- Pendientes -->

    <div class="kanban-column">

        <div class="column-header pending">
            Pendientes (2)
        </div>

        <div class="design-card">

            <h4>PED-001</h4>

            <p>Rótulo Acrílico</p>

            <span class="client-name">CEUTEC</span>

            <div class="design-footer">
                Solicitado: 05/06/2026
            </div>

        </div>

        <div class="design-card">

            <h4>PED-002</h4>

            <p>Banner Publicitario</p>

            <span class="client-name">UNAH</span>

            <div class="design-footer">
                Solicitado: 06/06/2026
            </div>

        </div>

    </div>

    <!-- En Revisión -->

    <div class="kanban-column">

        <div class="column-header progress">
            En Revisión (2)
        </div>

        <div class="design-card">

            <h4>PED-003</h4>

            <p>Vinil Vehicular</p>

            <span class="client-name">Banco Atlántida</span>

            <div class="progress-bar">
                <div class="progress-fill" style="width:80%;"></div>
            </div>

            <div class="design-footer">
                Revisión Cliente
            </div>

        </div>

        <div class="design-card">

            <h4>PED-004</h4>

            <p>Rotulación Interna</p>

            <span class="client-name">Promerica</span>

            <div class="progress-bar">
                <div class="progress-fill" style="width:50%;"></div>
            </div>

            <div class="design-footer">
                Ajustes Solicitados
            </div>

        </div>

    </div>

    <!-- Aprobados -->

    <div class="kanban-column">

        <div class="column-header completed">
            Aprobados (2)
        </div>

        <div class="design-card">

            <h4>PED-005</h4>

            <p>Rótulo Luminoso</p>

            <span class="client-name">Diunsa</span>

            <div class="approved-badge">
                ✓ Listo para Producción
            </div>

        </div>

        <div class="design-card">

            <h4>PED-006</h4>

            <p>Display Comercial</p>

            <span class="client-name">Tigo</span>

            <div class="approved-badge">
                ✓ Listo para Producción
            </div>

        </div>

    </div>

</div>

</asp:Content>
