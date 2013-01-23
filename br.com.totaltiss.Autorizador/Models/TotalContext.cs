using System.Data.Entity;
namespace br.com.totaltiss.Model
{
    public class TotalDB : DbContext
    {
        public DbSet<Atz_Mun> Municipios { get; set; }
        public DbSet<Atz_Brr> Bairros { get; set; }

    //    public DbSet<Cad_Prd> Produtos { get; set; }
    //    public DbSet<Cad_PrdCtt> HospitaisDoProduto { get; set; }
    //    //public DbSet<Sgn_Ppl> Papel { get; set; }

    //    //protected override void OnModelCreating(DbModelBuilder modelBuilder)
    //    //{
    //    //    modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
    //    //}
    }
}