using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistemaGestionProduccion.Models
{
    public class PagoResumen
    {
        public int IdPedido { get; set; }

        public string Cliente { get; set; }

        public decimal Total { get; set; }

        public decimal Pagado { get; set; }

        public decimal Saldo { get; set; }

        public string EstadoPago { get; set; }
    }
}