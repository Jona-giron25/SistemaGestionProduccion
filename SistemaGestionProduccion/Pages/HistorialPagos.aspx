<%@ Page Title="Historial de Pagos"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="HistorialPagos.aspx.cs"
Inherits="SistemaGestionProduccion.Pages.HistorialPagos" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="container-fluid">

    <div class="card shadow-sm border-0 mb-4">

        <div class="card-body">

            <h2 class="fw-bold">
                Historial de Pagos
            </h2>

            <p class="text-muted">
                Bitácora financiera del pedido
            </p>

        </div>

    </div>

    <div class="row mb-4">

        <div class="col-md-4">

            <div class="card shadow-sm">

                <div class="card-body text-center">

                    <h6>Total Pedido</h6>

                    <h3 class="text-primary">

                        <asp:Label
                            ID="lblTotal"
                            runat="server" />

                    </h3>

                </div>

            </div>

        </div>

        <div class="col-md-4">

            <div class="card shadow-sm">

                <div class="card-body text-center">

                    <h6>Total Pagado</h6>

                    <h3 class="text-success">

                        <asp:Label
                            ID="lblPagado"
                            runat="server" />

                    </h3>

                </div>

            </div>

        </div>

        <div class="col-md-4">

            <div class="card shadow-sm">

                <div class="card-body text-center">

                    <h6>Saldo Pendiente</h6>

                    <h3 class="text-danger">

                        <asp:Label
                            ID="lblSaldo"
                            runat="server" />

                    </h3>

                </div>

            </div>

        </div>

    </div>

    <div class="card shadow-sm border-0">

        <div class="card-header bg-white">

            <h5 class="fw-bold mb-0">
                Bitácora de Cobros
            </h5>

        </div>

        <div class="card-body">

            <asp:Repeater
                ID="rptHistorial"
                runat="server">

                <HeaderTemplate>

                    <table class="table table-hover">

                        <thead>

                            <tr>

                                <th>Fecha</th>
                                <th>Tipo Pago</th>
                                <th>Monto</th>
                                <th>Usuario</th>

                            </tr>

                        </thead>

                        <tbody>

                </HeaderTemplate>

                <ItemTemplate>

                    <tr>

                        <td>
                            <%# Convert.ToDateTime(Eval("FechaPago")).ToString("dd/MM/yyyy HH:mm") %>
                        </td>

                        <td>
                            <%# Eval("TipoPago") %>
                        </td>

                        <td>
                            L. <%# Convert.ToDecimal(Eval("Monto")).ToString("N2") %>
                        </td>

                        <td>
                            <%# Eval("UsuarioCobro") %>
                        </td>

                    </tr>

                </ItemTemplate>

                <FooterTemplate>

                        </tbody>

                    </table>

                </FooterTemplate>

            </asp:Repeater>

        </div>

    </div>

</div>

</asp:Content>