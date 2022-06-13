using System;
using System.Collections.Generic;
using System.Linq;
using VillaggioTuristico.DB.Entities;
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

        public List<ElencoPeriodi> GetPeriodi()
        {
            List<ElencoPeriodi> result = this.DBContext.ElencoPeriodi.ToList();
            return result;
        }

        public List<ElencoCamere> GetCamere()
        {
            List<ElencoCamere> result = this.DBContext.ElencoCamere.ToList();
            return result;
        }
        public void InsertPrenotation(Prenotazione prenotation)
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
