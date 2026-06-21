using System;

namespace SistemaGestionProduccion.Models
{
    public class Notificacion
    {
        public int IdNotificacion { get; set; }

        public string Titulo { get; set; }

        public string Mensaje { get; set; }

        public DateTime Fecha { get; set; }

        public bool Leida { get; set; }
    }
}