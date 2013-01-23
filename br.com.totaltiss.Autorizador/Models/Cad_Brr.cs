using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace br.com.totaltiss.Model
{
    public class Atz_Brr
    {
        [Key]
        public virtual int IdBrr { get; set; }
        //public string Brr_IdMun { get; set; }
	    public virtual string Brr_Nme { get; set; }

        //[ForeignKey("Brr_IdMun")]
        //public virtual ICollection<Atz_Mun> Atz_Mun { get; set; }
        //public virtual ICollection<Atz_Mun> Brr_IdMun { get; set; }
    }
}