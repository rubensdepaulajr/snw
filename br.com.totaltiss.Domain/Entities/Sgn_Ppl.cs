using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using br.com.totaltiss.Domain.Properties;
using System.ComponentModel.DataAnnotations;

namespace br.com.totaltiss.Domain.Entities
{
    public class Sgn_Ppl
    {
        [Key]
        public int IdPpl { get; set; }
	    public string Ppl_Dsc { get; set; }
        public bool ___Ppl_Prf { get; set; }
        public bool ___Ppl_Aud { get; set; }
	    public int Ppl_QtdCh_ { get; set; }
	    public bool Ppl_Ope { get; set; }
	    public bool Ppl_Con { get; set; }
	    public bool Ppl_Sdt { get; set; }
	    public bool Ppl_PrgLib { get; set; }
    }
}