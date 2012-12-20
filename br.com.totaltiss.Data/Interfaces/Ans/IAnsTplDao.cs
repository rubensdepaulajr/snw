using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace br.com.totaltiss.Data.Interfaces
{
    public interface IAnsTplDao:IBaseCrudDao<Ans_Tpl>
    {
        // Adiciona aqui os métodos adiconais que não são padrão no CRUD
        int Count();
    }
}
