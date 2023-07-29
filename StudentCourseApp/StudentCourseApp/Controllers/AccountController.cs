using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Security.Claims;
using System.Reflection;

namespace StudentCourseApp.Controllers
{
    public class AccountController : Controller
    {
        [HttpPost]
        public async Task<IActionResult> OnPostLogin(IFormCollection formCollection)
        {
            var loginValidInput = ValidateLoginInput(
                formCollection["UserId"].ToString(),
                formCollection["UserPassword"].ToString());

            if (!loginValidInput)
            {
                return Json(new { message = "The username or password is incorrect.", data = "" });
            }

            await SignInUser(formCollection["UserId"].ToString());
            
            return RedirectToAction("Dashboard", "Home");
        }

        private static bool ValidateLoginInput(string userId, string password)
        {
            if (string.IsNullOrEmpty(userId) || string.IsNullOrEmpty(password)) return false;
            return true;
        }

        private async Task SignInUser(string UserId)
        {
            var userDataString = JsonConvert.SerializeObject("");

            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, UserId ?? string.Empty),
                new Claim(ClaimTypes.UserData, userDataString ?? "{}")
            };

            var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity));
        }

        [HttpPost]
        public async Task<IActionResult> SignOutUser(string username)
        {
            await HttpContext.SignOutAsync();
            return RedirectToAction("Index", "Home");
        }
    }
}
