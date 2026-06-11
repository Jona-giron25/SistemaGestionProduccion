using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using SistemaGestionProduccion.Models;

namespace SistemaGestionProduccion.Data
{
    public class SeguimientoPedidoDAO
    {
        public bool GuardarSeguimiento(SeguimientoPedido seguimiento)
        {
            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                INSERT INTO SeguimientoPedido
                (
                    IdPedido,
                    Fecha,
                    Estado,
                    Etapa,
                    Comentario,
                    Usuario
                )
                VALUES
                (
                    @IdPedido,
                    @Fecha,
                    @Estado,
                    @Etapa,
                    @Comentario,
                    @Usuario
                )";

                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@IdPedido", seguimiento.IdPedido);
                cmd.Parameters.AddWithValue("@Fecha", seguimiento.Fecha);
                cmd.Parameters.AddWithValue("@Estado", seguimiento.Estado);
                cmd.Parameters.AddWithValue("@Etapa", seguimiento.Etapa);
                cmd.Parameters.AddWithValue("@Comentario", seguimiento.Comentario);
                cmd.Parameters.AddWithValue("@Usuario", seguimiento.Usuario);

                conn.Open();

                return cmd.ExecuteNonQuery() > 0;
            }
        }

        public List<SeguimientoPedido> ObtenerSeguimientos(int idPedido)
        {
            List<SeguimientoPedido> lista =
                new List<SeguimientoPedido>();

            using (SqlConnection conn = Conexion.ObtenerConexion())
            {
                string query = @"
                SELECT *
                FROM SeguimientoPedido
                WHERE IdPedido = @IdPedido
                ORDER BY Fecha DESC";

                SqlCommand cmd =
                    new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@IdPedido", idPedido);

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

                    s.Usuario =
                        reader["Usuario"].ToString();

                    lista.Add(s);
                }
            }

            return lista;
        }
    }
}