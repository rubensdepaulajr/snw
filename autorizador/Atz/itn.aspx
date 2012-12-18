<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="itn.aspx.cs" Theme="Standard" Inherits="Atz_itn" Title="Internação" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px" bgcolor="#f4f4f4">
                <table cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                    <tbody>
                        <tr>
                            <td style="width: 9px" align="left"><img height="37" alt="" src="../Images/tit_left.gif" width="9" /></td>
                            <td bgColor="#f4f4f4"><h2>INTERNAÇÃO</h2></td>
                            <td style="width: 9px" align="left"><img height="37" alt="" src="../Images/tit_right.gif" width="9" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 40px">&nbsp;</div>
                <table cellspacing="0" cellpadding="0" border="0">
                    <tbody>
                        <tr>
                            <td colspan="3" style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px">
                                <asp:Image id="ImgErro" runat="server" Visible="False" ImageAlign="AbsMiddle" ImageUrl="~/Images/ico_alert.gif" Height="25px" Width="25px"></asp:Image> 
                                <asp:Label id="lblErro" runat="server" CssClass="erro"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3"></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 0px; padding-left: 40px; padding-bottom: 0px; padding-top: 0px" valign="middle" colspan="3" height="35">
                                <strong>DADOS DO PACIENTE</strong></td>
                        </tr>
                        <tr>
                            <td align="right" width="150">Beneficiário:</td>
                            <td style="width: 5px"></td>
                            <td style="width: 623px" align="left">
                                <span class="cinza-escuro"><asp:Label id="lblBnf" runat="server"></asp:Label></span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" height="10"></td>
                        </tr>
                        <tr>
                            <td style="height: 14px" align="right" width="150">Idade:</td>
                            <td style="width: 5px; height: 14px"></td>
                            <td style="height: 14px" align="left">
                                <span class="cinza-claro"><asp:Label id="lblBnf_Idd" runat="server"></asp:Label></span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" height="10"></td>
                        </tr>
                        <tr>
                            <td style="height: 14px" align="right" width="150">Última Consulta:</td>
                            <td style="width: 5px; height: 14px"></td>
                            <td style="width: 623px; height: 14px" align="left">
                                <span class="cinza-claro"><asp:Label id="lblUlt_Con" runat="server"></asp:Label></span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" height="10"></td>
                        </tr>
                        <tr>
                            <td align="right" width="150">CID - Última Consulta:</td>
                            <td style="width: 5px"></td>
                            <td style="width: 623px" align="left">
                                <span class="cinza-claro"><asp:Label id="lblUlt_ConCid" runat="server"></asp:Label></span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3"><br /></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 0px; padding-left: 40px; padding-bottom: 0px; padding-top: 0px" valign="middle" colspan="3" height="35">
                                <strong>ÚLTIMOS EXAMES SOLICITADOS</strong></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 0px; padding-left: 60px; padding-bottom: 0px; padding-top: 0px" colspan="3">
                                <asp:GridView id="grd" runat="server" DataSourceID="dts" ShowHeader="False" AutoGenerateColumns="False" GridLines="None" 
                                        BorderStyle="None" AllowPaging="True" ondatabound="grd_DataBound" OnRowCreated="gvHover_RowCreated">
                                    <PagerTemplate>
                                        <div height="20">
                                            <asp:ImageButton ID="ImageButton1" runat="server"
                                                    ImageUrl="~/Images/seta1_1_on.gif" CommandArgument="First" oncommand="Paginategrd" />&#160;&nbsp;
                                            <asp:ImageButton ID="ImageButton2" runat="server"
                                                    ImageUrl="~/Images/seta1_2_on.gif"  CommandArgument="Prev" oncommand="Paginategrd" />&#160;Página 
                                            <asp:DropDownList ID="ddlPages" runat="server" CssClass="campo"
                                                    AutoPostBack="True" onselectedindexchanged="ddlPages_SelectedIndexChanged">
                                            </asp:DropDownList>&nbsp;de 
                                            <asp:Label ID="lblPageCount" runat="server"></asp:Label> &nbsp;
                                            <asp:ImageButton ID="ImageButton3" runat="server"
                                                    ImageUrl="~/Images/seta2_1_on.gif" BackColor="White" CommandArgument="Next" oncommand="Paginategrd" />&#160;&nbsp;
                                            <asp:ImageButton ID="ImageButton4" runat="server"
                                                    ImageUrl="~/Images/seta2_2_on.gif"  CommandArgument="Last" oncommand="Paginategrd" />
                                        </div>
                                    </PagerTemplate>
                                    <Columns>
                                        <asp:BoundField DataField="Spd_Dat" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Spd_Dat"
                                                            SortExpression="Spd_Dat" />
                                        <asp:BoundField DataField="Pdm_Cod" HeaderText="Pdm_Cod" SortExpression="Pdm_Cod" />
                                        <asp:BoundField DataField="Pdm_Dsc" HeaderText="Pdm_Dsc" SortExpression="Pdm_Dsc" />
                                    </Columns>
                                </asp:GridView> 
                                <asp:SqlDataSource id="dts" runat="server" SelectCommandType="StoredProcedure" SelectCommand="ssAtz_FhaPciExa" 
                                        ConnectionString="<%$ ConnectionStrings:AppConnectionString %>">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="IdBnf" QueryStringField="Bnf" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource> 
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" colspan="3" height="35"><br /></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 0px; padding-left: 40px; padding-bottom: 0px; padding-top: 0px" valign="top" colspan="3" height="35">
                                <asp:ImageButton id="btnPgaIni" onclick="btnPgaIni_Click" runat="server" ImageUrl="~/Images/bt_home.gif"></asp:ImageButton>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 0px; padding-left: 40px; padding-bottom: 0px; padding-top: 0px" valign="middle" colspan="3" height="35">
                                <strong>OPÇÕES</strong>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td style="padding-right: 0px; padding-left: 40px; padding-bottom: 0px; padding-top: 0px">
                                                <asp:ImageButton id="btnExeCon" onclick="btnExeCon_Click" runat="server" ImageUrl="~/Images/bt_executar_consulta.gif" 
                                                    border="0" alt="" height="39" width="198"></asp:ImageButton> 
                                            <%--</td>
                                            <td>--%>
                                                <asp:ImageButton id="btnSolSdt" onclick="btnSolSdt_Click" runat="server" ImageUrl="~/Images/bt_solicitar_sadt.gif" 
                                                    border="0" alt="" height="39" width="198"></asp:ImageButton> 
                                            <%--</td>
                                            <td>--%>
                                                <asp:ImageButton id="btnExeSdt" runat="server" ImageUrl="~/Images/bt_executar_sadt.gif" 
                                                    border="0" alt="" height="39" width="198" OnClick="btnExeSdt_Click"></asp:ImageButton> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 0px; padding-left: 40px; padding-bottom: 0px; padding-top: 0px">
                                                <asp:ImageButton id="btnSolItn" runat="server" Visible="False" 
                                                     ImageUrl="~/Images/bt_solicitar_internacao.gif" border="0" alt="" height="39" 
                                                     width="198" onclick="btnSolItn_Click"></asp:ImageButton>
                                            <%--</td>
                                            <td>--%>
                                                <asp:ImageButton id="btnAtdDmc" runat="server" Visible="False" ImageUrl="~/Images/bt_atendimento-domiciliar.gif" 
                                                    border="0" alt="" height="39" width="198"></asp:ImageButton> 
                                            <%--</td>
                                            <td>--%>
                                                <asp:ImageButton id="btnMedPre" runat="server" Visible="False" ImageUrl="~/Images/bt_medicina-preventiva.gif"
                                                    border="0" alt="" height="39" width="198"></asp:ImageButton> 
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <asp:HiddenField id="hdfIdGia" runat="server"></asp:HiddenField> 
                                <asp:HiddenField id="hdfIdBnf" runat="server"></asp:HiddenField> 
                            </td>
                        </tr>
                    </tbody>
                </table>
            <div>
            </DIV>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

