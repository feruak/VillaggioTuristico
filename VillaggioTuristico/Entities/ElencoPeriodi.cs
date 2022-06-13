using System;
using System.ComponentModel.DataAnnotations;

namespace VillaggioTuristico.DB.Entities
{
    public class ElencoPeriodi
    {
        [Key]
        public int Periodo { get; set; }
        public string Inizio { get; set; }
        public string Fine { get; set; }
    }
}
