using System;
using System.Data.SqlClient;
using SistemaGestionProduccion.Models;

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
    }
}