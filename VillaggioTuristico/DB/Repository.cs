using System;
using System.Collections.Generic;
using System.Linq;
using VillaggioTuristico.DB.Entities;
using VillaggioTuristico.Entities;
using VillaggioTuristico.Models;

namespace VillaggioTuristico.DB
{
    public class Repository
    {
        private UserDBContext DBContext;
        public Repository(UserDBContext DBContext)
        {
            this.DBContext = DBContext;
        }

        //Funzione che prende tutti gli elementi presenti nella tabella ElencoPrenotazioni e li inserisce in una lista di tipo PrenotaionModel
        public List<PrenotationModel> GetPrenotationAdmin()
        {
            List<Prenotazione> result = this.DBContext.ElencoPrenotazioni.ToList();
            result = result.ToList();
            List<PrenotationModel> model = new List<PrenotationModel>();
            foreach (Prenotazione p in result)
                model.Add(new PrenotationModel()
                {
                    Id = p.ID,
                    Utente = p.Utente,
                    Tipologia = p.Tipologia
                });
            return model;
        }

        //Funzione che prende gli elementi presenti nella tabella ElencoPrenotazioni filtrando sulla colonna dell'Utente e li inserisce in una lista di tipo PrenotaionModel
        public List<PrenotationModel> GetPrenotationUser(String username)
        {
            List<Prenotazione> result = this.DBContext.ElencoPrenotazioni.ToList();
            result = result.Where(p => p.Utente == username).ToList();
            List<PrenotationModel> model = new List<PrenotationModel>();
            foreach (Prenotazione p in result)
                model.Add(new PrenotationModel()
                {
                    Id = p.ID,
                    Utente = p.Utente,
                    Tipologia = p.Tipologia
                });
            return model;
        }

        //Funzione che converte la tabella ElencoCamera in una lista
        public List<ElencoCamere> GetCamere()
        {
            List<ElencoCamere> result = this.DBContext.ElencoCamere.ToList();
            return result;
        }

        //Funzione che popola la tabella Elenco Prenotazioni e che aggiorna la colonna Camera della tabella ElencoCamere
        public void InsertPrenotation(Prenotazione prenotation)
        {
            bool camereTerminate = false;
            List<ElencoCamere> camere = this.GetCamere();
            camere = camere.ToList();
            camere = camere.Where(camera => camera.Tipologia == prenotation.Tipologia).ToList();
            foreach (ElencoCamere camera in camere)
            {
                if(camera.Camera > 0)
                {
                    camera.Tipologia = prenotation.Tipologia;
                    camera.Camera = camera.Camera - 1;
                    this.DBContext.ElencoCamere.Update(camera);
                }
                else
                {
                    camereTerminate = true;
                }
            };
            if (camereTerminate == false)
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
}
