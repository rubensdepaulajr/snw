using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using br.com.totaltiss.Autorizador.Properties;

namespace br.com.totaltiss.Model
{
    public class Atz_Lgr
    {
        [Key]
        [Display(Name = "Id")]
        public int IdLgr { get; set; }

        [Required(ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "IsRequired")]
        public int Lgr_IdBrr { get; set; }

        [Required(ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "IsRequired")]
        public Int16 Lgr_IdTpl { get; set; }

        [Display(Name = "Nome")]
        [Required(ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "IsRequired")]
        [StringLength(20, ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "MaxLength")]
        
	    public string Lgr_Nme { get; set; }

        [Display(Name = "CEP")]
        [Range(1,99999999)]
        [Required(ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "IsRequired")]
        public string Lgr_Cep { get; set; }

        [ForeignKey("Lgr_IdBrr")]
        public virtual Atz_Brr Atz_Brr { get; set; }

        [ForeignKey("Lgr_IdTpl")]
        public virtual Atz_Tpl Atz_Tpl { get; set; }
    }
}