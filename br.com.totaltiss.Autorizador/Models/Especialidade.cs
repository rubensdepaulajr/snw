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
    public class Atz_Esp
    {
        [Key]
        [Display(Name = "Id")]
        public Int16 IdEsp { get; set; }

        [Display(Name = "Nome")]
        [StringLength(80, ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "MaxLength")]
        [Required(ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "IsRequired")]
	    public string Esp_Dsc { get; set; }

        [Display(Name = "CBO")]
        [StringLength(10, ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "MaxLength")]
        [Required(ErrorMessageResourceType = typeof(Resources), ErrorMessageResourceName = "IsRequired")]
        public string Esp_Cbo { get; set; }

        [Display(Name = "Cód. no Sist. Gestão")]
        public string Esp_SisGst { get; set; }

        [Display(Name = "Alta complexidade?")]
        public bool? Esp_AltCpx { get; set; }

        [Display(Name = "Sexo")]
        public string Esp_Sxo  { get; set; }

        [Display(Name = "Idade Mínima")]
        public byte? Esp_IddMin { get; set; }

        [Display(Name = "Idade Máxima")]
        public byte? Esp_IddMax { get; set; }

        [Display(Name = "Quantidade Máxima")]
        public byte? Esp_QtdMax { get; set; }

        [Display(Name = "Quantidade no dia")]
        public byte? Esp_QtdDia { get; set; }

        [Display(Name = "Quantidade no mês")]
        public byte? Esp_QtdMes { get; set; }

        [Display(Name = "Quantidade no ano")]
        public Int16? Esp_QtdAno { get; set; }

        [Display(Name = "Prazo para retorno")]
        public Int16? Esp_Rtn { get; set; }
        
    }
}