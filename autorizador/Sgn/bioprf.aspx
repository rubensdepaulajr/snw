<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="bioprf.aspx.cs" Inherits="Sgn_bioprf" Title="Biometria do Profissional" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:MultiView ID="mvw" runat="server" ActiveViewIndex="0">
        <asp:View ID="vw1" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
                        height: 37px">
                        <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td align="left" style="width: 8px">
                                    <img alt="" height="37" src="../images/tit_left.gif" width="9" /></td>
                                <td bgcolor="#f4f4f4">
                                    <h2>
                                        Biometria do Profissional</h2>
                                </td>
                                <td align="left" width="9">
                                    <img alt="" height="37" src="../images/tit_right.gif" width="9" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px;
                        padding-top: 20px" valign="top">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td colspan="3">                                    
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" height="25">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" height="25" align="center">
                                    <asp:RadioButtonList ID="rblTip" runat="server" RepeatDirection="Horizontal" 
                                        AutoPostBack="True" onselectedindexchanged="rblTip_SelectedIndexChanged" >
                                        <asp:ListItem Value="1" Text="Matrícula" Selected="True"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Nome"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="height: 10px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 22px" width="150">
                                    <asp:Label ID="lblPsq" runat="server" Text="Matrícula"></asp:Label>
                                </td>
                                <td style="height: 22px" width="5">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtPsq" runat="server" Width="200px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                    <asp:Image ID="imgMsg" runat="server" ImageUrl="../Images/ico_alert.gif" Visible="False" />
                                        &nbsp;<asp:Label ID="lblMsg" runat="server" class="erro"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 14px" width="150">
                                </td>
                                <td style="height: 14px" width="5">
                                </td>
                                <td align="left" style="width: 147px; height: 14px">
                                    <asp:ImageButton ID="btnOk" runat="server" ImageUrl="../Images/bt_buscar.gif" 
                                        OnClick="btnOk_Click" Height="19px" /></td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <asp:ImageButton ID="btnPgaIni0" runat="server" ImageUrl="~/Images/bt_home.gif" 
                            OnClick="btnPgaIni_Click" />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="vw2" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px;
                                    padding-top: 0px; height: 37px" width="9">
                                    <img alt="" height="37" src="../Images/tit_left.gif" width="9" /></td>
                                <td bgcolor="#f4f4f4" style="height: 37px">
                                    <h2>
                                        Biometria do Profissional - Resultado da Pesquisa</h2>
                                </td>
                                <td align="left" style="height: 37px" width="9">
                                    <img alt="" height="37" src="../Images/tit_right.gif" width="9" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="15">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
                        height: 47px">
                        <div align="left">
                        </div>
                        <asp:Panel ID="pnlBio" runat="server">
                            <asp:ImageButton ID="btnAtivar" runat="server" 
                                ImageUrl="~/Images/bt_ativar.gif" onclick="btnAtivar_Click" />
                            &nbsp;<asp:ImageButton ID="btnDesativar" runat="server" 
                                ImageUrl="~/Images/bt_desativar.jpg" onclick="btnDesativar_Click" />
                            &nbsp;<asp:Label ID="lblBio" runat="server" CssClass="erro"></asp:Label>
                        </asp:Panel>
                        <br />
                        <asp:GridView ID="grd" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="dts" OnDataBound="grd_DataBound"
                            Width="100%" AllowPaging="True" AllowSorting="True" 
                            DataKeyNames="Prf_Mtr,IdCtt,Cte_SeqEnd,IdPrf" 
                            onselectedindexchanged="grd_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="Prf_Mtr" HeaderText="Matrícula" 
                                    SortExpression="Prf_Mtr" />
                                <asp:BoundField DataField="Prf_Nme" HeaderText="Profissional" 
                                    SortExpression="Prf_Nme" />
                                <asp:BoundField DataField="IdCtt" HeaderText="Matrícula" 
                                    SortExpression="IdCtt" ReadOnly="True" />
                                <asp:BoundField DataField="Ctt_Nme" HeaderText="Contratado" 
                                    SortExpression="Ctt_Nme" >
                                </asp:BoundField>
                                <asp:BoundField DataField="Cte_SeqEnd" HeaderText="Seq. End." 
                                    SortExpression="Cte_SeqEnd" />
                                <asp:BoundField DataField="Lgr_Nme" HeaderText="Logradouro" 
                                    SortExpression="Lgr_Nme" />
                                <asp:CheckBoxField DataField="Prf_Bio" HeaderText="Biometria?" ReadOnly="True" 
                                    SortExpression="Prf_Bio" />
                                <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
                            </Columns>
                            <FooterStyle Font-Bold="True" ForeColor="White" />
                            <PagerTemplate>
                                <div align="center" height="20">
                                    <asp:ImageButton ID="ImageButton1SolPendentes" runat="server" CommandArgument="First"
                                        ImageUrl="~/Images/seta1_1_on.gif" OnCommand="paginateGrdEsp" />&nbsp;
                                    <asp:ImageButton ID="ImageButton2SolPendentes" runat="server" CommandArgument="Prev"
                                        ImageUrl="~/Images/seta1_2_on.gif" OnCommand="paginateGrdEsp" />
                                    Página
                                    <asp:DropDownList ID="ddlGridPages" runat="server" AutoPostBack="True" CssClass="campo"
                                        OnSelectedIndexChanged="ddlGrdEspPages_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    de
                                    <asp:Label ID="lblPageCount" runat="server"></asp:Label>&nbsp;
                                    <asp:ImageButton ID="ImageButton3SolPendentes" runat="server" CommandArgument="Next"
                                        ImageUrl="~/Images/seta2_1_on.gif" OnCommand="paginateGrdEsp" />&nbsp;
                                    <asp:ImageButton ID="ImageButton4SolPendentes" runat="server" CommandArgument="Last"
                                        ImageUrl="~/Images/seta2_2_on.gif" OnCommand="paginateGrdEsp" /></div>
                            </PagerTemplate>
                        </asp:GridView>
                        &nbsp; &nbsp;
                        <asp:SqlDataSource ID="dts" runat="server" CancelSelectOnNullParameter="False"
                                ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                SelectCommand="ssSgn_BioPrf" 
                            SelectCommandType="StoredProcedure" 
                            DeleteCommand="DELETE FROM dbo.Sgn_BioPrf WHERE Bpf_IdCtt = @IdCtt AND Bpf_SeqEnd = @SeqEnd AND Bpf_IdPrf = @IdPrf">
                            <SelectParameters>
                                <asp:Parameter Name="IdPrf" Type="Int32" />
                                <asp:Parameter Name="Prf_Mtr" Type="String"/>
                                <asp:Parameter Name="Prf_Nme" Type="String"/>
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="IdCtt" />
                                <asp:Parameter Name="SeqEnd" />
                                <asp:Parameter Name="IdPrf" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                        <div align="right">
                            &nbsp; <a href="pes.aspx"></a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
                        height: 47px">
                        <asp:ImageButton ID="btnPgaIni" runat="server" ImageUrl="~/Images/bt_home.gif" 
                            OnClick="btnPgaIni_Click" />
                        &nbsp;<asp:ImageButton ID="btnNewPsq" runat="server" 
                            ImageUrl="~/Images/bt_nova_pesquisa.gif" OnClick="btnNewPsq_Click" />
                    </td>
                </tr>
            </table>
        </asp:View>        
    </asp:MultiView>
    &nbsp;
    </asp:Content>

