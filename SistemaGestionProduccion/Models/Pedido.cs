using System;

namespace SistemaGestionProduccion.Models
{
    public class Pedido
    {
        public int IdPedido { get; set; }

        public int IdCliente { get; set; }

        public string NombreCliente { get; set; }

        public DateTime FechaPedido { get; set; }

        public DateTime FechaEntrega { get; set; }

        public string TipoTrabajo { get; set; }

        public string Descripcion { get; set; }

        public string Estado { get; set; }
        public string EtapaActual { get; set; }
        public decimal Total { get; set; }
    }
}