using br.com.totaltiss.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace br.com.totaltiss.Autorizador.Models.Repository
{
    public class EspecialidadeRepository : IEspecialidadeRepository, IDisposable
    {
        private TotalDB context;

        public EspecialidadeRepository(TotalDB context)
        {
            this.context = context;
        }

        public IEnumerable<Atz_Esp> GetEspecialidades()
        {
            return context.Atz_Esp.ToList();
        }

        public Atz_Esp GetEspecialidadeByID(int id)
        {
            return context.Atz_Esp.Find(id);
        }

        public void InsertEspecialidade(Atz_Esp especialidade)
        {
            context.Atz_Esp.Add(especialidade);
        }

        public void DeleteEspecialidade(int IdEsp)
        {
            Atz_Esp especialidade = context.Atz_Esp.Find(IdEsp);
            context.Atz_Esp.Remove(especialidade);
        }

        public void UpdateEspecialidade(Atz_Esp esecialidade)
        {
            context.Entry(esecialidade).State = EntityState.Modified;
        }

        public void Save()
        {
            context.SaveChanges();
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    context.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}