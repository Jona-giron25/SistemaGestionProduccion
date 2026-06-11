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

                SqlCommand cmd = new SqlCommand(query, conn);

                conn.Open();

                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        public int ObtenerPedidosDiseno()
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query =
                    "SELECT COUNT(*) FROM Pedidos WHERE Estado='Diseño'";

                SqlCommand cmd = new SqlCommand(query, conn);

                conn.Open();

                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        public int ObtenerPedidosProduccion()
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query =
                    "SELECT COUNT(*) FROM Pedidos WHERE Estado='Producción'";

                SqlCommand cmd = new SqlCommand(query, conn);

                conn.Open();

                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        public int ObtenerPedidosFinalizados()
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query =
                    "SELECT COUNT(*) FROM Pedidos WHERE Estado='Finalizado'";

                SqlCommand cmd = new SqlCommand(query, conn);

                conn.Open();

                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        public int ObtenerTotalClientes()
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query =
                    "SELECT COUNT(*) FROM Clientes";

                SqlCommand cmd = new SqlCommand(query, conn);

                conn.Open();

                return Convert.ToInt32(cmd.ExecuteScalar());
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
    }
}