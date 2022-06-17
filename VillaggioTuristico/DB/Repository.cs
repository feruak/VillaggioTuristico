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
            List<ElencoCamere> camere = this.GetCamere();
            camere = camere.ToList();
            camere = camere.Where(camera => camera.Tipologia == prenotation.Tipologia).ToList();
            //List<CamereModel> model = new List<PrenotationModel>();
            foreach (ElencoCamere camera in camere)
            {
                camera.Tipologia = prenotation.Tipologia;
                camera.Camera = camera.Camera - 1;

                this.DBContext.ElencoCamere.Update(camera);
            };
            
            try
            {
                this.DBContext.ElencoPrenotazioni.Add(prenotation);
                
                this.DBContext.SaveChanges();
            }
            catch (Exception ex)
            {
            }
        }
        public void UpdateSuite(ElencoCamere elencoCamere )
        {
           
            try
            {
                this.DBContext.ElencoCamere.Update(elencoCamere);
                this.DBContext.SaveChanges();
            }
            catch (Exception ex)
            {

            }
        }
    }
}
