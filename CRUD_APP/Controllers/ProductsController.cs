using CRUD_APP.Services;
using Microsoft.AspNetCore.Mvc;

namespace CRUD_APP.Controllers
{
    public class ProductsController : Controller
    {
        private readonly AppDbContext _appDbContext;
        public ProductsController(AppDbContext context)
        {
            this._appDbContext = context;
        }
        public IActionResult Index()
        {
            var products = _appDbContext.Products.OrderByDescending(p => p.Id).ToList();
            return View(products);
        }
    }
}
