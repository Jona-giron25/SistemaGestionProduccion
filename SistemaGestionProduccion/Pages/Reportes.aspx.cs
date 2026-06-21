using System;
using SistemaGestionProduccion.Data;
using System.Linq;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace SistemaGestionProduccion.Pages
{
    public partial class Reportes : System.Web.UI.Page
    {
        ReporteDAO reporteDAO = new ReporteDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarKPIs();
                CargarTopClientes();
                CargarUltimosPagos();

                CargarGraficoVentas();
                CargarGraficoEstados();
            }
        }

        private void CargarKPIs()
        {
            lblVentas.Text =
                reporteDAO
                .ObtenerVentasTotales()
                .ToString("N2");

            lblPedidos.Text =
                reporteDAO
                .ObtenerTotalPedidos()
                .ToString();

            lblClientes.Text =
                reporteDAO
                .ObtenerTotalClientes()
                .ToString();
        }

        private void CargarTopClientes()
        {
            rptTopClientes.DataSource =
                reporteDAO.ObtenerTopClientes();

            rptTopClientes.DataBind();
        }

        private void CargarUltimosPagos()
        {
            rptUltimosPagos.DataSource =
                reporteDAO.ObtenerUltimosPagos();

            rptUltimosPagos.DataBind();
        }
        private void CargarGraficoVentas()
        {
            var datos =
                reporteDAO.ObtenerVentasMensuales();

            hfVentasLabels.Value =
                string.Join(",",
                datos.Keys.Select(x => "'" + x + "'"));

            hfVentasValores.Value =
                string.Join(",",
                datos.Values);
        }

        private void CargarGraficoEstados()
        {
            var datos =
                reporteDAO.ObtenerPedidosPorEstado();

            hfEstadosLabels.Value =
                string.Join(",",
                datos.Keys.Select(x => "'" + x + "'"));

            hfEstadosValores.Value =
                string.Join(",",
                datos.Values);
        }

        protected void btnExportarPDF_Click(
    object sender,
    EventArgs e)
        {
            Document documento =
                new Document(PageSize.A4, 40, 40, 40, 40);

            MemoryStream ms =
                new MemoryStream();

            PdfWriter.GetInstance(
                documento,
                ms);

            documento.Open();

            Font titulo =
                FontFactory.GetFont(
                    FontFactory.HELVETICA_BOLD,
                    18);

            Font texto =
                FontFactory.GetFont(
                    FontFactory.HELVETICA,
                    12);

            documento.Add(
                new Paragraph(
                    "REPORTE GENERAL DEL SISTEMA",
                    titulo));

            documento.Add(
                new Paragraph(
                    "Fecha: " +
                    DateTime.Now.ToString("dd/MM/yyyy HH:mm")));

            documento.Add(
                new Paragraph(" "));

            documento.Add(
                new Paragraph(
                    "Ventas Totales: L. " +
                    lblVentas.Text,
                    texto));

            documento.Add(
                new Paragraph(
                    "Total Pedidos: " +
                    lblPedidos.Text,
                    texto));

            documento.Add(
                new Paragraph(
                    "Clientes Registrados: " +
                    lblClientes.Text,
                    texto));

            documento.Add(
                new Paragraph(" "));

            documento.Add(
                new Paragraph(
                    "Sistema Gestión Producción - Brand Solutions",
                    texto));

            documento.Close();

            Response.ContentType =
                "application/pdf";

            Response.AddHeader(
                "content-disposition",
                "attachment;filename=ReporteGeneral.pdf");

            Response.BinaryWrite(
                ms.ToArray());

            Response.End();
        }
    }
}