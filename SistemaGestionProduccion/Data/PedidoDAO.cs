using SistemaGestionProduccion.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace SistemaGestionProduccion.Data
{
    public class PedidoDAO
    {
        public bool GuardarPedido(Pedido pedido)
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"INSERT INTO Pedidos
                                (
                                    IdCliente,
                                    FechaPedido,
                                    FechaEntrega,
                                    TipoTrabajo,
                                    Descripcion,
                                    Estado,
                                    Total
                                )
                                VALUES
                                (
                                    @IdCliente,
                                    @FechaPedido,
                                    @FechaEntrega,
                                    @TipoTrabajo,
                                    @Descripcion,
                                    @Estado,
                                    @Total
                                )";

                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@IdCliente", pedido.IdCliente);
                cmd.Parameters.AddWithValue("@FechaPedido", pedido.FechaPedido);
                cmd.Parameters.AddWithValue("@FechaEntrega", pedido.FechaEntrega);
                cmd.Parameters.AddWithValue("@TipoTrabajo", pedido.TipoTrabajo);
                cmd.Parameters.AddWithValue("@Descripcion", pedido.Descripcion);
                cmd.Parameters.AddWithValue("@Estado", pedido.Estado);
                cmd.Parameters.AddWithValue("@Total", pedido.Total);

                conn.Open();

                return cmd.ExecuteNonQuery() > 0;
            }
        }
        public bool ActualizarEtapaPedido(
    int idPedido,
    string etapa)
        {
            using (SqlConnection conn =
                Conexion.ObtenerConexion())
            {
                string query = @"
        UPDATE Pedidos
        SET EtapaActual = @EtapaActual
        WHERE IdPedido = @IdPedido";

                SqlCommand cmd =
                    new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue(
                    "@EtapaActual",
                    etapa);

                cmd.Parameters.AddWithValue(
                    "@IdPedido",
                    idPedido);

                conn.Open();

                return cmd.ExecuteNonQuery() > 0;
            }
        }
        public Pedido ObtenerPedidoPorId(int idPedido)
        {
            Pedido pedido = null;

            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
            SELECT
                p.*,
                c.Nombre
            FROM Pedidos p
            INNER JOIN Clientes c
                ON p.IdCliente = c.IdCliente
            WHERE p.IdPedido = @IdPedido";

                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@IdPedido", idPedido);

                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    pedido = new Pedido();

                    pedido.IdPedido =
                        Convert.ToInt32(reader["IdPedido"]);

                    pedido.IdCliente =
                        Convert.ToInt32(reader["IdCliente"]);

                    pedido.NombreCliente =
                        reader["Nombre"].ToString();

                    pedido.FechaPedido =
                        Convert.ToDateTime(reader["FechaPedido"]);

                    pedido.FechaEntrega =
                        Convert.ToDateTime(reader["FechaEntrega"]);

                    pedido.TipoTrabajo =
                        reader["TipoTrabajo"].ToString();

                    pedido.Descripcion =
                        reader["Descripcion"].ToString();

                    pedido.Estado =
                        reader["Estado"].ToString();

                    pedido.EtapaActual =
    reader["EtapaActual"]?.ToString();

                    pedido.Total =
                        Convert.ToDecimal(reader["Total"]);
                }
            }

            return pedido;
        }
        public List<Pedido> ObtenerPedidos()
        {
            List<Pedido> lista = new List<Pedido>();

            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
            SELECT
                p.*,
                c.Nombre
            FROM Pedidos p
            INNER JOIN Clientes c
                ON p.IdCliente = c.IdCliente
            ORDER BY p.IdPedido DESC";

                SqlCommand cmd = new SqlCommand(query, conn);

                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Pedido pedido = new Pedido();

                    pedido.IdPedido =
                        Convert.ToInt32(reader["IdPedido"]);

                    pedido.IdCliente =
                        Convert.ToInt32(reader["IdCliente"]);

                    pedido.NombreCliente =
                        reader["Nombre"].ToString();

                    pedido.FechaPedido =
                        Convert.ToDateTime(reader["FechaPedido"]);

                    pedido.FechaEntrega =
                        Convert.ToDateTime(reader["FechaEntrega"]);

                    pedido.TipoTrabajo =
                        reader["TipoTrabajo"].ToString();

                    pedido.Descripcion =
                        reader["Descripcion"].ToString();

                    pedido.Estado =
                        reader["Estado"].ToString();

                    pedido.EtapaActual =
    reader["EtapaActual"].ToString();

                    pedido.Total =
                        Convert.ToDecimal(reader["Total"]);

                    lista.Add(pedido);
                }
            }

            return lista;
        }
        public bool ActualizarEstadoPedido(int idPedido, string estado)
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
        UPDATE Pedidos
        SET Estado = @Estado
        WHERE IdPedido = @IdPedido";

                SqlCommand cmd =
                    new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@Estado", estado);
                cmd.Parameters.AddWithValue("@IdPedido", idPedido);

                conn.Open();

                return cmd.ExecuteNonQuery() > 0;
            }
        }

    }
}