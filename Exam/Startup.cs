using exam.Data;
using exam.Mappings;
using exam.Repositories;
using Microsoft.EntityFrameworkCore;
using System.Configuration;



namespace exam
{
    // Startup.cs
    public class Startup
    {
        
        private readonly IConfiguration _configuration;

        public Startup(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public void ConfigureServices(IServiceCollection services)
        {
            // Add your DbContext
            services.AddDbContext<ApplicationDbContext>(options =>
                options.UseSqlServer(_configuration.GetConnectionString("SqlServerConStr")));

            // Add repositories
            services.AddScoped<IDepartmentRepository, DepartmentRepository>();
            services.AddScoped<IEmployeeRepository, EmployeeRepository>();


            // Other service registrations...

            // AddMvc or AddControllers if not added already
            services.AddMvc();
        }

        // Other methods...

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            // Configuration for different environments

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                // Configuration for production
                app.UseExceptionHandler("/Home/Error");
                app.UseHsts();
            }


            // Other configurations...

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            // Other configurations...

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}
