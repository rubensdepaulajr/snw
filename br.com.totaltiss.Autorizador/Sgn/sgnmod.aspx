<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Inherits="Sgn_sgnmod" Title="Módulos do Sistema" Codebehind="sgnmod.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<!-- Inicio do content principal -->
<div align="center" id="titulo">
<h2>Módulos do Sistema</h2>
<hr />
</div>
<div id="botoes">
<asp:Button id="btnNew" onclick="btnNew_Click" runat="server" Text="Novo" CssClass="input7"></asp:Button>
<img alt=" " src="../Images/spacer.gif" width="5" height="5" border="0"  />
<asp:Button id="btnEdit" onclick="btnEdit_Click" runat="server" Text="Alterar" CssClass="input7"></asp:Button>
<img  alt=" " src="../Images/spacer.gif" width="5" height="5" border="0" />&nbsp;
    <asp:Button ID="btnDel" runat="server" CssClass="input7" OnClick="btnDel_Click" Text="Excluir" />
    <asp:Label ID="lblEditError" runat="server" CssClass="vermelhonormal" Text="* Nenhum item selecionado."
        Visible="False" Width="271px"></asp:Label>
<hr />
</div>
<img alt="" src="../Images/spacer.gif" width="5" height="15" border="0" />
<div>
    <b>Pesquisar módulo</b><table>
    <tr>
       <td>
       <asp:RadioButtonList ID="rblTipAco" runat="server" CssClass="azulescuropequeno" RepeatDirection="Horizontal">
           <asp:ListItem Value="IdMod">C&#243;digo</asp:ListItem>
           <asp:ListItem Value="Mod_Dsc">Nome</asp:ListItem>
        </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="rqlTipoPesquisa" runat="server" ErrorMessage="* Selecione um tipo de pesquisa acima" ControlToValidate="rblTipAco"></asp:RequiredFieldValidator></td></tr>        
        <tr>
        <td>
            
            <asp:TextBox ID="txtNme" runat="server" Width="130px" CssClass="input2"></asp:TextBox>
            &nbsp; &nbsp;&nbsp;
            <asp:Button ID="btnSearch"
                runat="server" OnClick="btnSearch_Click" Text="Pesquisar" Width="100px" CssClass="input7" /></td>        
    </tr>
    </table>
</div>
<img alt=" " src="../Images/spacer.gif" width="5" height="15" border="0" />
    &nbsp;&nbsp;
    
    


    
    <asp:Panel ID="pnlInfo" runat="server" >
    
<div>
<b>Informações do papel:</b>
<table>
<tr>
<td>Código:</td><td >
    <asp:TextBox ID="txtIdMod" runat="server" CssClass="input2"></asp:TextBox></td>
</tr>
<tr>
<td>Descrição:</td><td class="vermelhonormal">
    <asp:TextBox ID="txtMod_Dsc" runat="server" CssClass="input2" Width="400px" MaxLength="70"></asp:TextBox>*</td>
</tr>

<tr><td align=center colspan=2 style="height: 21px"><asp:Button id="btnSave" onclick="btnSave_Click" runat="server" Text="Gravar" CssClass="input7"></asp:Button>
&nbsp;
<asp:Button id="btnCancel" onclick="btnCancel_Click" runat="server" Text="Cancelar" CssClass="input7"></asp:Button></td></tr>

</table>

</div>   
        <asp:Label ID="lblMsg" runat="server" CssClass="vermelhonormal" Text="* Campos obrigatórios em branco"
            Visible="False" Width="271px"></asp:Label></asp:Panel> 
  
    <br />
    <asp:GridView ID="grd" runat="server" AllowPaging="True" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="IdMod" DataSourceID="dts"
        OnSelectedIndexChanged="grd_SelectedIndexChanged" PageSize="20" 
        Font-Size="X-Small" Width="60%" SkinID="gridCRUD" 
        onpageindexchanged="grd_PageIndexChanged">
        <Columns>        
            <asp:BoundField DataField="IdMod" HeaderText="ID" ReadOnly="True" SortExpression="IdMod" />
            <asp:BoundField DataField="Mod_Dsc" HeaderText="Descri&#231;&#227;o" SortExpression="Mod_Dsc" />
            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" >
            <HeaderStyle Width="50px" />
            </asp:CommandField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="dts" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>"
        InsertCommand="stSgn_Mod" InsertCommandType="StoredProcedure" SelectCommand="ssSgn_Mod"
        SelectCommandType="StoredProcedure" UpdateCommand="stSgn_Mod" UpdateCommandType="StoredProcedure" DeleteCommand="DELETE FROM dbo.Sgn_Mod WHERE IdMod = @IdMod">
        <SelectParameters>
            <asp:Parameter Name="IdMod" Type="Int16" />
            <asp:Parameter Name="Mod_Dsc" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtIdMod" Name="IdMod" PropertyName="Text" Type="Int16" />
            <asp:ControlParameter ControlID="txtMod_Dsc" Name="Mod_Dsc" PropertyName="Text" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtIdMod" Name="IdMod" PropertyName="Text" Type="Int16" />
            <asp:ControlParameter ControlID="txtMod_Dsc" Name="Mod_Dsc" PropertyName="Text" Type="String" />
        </InsertParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="txtIdMod" Name="IdMod" PropertyName="Text" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    &nbsp;<!-- Fim do content principal -->
    
    
  
</asp:Content>
