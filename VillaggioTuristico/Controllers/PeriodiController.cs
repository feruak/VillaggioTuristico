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
    public class PeriodiController : ControllerBase
    {
        private readonly Repository repository;
        public PeriodiController(Repository repository)
        {
            this.repository = repository;
        }

        
        [HttpGet]
        public async Task<List<PeriodiModel>> Periodi()
        {
            List<ElencoPeriodi> periodi = this.repository.GetPeriodi();
            periodi = periodi.ToList();
            List<PeriodiModel> model = new List<PeriodiModel>();
            foreach (ElencoPeriodi p in periodi)
                model.Add(new PeriodiModel()
                {
                    Inizio = p.Inizio,
                    Fine = p.Fine,
                    Periodo = p.Periodo
                });
            return (model);
        }
    }
}
