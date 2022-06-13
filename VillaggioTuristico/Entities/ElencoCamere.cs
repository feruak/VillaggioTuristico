using System;
using System.ComponentModel.DataAnnotations;

namespace VillaggioTuristico.DB.Entities
{
    public class ElencoCamere
    {
        [Key]
        public int Camera { get; set; }
        public string Tipologia { get; set; }
    }
}
