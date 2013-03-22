using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using br.com.totaltiss.Autorizador.Properties;

namespace br.com.totaltiss.Model
{
    public class Atz_Tpl
    {
        [Key]
        [Display(Name = "Id.")]
        public Int16 IdTpl { get; set; }

        [Display(Name = "Descrição")]
        [StringLength(20, ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "MaxLength")]
        [Required(ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "IsRequired")]
        public string Tpl_Dsc { get; set; }
    }
}
