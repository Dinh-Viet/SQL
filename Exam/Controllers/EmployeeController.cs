using exam.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace exam.Controllers
{
    public class EmployeeController : Controller
    {
        private readonly IEmployeeRepository _employeeRepository;

        public EmployeeController(IEmployeeRepository employeeRepository)
        {
            _employeeRepository = employeeRepository;
        }

        // Implement actions for adding employees and other operations
    }
}
