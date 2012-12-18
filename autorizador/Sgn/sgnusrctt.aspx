<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="sgnusrctt.aspx.cs" 
Inherits="Sgn_sgnusrctt" Title="Gerenciar Usuários de Contratados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
                <div id="Titulo">
                <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="left" style="width: 8px">
                            <img alt="" height="37" src="../images/tit_left.gif" width="9" /></td>
                        <td bgcolor="#f4f4f4">
                            <h2>
                                Cadastro de Usuários de Contratados</h2>
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
                <asp:Button ID="btnNew" runat="server" CssClass="input7" OnClick="btnNew_Click" 
                    Text="Novo" />
                <img alt=" " border="0" height="5" src="../Images/spacer.gif" width="5" />
                <asp:Button ID="btnEdit" runat="server" CssClass="input7" OnClick="btnEdit_Click"
                    Text="Alterar" />
    <img alt=" " border="0" height="5" src="../Images/spacer.gif" width="5" />
                <asp:Button ID="btnDel" runat="server" CssClass="input7" OnClick="btnDel_Click" Text="Excluir" />
    <img alt=" " border="0" height="5" src="../Images/spacer.gif" width="5" />
    <asp:Button ID="btnGrp" runat="server" CssClass="input7" OnClick="btnGrp_Click" Text="Grupos" />
    <img alt=" " border="0" height="5" src="../Images/spacer.gif" width="5" />
    <asp:Button ID="btnResetPwd" runat="server" CssClass="input7" OnClick="btnResetPwd_Click" Text="Reiniciar Senha" />
                <asp:Label ID="lblToolBar" runat="server" CssClass="erro"></asp:Label>
                <hr />
                <img alt="" border="0" height="15" src="../Images/spacer.gif" width="5" />&nbsp;<br />
                <div id="botoes">
                    <asp:Panel ID="pnlPsq" runat="server">
                        <b>Pesquisar Usuário</b><table>
                            <tbody>
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="rblTipAco" runat="server" CssClass="azulescuropequeno" RepeatDirection="Horizontal">
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
                    <img alt=" " border="0" height="15" src="../Images/spacer.gif" width="5" />
                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                    <br />
                    <asp:Panel ID="pnlInf" runat="server">
                        <div>
                            <b>Informações do usuário:</b><table>
                                <tbody>
                                    <tr>
                                        <td>
                                            Login:</td>
                                        <td>
                                            <asp:TextBox ID="txtUserName" runat="server" CssClass="input3"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 21px">
                                            Nome:</td>
                                        <td class="vermelhonormal" style="height: 21px">
                                            <asp:TextBox ID="txtUsr_Nme" runat="server" CssClass="input2" MaxLength="30" Width="400px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 26px">
                                            papel:</td>
                                        <td class="vermelhonormal" style="height: 26px">
                                            <asp:DropDownList ID="ddlPpl" runat="server" DataSourceID="dtsPpl" DataTextField="Ppl_Dsc"
                                                DataValueField="IdPpl" AppendDataBoundItems="True">
                                                <asp:ListItem Value="-1">Selecione</asp:ListItem>
                                            </asp:DropDownList><asp:SqlDataSource ID="dtsPpl" runat="server" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>"
                                                SelectCommand="SELECT IdPpl, Ppl_Dsc FROM dbo.Sgn_Ppl WHERE Ppl_Ope = 0 ORDER BY Ppl_Dsc"></asp:SqlDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 26px">
                                            e-mail:</td>
                                        <td class="vermelhonormal" style="height: 26px">
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="input2" Width="400px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Forçar troca de senha?</td>
                                        <td class="vermelhonormal">
                                            <asp:CheckBox ID="chkUsrAltSnh" runat="server" Enabled="False" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Bloqueado?</td>
                                        <td class="vermelhonormal">
                                            <asp:CheckBox ID="chkIsLockedOut" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Aprovado?</td>
                                        <td class="vermelhonormal">
                                            <asp:CheckBox ID="chkIsApproved" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 26px">
                                            Comentários:</td>
                                        <td class="vermelhonormal" style="height: 26px">
                                            <asp:TextBox ID="txtComment" runat="server" CssClass="input2" Width="400px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 26px">
                                            &nbsp;</td>
                                        <td class="erro" style="height: 26px">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="height: 21px">
                                            <asp:Button ID="btnSave" runat="server" CssClass="input7" 
                                                OnClick="btnSave_Click" Text="Gravar" />
                                            &nbsp;
                                            <asp:Button ID="btnCancel" runat="server" CssClass="input7" 
                                                OnClick="btnCancel_Click" Text="Cancelar" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <asp:Label ID="lblMsg" runat="server" CssClass="erro" Text="* Campos obrigatórios em branco"
                            Visible="False" Width="271px"></asp:Label></asp:Panel>
                    <br />
                    <asp:GridView ID="grd" runat="server" AllowPaging="True" AllowSorting="True" 
                        AutoGenerateColumns="False" DataSourceID="dts" Font-Size="X-Small"
                        OnPageIndexChanging="grd_PageIndexChanging" OnSelectedIndexChanged="grd_SelectedIndexChanged"
                        PageSize="15" Width="100%" DataKeyNames="IdUsr,IdPpl" SkinID="gridCRUD" 
                        style="margin-right: 0px">
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
                    <asp:SqlDataSource ID="dts" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>"
                        DeleteCommand="stSgn_Usr" InsertCommand="stSgn_AltSnh"
                        InsertCommandType="StoredProcedure" SelectCommand="ssSgn_Usr" SelectCommandType="StoredProcedure"
                        UpdateCommand="stSgn_Usr" UpdateCommandType="StoredProcedure" DeleteCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter Name="UserName" Type="String" DefaultValue="" />
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
        <asp:Panel ID="pnlGrp" runat="server">
        <br />
        <asp:Label ID="ActionStatus" runat="server" CssClass="erro"></asp:Label>
        <br />
        <asp:Repeater ID="UsersRoleList" runat="server">
            <ItemTemplate>
                <asp:CheckBox ID="RoleCheckBox" runat="server" AutoPostBack="true" OnCheckedChanged="RoleCheckBox_CheckChanged"
                    Text='<%# Container.DataItem %>' />
                <br />
            </ItemTemplate>
        </asp:Repeater>
            <br />
            <asp:Button ID="btnCancelGrp" runat="server" CssClass="input7" OnClick="btnCancelGrp_Click"
                                                Text="Ocultar Grupos" /></asp:Panel>
        &nbsp; &nbsp;&nbsp;</p>
</asp:Content>
