using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using SistemaGestionProduccion.Models;

namespace SistemaGestionProduccion.Data
{
    public class NotificacionDAO
    {
        public bool InsertarNotificacion(
            string titulo,
            string mensaje)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
                INSERT INTO Notificaciones
                (
                    Titulo,
                    Mensaje,
                    Fecha,
                    Leida
                )
                VALUES
                (
                    @Titulo,
                    @Mensaje,
                    GETDATE(),
                    0
                )";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                cmd.Parameters.AddWithValue("@Titulo", titulo);
                cmd.Parameters.AddWithValue("@Mensaje", mensaje);

                conexion.Open();

                return cmd.ExecuteNonQuery() > 0;
            }
        }

        public List<Notificacion> ObtenerNotificaciones()
        {
            List<Notificacion> lista =
                new List<Notificacion>();

            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
                SELECT TOP 20 *
                FROM Notificaciones
                ORDER BY Fecha DESC";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                conexion.Open();

                SqlDataReader reader =
                    cmd.ExecuteReader();

                while (reader.Read())
                {
                    lista.Add(new Notificacion()
                    {
                        IdNotificacion =
                            Convert.ToInt32(reader["IdNotificacion"]),

                        Titulo =
                            reader["Titulo"].ToString(),

                        Mensaje =
                            reader["Mensaje"].ToString(),

                        Fecha =
                            Convert.ToDateTime(reader["Fecha"]),

                        Leida =
                            Convert.ToBoolean(reader["Leida"])
                    });
                }
            }

            return lista;
        }

        public int ObtenerNoLeidas()
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query =
                    "SELECT COUNT(*) FROM Notificaciones WHERE Leida = 0";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                conexion.Open();

                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }
        public void MarcarComoLeidas()
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
        UPDATE Notificaciones
        SET Leida = 1
        WHERE Leida = 0";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                conexion.Open();

                cmd.ExecuteNonQuery();
            }
        }
    }
}