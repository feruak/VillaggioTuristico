using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using VillaggioTuristico.DB;
using VillaggioTuristico.DB.Entities;
using VillaggioTuristico.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

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

        // POST api/<PersonController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] PrenotationModel model)
        {
            Prenotazione prenotation = new Prenotazione();
            prenotation.Utente = User.Identity.Name;
            prenotation.Camera = int.Parse(model.Camera);
            prenotation.Periodo = int.Parse(model.Periodo);

            this.repository.InsertPerson(prenotation);
            return Ok();
        }
    }
}
