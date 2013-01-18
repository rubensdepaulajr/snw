using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using br.com.totaltiss.Data.Context;

namespace br.com.totaltiss.Data
{
    public class TotalContextInitializer : DropCreateDatabaseIfModelChanges <TotalContext>
    {
        protected override void Seed(TotalContext context)
        {
            //var eventos = new List<Evn_Tit>
            //{
            //    new Evn_Tit { Tit_Dsc = "Palestra 01", Tit_DatIni = DateTime.Parse("2012-01-01"), Tit_DatFim = DateTime.Parse("2012-02-28"), Tit_Lim = 50},
            //    new Evn_Tit { Tit_Dsc = "Curso 01", Tit_DatIni = DateTime.Parse("2012-02-01"), Tit_DatFim = DateTime.Parse("2012-02-28"), Tit_Lim = 150},
            //    new Evn_Tit { Tit_Dsc = "Palestra 02", Tit_DatIni = DateTime.Parse("2012-03-01"), Tit_DatFim = DateTime.Parse("2012-05-31"), Tit_Lim = 20},
            //    new Evn_Tit { Tit_Dsc = "Curso 02", Tit_DatIni = DateTime.Parse("2012-04-01"), Tit_DatFim = DateTime.Parse("2012-06-30"), Tit_Lim = 2},
            //    new Evn_Tit { Tit_Dsc = "Palestra 03", Tit_DatIni = DateTime.Parse("2012-05-01"), Tit_DatFim = DateTime.Parse("2012-05-31"), Tit_Lim = 10},
            //};
            //eventos.ForEach(e => context.Eventos.Add(e));
            //context.SaveChanges();

            //var participantes = new List<Evn_Ptc>
            //{
            //    new Evn_Ptc { Ptc_IdTit = 1, Ptc_Nme = "Dona Maria", Ptc_Emp="ZPD Inc.", Ptc_End="Rua 13 de abril, 230", Ptc_Brr="Vila Madalena", Ptc_Cid="São Paulo", Ptc_Est="SP", Ptc_CEP="93039-098", Ptc_Eml="dona@maria.com", Ptc_Tel="11 9876-0987", Ptc_DatIcc=DateTime.Parse("2012-01-05")},
            //    new Evn_Ptc { Ptc_IdTit = 1, Ptc_Nme = "Pedro Paulo", Ptc_Emp="Contoso SA", Ptc_End="Av. Brasil, 5/802", Ptc_Brr="Praia do Canto", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29055-250", Ptc_Eml="dona@mail.com", Ptc_Tel="27 9876-0987", Ptc_DatIcc=DateTime.Parse("2012-01-08")},
            //    new Evn_Ptc { Ptc_IdTit = 1, Ptc_Nme = "Bia Santos", Ptc_Emp="XPTO Trading", Ptc_End="Rua 13 de abril, 56", Ptc_Brr="Jardim Camburi", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29090-122", Ptc_Eml="dona@maria.com", Ptc_Tel="11 4256-0987", Ptc_DatIcc=DateTime.Parse("2012-01-22")},
            //    new Evn_Ptc { Ptc_IdTit = 1, Ptc_Nme = "Márcia Ramos", Ptc_Emp="Contoso SA", Ptc_End="Rua 13 de abril, 230", Ptc_Brr="Jardim da Penha", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29030-864", Ptc_Eml="dona@mail.com", Ptc_Tel="31 9876-0987", Ptc_DatIcc=DateTime.Parse("2012-01-15")},
            //    new Evn_Ptc { Ptc_IdTit = 1, Ptc_Nme = "Dulce Maria", Ptc_Emp="ZPD Inc.", Ptc_End="Av. Brasil, 230/55", Ptc_Brr="Praia do Canto", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29055-250", Ptc_Eml="dona@maria.com", Ptc_Tel="11 9876-0987", Ptc_DatIcc=DateTime.Parse("2012-02-05")},
            //    new Evn_Ptc { Ptc_IdTit = 1, Ptc_Nme = "Olívia Lemos", Ptc_Emp="Contoso SA", Ptc_End="Rua 13 de abril, 230", Ptc_Brr="Jardim Camburi", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29090-122", Ptc_Eml="dona@mail.com", Ptc_Tel="11 5688-0987", Ptc_DatIcc=DateTime.Parse("2012-02-05")},
            //    new Evn_Ptc { Ptc_IdTit = 2, Ptc_Nme = "Paulo Porto", Ptc_Emp="XPTO Trading", Ptc_End="Av. Brasil, 85/802", Ptc_Brr="Jardim da Penha", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29030-864", Ptc_Eml="dona@mail.com", Ptc_Tel="44 9876-0987", Ptc_DatIcc=DateTime.Parse("2012-02-01")},
            //    new Evn_Ptc { Ptc_IdTit = 2, Ptc_Nme = "Rômulo Neves", Ptc_Emp="Contoso SA", Ptc_End="Rua 13 de abril, 230", Ptc_Brr="Vila Madalena", Ptc_Cid="São Paulo", Ptc_Est="SP", Ptc_CEP="93039-098", Ptc_Eml="dona@mail.com", Ptc_Tel="11 8687-0987", Ptc_DatIcc=DateTime.Parse("2012-02-02")},
            //    new Evn_Ptc { Ptc_IdTit = 2, Ptc_Nme = "Paula Lores Lan", Ptc_Emp="ZPD Inc.", Ptc_End="Av. Brasil, 522/802", Ptc_Brr="Praia do Canto", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29055-250", Ptc_Eml="dona@maria.com", Ptc_Tel="18 7854-0987", Ptc_DatIcc=DateTime.Parse("2012-02-06")},
            //    new Evn_Ptc { Ptc_IdTit = 2, Ptc_Nme = "Jõao Lellis Blan", Ptc_Emp="Contoso SA", Ptc_End="Rua 13 de abril, 555", Ptc_Brr="Jardim da Penha", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29030-864", Ptc_Eml="dona@mail.com", Ptc_Tel="11 9876-9885", Ptc_DatIcc=DateTime.Parse("2012-02-07")},
            //    new Evn_Ptc { Ptc_IdTit = 2, Ptc_Nme = "Paola Paris Hilton", Ptc_Emp="Contoso SA", Ptc_End="Av. Brasil, 230/802", Ptc_Brr="Vila Madalena", Ptc_Cid="São Paulo", Ptc_Est="SP", Ptc_CEP="93039-098", Ptc_Eml="dona@mail.com", Ptc_Tel="11 4589-5555", Ptc_DatIcc=DateTime.Parse("2012-02-09")},
            //    new Evn_Ptc { Ptc_IdTit = 2, Ptc_Nme = "Marco Maia", Ptc_Emp="XPTO Trading", Ptc_End="Rua 13 de abril, 230", Ptc_Brr="Vila Madalena", Ptc_Cid="São Paulo", Ptc_Est="SP", Ptc_CEP="93039-098", Ptc_Eml="dona@mail.com", Ptc_Tel="21 9876-7788", Ptc_DatIcc=DateTime.Parse("2012-02-15")},
            //    new Evn_Ptc { Ptc_IdTit = 2, Ptc_Nme = "Belano Neves", Ptc_Emp="XPTO Trading", Ptc_End="Av. Brasil, 230/802", Ptc_Brr="Praia do Canto", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29055-250", Ptc_Eml="dona@maria.com", Ptc_Tel="11 9876-5588", Ptc_DatIcc=DateTime.Parse("2012-02-18")},
            //    new Evn_Ptc { Ptc_IdTit = 2, Ptc_Nme = "Ruth Mara", Ptc_Emp="XPTO Trading", Ptc_End="Rua 13 de abril, 89", Ptc_Brr="Vila Madalena", Ptc_Cid="São Paulo", Ptc_Est="SP", Ptc_CEP="93039-098", Ptc_Eml="dona@maria.com", Ptc_Tel="27 9876-8984", Ptc_DatIcc=DateTime.Parse("2012-02-28")},
            //    new Evn_Ptc { Ptc_IdTit = 2, Ptc_Nme = "Pablo Rocso Nalto", Ptc_Emp="ZPD Inc.", Ptc_End="Av. Brasil, 85/802", Ptc_Brr="Praia do Canto", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29055-250", Ptc_Eml="dona@mail.com", Ptc_Tel="11 4589-0987", Ptc_DatIcc=DateTime.Parse("2012-02-28")},
            //    new Evn_Ptc { Ptc_IdTit = 3, Ptc_Nme = "Romer Reves", Ptc_Emp="ZPD Inc.", Ptc_End="Rua 13 de abril, 5", Ptc_Brr="Vila Madalena", Ptc_Cid="São Paulo", Ptc_Est="SP", Ptc_CEP="93039-098", Ptc_Eml="dona@mail.com", Ptc_Tel="11 8888-8985", Ptc_DatIcc=DateTime.Parse("2012-03-05")},
            //    new Evn_Ptc { Ptc_IdTit = 3, Ptc_Nme = "Lia Lousada", Ptc_Emp="ZPD Inc.", Ptc_End="Av. Brasil, 230/802", Ptc_Brr="Praia do Canto", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29055-250", Ptc_Eml="dona@maria.com", Ptc_Tel="27 8789-0987", Ptc_DatIcc=DateTime.Parse("2012-03-05")},
            //    new Evn_Ptc { Ptc_IdTit = 3, Ptc_Nme = "Natan Nata Elmso", Ptc_Emp="Contoso SA", Ptc_End="Rua 13 de abril, 54", Ptc_Brr="Vila Madalena", Ptc_Cid="São Paulo", Ptc_Est="SP", Ptc_CEP="93039-098", Ptc_Eml="dona@mail.com", Ptc_Tel="11 5899-5555", Ptc_DatIcc=DateTime.Parse("2012-03-05")},
            //    new Evn_Ptc { Ptc_IdTit = 3, Ptc_Nme = "Lara Cosme", Ptc_Emp="XPTO Trading", Ptc_End="Av. Brasil, 230/802", Ptc_Brr="Jardim Camburi", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29090-122", Ptc_Eml="dona@maria.com", Ptc_Tel="33 9876-7558", Ptc_DatIcc=DateTime.Parse("2012-04-01")},
            //    new Evn_Ptc { Ptc_IdTit = 3, Ptc_Nme = "Priscilla Novaes Lentis", Ptc_Emp="ZPD Inc.", Ptc_End="Rua 13 de abril, 230", Ptc_Brr="Praia do Canto", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29055-250", Ptc_Eml="dona@mail.com", Ptc_Tel="11 9876-0987", Ptc_DatIcc=DateTime.Parse("2012-04-05")},
            //    new Evn_Ptc { Ptc_IdTit = 3, Ptc_Nme = "Délio Pastorano", Ptc_Emp="Contoso SA", Ptc_End="Rua 13 de abril, 230", Ptc_Brr="Vila Madalena", Ptc_Cid="São Paulo", Ptc_Est="SP", Ptc_CEP="93039-098", Ptc_Eml="dona@maria.com", Ptc_Tel="14 9876-0987", Ptc_DatIcc=DateTime.Parse("2012-04-06")},
            //    new Evn_Ptc { Ptc_IdTit = 3, Ptc_Nme = "Marcílio Pollo", Ptc_Emp="ZPD Inc.", Ptc_End="Av. Brasil, 230/802", Ptc_Brr="Jardim Camburi", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29090-122", Ptc_Eml="dona@maria.com", Ptc_Tel="11 9876-0987", Ptc_DatIcc=DateTime.Parse("2012-04-07")},
            //    new Evn_Ptc { Ptc_IdTit = 3, Ptc_Nme = "Rosana Patrus Neiva", Ptc_Emp="ZPD Inc.", Ptc_End="Rua 13 de abril, 456", Ptc_Brr="Jardim da Penha", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29030-864", Ptc_Eml="dona@mail.com", Ptc_Tel="22 5649-0987", Ptc_DatIcc=DateTime.Parse("2012-04-09")},
            //    new Evn_Ptc { Ptc_IdTit = 3, Ptc_Nme = "Aurora Lima Beuti", Ptc_Emp="Contoso SA.", Ptc_End="Av. Brasil, 230/802", Ptc_Brr="Praia do Canto", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29055-250", Ptc_Eml="dona@maria.com", Ptc_Tel="11 9876-4568", Ptc_DatIcc=DateTime.Parse("2012-04-18")},
            //    new Evn_Ptc { Ptc_IdTit = 3, Ptc_Nme = "Cosme Lima", Ptc_Emp="XPTO Trading", Ptc_End="Rua 13 de abril, 230", Ptc_Brr="Vila Madalena", Ptc_Cid="São Paulo", Ptc_Est="SP", Ptc_CEP="93039-098", Ptc_Eml="dona@mail.com", Ptc_Tel="21 5987-0987", Ptc_DatIcc=DateTime.Parse("2012-04-22")},
            //    new Evn_Ptc { Ptc_IdTit = 3, Ptc_Nme = "Pamela Rosa Lillio", Ptc_Emp="ZPD Inc.", Ptc_End="Av. Brasil, 230/802", Ptc_Brr="Vila Madalena", Ptc_Cid="São Paulo", Ptc_Est="SP", Ptc_CEP="93039-098", Ptc_Eml="dona@mail.com", Ptc_Tel="11 9876-1212", Ptc_DatIcc=DateTime.Parse("2012-04-24")},
            //    new Evn_Ptc { Ptc_IdTit = 3, Ptc_Nme = "Leonora Fritz Houzx", Ptc_Emp="Contoso SA", Ptc_End="Rua 13 de abril, 230", Ptc_Brr="Jardim Camburi", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29090-122", Ptc_Eml="dona@maria.com", Ptc_Tel="12 9876-0987", Ptc_DatIcc=DateTime.Parse("2012-04-25")},
            //    new Evn_Ptc { Ptc_IdTit = 3, Ptc_Nme = "Adelaíde Paraguaia", Ptc_Emp="ZPD Inc.", Ptc_End="Av. Brasil, 230/802", Ptc_Brr="Jardim da Penha", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29030-864", Ptc_Eml="dona@mail.com", Ptc_Tel="11 9876-0987", Ptc_DatIcc=DateTime.Parse("2012-04-30")},
            //    new Evn_Ptc { Ptc_IdTit = 4, Ptc_Nme = "Rafael Conde Rolhs", Ptc_Emp="Contoso SA", Ptc_End="Rua 13 de abril, 230", Ptc_Brr="Vila Madalena", Ptc_Cid="São Paulo", Ptc_Est="SP", Ptc_CEP="93039-098", Ptc_Eml="dona@maria.com", Ptc_Tel="11 6548-0987", Ptc_DatIcc=DateTime.Parse("2012-01-05")},
            //    new Evn_Ptc { Ptc_IdTit = 5, Ptc_Nme = "Nívea Sellmanar", Ptc_Emp="XPTO Trading", Ptc_End="Av. Brasil, 230/802", Ptc_Brr="Jardim Camburi", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29090-122", Ptc_Eml="dona@maria.com", Ptc_Tel="50 2532-0987", Ptc_DatIcc=DateTime.Parse("2012-01-05")},
            //    new Evn_Ptc { Ptc_IdTit = 5, Ptc_Nme = "Ayrton Gomes Neves", Ptc_Emp="ZPD Inc.", Ptc_End="Av. Brasil, 230/802", Ptc_Brr="Jardim da Penha", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29030-864", Ptc_Eml="dona@mail.com", Ptc_Tel="11 3354-0987", Ptc_DatIcc=DateTime.Parse("2012-01-05")},
            //    new Evn_Ptc { Ptc_IdTit = 5, Ptc_Nme = "Seu João", Ptc_Emp="ZPD Inc.", Ptc_End="Av. Brasil, 230/802", Ptc_Brr="Vila Madalena", Ptc_Cid="São Paulo", Ptc_Est="SP", Ptc_CEP="93039-098", Ptc_Eml="dona@maria.com", Ptc_Tel="33 9876-6541", Ptc_DatIcc=DateTime.Parse("2012-01-05")},
            //    new Evn_Ptc { Ptc_IdTit = 5, Ptc_Nme = "Tio Anísio", Ptc_Emp="ZPD Inc.", Ptc_End="Av. Brasil, 230/802", Ptc_Brr="Vila Madalena", Ptc_Cid="São Paulo", Ptc_Est="SP", Ptc_CEP="93039-098", Ptc_Eml="dona@mail.com", Ptc_Tel="11 9876-2345", Ptc_DatIcc=DateTime.Parse("2012-01-05")},
            //    new Evn_Ptc { Ptc_IdTit = 5, Ptc_Nme = "Carla Pedro Maia", Ptc_Emp="XPTO Trading", Ptc_End="Rua 13 de abril, 230", Ptc_Brr="Jardim Camburi", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29090-122", Ptc_Eml="dona@mail.com", Ptc_Tel="11 6456-5545", Ptc_DatIcc=DateTime.Parse("2012-01-05")},
            //    new Evn_Ptc { Ptc_IdTit = 5, Ptc_Nme = "Mel Portugal", Ptc_Emp="ZPD Inc.", Ptc_End="Av. Brasil, 230/452", Ptc_Brr="Jardim da Penha", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29030-864", Ptc_Eml="dona@mail.com", Ptc_Tel="27 8458-0987", Ptc_DatIcc=DateTime.Parse("2012-01-05")},
            //    new Evn_Ptc { Ptc_IdTit = 5, Ptc_Nme = "Carlos Gomes Ruiton", Ptc_Emp="ZPD Inc.", Ptc_End="Rua 13 de abril, 230", Ptc_Brr="Vila Madalena", Ptc_Cid="São Paulo", Ptc_Est="SP", Ptc_CEP="93039-098", Ptc_Eml="dona@maria.com", Ptc_Tel="27 9876-5845", Ptc_DatIcc=DateTime.Parse("2012-01-05")},
            //    new Evn_Ptc { Ptc_IdTit = 5, Ptc_Nme = "Joubertino Bento", Ptc_Emp="XPTO Trading", Ptc_End="Rua 13 de abril, 230", Ptc_Brr="Jardim Camburi", Ptc_Cid="Vitória", Ptc_Est="ES", Ptc_CEP="29090-122", Ptc_Eml="dona@mail.com", Ptc_Tel="11 8794-8787", Ptc_DatIcc=DateTime.Parse("2012-01-05")},
            //};
            //participantes.ForEach(p => context.Participantes.Add(p));
            //context.SaveChanges();

            //var enrollments = new List<Enrollment>
            //{
            //    new Enrollment { StudentID = 1, CourseID = 1, Grade = 1 },
            //    new Enrollment { StudentID = 1, CourseID = 2, Grade = 3 },
            //    new Enrollment { StudentID = 1, CourseID = 3, Grade = 1 },
            //    new Enrollment { StudentID = 2, CourseID = 4, Grade = 2 },
            //    new Enrollment { StudentID = 2, CourseID = 5, Grade = 4 },
            //    new Enrollment { StudentID = 2, CourseID = 6, Grade = 4 },
            //    new Enrollment { StudentID = 3, CourseID = 1            },
            //    new Enrollment { StudentID = 4, CourseID = 1,           },
            //    new Enrollment { StudentID = 4, CourseID = 2, Grade = 4 },
            //    new Enrollment { StudentID = 5, CourseID = 3, Grade = 3 },
            //    new Enrollment { StudentID = 6, CourseID = 4            },
            //    new Enrollment { StudentID = 7, CourseID = 5, Grade = 2 },
            //};
            //enrollments.ForEach(s => context.Enrollments.Add(s));
            //context.SaveChanges();
        }

    }
    
}