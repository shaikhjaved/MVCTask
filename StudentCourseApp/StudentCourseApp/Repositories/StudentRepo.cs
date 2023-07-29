using Dapper;
using StudentCourseApp.DBContext;
using StudentCourseApp.Models;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Metrics;

namespace StudentCourseApp.Repositories
{
    public class StudentRepo : IStudentRepos
    {
        private readonly DapperContext _context;

        public StudentRepo(DapperContext context)
        {
            _context = context;
        }

        public List<StudentViewModel> GetAllStudents()
        {
            using var connection = _context.CreateConnection();
            var query = "SELECT * FROM Students ORDER BY Id DESC;";
            return connection.Query<StudentViewModel>(query).ToList();
        }

        public int CreateStudent(StudentViewModel model)
        {
            DynamicParameters parameters = new();
            parameters.Add("FirstName", model.FirstName);
            parameters.Add("LastName", model.LastName);
            parameters.Add("DateOfBirth", model.DateOfBirth);
            parameters.Add("Gender", model.Gender);
            parameters.Add("Address1", model.Address1);
            parameters.Add("Address2", model.Address2);
            parameters.Add("Address3", model.Address3);
            parameters.Add("Id", dbType: DbType.Int32, direction: ParameterDirection.Output);

            using var connection = _context.CreateConnection();
            connection.Execute("uspInsertStudent", parameters, commandType: CommandType.StoredProcedure);

            var id = parameters.Get<int?>("Id");

            return id ?? 0;
        }
    }
}
