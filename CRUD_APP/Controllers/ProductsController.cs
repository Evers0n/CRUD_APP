using CRUD_APP.Models;
using CRUD_APP.Services;
using Microsoft.AspNetCore.Mvc;

namespace CRUD_APP.Controllers
{
    public class ProductsController : Controller
    {
        private readonly AppDbContext _appDbContext;
        private readonly IWebHostEnvironment environment;

        public ProductsController(AppDbContext context, IWebHostEnvironment environment)
        {
            this._appDbContext = context;
            this.environment = environment;
        }
        public IActionResult Index()
        {
            var products = _appDbContext.Products.OrderByDescending(p => p.Id).ToList();
            return View(products);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(ProductDto productDto)
        {
            if (productDto.ImageFile == null)
            {
                ModelState.AddModelError("ImageFile", "A imagem do produto é obrigatória");
            }

            if (!ModelState.IsValid)
            {
                return(View(productDto));
            }

            string newFileName = DateTime.Now.ToString("yyyyMMddHHmmSSfff");
            newFileName += Path.GetExtension(productDto.ImageFile!.FileName);

            string imageFullPath = environment.WebRootPath + "/products/" + newFileName;
            using (var stream = System.IO.File.Create(imageFullPath))
            {
                productDto.ImageFile.CopyTo(stream);
            }

            Product product = new Product()
            {
                Nome = productDto.Nome,
                Marca = productDto.Marca,
                Categoria = productDto.Categoria,
                Preco = productDto.Preco,
                Descricao = productDto.Descricao,
                ImageFileNome = newFileName,
                DataCriacao = DateTime.Now,
            };

            _appDbContext.Products.Add(product);
            _appDbContext.SaveChanges();

            return RedirectToAction("Index", "Products");
        }
    }
}
