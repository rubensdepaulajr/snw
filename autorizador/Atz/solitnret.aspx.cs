using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;

public partial class Atz_solitnret : System.Web.UI.Page
{
  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            hdfIdItn.Value = Request.QueryString["Itn"];
            hdfIdBnf.Value = Request.QueryString["Bnf"];
        }
    }
    protected void btnFhaPci_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("fhapci.aspx?Bnf=" + hdfIdBnf.Value);    
    }
    protected void btnPgaIni_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("prf.aspx");
    }

}
