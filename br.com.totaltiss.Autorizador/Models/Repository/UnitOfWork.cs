using br.com.totaltiss.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace br.com.totaltiss.Autorizador.Models.Repository
{

    public class UnitOfWork : IDisposable
    {
        private TotalDB context = new TotalDB();
        private GenericRepository<Atz_Esp> especialidadeRepository;

        public GenericRepository<Atz_Esp> EspecialidadeRepository
        {
            get
            {

                if (this.especialidadeRepository == null)
                {
                    this.especialidadeRepository = new GenericRepository<Atz_Esp>(context);
                }
                return especialidadeRepository;
            }
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