using br.com.totaltiss.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace br.com.totaltiss.Autorizador.Models.Repository
{
    public interface IEspecialidadeRepository : IDisposable
    {
        IEnumerable<Atz_Esp> GetEspecialidades();
        Atz_Esp GetEspecialidadeByID(int IdEsp);
        void InsertEspecialidade(Atz_Esp especialidade);
        void DeleteEspecialidade(int IdEsp);
        void UpdateEspecialidade(Atz_Esp especialidade);
        void Save();
    }

}