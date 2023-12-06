using AutoMapper;
using exam.Models;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace exam.Mappings
{
    // AutoMapperConfig.cs
    public class AutoMapperConfig : Profile
    {
        public AutoMapperConfig()
        {
            CreateMap<DepartmentModel, DepartmentModel>(); // Map to a view model if needed
            CreateMap<EmployeeModel, EmployeeModel>();
            // Add other mappings as necessary
        }
    }

}
