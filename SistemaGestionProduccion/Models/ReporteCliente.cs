using System;

namespace SistemaGestionProduccion.Models
    {
        public class ReporteCliente
        {
            public string Cliente { get; set; }

            public int Pedidos { get; set; }

            public decimal Facturacion { get; set; }
        }
    }