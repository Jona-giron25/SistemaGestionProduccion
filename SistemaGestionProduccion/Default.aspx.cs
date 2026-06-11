using System;
using System.Web;
using System.Web.UI;
using SistemaGestionProduccion.Data;
using SistemaGestionProduccion.Models;

namespace SistemaGestionProduccion
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                UsuarioDAO dao = new UsuarioDAO();

                Usuario usuario = dao.ValidarUsuario(
                    txtUsuario.Text.Trim(),
                    txtPassword.Text.Trim()
                );

                if (usuario != null)
                {
                    Session["Usuario"] = usuario.UsuarioLogin;
                    Session["Nombre"] = usuario.Nombre;
                    Session["Rol"] = usuario.Rol;

                    HttpCookie cookie =
                        new HttpCookie("SistemaGestionCookie");

                    cookie["Usuario"] =
                        usuario.UsuarioLogin;

                    cookie.Expires =
                        DateTime.Now.AddDays(30);

                    Response.Cookies.Add(cookie);

                    Response.Redirect("~/Pages/Dashboard.aspx");
                }
                else
                {
                    lblMensaje.Text =
                        "Usuario o contraseña incorrectos.";
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text =
                    "Error: " + ex.Message;
            }
        }
    }
}