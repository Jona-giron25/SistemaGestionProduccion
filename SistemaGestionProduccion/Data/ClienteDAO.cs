using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using SistemaGestionProduccion.Models;

namespace SistemaGestionProduccion.Data
{
    public class ClienteDAO
    {
        // Obtener todos los clientes
        public List<Cliente> ObtenerClientes()
        {
            List<Cliente> lista = new List<Cliente>();

            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "SELECT * FROM Clientes";

                SqlCommand cmd = new SqlCommand(query, conexion);

                conexion.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Cliente cliente = new Cliente()
                    {
                        IdCliente = Convert.ToInt32(reader["IdCliente"]),
                        Nombre = reader["Nombre"].ToString(),
                        Telefono = reader["Telefono"].ToString(),
                        Correo = reader["Correo"].ToString(),
                        Direccion = reader["Direccion"].ToString(),
                        RTN = reader["RTN"].ToString()
                    };

                    lista.Add(cliente);
                }
            }

            return lista;
        }

        // Insertar cliente
        public bool InsertarCliente(Cliente cliente)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"INSERT INTO Clientes
                (Nombre, Telefono, Correo, Direccion, RTN)
                VALUES
                (@Nombre, @Telefono, @Correo, @Direccion, @RTN)";

                SqlCommand cmd = new SqlCommand(query, conexion);

                cmd.Parameters.AddWithValue("@Nombre", cliente.Nombre);
                cmd.Parameters.AddWithValue("@Telefono", cliente.Telefono);
                cmd.Parameters.AddWithValue("@Correo", cliente.Correo);
                cmd.Parameters.AddWithValue("@Direccion", cliente.Direccion);
                cmd.Parameters.AddWithValue("@RTN", cliente.RTN);

                conexion.Open();

                return cmd.ExecuteNonQuery() > 0;
            }
        }
        // Obtener cliente por ID
        public Cliente ObtenerClientePorId(int idCliente)
        {
            Cliente cliente = null;

            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "SELECT * FROM Clientes WHERE IdCliente = @IdCliente";

                SqlCommand cmd = new SqlCommand(query, conexion);

                cmd.Parameters.AddWithValue("@IdCliente", idCliente);

                conexion.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    cliente = new Cliente()
                    {
                        IdCliente = Convert.ToInt32(reader["IdCliente"]),
                        Nombre = reader["Nombre"].ToString(),
                        Telefono = reader["Telefono"].ToString(),
                        Correo = reader["Correo"].ToString(),
                        Direccion = reader["Direccion"].ToString(),
                        RTN = reader["RTN"].ToString()
                    };
                }
            }

            return cliente;
        }
        // Actualizar cliente
        public bool ActualizarCliente(Cliente cliente)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"UPDATE Clientes
         SET Nombre = @Nombre,
             Telefono = @Telefono,
             Correo = @Correo,
             Direccion = @Direccion,
             RTN = @RTN
         WHERE IdCliente = @IdCliente";
                SqlCommand cmd = new SqlCommand(query, conexion);

                cmd.Parameters.AddWithValue("@IdCliente", cliente.IdCliente);
                cmd.Parameters.AddWithValue("@Nombre", cliente.Nombre);
                cmd.Parameters.AddWithValue("@Telefono", cliente.Telefono);
                cmd.Parameters.AddWithValue("@Correo", cliente.Correo);
                cmd.Parameters.AddWithValue("@Direccion", cliente.Direccion);
                cmd.Parameters.AddWithValue("@RTN", cliente.RTN);

                conexion.Open();

                return cmd.ExecuteNonQuery() > 0;
            }
        }
        // Eliminar cliente
        public bool EliminarCliente(int idCliente)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "DELETE FROM Clientes WHERE IdCliente = @IdCliente";

                SqlCommand cmd = new SqlCommand(query, conexion);

                cmd.Parameters.AddWithValue("@IdCliente", idCliente);

                conexion.Open();

                return cmd.ExecuteNonQuery() > 0;
            }
        }
        public int ObtenerTotalClientes()
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "SELECT COUNT(*) FROM Clientes";

                SqlCommand cmd = new SqlCommand(query, conexion);

                conexion.Open();

                return (int)cmd.ExecuteScalar();
            }
        }
    }
}