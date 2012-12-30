using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using br.com.totaltiss.Domain.Properties;

namespace br.com.totaltiss.Domain.Entities
{
    public class Cad_PrdCtt
    {
        [Key]
        public int IdPrt { get; set; }
        [Display(Name = "Produto")]
        [UIHint("dropdownProduto")]
        [Required(ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "IsRequired")]
        public int Prt_IdPrd { get; set; }
        [Display(Name = "Hospital")]
        [UIHint("dropdownHospital")]
        [Required(ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "IsRequired")]
        public Int64 Prt_IdCtt { get; set; }

        public  Atz_Ctt Atz_Ctt { get; set; }
        public Cad_Prd Cad_Prd { get; set; }
    }
}