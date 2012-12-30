<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Theme="Standard" Inherits="Atz_fhapci" Title="Ficha do Paciente" Codebehind="fhapci.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px" bgcolor="#f4f4f4">
                <table cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                    <tbody>
                        <tr>
                            <td style="width: 9px" align="left"><img height="37" alt="" src="../Images/tit_left.gif" width="9" /></td>
                            <td bgColor="#f4f4f4"><h2>FICHA DO PACIENTE</h2></td>
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
                            <td valign="top" align="right" width="150" height="10">Matrícula:</td>
                            <td style="width: 5px"></td>
                            <td style="width: 623px" align="left">
                                <asp:TextBox id="txtPsqBnf" runat="server" CssClass="campo" onkeypress="mascara(this,sms)" MaxLength="15"></asp:TextBox> &nbsp;
                                <asp:ImageButton id="imgBtnAdicionar" onclick="imgBtnAdicionar_Click" runat="server" ImageUrl="~/Images/bt_adicionar.gif"></asp:ImageButton> 
                                <asp:Button id="btnPsqBnf" onclick="btnPsq_Click" runat="server" CssClass="linkbutton" Font-Underline="False" Text="Buscar Beneficiário"></asp:Button> 
                                <asp:Image id="Image1" runat="server" ImageUrl="~/Images/ico_ajuda_campos.gif"></asp:Image> 
                            </td>
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
                            <td style="height: 14px" align="left" colspan="2">
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
            <%-- inicio do bloco do popup --%>
            <ajaxToolkit:ModalPopupExtender id="ModalPopupExtender1" runat="server" TargetControlID="btnPsqBnf" PopupControlID="ModalPanel" DropShadow="true" BackgroundCssClass="modalBackground">
            </ajaxToolkit:ModalPopupExtender> 
                <asp:Panel id="ModalPanel" runat="server" CssClass="modalPopup" Width="830px" Direction="LeftToRight" BackColor="White">
                    <table style="border-right: #ce5c09 thin double; border-top: #ce5c09 thin double; border-left: #ce5c09 thin double; width: 100%; border-bottom: #ce5c09 thin double; background-color: #ffffff">
                        <tbody>
                            <tr>
                                <td style="width: 937px; height: 45px">
                                    <table cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                                        <tbody>
                                            <tr>
                                                <td style="width: 9px; height: 37px" align="left">
                                                    <img height="37" alt="" src="../Images/tit_left.gif" width="9" />
                                                </td>
                                                <td style="height: 37px" bgColor="#f4f4f4">
                                                    <h2>Busca de BENEFICIÁRIO</h2></td>
                                                <td style="width: 9px; height: 37px" align="left">
                                                    <img height="37" alt="" src="../Images/tit_right.gif" width="9" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 937px; height: 24px"></td>
                            </tr>
                            <tr>
                                <td style="padding-right: 10px; padding-left: 0px; padding-bottom: 0px; width: 937px; padding-top: 0px; height: 47px" valign="middle" align="center">
                                    <table cellspacing="0" cellpadding="0" border="0">
                                        <tbody>
                                            <tr>
                                                <td style="height: 22px" align="right">Nome:&nbsp;</td>
                                                <td style="width: 140px; height: 22px" align="right">
                                                    <asp:TextBox id="txtBnf_NmePop" runat="server" CssClass="campo" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="height: 22px" valign="top" align="left" width="78"></td>
                                                <td style="width: 56px; height: 22px" align="right">Matrícula:&nbsp;</td>
                                                <td style="height: 22px" align="right" width="140">
                                                    <asp:TextBox id="txtBnf_MtrPop" runat="server" Width="140px" onkeypress="mascara(this,sms)" MaxLength="15"></asp:TextBox></td>
                                                <td style="padding-right: 0px; padding-left: 5px; padding-bottom: 0px; padding-top: 0px; height: 22px" valign="top" align="left" width="78">
                                                    <asp:ImageButton id="btnBuscar" onclick="btnBuscar_Click" runat="server" ImageUrl="../Images/bt_buscar.gif"></asp:ImageButton></td>
                                            </tr>
                                        </tbody>
                                   </table>
                                   <br />
                               </td>
                          </tr>
                          <tr>
                                <td style="padding: 0px 4px 0px 4px;" valign="middle" align="center">
                                    <asp:GridView id="grdPop" runat="server" CssClass="grid-view" 
                                         DataSourceID="dtsPdm" Width="100%" AutoGenerateColumns="False" 
                                         AllowPaging="True" OnRowCreated="gvHover_RowCreated" 
                                         DataKeyNames="IdBnf,IdGia,Bnf_Mtr,Bnf_Nme" 
                                         OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
                                         OnDataBound="GridView1_DataBound">
                                        <Columns>
                                            <asp:BoundField DataField="Bnf_Mtr" HeaderText="C&#243;digo" 
                                                SortExpression="Bnf_Mtr" />
                                            <asp:ButtonField DataTextField="Bnf_Nme" HeaderText="Benefici&#225;rio" Text="Button" 
                                                CommandName="Select" SortExpression="Bnf_Nme" />
                                        </Columns>
                                        <PagerTemplate>
                                            <div height="20">
                                                <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument="First" ImageUrl="~/Images/seta1_1_on.gif"
                                                    OnCommand="PaginateGridView1" />
                                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CommandArgument="Prev" ImageUrl="~/Images/seta1_2_on.gif"
                                                    OnCommand="PaginateGridView1" />
                                                Página
                                                <asp:DropDownList ID="ddlPages" runat="server" AutoPostBack="True" CssClass="campo"
                                                    OnSelectedIndexChanged="ddlPagesGridView1_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                de
                                                <asp:Label ID="lblPageCount" runat="server"></asp:Label>
                                                &nbsp;<asp:ImageButton ID="ImageButton3" runat="server" CommandArgument="Next" ImageUrl="~/Images/seta2_1_on.gif"
                                                    OnCommand="PaginateGridView1" />
                                                &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CommandArgument="Last" ImageUrl="~/Images/seta2_2_on.gif"
                                                    OnCommand="PaginateGridView1" /></div>
                                        </PagerTemplate>
                                    </asp:GridView> 
                                    <asp:SqlDataSource id="dtsPdm" runat="server" SelectCommandType="StoredProcedure" SelectCommand="ssAtz_FhaPci" 
                                            ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" CancelSelectOnNullParameter="False">
                                        <SelectParameters>
                                            <asp:Parameter Name="Bnf_Mtr" Type="String" />
                                            <asp:Parameter Name="Bnf_Nme" Type="String" />
                                            <asp:Parameter Name="Gia_IdCtt" Type="Int64" />
                                            <asp:Parameter Name="Gia_SeqEnd" Type="Byte" />
                                            <asp:Parameter Name="Prf_IdUsr" Type="Int32" />
                                            <asp:Parameter Name="Gia_IdBnf" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource> 
                                    <asp:Label id="lblEmptyGrid" runat="server"></asp:Label><br />
                                    <h2 align="right">&nbsp;
                                        <asp:ImageButton id="btn_fechar" onclick="btn_fechar_Click" runat="server" ImageUrl="~/Images/bt_fecha.gif"></asp:ImageButton></h2>
                                </td>
                          </tr>
                    </tbody>
                    </table>
                </asp:Panel>
            </DIV>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

