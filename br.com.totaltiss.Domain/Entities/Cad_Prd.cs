using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using br.com.totaltiss.Domain.Properties;

namespace br.com.totaltiss.Domain.Entities
{
    public class Cad_Prd
    {
        [Key]
        public int IdPrd { get; set; }
	    public int Prd_IdRde { get; set; }
	    public int Prd_IdItg { get; set; }
	    public string Prd_TipItg { get; set; }
	    public string Prd_Nme { get; set; }
	    public string Prd_CodAns { get; set; }
	    public string Prd_SisGst { get; set; }
    }
}