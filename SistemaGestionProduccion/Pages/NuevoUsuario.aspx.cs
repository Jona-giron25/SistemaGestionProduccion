using System;
using SistemaGestionProduccion.Data;
using SistemaGestionProduccion.Models;

namespace SistemaGestionProduccion.Pages
{
    public partial class NuevoUsuario : System.Web.UI.Page
    {
        UsuarioDAO usuarioDAO =
            new UsuarioDAO();

        protected void Page_Load(
            object sender,
            EventArgs e)
        {

        }

        protected void btnGuardar_Click(
            object sender,
            EventArgs e)
        {
            if (txtClave.Text != txtConfirmarClave.Text)
            {
                lblMensaje.Visible = true;
                lblMensaje.CssClass = "alert alert-danger";
                lblMensaje.Text =
                    "Las contraseñas no coinciden.";

                return;
            }

            Usuario usuario =
                new Usuario();

            usuario.Nombre =
                txtNombre.Text.Trim();

            usuario.UsuarioLogin =
                txtUsuario.Text.Trim();

            usuario.Correo =
                txtCorreo.Text.Trim();

            usuario.Clave =
                txtClave.Text.Trim();

            usuario.Rol =
                ddlRol.SelectedValue;

            usuario.Estado =
                true;

            bool guardado =
                usuarioDAO.InsertarUsuario(usuario);

            if (guardado)
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
                    "No se pudo guardar el usuario.";
            }
        }
    }
}