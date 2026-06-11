using System.Configuration;
using System.Data.SqlClient;

namespace SistemaGestionProduccion.Data
{
    public class Conexion
    {
        public static SqlConnection ObtenerConexion()
        {
            string cadena = ConfigurationManager
                .ConnectionStrings["ConexionDB"]
                .ConnectionString;

            return new SqlConnection(cadena);
        }
    }
}