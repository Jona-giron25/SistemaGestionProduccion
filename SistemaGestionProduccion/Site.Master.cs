using System;
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

            // Mostrar nombre del usuario
            if (Session["Nombre"] != null)
            {
                lblUsuario.Text =
                    Session["Nombre"].ToString();

                lblUsuarioSidebar.Text =
                    Session["Nombre"].ToString();
            }

            // Mostrar contador de notificaciones
            NotificacionDAO dao =
                new NotificacionDAO();

            lblNotificaciones.Text =
                dao.ObtenerNoLeidas().ToString();
        }
    }
}