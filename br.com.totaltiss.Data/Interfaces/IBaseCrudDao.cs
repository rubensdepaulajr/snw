using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;

namespace br.com.totaltiss.Data.Interfaces
{
    public interface IBaseCrudDao<T>
    {
        void Add(T pEntity);
        void Delete(T pEntity);
        void Attach(T pEntity);
        void Detach(T pEntity);
        void Update(T pEntity);
        IQueryable<T> Find(Expression<Func<T, bool>> where);
        IQueryable<T> GetAll();
        void SaveChanges();
    }
}
