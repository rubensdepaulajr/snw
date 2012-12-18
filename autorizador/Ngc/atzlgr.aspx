<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="atzlgr.aspx.cs" Inherits="Ngc_atzlgr" Title="Cadastro de Logradouros" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    &nbsp;<br />
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
            <div id="Titulo">
                <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="left" style="width: 8px">
                            <img alt="" height="37" src="../images/tit_left.gif" width="9" /></td>
                        <td bgcolor="#f4f4f4">
                            <h2>
                                Logradouros</h2>
                        </td>
                        <td align="left" width="9">
                            <img alt="" height="37" src="../images/tit_right.gif" width="9" /></td>
                    </tr>
                </table>        
            </div>            
            <br />
            <br />
            <br />
            <hr />
<DIV id="botoes"><asp:Button id="btnNew" onclick="btnNew_Click" runat="server" Text="Novo" CssClass="input7"></asp:Button> <IMG height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 /> <asp:Button id="btnEdit" onclick="btnEdit_Click" runat="server" Text="Alterar" CssClass="input7"></asp:Button> <IMG height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 />&nbsp; <asp:Button id="btnDel" onclick="btnDel_Click" runat="server" Text="Excluir" CssClass="input7"></asp:Button> 
    <asp:Label id="lblEditError" runat="server" Text="* Nenhum item selecionado" 
        CssClass="erro" Visible="False" Width="271px"></asp:Label> 
<hr />
</DIV><img height=15 alt="" src="../Images/spacer.gif" width=5 border=0 /> <asp:Panel id="pnlPsq" runat="server"><B>Pesquisar logradouro</B><BR /><TABLE><TBODY><TR><TD style="HEIGHT: 18px">Município:</TD></TR><TR><TD><asp:DropDownList id="ddlIdMun" runat="server" CssClass="input2" Width="350px" DataSourceID="dtsMun" OnSelectedIndexChanged="ddlIdBrr_SelectedIndexChanged" DataTextField="Mun_Nme" DataValueField="IdMun" AutoPostBack="True">
    </asp:DropDownList><asp:SqlDataSource id="dtsMun" runat="server" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" SelectCommand="SELECT [IdMun], [Mun_Nme] FROM [Atz_Mun] ORDER BY [Mun_Nme]">
    </asp:SqlDataSource> </TD></TR><TR><TD><asp:RadioButtonList id="rblTipAco" runat="server" CssClass="azulescuropequeno" RepeatDirection="Horizontal">
           <asp:ListItem Value="IdLgr">C&#243;digo</asp:ListItem>
           <asp:ListItem Value="Lgr_Nme">Nome</asp:ListItem>
        </asp:RadioButtonList> <asp:RequiredFieldValidator id="rqlTipoPesquisa" runat="server" 
                        ErrorMessage="* Selecione um tipo de pesquisa acima" 
                        ControlToValidate="rblTipAco" CssClass="erro"></asp:RequiredFieldValidator></TD></TR><TR><TD><asp:TextBox id="txtPsq" runat="server" CssClass="input2" Width="130px"></asp:TextBox> &nbsp; &nbsp;&nbsp; <asp:Button id="btnSearch" onclick="btnSearch_Click" runat="server" Text="Pesquisar" CssClass="input7" Width="100px"></asp:Button></TD></TR></TBODY></TABLE></asp:Panel> <IMG height=15 alt=" " src="../Images/spacer.gif" width=5 border=0 /> &nbsp;&nbsp; <asp:Panel id="pnlInfoPrf" runat="server"><DIV><B>Informações do logradouro:</B> <TABLE><TBODY><TR><TD style="TEXT-ALIGN: right">Código:</TD><TD><asp:TextBox id="txtIdLgr" runat="server" CssClass="inputID"></asp:TextBox></TD></TR><TR><TD style="TEXT-ALIGN: right">Bairro:</TD><TD class="vermelhonormal"><asp:DropDownList id="ddlIdBrr" runat="server" CssClass="input2" Width="404px" DataSourceID="dtsBrr" OnSelectedIndexChanged="ddlIdBrr_SelectedIndexChanged" DataTextField="Brr_Nme" DataValueField="IdBrr" AutoPostBack="True" __designer:wfdid="w6"></asp:DropDownList><asp:SqlDataSource id="dtsBrr" runat="server" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" SelectCommand="SELECT IdBrr, Brr_Nme, Brr_IdMun FROM Atz_Brr WHERE (Brr_IdMun = @Brr_IdMun) ORDER BY Brr_Nme" __designer:wfdid="w7"><SelectParameters>
<asp:ControlParameter ControlID="ddlIdMun" PropertyName="SelectedValue" Name="Brr_IdMun" Type="Int16"></asp:ControlParameter>
</SelectParameters>
</asp:SqlDataSource></TD></TR><TR><TD style="TEXT-ALIGN: right">Tipo:</TD><TD class="vermelhonormal"><asp:DropDownList id="ddlLgr_IdTpl" runat="server" CssClass="input2" DataSourceID="dtsTpl" DataTextField="Tpl_Dsc" DataValueField="IdTpl"></asp:DropDownList><asp:SqlDataSource id="dtsTpl" runat="server" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" SelectCommand="SELECT IdTpl,upper(Tpl_Dsc) as Tpl_Dsc FROM Atz_Tpl"></asp:SqlDataSource> </TD></TR><TR><TD>Descrição:</TD><TD class="vermelhonormal"><asp:TextBox id="txtLgr_Nme" runat="server" CssClass="input2" Width="400px" MaxLength="50"></asp:TextBox>*</TD></TR><TR><TD style="TEXT-ALIGN: right">CEP:</TD><TD class="vermelhonormal"><asp:TextBox id="txtLgr_Cep" runat="server" CssClass="input2" Width="120px" MaxLength="8"></asp:TextBox>*<cc1:FilteredTextBoxExtender id="ftetxtLgr_Cep" runat="server" __designer:wfdid="w277" TargetControlID="txtLgr_Cep" FilterType="Numbers"></cc1:FilteredTextBoxExtender></TD></TR><TR><TD style="HEIGHT: 10px"></TD><TD style="HEIGHT: 10px" class="vermelhonormal"></TD></TR><TR><TD style="HEIGHT: 21px" align=center colSpan=2><asp:Button id="btnSave" onclick="btnSave_Click" runat="server" Text="Gravar" CssClass="input7"></asp:Button> &nbsp; <asp:Button id="btnCancel" onclick="btnCancel_Click" runat="server" Text="Cancelar" CssClass="input7"></asp:Button></TD></TR></TBODY></TABLE></DIV>
            <asp:Label id="lblMsg" runat="server" Text="* Campos obrigatórios em branco" 
                CssClass="erro" Visible="False" Width="271px"></asp:Label></asp:Panel> <BR />
            <asp:GridView id="grd" runat="server" Width="100%" 
                OnPageIndexChanging="grd_PageIndexChanging" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" 
                DataKeyNames="IdLgr,IdBrr,IdMun" DataSourceID="dts" 
                OnSelectedIndexChanged="grd_SelectedIndexChanged" PageSize="20" 
                Font-Size="X-Small" SkinID="gridCRUD">
<Columns>
<asp:BoundField DataField="IdLgr" HeaderText="ID" ReadOnly="True" SortExpression="IdLgr">
<ItemStyle Width="10%"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Tpl_Dsc" HeaderText="Tipo Logradouro" SortExpression="Tpl_Dsc">
<ItemStyle Width="15%"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Lgr_Nme" HeaderText="Nome Logradouro" SortExpression="Lgr_Nme">
<ItemStyle Width="50%"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Brr_Nme" HeaderText="Bairro" SortExpression="Brr_Nme">
<ItemStyle Width="25%"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Lgr_Cep" HeaderText="CEP" SortExpression="Lgr_Cep">
<ItemStyle Width="10%"></ItemStyle>
</asp:BoundField>
<asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
</Columns>

</asp:GridView> <asp:SqlDataSource id="dts" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" InsertCommand="stAtz_Lgr" InsertCommandType="StoredProcedure" SelectCommand="ssAtz_Lgr" SelectCommandType="StoredProcedure" UpdateCommand="stAtz_Lgr" UpdateCommandType="StoredProcedure" DeleteCommand="delete from atz_lgr where idlgr = @idlgr"><SelectParameters>
<asp:Parameter Name="IdLgr" Type="Int32"></asp:Parameter>
<asp:ControlParameter ControlID="ddlIdMun" PropertyName="SelectedValue" Name="IdMun" Type="Int16"></asp:ControlParameter>
<asp:Parameter Name="Lgr_IdBrr" Type="Int32"></asp:Parameter>
<asp:Parameter Name="Lgr_Nme" Type="String"></asp:Parameter>
<asp:Parameter Name="Lgr_Cep" Type="String"></asp:Parameter>
</SelectParameters>
<DeleteParameters>
<asp:ControlParameter ControlID="txtIdLgr" PropertyName="Text" Name="idlgr"></asp:ControlParameter>
</DeleteParameters>
<UpdateParameters>
<asp:ControlParameter ControlID="txtIdLgr" PropertyName="Text" Name="IdLgr" Type="Int32"></asp:ControlParameter>
<asp:ControlParameter ControlID="ddlIdBrr" PropertyName="SelectedValue" Name="Lgr_IdBrr" Type="Int32"></asp:ControlParameter>
<asp:ControlParameter ControlID="ddlLgr_IdTpl" PropertyName="SelectedValue" Name="Lgr_IdTpl" Type="Int16"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtLgr_Nme" PropertyName="Text" Name="Lgr_Nme" Type="String"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtLgr_Cep" PropertyName="Text" Name="Lgr_Cep" Type="String"></asp:ControlParameter>
</UpdateParameters>
<InsertParameters>
<asp:ControlParameter ControlID="txtIdLgr" PropertyName="Text" Name="IdLgr" Type="Int32"></asp:ControlParameter>
<asp:ControlParameter ControlID="ddlIdBrr" PropertyName="SelectedValue" Name="Lgr_IdBrr" Type="Int32"></asp:ControlParameter>
<asp:ControlParameter ControlID="ddlLgr_IdTpl" PropertyName="SelectedValue" Name="Lgr_IdTpl" Type="Int16"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtLgr_Nme" PropertyName="Text" Name="Lgr_Nme" Type="String"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtLgr_Cep" PropertyName="Text" Name="Lgr_Cep" Type="String"></asp:ControlParameter>
</InsertParameters>
</asp:SqlDataSource> 
</contenttemplate>
    </asp:UpdatePanel>
    <!-- Fim do content principal -->
    
</asp:Content>
