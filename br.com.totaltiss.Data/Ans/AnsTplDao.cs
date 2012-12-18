using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using br.com.totaltiss.Data.Interfaces;

namespace br.com.totaltiss.Data
{
    public class AnsTplDao:AbstractCrudDao<Ans_Tpl>, IAnsTplDao
    {
        public int Count()
        {            
            return 10;
        }
    }
}
