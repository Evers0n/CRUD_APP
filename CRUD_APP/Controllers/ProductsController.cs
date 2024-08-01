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

        public IActionResult Edit(int id)
        {
            var product = _appDbContext.Products.Find(id);

            if (product == null)
            {
                return RedirectToAction("Index", "Products");
            }

            var productDto = new ProductDto()
            {
                Nome = product.Nome,
                Marca = product.Marca,
                Categoria = product.Categoria,
                Preco = product.Preco,
                Descricao = product.Descricao,
            };

            ViewData["Productid"] = product.Id;
            ViewData["ImageFileName"] = product.ImageFileNome;
            ViewData["DataCriacao"] = product.DataCriacao.ToString("MM/dd/yyyy");

            return View(productDto);
        }

        [HttpPost]
        public IActionResult Edit(int id, ProductDto productDto)
        {
            var product = _appDbContext.Products.Find(id);
            if (product == null)
            {
                return RedirectToAction("Index", "Products");
            }

            if (!ModelState.IsValid)
            {
               

                ViewData["Productid"] = product.Id;
                ViewData["ImageFileName"] = product.ImageFileNome;
                ViewData["DataCriacao"] = product.DataCriacao.ToString("MM/dd/yyyy");

                return View(productDto);
            }

            string newFileName = product.ImageFileNome;
            if (productDto.ImageFile != null) 
            {
                newFileName = DateTime.Now.ToString("yyyyMMddHHmmssFFF");
                newFileName += Path.GetExtension(productDto.ImageFile.FileName);

                string imageFullPath = environment.WebRootPath + "/products/" + newFileName;
                using (var stream = System.IO.File.Create(imageFullPath))
                {
                    productDto.ImageFile.CopyTo(stream);    
                }

                string oldImageFullPath = environment.WebRootPath + "/products/" + product.ImageFileNome;
                System.IO.File.Delete(oldImageFullPath);
            }

            product.Nome = productDto.Nome;
            product.Marca = productDto.Marca;
            product.Categoria = productDto.Categoria;
            product.Preco = productDto.Preco;
            product.Descricao = productDto.Descricao;
            product.ImageFileNome = newFileName;

            _appDbContext.SaveChanges();

            return RedirectToAction("Index", "Products");
        }
    }
}
