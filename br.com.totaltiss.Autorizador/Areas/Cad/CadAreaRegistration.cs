using System.Web.Mvc;

namespace br.com.totaltiss.Autorizador.Areas.Cad
{
    public class CadAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Cad";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Cad_default",
                "Cad/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
