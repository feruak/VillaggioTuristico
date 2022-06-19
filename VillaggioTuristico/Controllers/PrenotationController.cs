using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using VillaggioTuristico.DB;
using VillaggioTuristico.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using VillaggioTuristico.Entities;
using VillaggioTuristico.DB.Entities;

namespace VillaggioTuristico.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PrenotationController : ControllerBase
    {
        private readonly Repository repository;
        public PrenotationController(Repository repository)
        {
            this.repository = repository;
        }

        //API di tipo Post per prendere i dati della prenotazione dal front-end e inviarli al DB
        [HttpPost ("InsertPrenotation")]
        public async Task<IActionResult> InserPrenotation([FromBody] PrenotationModel model)
        {
            Prenotazione prenotation = new Prenotazione();
            prenotation.Utente = User.Identity.Name;
            prenotation.Tipologia = model.Tipologia;       

            this.repository.InsertPrenotation(prenotation);
            
            return Ok();
        }

        //API di tipo Get per ricevere dal DB la lista delle prenotazioni eseguite dallo user loggaro
        [HttpGet("ListaPrenotazioni")]
        public async Task<List<PrenotationModel>> Prenotation()
        {
            string username = User.Identity.Name;
            List<PrenotationModel> prenotations = this.repository.GetPrenotationUser(username);
            return (prenotations);
        }

        //API di tipo Get per ricevere dal DB la lista di tutte le prenotazioni
        [HttpGet("ListaPrenotazioniAdmin")]
        public async Task<List<PrenotationModel>> AdminPrenotation()
        {
            List<PrenotationModel> prenotations = this.repository.GetPrenotationAdmin();
            return (prenotations);
        }
    }
}
