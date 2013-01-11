<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Inherits="Atz_audres" 
Title="Auditoria" Theme="Standard" Codebehind="audres.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolKit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <%--    <asp:UpdatePanel ID="upnPage" runat="server"  UpdateMode="Conditional">
        <ContentTemplate>--%>
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tbody>
                    <tr>
                        <td>
                            <table cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                            <tbody>
                                <tr>
                                    <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 37px" align="left" width="9">
                                        <img height="37" alt="" src="../Images/tit_left.gif" width="9" />
                                    </td>
                                    <td style="height: 37px" bgColor="#f4f4f4"><h2>Auditoria - Resultado da Pesquisa</h2></td>
                                    <td style="height: 37px" align="left" width="9">
                                        <img height="37" alt="" src="../Images/tit_right.gif" width="9" />
                                    </td>
                                </tr>
                            </tbody>
                            </table>
                        </td>
                    </tr>
                   <tr>
                        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 47px">
                            <asp:ImageButton id="btnImprimir" onclick="btnImprimir_Click" runat="server" ImageUrl="~/Images/bt_imprimir.gif"></asp:ImageButton>&nbsp; 
                            
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 47px">
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tbody>
                                <tr>
                                    <td style="width: 899px; height: 15px"></td>
                                </tr>
                                <tr>
                                    <td style="padding-right: 10px; border-top: #fff 1px solid; padding-left: 10px; padding-bottom: 0px; width: 899px; padding-top: 0px" valign="middle" align="right" bgColor="#e6e6e6" height="26">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                        <tbody>
                                            <tr>
                                                <td style="height: 14px" align="right" width="22%">Beneficiário</td>
                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 14px" align="left">
                                                    <span class="cinza-escuro"><asp:Label id="lblBnf" runat="server"></asp:Label></span>
                                                </td>
                                            </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-right: 10px; border-top: #fff 1px solid; padding-left: 10px; padding-bottom: 0px; width: 899px; padding-top: 0px; height: 26px" valign="middle" align="right" bgColor="#f4f4f4">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                        <tbody>
                                            <tr>
                                                <td style="height: 16px" align="right" width="22%">Contratado</td>
                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 16px" align="left">
                                                    <span class="cinza-escuro"><asp:Label id="lblCtt" runat="server"></asp:Label></span>
                                                </td>
                                            </tr>
                                         </tbody>
                                         </table>
                                     </td>
                                </tr>
                                <tr>
                                    <td style="padding-right: 10px; border-top: #fff 1px solid; padding-left: 10px; padding-bottom: 0px; width: 899px; padding-top: 0px" valign="middle" align="right" bgColor="#e6e6e6" height="26">
                                        <table cellspacing="0" cellpadding="0" width="100%" border=0>
                                        <tbody>
                                            <tr>
                                                <td style="height: 16px" align="right" width="22%">Endereço</td>
                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 16px" align="left">
                                                    <span class="cinza-escuro"><asp:Label id="lblEnd" runat="server"></asp:Label></span>
                                                </td>
                                            </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-right: 10px; border-top: #fff 1px solid; padding-left: 10px; padding-bottom: 0px; width: 899px; padding-top: 0px; height: 26px" valign="middle" align="right" bgColor="#f4f4f4">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                        <tbody>
                                            <tr>
                                                <td style="height: 28px" align="right" width="22%">Profissional</td>
                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 28px" align="left">
                                                    <span class="cinza-escuro"><asp:Label id="lblPrf" runat="server"></asp:Label></span>
                                            </td>
                                            </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-right: 10px; border-top: #fff 1px solid; padding-left: 10px; padding-bottom: 0px; width: 899px; padding-top: 0px; height: 26px" valign="middle" align="right" bgColor="#e6e6e6">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                        <tbody>
                                            <tr><td style="height: 14px" align="right" width="22%">Telefone/Fax</td>
                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 14px" align="left">
                                                    <span class="cinza-escuro"><asp:Label id="lblPrfTel" runat="server"></asp:Label></span>
                                                 </td>
                                             </tr>
                                         </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-right: 10px; border-top: #fff 1px solid; padding-left: 10px; padding-bottom: 0px; width: 899px; padding-top: 0px; height: 26px" valign="middle" align="right" bgColor="#f4f4f4">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                        <tbody>
                                            <tr>
                                                <td style="width: 22%; height: 16px" align="right">CID</td>
                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 16px" align="left">
                                                    <span class="cinza-escuro"><asp:Label id="lblCidDsc" runat="server"></asp:Label></span>
                                                </td>
                                            </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-right: 10px; border-top: #fff 1px solid; padding-left: 10px; padding-bottom: 0px; width: 899px; padding-top: 0px; height: 26px" valign="middle" align="right" bgColor="#e6e6e6">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                        <tbody>
                                            <tr>
                                                <td style="width: 22%; height: 14px" align="right">Indicação Clínica</td>
                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 14px" align="left">
                                                    <span class="cinza-escuro"><asp:Label id="lblIndCln" runat="server"></asp:Label></span>
                                                </td>
                                            </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 47px">
                            <div align="right">&nbsp</div><br />
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server"  UpdateMode="Always">
                        <ContentTemplate>
                            <asp:GridView id="grdMaster" runat="server" 
                                DataSourceID="dtsMaster" AutoGenerateColumns="False" 
                                   OnDataBound="grd_DataBound" Width="100%" AllowSorting="True" 
                                   DataKeyNames="IdPdm,Pdm_Cod,Pdm_Dsc,IdSit,Spd_DatVld,Sit_Ind,Pdm_QtdCh_" 
                                OnSelectedIndexChanged="grdMaster_SelectedIndexChanged" AllowPaging="True" 
                                CssClass="grid-view-left">
                                <Columns>
                                    <asp:BoundField DataField="Pdm_Cod" HeaderText="C&#243;digo" SortExpression="Pdm_Cod"></asp:BoundField>
                                    <asp:BoundField DataField="Pdm_Dsc" HeaderText="Procedimento" 
                                        SortExpression="Pdm_Dsc"></asp:BoundField>
                                    <asp:BoundField DataField="Pdm_QtdCh_" HeaderText="Qtd." SortExpression="Pdm_QtdCh_">
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Sit_Ind" HeaderText="Sit" SortExpression="Sit_Ind"></asp:BoundField>
                                    <asp:BoundField DataField="Spd_Dat" HeaderText="Data" SortExpression="Spd_Dat"></asp:BoundField>
                                    <asp:BoundField DataField="Spd_QtdSol" HeaderText="Qtd. Sol." SortExpression="Spd_QtdSol"></asp:BoundField>
                                    <asp:BoundField DataField="Spd_QtdAtz" HeaderText="Qtd. Autoriz." SortExpression="Spd_QtdAtz"></asp:BoundField>
                                    <asp:BoundField DataField="Sit_Dsc" HeaderText="Situa&#231;&#227;o" SortExpression="Sit_Dsc"></asp:BoundField>
                                    <asp:BoundField DataField="Spd_DatVld" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Validade" SortExpression="Spd_DatVld"></asp:BoundField>
                                    <asp:CommandField SelectText="Selecionar" ShowSelectButton="True"></asp:CommandField>
                                </Columns>
                                <FooterStyle Font-Bold="True" ForeColor="White"></FooterStyle>
                                <PagerTemplate>
                                    <div align="center" height="20">
                                        <asp:ImageButton ID="ImageButton1SolPendentes" runat="server" CommandArgument="First"
                                            ImageUrl="~/Images/seta1_1_on.gif" OnCommand="paginateGrdPdm" />&nbsp;
                                        <asp:ImageButton ID="ImageButton2SolPendentes" runat="server" CommandArgument="Prev"
                                            ImageUrl="~/Images/seta1_2_on.gif" OnCommand="paginateGrdPdm" />
                                        Página
                                        <asp:DropDownList ID="ddlGridPages" runat="server" AutoPostBack="True" CssClass="campo"
                                            OnSelectedIndexChanged="ddlGrdPdmPages_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        de
                                        <asp:Label ID="lblPageCount" runat="server"></asp:Label>&nbsp;
                                        <asp:ImageButton ID="ImageButton3SolPendentes" runat="server" CommandArgument="Next"
                                            ImageUrl="~/Images/seta2_1_on.gif" OnCommand="paginateGrdPdm" />&nbsp;
                                        <asp:ImageButton ID="ImageButton4SolPendentes" runat="server" CommandArgument="Last"
                                            ImageUrl="~/Images/seta2_2_on.gif" OnCommand="paginateGrdPdm" />
                                    </div>
                                        
                                </PagerTemplate>
                            </asp:GridView> &nbsp; &nbsp;
                            <asp:SqlDataSource id="dtsMaster" runat="server" CancelSelectOnNullParameter="False" 
                                    ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" SelectCommand="ssAtz_AudPdm" 
                                    SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hdfIdSol" PropertyName="Value" Name="IdSol" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="hdfSolTip" PropertyName="Value" Name="Sol_Tip" Type="Byte"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource> &nbsp; <a href="pes.aspx"></a>
                        </ContentTemplate>
                        </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 47px">
                            <h3>&nbsp;</h3><h3>Procedimento selecionado&nbsp;</h3><br />
                        <asp:UpdatePanel ID="upnPdmSelecionado" runat="server"  UpdateMode="Always">
                        <ContentTemplate>
                            <table cellspacing="0" cellpadding="0" align="left" border="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 150px; height: 20px" align="right">Situação:</td>
                                        <td style="height: 20px" width="5"></td>
                                        <td style="height: 20px" align="left">
                                            <span style="COLOR: #999999">&nbsp;</span>
                                            <asp:DropDownList id="ddlSit" runat="server" Width="300px" 
                                                OnSelectedIndexChanged="ddlSit_SelectedIndexChanged" 
                                                AppendDataBoundItems="True" AutoPostBack="True" DataTextField="Sit_Dsc" 
                                                DataValueField="IdSit">
                                                <asp:ListItem Value="-1">Selecione</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Label ID="lblSitDsc" runat="server"></asp:Label>
                                        </td>
                                        <td style="height: 20px" align="left" width="20">&nbsp;</TD>
                                    </tr>
                                    <tr>
                                        <td colspan="4" height="10"></td>
                                    </tr>
                                    <tr>
                                        <td valign="top" align="right" width="150" height="10">&nbsp;</td>
                                        <td style="width: 5px"></td>
                                        <td align="left">&nbsp;
                                            <asp:TextBox id="txtPsqPdm" runat="server" Visible="False"></asp:TextBox> &nbsp;
                                            <asp:ImageButton id="ibtAdicionar" onclick="imgBtnAdicionar_Click" 
                                                runat="server" ImageUrl="~/Images/bt_adicionar.gif" Visible="False"></asp:ImageButton> 
                                            <asp:Button id="btnPsqPdm" onclick="btnPsqPdm_Click" runat="server" 
                                                CssClass="linkbutton" Text="Buscar Procedimento" Visible="False"></asp:Button> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" height="10">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px; height: 28px" align="right">Procedimento:</td>
                                        <td style="height: 28px" width="5"></td>
                                        <td style="height: 28px" align="left">
                                            <span class="cinza-claro">&nbsp;
                                                <asp:Label id="lblPdmCod" runat="server"></asp:Label>-<asp:Label id="lblPdmDsc" runat="server"></asp:Label>
                                            </span>
                                        </td>
                                        <td style="height: 28px" align="left"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px; height: 28px" align="right"></td>
                                        <td style="height: 28px" width="5"></td>
                                        <td style="height: 28px" align="left">
                                            <span class="cinza-claro">&nbsp;
                                                <asp:Label id="lblDlgOrt" runat="server"></asp:Label>
                                            </span>
                                        </td>
                                        <td style="height: 28px" align="left"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px; height: 28px" align="right">Quantidade Autorizada:</td>
                                        <td style="height: 28px" width="5"></td>
                                        <td style="height: 28px" align="left">
                                            <span class="cinza-claro">&nbsp;
                                                <asp:TextBox id="txtQtdAtz" runat="server" CssClass="campo" Enabled="False" MaxLength="3"></asp:TextBox>
                                            </span></td>
                                        <td style="HEIGHT: 28px" align="left"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" height="10"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px; height: 28px" align="right">Validade Original:</td>
                                        <td style="height: 28px" width="5"></td>
                                        <td style="height: 28px" align="left">
                                            <span class="cinza-claro">&nbsp;
                                                <asp:TextBox id="txtPdmVldOri" runat="server" CssClass="campo" 
                                                Enabled="False" MaxLength="10"></asp:TextBox>
                                            </span>
                                        </td>
                                        <td style="height: 28px" align="left"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" height="10"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px; height: 28px" align="right">Prorrogar Validade para:</td>
                                        <td style="height: 28px" width="5"></td>
                                        <td style="height: 28px" align="left">
                                            <span class="cinza-claro">&nbsp;
                                                <asp:TextBox id="txtPdmVldPrg" runat="server" Enabled="False" 
                                                MaxLength="10" CssClass="datepicker"></asp:TextBox>
                                            </span>
                                        </td>
                                        <td style="height: 28px" align="left"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" height="10"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px; height: 28px" align="right">Justificativa:</td>
                                        <td style="height: 28px" width="5"></td>
                                        <td style="height: 28px" align="left">
                                            <span class="cinza-claro">&nbsp;
                                                <asp:TextBox id="txtGpaJst" runat="server" Width="100%" MaxLength="200" 
                                                Rows="4" TextMode="MultiLine"></asp:TextBox>
                                            </span>
                                        </td>
                                        <td style="height: 28px" align="left"></td>
                                    </tr>
                                    <tr><td style="height: 10px" colspan="4">
                                        <asp:Button ID="lbtBuscar" runat="server" CssClass="linkbutton" 
                                            onclick="btnPsqPdm_Click" Text="Buscar Procedimento" Visible="false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px; " align="right"></td>
                                        <td width="5"></td>
                                        <td align="left">&nbsp;
                                            <span class="cinza-claro">
                                            <asp:ImageButton id="btnAtz" onclick="btnAtz_Click" 
                                                runat="server" ImageUrl="~/Images/bt_gravar.gif" Height="19px" 
                                                Visible="False"></asp:ImageButton>
                                            <asp:ImageButton ID="btnCnc" runat="server" 
                                                ImageUrl="~/Images/bt_cancelar_execucao.gif" onclick="btnCnc_Click" 
                                                Visible="False" />
                                            
                                            </span>
                                        </td>
                                        <td align="left"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" height="10"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <asp:HiddenField id="hdfIdPdm" runat="server"></asp:HiddenField>
                        </ContentTemplate> 
                        </asp:UpdatePanel>
                            <br /><br /><br /><br /><br />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 47px">
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server"  UpdateMode="Always">
                            <ContentTemplate>
                                <asp:Image id="imgMsg" runat="server" ImageUrl="../Images/ico_alert.gif" Visible="False"></asp:Image> 
                                <asp:Label id="lblMsg" runat="server" CssClass="erro"></asp:Label>
                           </ContentTemplate> 
                        </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 47px">
                            <br /><h3>Negativas</h3><br />
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server"  UpdateMode="Always">
                        <ContentTemplate>
                            <asp:GridView id="grdDetail" runat="server" DataSourceID="dtsDetail" AutoGenerateColumns="False" 
                                    OnDataBound="grd_DataBound" Width="100%" 
                                AllowPaging="True" AllowSorting="True" DataKeyNames="IdMsg">
                                <Columns>
                                    <asp:BoundField DataField="IdMsg" HeaderText="C&#243;digo" ReadOnly="True" SortExpression="IdMsg">
                                        <ItemStyle Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Msg_Dsc" HeaderText="Mensagem" SortExpression="Msg_Dsc">
                                        <ItemStyle Width="90%" />
                                        </asp:BoundField>
                                </Columns>
                                <FooterStyle Font-Bold="True" ForeColor="White" />
                                    <PagerTemplate>
                                        <div align="center" height="20">
                                            <asp:ImageButton ID="ImageButton1SolPendentes" runat="server" CommandArgument="First"
                                                    ImageUrl="~/Images/seta1_1_on.gif" OnCommand="paginateGrdMsg" />&nbsp;
                                            <asp:ImageButton ID="ImageButton2SolPendentes" runat="server" CommandArgument="Prev"
                                                    ImageUrl="~/Images/seta1_2_on.gif" OnCommand="paginateGrdMsg" />
                                                Página
                                            <asp:DropDownList ID="ddlGridPages" runat="server" AutoPostBack="True" CssClass="campo"
                                                    OnSelectedIndexChanged="ddlGrdMsgPages_SelectedIndexChanged">
                                            </asp:DropDownList>
                                                de
                                            <asp:Label ID="lblPageCount" runat="server"></asp:Label>&nbsp;
                                            <asp:ImageButton ID="ImageButton3SolPendentes" runat="server" CommandArgument="Next"
                                                    ImageUrl="~/Images/seta2_1_on.gif" OnCommand="paginateGrdMsg" />&nbsp;
                                            <asp:ImageButton ID="ImageButton4SolPendentes" runat="server" CommandArgument="Last"
                                                    ImageUrl="~/Images/seta2_2_on.gif" OnCommand="paginateGrdMsg" />
                                        </div>
                                    </PagerTemplate>
                            </asp:GridView>
                            <asp:SqlDataSource id="dtsDetail" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                    SelectCommand="ssAtz_AudPdmMsg" SelectCommandType="StoredProcedure" UpdateCommand="stAtz_Aud" 
                                    UpdateCommandType="StoredProcedure" onupdated="dtsDetail_Updated">
                                <SelectParameters>
                                    <asp:Parameter Name="IdSol" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="IdPdm" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="Sol_Tip" Type="Int32"></asp:Parameter>
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="IdSol" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="Sol_Tip" Type="Byte"></asp:Parameter>
                                    <asp:Parameter Name="Sol_QtdAtz" Type="Byte"></asp:Parameter>
                                    <asp:Parameter Name="IdPdm" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="Spd_IdSit" Type="Byte"></asp:Parameter>
                                    <asp:Parameter Name="Spa_Jst" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="IdUsr" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="Spd_DatVld" Type="DateTime"></asp:Parameter>
                                    <asp:Parameter Name="IdNovPdm" Type="Int32" />
                                    <asp:Parameter Direction="InputOutput" Name="Out_Sts" Type="Byte" />
                                    <asp:Parameter Name="IdNgc" Type="Int32" />
                                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>  &nbsp;
                        </ContentTemplate>
                        </asp:UpdatePanel> 
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 47px"><br />
                            <h3>Log dos registros das situações</h3><br />
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server"  UpdateMode="Always">
                        <ContentTemplate>
                            <asp:GridView id="grdAudLog" runat="server" DataSourceID="dtsGiaPdmAud" AutoGenerateColumns="False" 
                                    OnDataBound="grd_DataBound" Width="100%" 
                                AllowPaging="True" AllowSorting="True">
                                <Columns>
                                    <asp:BoundField DataField="Spa_Dat" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Data" SortExpression="Spa_Dat">
                                        <ItemStyle Width="10%"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Sit_Dsc" HeaderText="Situa&#231;&#227;o" SortExpression="Sit_Dsc">
                                        <ItemStyle Width="25%"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Usr_Nme" HeaderText="Usu&#225;rio" SortExpression="Usr_Nme">
                                        <ItemStyle Width="25%"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Spa_Jst" HeaderText="Justificativa" SortExpression="Spa_Jst">
                                        <ItemStyle Width="40%"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                                <FooterStyle Font-Bold="True" ForeColor="White"></FooterStyle>
                                <PagerTemplate>
                                    <div align="center" height="20">
                                        <asp:ImageButton ID="ImageButton1SolPendentes" runat="server" CommandArgument="First"
                                            ImageUrl="~/Images/seta1_1_on.gif" OnCommand="paginateGrdLog" />&nbsp;
                                        <asp:ImageButton ID="ImageButton2SolPendentes" runat="server" CommandArgument="Prev"
                                            ImageUrl="~/Images/seta1_2_on.gif" OnCommand="paginateGrdLog" />
                                        Página
                                        <asp:DropDownList ID="ddlGridPages" runat="server" AutoPostBack="True" CssClass="campo"
                                            OnSelectedIndexChanged="ddlGrdLogPages_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        de
                                        <asp:Label ID="lblPageCount" runat="server"></asp:Label>&nbsp;
                                        <asp:ImageButton ID="ImageButton3SolPendentes" runat="server" CommandArgument="Next"
                                            ImageUrl="~/Images/seta2_1_on.gif" OnCommand="paginateGrdLog" />&nbsp;
                                        <asp:ImageButton ID="ImageButton4SolPendentes" runat="server" CommandArgument="Last"
                                            ImageUrl="~/Images/seta2_2_on.gif" OnCommand="paginateGrdLog" />
                                    </div>
                                        
                                </PagerTemplate>
                            </asp:GridView>
                            <asp:SqlDataSource id="dtsGiaPdmAud" runat="server" CancelSelectOnNullParameter="False" 
                                    ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" SelectCommand="ssAtz_GiaPdmAud" 
                                    SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter Name="IdSol" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="IdPdm" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="Sol_Tip" Type="Int32"></asp:Parameter>
                                </SelectParameters>
                            </asp:SqlDataSource> &nbsp; 
                        </ContentTemplate>
                        </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 47px">
                            <asp:ImageButton id="btnPgaIni" onclick="btnPgaIni_Click" runat="server" ImageUrl="~/Images/bt_home.gif"></asp:ImageButton>&nbsp; 
                            <asp:ImageButton id="btnNewPsq" onclick="btnNewPsq_Click" runat="server" ImageUrl="~/Images/bt_nova_pesquisa.gif"></asp:ImageButton>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 47px">
                            <%--Quantidade maxima de CH que o usuario pode autorizar--%> 
                        </td>
                    </tr>
                </tbody>
            </table>            
<%--        </ContentTemplate>
    </asp:UpdatePanel>--%> 
    <br />        
    <ajaxToolKit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground"
        DropShadow="true" PopupControlID="ModalPanel"  TargetControlID="btn1">
    </ajaxToolKit:ModalPopupExtender>                
    <asp:Panel ID="ModalPanel" runat="server" CssClass="modalPopup" 
            Width="830px" BackColor="White" Direction="LeftToRight">
<%--        <asp:UpdatePanel ID="upnPdm" runat="server"  UpdateMode="Conditional">
            <ContentTemplate>--%>
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
                                                <h2>Busca de procedimento</h2>
                                            </td>
                                            <td style="width: 9px; height: 37px" align="left">
                                                <img height="37" alt="" src="../Images/tit_right.gif" width="9" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 937px" height="15"></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 10px; padding-left: 0px; padding-bottom: 0px; width: 937px; padding-top: 0px; height: 47px" valign="middle" align="center">
                                <table cellspacing="0" cellpadding="0" border="0">
                                    <tbody>
                                        <tr>
                                            <td style="height: 22px" align="right">Descrição:&nbsp;</td>
                                            <td style="width: 140px; height: 22px" align="right">
                                                <asp:TextBox id="txtBnf_NmePop" runat="server" CssClass="campo" Width="140px"></asp:TextBox>
                                            </td>
                                            <td style="height: 22px" valign="top" align="left" width="78"></td>
                                            <td style="width: 56px; height: 22px" align="right">Código:&nbsp;</td>
                                            <td style="height: 22px" align="right" width="140">
                                                <asp:TextBox id="txtBnf_MtrPop" runat="server" Width="140px"></asp:TextBox>
                                            </td>
                                            <td style="padding-right: 0px; padding-left: 5px; padding-bottom: 0px; padding-top: 0px; height: 22px" valign="top" align="left" width="78">
                                                <asp:ImageButton id="btnBuscar" onclick="btnBuscar_Click" runat="server" 
                                                    ImageUrl="../Images/bt_buscar.gif" Height="19px"></asp:ImageButton>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 0px 4px 0px 4px;" valign="middle" align="center">
                                <asp:GridView id="grd" runat="server" DataSourceID="dtsPdm" Width="100%" 
                                        AutoGenerateColumns="False" DataKeyNames="Pdm_Cod,Pdm_Dsc,IdPdm" 
                                        OnSelectedIndexChanged="grd_SelectedIndexChanged" 
                                        OnDataBound="grd_DataBound" AllowPaging="True" AllowSorting="True" 
                                        OnSorted="grd_Sorted">
                                    <Columns>
                                        <asp:BoundField DataField="Pdm_Cod" HeaderText="C&#243;digo" SortExpression="Pdm_Cod">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </asp:BoundField>
                                        <asp:ButtonField CommandName="Select" DataTextField="Pdm_Dsc" Text="Button" HeaderText="Descri&#231;&#227;o" SortExpression="Pdm_Dsc">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" Width="60%" />
                                        </asp:ButtonField>
                                        <asp:BoundField DataField="Pdm_DscRsm" HeaderText="Apelido" SortExpression="Pdm_DscRsm">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" Width="25%" />
                                        </asp:BoundField>
                                    </Columns>
                                    <PagerTemplate>
                                        <div height="20">
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument="First" ImageUrl="~/Images/seta1_1_on.gif"
                                                OnCommand="Paginategrd" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CommandArgument="Prev" ImageUrl="~/Images/seta1_2_on.gif"
                                                OnCommand="Paginategrd" />
                                            Página
                                            <asp:DropDownList ID="ddlGridPages" runat="server" AutoPostBack="True" CssClass="campo"
                                                OnSelectedIndexChanged="ddlGrdPdmPages_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            de
                                            <asp:Label ID="lblPageCount" runat="server"></asp:Label>
                                            &nbsp;<asp:ImageButton ID="ImageButton3" runat="server" CommandArgument="Next" ImageUrl="~/Images/seta2_1_on.gif"
                                                OnCommand="Paginategrd" />
                                            &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CommandArgument="Last" ImageUrl="~/Images/seta2_2_on.gif"
                                                OnCommand="Paginategrd" />
                                        </div>
                    
                                    </PagerTemplate>
                                </asp:GridView> 
                                <asp:SqlDataSource id="dtsPdm" runat="server" SelectCommandType="StoredProcedure" SelectCommand="ssAtz_Pdm" 
                                    ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" CancelSelectOnNullParameter="False">
                                    <SelectParameters>
                                        <asp:Parameter Name="IdPdm" Type="Int32" />
                                        <asp:Parameter Name="Pdm_Cod" Type="String" />
                                        <asp:Parameter Name="Pdm_IdGrp" Type="Int16" />
                                        <asp:Parameter Name="Pdm_Dsc" Type="String" />
                                        <asp:Parameter Name="Grp_Dsc" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="Pdm_Atv" Type="Boolean" />
                                    </SelectParameters>
                                </asp:SqlDataSource> 
                                <asp:Label id="lblEmptyGrid" runat="server" Text=""></asp:Label> 
                                <h2 align="right">&nbsp;
                                    <asp:ImageButton id="btn_fechar" onclick="btn_fechar_Click" runat="server" ImageUrl="~/Images/bt_fecha.gif"></asp:ImageButton>
                                </h2>
                            </td>
                        </tr>
                    </tbody>
               </table>            
<%--            </ContentTemplate>
        </asp:UpdatePanel>--%></asp:Panel>
        <asp:HiddenField id="hdfIdSol" runat="server"></asp:HiddenField> 
        <asp:HiddenField id="hdfSolTip" runat="server"></asp:HiddenField>
        <asp:HiddenField id="hdfQtdMaxCh_" runat="server"></asp:HiddenField>
        <asp:HiddenField id="hdfPplCon" runat="server"></asp:HiddenField>
        <asp:HiddenField id="hdfPplSdt" runat="server"></asp:HiddenField>
        <asp:HiddenField id="hdfPplPrgLib" runat="server"></asp:HiddenField>
    <br />
    <%--O TargetId do modalpopuextente não pode estar invisível, se estiver o popup é exibido no page load--%>
    <asp:Button ID="btn1" runat="server" CssClass="linkbutton" />
</asp:Content>

