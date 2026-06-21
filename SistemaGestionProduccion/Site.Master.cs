using System;
using System.Web;
using System.Web.UI;
using SistemaGestionProduccion.Data;

namespace SistemaGestionProduccion
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("~/Default.aspx");
                return;
            }

            if (Session["Nombre"] != null)
            {
                lblUsuario.Text =
                    Session["Nombre"].ToString();

                lblUsuarioSidebar.Text =
                    Session["Nombre"].ToString();
            }

            string rol =
                Session["Rol"]?.ToString();

            ConfigurarMenus(rol);

            NotificacionDAO dao =
                new NotificacionDAO();

            lblNotificaciones.Text =
                dao.ObtenerNoLeidas().ToString();
        }

        private void ConfigurarMenus(string rol)
        {
            menuDashboard.Visible = false;
            menuClientes.Visible = false;
            menuDiseno.Visible = false;
            menuProduccion.Visible = false;
            menuPagos.Visible = false;
            menuReportes.Visible = false;
            menuUsuarios.Visible = false;

            switch (rol)
            {
                case "Admin":

                    menuDashboard.Visible = true;
                    menuClientes.Visible = true;
                    menuDiseno.Visible = true;
                    menuProduccion.Visible = true;
                    menuPagos.Visible = true;
                    menuReportes.Visible = true;
                    menuUsuarios.Visible = true;

                    break;

                case "Ventas":

                    menuClientes.Visible = true;
                    menuPagos.Visible = true;

                    break;

                case "Diseño":

                    menuDiseno.Visible = true;

                    break;

                case "Producción":

                    menuProduccion.Visible = true;

                    break;

                case "Gerencia":

                    menuDashboard.Visible = true;
                    menuReportes.Visible = true;

                    break;
            }
        }

        protected void btnCerrarSesion_Click(
            object sender,
            EventArgs e)
        {
            Session.Clear();

            Session.Abandon();

            if (Request.Cookies["SistemaGestionCookie"] != null)
            {
                HttpCookie cookie =
                    new HttpCookie("SistemaGestionCookie");

                cookie.Expires =
                    DateTime.Now.AddDays(-1);

                Response.Cookies.Add(cookie);
            }

            Response.Redirect("~/Default.aspx");
        }
    }
}