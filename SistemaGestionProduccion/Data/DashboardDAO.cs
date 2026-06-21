using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using SistemaGestionProduccion.Models;

namespace SistemaGestionProduccion.Data
{
    public class DashboardDAO
    {
        public int ObtenerTotalPedidos()
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = "SELECT COUNT(*) FROM Pedidos";

                SqlCommand cmd =
                    new SqlCommand(query, conn);

                conn.Open();

                return Convert.ToInt32(
                    cmd.ExecuteScalar());
            }
        }

        public int ObtenerPedidosDiseno()
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query =
                    "SELECT COUNT(*) FROM Pedidos WHERE Estado='Diseño'";

                SqlCommand cmd =
                    new SqlCommand(query, conn);

                conn.Open();

                return Convert.ToInt32(
                    cmd.ExecuteScalar());
            }
        }

        public int ObtenerPedidosProduccion()
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query =
                    "SELECT COUNT(*) FROM Pedidos WHERE Estado='Producción'";

                SqlCommand cmd =
                    new SqlCommand(query, conn);

                conn.Open();

                return Convert.ToInt32(
                    cmd.ExecuteScalar());
            }
        }

        public int ObtenerPedidosFinalizados()
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query =
                    "SELECT COUNT(*) FROM Pedidos WHERE Estado='Finalizado'";

                SqlCommand cmd =
                    new SqlCommand(query, conn);

                conn.Open();

                return Convert.ToInt32(
                    cmd.ExecuteScalar());
            }
        }

        public int ObtenerTotalClientes()
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query =
                    "SELECT COUNT(*) FROM Clientes";

                SqlCommand cmd =
                    new SqlCommand(query, conn);

                conn.Open();

                return Convert.ToInt32(
                    cmd.ExecuteScalar());
            }
        }

        public decimal ObtenerVentasTotales()
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query =
                    "SELECT ISNULL(SUM(Total),0) FROM Pedidos";

                SqlCommand cmd =
                    new SqlCommand(query, conn);

                conn.Open();

                return Convert.ToDecimal(
                    cmd.ExecuteScalar());
            }
        }

        public List<SeguimientoPedido> ObtenerUltimosSeguimientos()
        {
            List<SeguimientoPedido> lista =
                new List<SeguimientoPedido>();

            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                SELECT TOP 5 *
                FROM SeguimientoPedido
                ORDER BY Fecha DESC";

                SqlCommand cmd =
                    new SqlCommand(query, conn);

                conn.Open();

                SqlDataReader reader =
                    cmd.ExecuteReader();

                while (reader.Read())
                {
                    SeguimientoPedido s =
                        new SeguimientoPedido();

                    s.IdSeguimiento =
                        Convert.ToInt32(reader["IdSeguimiento"]);

                    s.IdPedido =
                        Convert.ToInt32(reader["IdPedido"]);

                    s.Fecha =
                        Convert.ToDateTime(reader["Fecha"]);

                    s.Estado =
                        reader["Estado"].ToString();

                    s.Etapa =
                        reader["Etapa"].ToString();

                    s.Comentario =
                        reader["Comentario"].ToString();

                    lista.Add(s);
                }
            }

            return lista;
        }

        public List<Pedido> ObtenerUltimosPedidos()
        {
            List<Pedido> lista =
                new List<Pedido>();

            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                SELECT TOP 5
                    p.*,
                    c.Nombre
                FROM Pedidos p
                INNER JOIN Clientes c
                    ON p.IdCliente = c.IdCliente
                ORDER BY p.IdPedido DESC";

                SqlCommand cmd =
                    new SqlCommand(query, conn);

                conn.Open();

                SqlDataReader reader =
                    cmd.ExecuteReader();

                while (reader.Read())
                {
                    Pedido pedido =
                        new Pedido();

                    pedido.IdPedido =
                        Convert.ToInt32(reader["IdPedido"]);

                    pedido.NombreCliente =
                        reader["Nombre"].ToString();

                    pedido.Estado =
                        reader["Estado"].ToString();

                    lista.Add(pedido);
                }
            }

            return lista;
        }

        public List<Pedido> ObtenerProximasEntregas()
        {
            List<Pedido> lista =
                new List<Pedido>();

            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                SELECT TOP 5
                    IdPedido,
                    FechaEntrega
                FROM Pedidos
                WHERE FechaEntrega >= GETDATE()
                ORDER BY FechaEntrega ASC";

                SqlCommand cmd =
                    new SqlCommand(query, conn);

                conn.Open();

                SqlDataReader reader =
                    cmd.ExecuteReader();

                while (reader.Read())
                {
                    Pedido pedido =
                        new Pedido();

                    pedido.IdPedido =
                        Convert.ToInt32(reader["IdPedido"]);

                    pedido.FechaEntrega =
                        Convert.ToDateTime(reader["FechaEntrega"]);

                    lista.Add(pedido);
                }
            }

            return lista;
        }

        public List<GraficoItem> ObtenerPedidosPorEstado()
        {
            List<GraficoItem> lista =
                new List<GraficoItem>();

            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                SELECT Estado,
                       COUNT(*) Total
                FROM Pedidos
                GROUP BY Estado";

                SqlCommand cmd =
                    new SqlCommand(query, conn);

                conn.Open();

                SqlDataReader reader =
                    cmd.ExecuteReader();

                while (reader.Read())
                {
                    lista.Add(new GraficoItem
                    {
                        Nombre = reader["Estado"].ToString(),
                        Total = Convert.ToInt32(reader["Total"])
                    });
                }
            }

            return lista;
        }

        public List<GraficoItem> ObtenerPedidosPorEtapa()
        {
            List<GraficoItem> lista =
                new List<GraficoItem>();

            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                SELECT EtapaActual,
                       COUNT(*) Total
                FROM Pedidos
                GROUP BY EtapaActual";

                SqlCommand cmd =
                    new SqlCommand(query, conn);

                conn.Open();

                SqlDataReader reader =
                    cmd.ExecuteReader();

                while (reader.Read())
                {
                    lista.Add(new GraficoItem
                    {
                        Nombre = reader["EtapaActual"].ToString(),
                        Total = Convert.ToInt32(reader["Total"])
                    });
                }
            }

            return lista;
        }

        public List<GraficoItem> ObtenerProduccionMensual()
        {
            List<GraficoItem> lista =
                new List<GraficoItem>();

            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                SELECT
                    DATENAME(MONTH, FechaEntrega) Mes,
                    MONTH(FechaEntrega) NumeroMes,
                    COUNT(*) Total
                FROM Pedidos
                GROUP BY
                    DATENAME(MONTH, FechaEntrega),
                    MONTH(FechaEntrega)
                ORDER BY NumeroMes";

                SqlCommand cmd =
                    new SqlCommand(query, conn);

                conn.Open();

                SqlDataReader reader =
                    cmd.ExecuteReader();

                while (reader.Read())
                {
                    lista.Add(new GraficoItem
                    {
                        Nombre = reader["Mes"].ToString(),
                        Total = Convert.ToInt32(reader["Total"])
                    });
                }
            }

            return lista;
        }

        public decimal ObtenerCrecimientoPedidos()
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                DECLARE @MesActual INT = MONTH(GETDATE())
                DECLARE @MesAnterior INT = MONTH(DATEADD(MONTH,-1,GETDATE()))

                DECLARE @Actual INT =
                (
                    SELECT COUNT(*)
                    FROM Pedidos
                    WHERE MONTH(FechaPedido) = @MesActual
                )

                DECLARE @Anterior INT =
                (
                    SELECT COUNT(*)
                    FROM Pedidos
                    WHERE MONTH(FechaPedido) = @MesAnterior
                )

                SELECT
                CASE
                    WHEN @Anterior = 0 THEN 100
                    ELSE ((@Actual - @Anterior) * 100.0) / @Anterior
                END";

                SqlCommand cmd =
                    new SqlCommand(query, conn);

                conn.Open();

                return Convert.ToDecimal(
                    cmd.ExecuteScalar());
            }
        }
        public List<GraficoItem> ObtenerVentasPorMes()
        {
            List<GraficoItem> lista =
                new List<GraficoItem>();

            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
        SELECT
            DATENAME(MONTH, FechaPedido) Mes,
            MONTH(FechaPedido) NumeroMes,
            SUM(Total) TotalVentas
        FROM Pedidos
        GROUP BY
            DATENAME(MONTH, FechaPedido),
            MONTH(FechaPedido)
        ORDER BY NumeroMes";

                SqlCommand cmd =
                    new SqlCommand(query, conn);

                conn.Open();

                SqlDataReader reader =
                    cmd.ExecuteReader();

                while (reader.Read())
                {
                    lista.Add(new GraficoItem
                    {
                        Nombre =
                            reader["Mes"].ToString(),

                        Total =
                            Convert.ToInt32(
                                reader["TotalVentas"])
                    });
                }
            }

            return lista;
        }
    }
}