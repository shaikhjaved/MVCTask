using StudentCourseApp.Models;

namespace StudentCourseApp.Repositories
{
    public interface IStudentRepos
    {
        public List<StudentViewModel> GetAllStudents();
        public int CreateStudent(StudentViewModel model);
    }
}
