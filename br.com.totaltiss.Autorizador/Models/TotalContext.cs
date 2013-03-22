using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace br.com.totaltiss.Model
{
    public class TotalDB : DbContext
    {
        public DbSet<Atz_Tpl> TiposLogradouro { get; set; }
        public DbSet<Atz_Mun> Municipios { get; set; }
        public DbSet<Atz_Brr> Bairros { get; set; }
        public DbSet<Atz_Lgr> Logradouros { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }

        public DbSet<Atz_Esp> Atz_Esp { get; set; }
    }
}