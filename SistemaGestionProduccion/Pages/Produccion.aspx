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

<asp:Repeater ID="rptProduccion" runat="server">

<ItemTemplate>

<div class="kanban-card">

    <h4>
        PED-<%# Eval("IdPedido") %>
    </h4>

    <p>
        <%# Eval("TipoTrabajo") %>
    </p>

    <span class="client-name">
        <%# Eval("NombreCliente") %>
    </span>

    <div class="card-footer">

        Entrega:
        <%# Convert.ToDateTime(Eval("FechaEntrega"))
            .ToString("dd/MM/yyyy") %>

    </div>

    <br />

    <asp:Button
        ID="btnFinalizar"
        runat="server"
        Text="Finalizar Producción"
        CssClass="btn-save"
        CommandArgument='<%# Eval("IdPedido") %>'
        OnCommand="btnFinalizar_Command" />

</div>

</ItemTemplate>

</asp:Repeater>

</asp:Content>