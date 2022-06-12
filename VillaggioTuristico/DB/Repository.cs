using System;
using System.Collections.Generic;
using System.Linq;
using VillaggioTuristico.Entities;

namespace VillaggioTuristico.DB
{
    public class Repository
    {
        private UserDBContext DBContext;
        public Repository(UserDBContext DBContext)
        {
            this.DBContext = DBContext;
        }
        public List<Prenotazione> GetPrenotation()
        {
            List<Prenotazione> result = this.DBContext.ElencoPrenotazioni.ToList();
            return result;
        }
        public void InsertPerson(Prenotazione prenotation)
        {
            try
            {
                this.DBContext.ElencoPrenotazioni.Add(prenotation);
                this.DBContext.SaveChanges();
            }
            catch (Exception ex)
            {
            }
        }
    }
}
