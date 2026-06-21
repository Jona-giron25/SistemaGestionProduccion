<%@ Page Title="Editar Usuario"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="EditarUsuario.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.EditarUsuario" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="container-fluid">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>
            <h1 class="fw-bold">Editar Usuario</h1>
            <p class="text-muted">
                Administración de información y permisos
            </p>
        </div>

        <a href="Usuarios.aspx"
           class="btn btn-secondary">

            Volver

        </a>

    </div>

    <div class="card border-0 shadow-sm">

        <div class="card-body">

            <asp:Label
                ID="lblMensaje"
                runat="server"
                Visible="false">
            </asp:Label>

            <asp:HiddenField
                ID="hfIdUsuario"
                runat="server" />

            <div class="row">

                <div class="col-md-6 mb-3">

                    <label>Nombre</label>

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
                        CssClass="form-control">
                    </asp:TextBox>

                </div>

                <div class="col-md-6 mb-3">

                    <label>Rol</label>

                    <asp:DropDownList
                        ID="ddlRol"
                        runat="server"
                        CssClass="form-select">

                        <asp:ListItem Text="Admin" />
                        <asp:ListItem Text="Ventas" />
                        <asp:ListItem Text="Diseño" />
                        <asp:ListItem Text="Producción" />
                        <asp:ListItem Text="Gerencia" />

                    </asp:DropDownList>

                </div>

                <div class="col-md-6 mb-3">

                    <label>Estado</label>

                    <asp:DropDownList
                        ID="ddlEstado"
                        runat="server"
                        CssClass="form-select">

                        <asp:ListItem Text="Activo" Value="true" />
                        <asp:ListItem Text="Inactivo" Value="false" />

                    </asp:DropDownList>

                </div>

            </div>

            <hr />

            <h5>Cambiar Contraseña</h5>

            <div class="row">

                <div class="col-md-6 mb-3">

                    <label>Nueva Contraseña</label>

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
                    Text="Guardar Cambios"
                    CssClass="btn btn-primary"
                    OnClick="btnGuardar_Click" />

            </div>

        </div>

    </div>

</div>

</asp:Content>