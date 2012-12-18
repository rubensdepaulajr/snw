using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using br.com.totaltiss.Data.Interfaces;

namespace br.com.totaltiss.Data
{
    public class CadMunDao:AbstractCrudDao<Cad_Mun>, ICadMunDao
    {
        public int Count()
        {
            return 10;
        }
        public void DeleteMun(Cad_Mun mun)
        {
            MedicallEntities entity = new MedicallEntities();
            
            var cadBrr = new CadBrrDao();
            var brr = from t in entity.Cad_Brr
                      where t.Brr_IdMun == mun.IdMun
                      select t;

            foreach (var b in brr)
            {
                cadBrr.Delete(b);
            }

            cadBrr.SaveChanges();

            brr = null;
            cadBrr = null;

            var cadMun = new CadMunDao();
            //mun = cadMun.Find(t => t.IdMun == idMun).First<Cad_Mun>();
            cadMun.Delete(mun);
            cadMun.SaveChanges();
        }
    }
}
