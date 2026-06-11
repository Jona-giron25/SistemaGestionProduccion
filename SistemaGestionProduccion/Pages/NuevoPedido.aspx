<%@ Page Title="Nuevo Pedido" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="NuevoPedido.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.NuevoPedido" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="page-header">
    <h1>Nuevo Pedido</h1>
</div>

<div class="form-container">

    <div class="form-card">

        <h3>Información del Cliente</h3>

        <div class="form-grid">

            <div class="form-group">
    <label>Cliente</label>

    <asp:DropDownList
    ID="ddlClientes"
    runat="server"
    CssClass="form-input"
    AutoPostBack="true"
    OnSelectedIndexChanged="ddlClientes_SelectedIndexChanged">
</asp:DropDownList>

</div>

            <div class="form-group">
    <label>RTN</label>

    <asp:TextBox
        ID="txtRTN"
        runat="server"
        CssClass="form-input">
    </asp:TextBox>

</div>

<div class="form-group">
    <label>Teléfono</label>

    <asp:TextBox
        ID="txtTelefono"
        runat="server"
        CssClass="form-input">
    </asp:TextBox>

</div>

<div class="form-group">
    <label>Correo</label>

    <asp:TextBox
        ID="txtCorreo"
        runat="server"
        CssClass="form-input">
    </asp:TextBox>

</div>

        </div>

    </div>

    <div class="form-card">

        <h3>Información del Pedido</h3>

        <div class="form-grid">

            <div class="form-group full-width">
                <label>Descripción</label>
                <textarea class="form-input textarea"></textarea>
            </div>

            <div class="form-group">
                <label>Cantidad</label>
                <input type="number" class="form-input" />
            </div>

            <div class="form-group">
                <label>Material</label>
                <input type="text" class="form-input" />
            </div>

            <div class="form-group">
                <label>Fecha de Entrega</label>
                <input type="date" class="form-input" />
            </div>

            <div class="form-group">
                <label>Estado Inicial</label>
                <select class="form-input">
                    <option>Cotización</option>
                    <option>Diseño</option>
                    <option>Producción</option>
                </select>
            </div>

        </div>

    </div>

    <div class="actions">

        <button class="btn-save">
            Guardar Pedido
        </button>

        <button class="btn-cancel">
            Cancelar
        </button>

    </div>

</div>

</asp:Content>