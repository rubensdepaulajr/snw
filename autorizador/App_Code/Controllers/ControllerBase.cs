using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ControllerBase
/// </summary>
public class ControllerBase : System.Web.Mvc.Controller
{
    public int Contratado
    {
        get
        {
            return Convert.ToInt32(Profile.GetProfileGroup("Local").GetPropertyValue("IdCtt"));
        }
    }

    public int UsuarioLogado
    {
        get
        {
            return Convert.ToInt32(Profile.GetProfileGroup("Local").GetPropertyValue("IdUsr"));
        }
    }

    public int Endereco
    {
        get
        {
            return Convert.ToInt32(Profile.GetProfileGroup("Local").GetPropertyValue("Cte_SeqEnd"));
        }
    }

}