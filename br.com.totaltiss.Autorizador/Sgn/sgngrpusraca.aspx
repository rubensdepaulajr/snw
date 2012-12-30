<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Inherits="Sgn_sgngrpusraca" Title="Grupos de Usuários - Permissões" Codebehind="sgngrpusraca.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<!-- Inicio do content principal -->
<div align="center" id="titulo">
<b>Grupos de Usuários - Permissões</b>
<hr />
</div>
<div id="botoes">
<asp:Button id="btnNew" onclick="btnNew_Click" runat="server" Text="Novo" CssClass="input7"></asp:Button>
<img alt=" " src="../Images/spacer.gif" width="5" height="5" border="0"  />
<asp:Button id="btnEdit" onclick="btnEdit_Click" runat="server" Text="Alterar" CssClass="input7" Visible="False"></asp:Button>
<img  alt=" " src="../Images/spacer.gif" width="5" height="5" border="0" />&nbsp;
    <asp:Button ID="btnDel" runat="server" CssClass="input7" OnClick="btnDel_Click" Text="Excluir" />
    <asp:Label ID="lblEditError" runat="server" CssClass="vermelhonormal" Text="* Nenhum item selecionado"
        Visible="False" Width="271px"></asp:Label>
<hr />
</div>
<img alt="" src="../Images/spacer.gif" width="5" height="15" border="0" />
    <asp:Panel ID="pnlPsq" runat="server" Width="424px">
    <table>
    <tr>
       <td style="width: 131px; height: 18px">
           &nbsp;Selecione o grupo:</td>
        <td style="width: 231px; height: 18px">
            <asp:DropDownList ID="ddlGrupo" runat="server" DataSourceID="dtsGrp" DataTextField="Grp_Dsc"
                DataValueField="IdGrp" Width="184px" AutoPostBack="True" OnSelectedIndexChanged="ddlGrupo_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:SqlDataSource ID="dtsGrp" runat="server" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>"
                SelectCommand="SELECT [IdGrp], [Grp_Dsc] FROM [Sgn_Grp] ORDER BY [Grp_Dsc]"></asp:SqlDataSource>
        </td>
    </tr>        
    </table>
    </asp:Panel>
<img alt=" " src="../Images/spacer.gif" width="5" height="15" border="0" />
    &nbsp;&nbsp;
    
    


    
    <asp:Panel ID="pnlInfo" runat="server" Visible="False" >
    
<div>
<b>Pesquisar Usuários:</b><table>
    <tr>
        <td class="vermelhonormal" style="height: 26px">
            <table>
                <tr>
                    <td style="width: 267px">
                        <asp:RadioButtonList ID="rblTipAco" runat="server" CssClass="azulescuropequeno" RepeatDirection="Horizontal">
                            <asp:ListItem Value="UserName">Login</asp:ListItem>
                            <asp:ListItem Value="Usr_Nme">Nome</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="rqlTipoPesquisa" runat="server" ControlToValidate="rblTipAco"
                            ErrorMessage="* Selecione um tipo de pesquisa acima" ValidationGroup="pesquisa"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 267px">
                        <asp:TextBox ID="txtNme" runat="server" CssClass="input2" Width="130px"></asp:TextBox>
                        &nbsp; &nbsp;&nbsp;
                        <asp:Button ID="btnSearch" runat="server" CssClass="input7" OnClick="btnSearch_Click"
                            Text="Pesquisar" Width="100px" ValidationGroup="pesquisa" /></td>
                </tr>
            </table>
        </td>
    </tr>
<tr>
    <td class="vermelhonormal" style="height: 26px">
        <asp:GridView ID="grdUsr" runat="server" AllowPaging="True" AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="dtsUsr"
        OnSelectedIndexChanged="grd_SelectedIndexChanged" PageSize="5" 
            DataKeyNames="IdUsr" Font-Size="X-Small" Width="60%" SkinID="gridCRUD">
            <Columns>
                <asp:BoundField DataField="IdUsr" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                    SortExpression="IdUsr" />
                <asp:BoundField DataField="Usr_Nme" HeaderText="Nome do Usu&#225;rio" SortExpression="Usr_Nme" />
                <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
            </Columns>
    </asp:GridView>
        <asp:SqlDataSource ID="dtsUsr" runat="server" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" SelectCommand="ssSgn_Usr" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtNme" Name="UserName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtNme" Name="Usr_Nme" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </td>
</tr>


<tr><td align=center style="height: 21px"><asp:Button id="btnSave" onclick="btnSave_Click" runat="server" Text="Gravar" CssClass="input7"></asp:Button>
&nbsp;
<asp:Button id="btnCancel" onclick="btnCancel_Click" runat="server" Text="Cancelar" CssClass="input7"></asp:Button></td></tr>

</table>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dtsUsr" DataTextField="Usr_Nme"
        DataValueField="IdUsr">
    </asp:DropDownList></div>   
        <asp:Label ID="lblMsg" runat="server" CssClass="vermelhonormal" Text="* O Usuário deve ser selecionado"
            Visible="False" Width="271px"></asp:Label></asp:Panel> 
  
    <br />
    <asp:GridView ID="grd" runat="server" AllowPaging="True" AllowSorting="True" 
        AutoGenerateColumns="False" DataSourceID="dts"
        OnSelectedIndexChanged="grd_SelectedIndexChanged" PageSize="5" 
        DataKeyNames="IdUsr" Font-Size="X-Small" Width="60%" SkinID="gridCRUD">
        <Columns>
            <asp:BoundField DataField="IdUsr" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                SortExpression="IdUsr" />
            <asp:BoundField DataField="Usr_Nme" HeaderText="Nome do Usu&#225;rio" SortExpression="Usr_Nme" />
            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="dts" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>"
        InsertCommand="stSgn_GrpUsr" InsertCommandType="StoredProcedure" SelectCommand="ssSgn_GrpUsr"
        SelectCommandType="StoredProcedure" DeleteCommand="stSgn_GrpUsr" DeleteCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlGrupo" Name="Gpu_IdGrp" PropertyName="SelectedValue"
                Type="Int16" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="Tip_Aco" Type="String" DefaultValue="I" />
            <asp:ControlParameter ControlID="ddlGrupo" DefaultValue="" Name="Gpu_IdGrp" PropertyName="SelectedValue"
                Type="Int16" />
            <asp:ControlParameter ControlID="grdUsr" Name="Gpu_IdUsr" PropertyName="SelectedValue"
                Type="Int32" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter DefaultValue="D" Name="Tip_Aco" Type="String" />
            <asp:ControlParameter ControlID="ddlGrupo" DefaultValue="" Name="Gpu_IdGrp" PropertyName="SelectedValue"
                Type="Int16" />
            <asp:ControlParameter ControlID="grd" Name="Gpu_IdUsr" PropertyName="SelectedValue"
                Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    &nbsp;<!-- Fim do content principal -->
    
    
  
</asp:Content>
