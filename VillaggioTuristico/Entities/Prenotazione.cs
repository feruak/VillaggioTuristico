using System;
using System.ComponentModel.DataAnnotations;

namespace VillaggioTuristico.DB.Entities
{
    public class Prenotazione
    {
        //[Key]
        public Guid? ID { get; set; }
        public string Utente { get; set; }
        public int Camera { get; set; }
        public int Periodo { get; set; }
    }
}
