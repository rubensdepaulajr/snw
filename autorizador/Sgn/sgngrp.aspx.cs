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
using br.com.totaltiss.Data;
using System.Linq;

public partial class Sgn_sgngrp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lockForm(true);
        }
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        hdfAcao.Value = "New";
        clearForm();
        dts.SelectParameters["RoleName"].DefaultValue = String.Empty;
        grd.SelectedIndex = -1;
        lockForm(false);
        grd.Visible = false;
        pnlInfo.Visible = true;
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (grd.SelectedIndex == -1)
            lblEditError.Visible = true;
        else
        {
            hdfAcao.Value = "Edit";
            lockForm(false);
            grd.Visible = false;
            pnlInfo.Visible = true;
        }
    }
    private void clearForm()
    {
        txtIdGrp.Text = String.Empty;
        txtGrp_Dsc.Text = String.Empty;
        chkRolesIsOpe.Checked = false;
    }
    private void lockForm(bool browseMode)
    {
        btnNew.Enabled = browseMode;
        btnEdit.Enabled = browseMode;
        btnDel.Enabled = browseMode;
        btnSave.Visible = !browseMode;
        btnCancel.Visible = !browseMode;
        pnlInfo.Enabled = !browseMode;
        grd.Visible = browseMode;
        lblMsg.Visible = false;
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtIdGrp.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[0].Text.TrimEnd());
        txtGrp_Dsc.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[1].Text.TrimEnd());
        CheckBox cb = (CheckBox)(grd.SelectedRow.FindControl("chkIsOpe"));
        chkRolesIsOpe.Checked = cb.Checked;
        pnlInfo.Visible = true;
        grd.Visible = false;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtGrp_Dsc.Text) && (!String.IsNullOrEmpty(txtIdGrp.Text)))
        {
            if (hdfAcao.Value == "New")
            {               
                if (!Roles.RoleExists(txtIdGrp.Text))
                {
                    // Create the role
                    Roles.CreateRole(txtIdGrp.Text);
                    // Refresh the RoleList Grid                    
                    dts.Insert();
                    using (AppEntities ctx = new AppEntities())
                    {
                        aspnet_Roles roles = new aspnet_Roles();
                        roles = ctx.aspnet_Roles.First(r => r.RoleName == txtIdGrp.Text);
                        roles.IsOpe = chkRolesIsOpe.Checked;
                        if (roles.EntityState == EntityState.Modified)
                        {
                            object original = null;
                            if (ctx.TryGetObjectByKey(roles.EntityKey, out original))
                            {
                                ctx.ApplyCurrentValues(roles.EntityKey.EntitySetName, roles);
                                ctx.SaveChanges();
                            }
                        }
                    }
                }
            }
            else
                dts.Update();            
            lockForm(true);
        }
        else
        {
            lblMsg.Visible = true;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        lockForm(true);
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtIdGrp.Text))
        {
            try
            {
                dts.Delete();
                clearForm();
                Response.Write(@"<script language='javascript'><!-- Esconder código!
                           alert('Exclusão efetuada com sucesso.');// Exibir código --></script>");
            }
            catch (Exception erro)
            {
                Response.Write(@"<script language='javascript'><!-- Esconder código!
                           alert('A exclusão não foi concluída pois existe um ou mais registros relacionados a esse.');// Exibir código --></script>");
            }
        }
        else
        {
            Response.Write(@"<script language='javascript'><!-- Esconder código!
                           alert('Selecione um registro para ser excluído!');// Exibir código --></script>");
        }        
    }
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.SelectedIndex = -1;
    }
}