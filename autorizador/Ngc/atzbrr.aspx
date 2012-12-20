<%@ Page Title="" Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="atzbrr.aspx.cs" Inherits="Cadastros_atzbrr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
        <div id="Titulo">
            <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="left" style="width: 8px">
                        <img alt="" height="37" src="../images/tit_left.gif" width="9" /></td>
                    <td bgcolor="#f4f4f4">
                        <h2>
                            Bairros</h2>
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
            <asp:Button ID="btnNew" runat="server" Text="Novo" 
                CssClass="button" onclick="btnNew_Click" />
            <asp:Button ID="btnEdit" runat="server" 
                Text="Alterar" CssClass="button" onclick="btnEdit_Click" />
            <asp:Button ID="btnDel" runat="server" Text="Excluir" 
                CssClass="button" Enabled="False" onclick="btnDel_Click" />
            <asp:Label id="lblError" runat="server" Text="* Nenhum item selecionado" 
                Visible="False" Width="271px" ForeColor="Red" CssClass="erro"></asp:Label> 
        </div>
        <hr />
        <img height="7" alt="" src="../Images/spacer.gif" width="5" border="0" />      
        <asp:Panel ID="pnlPsq" runat="server">
            <br />
            <table class="tablesearch" style="width:100%">
                <tr>
                    <td class="tscaption" style="font-weight: bold; height: 20px;">
                        Pesquisar Bairros</td>
                </tr>                
                <tr>
                    <td class="tscaption" style="height: 30px">
                        <asp:RadioButtonList ID="rblTipAco" runat="server" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem Value="IdBrr">Código</asp:ListItem>
                            <asp:ListItem Value="Brr_Nme">Nome</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="* Selecione um tipo de pesquisa acima" 
                            ControlToValidate="rblTipAco" CssClass="vermelhonormal"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="tscaption">
                        <asp:TextBox ID="txtPsq" runat="server" CssClass="input2"></asp:TextBox>
                        &nbsp;<asp:Button ID="btnSearch" runat="server" CssClass="button" 
                            Text="Pesquisar" onclick="btnSearch_Click" />
                    </td>
                </tr>                
            </table>
            <br />
        </asp:Panel> 
        <asp:Panel ID="pnlInfoPrf" runat="server">
            <br />
            <table class="htmltable" style="width:100%;">
                <tr class="row">
                    <td class="caption" colspan="2" style="font-weight: bold">
                        Informações do Logradouro</td>
                </tr>
                <tr class="alternaterow">
                    <td class="caption" style="width: 103px">
                        Código:</td>
                    <td>
                        <asp:TextBox ID="txtIdBrr" runat="server" CssClass="input2"></asp:TextBox>
                    </td>
                </tr>
                <tr class="row">
                    <td class="caption" style="width: 103px">
                        Bairro:</td>
                    <td>
                        <asp:TextBox ID="txtBrr_Nme" runat="server" Width="400px" CssClass="input2"></asp:TextBox>
                    </td>
                </tr>
                <tr class="alternaterow">
                    <td class="caption" style="width: 103px">
                        Município:</td>
                    <td>
                        <asp:DropDownList ID="ddlMun_Nme" runat="server" CssClass="input2" 
                            DataSourceID="dtsMun" DataTextField="Mun_Nme" DataValueField="IdMun">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dtsMun" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                            SelectCommand="SELECT [IdMun], [Mun_Nme] FROM [Atz_Mun]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr class="row">
                     <td class="caption" style="width: 103px">
                        &nbsp;</td>
                    <td >
                        <asp:Button ID="btnSave" runat="server" CssClass="button" Text="Gravar" 
                            onclick="btnSave_Click" />
                        <asp:Button ID="btnCancel" runat="server" CssClass="button" Text="Cancelar" 
                            onclick="btnCancel_Click" />
                     </td>
                </tr>
            </table>
            <br />
            <asp:Label id="lblMsg" runat="server" CssClass="erro" 
                Text="* Campos obrigatórios em branco" Visible="False" Width="271px"></asp:Label>
        </asp:Panel>
        <asp:GridView ID="grd" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False"
            DataKeyNames="IdBrr" DataSourceID="dts" Width="100%" 
            onselectedindexchanged="grd_SelectedIndexChanged" 
        onpageindexchanged="grd_PageIndexChanged" PageSize="20" SkinID="gridCRUD">
            <Columns>
                <asp:BoundField DataField="IdBrr" HeaderText="ID" ReadOnly="True" 
                    SortExpression="IdBrr" InsertVisible="False" />
                <asp:BoundField DataField="Brr_Nme" HeaderText="Bairro" 
                    SortExpression="Brr_Nme"></asp:BoundField>
                <asp:BoundField DataField="mun_nme" HeaderText="Município" 
                    SortExpression="mun_nme" ReadOnly="True" />
                    <asp:CommandField ShowSelectButton="True" SelectText="selecionar" >
                <HeaderStyle Width="50px" />
                </asp:CommandField>
            </Columns>
        </asp:GridView>
                <asp:SqlDataSource ID="dts" runat="server" DeleteCommand="delete from atz_brr where idbrr = @idbrr"
                    UpdateCommandType="StoredProcedure" UpdateCommand="stAtz_Brr" SelectCommandType="StoredProcedure"
                    SelectCommand="ssAtz_Brr" InsertCommandType="StoredProcedure" InsertCommand="stAtz_Brr"
                    
        ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
        CancelSelectOnNullParameter="False">
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
</asp:Content>
