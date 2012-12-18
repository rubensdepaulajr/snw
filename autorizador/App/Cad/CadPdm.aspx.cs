using System;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;
using br.com.totaltiss.Data;
using br.com.totaltiss.Util;

namespace br.com.totaltiss.Gestor.Web.App.Cad
{
    public partial class CadPdm : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        private CadMaster PageMaster
        {
            get
            {
                return this.Master as CadMaster;
            }
        }
        #region GridView events
        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList dropDown = (DropDownList)sender;
            grd.PageSize = int.Parse(dropDown.SelectedValue);
        }
        protected void GoToPage_TextChanged(object sender, EventArgs e)
        {
            int pageNumber;
            TextBox txtGoToPage = (TextBox)sender;
            if (int.TryParse(txtGoToPage.Text.Trim(), out pageNumber) && pageNumber > 0 && pageNumber <= grd.PageCount)
            {
                grd.PageIndex = pageNumber - 1;
            }
            else
            {
                grd.PageIndex = 0;
            }
        }
        #endregion
        #region Display
        private void clearForm()
        {
            lblIdPdm.Text = string.Empty;
            txtPdmCod.Text = string.Empty;
            txtPdmDsc.Text = string.Empty;
            txtPdmDscRsm.Text = string.Empty;
            txtPdmCodAmb.Text = string.Empty;
            txtPdmDscAmb.Text = string.Empty;
            txtPdmIddMin.Text = string.Empty;
            txtPdmIddMax.Text = string.Empty;
            txtPdmQtdMax.Text = string.Empty;
            txtPdmQtdDia.Text = string.Empty;
            txtPdmQtdMes.Text = string.Empty;
            txtPdmQtdAno.Text = string.Empty;
            txtPdmRtn.Text = string.Empty;
            chkPdmAltCpx.Checked = false;
            chkPdmEsp.Checked = false;
            chkPdmPrf.Checked = false;
            chkPdmAtv.Checked = false;
            chkPdmBlqUrg.Checked = false;
            txtPdmQtdCh_.Text = string.Empty;
            txtPdmQtdFlm.Text = string.Empty;
        }
        private void lockForm()
        {
            btnNew.Enabled = (displayMode == Mode.Browse);
            btnEdit.Enabled = (displayMode == Mode.Browse);
            btnDel.Enabled = (displayMode == Mode.Browse);
            btnSave.Visible = !(displayMode == Mode.Browse);
            btnCancel.Visible = !(displayMode == Mode.Browse);
            grd.Enabled = (displayMode == Mode.Browse);
            if (displayMode == Mode.Browse)
                mvw.ActiveViewIndex = 0;
            else
                mvw.ActiveViewIndex = 1;
        }
        #endregion
        #region Toolbar
        protected void btnNew_Click(object sender, EventArgs e)
        {
            displayMode = Mode.Add;
            clearForm();
            lockForm();
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (grd.SelectedIndex != -1)
            {
                displayMode = Mode.Update;
                int idPdm = Convert.ToInt32(grd.SelectedValue);
                clearForm();
                lockForm();
                using (AppEntities ctx = new AppEntities())
                {
                    Atz_Pdm cadPdm = new Atz_Pdm();
                    cadPdm = ctx.Atz_Pdm.First(t => t.IdPdm == idPdm);

                    lblIdPdm.Text = cadPdm.IdPdm.ToString();
                    txtPdmCod.Text = cadPdm.Pdm_Cod;
                    ddlPdmIdTab.SelectedValue = cadPdm.Pdm_IdTab.ToString();
                    ddlPdmIdTpp.SelectedValue = cadPdm.Pdm_IdTpp.ToString();
                    ddlPdmIdGrp.SelectedValue = cadPdm.Pdm_IdGrp.ToString();
                    txtPdmDsc.Text = cadPdm.Pdm_Dsc;
                    txtPdmDscRsm.Text = cadPdm.Pdm_DscRsm;
                    txtPdmCodAmb.Text = cadPdm.Pdm_CodAmb;
                    txtPdmDscAmb.Text = cadPdm.Pdm_DscAmb;
                    txtPdmQtdCh_.Text = cadPdm.Pdm_QtdCh_.ToString();
                    txtPdmQtdFlm.Text = cadPdm.Pdm_QtdFlm.ToString();                   
                    chkPdmAltCpx.Checked = cadPdm.Pdm_AltCpx;
                    chkPdmEsp.Checked = cadPdm.Pdm_Esp;
                    chkPdmPrf.Checked = cadPdm.Pdm_Prf ?? false;
                    chkPdmAtv.Checked = cadPdm.Pdm_Atv ?? false;
                    chkPdmBlqUrg.Checked = cadPdm.Pdm_BlqUrg ?? false;
                    ddlPdmSxo.SelectedValue = cadPdm.Pdm_Sxo;
                    txtPdmIddMin.Text = cadPdm.Pdm_IddMin.ToString();
                    txtPdmIddMax.Text = cadPdm.Pdm_IddMax.ToString();
                    txtPdmQtdMax.Text = cadPdm.Pdm_IddMax.ToString();
                    txtPdmQtdDia.Text = cadPdm.Pdm_QtdDia.ToString();
                    txtPdmQtdMes.Text = cadPdm.Pdm_QtdMes.ToString();
                    txtPdmQtdAno.Text = cadPdm.Pdm_QtdAno.ToString();
                    txtPdmRtn.Text = cadPdm.Pdm_Rtn.ToString();

                    setViewStateValue("dbEnt", cadPdm);
                }
            }
        }
        protected void btnDel_Click(object sender, EventArgs e)
        {
            if (grd.SelectedIndex != -1)
            {
                int idPdm = int.Parse(grd.SelectedValue.ToString());

                using (AppEntities ctx = new AppEntities())
                {
                    Atz_Pdm cadPdm = new Atz_Pdm();
                    cadPdm = ctx.Atz_Pdm.First(t => t.IdPdm == idPdm);
                    ctx.DeleteObject(cadPdm);
                    ctx.SaveChanges();                 
                }
                grd.DataBind();
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (PageMaster.validateFields())
            {
                if (displayMode == Mode.Add)
                {
                    // Inserindo ...
                    using (AppEntities ctx = new AppEntities())
                    {
                        Atz_Pdm cadPdm = new Atz_Pdm();
                        cadPdm.Pdm_Cod = txtPdmCod.Text;
                        cadPdm.Pdm_IdTab = Convert.ToByte(ddlPdmIdTab.SelectedValue);
                        cadPdm.Pdm_IdTpp = Convert.ToByte(ddlPdmIdTpp.SelectedValue);
                        cadPdm.Pdm_IdGrp = Convert.ToByte(ddlPdmIdGrp.SelectedValue);
                        cadPdm.Pdm_Dsc = txtPdmDsc.Text;
                        cadPdm.Pdm_DscRsm = txtPdmDscRsm.Text;
                        cadPdm.Pdm_CodAmb = txtPdmCodAmb.Text;
                        cadPdm.Pdm_DscAmb = txtPdmDscAmb.Text;
                        if (!string.IsNullOrWhiteSpace(txtPdmQtdCh_.Text))
                            cadPdm.Pdm_QtdCh_ = Convert.ToDecimal(txtPdmQtdCh_.Text);
                        else
                            cadPdm.Pdm_QtdCh_ = null;
                        if (!string.IsNullOrWhiteSpace(txtPdmQtdFlm.Text))
                            cadPdm.Pdm_QtdFlm = Convert.ToDecimal(txtPdmQtdFlm.Text);
                        else
                            cadPdm.Pdm_QtdFlm = null;
                        cadPdm.Pdm_AltCpx = chkPdmAltCpx.Checked;
                        cadPdm.Pdm_Esp = chkPdmEsp.Checked;
                        cadPdm.Pdm_Prf = chkPdmPrf.Checked;
                        cadPdm.Pdm_Atv = chkPdmAtv.Checked;
                        cadPdm.Pdm_BlqUrg = chkPdmBlqUrg.Checked;
                        cadPdm.Pdm_Sxo = ddlPdmSxo.SelectedValue;
                        if (!string.IsNullOrWhiteSpace(txtPdmIddMin.Text))
                            cadPdm.Pdm_IddMin = Convert.ToByte(txtPdmIddMin.Text);
                        else
                            cadPdm.Pdm_IddMin = null;
                        if (!string.IsNullOrWhiteSpace(txtPdmIddMax.Text))
                            cadPdm.Pdm_IddMax = Convert.ToByte(txtPdmIddMax.Text);
                        else
                            cadPdm.Pdm_IddMax = null;
                        if (!string.IsNullOrWhiteSpace(txtPdmQtdMax.Text))
                            cadPdm.Pdm_QtdMax = Convert.ToByte(txtPdmQtdMax.Text);
                        else
                            cadPdm.Pdm_QtdMax = null;
                        if (!string.IsNullOrWhiteSpace(txtPdmQtdDia.Text))
                            cadPdm.Pdm_QtdDia = Convert.ToByte(txtPdmQtdDia.Text);
                        else
                            cadPdm.Pdm_QtdDia = null;
                        if (!string.IsNullOrWhiteSpace(txtPdmQtdMes.Text))
                            cadPdm.Pdm_QtdMes = Convert.ToByte(txtPdmQtdMes.Text);
                        else
                            cadPdm.Pdm_QtdMes = null;
                        if (!string.IsNullOrWhiteSpace(txtPdmQtdAno.Text))
                            cadPdm.Pdm_QtdAno = Convert.ToByte(txtPdmQtdAno.Text);
                        else
                            cadPdm.Pdm_QtdAno = null;
                        if (!string.IsNullOrWhiteSpace(txtPdmRtn.Text))
                            cadPdm.Pdm_Rtn = Convert.ToByte(txtPdmRtn.Text);
                        else
                            cadPdm.Pdm_Rtn = null;
                        ctx.Atz_Pdm.AddObject(cadPdm);
                        ctx.SaveChanges();
                    }
                    grd.DataBind();
                    displayMode = Mode.Browse;
                    lockForm();
                }
                else if (displayMode == Mode.Update)
                {
                    // Alterando ...
                    using (AppEntities ctx = new AppEntities())
                    {
                        //Atz_Tpl tpl = ent.Atz_Tpl.First(t => t.IdTpl == Convert.ToInt16(grd.SelectedValue));
                        Atz_Pdm cadPdm = (Atz_Pdm)getViewStateValue("dbEnt", null);
                        
                        cadPdm.Pdm_Cod = txtPdmCod.Text;
                        cadPdm.Pdm_IdTab = Convert.ToByte(ddlPdmIdTab.SelectedValue);
                        cadPdm.Pdm_IdTpp = Convert.ToByte(ddlPdmIdTpp.SelectedValue);
                        cadPdm.Pdm_IdGrp = Convert.ToByte(ddlPdmIdGrp.SelectedValue);
                        cadPdm.Pdm_Dsc = txtPdmDsc.Text;
                        cadPdm.Pdm_DscRsm = txtPdmDscRsm.Text;
                        cadPdm.Pdm_CodAmb = txtPdmCodAmb.Text;
                        cadPdm.Pdm_DscAmb = txtPdmDscAmb.Text;
                        if (!string.IsNullOrWhiteSpace(txtPdmQtdCh_.Text))
                            cadPdm.Pdm_QtdCh_ = Convert.ToDecimal(txtPdmQtdCh_.Text);
                        else
                            cadPdm.Pdm_QtdCh_ = null;
                        if (!string.IsNullOrWhiteSpace(txtPdmQtdFlm.Text))
                            cadPdm.Pdm_QtdFlm = Convert.ToDecimal(txtPdmQtdFlm.Text);
                        else
                            cadPdm.Pdm_QtdFlm = null;
                        cadPdm.Pdm_AltCpx = chkPdmAltCpx.Checked;
                        cadPdm.Pdm_Esp = chkPdmEsp.Checked;
                        cadPdm.Pdm_Prf = chkPdmPrf.Checked;
                        cadPdm.Pdm_Atv = chkPdmAtv.Checked;
                        cadPdm.Pdm_BlqUrg = chkPdmBlqUrg.Checked;
                        cadPdm.Pdm_Sxo = ddlPdmSxo.SelectedValue;
                        if (!string.IsNullOrWhiteSpace(txtPdmIddMin.Text))
                            cadPdm.Pdm_IddMin = Convert.ToByte(txtPdmIddMin.Text);
                        else
                            cadPdm.Pdm_IddMin = null;
                        if (!string.IsNullOrWhiteSpace(txtPdmIddMax.Text))
                            cadPdm.Pdm_IddMax = Convert.ToByte(txtPdmIddMax.Text);
                        else
                            cadPdm.Pdm_IddMax = null;
                        if (!string.IsNullOrWhiteSpace(txtPdmQtdMax.Text))
                            cadPdm.Pdm_QtdMax = Convert.ToByte(txtPdmQtdMax.Text);
                        else
                            cadPdm.Pdm_QtdMax = null;
                        if (!string.IsNullOrWhiteSpace(txtPdmQtdDia.Text))
                            cadPdm.Pdm_QtdDia = Convert.ToByte(txtPdmQtdDia.Text);
                        else
                            cadPdm.Pdm_QtdDia = null;
                        if (!string.IsNullOrWhiteSpace(txtPdmQtdMes.Text))
                            cadPdm.Pdm_QtdMes = Convert.ToByte(txtPdmQtdMes.Text);
                        else
                            cadPdm.Pdm_QtdMes = null;
                        if (!string.IsNullOrWhiteSpace(txtPdmQtdAno.Text))
                            cadPdm.Pdm_QtdAno = Convert.ToByte(txtPdmQtdAno.Text);
                        else
                            cadPdm.Pdm_QtdAno = null;
                        if (!string.IsNullOrWhiteSpace(txtPdmRtn.Text))
                            cadPdm.Pdm_Rtn = Convert.ToByte(txtPdmRtn.Text);
                        else
                            cadPdm.Pdm_Rtn = null;

                        if (cadPdm.EntityState == EntityState.Detached)
                        {
                            object original = null;
                            if (ctx.TryGetObjectByKey(cadPdm.EntityKey, out original))
                            {
                                ctx.ApplyCurrentValues(cadPdm.EntityKey.EntitySetName, cadPdm);
                                ctx.SaveChanges();
                                grd.DataBind();
                                displayMode = Mode.Browse;
                                lockForm();
                            }
                        }
                    }
                }
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            displayMode = Mode.Browse;
            lockForm();
        }
        #endregion
}
}