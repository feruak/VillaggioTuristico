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
using VillaggioTuristico.Contexts;
using VillaggioTuristico.Commons;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

namespace VillaggioTuristico.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> logger;
        private SignInManager<User> signInManager;
        private UserManager<User> userManager;
        private UserDBContext dbContext;

        public HomeController(SignInManager<User> signInManager,
            UserManager<User> userManager,
            UserDBContext dbContext)
        {
            this.signInManager = signInManager;
            this.userManager = userManager;
            this.dbContext = dbContext;
        }

        [Authorize]
        public IActionResult HiddenPage()
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

        public IActionResult Index([FromServices] UserDBContext dBContext, string userName, string email)
        {
            UsersAndRolesViewModel model = new UsersAndRolesViewModel();
            model.Users = dBContext.Users.Where(u =>
            (string.IsNullOrEmpty(userName) ? u.UserName != null : u.UserName.Contains(userName))
            &&
            (string.IsNullOrEmpty(email) ? true : u.Email != null && u.Email.Contains(email))
            ).Select(u => new User()
            {
                Id = u.Id,
                Email = u.Email,
                UserName = u.UserName,
                UserRoles = (from r in dBContext.Roles
                             join ur in dBContext.UserRoles.Where(ur => ur.UserId == u.Id) on r.Id equals ur.RoleId
                             select new Role()
                             {
                                 IdentityRole = r,
                                 RoleClaims = dBContext.RoleClaims.Where(rc => rc.RoleId == r.Id).ToList()
                             }).ToList(),
                UserClaims = dBContext.UserClaims.Where(uc => uc.UserId == u.Id).ToList()
            }).ToList();
            return View(model);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
