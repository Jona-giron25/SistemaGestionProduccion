<%@ Page Title="Nuevo Pedido"
    Language="C#"
    MasterPageFile="~/Site.Master"
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

    <!-- CLIENTE -->

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

    <!-- PEDIDO -->

    <div class="form-card">

        <h3>Información del Pedido</h3>

        <div class="form-grid">

            <div class="form-group full-width">

                <label>Descripción</label>

                <asp:TextBox
                    ID="txtDescripcion"
                    runat="server"
                    CssClass="form-input textarea"
                    TextMode="MultiLine"
                    Rows="4">
                </asp:TextBox>

            </div>

            <div class="form-group">

                <label>Cantidad</label>

                <asp:TextBox
                    ID="txtCantidad"
                    runat="server"
                    CssClass="form-input"
                    TextMode="Number">
                </asp:TextBox>

            </div>

            <div class="form-group">

                <label>Tipo de Trabajo</label>

                <asp:TextBox
                    ID="txtTipoTrabajo"
                    runat="server"
                    CssClass="form-input">
                </asp:TextBox>

            </div>

            <div class="form-group">

                <label>Fecha de Entrega</label>

                <asp:TextBox
                    ID="txtFechaEntrega"
                    runat="server"
                    CssClass="form-input"
                    TextMode="Date">
                </asp:TextBox>

            </div>

            <div class="form-group">

                <label>Estado Inicial</label>

                <asp:DropDownList
                    ID="ddlEstado"
                    runat="server"
                    CssClass="form-input">

                    <asp:ListItem Text="Diseño" Value="Diseño" />
                    <asp:ListItem Text="Producción" Value="Producción" />
                    <asp:ListItem Text="Finalizado" Value="Finalizado" />

                </asp:DropDownList>

            </div>

            <div class="form-group">

                <label>Total</label>

                <asp:TextBox
                    ID="txtTotal"
                    runat="server"
                    CssClass="form-input"
                    TextMode="Number">
                </asp:TextBox>

            </div>

        </div>

    </div>

    <!-- BOTONES -->

    <div class="actions">

        <asp:Button
            ID="btnGuardar"
            runat="server"
            Text="Guardar Pedido"
            CssClass="btn-save"
            OnClick="btnGuardar_Click" />

        <asp:Button
            ID="btnCancelar"
            runat="server"
            Text="Cancelar"
            CssClass="btn-cancel"
            CausesValidation="false" />

    </div>

</div>

</asp:Content>