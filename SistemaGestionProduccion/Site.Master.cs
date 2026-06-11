using System;
using System.Web.UI;

namespace SistemaGestionProduccion
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}