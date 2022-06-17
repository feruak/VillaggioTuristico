using System;
using System.ComponentModel.DataAnnotations;

namespace VillaggioTuristico.DB.Entities
{
    public class ElencoCamere
    {
        
        public string Tipologia { get; set; }


        [Key]
        public int Camera { get; set; }
        
    }
}
