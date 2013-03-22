using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using br.com.totaltiss.Autorizador.Properties;

namespace br.com.totaltiss.Model
{
    public class Atz_Mun
    {
        [Key]
        [Display(Name = "Id.")]
        public Int16 IdMun { get; set; }

        [Display(Name = "Código")]
        [Required(ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "IsRequired")]
        [StringLength(7, ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "MaxLength")]
        public string Mun_Cod { get; set; }

        [Display(Name = "Nome")]
        [Required(ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "IsRequired")]
        [StringLength(30, ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "MaxLength")]
        public string Mun_Nme { get; set; }

        [Display(Name = "UF")]
        [Required(ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "IsRequired")]
        [StringLength(2, ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "MaxLength")]
        public string Mun_Est { get; set; }
    }
}
