using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using br.com.totaltiss.Data;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Fat_FatFch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtFchCpc.Text = getMaxCpc();
            populateGrid();
        }
    }
    /*define a intercalação de cores nos grids*/
    protected void gvHover_RowCreated(object sender, GridViewRowEventArgs e)
    {
        //Add CSS class on header row.
        if (e.Row.RowType == DataControlRowType.Header)
            e.Row.CssClass = "header";

        //Add CSS class on normal row.
        if (e.Row.RowType == DataControlRowType.DataRow &&
                  e.Row.RowState == DataControlRowState.Normal)
            e.Row.CssClass = "normal";

        //Add CSS class on alternate row.
        if (e.Row.RowType == DataControlRowType.DataRow &&
                  e.Row.RowState == DataControlRowState.Alternate)
            e.Row.CssClass = "alternate";
    }
    /* 1 - Codigos da paginação da aba SOLICITAÇÕS AUTORIZADAS---------------------------------------------------------*/
    /*preenche informações(dropdown e total de paginas) do paginador do grid da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void grd_DataBound(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grd.BottomPagerRow;
        if (gvrPager == null)
            return;
        // get your controls from the gridview
        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddlPages");
        Label lblPageCount = (Label)gvrPager.Cells[0].FindControl("lblPageCount");

        if (ddlPages != null)
        {
            // populate pager
            for (int i = 0; i < grd.PageCount; i++)
            {
                int intPageNumber = i + 1;
                ListItem lstItem = new ListItem(intPageNumber.ToString());
                if (i == grd.PageIndex)
                    lstItem.Selected = true;
                ddlPages.Items.Add(lstItem);
            }
        }
        // populate page count
        if (lblPageCount != null)
            lblPageCount.Text = grd.PageCount.ToString();
    }
    /*dropdown do paginador da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void ddlPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grd.BottomPagerRow;
        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddlPages");
        grd.PageIndex = ddlPages.SelectedIndex;
        // a method to populate your grid
        populateGrid();
    }
    /*função que controla os botões de paginação da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void Paginategrd(object sender, CommandEventArgs e)
    {
        // get the current page selected
        int intCurIndex = grd.PageIndex;

        switch (e.CommandArgument.ToString().ToLower())
        {
            case "first":
                grd.PageIndex = 0;
                break;
            case "prev":
                if (intCurIndex > 0)
                    grd.PageIndex = intCurIndex - 1;
                break;
            case "next":
                if (intCurIndex <= grd.PageCount - 1)
                    grd.PageIndex = intCurIndex + 1;
                break;
            case "last":
                grd.PageIndex = grd.PageCount;
                break;
        }
        // popultate the gridview control
        populateGrid();
    }
    private void populateGrid()
    {
        dts.SelectParameters["IdOpe"].DefaultValue = "1";
        dts.SelectParameters["FchCpc"].DefaultValue = txtFchCpc.Text;
        grd.DataBind();
    }
    public string getMaxCpc()
    {
        using (AppEntities ctx = new AppEntities())
        {
            var fchCpc = (from f in ctx.Fat_Fch
                          select f.Fch_Cpc).Max();

            return fchCpc;
        }
    }
    /// <summary>
    /// Calcula a próxima competência
    /// </summary>
    /// <param name="cpc">Competência atual</param>
    /// <returns>Próximo competência (AnoMes)</returns>
    public string setNextCpc(string cpc)
    {
        int ano, mes, anomes;

        ano = Convert.ToInt32(cpc.ToString().Substring(0,4));
        mes = Convert.ToInt32(cpc.ToString().Substring(4,2));

        if (mes == 12)
        {
            ano += 1;
            mes = 1;
        }
        else
            mes += 1;

        if (mes <= 10)
        {
            anomes = Convert.ToInt32(ano.ToString() +'0'+ mes.ToString());
        }
        else
        {
            anomes = Convert.ToInt32(ano.ToString() + mes.ToString());
        }

        return anomes.ToString();
    }
    protected void ibtNew_Click(object sender, ImageClickEventArgs e)
    {
        if ((txtFchCpc.Text.Trim() == "") )
            globall.showMessage(imgMsg,lblMsg,"A competência deve ser informada!");
        else
        {
            globall.showMessage(imgMsg, lblMsg, string.Empty);
            mvw.ActiveViewIndex = 1;
        }

    }
    protected void ibtGravar_Click(object sender, ImageClickEventArgs e)
    {
        if ((lblFchCpc.Text.Trim() == "") || (txtDatEnt.Text.Trim() == "") ||
           (txtDatIni.Text.Trim() == "") || (txtDatFim.Text.Trim() == ""))
           globall.showMessage(imgMsg,lblMsg,"Todos os campos devem ser preenchidos!");
        else
        {
            string[] outParam = { "@OutErr" };
            string[] outResult;

            DBASQL dba = new DBASQL();
            SqlParameter[] param = {
                                        dba.MakeInParam("@IdOpe",SqlDbType.SmallInt,2,1),
		                                dba.MakeInParam("@IdTpd",SqlDbType.TinyInt,1,ddlTpd.SelectedValue),
		                                dba.MakeInParam("@FchCpc",SqlDbType.VarChar,6,lblFchCpc.Text),
		                                dba.MakeInParam("@FchAno",SqlDbType.SmallInt,2,lblFchCpc.Text.Substring(0,4)),
		                                dba.MakeInParam("@FchMes",SqlDbType.TinyInt,1,lblFchCpc.Text.Substring(4,2)),
		                                dba.MakeInParam("@FchEnt",SqlDbType.Date,4,txtDatEnt.Text),
		                                dba.MakeInParam("@FchDatIni",SqlDbType.SmallDateTime,4,txtDatIni.Text),
		                                dba.MakeInParam("@FchDatFim",SqlDbType.SmallDateTime,4,txtDatFim.Text+" 23:59"),
		                                dba.MakeInParam("@FchLot",SqlDbType.Bit,1,1),
                                        dba.MakeOutParam("@OutErr",SqlDbType.Bit,1)
                                       };

            outResult = dba.RunProc("stFat_Fch", param, outParam);
            if (outResult[0] == "True")
                globall.showMessage(imgMsg, lblMsg, "Erro inseperado na tentativa de gravar o fechamento!");
            dba.Dispose();
            populateGrid();
            mvw.ActiveViewIndex = 0;
        }
    }

    protected void ibtDel_Click(object sender, ImageClickEventArgs e)
    {
        if (grd.SelectedIndex == -1)
            globall.showMessage(imgMsg, lblMsg, "Nenhum item selecionado!");
        else
        {
            globall.showMessage(imgMsg, lblMsg, string.Empty);
            dts.DeleteParameters["IdTpd"].DefaultValue = grd.SelectedDataKey.Values["Ctt_IdTpd"].ToString();
            dts.DeleteParameters["FchCpc"].DefaultValue = grd.SelectedDataKey.Values["Fch_Cpc"].ToString();
            dts.Delete();
            populateGrid();
        }
    }

    protected void ibtBuscar_Click(object sender, ImageClickEventArgs e)
    {
        if (txtFchCpc.Text.Trim() != "")
        {
            populateGrid();
        }
    }

    protected void ddlTpd_SelectedIndexChanged(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["AppConnectionString"].ConnectionString))
        {
            SqlCommand command = new SqlCommand("SELECT MAX(Fch_Cpc) FROM dbo.Fat_Fch, dbo.Atz_Ctt WHERE Fch_IdOpe = 1 AND IdCtt = Fch_IdCtt AND Ctt_IdTpd = "+ ddlTpd.SelectedValue, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                if (string.IsNullOrWhiteSpace(reader[0].ToString()))
                    lblFchCpc.Text = txtFchCpc.Text;
                else
                    lblFchCpc.Text = setNextCpc(reader[0].ToString());
            }
            reader.Close();
        }
    }

    protected void ibtCancelar_Click(object sender, ImageClickEventArgs e)
    {
        mvw.ActiveViewIndex = 0;
    }

}