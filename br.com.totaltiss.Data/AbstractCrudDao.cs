using System;
using System.Linq;
using System.Linq.Expressions;
using br.com.totaltiss.Data.Interfaces;

namespace br.com.totaltiss.Data
{
    public abstract class AbstractCrudDao<T>:IBaseCrudDao<T> where T: class
    {   
        MedicallEntities entidades = new MedicallEntities();

        public void Add(T pEntity)
        {
            entidades.AddObject(pEntity.GetType().Name, pEntity);
        }
        public void Delete(T pEntity)
        {
            entidades.DeleteObject(pEntity);
        }
        public void Attach(T pEntity)
        {
            entidades.AttachTo(pEntity.GetType().Name, pEntity);
        }
        public void Detach(T pEntity)
        {
            entidades.Detach(pEntity);
        }
        public void Update(T pEntity)
        {
            entidades.ApplyCurrentValues<T>(pEntity.GetType().Name, pEntity);
        }
        public IQueryable<T> Find(Expression<Func<T, bool>> where)
        {
            return entidades.CreateObjectSet<T>().Where(where);

        }
        public IQueryable<T> GetAll()
        {
            return entidades.CreateObjectSet<T>();
        }
        public void SaveChanges()
        {
            entidades.SaveChanges();
        }
    }
}
