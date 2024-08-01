
using System.ComponentModel.DataAnnotations;

namespace CRUD_APP.Models
{
    public class ProductDto
    {

        [Required, MaxLength(100)]
        public string Nome { get; set; } = "";


        [Required, MaxLength(100)]
        public string Marca { get; set; } = "";

        [Required, MaxLength(100)]
        public string Categoria { get; set; } = "";

        [Required]
        public decimal Preco { get; set; }

        [Required]
        public string Descricao { get; set; } = "";

        public IFormFile? ImageFile { get; set; }
    }
}
