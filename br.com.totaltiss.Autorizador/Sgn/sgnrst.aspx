<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" 
Inherits="Sgn_sgnrst" Title="Usuário - Reiniciar senha" Codebehind="sgnrst.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
                <div id="Titulo">
                <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="left" style="width: 8px">
                            <img alt="" height="37" src="../images/tit_left.gif" width="9" /></td>
                        <td bgcolor="#f4f4f4">
                            <h2>
                                Cadastro de Usuários</h2>
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
                <div id="Div1" style="text-align: left">
                </div>
    &nbsp;<asp:Button ID="btnResetPwd" runat="server" CssClass="input7" OnClick="btnResetPwd_Click" Text="Reiniciar Senha" />
                <img alt="" border="0" height="15" src="../Images/spacer.gif" 
    width="5" style="margin-left: 0px" /><asp:Button ID="btnBloquear" 
    runat="server" Text="Bloquear" Width="148px" Visible="False" onclick="btnBloquear_Click" />
                <img alt="" border="0" height="15" src="../Images/spacer.gif" 
    width="5" style="margin-left: 0px" /><asp:Button ID="btnDesbloquear" 
    runat="server" Text="Desbloquear" Visible="False" onclick="btnDesbloquear_Click" />
                <asp:Label ID="lblToolBar" runat="server" CssClass="erro"></asp:Label>
                <hr />
                <img alt="" border="0" height="15" src="../Images/spacer.gif" 
    width="5" style="margin-left: 0px" />&nbsp;<br />
                <div id="botoes">
                    <asp:Panel ID="pnlPsq" runat="server">
                        <b>Pesquisar Usuário</b><table>
                            <tbody>
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="rblTipAco" runat="server" CssClass="azulescuropequeno" 
                                            RepeatDirection="Horizontal" Height="25px">
                                            <asp:ListItem Value="UserName">Login</asp:ListItem>
                                            <asp:ListItem Value="Usr_Nme" Selected="True">Nome</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="rqlTipoPesquisa" runat="server" ControlToValidate="rblTipAco"
                                            ErrorMessage="* Selecione um tipo de pesquisa acima"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtPsq" runat="server" CssClass="input2" Width="130px"></asp:TextBox>
                                        &nbsp; &nbsp;&nbsp;
                                        <asp:Button ID="btnSearch" runat="server" CssClass="input7" OnClick="btnSearch_Click"
                                            Text="Pesquisar" Width="100px" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </asp:Panel>
                    <img alt=" " border="0" height="15" src="../Images/spacer.gif" 
                        style="width: 4px" />
                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    <asp:GridView ID="grd" runat="server" AllowPaging="True" AllowSorting="True" 
                        AutoGenerateColumns="False" DataSourceID="dts" Font-Size="X-Small"
                        OnPageIndexChanging="grd_PageIndexChanging"
                        PageSize="15" Width="100%" DataKeyNames="IdUsr,IdPpl" SkinID="gridCRUD" 
                        style="margin-right: 0px" 
                        onselectedindexchanged="grd_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="UserName" HeaderText="Login" SortExpression="UserName" />
                            <asp:BoundField DataField="Usr_Nme" HeaderText="Nome do Usu&#225;rio" SortExpression="Usr_Nme" />
                            <asp:BoundField DataField="Ppl_Dsc" HeaderText="Papel" SortExpression="Ppl_Dsc" />
                            <asp:BoundField DataField="Email" HeaderText="e-mail" SortExpression="Email" />
                            <asp:TemplateField HeaderText="Senha Reiniciada?" SortExpression="Usr_AltSnh">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Usr_AltSnh") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkAltSnh" runat="server" Checked='<%# Bind("Usr_AltSnh") %>'
                                        Enabled="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Bloqueado?" SortExpression="IsLockedOut">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("IsLockedOut") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkIsLocked" runat="server" Checked='<%# Bind("IsLockedOut") %>'
                                        Enabled="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Aprovado?" SortExpression="IsApproved">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("IsApproved") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkIsApproved" runat="server" Checked='<%# Bind("IsApproved") %>'
                                        Enabled="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Comment" HeaderText="Coment&#225;rios" SortExpression="Comment" />
                            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="dts" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>"
                        DeleteCommand="stSgn_Usr" InsertCommand="stSgn_AltSnh"
                        InsertCommandType="StoredProcedure" SelectCommand="ssSgn_Usr" SelectCommandType="StoredProcedure"
                        UpdateCommand="stSgn_Usr" UpdateCommandType="StoredProcedure" DeleteCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter Name="UserName" Type="String" />
                            <asp:Parameter Name="Usr_Nme" Type="String" />
                            <asp:Parameter Name="PplDsc" Type="String" />
                            <asp:Parameter Name="GrpDsc" Type="String" />
                            <asp:Parameter Name="PplOpe" Type="Boolean" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter DefaultValue="U" Name="Tip_Aco" Type="String" />
                            <asp:Parameter Name="IdUsr" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlPpl" Name="Usr_IdPpl" PropertyName="SelectedValue"
                                Type="Int16" />
                            <asp:ControlParameter ControlID="txtUsr_Nme" Name="Usr_Nme" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="chkIsLockedOut" Name="IsLockedOut" PropertyName="Checked"
                                Type="Boolean" />
                            <asp:ControlParameter ControlID="chkIsApproved" Name="IsApproved" 
                                PropertyName="Checked" Type="Boolean" />
                            <asp:ControlParameter ControlID="txtComment" Name="Comment" PropertyName="Text" Type="String" />
                            <asp:Parameter DefaultValue="" Direction="InputOutput" Name="Out_Err" Type="Boolean" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                            <asp:Parameter Name="IdUsr" Type="Int32" />
                            <asp:Parameter DefaultValue="" Name="Usr_AltSnh" Type="Boolean" />
                        </InsertParameters>
                        <DeleteParameters>
                            <asp:Parameter DefaultValue="D" Name="Tip_Aco" Type="String" />
                            <asp:Parameter DefaultValue="" Name="IdUsr" Type="Int32" />
                            <asp:Parameter Direction="InputOutput" Name="Out_Err" Type="Boolean" />
                        </DeleteParameters>
                    </asp:SqlDataSource>
                </div>
&nbsp; &nbsp;</p>
</asp:Content>
