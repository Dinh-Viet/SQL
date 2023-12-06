// DepartmentController.cs
using exam.Models;
using exam.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace exam.Controllers
{
    public class DepartmentController : Controller
    {
        private readonly IDepartmentRepository _departmentRepository;

        public DepartmentController(IDepartmentRepository departmentRepository)
        {
            _departmentRepository = departmentRepository;
        }

        // Action to display the list of departments
        public IActionResult Index()
        {
            var departments = _departmentRepository.GetAllDepartments();
            return View(departments);
        }

        // Action to display the details of a department
        public IActionResult Details(int id)
        {
            var department = _departmentRepository.GetDepartmentById(id);
            if (department == null)
            {
                return NotFound();
            }

            return View(department);
        }

        // Action to display the form for adding a new department
        public IActionResult Create()
        {
            return View();
        }

        // Action to handle the addition of a new department
        [HttpPost]
        public IActionResult Create(DepartmentModel department)
        {
            if (ModelState.IsValid)
            {
                _departmentRepository.AddDepartment(department);
                return RedirectToAction("Index");
            }

            return View(department);
        }

        // Action to display the form for editing a department
        public IActionResult Edit(int id)
        {
            var department = _departmentRepository.GetDepartmentById(id);
            if (department == null)
            {
                return NotFound();
            }

            return View(department);
        }

        // Action to handle the editing of a department
        [HttpPost]
        public IActionResult Edit(int id, DepartmentModel department)
        {
            if (id != department.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                _departmentRepository.UpdateDepartment(department);
                return RedirectToAction("Index");
            }

            return View(department);
        }

        // Action to display the form for confirming the deletion of a department
        public IActionResult Delete(int id)
        {
            var department = _departmentRepository.GetDepartmentById(id);
            if (department == null)
            {
                return NotFound();
            }

            return View(department);
        }

        // Action to handle the deletion of a department
        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirmed(int id)
        {
            _departmentRepository.DeleteDepartment(id);
            return RedirectToAction("Index");
        }
    }
}
