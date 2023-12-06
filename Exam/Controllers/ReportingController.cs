using exam.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace exam.Controllers
{
    // ReportingController.cs
    public class ReportingController : Controller
    {
        private readonly IEmployeeRepository _employeeRepository;

        public ReportingController(IEmployeeRepository employeeRepository)
        {
            _employeeRepository = employeeRepository;
        }

        // Implement actions for generating reports and statistics
    }

}
