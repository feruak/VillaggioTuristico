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
    public class CamereController : ControllerBase
    {
        private readonly Repository repository;
        public CamereController(Repository repository)
        {
            this.repository = repository;
        }

        [HttpGet]
        public async Task<List<CameraModel>> Camere()
        {
            List<ElencoCamere> camere = this.repository.GetCamere();
            camere = camere.ToList();
            List<CameraModel> model = new List<CameraModel>();
            foreach (ElencoCamere p in camere)
                model.Add(new CameraModel()
                {
                    Camera = p.Camera,
                    Tipologia = p.Tipologia
                });
            return (model);
        }
    }
}
