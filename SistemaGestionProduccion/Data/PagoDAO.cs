using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using SistemaGestionProduccion.Models;

namespace SistemaGestionProduccion.Data
{
    public class PagoDAO
    {
        public List<PagoResumen> ObtenerResumenPagos()
        {
            List<PagoResumen> lista = new List<PagoResumen>();

            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
                SELECT
                    p.IdPedido,
                    c.Nombre AS Cliente,
                    p.Total,

                    ISNULL(
                    (
                        SELECT SUM(pg.Monto)
                        FROM Pagos pg
                        WHERE pg.IdPedido = p.IdPedido
                    ),0) AS Pagado

                FROM Pedidos p
                INNER JOIN Clientes c
                    ON p.IdCliente = c.IdCliente

                ORDER BY p.IdPedido DESC";

                SqlCommand cmd = new SqlCommand(query, conexion);

                conexion.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    decimal total = Convert.ToDecimal(reader["Total"]);
                    decimal pagado = Convert.ToDecimal(reader["Pagado"]);
                    decimal saldo = total - pagado;

                    string estado = "Pendiente";

                    if (pagado == 0)
                        estado = "Pendiente";
                    else if (pagado < total)
                        estado = "Anticipo";
                    else
                        estado = "Pagado";

                    lista.Add(new PagoResumen()
                    {
                        IdPedido = Convert.ToInt32(reader["IdPedido"]),
                        Cliente = reader["Cliente"].ToString(),
                        Total = total,
                        Pagado = pagado,
                        Saldo = saldo,
                        EstadoPago = estado
                    });
                }
            }

            return lista;
        }

        public decimal ObtenerIngresosTotales()
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
                SELECT ISNULL(SUM(Monto),0)
                FROM Pagos";

                SqlCommand cmd = new SqlCommand(query, conexion);

                conexion.Open();

                return Convert.ToDecimal(cmd.ExecuteScalar());
            }
        }

        public decimal ObtenerSaldoPendiente()
        {
            decimal totalPedidos = 0;
            decimal totalPagado = 0;

            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                conexion.Open();

                SqlCommand cmd1 =
                    new SqlCommand("SELECT ISNULL(SUM(Total),0) FROM Pedidos", conexion);

                totalPedidos = Convert.ToDecimal(cmd1.ExecuteScalar());

                SqlCommand cmd2 =
                    new SqlCommand("SELECT ISNULL(SUM(Monto),0) FROM Pagos", conexion);

                totalPagado = Convert.ToDecimal(cmd2.ExecuteScalar());
            }

            return totalPedidos - totalPagado;
        }

        public int ObtenerPedidosPagados()
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
                SELECT COUNT(*)
                FROM
                (
                    SELECT
                        p.IdPedido
                    FROM Pedidos p
                    LEFT JOIN Pagos pg
                        ON p.IdPedido = pg.IdPedido
                    GROUP BY p.IdPedido, p.Total
                    HAVING ISNULL(SUM(pg.Monto),0) >= p.Total
                ) t";

                SqlCommand cmd = new SqlCommand(query, conexion);

                conexion.Open();

                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        public int ObtenerPedidosAnticipo()
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
        SELECT COUNT(*)
        FROM
        (
            SELECT
                p.IdPedido,
                p.Total,
                ISNULL(SUM(pg.Monto),0) AS Pagado
            FROM Pedidos p
            LEFT JOIN Pagos pg
                ON p.IdPedido = pg.IdPedido
            GROUP BY p.IdPedido, p.Total
        ) t
        WHERE Pagado > 0
        AND Pagado < Total";

                SqlCommand cmd = new SqlCommand(query, conexion);

                conexion.Open();

                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }
        public bool InsertarPago(Pago pago)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
INSERT INTO Pagos
(
    IdPedido,
    Monto,
    FechaPago,
    TipoPago,
    UsuarioCobro
)
VALUES
(
    @IdPedido,
    @Monto,
    GETDATE(),
    @TipoPago,
    @UsuarioCobro
)";

                SqlCommand cmd = new SqlCommand(query, conexion);

                cmd.Parameters.AddWithValue("@IdPedido", pago.IdPedido);
                cmd.Parameters.AddWithValue("@Monto", pago.Monto);
                cmd.Parameters.AddWithValue("@TipoPago", pago.TipoPago);
                cmd.Parameters.AddWithValue(
    "@UsuarioCobro",
    pago.UsuarioCobro
);

                conexion.Open();

                return cmd.ExecuteNonQuery() > 0;
            }
        }
        public List<Pago> ObtenerPagosPorPedido(int idPedido)
        {
            List<Pago> lista = new List<Pago>();

            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
        SELECT *
        FROM Pagos
        WHERE IdPedido = @IdPedido
        ORDER BY FechaPago DESC";

                SqlCommand cmd = new SqlCommand(query, conexion);

                cmd.Parameters.AddWithValue("@IdPedido", idPedido);

                conexion.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    lista.Add(new Pago()
                    {
                        IdPago = Convert.ToInt32(reader["IdPago"]),
                        IdPedido = Convert.ToInt32(reader["IdPedido"]),
                        Monto = Convert.ToDecimal(reader["Monto"]),
                        FechaPago = Convert.ToDateTime(reader["FechaPago"]),
                        TipoPago = reader["TipoPago"].ToString(),
                        UsuarioCobro = reader["UsuarioCobro"].ToString()
                    });
                }
            }

            return lista;
        }
        public PagoResumen ObtenerResumenPorPedido(int idPedido)
        {
            PagoResumen pago = null;

            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
        SELECT
            p.IdPedido,
            p.Total,
            ISNULL(SUM(pg.Monto),0) AS Pagado
        FROM Pedidos p
        LEFT JOIN Pagos pg
            ON p.IdPedido = pg.IdPedido
        WHERE p.IdPedido = @IdPedido
        GROUP BY p.IdPedido, p.Total";

                SqlCommand cmd = new SqlCommand(query, conexion);

                cmd.Parameters.AddWithValue("@IdPedido", idPedido);

                conexion.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    decimal total =
                        Convert.ToDecimal(reader["Total"]);

                    decimal pagado =
                        Convert.ToDecimal(reader["Pagado"]);

                    pago = new PagoResumen()
                    {
                        IdPedido = idPedido,
                        Total = total,
                        Pagado = pagado,
                        Saldo = total - pagado
                    };
                }
            }

            return pago;
        }
    }
}