<%@ Page Title="" Language="C#" MasterPageFile="~/sgn.master" AutoEventWireup="true" 
Inherits="br.com.totaltiss.Gestor.Web.App.Sgn.SgnGrpMsg" Codebehind="SgnGrpMsg.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <%--<div id="divTopo" class="title">--%>
    <h3>
        Segurança - Permissões por grupo para autorização de mensagem de negativa
    </h3>
    <%--</div>--%>

    <table width="100%">
        <tbody>
            <tr>
                <td colspan="3">                
                    <br />
                    <asp:Button ID="Button1" runat="server" CssClass ="button" Text="Incluir" />
                    <asp:Button ID="Button2" runat="server" CssClass ="button" Text="Alterar" />
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="3">                
                    <asp:ListView ID="lvwMensagem" runat="server" DataKeyNames="IdMsg" 
                        DataSourceID="edsMensagem" EnablePersistedSelection="True" 
                        onselectedindexchanged="lvwMensagem_SelectedIndexChanged" 
                        EnableTheming="True" >
                        <AlternatingItemTemplate>
                            <tr style="background-color: #FFFFFF;color: #284775;">
                                <td>
                                    <asp:Label ID="IdMsgLabel" runat="server" Text='<%# Eval("IdMsg") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="Msg_DscLabel" runat="server" Text='<%# Eval("Msg_Dsc") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="Msg_DscAtzLabel" runat="server" 
                                        Text='<%# Eval("Msg_DscAtz") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="Msg_GrpLabel" runat="server" Text='<%# Eval("Msg_Grp") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="Msg_LocLabel" runat="server" Text='<%# Eval("Msg_Loc") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="Sgn_GrpMsgLabel" runat="server" 
                                        Text='<%# Eval("Sgn_GrpMsg") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="background-color: #999999;">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                        Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                        Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ID="IdMsgLabel1" runat="server" Text='<%# Eval("IdMsg") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="Msg_DscTextBox" runat="server" Text='<%# Bind("Msg_Dsc") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="Msg_DscAtzTextBox" runat="server" 
                                        Text='<%# Bind("Msg_DscAtz") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="Msg_GrpTextBox" runat="server" Text='<%# Bind("Msg_Grp") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="Msg_LocTextBox" runat="server" Text='<%# Bind("Msg_Loc") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="Sgn_GrpMsgTextBox" runat="server" 
                                        Text='<%# Bind("Sgn_GrpMsg") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" 
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                <tr>
                                    <td>
                                        No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                                        Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                        Text="Clear" />
                                </td>
                                <td>
                                    <asp:TextBox ID="IdMsgTextBox" runat="server" Text='<%# Bind("IdMsg") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="Msg_DscTextBox" runat="server" Text='<%# Bind("Msg_Dsc") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="Msg_DscAtzTextBox" runat="server" 
                                        Text='<%# Bind("Msg_DscAtz") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="Msg_GrpTextBox" runat="server" Text='<%# Bind("Msg_Grp") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="Msg_LocTextBox" runat="server" Text='<%# Bind("Msg_Loc") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="Sgn_GrpMsgTextBox" runat="server" 
                                        Text='<%# Bind("Sgn_GrpMsg") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="background-color: #E0FFFF;color: #333333;">
                                <td>
                                    <asp:Label ID="IdMsgLabel" runat="server" Text='<%# Eval("IdMsg") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="Msg_DscLabel" runat="server" Text='<%# Eval("Msg_Dsc") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="Msg_DscAtzLabel" runat="server" 
                                        Text='<%# Eval("Msg_DscAtz") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="Msg_GrpLabel" runat="server" Text='<%# Eval("Msg_Grp") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="Msg_LocLabel" runat="server" Text='<%# Eval("Msg_Loc") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="Sgn_GrpMsgLabel" runat="server" 
                                        Text='<%# Eval("Sgn_GrpMsg") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                            style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                                <th runat="server">
                                                    IdMsg</th>
                                                <th runat="server">
                                                    Msg_Dsc</th>
                                                <th runat="server">
                                                    Msg_DscAtz</th>
                                                <th runat="server">
                                                    Msg_Grp</th>
                                                <th runat="server">
                                                    Msg_Loc</th>
                                                <th runat="server">
                                                    Sgn_GrpMsg</th>
                                            </tr>
                                            <tr ID="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" 
                                        style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                        <asp:DataPager ID="DataPager1" runat="server">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                                    ShowLastPageButton="True" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                                <td>
                                    <asp:Label ID="IdMsgLabel" runat="server" Text='<%# Eval("IdMsg") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="Msg_DscLabel" runat="server" Text='<%# Eval("Msg_Dsc") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="Msg_DscAtzLabel" runat="server" 
                                        Text='<%# Eval("Msg_DscAtz") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="Msg_GrpLabel" runat="server" Text='<%# Eval("Msg_Grp") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="Msg_LocLabel" runat="server" Text='<%# Eval("Msg_Loc") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="Sgn_GrpMsgLabel" runat="server" 
                                        Text='<%# Eval("Sgn_GrpMsg") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:EntityDataSource ID="edsMensagem" runat="server" 
                        ConnectionString="name=AppEntities" DefaultContainerName="AppEntities" 
                        EnableFlattening="False" EntitySetName="Ans_Msg" Where="it.Msg_Loc IS NOT NULL">
                    </asp:EntityDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 45%">
                    <h3>Grupos sem permissão para auditar a mensagem selecionada</h3></td>
                <td style="width: 10%">
                    <asp:Button ID="btnAdicionar" runat="server" Text="Adicionar" CssClass="button" 
                        onclick="btnAdicionar_Click" />
                </td>                
                <td style="width: 45%">
                    <h3>Todos os Grupos</h3>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:ListBox ID="lbxNegarAuditoria" runat="server" Width="100%" 
                        DataTextField="Description" DataValueField="RoleId"></asp:ListBox>
                </td>
                <td class="style2">
                </td>
                <td class="style1">
                    <asp:ListBox ID="lbxTodosGrupos" runat="server" Width="100%" 
                        DataValueField="RoleId" DataTextField="Description"></asp:ListBox>
                </td>
            </tr>
            <tr>
                <td style="width: 45%">
                </td>
                <td style="width: 10%">
                    <asp:Button ID="btnRemover" runat="server" Text="Remover" CssClass="button" 
                        onclick="btnRemover_Click" />
                </td>
                <td style="width: 45%">
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    
                </td>
            </tr>
            <tr>
                <td colspan="3">   
                   
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>

