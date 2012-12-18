﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="auditndet.aspx.cs" Inherits="Atz_auditndet" Theme="Standard" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript">
        $(function() {
            $("input[class *= 'datepicker']").datepicker({
                changeMonth: true,
                changeYear: true,
                monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
                monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
                dayNames: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
                dayNamesMin: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab'],
                nextText: 'Próximo',
                prevText: 'Anterior',
                dateFormat: 'dd/mm/yy'
            });
        });
	 </script>
    <script type="text/javascript" language="javascript">
        // Event that occurs when click the tab of TabContainer
        function clientActiveTabChanged(sender, args) {
            //  if the tab does not exist and it is the active tab, 
            //  trigger the async-postback
            if (sender.get_activeTabIndex() == 0) {
                // load tab1
                $get("<%= btnTb1Trigger.ClientID %>").click();
            }
            else if (sender.get_activeTabIndex() == 1) {
                // load tab2
                $get("<%= btnTb2Trigger.ClientID %>").click();
            }
            else if (sender.get_activeTabIndex() == 2) {
                // load tab3
                $get("<%= btnTb3Trigger.ClientID %>").click();
            }
            else if (sender.get_activeTabIndex() == 3) {
                // load tab4
                $get("<%= btnTb4Trigger.ClientID %>").click();
            }
            else if (sender.get_activeTabIndex() == 4) {
                // load tab5
                $get("<%= btnTb5Trigger.ClientID %>").click();
            }
        }                  
    </script>
    <div>        
        <table>
            <tbody>
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
                                        <td style="height: 16px" align="right" width="22%">Profissional</td>
                                        <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 16px" align="left">
                                            <span class="cinza-escuro"><asp:Label id="lblPrf" runat="server"></asp:Label></span>
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
                                        <td style="height: 28px" align="right" width="22%">Telefone/Fax</td>
                                        <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 28px" align="left">
                                            <span class="cinza-escuro"><asp:Label id="lblPrfTel" runat="server"></asp:Label></span>
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
                                    <tr><td style="height: 14px" align="right" width="22%">CID</td>
                                        <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 14px" align="left">
                                            <span class="cinza-escuro"><asp:Label id="lblCidDsc" runat="server"></asp:Label></span>
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
                                        <td style="width: 22%; height: 16px" align="right">Indicação Clínica</td>
                                        <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 16px" align="left">
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
            </tbody>
        </table>
        <br />
        <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" CssClass="tabcontainer"
            OnClientActiveTabChanged="clientActiveTabChanged" TabIndex="0" >
            <ajaxToolkit:TabPanel runat="server" HeaderText="Detalhe" ID="tabDet">
                <HeaderTemplate>
                    Detalhe
                </HeaderTemplate>
                <ContentTemplate>
                    <asp:UpdatePanel id="upnTb1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <%--hidden buttons that are used to trigger the postbacks--%>
                            <input id="btnTb1Trigger" runat="server" type="button" style="display:none" onserverclick="btnTb1Trigger_Click" /> 
                            <asp:HiddenField runat="server" ID="hdfItnAtz" />
                            <br />
                            <div style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px">
                                <asp:ImageButton runat="server" ID="ibtAtzItn" 
                                    ImageUrl="~/Images/bt_autorizar.gif" onclick="ibtAtzItn_Click" />
                                <asp:ImageButton runat="server" ID="ibtNegItn" 
                                    ImageUrl="~/Images/bt_negar.gif" onclick="ibtNegItn_Click" />
                                <asp:Panel runat="server" ID="pnlEdit" Visible="False" >
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Data provável admissão:
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtDatAdm" runat="server" SkinID="datepicker"></asp:TextBox>
                                                </td>
                                            </tr>                                           
                                            <tr>
                                                <td>Diárias autorizadas:
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                     <asp:TextBox ID="txtDriAtz" runat="server"></asp:TextBox>
                                                     <ajaxToolkit:FilteredTextBoxExtender ID="fteDriAtz" runat="server" 
                                                         Enabled="True" TargetControlID="txtDriAtz" FilterType="Numbers">
                                                     </ajaxToolkit:FilteredTextBoxExtender>
                                                </td>
                                            </tr>                                        
                                            <tr>
                                                <td>Tipo de acomodação:
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlAcm" runat="server" AppendDataBoundItems="True" 
                                                        DataTextField="Acm_Dsc" DataValueField="IdAcm">
                                                        <asp:ListItem Value="0">Selecione</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Justificativa:
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtItnObs" runat="server" TextMode="MultiLine" Width="500px" 
                                                        Rows="4"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Contratado:</td>
                                                <td>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlCtt" runat="server" AppendDataBoundItems="True" 
                                                        Width="500px" AutoPostBack="True" DataTextField="Ctt_Nme" DataValueField="IdCtt">
                                                        <asp:ListItem Value="0">Selecione</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Endereço:</td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    <asp:RadioButtonList ID="rblSeqEnd" runat="server" DataSourceID="dtsSeqEnd" 
                                                        DataTextField="local" DataValueField="Cte_SeqEnd">
                                                    </asp:RadioButtonList>
                                                    <asp:SqlDataSource ID="dtsSeqEnd" runat="server" 
                                                        CancelSelectOnNullParameter="False" 
                                                        ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                                        SelectCommand="ssAtz_CttEnd" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:Parameter Name="Ctt_Nme" Type="String" />
                                                            <asp:ControlParameter ControlID="ddlCtt" Name="Cte_IdCtt" PropertyName="SelectedValue" 
                                                                Type="Int64" />
                                                            <asp:Parameter Name="Cte_SeqEnd" Type="Byte" />
                                                            <asp:Parameter Name="Ctt_NmeRsm" Type="String" />
                                                            <asp:Parameter Name="Ctt_Doc" Type="String" />
                                                            <asp:Parameter Name="Fit" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 47px;" 
                                                    colspan="3">
                                                    <asp:Image ID="imgMsg" runat="server" ImageUrl="../Images/ico_alert.gif" 
                                                        Visible="False" TabIndex="1" />
                                                    <asp:Label ID="lblMsg" runat="server" CssClass="erro"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="width: 150px; ">
                                                </td>
                                                <td width="5">
                                                </td>
                                                <td align="left">
                                                    &nbsp; <span class="cinza-claro">
                                                    <asp:ImageButton ID="btnGravar" runat="server" 
                                                        ImageUrl="~/Images/bt_gravar.gif" onclick="btnGravar_Click" />
                                                    &nbsp;<asp:ImageButton ID="ibtCancelEdit" runat="server" 
                                                        ImageUrl="~/Images/bt_cancelar.gif" onclick="ibtCancelEdit_Click" />
                                                    </span>
                                                </td>
                                                <td align="left">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </asp:Panel>
                                <asp:DetailsView ID="dvw" runat="server" Height="50px" Width="100%" 
                                    AutoGenerateRows="False" BackColor="White" BorderColor="#999999" 
                                    BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="dtsItn" CaptionAlign="Left" 
                                    DataKeyNames="IdGia,IdBnf,IdItn,IdIcl" ondatabound="dvw_DataBound">
                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <Fields>
                                        <asp:BoundField DataField="Sti_Dsc" HeaderText="Situação" 
                                            SortExpression="Sti_Dsc" />
                                        <asp:BoundField DataField="Bnf_Mtr" HeaderText="Matrícula" 
                                            SortExpression="Bnf_Mtr" />
                                        <asp:BoundField DataField="Bnf_Nme" HeaderText="Beneficiário" 
                                            SortExpression="Bnf_Nme" />
                                        <asp:BoundField DataField="Prd_Nme" HeaderText="Produto" ReadOnly="True" 
                                            SortExpression="Prd_Nme" />
                                        <asp:BoundField DataField="Bnf_Idd" HeaderText="Idade" ReadOnly="True" 
                                            SortExpression="Bnf_Idd" />
                                        <asp:BoundField DataField="Bnf_Sxo" HeaderText="Sexo" 
                                            SortExpression="Bnf_Sxo" />
                                        <asp:BoundField DataField="Prd_DatInc" HeaderText="Data Inclusão" ReadOnly="True" 
                                            SortExpression="Prd_DatInc" />
                                        <asp:BoundField DataField="Prf_Nme" HeaderText="Profissional" 
                                            SortExpression="Prf_Nme" />
                                        <asp:BoundField DataField="Itn_IdCttSol" HeaderText="Contratado" 
                                            SortExpression="Itn_IdCttSol" />
                                        <asp:BoundField DataField="Itn_SeqEndSol" HeaderText="Seq.End." 
                                            SortExpression="Itn_SeqEndSol" />
                                        <asp:BoundField DataField="Gia_Crt" HeaderText="Caráter" 
                                            SortExpression="Gia_Crt" />
                                        <asp:BoundField DataField="Tpi_Dsc" HeaderText="Tipo Internação" 
                                            SortExpression="Tpi_Dsc" />
                                        <asp:BoundField DataField="Rgm_Dsc" HeaderText="Regime Internação" 
                                            SortExpression="Rgm_Dsc" />
                                        <asp:BoundField DataField="Int_Dri" HeaderText="Diárias Solicitadas" ReadOnly="True" 
                                            SortExpression="Int_Dri" />
                                        <asp:BoundField DataField="Icl_IndCln" HeaderText="Indicação Clínica" 
                                            SortExpression="Icl_IndCln" />
                                        <asp:BoundField DataField="Gia_TipDoe" HeaderText="Tipo de Doença" 
                                            SortExpression="Gia_TipDoe" />
                                        <asp:BoundField DataField="Gia_TemDoe" HeaderText="Tempo de Doença" 
                                            SortExpression="Gia_TemDoe" />                                        
                                    </Fields>
                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="#DCDCDC" />
                                    
                                </asp:DetailsView>
                                <asp:SqlDataSource ID="dtsItn" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                    SelectCommand="ssAtz_AudItnDet" SelectCommandType="StoredProcedure" 
                                    UpdateCommand="stAtz_AudItn" UpdateCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="IdIcl" QueryStringField="Icl" Type="Int32" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="IdItn" Type="Int32" />
                                        <asp:Parameter Name="IdIcl" Type="Int32" />
                                        <asp:Parameter Name="IdUsr" Type="Int32" />
                                        <asp:Parameter Name="IdSti" Type="Byte" />
                                        <asp:Parameter Name="ItnDatAdm" Type="DateTime" />
                                        <asp:Parameter Name="IdAcm" Type="Byte" />
                                        <asp:Parameter Name="IclObs" Type="String" />
                                        <asp:Parameter Name="IdCtt" Type="Int64" />
                                        <asp:Parameter Name="SeqEnd" Type="Byte" />
                                        <asp:Parameter Name="IclDriAtz" Type="Byte" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" HeaderText="Procedimentos" ID="tabPdm">
                <ContentTemplate>
                    <asp:UpdatePanel id="upnTb2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <%--hidden buttons that are used to trigger the postbacks--%>
                            <input id="btnTb2Trigger" runat="server" type="button" style="display:none" onserverclick="btnTb2Trigger_Click" /> 
                            <br />                            
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tbody>
                                    <tr>
                                        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 47px">
                                            <div align="right">&nbsp</div><br />
                                            <asp:GridView id="grdMaster" runat="server" 
                                                DataSourceID="dtsMaster" AutoGenerateColumns="False" 
                                                   OnDataBound="grd_DataBound" Width="100%" AllowPaging="True" AllowSorting="True" 
                                                   DataKeyNames="IdPdm,Pdm_Cod,Pdm_Dsc,IdSit,Ipd_DatVld,IdIpd" 
                                                OnSelectedIndexChanged="grdMaster_SelectedIndexChanged">
                                                <Columns>
                                                    <asp:BoundField DataField="Pdm_Cod" HeaderText="C&#243;digo" SortExpression="Pdm_Cod"></asp:BoundField>
                                                    <asp:BoundField DataField="Pdm_Cod" HeaderText="Procedimento" SortExpression="Pdm_Cod"></asp:BoundField>
                                                    <asp:BoundField DataField="Pdm_QtdCh_" HeaderText="Qtd." SortExpression="Pdm_QtdCh_">
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Sit_Ind" HeaderText="Sit" SortExpression="Sit_Ind"></asp:BoundField>
                                                    <asp:BoundField DataField="Ipd_Dat" HeaderText="Data" SortExpression="Ipd_Dat"></asp:BoundField>
                                                    <asp:BoundField DataField="Ipd_QtdSol" HeaderText="Qtd. Sol." SortExpression="Ipd_QtdSol"></asp:BoundField>
                                                    <asp:BoundField DataField="Ipd_QtdAtz" HeaderText="Qtd. Autoriz." SortExpression="Ipd_QtdAtz"></asp:BoundField>
                                                    <asp:BoundField DataField="Sit_Dsc" HeaderText="Situa&#231;&#227;o" SortExpression="Sit_Dsc"></asp:BoundField>
                                                    <asp:BoundField DataField="Ipd_DatVld" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Validade" SortExpression="Ipd_DatVld"></asp:BoundField>
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
                                                    ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" SelectCommand="ssAtz_AudIclPdm" 
                                                    SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="hdfIdIcl" PropertyName="Value" Name="IdIcl" Type="Int32"></asp:ControlParameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource> &nbsp; <a href="pes.aspx"></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 47px">
                                            <h3>&nbsp;</h3><h3>Procedimento selecionado&nbsp;</h3><br />
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
                                                                DataValueField="IdSit" Enabled="False">
                                                                <asp:ListItem Value="-1">Selecione</asp:ListItem>
                                                            </asp:DropDownList>
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
                                                        <td colspan="4" height="10"></td>
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
                                                        <td colspan="4" height="10"></td>
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
                                                                <asp:TextBox id="txtPdmVldOri" runat="server" CssClass="campo" Enabled="False"></asp:TextBox>
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
                                                                MaxLength="10"></asp:TextBox>
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
                                                        <asp:Button ID="Button1" runat="server" CssClass="linkbutton" 
                                                            onclick="btnPsqPdm_Click" Text="Buscar Procedimento" Visible="false" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 150px; " align="right"></td>
                                                        <td width="5"></td>
                                                        <td align="left">&nbsp;
                                                            <span class="cinza-claro">
                                                            <asp:ImageButton id="btnAtz" onclick="btnAtz_Click" 
                                                                runat="server" ImageUrl="~/Images/bt_gravar.GIF"></asp:ImageButton></span>
                                                        </td>
                                                        <td align="left"></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4" height="10"></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <br /><br /><br /><br /><br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 47px">
                                            <asp:Image id="imgMsg1" runat="server" ImageUrl="../Images/ico_alert.gif" 
                                                Visible="False"></asp:Image> 
                                                <asp:Label id="lblMsg1" runat="server" CssClass="erro"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 47px">
                                            <br /><h3>Negativas</h3><br />
                                            <asp:GridView id="grdDetail" runat="server" AutoGenerateColumns="False" 
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
                                            </asp:GridView> &nbsp; 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 47px"><br />
                                            <h3>Log dos registros das situações</h3><br />
                                            <asp:GridView id="grdAudLog" runat="server" AutoGenerateColumns="False" 
                                                   DataSourceID="dtsIclPdmAud" OnDataBound="grd_DataBound" Width="100%" 
                                                AllowPaging="True" AllowSorting="True">
                                                <Columns>
                                                    <asp:BoundField DataField="Ipa_Dat" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Data" SortExpression="Ipa_Dat">
                                                        <ItemStyle Width="10%"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Sit_Dsc" HeaderText="Situa&#231;&#227;o" SortExpression="Sit_Dsc">
                                                        <ItemStyle Width="25%"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Usr_Nme" HeaderText="Usu&#225;rio" SortExpression="Usr_Nme">
                                                        <ItemStyle Width="25%"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Ipa_Jst" HeaderText="Justificativa" SortExpression="Ipa_Jst">
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
                                            <asp:SqlDataSource id="dtsIclPdmAud" runat="server" CancelSelectOnNullParameter="False" 
                                                    ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" SelectCommand="ssAtz_IclPdmAud" 
                                                    SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:Parameter Name="IdIpd" Type="Int32"></asp:Parameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource> &nbsp; 
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
                                            <asp:SqlDataSource id="dtsDetail" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                                    SelectCommand="ssAtz_AudPdmMsg" SelectCommandType="StoredProcedure" UpdateCommand="stAtz_AudIclPdm" 
                                                    UpdateCommandType="StoredProcedure" onupdated="dtsDetail_Updated">
                                                <SelectParameters>
                                                    <asp:Parameter Name="IdIcl" Type="Int32"></asp:Parameter>
                                                    <asp:Parameter Name="IdPdm" Type="Int32"></asp:Parameter>
                                                </SelectParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="IdIcl" Type="Int32"></asp:Parameter>
                                                    <asp:Parameter Name="IdIpd" Type="Int32"></asp:Parameter>
                                                    <asp:Parameter Name="IdSit" Type="Byte"></asp:Parameter>
                                                    <asp:Parameter Name="IdPdm" Type="Int32"></asp:Parameter>
                                                    <asp:Parameter Name="IdUsr" Type="Int32"></asp:Parameter>   
                                                    <asp:Parameter Name="IpdQtdAtz" Type="Byte"></asp:Parameter> 
                                                    <asp:Parameter Name="IpaJst" Type="String"></asp:Parameter>
                                                    <asp:Parameter Direction="InputOutput" Name="OutSts" Type="Byte" />
                                                </UpdateParameters>
                                            </asp:SqlDataSource> 
                                            <asp:HiddenField id="hdfIdIcl" runat="server"></asp:HiddenField> 
                                            <asp:HiddenField id="hdfIdPdm" runat="server"></asp:HiddenField> 
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            
            
            <ajaxToolkit:TabPanel runat="server" HeaderText="OPM" ID="tabOPM">
                <ContentTemplate>
                    <asp:UpdatePanel id="upnTb3" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <%--hidden buttons that are used to trigger the postbacks--%>
                            <input id="btnTb3Trigger" runat="server" type="button" style="display:none" onserverclick="btnTb3Trigger_Click" /> 
                            <br />
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tbody>
                                    <tr>
                                        <td>
                                            <div style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px">
                                                <asp:GridView id="grdOpm" runat="server" DataSourceID="dtsOpm" 
                                                    AllowPaging="True" AutoGenerateColumns="False" 
                                                    Width="100%" ondatabound="grd_DataBound" AllowSorting="True" 
                                                    DataKeyNames="IdIop" onselectedindexchanged="grdOpm_SelectedIndexChanged">
                                                    <Columns>
                                                        <asp:BoundField DataField="Iop_DscSol" HeaderText="OPM Solicitado" SortExpression="Iop_DscSol" />
                                                        <asp:BoundField DataField="Iop_QtdSol" HeaderText="Qtd.Sol." SortExpression="Iop_QtdSol" />
                                                        <asp:BoundField DataField="Iop_DatSol" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Solicitação" SortExpression="Iop_DatSol"></asp:BoundField>
                                                        <asp:BoundField DataField="Iop_DscAtz" HeaderText="OPM Autorizado" SortExpression="Iop_DscSol" />
                                                        <asp:BoundField DataField="Iop_QtdAtz" HeaderText="Qtd.Aut." SortExpression="Iop_QtdAtz" />
                                                        <asp:BoundField DataField="Sti_Dsc" HeaderText="Situação" SortExpression="Sti_Dsc" />
                                                        <asp:BoundField DataField="Iop_DatRel" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Realização" SortExpression="Iop_DatRel"></asp:BoundField>
                                                        <asp:CommandField SelectText="Selecionar" ShowSelectButton="True"></asp:CommandField>
                                                    </Columns>
                                                    <PagerTemplate>
                                                        <div height="20" align="center">
                                                            <asp:ImageButton ID="ImageButton1" runat="server"
                                                                        ImageUrl="~/Images/seta1_1_on.gif" CommandArgument="First" oncommand="paginateGrdOPM" />&#160;&nbsp;
                                                            <asp:ImageButton ID="ImageButton2" runat="server"
                                                                    ImageUrl="~/Images/seta1_2_on.gif"  CommandArgument="Prev" oncommand="paginateGrdOPM" />&#160;Página 
                                                            <asp:DropDownList ID="ddlGridPages" runat="server" CssClass="campo"
                                                                        AutoPostBack="True" onselectedindexchanged="ddlGrdOPMPages_SelectedIndexChanged">
                                                            </asp:DropDownList>&nbsp;de 
                                                            <asp:Label ID="lblPageCount" runat="server"></asp:Label> 
                                                            <asp:ImageButton ID="ImageButton3" runat="server"
                                                                        ImageUrl="~/Images/seta2_1_on.gif"  CommandArgument="Next" oncommand="paginateGrdOPM" />&#160;&nbsp;
                                                            <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Images/seta2_2_on.gif"  CommandArgument="Last" oncommand="paginateGrdOPM" />
                                                        </div>
                                                    </PagerTemplate>
                                                </asp:GridView>
                                                <asp:SqlDataSource id="dtsOpm" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                                    SelectCommand="ssAtz_IclOpm" SelectCommandType="StoredProcedure" 
                                                    UpdateCommand="stAtz_AudIclOpm" UpdateCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:QueryStringParameter Name="IdIcl" QueryStringField="Icl" Type="Int32" />
                                                    </SelectParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="IdIop" Type="Int32" />
                                                        <asp:Parameter Name="IopQtdAtz" Type="Byte" />
                                                        <asp:Parameter Name="IdSti" Type="Byte" />
                                                        <asp:Parameter Name="IoaJst" Type="String" />
                                                        <asp:Parameter Name="IdUsr" Type="Int32" />
                                                        <asp:Parameter Direction="InputOutput" Name="OutErr" Type="Byte" />
                                                    </UpdateParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 47px">
                                            <h3>&nbsp;</h3><h3>OPM selecionado&nbsp;</h3><br />
                                            <table cellspacing="0" cellpadding="0" align="left" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td style="width: 150px; height: 20px" align="right">Situação:</td>
                                                        <td style="height: 20px" width="5"></td>
                                                        <td style="height: 20px" align="left">
                                                            <span style="COLOR: #999999">&nbsp;</span>
                                                            <asp:DropDownList id="ddlSti" runat="server" Width="300px" 
                                                                OnSelectedIndexChanged="ddlSti_SelectedIndexChanged" 
                                                                AppendDataBoundItems="True" AutoPostBack="True" DataTextField="Sti_Dsc" 
                                                                DataValueField="IdSti" Enabled="False">
                                                                <asp:ListItem Value="-1">Selecione</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="height: 20px" align="left" width="20">&nbsp;</TD>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4" height="10"></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 150px; height: 28px" align="right">OPM Solicitado:</td>
                                                        <td style="height: 28px" width="5"></td>
                                                        <td style="height: 28px" align="left">
                                                            <span class="cinza-claro">&nbsp;
                                                                <asp:Label id="lblOpmSol" runat="server"></asp:Label>
                                                            </span>
                                                        </td>
                                                        <td style="height: 28px" align="left"></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4" height="10"></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 150px; height: 28px" align="right">OPM Autorizado:</td>
                                                        <td style="height: 28px" width="5"></td>
                                                        <td style="height: 28px" align="left">
                                                            <span class="cinza-claro">&nbsp;
                                                                <asp:TextBox id="txtOpmAtz" runat="server" CssClass="campo" Width="100%"></asp:TextBox>
                                                            </span>
                                                        </td>
                                                        <td style="height: 28px" align="left"></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4" height="10"></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 150px; height: 28px" align="right">Quantidade Autorizada:</td>
                                                        <td style="height: 28px" width="5"></td>
                                                        <td style="height: 28px" align="left">
                                                            <span class="cinza-claro">&nbsp;
                                                                <asp:TextBox id="txtIopQtdAtz" runat="server" CssClass="campo" Enabled="False" MaxLength="3"></asp:TextBox>
                                                            </span></td>
                                                        <td style="HEIGHT: 28px" align="left"></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4" height="10"></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 150px; height: 28px" align="right">Justificativa:</td>
                                                        <td style="height: 28px" width="5"></td>
                                                        <td style="height: 28px" align="left">
                                                            <span class="cinza-claro">&nbsp;
                                                                <asp:TextBox id="txtIoaJst" runat="server" Width="100%" MaxLength="200" 
                                                                Rows="4" TextMode="MultiLine"></asp:TextBox>
                                                            </span>
                                                        </td>
                                                        <td style="height: 28px" align="left"></td>
                                                    </tr>
                                                    <tr><td style="height: 10px" colspan="4">
                                                        &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 150px; " align="right"></td>
                                                        <td width="5"></td>
                                                        <td align="left">&nbsp;
                                                            <span class="cinza-claro">
                                                            <asp:ImageButton id="btnAtzOpm"
                                                                runat="server" ImageUrl="~/Images/bt_gravar.GIF" onclick="btnAtzOpm_Click"></asp:ImageButton></span>
                                                        </td>
                                                        <td align="left"></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4" height="10"></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <br /><br /><br /><br /><br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 47px">
                                            <asp:Image id="imgMsgOpm" runat="server" ImageUrl="../Images/ico_alert.gif" 
                                                Visible="False"></asp:Image> 
                                                <asp:Label id="lblMsgOpm" runat="server" CssClass="erro"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 47px"><br />
                                            <h3>Log dos registros das situações</h3><br />
                                            <asp:GridView id="grdOpmAud" runat="server" AutoGenerateColumns="False" 
                                                   DataSourceID="dtsIclOpmAud" OnDataBound="grd_DataBound" Width="100%" 
                                                AllowPaging="True" AllowSorting="True">
                                                <Columns>
                                                    <asp:BoundField DataField="Ioa_Dat" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Data" SortExpression="Ioa_Dat">
                                                        <ItemStyle Width="10%"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Sti_Dsc" HeaderText="Situa&#231;&#227;o" SortExpression="Sti_Dsc">
                                                        <ItemStyle Width="25%"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Usr_Nme" HeaderText="Usu&#225;rio" SortExpression="Usr_Nme">
                                                        <ItemStyle Width="25%"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Ioa_Jst" HeaderText="Justificativa" SortExpression="Ioa_Jst">
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
                                            <asp:SqlDataSource id="dtsIclOpmAud" runat="server" CancelSelectOnNullParameter="False" 
                                                    ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" SelectCommand="ssAtz_IclOpmAud" 
                                                    SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:Parameter Name="IdIop" Type="Int32"></asp:Parameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource> &nbsp; 
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" HeaderText="Consultas" ID="tabCon">
                <ContentTemplate>
                    <asp:UpdatePanel id="upnTb4" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <%--hidden buttons that are used to trigger the postbacks--%>
                            <input id="btnTb4Trigger" runat="server" type="button" style="display:none" onserverclick="btnTb4Trigger_Click" /> 
                            <br />
                            <div style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px">
                                &nbsp;
                                <br />
                                <asp:GridView id="grdCon" runat="server" DataSourceID="dtsCon" 
                                    AllowPaging="True" AutoGenerateColumns="False" 
                                    Width="100%" ondatabound="grd_DataBound" AllowSorting="True" >
                                    <Columns>
                                        <asp:BoundField DataField="Gpd_DatRel" HeaderText="Realização" 
                                            SortExpression="Gpd_DatRel" />
                                        <asp:BoundField DataField="Esp_Dsc" HeaderText="Especialidade" 
                                            SortExpression="Esp_Dsc" />
                                    </Columns>
                                    <PagerTemplate>
                                        <div height="20" align="center">
                                            <asp:ImageButton ID="ImageButton1" runat="server"
                                                        ImageUrl="~/Images/seta1_1_on.gif" CommandArgument="First" oncommand="paginateGrdCon" />&#160;&nbsp;
                                            <asp:ImageButton ID="ImageButton2" runat="server"
                                                    ImageUrl="~/Images/seta1_2_on.gif"  CommandArgument="Prev" oncommand="paginateGrdCon" />&#160;Página 
                                            <asp:DropDownList ID="ddlGridPages" runat="server" CssClass="campo"
                                                        AutoPostBack="True" onselectedindexchanged="ddlGrdConPages_SelectedIndexChanged">
                                            </asp:DropDownList>&nbsp;de 
                                            <asp:Label ID="lblPageCount" runat="server"></asp:Label> 
                                            <asp:ImageButton ID="ImageButton3" runat="server"
                                                        ImageUrl="~/Images/seta2_1_on.gif"  CommandArgument="Next" oncommand="paginateGrdCon" />&#160;&nbsp;
                                            <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Images/seta2_2_on.gif"  CommandArgument="Last" oncommand="paginateGrdCon" />
                                        </div>
                                    </PagerTemplate>
                                </asp:GridView>
                                <asp:SqlDataSource id="dtsCon" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                    SelectCommand="ssAtz_ItnCon" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="" Name="IdBnf" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" HeaderText="SP/SADT" ID="tabSdt">
                <ContentTemplate>
                    <asp:UpdatePanel id="upnTb5" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <%--hidden buttons that are used to trigger the postbacks--%>
                            <input id="btnTb5Trigger" runat="server" type="button" style="display:none" onserverclick="btnTb5Trigger_Click" /> 
                            <br />
                            <div style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px">
                                &nbsp; &nbsp;&nbsp;<br />
                                <asp:GridView id="grdSdt" runat="server" DataSourceID="dtsSdt" 
                                    AllowPaging="True" AutoGenerateColumns="False" 
                                    Width="100%" ondatabound="grd_DataBound" AllowSorting="True">
                                    <Columns>
                                        <asp:BoundField DataField="Pdm_Cod" HeaderText="Código" ReadOnly="True" 
                                            SortExpression="Pdm_Cod" />
                                        <asp:BoundField DataField="Pdm_Dsc" HeaderText="Descrição do Procedimento" ReadOnly="True" 
                                            SortExpression="Pdm_Dsc" />
                                        <asp:BoundField DataField="Gpd_DatRel" HeaderText="Realização" ReadOnly="True" 
                                            SortExpression="Gpd_DatRel" />
                                        <asp:BoundField DataField="Gia_Tip" HeaderText="Tipo" ReadOnly="True" 
                                            SortExpression="Gia_Tip" />
                                    </Columns>
                                    <PagerTemplate>
                                        <div height="20" align="center">
                                            <asp:ImageButton ID="ImageButton1" runat="server"
                                                        ImageUrl="~/Images/seta1_1_on.gif" CommandArgument="First" oncommand="paginateGrdSdt" />&#160;&nbsp;
                                            <asp:ImageButton ID="ImageButton2" runat="server"
                                                    ImageUrl="~/Images/seta1_2_on.gif"  CommandArgument="Prev" oncommand="paginateGrdSdt" />&#160;Página 
                                            <asp:DropDownList ID="ddlGridPages" runat="server" CssClass="campo"
                                                        AutoPostBack="True" onselectedindexchanged="ddlGrdSdtPages_SelectedIndexChanged">
                                            </asp:DropDownList>&nbsp;de 
                                            <asp:Label ID="lblPageCount" runat="server"></asp:Label> 
                                            <asp:ImageButton ID="ImageButton3" runat="server"
                                                        ImageUrl="~/Images/seta2_1_on.gif"  CommandArgument="Next" oncommand="paginateGrdSdt" />&#160;&nbsp;
                                            <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Images/seta2_2_on.gif"  CommandArgument="Last" oncommand="paginateGrdSdt" />
                                        </div>
                                    </PagerTemplate>
                                </asp:GridView>
                                <asp:SqlDataSource id="dtsSdt" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                    SelectCommand="ssAtz_ItnSdt" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter Name="IdBnf" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
    </div>
    
        <br />        
    <ajaxToolKit:ModalPopupExtender ID="mpePdm" runat="server" BackgroundCssClass="modalBackground"
        DropShadow="true" PopupControlID="ModalPanelPdm"  TargetControlID="btn2">
    </ajaxToolKit:ModalPopupExtender>                
    <asp:Panel ID="ModalPanelPdm" runat="server" CssClass="modalPopup" Width="830px" BackColor="White" Direction="LeftToRight" style="display:none">
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
                                                <asp:ImageButton id="btnBuscarPdm" onclick="btnBuscarPdm_Click" runat="server" 
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
                                <asp:GridView id="grdPdmPop" runat="server" DataSourceID="dtsPdm" Width="100%" 
                                        AutoGenerateColumns="False" DataKeyNames="Pdm_Cod,Pdm_Dsc,IdPdm" 
                                        OnSelectedIndexChanged="grdPdmPop_SelectedIndexChanged" 
                                        OnDataBound="grd_DataBound" AllowPaging="True" AllowSorting="True" 
                                        OnSorted="grdPdmPop_Sorted">
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
                                <asp:Label id="Label2" runat="server" Text=""></asp:Label> 
                                <h2 align="right">&nbsp;
                                    <asp:ImageButton id="ImageButton9" onclick="btn_fecharPdm_Click" runat="server" 
                                        ImageUrl="~/Images/bt_fecha.gif"></asp:ImageButton>
                                </h2>
                            </td>
                        </tr>
                    </tbody>
               </table>            
<%--            </ContentTemplate>
        </asp:UpdatePanel>--%>
    </asp:Panel>
    <br />
<%--hidden buttons that are used to trigger the postbacks--%>
    <asp:Button ID="btn2" runat="server" CssClass="linkbutton" />
</asp:Content>

