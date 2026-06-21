using System;
using SistemaGestionProduccion.Data;
using SistemaGestionProduccion.Models;

namespace SistemaGestionProduccion.Pages
{
    public partial class EditarUsuario : System.Web.UI.Page
    {
        UsuarioDAO usuarioDAO =
            new UsuarioDAO();

        protected void Page_Load(
            object sender,
            EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int idUsuario =
                        Convert.ToInt32(
                            Request.QueryString["id"]);

                    CargarUsuario(idUsuario);
                }
            }
        }

        private void CargarUsuario(
            int idUsuario)
        {
            Usuario usuario =
                usuarioDAO.ObtenerUsuarioPorId(
                    idUsuario);

            if (usuario != null)
            {
                hfIdUsuario.Value =
                    usuario.IdUsuario.ToString();

                txtNombre.Text =
                    usuario.Nombre;

                txtUsuario.Text =
                    usuario.UsuarioLogin;

                txtCorreo.Text =
                    usuario.Correo;

                ddlRol.SelectedValue =
                    usuario.Rol;

                ddlEstado.SelectedValue =
                    usuario.Estado
                        .ToString()
                        .ToLower();
            }
        }

        protected void btnGuardar_Click(
            object sender,
            EventArgs e)
        {
            Usuario usuario =
                new Usuario();

            usuario.IdUsuario =
                Convert.ToInt32(
                    hfIdUsuario.Value);

            usuario.Nombre =
                txtNombre.Text.Trim();

            usuario.UsuarioLogin =
                txtUsuario.Text.Trim();

            usuario.Correo =
                txtCorreo.Text.Trim();

            usuario.Rol =
                ddlRol.SelectedValue;

            usuario.Estado =
                Convert.ToBoolean(
                    ddlEstado.SelectedValue);

            bool actualizado =
                usuarioDAO.ActualizarUsuario(
                    usuario);

            if (!string.IsNullOrWhiteSpace(
                txtClave.Text))
            {
                if (txtClave.Text ==
                    txtConfirmarClave.Text)
                {
                    usuarioDAO.CambiarClave(
                        usuario.IdUsuario,
                        txtClave.Text);
                }
                else
                {
                    lblMensaje.Visible = true;

                    lblMensaje.CssClass =
                        "alert alert-danger";

                    lblMensaje.Text =
                        "Las contraseñas no coinciden.";

                    return;
                }
            }

            if (actualizado)
            {
                Response.Redirect(
                    "Usuarios.aspx");
            }
            else
            {
                lblMensaje.Visible = true;

                lblMensaje.CssClass =
                    "alert alert-danger";

                lblMensaje.Text =
                    "No se pudieron guardar los cambios.";
            }
        }
    }
}