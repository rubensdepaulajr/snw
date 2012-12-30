<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Inherits="Sgn_sgnpag" Title="Cadastro de Páginas" Codebehind="sgnpag.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<!-- Inicio do content principal -->
<div align="center" id="titulo">
<b>Páginas</b> de Páginas
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
    <h2>Pesquisar Páginas</h2><br />
    <table>
    <tr>
       <td>
       <asp:RadioButtonList ID="rblTipAco" runat="server" CssClass="azulescuropequeno" RepeatDirection="Horizontal">
           <asp:ListItem Value="IdPag">C&#243;digo</asp:ListItem>
           <asp:ListItem Value="Pag_Dsc">Descrição</asp:ListItem>
        </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="rqlTipoPesquisa" runat="server" ErrorMessage="* Selecione um tipo de pesquisa acima" ControlToValidate="rblTipAco"></asp:RequiredFieldValidator></td></tr>        
        <tr>
        <td>
            
            <asp:TextBox ID="txtPsq" runat="server" Width="130px" CssClass="input2"></asp:TextBox>
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
<b>Informações da página:</b>
<table>
<tr>
<td>Código:</td><td >
    <asp:TextBox ID="txtIdPag" runat="server" CssClass="inputID"></asp:TextBox></td>
</tr>
<tr>
<td style="height: 26px">
    Descrição:</td><td class="vermelhonormal" style="height: 26px">
    <asp:TextBox ID="txtPag_Dsc" runat="server" CssClass="input2" Width="400px" MaxLength="70"></asp:TextBox></td>
</tr>

<tr>
<td>Módulo sistema:</td><td class="vermelhonormal">
    <asp:DropDownList ID="ddlPag_IdMod" runat="server" CssClass="input2" DataSourceID="dtsMod" DataTextField="Mod_Dsc" DataValueField="IdMod">
    </asp:DropDownList><asp:SqlDataSource ID="dtsMod" runat="server" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>"
        SelectCommand="SELECT [IdMod], [Mod_Dsc] FROM [Sgn_Mod]">
    </asp:SqlDataSource>
</td>
</tr>
    <tr>
        <td style="height: 64px">
            Pai:</td>
        <td class="vermelhonormal" style="height: 64px">
            <asp:DropDownList ID="ddlPag_IdPai" runat="server" CssClass="input2" DataSourceID="dtsPag" DataTextField="Pag_Dsc" DataValueField="IdPag">
            </asp:DropDownList><asp:SqlDataSource ID="dtsPag" runat="server" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>"
        SelectCommand="SELECT [IdPag], [Pag_Dsc] FROM [Sgn_Pag] ORDER BY Pag_Dsc" ProviderName="<%$ ConnectionStrings:MedicallConnectionString.ProviderName %>"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td style="height: 18px">
            URL:</td>
        <td class="vermelhonormal" style="height: 18px">
            <asp:TextBox ID="txtPag_Url" runat="server" CssClass="input2" MaxLength="70" Width="400px"></asp:TextBox></td>
    </tr>
    <tr>
        <td>
            Acesso Anônimo:</td>
        <td class="vermelhonormal">
            <asp:CheckBox ID="chkPag_Anm" runat="server" />
            </td>
    </tr>
    <tr>
        <td style="height: 21px">
            Ordem exibição:</td>
        <td class="vermelhonormal" style="height: 21px">
            <asp:TextBox ID="txtPag_Ord" runat="server" CssClass="input2" Width="150px"></asp:TextBox></td>
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
        AutoGenerateColumns="False" DataKeyNames="IdPag" DataSourceID="dts"
        OnSelectedIndexChanged="grd_SelectedIndexChanged" PageSize="5" 
        Font-Size="X-Small" Width="100%" SkinID="gridCRUD">
        <Columns>            
            <asp:BoundField DataField="IdPag" HeaderText="ID" ReadOnly="True" SortExpression="IdPag" />
            <asp:BoundField DataField="Pag_Dsc" HeaderText="Descri&#231;&#227;o da P&#225;gina" SortExpression="Pag_Dsc" />
            <asp:BoundField DataField="Pag_Url" HeaderText="URL" SortExpression="Pag_Url" />
            <asp:BoundField DataField="Pag_Ord" HeaderText="Ordem Exibi&#231;&#227;o" SortExpression="Pag_Ord" />
            <asp:TemplateField HeaderText="Acesso An&#244;nimo?" SortExpression="Pag_Anm">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Pag_Anm") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkAnm" runat="server" Checked='<%# Bind("Pag_Anm") %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Mod_Dsc" HeaderText="M&#243;dulo Sistema" ReadOnly="True" SortExpression="Mod_Dsc" />
            <asp:BoundField DataField="Pai_Dsc" HeaderText="P&#225;gina Pai" SortExpression="Pai_Dsc" />
            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="dts" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>"
        InsertCommand="stSgn_Pag" InsertCommandType="StoredProcedure" SelectCommand="ssSgn_Pag"
        SelectCommandType="StoredProcedure" UpdateCommand="stSgn_Pag" UpdateCommandType="StoredProcedure" DeleteCommand="DELETE FROM dbo.Sgn_Pag WHERE IdPag = @IdPag">
        <SelectParameters>
            <asp:Parameter Name="IdPag" Type="Int32" />
            <asp:Parameter Name="Pag_IdMod" Type="Int16" />
            <asp:Parameter Name="Pag_IdPai" Type="Int16" />
            <asp:Parameter Name="Pag_Dsc" Type="String" />
        </SelectParameters>
        <UpdateParameters>
             <asp:ControlParameter ControlID="txtIdPag" Name="IdPag" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="ddlPag_IdMod" Name="Pag_IdMod" PropertyName="SelectedValue"
                Type="Int16" />
            <asp:ControlParameter ControlID="ddlPag_IdPai" Name="Pag_IdPai" PropertyName="SelectedValue"
                Type="Int16" />
            <asp:ControlParameter ControlID="txtPag_Dsc" Name="Pag_Dsc" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtPag_Url" Name="Pag_Url" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="chkPag_Anm" Name="Pag_Anm" PropertyName="Checked"
                Type="Boolean" />
            <asp:ControlParameter ControlID="txtPag_Ord" Name="Pag_Ord" PropertyName="Text" Type="Byte" />
    
        </UpdateParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtIdPag" Name="IdPag" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="ddlPag_IdMod" Name="Pag_IdMod" PropertyName="SelectedValue"
                Type="Int16" />
            <asp:ControlParameter ControlID="ddlPag_IdPai" Name="Pag_IdPai" PropertyName="SelectedValue"
                Type="Int16" />
            <asp:ControlParameter ControlID="txtPag_Dsc" Name="Pag_Dsc" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtPag_Url" Name="Pag_Url" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="chkPag_Anm" Name="Pag_Anm" PropertyName="Checked"
                Type="Boolean" />
            <asp:ControlParameter ControlID="txtPag_Ord" Name="Pag_Ord" PropertyName="Text" Type="Byte" />
        </InsertParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="txtIdPag" Name="IdPag" PropertyName="Text" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    &nbsp;<!-- Fim do content principal -->
    
    
  
</asp:Content>
