<%@ Page Title="Login"
    Language="C#"
    MasterPageFile="~/Login.Master"
    AutoEventWireup="true"
    CodeBehind="Default.aspx.cs"
    Inherits="SistemaGestionProduccion.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="login-container">

        <div class="login-card">

            <div class="logo-section">
                <h1>Brand Solutions</h1>
                <p>
                    Sistema de Gestión de Producción,
                    Diseño y Cotizaciones
                </p>
            </div>

            <div class="form-section">

                <div class="form-group">
                    <label>Usuario</label>

                    <asp:TextBox
                        ID="txtUsuario"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Ingrese usuario">
                    </asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Contraseña</label>

                    <asp:TextBox
                        ID="txtPassword"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Password"
                        placeholder="Ingrese contraseña">
                    </asp:TextBox>
                </div>

                <asp:Label
                    ID="lblMensaje"
                    runat="server"
                    ForeColor="Red">
                </asp:Label>

                <br />
                <br />

                <asp:Button
                    ID="btnLogin"
                    runat="server"
                    Text="Ingresar al Sistema"
                    CssClass="btn-login"
                    OnClick="btnLogin_Click" />

            </div>

        </div>

    </div>

</asp:Content>