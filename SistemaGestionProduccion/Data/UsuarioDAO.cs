using SistemaGestionProduccion.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace SistemaGestionProduccion.Data
{
    public class UsuarioDAO
    {
        public Usuario ValidarUsuario(string usuario, string clave)
        {
            Usuario usuarioEncontrado = null;

            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
                    SELECT *
                    FROM Usuarios
                    WHERE Usuario = @Usuario
                    AND Clave = @Clave
                    AND Estado = 1";

                SqlCommand cmd = new SqlCommand(query, conexion);

                cmd.Parameters.AddWithValue("@Usuario", usuario);
                cmd.Parameters.AddWithValue("@Clave", clave);

                conexion.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    usuarioEncontrado = new Usuario
                    {
                        IdUsuario = Convert.ToInt32(dr["IdUsuario"]),
                        Nombre = dr["Nombre"].ToString(),
                        UsuarioLogin = dr["Usuario"].ToString(),
                        Correo = dr["Correo"].ToString(),
                        Clave = dr["Clave"].ToString(),
                        Rol = dr["Rol"].ToString(),
                        Estado = Convert.ToBoolean(dr["Estado"])
                    };
                }
            }

            return usuarioEncontrado;
        }

        public List<Usuario> ObtenerUsuarios()
        {
            List<Usuario> lista = new List<Usuario>();

            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query =
                    "SELECT * FROM Usuarios ORDER BY Nombre";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                conexion.Open();

                SqlDataReader dr =
                    cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new Usuario()
                    {
                        IdUsuario =
                            Convert.ToInt32(dr["IdUsuario"]),

                        Nombre =
                            dr["Nombre"].ToString(),

                        UsuarioLogin =
                            dr["Usuario"].ToString(),

                        Correo =
                            dr["Correo"].ToString(),

                        Clave =
                            dr["Clave"].ToString(),

                        Rol =
                            dr["Rol"].ToString(),

                        Estado =
                            Convert.ToBoolean(dr["Estado"])
                    });
                }
            }

            return lista;
        }

        public int ObtenerTotalUsuarios()
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query =
                    "SELECT COUNT(*) FROM Usuarios";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                conexion.Open();

                return Convert.ToInt32(
                    cmd.ExecuteScalar());
            }
        }

        public int ObtenerTotalRoles()
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query =
                    "SELECT COUNT(DISTINCT Rol) FROM Usuarios";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                conexion.Open();

                return Convert.ToInt32(
                    cmd.ExecuteScalar());
            }
        }

        public int ObtenerAdministradores()
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query =
                    "SELECT COUNT(*) FROM Usuarios WHERE Rol = 'Admin'";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                conexion.Open();

                return Convert.ToInt32(
                    cmd.ExecuteScalar());
            }
        }

        public int ObtenerUsuariosActivos()
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query =
                    "SELECT COUNT(*) FROM Usuarios WHERE Estado = 1";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                conexion.Open();

                return Convert.ToInt32(
                    cmd.ExecuteScalar());
            }
        }

        public Usuario ObtenerUsuarioPorId(int idUsuario)
        {
            Usuario usuario = null;

            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query =
                    "SELECT * FROM Usuarios WHERE IdUsuario = @IdUsuario";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                cmd.Parameters.AddWithValue("@IdUsuario", idUsuario);

                conexion.Open();

                SqlDataReader dr =
                    cmd.ExecuteReader();

                if (dr.Read())
                {
                    usuario = new Usuario()
                    {
                        IdUsuario =
                            Convert.ToInt32(dr["IdUsuario"]),

                        Nombre =
                            dr["Nombre"].ToString(),

                        UsuarioLogin =
                            dr["Usuario"].ToString(),

                        Correo =
                            dr["Correo"].ToString(),

                        Clave =
                            dr["Clave"].ToString(),

                        Rol =
                            dr["Rol"].ToString(),

                        Estado =
                            Convert.ToBoolean(dr["Estado"])
                    };
                }
            }

            return usuario;
        }
        public bool InsertarUsuario(Usuario usuario)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
        INSERT INTO Usuarios
        (
            Nombre,
            Usuario,
            Correo,
            Clave,
            Rol,
            Estado
        )
        VALUES
        (
            @Nombre,
            @Usuario,
            @Correo,
            @Clave,
            @Rol,
            @Estado
        )";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                cmd.Parameters.AddWithValue("@Nombre", usuario.Nombre);
                cmd.Parameters.AddWithValue("@Usuario", usuario.UsuarioLogin);
                cmd.Parameters.AddWithValue("@Correo", usuario.Correo);
                cmd.Parameters.AddWithValue("@Clave", usuario.Clave);
                cmd.Parameters.AddWithValue("@Rol", usuario.Rol);
                cmd.Parameters.AddWithValue("@Estado", usuario.Estado);

                conexion.Open();

                return cmd.ExecuteNonQuery() > 0;
            }
        }
        public bool ActualizarUsuario(Usuario usuario)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
        UPDATE Usuarios
        SET
            Nombre = @Nombre,
            Usuario = @Usuario,
            Correo = @Correo,
            Rol = @Rol,
            Estado = @Estado
        WHERE IdUsuario = @IdUsuario";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                cmd.Parameters.AddWithValue("@IdUsuario", usuario.IdUsuario);
                cmd.Parameters.AddWithValue("@Nombre", usuario.Nombre);
                cmd.Parameters.AddWithValue("@Usuario", usuario.UsuarioLogin);
                cmd.Parameters.AddWithValue("@Correo", usuario.Correo);
                cmd.Parameters.AddWithValue("@Rol", usuario.Rol);
                cmd.Parameters.AddWithValue("@Estado", usuario.Estado);

                conexion.Open();

                return cmd.ExecuteNonQuery() > 0;
            }
        }
        public bool CambiarEstadoUsuario(
    int idUsuario,
    bool estado)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
        UPDATE Usuarios
        SET Estado = @Estado
        WHERE IdUsuario = @IdUsuario";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                cmd.Parameters.AddWithValue("@IdUsuario", idUsuario);
                cmd.Parameters.AddWithValue("@Estado", estado);

                conexion.Open();

                return cmd.ExecuteNonQuery() > 0;
            }
        }
        public bool CambiarClave(
    int idUsuario,
    string clave)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = @"
        UPDATE Usuarios
        SET Clave = @Clave
        WHERE IdUsuario = @IdUsuario";

                SqlCommand cmd =
                    new SqlCommand(query, conexion);

                cmd.Parameters.AddWithValue("@IdUsuario", idUsuario);
                cmd.Parameters.AddWithValue("@Clave", clave);

                conexion.Open();

                return cmd.ExecuteNonQuery() > 0;
            }
        }

    }
}