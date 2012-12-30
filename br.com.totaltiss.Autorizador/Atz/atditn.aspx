<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Inherits="Atz_atditn" Theme="Standard" Title="Página Inicial de Atendente - Solicitações Autorizadas" Codebehind="atditn.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolKit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server"> 

    <div style="padding: 0px 0 0 10px;">

        <asp:UpdatePanel id="updPnlTb1" runat="server" UpdateMode="Conditional">
            <ContentTemplate> 
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tbody>
                        <tr>
                            <td style="width: 9px" align="left"><img height="37" alt="" src="../Images/tit_left.gif" width="9" /></td>
                            <td bgColor="#f4f4f4"><h2>Internação</h2></td>
                            <td style="width: 9px" align="left"><img height="37" alt="" src="../Images/tit_right.gif" width="9" /></td>
                        </tr>
                    </tbody>
                </table>               
                <br />
                <div style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px">
                    <asp:Button runat="server" ID="Button1" Text="Executar Internação"/>
                    <asp:Button runat="server" ID="Button2" Text="Solicitar Prorrogação"/>
                    <asp:Button runat="server" ID="Button3" Text="Executar Prorrogação"/>
                    <asp:Button runat="server" ID="Button4" Text="Executar Alta"/>
                </div>
                <br />
                <div style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px">
                    <asp:GridView id="grdItn" runat="server"
                        DataSourceID="dtsSolAtz" AllowPaging="True"
                        AutoGenerateColumns="False" Width="100%" ondatabound="grd_DataBound" 
                        AllowSorting="True">
                        <Columns>
                            <asp:BoundField DataField="Bnf_Mtr" HeaderText="Matr&#237;cula" SortExpression="Bnf_Mtr"></asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="IdGia" DataNavigateUrlFormatString="solcondet.aspx?Gia={0}" DataTextField="Bnf_Nme" HeaderText="Benefici&#225;rio" SortExpression="Bnf_Nme"></asp:HyperLinkField>
                            <asp:BoundField DataField="Esp_Dsc" HeaderText="Especialidade" SortExpression="Esp_Dsc"></asp:BoundField>
                            <asp:BoundField DataField="Gia_TipDsc" HeaderText="Tipo" ReadOnly="True" SortExpression="Gia_TipDsc"></asp:BoundField>
                        </Columns>
                        <PagerTemplate>
                            <div height="20" align="center">
                                <asp:ImageButton ID="ImageButton1" runat="server"
                                            ImageUrl="~/Images/seta1_1_on.gif" CommandArgument="First" oncommand="paginateGrdItn" />&#160;&nbsp;
                                <asp:ImageButton ID="ImageButton2" runat="server"
                                        ImageUrl="~/Images/seta1_2_on.gif"  CommandArgument="Prev" oncommand="paginateGrdItn" />&#160;Página 
                                <asp:DropDownList ID="ddlGridPages" runat="server" CssClass="campo"
                                            AutoPostBack="True" onselectedindexchanged="ddlGrdItnPages_SelectedIndexChanged">
                                </asp:DropDownList>&nbsp;de
                                <asp:Label ID="lblPageCount" runat="server"></asp:Label> 
                                <asp:ImageButton ID="ImageButton3" runat="server"
                                            ImageUrl="~/Images/seta2_1_on.gif"  CommandArgument="Next" oncommand="paginateGrdItn" />&#160;&nbsp;
                                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Images/seta2_2_on.gif"  CommandArgument="Last" oncommand="paginateGrdItn" />
                            </div>
                        </PagerTemplate>
                    </asp:GridView>
                </div>
                <asp:SqlDataSource id="dtsSolAtz" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                    SelectCommand="ssAtz_GiaCon" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False">
                    <SelectParameters>
                        <asp:ProfileParameter PropertyName="Local.IdCtt" DefaultValue="" Name="IdCtt" Type="Int64"></asp:ProfileParameter>
                        <asp:ProfileParameter PropertyName="Local.Cte_SeqEnd" DefaultValue="" Name="Cte_SeqEnd" Type="Byte"></asp:ProfileParameter>
                        <asp:Parameter Name="IdPrf" Type="Int32"></asp:Parameter>
                        <asp:Parameter DefaultValue="ATZ" Name="Gia_Sit" Type="String"></asp:Parameter>
                    </SelectParameters>
                </asp:SqlDataSource>                             
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
</asp:Content>