using System;

namespace SistemaGestionProduccion.Models
{
    public class Usuario
    {
        public int IdUsuario { get; set; }

        public string Nombre { get; set; }

        public string UsuarioLogin { get; set; }

        public string Correo { get; set; }

        public string Clave { get; set; }

        public string Rol { get; set; }

        public bool Estado { get; set; }
    }
}