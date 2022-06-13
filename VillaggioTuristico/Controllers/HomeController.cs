using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using VillaggioTuristico.Models;
using Microsoft.AspNetCore.Identity;
using VillaggioTuristico.Entities;
using VillaggioTuristico.Commons;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using VillaggioTuristico.DB;
using VillaggioTuristico.DB.Entities;

namespace VillaggioTuristico.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> logger;
        private readonly Repository repository;
        private SignInManager<User> signInManager;
        private UserManager<User> userManager;
        private UserDBContext dbContext;

        public HomeController(SignInManager<User> signInManager,
            UserManager<User> userManager,
            UserDBContext dbContext,
             Repository repository)
        {
            this.signInManager = signInManager;
            this.userManager = userManager;
            this.dbContext = dbContext;
            this.repository = repository;
        }

        public IActionResult Index()
        {
            return View();
        }

        [Authorize]
        public IActionResult AdminPage()
        {
            return View();
        }

        public IActionResult Login()
        {
            return View();
        }
        public IActionResult Camere()
        {
            return View();
        }
        public IActionResult Prenotazione()
        {
            return View();
        }
        public IActionResult AreaUtente()
        {
            return View();
        }
        public IActionResult Registrazione()
        {
            return View();
        }


        [HttpPost]
        public async Task<IActionResult> Login(LoginModel loginModel)
        {
            try
            {
                User user = await userManager.FindByNameAsync(loginModel.UserName);
                if (user != null)
                {
                    var result = await signInManager.PasswordSignInAsync(loginModel.UserName, loginModel.Password, false, lockoutOnFailure: true);
                    if (result.Succeeded)
                    {

                    }
                }
            }
            catch (Exception ex)
            {

            }
            return Redirect("Index");
        }

        [Authorize]
        public async Task<IActionResult> Logout()
        {
            try
            {
                if (signInManager.IsSignedIn(User))
                {
                    await signInManager.SignOutAsync();
                }
            }
            catch (Exception ex)
            {
            }
            return Redirect("Index");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
