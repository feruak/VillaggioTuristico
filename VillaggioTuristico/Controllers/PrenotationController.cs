﻿using Microsoft.AspNetCore.Http;
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

        [HttpPost ("InsertPrenotation")]
        public async Task<IActionResult> Post([FromBody] PrenotationModel model)
        {
            Prenotazione prenotation = new Prenotazione();
            prenotation.Utente = User.Identity.Name;
            prenotation.Tipologia = model.Tipologia;

            ElencoCamere elencoCamere = new ElencoCamere();

            

            this.repository.InsertPrenotation(prenotation);
            
            return Ok();
        }

        [HttpGet("ListaPrenotazioni")]
        public async Task<List<PrenotationModel>> Prenotation()
        {
            string username = User.Identity.Name;
            List<Prenotazione> prenotations = this.repository.GetPrenotation();
            prenotations = prenotations.Where(p => p.Utente == username).ToList();
            List<PrenotationModel> model = new List<PrenotationModel>();
            foreach (Prenotazione p in prenotations)
                model.Add(new PrenotationModel()
                {
                    Id = p.ID,
                    Utente = p.Utente,
                    Tipologia = p.Tipologia
                    //Periodo = p.Periodo.ToString()
                });
            return (model);
        }

        [HttpGet("ListaPrenotazioniAdmin")]
        public async Task<List<PrenotationModel>> AdminPrenotation()
        {
            List<Prenotazione> prenotations = this.repository.GetPrenotation();
            prenotations = prenotations.ToList();
            List<PrenotationModel> model = new List<PrenotationModel>();
            foreach (Prenotazione p in prenotations)
                model.Add(new PrenotationModel()
                {
                    Id = p.ID,
                    Utente = p.Utente,
                    Tipologia=p.Tipologia
                    //Periodo = p.Periodo.ToString()
                });
            return (model);
        }
    }
}
