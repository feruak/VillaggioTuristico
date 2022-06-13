using System;
using System.ComponentModel.DataAnnotations;

namespace VillaggioTuristico.DB.Entities
{
    public class ElencoPeriodi
    {
        [Key]
        public int Periodo { get; set; }
        public DateTime Inizio { get; set; }
        public DateTime Fine { get; set; }
    }
}
