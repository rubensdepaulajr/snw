using System.Data.Entity;
using br.com.totaltiss.Domain.Entities;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace br.com.totaltiss.Data.Context
{
    public class TotalContext : DbContext
    {
        public DbSet<Atz_Ctt> Contratados { get; set; }
        public DbSet<Cad_Prd> Produtos { get; set; }
        public DbSet<Cad_PrdCtt> HospitaisDoProduto { get; set; }
        //public DbSet<Sgn_Ppl> Papel { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }
    }
}