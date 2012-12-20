using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class Site : System.Web.UI.MasterPage
{

    public string idUsr
    { 
        get 
        { 
            return hdfIdUsr.Value; 
        } 
        set 
        {
            hdfIdUsr.Value = value; 
        } 
    }

    public string idCttSeqNme
    {
        get
        {
            return hdfIdCttSeqNme.Value;
        }
        set
        {
            hdfIdCttSeqNme.Value = value;
        }
    }

    private void CheckSessionTimeout()
    {
        string msgSession = "Atenção: Nos próximos 3 minutos, se você não executar alguma pesquisa no sistema, "+
                            " você será redirecionado para a página de login. Por favor salve seus dados.";
        //time to remind, 3 minutes before session end
        int int_MilliSecondsTimeReminder = (this.Session.Timeout * 60000) - 3 * 60000; 
        //time to redirect, 5 miliseconds before session end
        int int_MilliSecondsTimeOut = (this.Session.Timeout * 60000) - 5; 

        string str_Script = @"
                var myTimeReminder, myTimeOut; 
                clearTimeout(myTimeReminder); 
                clearTimeout(myTimeOut); " +
                "var sessionTimeReminder = " + int_MilliSecondsTimeReminder.ToString() + "; " +
                "var sessionTimeout = " + int_MilliSecondsTimeOut.ToString() + ";" +
                "function doReminder(){ alert('" + msgSession + "'); }" +
                "function doRedirect(){ window.location.href='../log.aspx'; }" + @"
                myTimeReminder=setTimeout('doReminder()', sessionTimeReminder); 
                myTimeOut=setTimeout('doRedirect()', sessionTimeout); ";

         ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), 
               "CheckSessionOut", str_Script, true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.CheckSessionTimeout();

        if (!Page.IsPostBack)
        {
        //    MakeMenu();
        //    this.tvw.ExpandAll();
           
        }
    }

    //private void GetChildMenu(string IdPai, string NmePai, TreeNode trn)
    //{
    //    // Só monta o menu se o usuário estiver logado
    //    if (Request.IsAuthenticated)
    //    {
    //        DBASQL dba = new DBASQL();
    //        SqlParameter[] prams = {
    //                                    dba.MakeInParam("@IdMod", SqlDbType.Int, 4, "1"),
    //                                    dba.MakeInParam("@IdPai", SqlDbType.Int, 4, IdPai),
    //                                    dba.MakeInParam("@UserName", SqlDbType.NVarChar,256, Membership.GetUser().ToString()
    //                                )
    //        };
    //        DataSet ds = dba.RunProcDataSet("ssSgn_Acs", prams, "setChild");
    //        foreach (DataRow rowRoot in ds.Tables["setChild"].Rows)
    //        {
    //            TreeNode tnx = new TreeNode();
    //            tnx.Text = rowRoot["Pag_Dsc"].ToString();
    //            tnx.Value = rowRoot["Pag_IdPai"].ToString();
    //            tnx.NavigateUrl = rowRoot["Pag_Url"].ToString();
    //            //tnx.Target = "conteudo";
    //            GetChildMenu(rowRoot["IdPag"].ToString(), rowRoot["Pag_Dsc"].ToString(), tnx);
    //            try
    //            {
    //                trn.ChildNodes.Add(tnx);
    //            }
    //            catch
    //            {
    //            }
    //        }
    //        ds.Dispose();
    //        dba.Dispose();
    //    }
    //}

    //private void MakeMenu()
    //{
    //    this.tvw.ExpandDepth = 1;
    //    this.tvw.ShowLines = true;
    //    this.tvw.Nodes.Clear();
    //    TreeNode raiz = new TreeNode("ATZ", null);
    //    GetChildMenu(null, "ATZ", raiz);
    //    this.tvw.Nodes.Add(raiz);
    //}
}
