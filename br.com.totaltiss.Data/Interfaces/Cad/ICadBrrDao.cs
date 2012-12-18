using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace br.com.totaltiss.Data.Interfaces
{
    public interface ICadBrrDao:IBaseCrudDao<Cad_Brr>
    {
        // Adiciona aqui os métodos adiconais que não são padrão no CRUD
        int Count();
    }
}
