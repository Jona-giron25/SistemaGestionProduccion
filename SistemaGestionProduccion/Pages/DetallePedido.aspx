<%@ Page Title="Detalle Pedido" Language="C#" MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="DetallePedido.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.DetallePedido" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="page-header">

    <h1>Detalle del Pedido</h1>

    <asp:Button
        ID="btnVolver"
        runat="server"
        Text="← Volver a Pedidos"
        CssClass="btn-primary"
        PostBackUrl="~/Pages/Pedidos.aspx" />

</div>
<div class="detail-container">

    <div class="detail-card">

        <h3>Información General</h3>

        <div class="detail-grid">

            <div>
                <strong>Código:</strong><br />
                <asp:Label ID="lblCodigo" runat="server" />
            </div>

            <div>
                <strong>Cliente:</strong><br />
                <asp:Label ID="lblCliente" runat="server" />
            </div>

            <div>
                <strong>Fecha:</strong><br />
                <asp:Label ID="lblFecha" runat="server" />
            </div>

            <div>
    <strong>Estado:</strong><br />
    <asp:Label ID="lblEstado" runat="server" />

    <br /><br />

    <div style="margin-top:10px;">
    <span class="status-badge">
        <asp:Label ID="lblEstadoActual" runat="server" />
    </span>
</div>
</div>

        </div>

    </div>

    <div class="detail-card">

    <h3>Progreso del Pedido</h3>

    <div class="progress-container">

    <div class="progress-bar-full">

        <div
            id="progressFill"
            runat="server"
            class="progress-fill-custom">
        </div>

    </div>

    <div class="progress-text">

        <asp:Label
            ID="lblPorcentaje"
            runat="server" />

    </div>

</div>

</div>

    <div class="detail-card">

        <h3>Información del Trabajo</h3>

        <div class="detail-grid">

            <div>
                <strong>Tipo de Trabajo:</strong><br />
                <asp:Label ID="lblTipoTrabajo" runat="server" />
            </div>

            <div>
                <strong>Fecha Entrega:</strong><br />
                <asp:Label ID="lblFechaEntrega" runat="server" />
            </div>

        </div>

        <br />

        <strong>Descripción:</strong>

        <p>
            <asp:Label ID="lblDescripcion" runat="server" />
        </p>

    </div>

    <div class="detail-card">

        <h3>Información Financiera</h3>

        <div class="finance-grid">

            <div class="finance-box">
                <h4>Total</h4>
                <span>
                    <asp:Label ID="lblTotal" runat="server" />
                </span>
            </div>

            <div class="finance-box">
                <h4>Anticipo</h4>
                <span>L. 0.00</span>
            </div>

            <div class="finance-box">
                <h4>Saldo</h4>
                <span>
                    <asp:Label ID="lblSaldo" runat="server" />
                </span>
            </div>

        </div>

    </div>

    <div class="detail-card">

    <h3>Nuevo Seguimiento</h3>

    <div class="form-grid">

        <div class="form-group">

            <label>Estado</label>

            <asp:DropDownList
                ID="ddlEstadoNuevo"
                runat="server"
                CssClass="form-input">

                <asp:ListItem>Cotización</asp:ListItem>
                <asp:ListItem>Aprobación</asp:ListItem>
                <asp:ListItem>Diseño</asp:ListItem>
                <asp:ListItem>Producción</asp:ListItem>
                <asp:ListItem>Entrega</asp:ListItem>
                <asp:ListItem>Finalizado</asp:ListItem>

            </asp:DropDownList>

        </div>

        <div class="form-group">

            <label>Etapa</label>

            <asp:DropDownList
                ID="ddlEtapa"
                runat="server"
                CssClass="form-input">

                <asp:ListItem>Trabajo pendiente de cotizar</asp:ListItem>
                <asp:ListItem>Producto ya cotizado</asp:ListItem>
                <asp:ListItem>Seguimiento de cotización</asp:ListItem>
                <asp:ListItem>Anticipo del 50%</asp:ListItem>
                <asp:ListItem>Listo para lanzar a producción</asp:ListItem>
                <asp:ListItem>Proceso de diseño</asp:ListItem>
                <asp:ListItem>Conflictos</asp:ListItem>
                <asp:ListItem>En proceso de producción</asp:ListItem>
                <asp:ListItem>Listo para entrega (pago pendiente 50%)</asp:ListItem>
                <asp:ListItem>Pago final recibido</asp:ListItem>
                <asp:ListItem>Pedido completo</asp:ListItem>

            </asp:DropDownList>

        </div>

        <div class="form-group full-width">

            <label>Comentario</label>

            <asp:TextBox
                ID="txtComentario"
                runat="server"
                CssClass="form-input"
                TextMode="MultiLine"
                Rows="4">
            </asp:TextBox>

        </div>

    </div>

    <asp:Button
        ID="btnGuardarSeguimiento"
        runat="server"
        Text="Guardar Seguimiento"
        CssClass="btn-save"
        OnClick="btnGuardarSeguimiento_Click" />

</div>

    <div class="detail-card">

    <h3>Historial del Pedido</h3>

<p style="margin-bottom:20px;color:#6b7280;">
    Registro cronológico de todas las acciones realizadas sobre este pedido.
</p>

    <asp:Repeater
        ID="rptSeguimientos"
        runat="server">

       <ItemTemplate>

    <div class='timeline-item <%# ObtenerClaseEstado(Eval("Estado").ToString()) %>'>

        <div class="timeline-header">

            <div>

                <strong>
                    <%# Convert.ToDateTime(Eval("Fecha")).ToString("dd/MM/yyyy HH:mm") %>
                </strong>

            </div>

            <div>

                <span class="status-badge">
    <%# Eval("Estado") %>
</span>

            </div>

        </div>

        <div class="timeline-body">

            <div class="timeline-info">

                <strong>Etapa:</strong>
                <%# Eval("Etapa") %>

            </div>

            <div class="timeline-info">

                <strong>Usuario:</strong>
                <%# Eval("Usuario") %>

            </div>

            <div class="timeline-comentario">

                <%# Eval("Comentario") %>

            </div>

        </div>

    </div>

</ItemTemplate>

    </asp:Repeater>

</div>


    <div class="detail-card">

        <h3>Seguimiento del Pedido</h3>

        <div class="timeline">

            <div class="step">
                Estado Actual:
                <asp:Label ID="lblEstadoSeguimiento" runat="server" />
            </div>

        </div>

    </div>

</div>

</asp:Content>