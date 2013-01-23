using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace br.com.totaltiss.Model
{
    public class Atz_Mun
    {
        [Key]
        [Display(Name = "Id.")]
        public virtual Int16 IdMun { get; set; }
        [Display(Name = "Código")]
        [StringLength(7, ErrorMessage = "Tamanho máximo excedido")]
        public virtual string Mun_Cod { get; set; }
        [Display(Name = "Nome")]
        [StringLength(30, ErrorMessage = "Tamanho máximo excedido")]
        public virtual string Mun_Nme { get; set; }
        [Display(Name = "UF")]
        [StringLength(2, ErrorMessage = "Tamanho máximo excedido")]
        public virtual string Mun_Est { get; set; }
    }
}
