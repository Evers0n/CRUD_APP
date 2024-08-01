using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;

namespace CRUD_APP.Models
{
    public class Product
    {
        public int Id { get; set; }

        [MaxLength(100)]
        public string Nome { get; set; } = "";


        [MaxLength(100)]
        public string Marca { get; set; } = "";

        [MaxLength(100)]
        public string Categoria { get; set; } = "";

        [Precision(16, 2)]
        public decimal Preco { get; set; }

        [MaxLength(100)]
        public string Descricao { get; set; } = "";

        [MaxLength(100)]
        public string ImageFileNome { get; set; } = "";

        public DateTime DataCriacao { get; set; }  

    }
}
