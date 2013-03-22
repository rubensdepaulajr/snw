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
    public class Atz_Brr
    {
        [Key]
        public int IdBrr { get; set; }

        [Required(ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "IsRequired")]
        public Int16 Brr_IdMun { get; set; }

        [Display(Name = "Nome")]
        [StringLength(30, ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "MaxLength")]
        [Required(ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "IsRequired")]
	    public string Brr_Nme { get; set; }

        [ForeignKey("Brr_IdMun")]
        public virtual Atz_Mun Atz_Mun { get; set; }
    }
}