using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using br.com.totaltiss.Domain.Properties;
using System.ComponentModel.DataAnnotations;

namespace br.com.totaltiss.Domain.Entities
{
    public class Atz_Ctt
    {
        [Key]
        public int IdPrt { get; set; }
        public Int64 IdCtt { get; set; }
	    public Int16 Ctt_IdTpd { get; set; }
	    public string Ctt_IdCns { get; set; }
	    public string Ctt_Nme { get; set; }
	    public string Ctt_NmeRsm { get; set; }
	    public string Ctt_Doc { get; set; }
	    public string Ctt_NumCns { get; set; }
	    public string Ctt_EstCns { get; set; }
	    public string Ctt_CodCne { get; set; }
	    public string Ctt_Sit { get; set; }
	    public string Ctt_Tel { get; set; }
	    public string Ctt_Tel2 { get; set; }
	    public string Ctt_Fax { get; set; }
	    public string Ctt_Eml { get; set; }
	    public string Ctt_NmeCto { get; set; }
	    public string Ctt_TipDoc { get; set; }
	    public DateTime Ctt_DatFim { get; set; }
    }
}