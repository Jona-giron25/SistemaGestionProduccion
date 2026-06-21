using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistemaGestionProduccion.Models
{
    public class Pago
    {
        public int IdPago { get; set; }
        public int IdPedido { get; set; }
        public decimal Monto { get; set; }
        public DateTime FechaPago { get; set; }
        public string TipoPago { get; set; }

        public string UsuarioCobro { get; set; }

    }

}