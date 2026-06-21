using System;
using SistemaGestionProduccion.Data;

namespace SistemaGestionProduccion.Pages
{
    public partial class Notificaciones : System.Web.UI.Page
    {
        NotificacionDAO dao =
            new NotificacionDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarNotificaciones();
            }
        }

        private void CargarNotificaciones()
        {
            var lista =
                dao.ObtenerNotificaciones();

            rptNotificaciones.DataSource =
                lista;

            rptNotificaciones.DataBind();

            lblNoLeidas.Text =
                dao.ObtenerNoLeidas().ToString();

            lblTotal.Text =
                lista.Count.ToString();
        }

        protected void btnMarcarLeidas_Click(
            object sender,
            EventArgs e)
        {
            dao.MarcarComoLeidas();

            CargarNotificaciones();

            Response.Write(
                "<script>alert('Notificaciones marcadas como leídas');</script>");
        }
    }
}