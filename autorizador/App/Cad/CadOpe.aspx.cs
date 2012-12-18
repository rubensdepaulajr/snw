using System;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using br.com.totaltiss.Data;
using br.com.totaltiss.Util;

namespace br.com.totaltiss.Gestor.Web.App.Cad
{
    public partial class CadOpe : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_Init(object sender, EventArgs e)
        {
            grd.EnableDynamicData(typeof(Cad_Ope));
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
            lblIdOpe.Text = string.Empty;
            txtOpeNme.Text = string.Empty;
            txtOpeRegAns.Text = string.Empty;
            txtOpeCnp.Text = string.Empty;
            txtOpeDatIni.Text = string.Empty;
            txtOpeDatFim.Text = string.Empty;
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
                int idOpe = Convert.ToInt16(grd.SelectedValue);
                clearForm();
                lockForm();
                using (AppEntities ctx = new AppEntities())
                {
                    Cad_Ope cadOpe = new Cad_Ope();
                    cadOpe = ctx.Cad_Ope.First(t => t.IdOpe == idOpe);
                    lblIdOpe.Text = cadOpe.IdOpe.ToString();
                    txtOpeNme.Text = cadOpe.Ope_Nme;
                    txtOpeRegAns.Text = cadOpe.Ope_RegAns.ToString();
                    txtOpeCnp.Text = cadOpe.Ope_Cnp;
                    txtOpeDatIni.Text = cadOpe.Ope_DatIni.ToShortDateString();
                    txtOpeDatFim.Text = cadOpe.Ope_DatFim.ToString();
                    setViewStateValue("dbEnt", cadOpe);
                }
            }
        }
        protected void btnDel_Click(object sender, EventArgs e)
        {
            if (grd.SelectedIndex != -1)
            {
                int idOpe = int.Parse(grd.SelectedValue.ToString());

                using (AppEntities ctx = new AppEntities())
                {
                    Cad_Ope cadOpe = new Cad_Ope();
                    cadOpe = ctx.Cad_Ope.First(t => t.IdOpe == idOpe);
                    ctx.DeleteObject(cadOpe);
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
                        Cad_Ope cadOpe = new Cad_Ope();
                        cadOpe.Ope_Nme = txtOpeNme.Text;
                        cadOpe.Ope_RegAns = Convert.ToInt32(txtOpeRegAns.Text);
                        cadOpe.Ope_Cnp = txtOpeCnp.Text;
                        cadOpe.Ope_DatIni = Convert.ToDateTime(txtOpeDatIni.Text);
                        if (!string.IsNullOrWhiteSpace(txtOpeDatFim.Text))
                            cadOpe.Ope_DatFim = Convert.ToDateTime(txtOpeDatFim.Text);
                        else
                            cadOpe.Ope_DatFim = null;
                        ctx.Cad_Ope.AddObject(cadOpe);
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
                        Cad_Ope cadOpe = (Cad_Ope)getViewStateValue("dbEnt", null);
                        cadOpe.Ope_Nme = txtOpeNme.Text;
                        cadOpe.Ope_RegAns = Convert.ToInt32(txtOpeRegAns.Text);
                        cadOpe.Ope_Cnp = txtOpeCnp.Text;
                        cadOpe.Ope_DatIni = Convert.ToDateTime(txtOpeDatIni.Text);
                        if (!string.IsNullOrWhiteSpace(txtOpeDatIni.Text))
                            cadOpe.Ope_DatFim = Convert.ToDateTime(txtOpeDatFim.Text);
                        else
                            cadOpe.Ope_DatFim = null;
                        if (cadOpe.EntityState == EntityState.Detached)
                        {
                            object original = null;
                            if (ctx.TryGetObjectByKey(cadOpe.EntityKey, out original))
                            {
                                ctx.ApplyCurrentValues(cadOpe.EntityKey.EntitySetName, cadOpe);
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