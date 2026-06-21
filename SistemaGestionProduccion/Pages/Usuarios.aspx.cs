using System;
using SistemaGestionProduccion.Data;

namespace SistemaGestionProduccion.Pages
{
    public partial class Usuarios : System.Web.UI.Page
    {
        UsuarioDAO usuarioDAO =
            new UsuarioDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarios();
                CargarKPIs();
            }
        }

        private void CargarUsuarios()
        {
            rptUsuarios.DataSource =
                usuarioDAO.ObtenerUsuarios();

            rptUsuarios.DataBind();
        }

        private void CargarKPIs()
        {
            lblTotalUsuarios.Text =
                usuarioDAO.ObtenerTotalUsuarios().ToString();

            lblAdministradores.Text =
                usuarioDAO.ObtenerAdministradores().ToString();

            lblActivos.Text =
                usuarioDAO.ObtenerUsuariosActivos().ToString();

            lblRoles.Text =
                usuarioDAO.ObtenerTotalRoles().ToString();
        }

        protected string ObtenerClaseRol(string rol)
        {
            switch (rol)
            {
                case "Admin":
                    return "bg-danger";

                case "Diseño":
                    return "bg-primary";

                case "Producción":
                    return "bg-warning text-dark";

                case "Ventas":
                    return "bg-info";

                default:
                    return "bg-secondary";
            }
        }
    }
}