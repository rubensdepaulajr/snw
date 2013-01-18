using System.Web.Mvc;

namespace br.com.totaltiss.Autorizador.Areas.Sgn
{
    public class SgnAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Sgn";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Sgn_default",
                "Sgn/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
