using Microsoft.AspNetCore.Mvc;
using StudentCourseApp.Models;
using StudentCourseApp.Repositories;

namespace StudentCourseApp.Controllers
{
    public class StudentsController : Controller
    {
        private readonly IStudentRepos _studentRepo;

        public StudentsController(IStudentRepos studentRepo)
        {
            _studentRepo = studentRepo;
        }

        public IActionResult Index()
        {
            var students = _studentRepo.GetAllStudents().ToList();

            return View(students);
        }

        public IActionResult Create()
        {
            return View(new StudentViewModel());
        }

        [HttpPost]
        public IActionResult Create(StudentViewModel model)
        {
            var res = _studentRepo.CreateStudent(model);

            if (res > 0)
            {
                TempData["CreateStudent"] = "Successfully student created.";
                return RedirectToAction("Index", "Students");
            }
            else
            {
                TempData["CreateStudent"] = "failed to created student";
                return View();
            }
        }
    }
}
