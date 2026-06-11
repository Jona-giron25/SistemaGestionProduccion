using SistemaGestionProduccion.Data;
using SistemaGestionProduccion.Models;
using System;
using System.Web.UI.WebControls;

namespace SistemaGestionProduccion.Pages
{
    public partial class Clientes : System.Web.UI.Page
    {
        ClienteDAO clienteDAO = new ClienteDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarClientes();
                CargarKPIs();
            }
        }

        private void CargarClientes()
        {
            gvClientes.DataSource = clienteDAO.ObtenerClientes();
            gvClientes.DataBind();
        }
        private void CargarKPIs()
        {
            lblTotalClientes.Text =
                clienteDAO.ObtenerTotalClientes().ToString();
        }
        protected void gvClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int idCliente = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Eliminar")
            {
                ClienteDAO clienteDAO = new ClienteDAO();

                if (clienteDAO.EliminarCliente(idCliente))
                {
                    CargarClientes();
                    CargarKPIs();
                }
            }

            if (e.CommandName == "Editar")
            {
                ClienteDAO clienteDAO = new ClienteDAO();

                Cliente cliente = clienteDAO.ObtenerClientePorId(idCliente);

                if (cliente != null)
                {
                    hfIdCliente.Value = cliente.IdCliente.ToString();

                    txtNombre.Text = cliente.Nombre;
                    txtTelefono.Text = cliente.Telefono;
                    txtCorreo.Text = cliente.Correo;
                    txtDireccion.Text = cliente.Direccion;
                    txtRTN.Text = cliente.RTN;

                    btnGuardar.Text = "Actualizar Cliente";

                    pnlNuevoCliente.Visible = true;
                }
            }
        }
        protected void btnMostrarFormulario_Click(object sender, EventArgs e)
        {
            pnlNuevoCliente.Visible = true;
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Cliente cliente = new Cliente();

            cliente.Nombre = txtNombre.Text;
            cliente.RTN = txtRTN.Text;
            cliente.Telefono = txtTelefono.Text;
            cliente.Correo = txtCorreo.Text;
            cliente.Direccion = txtDireccion.Text;

            ClienteDAO clienteDAO = new ClienteDAO();

            // EDITAR
            if (!string.IsNullOrEmpty(hfIdCliente.Value))
            {
                cliente.IdCliente = Convert.ToInt32(hfIdCliente.Value);

                clienteDAO.ActualizarCliente(cliente);
            }
            // NUEVO
            else
            {
                clienteDAO.InsertarCliente(cliente);
            }

            txtNombre.Text = "";
            txtTelefono.Text = "";
            txtCorreo.Text = "";
            txtDireccion.Text = "";
            txtRTN.Text = "";

            hfIdCliente.Value = "";

            btnGuardar.Text = "Guardar Cliente";

            pnlNuevoCliente.Visible = false;

            CargarClientes();
            CargarKPIs();

        }
    }
}
    
    
