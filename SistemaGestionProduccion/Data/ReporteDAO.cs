using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using SistemaGestionProduccion.Models;

namespace SistemaGestionProduccion.Data
{
    public class ReporteDAO
    {
        // ==========================
        // KPIs
        // ==========================

        public decimal ObtenerVentasTotales()
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
                SELECT ISNULL(SUM(Monto),0)
                FROM Pagos";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                conexion.Open();

                return Convert.ToDecimal(
                    cmd.ExecuteScalar()
                );
            }
        }

        public int ObtenerTotalPedidos()
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query =
                    "SELECT COUNT(*) FROM Pedidos";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                conexion.Open();

                return Convert.ToInt32(
                    cmd.ExecuteScalar()
                );
            }
        }

        public int ObtenerTotalClientes()
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query =
                    "SELECT COUNT(*) FROM Clientes";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                conexion.Open();

                return Convert.ToInt32(
                    cmd.ExecuteScalar()
                );
            }
        }

        // ==========================
        // TOP CLIENTES
        // ==========================

        public List<ReporteCliente> ObtenerTopClientes()
        {
            List<ReporteCliente> lista =
                new List<ReporteCliente>();

            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
                SELECT TOP 10
                    c.Nombre,
                    COUNT(p.IdPedido) AS Pedidos,
                    ISNULL(SUM(p.Total),0) AS Facturacion
                FROM Clientes c
                INNER JOIN Pedidos p
                    ON c.IdCliente = p.IdCliente
                GROUP BY c.Nombre
                ORDER BY Facturacion DESC";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                conexion.Open();

                SqlDataReader reader =
                    cmd.ExecuteReader();

                while (reader.Read())
                {
                    lista.Add(new ReporteCliente()
                    {
                        Cliente =
                            reader["Nombre"].ToString(),

                        Pedidos =
                            Convert.ToInt32(
                                reader["Pedidos"]
                            ),

                        Facturacion =
                            Convert.ToDecimal(
                                reader["Facturacion"]
                            )
                    });
                }
            }

            return lista;
        }

        // ==========================
        // ÚLTIMOS PAGOS
        // ==========================

        public List<ReportePago> ObtenerUltimosPagos()
        {
            List<ReportePago> lista =
                new List<ReportePago>();

            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
                SELECT TOP 10
                    FechaPago,
                    Monto,
                    UsuarioCobro
                FROM Pagos
                ORDER BY FechaPago DESC";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                conexion.Open();

                SqlDataReader reader =
                    cmd.ExecuteReader();

                while (reader.Read())
                {
                    lista.Add(new ReportePago()
                    {
                        Fecha =
                            Convert.ToDateTime(
                                reader["FechaPago"]
                            ),

                        Monto =
                            Convert.ToDecimal(
                                reader["Monto"]
                            ),

                        Usuario =
                            reader["UsuarioCobro"]
                                .ToString()
                    });
                }
            }

            return lista;
        }

        // ==========================
        // ESTADO PEDIDOS
        // ==========================

        public Dictionary<string, int> ObtenerPedidosPorEstado()
        {
            Dictionary<string, int> datos =
                new Dictionary<string, int>();

            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
                SELECT
                    Estado,
                    COUNT(*) Total
                FROM Pedidos
                GROUP BY Estado";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                conexion.Open();

                SqlDataReader reader =
                    cmd.ExecuteReader();

                while (reader.Read())
                {
                    datos.Add(
                        reader["Estado"].ToString(),
                        Convert.ToInt32(
                            reader["Total"]
                        )
                    );
                }
            }

            return datos;
        }

        // ==========================
        // VENTAS MENSUALES
        // ==========================

        public Dictionary<string, decimal> ObtenerVentasMensuales()
        {
            Dictionary<string, decimal> datos =
                new Dictionary<string, decimal>();

            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
                SELECT
                    DATENAME(MONTH, FechaPago) AS Mes,
                    SUM(Monto) AS Total
                FROM Pagos
                GROUP BY DATENAME(MONTH, FechaPago),
                         MONTH(FechaPago)
                ORDER BY MONTH(FechaPago)";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                conexion.Open();

                SqlDataReader reader =
                    cmd.ExecuteReader();

                while (reader.Read())
                {
                    datos.Add(
                        reader["Mes"].ToString(),
                        Convert.ToDecimal(
                            reader["Total"]
                        )
                    );
                }
            }

            return datos;
        }
    }
}