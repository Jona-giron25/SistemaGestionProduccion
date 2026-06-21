using SistemaGestionProduccion.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace SistemaGestionProduccion.Data
{
    public class CalendarioDAO
    {
        public int ObtenerEventosHoy()
        {
            using (SqlConnection cn = Conexion.ObtenerConexion())
            {
                string sql = @"
                SELECT COUNT(*)
                FROM Pedidos
                WHERE CAST(FechaEntrega AS DATE) =
                      CAST(GETDATE() AS DATE)";

                SqlCommand cmd = new SqlCommand(sql, cn);

                cn.Open();

                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        public int ObtenerProduccion()
        {
            using (SqlConnection cn = Conexion.ObtenerConexion())
            {
                string sql = @"
                SELECT COUNT(*)
                FROM Pedidos
                WHERE Estado='Producción'";

                SqlCommand cmd = new SqlCommand(sql, cn);

                cn.Open();

                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        public List<Pedido> ObtenerEntregas()
        {
            List<Pedido> lista = new List<Pedido>();

            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
        SELECT
            P.IdPedido,
            P.FechaEntrega,
            P.TipoTrabajo,
            P.Estado,
            P.Total,
            C.Nombre AS NombreCliente
        FROM Pedidos P
        INNER JOIN Clientes C
            ON P.IdCliente = C.IdCliente
        ORDER BY P.FechaEntrega";

                SqlCommand cmd = new SqlCommand(query, conexion);

                conexion.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    lista.Add(new Pedido()
                    {
                        IdPedido = Convert.ToInt32(reader["IdPedido"]),
                        NombreCliente = reader["NombreCliente"].ToString(),
                        TipoTrabajo = reader["TipoTrabajo"].ToString(),
                        Estado = reader["Estado"].ToString(),
                        FechaEntrega = Convert.ToDateTime(reader["FechaEntrega"]),
                        Total = Convert.ToDecimal(reader["Total"])
                    });
                }
            }

            return lista;
        }
        public int ObtenerUrgentes()
        {
            using (SqlConnection cn = Conexion.ObtenerConexion())
            {
                string sql = @"
                SELECT COUNT(*)
                FROM Pedidos
                WHERE DATEDIFF(DAY,GETDATE(),FechaEntrega)<=3
                AND Estado<>'Finalizado'";

                SqlCommand cmd = new SqlCommand(sql, cn);

                cn.Open();

                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        public int ObtenerTotalEntregas()
        {
            using (SqlConnection cn = Conexion.ObtenerConexion())
            {
                string sql = @"
        SELECT COUNT(*)
        FROM Pedidos";

                SqlCommand cmd = new SqlCommand(sql, cn);

                cn.Open();

                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }
        public List<Pedido> ObtenerPedidosMes(int mes, int anio)
        {
            List<Pedido> lista = new List<Pedido>();

            using (SqlConnection cn = Conexion.ObtenerConexion())
            {
                string sql = @"
        SELECT
            P.IdPedido,
            C.Nombre,
            P.TipoTrabajo,
            P.Estado,
            P.FechaEntrega
        FROM Pedidos P
        INNER JOIN Clientes C
            ON P.IdCliente = C.IdCliente
        WHERE MONTH(P.FechaEntrega)=@Mes
        AND YEAR(P.FechaEntrega)=@Anio";

                SqlCommand cmd = new SqlCommand(sql, cn);

                cmd.Parameters.AddWithValue("@Mes", mes);
                cmd.Parameters.AddWithValue("@Anio", anio);

                cn.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new Pedido()
                    {
                        IdPedido = Convert.ToInt32(dr["IdPedido"]),
                        NombreCliente = dr["Nombre"].ToString(),
                        TipoTrabajo = dr["TipoTrabajo"].ToString(),
                        Estado = dr["Estado"].ToString(),
                        FechaEntrega = Convert.ToDateTime(dr["FechaEntrega"])
                    });
                }
            }

            return lista;
        }
    }
}