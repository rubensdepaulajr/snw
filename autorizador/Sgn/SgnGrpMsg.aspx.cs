using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using br.com.totaltiss.Data;

namespace br.com.totaltiss.Gestor.Web.App.Sgn
{
    public partial class SgnGrpMsg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                using (AppEntities ctx = new AppEntities())
                {
                    lbxTodosGrupos.DataSource = ctx.aspnet_Roles.ToList();
                    lbxTodosGrupos.DataBind();
                }
            }
        }
        
        protected void lvwMensagem_SelectedIndexChanged(object sender, EventArgs e)
        {
            Int16 idMsg = Convert.ToInt16(lvwMensagem.SelectedValue);
            using (AppEntities ctx = new AppEntities())
            {
                var sgnGrpMsg = (from m in ctx.Sgn_GrpMsg 
                                 join g in ctx.aspnet_Roles 
                                    on m.Grm_RoleId equals g.RoleId 
                                 where m.Grm_IdOpe == 1 &&
                                    m.Grm_IdMsg == idMsg
                                 select g).ToList();

                lbxNegarAuditoria.DataSource = sgnGrpMsg;
                lbxNegarAuditoria.DataBind();
            }

          
        }
        protected void btnAdicionar_Click(object sender, EventArgs e)
        {
            if (lvwMensagem.SelectedIndex >= 0 && lbxTodosGrupos.SelectedIndex >= 0)
            {
                Int16 idMsg = Convert.ToInt16(lvwMensagem.SelectedValue);
                Guid roleId = new Guid(lbxTodosGrupos.SelectedValue);
                using (AppEntities ctx = new AppEntities())
                {
                    var msg = from m in ctx.Sgn_GrpMsg
                              where m.Grm_IdMsg == idMsg &&
                                m.Grm_IdOpe == 1 &&
                                m.Grm_RoleId == roleId
                              select m.Grm_IdMsg;
                    if (msg.Count() == 0)
                    {
                        var sgnGrpMsg = new Sgn_GrpMsg();
                        sgnGrpMsg.Grm_IdOpe = 1;
                        sgnGrpMsg.Grm_IdMsg = idMsg;
                        sgnGrpMsg.Grm_RoleId = roleId;

                        ctx.Sgn_GrpMsg.AddObject(sgnGrpMsg);
                        ctx.SaveChanges();

                        lbxNegarAuditoria.DataBind();
                    }
                }
            }
        }

        protected void btnRemover_Click(object sender, EventArgs e)
        {
            if (lbxNegarAuditoria.SelectedIndex >= 0)
            {
                Int16 idMsg = Convert.ToInt16(lvwMensagem.SelectedValue);
                Guid roleId = new Guid(lbxTodosGrupos.SelectedValue);
                using (AppEntities ctx = new AppEntities())
                {
                    var sgnGrpMsg = (from m in ctx.Sgn_GrpMsg
                                     where m.Grm_IdMsg == idMsg &&
                                       m.Grm_IdOpe == 1 &&
                                       m.Grm_RoleId == roleId
                                     select m).First();

                    ctx.DeleteObject(sgnGrpMsg);
                    ctx.SaveChanges();
                    lbxNegarAuditoria.DataBind();
                }

            }
        }
}
}