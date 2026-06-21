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

<asp:Repeater ID="rptDiseno" runat="server">

<ItemTemplate>

<div class="design-card">

    <h4>
        PED-<%# Eval("IdPedido") %>
    </h4>

    <p>
        <%# Eval("TipoTrabajo") %>
    </p>

    <span class="client-name">
        <%# Eval("NombreCliente") %>
    </span>

    <div class="design-footer">

        Entrega:
        <%# Convert.ToDateTime(Eval("FechaEntrega"))
            .ToString("dd/MM/yyyy") %>

    </div>

    <br />

    <asp:Button
        ID="btnAprobar"
        runat="server"
        Text="Aprobar Diseño"
        CssClass="btn-save"
        CommandArgument='<%# Eval("IdPedido") %>'
        OnCommand="btnAprobar_Command" />

</div>

</ItemTemplate>

</asp:Repeater>

</asp:Content>
