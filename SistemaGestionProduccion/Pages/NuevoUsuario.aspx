<%@ Page Title="Nuevo Usuario"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="NuevoUsuario.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.NuevoUsuario" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="container-fluid">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>
            <h1 class="fw-bold">Nuevo Usuario</h1>
            <p class="text-muted">
                Registro de usuarios del sistema
            </p>
        </div>

        <a href="Usuarios.aspx"
           class="btn btn-secondary">
            Volver
        </a>

    </div>

    <div class="card shadow-sm border-0">

        <div class="card-body">

            <asp:Label
                ID="lblMensaje"
                runat="server"
                Visible="false">
            </asp:Label>

            <div class="row">

                <div class="col-md-6 mb-3">

                    <label>Nombre Completo</label>

                    <asp:TextBox
                        ID="txtNombre"
                        runat="server"
                        CssClass="form-control">
                    </asp:TextBox>

                </div>

                <div class="col-md-6 mb-3">

                    <label>Usuario</label>

                    <asp:TextBox
                        ID="txtUsuario"
                        runat="server"
                        CssClass="form-control">
                    </asp:TextBox>

                </div>

                <div class="col-md-6 mb-3">

                    <label>Correo</label>

                    <asp:TextBox
                        ID="txtCorreo"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Email">
                    </asp:TextBox>

                </div>

                <div class="col-md-6 mb-3">

                    <label>Rol</label>

                    <asp:DropDownList
                        ID="ddlRol"
                        runat="server"
                        CssClass="form-select">

                        <asp:ListItem Text="Admin" Value="Admin" />
                        <asp:ListItem Text="Ventas" Value="Ventas" />
                        <asp:ListItem Text="Diseño" Value="Diseño" />
                        <asp:ListItem Text="Producción" Value="Producción" />
                        <asp:ListItem Text="Gerencia" Value="Gerencia" />

                    </asp:DropDownList>

                </div>

                <div class="col-md-6 mb-3">

                    <label>Contraseña</label>

                    <asp:TextBox
                        ID="txtClave"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Password">
                    </asp:TextBox>

                </div>

                <div class="col-md-6 mb-3">

                    <label>Confirmar Contraseña</label>

                    <asp:TextBox
                        ID="txtConfirmarClave"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Password">
                    </asp:TextBox>

                </div>

            </div>

            <div class="mt-3">

                <asp:Button
                    ID="btnGuardar"
                    runat="server"
                    Text="Guardar Usuario"
                    CssClass="btn btn-primary"
                    OnClick="btnGuardar_Click" />

            </div>

        </div>

    </div>

</div>

</asp:Content>