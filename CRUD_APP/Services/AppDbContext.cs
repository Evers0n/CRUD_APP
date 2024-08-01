using Microsoft.EntityFrameworkCore;

namespace CRUD_APP.Services
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions options) : base(options)
        {

        }
    }
}
