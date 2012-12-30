<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Inherits="Ngc_atzrde" Title="Cadastro de Redes" Codebehind="atzrde.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
            <div id="Titulo">
                <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="left" style="width: 8px">
                            <img alt="" height="37" src="../images/tit_left.gif" width="9" /></td>
                        <td bgcolor="#f4f4f4">
                            <h2>
                                Redes</h2>
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
<div id="botoes"><asp:Button id="btnNew" onclick="btnNew_Click" runat="server" CssClass="input7" Text="Novo"></asp:Button> <IMG height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 /> <asp:Button id="btnEdit" onclick="btnEdit_Click" runat="server" CssClass="input7" Text="Alterar"></asp:Button> <IMG height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 />&nbsp; <asp:Button id="btnDel" onclick="btnDel_Click" runat="server" CssClass="input7" Text="Excluir"></asp:Button> 
    <asp:Label id="lblEditError" runat="server" CssClass="erro" 
        Text="* Nenhum item selecionado" Width="271px" Visible="False"></asp:Label> 
<hr />
</div><img height="15" alt="" src="../Images/spacer.gif" width=5 border=0 /> <asp:Panel id="pnlPsq" runat="server"><B>Pesquisar rede</B><TABLE><TBODY><TR><TD><asp:RadioButtonList id="rblTipAco" runat="server" CssClass="azulescuropequeno" RepeatDirection="Horizontal">
           <asp:ListItem Value="IdRde">C&#243;digo</asp:ListItem>
           <asp:ListItem Value="Rde_Nme">Nome</asp:ListItem>
        </asp:RadioButtonList> <asp:RequiredFieldValidator id="rqlTipoPesquisa" runat="server" 
                    ControlToValidate="rblTipAco" 
                    ErrorMessage="* Selecione um tipo de pesquisa acima" CssClass="erro"></asp:RequiredFieldValidator></TD></TR><TR><TD><asp:TextBox id="txtNme" runat="server" CssClass="input2" Width="130px"></asp:TextBox> &nbsp; &nbsp;&nbsp; <asp:Button id="btnSearch" onclick="btnSearch_Click" runat="server" CssClass="input7" Text="Pesquisar" Width="100px"></asp:Button></TD></TR></TBODY></TABLE></asp:Panel> <IMG height=15 alt=" " src="../Images/spacer.gif" width=5 border=0 /> &nbsp;&nbsp; <asp:Panel id="pnlInfoPrf" runat="server"><DIV><B>Informações da rede:</B> <TABLE><TBODY><TR><TD>Código:</TD><TD><asp:TextBox id="txtIdRde" runat="server" CssClass="input2"></asp:TextBox></TD></TR><TR><TD align=right>Nome:</TD><TD class="vermelhonormal"><asp:TextBox id="txtRde_Nme" runat="server" CssClass="input2" Width="400px" MaxLength="80"></asp:TextBox>*</TD></TR><TR><TD style="HEIGHT: 21px" align=center colSpan=2><asp:Button id="btnSave" onclick="btnSave_Click" runat="server" CssClass="input7" Text="Gravar"></asp:Button> &nbsp; <asp:Button id="btnCancel" onclick="btnCancel_Click" runat="server" CssClass="input7" Text="Cancelar"></asp:Button></TD></TR></TBODY></TABLE></DIV>
            <asp:Label id="lblMsg" runat="server" CssClass="erro" 
                Text="* Campos obrigatórios em branco" Width="271px" Visible="False"></asp:Label></asp:Panel> <BR />
            <asp:GridView id="grd" runat="server" Width="60%" Font-Size="X-Small" 
                PageSize="5" OnSelectedIndexChanged="grd_SelectedIndexChanged" 
                DataSourceID="dts" DataKeyNames="IdRde" AutoGenerateColumns="False" 
                AllowSorting="True" AllowPaging="True" 
                OnPageIndexChanging="grd_PageIndexChanging" SkinID="gridCRUD">
        <Columns>
            <asp:BoundField DataField="IdRde" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                SortExpression="IdRde" >
                <ItemStyle Width="20%" />
            </asp:BoundField>
            <asp:BoundField DataField="Rde_Nme" HeaderText="Rede" SortExpression="Rde_Nme" />
            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" >
            <HeaderStyle Width="50px" />
            </asp:CommandField>
        </Columns>
    </asp:GridView> <asp:SqlDataSource id="dts" runat="server" DeleteCommand="delete from atz_rde where idrde = @idrde" UpdateCommandType="StoredProcedure" UpdateCommand="stAtz_Rde" SelectCommandType="StoredProcedure" SelectCommand="ssAtz_Rde" InsertCommandType="StoredProcedure" InsertCommand="stAtz_Rde" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" CancelSelectOnNullParameter="False">
        <SelectParameters>
            <asp:Parameter Name="IdRde" Type="Int16" />
            <asp:Parameter Name="Rde_Nme" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtIdRde" Name="IdRde" PropertyName="Text" Type="Int16" />
            <asp:ControlParameter ControlID="txtRde_Nme" Name="Rde_Nme" PropertyName="Text" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtIdRde" Name="IdRde" PropertyName="Text" Type="Int16" />
            <asp:ControlParameter ControlID="txtRde_Nme" Name="Rde_Nme" PropertyName="Text" Type="String" />
        </InsertParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="txtIdRde" Name="idrde" PropertyName="Text" />
        </DeleteParameters>
    </asp:SqlDataSource>
</contenttemplate>
    </asp:UpdatePanel>
    <!-- Fim do content principal -->
</asp:Content>
