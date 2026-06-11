using System;

namespace SistemaGestionProduccion.Models
{
    public class SeguimientoPedido
    {
        public int IdSeguimiento { get; set; }

        public int IdPedido { get; set; }

        public DateTime Fecha { get; set; }

        public string Estado { get; set; }

        public string Etapa { get; set; }

        public string Comentario { get; set; }

        public string Usuario { get; set; }
    }
}