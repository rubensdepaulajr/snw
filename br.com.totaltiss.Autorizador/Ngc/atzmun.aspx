<%@ Page Title="" Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Inherits="Cadastros_atzmun" Codebehind="atzmun.aspx.cs" %>
   
        
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
            <div id="Titulo">
                <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="left" style="width: 8px">
                            <img alt="" height="37" src="../images/tit_left.gif" width="9" /></td>
                        <td bgcolor="#f4f4f4">
                            <h2>
                                Municípios</h2>
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
    <div>
        <asp:Button ID="btnNew" runat="server" Text="Novo" CssClass="button" 
            onclick="btnNew_Click" />
        <asp:Button ID="btnEdit" runat="server" Text="Alterar" CssClass="button" 
            Width="60px" onclick="btnEdit_Click" />
        <asp:Button ID="btnDel" runat="server" Text="Excluir" CssClass="button" 
            onclick="btnDel_Click" />
        <asp:Label ID="lblError" runat="server" Text="* Nenhum item selecionado" Visible="False"
            Width="271px" ForeColor="Red" CssClass="erro"></asp:Label>
    </div>
    <hr />
    <img height="15" alt="" src="../Images/spacer.gif" width="5" border="0" />
    <asp:Panel ID="pnlPsq" runat="server">
        <br />
        <table style="width: 100%">
            <tr>
                <td style="font-weight: bold; height: 20px;">
                    Pesquisar Municípios
                </td>
            </tr>
            <tr>
                <td style="height: 30px">
                    <asp:RadioButtonList ID="rblTipAco" runat="server" RepeatDirection="Horizontal" 
                        Height="26px">
                        <asp:ListItem Value="IdMun">Código</asp:ListItem>
                        <asp:ListItem Value="Mun_Nme">Nome</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="rqlTipoPesquisa" runat="server" 
                        ErrorMessage="* Selecione um tipo de pesquisa acima" 
                        ControlToValidate="rblTipAco" CssClass="erro"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtPsq" runat="server" CssClass="input2"></asp:TextBox>
                    &nbsp;<asp:Button ID="btnSearch" runat="server" CssClass="button" 
                        Text="Pesquisar" onclick="btnSearch_Click" />
                </td>
            </tr>
        </table>
        <br />
    </asp:Panel>
    <asp:Panel ID="pnlEdit" runat="server" Enabled="False">
        <br />
        <table style="width: 100%;">
            <tr class="row">
                <td colspan="2" style="font-weight: bold">
                    Informações do Município
                </td>
            </tr>
            <tr class="alternaterow">
                <td class="caption" style="width: 103px">
                    ID:
                </td>
                <td>
                    <asp:TextBox ID="txtIdMun" runat="server" CssClass="input2" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr class="row">
                <td class="caption" style="width: 103px">
                    Código IBGE:
                </td>
                <td class="vermelhonormal">
                    <asp:TextBox ID="txtMun_Cod" runat="server" CssClass="input2" Width="90px"></asp:TextBox>*
                </td>
            </tr>
            <tr class="alternaterow">
                <td class="caption" style="width: 103px">
                    Nome:
                </td>
                <td class="vermelhonormal">
                    <asp:TextBox ID="txtMun_Nme" runat="server" CssClass="input2" Width="223px" MaxLength="30"></asp:TextBox>*
                </td>
            </tr>
            <tr class="row">
                <td class="caption" style="width: 103px">
                    Estado:
                </td>
                <td>
                    <asp:DropDownList ID="ddlMun_Est" runat="server" CssClass="input2">
                        <asp:ListItem>ES</asp:ListItem>
                        <asp:ListItem>MG</asp:ListItem>
                        <asp:ListItem>RJ</asp:ListItem>
                        <asp:ListItem>SP</asp:ListItem>
                        <asp:ListItem Value="AC"></asp:ListItem>
                        <asp:ListItem Value="AL"></asp:ListItem>
                        <asp:ListItem Value="AP"></asp:ListItem>
                        <asp:ListItem Value="AM"></asp:ListItem>
                        <asp:ListItem Value="BA"></asp:ListItem>
                        <asp:ListItem Value="CE"></asp:ListItem>
                        <asp:ListItem Value="DF"></asp:ListItem>
                        <asp:ListItem Value="GO"></asp:ListItem>
                        <asp:ListItem Value="MA"></asp:ListItem>
                        <asp:ListItem Value="MT"></asp:ListItem>
                        <asp:ListItem Value="MS"></asp:ListItem>
                        <asp:ListItem Value="PA"></asp:ListItem>
                        <asp:ListItem Value="PB"></asp:ListItem>
                        <asp:ListItem Value="PR"></asp:ListItem>
                        <asp:ListItem Value="PE"></asp:ListItem>
                        <asp:ListItem Value="PI"></asp:ListItem>
                        <asp:ListItem Value="RN"></asp:ListItem>
                        <asp:ListItem Value="RS"></asp:ListItem>
                        <asp:ListItem Value="RO"></asp:ListItem>
                        <asp:ListItem Value="RR"></asp:ListItem>
                        <asp:ListItem Value="SC"></asp:ListItem>
                        <asp:ListItem Value="SE"></asp:ListItem>
                        <asp:ListItem Value="TO"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr class="alternaterow">
                <td class="caption" style="width: 63px">
                    &nbsp;
                </td>
                <td>
                    <asp:Button ID="btnSave" runat="server" CssClass="button" Text="Gravar" 
                        onclick="btnSave_Click"/>
                    <asp:Button ID="btnCancel" runat="server" CssClass="button" Text="Cancelar" 
                        onclick="btnCancel_Click"/>
                </td>
            </tr>
        </table>
        <asp:Label ID="lblMsg" runat="server" Text="* Campos obrigatórios em branco" CssClass="erro"
            Visible="False" Width="271px"></asp:Label>
        <br />
    </asp:Panel>     
        <asp:GridView ID="grd" runat="server" AllowPaging="True" AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="IdMun" DataSourceID="dts"  
            onselectedindexchanged="grd_SelectedIndexChanged" Width="100%" 
            onpageindexchanged="grd_PageIndexChanged" 
            PageSize="20" CssClass="gridview">
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="IdMun" 
                        SortExpression="IdMun" />
                    <asp:BoundField HeaderText="Codigo" DataField="Mun_Cod" 
                        SortExpression="Mun_Cod" />
                    <asp:BoundField HeaderText="Nome" DataField="Mun_Nme" 
                        SortExpression="Mun_Nme" />
                    <asp:BoundField HeaderText="Estado" DataField="Mun_Est" 
                        SortExpression="Mun_Est" />
                    <asp:CommandField SelectText="selecionar" ShowSelectButton="True" >
                    <ItemStyle Width="50px" />
                    </asp:CommandField>
                </Columns>
                <HeaderStyle CssClass="headerstyle" />
                <PagerStyle CssClass="pagerstyle" />
                <SelectedRowStyle CssClass="row-select" />
        </asp:GridView>            
        <asp:SqlDataSource id="dts" runat="server" 
                CancelSelectOnNullParameter="False" 
                ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                InsertCommand="stAtz_Mun" InsertCommandType="StoredProcedure" 
                SelectCommand="ssAtz_Mun" SelectCommandType="StoredProcedure" 
                UpdateCommand="stAtz_Mun" UpdateCommandType="StoredProcedure" 
                DeleteCommand="delete from atz_mun where idmun = @idmun">
        <SelectParameters>
            <asp:Parameter Name="IdMun" Type="Int16" />
            <asp:Parameter Name="Mun_Nme" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtIdMun" Name="IdMun" PropertyName="Text" Type="Int16" />
            <asp:ControlParameter ControlID="txtMun_Cod" Name="Mun_Cod" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtMun_Nme" Name="Mun_Nme" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlMun_Est" Name="Mun_Est" PropertyName="SelectedValue"
                Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="IdMun" Type="Int16" />
            <asp:ControlParameter ControlID="txtMun_Cod" Name="Mun_Cod" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtMun_Nme" Name="Mun_Nme" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlMun_Est" Name="Mun_Est" PropertyName="SelectedValue"
                Type="String" />
        </InsertParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="txtIdMun" Name="idmun" PropertyName="Text" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>