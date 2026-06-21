using System;

namespace SistemaGestionProduccion.Models
    {
    public class ReportePago
    {
        public DateTime Fecha { get; set; }

        public decimal Monto { get; set; }

        public string Usuario { get; set; }
    }
}