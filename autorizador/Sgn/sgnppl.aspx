<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="sgnppl.aspx.cs" Inherits="Sgn_sgnppl" Title="Cadastro de Papéis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
            <div id="Titulo">
                <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="left" style="width: 8px">
                            <img alt="" height="37" src="../images/tit_left.gif" width="9" /></td>
                        <td bgcolor="#f4f4f4">
                            <h2>
                                Papéis</h2>
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
    <h2>Pesquisar papel</h2><table>
    <tr>
       <td>
       <asp:RadioButtonList ID="rblTipAco" runat="server" CssClass="azulescuropequeno" RepeatDirection="Horizontal">
           <asp:ListItem Value="IdPpl">C&#243;digo</asp:ListItem>
           <asp:ListItem Value="Ppl_Dsc">Nome</asp:ListItem>
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
    <asp:Panel ID="pnlInfoPrf" runat="server" >
    
<div>
<b>Informações do papel:</b>
    <table>
        <tbody>
            <tr>
                <td>Código:</td><td >
                    <asp:TextBox ID="txtIdPpl" runat="server" CssClass="input2"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Descrição:</td><td class="vermelhonormal">
                    <asp:TextBox ID="txtPpl_Dsc" runat="server" CssClass="input2" Width="400px" MaxLength="70"></asp:TextBox>*</td>
            </tr>
            <tr>
                <td>Quantidade CH:</td><td class="vermelhonormal">
                    <asp:TextBox ID="txtPplQtdCh_" runat="server" CssClass="input2" Width="100px" MaxLength="10"></asp:TextBox>*</td>
            </tr>
            <tr>
                <td>Operadora?:</td><td class="vermelhonormal">
                <asp:CheckBox ID="chkPplOpe" runat="server" /></td>    
            </tr>
            <tr>
                <td>Auditar Consulta?</td><td class="vermelhonormal">
                <asp:CheckBox ID="chkPplCon" runat="server" /></td>    
            </tr>
            <tr>
                <td>Auditar SP/SADT?</td><td class="vermelhonormal">
                <asp:CheckBox ID="chkPplSdt" runat="server" /></td>    
            </tr>
            <tr>
                <td align="center" colspan="2" style="height: 21px">
                    <asp:Button id="btnSave" onclick="btnSave_Click" runat="server" Text="Gravar" CssClass="input7"></asp:Button>&nbsp;
                    <asp:Button id="btnCancel" onclick="btnCancel_Click" runat="server" Text="Cancelar" CssClass="input7"></asp:Button>
                </td>
            </tr>
        </tbody>
    </table>

</div>   
        <asp:Label ID="lblMsg" runat="server" CssClass="vermelhonormal" Text="* Campos obrigatórios em branco"
            Visible="False" Width="271px"></asp:Label></asp:Panel> 
  
    <br />
    <asp:GridView ID="grd" runat="server" AllowPaging="True" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="IdPpl" DataSourceID="dts"
        OnSelectedIndexChanged="grd_SelectedIndexChanged" PageSize="5" 
        Font-Size="X-Small" Width="60%" SkinID="gridCRUD" 
        onpageindexchanging="grd_PageIndexChanging">
        <Columns>        
            <asp:BoundField DataField="IdPpl" HeaderText="ID" ReadOnly="True" SortExpression="IdPpl" />
            <asp:BoundField DataField="Ppl_Dsc" HeaderText="Descri&#231;&#227;o" SortExpression="Ppl_Dsc" />
            <asp:BoundField DataField="Ppl_QtdCh_" HeaderText="Qtd. CH" 
                SortExpression="Ppl_QtdCh_" />
            <asp:TemplateField HeaderText="Operadora?" SortExpression="Ppl_Ope">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("Ppl_Ope") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkOpe" runat="server" Checked='<%# Bind("Ppl_Ope") %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Auditar Consulta?" SortExpression="Ppl_Con">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("Ppl_Con") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkCon" runat="server" Checked='<%# Bind("Ppl_Con") %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Auditar SP/SADT?" SortExpression="Ppl_Sdt">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("Ppl_Sdt") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkSdt" runat="server" Checked='<%# Bind("Ppl_Sdt") %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" >
            <HeaderStyle Width="50px" />
            </asp:CommandField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="dts" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>"
        InsertCommand="stSgn_Ppl" InsertCommandType="StoredProcedure" SelectCommand="ssSgn_Ppl"
        SelectCommandType="StoredProcedure" UpdateCommand="stSgn_Ppl" UpdateCommandType="StoredProcedure" DeleteCommand="DELETE FROM dbo.Sgn_Ppl WHERE IdPpl = @IdPpl">
        <SelectParameters>
            <asp:Parameter Name="IdPpl" Type="Int16" />
            <asp:Parameter Name="Ppl_Dsc" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtIdPpl" Name="IdPpl" PropertyName="Text" Type="Int16" />
            <asp:ControlParameter ControlID="txtPpl_Dsc" Name="Ppl_Dsc" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtPplQtdCh_" Name="Ppl_QtdCh_" 
                PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="chkPplOpe" Name="Ppl_Ope" 
                PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="chkPplCon" Name="Ppl_Con" 
                PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="chkPplSdt" Name="Ppl_Sdt" 
                PropertyName="Checked" Type="Boolean" />
        </UpdateParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtIdPpl" Name="IdPpl" PropertyName="Text" Type="Int16" />
            <asp:ControlParameter ControlID="txtPpl_Dsc" Name="Ppl_Dsc" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtPplQtdCh_" Name="Ppl_QtdCh_" 
                PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="chkPplOpe" Name="Ppl_Ope" 
                PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="chkPplCon" Name="Ppl_Con" 
                PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="chkPplSdt" Name="Ppl_Sdt" 
                PropertyName="Checked" Type="Boolean" />
        </InsertParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="txtIdPpl" Name="IdPpl" PropertyName="Text" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    &nbsp;<!-- Fim do content principal -->
    
    
  
</asp:Content>
