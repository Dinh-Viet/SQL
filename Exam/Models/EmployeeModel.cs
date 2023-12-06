namespace exam.Models
{
    public class EmployeeModel
    {
        public int Id { get; set; }
        public string EmployeeCode { get; set; }
        public string EmployeeName { get; set; }
        public int DepartmentId { get; set; }  // Updated property name
        public string Rank { get; set; }  // Updated property name
    }
}