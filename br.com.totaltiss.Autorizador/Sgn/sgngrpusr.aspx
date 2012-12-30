<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Inherits="Sgn_sgngrpusr" Title="Gerenciar Grupos de Usuários" Codebehind="sgngrpusr.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="Titulo">
                <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="left" style="width: 8px">
                            <img alt="" height="37" src="../images/tit_left.gif" width="9" /></td>
                        <td bgcolor="#f4f4f4">
                            <h2>
                                Gerenciar Grupos de Usuários</h2>
                        </td>
                        <td align="left" width="9">
                            <img alt="" height="37" src="../images/tit_right.gif" width="9" /></td>
                    </tr>
                </table>        
            </div>   
            <br />
            <br />
    <p align="center">
        <asp:Label ID="ActionStatus" runat="server" CssClass="Important"></asp:Label>
    </p>
       <asp:Panel ID="pnlPsq" runat="server">
            <b>Pesquisar Usuário</b><br />
            <table>
                <tbody>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="rblTipAco" runat="server" CssClass="azulescuropequeno" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0">Login</asp:ListItem>
                                <asp:ListItem Value="1">Nome do Usu&#225;rio</asp:ListItem>
                                <asp:ListItem Value="2">Contratado</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="rqlTipoPesquisa" runat="server" ControlToValidate="rblTipAco"
                                ErrorMessage="* Selecione um tipo de pesquisa acima"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtPsq" runat="server" CssClass="input2" Width="130px"></asp:TextBox>
                            &nbsp; &nbsp;&nbsp;
                            <asp:Button ID="btnSearch" runat="server" CssClass="input7"
                                Text="Pesquisar" Width="100px" /></td>
                    </tr>
                </tbody>
            </table>
        </asp:Panel>
        &nbsp;</p>
    <p>
        <asp:GridView ID="grd" runat="server" AllowPaging="True" AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="IdBrr" DataSourceID="dts" Font-Size="X-Small"
            PageSize="15" Width="100%" SkinID="gridCRUD">
            <Columns>
                <asp:BoundField DataField="IdBrr" HeaderText="ID" ReadOnly="True" SortExpression="IdBrr" />
                <asp:BoundField DataField="Brr_Nme" HeaderText="Bairro" SortExpression="Brr_Nme" />
                <asp:BoundField DataField="mun_nme" HeaderText="Munic&#237;pio" ReadOnly="True" SortExpression="mun_nme" />
                <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" >
                <ItemStyle Width="50px" />
                </asp:CommandField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="dts" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>"
            DeleteCommand="delete from atz_brr where idbrr = @idbrr" InsertCommand="stAtz_Brr"
            InsertCommandType="StoredProcedure" SelectCommand="ssAtz_Brr" SelectCommandType="StoredProcedure"
            UpdateCommand="stAtz_Brr" UpdateCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="IdBrr" Type="Int32" />
                <asp:Parameter Name="Brr_Nme" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="txtIdBrr" Name="IdBrr" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="ddlMun_Nme" Name="Brr_IdMun" PropertyName="SelectedValue"
                    Type="Int16" />
                <asp:ControlParameter ControlID="txtBrr_Nme" Name="Brr_Nme" PropertyName="Text" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="txtIdBrr" Name="IdBrr" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="ddlMun_Nme" Name="Brr_IdMun" PropertyName="SelectedValue"
                    Type="Int16" />
                <asp:ControlParameter ControlID="txtBrr_Nme" Name="Brr_Nme" PropertyName="Text" Type="String" />
            </InsertParameters>
            <DeleteParameters>
                <asp:ControlParameter ControlID="txtIdBrr" Name="idbrr" PropertyName="Text" />
            </DeleteParameters>
        </asp:SqlDataSource>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:RadioButtonList ID="rblTip" runat="server" AutoPostBack="True" CssClass="azulescuropequeno"
            OnSelectedIndexChanged="rblTipAco_SelectedIndexChanged" RepeatDirection="Horizontal">
            <asp:ListItem Selected="True" Value="1">Usu&#225;rios por Grupo</asp:ListItem>
            <asp:ListItem Value="0">Grupos por usu&#225;rio</asp:ListItem>
        </asp:RadioButtonList>&nbsp;</p>
    <p>
        <asp:Panel ID="pnlGrpUsr" runat="server" Height="130px" Width="530px">
            <strong>Selecione o grupo:</strong>
        <asp:DropDownList ID="RoleList" runat="server" AutoPostBack="true" 
            onselectedindexchanged="RoleList_SelectedIndexChanged">
        </asp:DropDownList>
            <br />
    <p>
        Usuário:
        <asp:TextBox ID="UserNameToAddToRole" runat="server"></asp:TextBox>
        <asp:Button ID="AddUserToRoleButton" runat="server" Text="Adicionar ao grupo" 
            onclick="AddUserToRoleButton_Click" CssClass="input7" Width="136px" />
    </p>
            <p>
        <asp:GridView ID="RolesUserList" runat="server" AutoGenerateColumns="False" 
            EmptyDataText="Nenhum usuário pertence a este grupo." 
            onrowdeleting="RolesUserList_RowDeleting" SkinID="gridCRUD">
            <Columns>
                <asp:CommandField DeleteText="Excluir" ShowDeleteButton="True" />
                <asp:TemplateField HeaderText="Usu&#225;rio">
                    <ItemTemplate>
                        <asp:Label runat="server" id="UserNameLabel" Text='<%# Container.DataItem %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
                &nbsp;</p>
        </asp:Panel>
        &nbsp;</p>
    <p>
        <asp:Panel ID="pnlUsrGrp" runat="server" Height="140px" Width="532px" Visible="False">
            Selecione o usuário:
        <asp:DropDownList ID="UserList" runat="server" AutoPostBack="True" 
            DataTextField="UserName" DataValueField="UserName" 
            onselectedindexchanged="UserList_SelectedIndexChanged">
        </asp:DropDownList>
            <br />
            <br />
        <asp:Repeater ID="UsersRoleList" runat="server">
            <ItemTemplate>
                <asp:CheckBox runat="server" ID="RoleCheckBox" AutoPostBack="true" Text='<%# Container.DataItem %>' OnCheckedChanged="RoleCheckBox_CheckChanged" />
                <br />
            </ItemTemplate>
        </asp:Repeater>
        </asp:Panel>
        &nbsp;</p>
    
    <h3>
        &nbsp;</h3>
</asp:Content>


