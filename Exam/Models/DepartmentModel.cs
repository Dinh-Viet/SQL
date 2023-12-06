namespace exam.Models
{
    public class DepartmentModel
    {
        public int Id { get; set; }
        public string DepartmentCode { get; set; }
        public string DepartmentName { get; set; }
        public string Location { get; set; }
        public int NumberOfPersonals { get; set; }  // Updated property name

        // Other properties...
    }
}