<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="auditn.aspx.cs" Inherits="Atz_auditn" Theme="Standard" Title="Página Inicial de Atendente - Solicitações Autorizadas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolKit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server"> 
    <asp:UpdatePanel id="updPnlTb1" runat="server" >
        <ContentTemplate> 
            <table>
                <tbody>
                    <tr>
                        <td colspan="2">
                            <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="left" style="width: 8px">
                                        <img alt="" height="37" src="../images/tit_left.gif" width="9" /></td>
                                    <td bgcolor="#f4f4f4">
                                        <h2>Auditoria Internação</h2>
                                    </td>
                                    <td align="left" width="9">
                                        <img alt="" height="37" src="../images/tit_right.gif" width="9" /></td>
                                </tr>
                            </table>            
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"></td>
                    </tr>
                    <tr>
                        <td 
                            style="width: 477px; padding-right: 0px; padding-left: 0px; padding-bottom: 0px; padding-top: 0px;">
                            <h3>
                                Contratado</h3>
                        </td>
                        <td 
                            style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 3px;">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 477px; padding-right: 0px; padding-left: 0px; padding-bottom: 0px; padding-top: 0px;">
                            <table align="left" border="0" cellpadding="0" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td align="right" style="height: 22px" width="100">
                                            Matrícula:</td>
                                        <td style="height: 22px" width="5">
                                        </td>
                                        <td align="left" style="height: 22px; width: 138px;">
                                            <asp:TextBox ID="txtIdCtt" runat="server" Width="140px"></asp:TextBox>
                                        </td>
                                        <td style="height: 22px" width="5">
                                        </td>
                                        <td style="height: 22px; width: 29px;">
                                            <asp:ImageButton ID="btnOk" runat="server" ImageUrl="~/Images/bt_ok_login.gif" 
                                                onclick="btnOk_Click" />
                                        </td>
                                        <td style="height: 22px" width="10">
                                        </td>
                                        <td style="height: 22px; width: 86px;">
                                            <asp:LinkButton ID="lbtBuscar" runat="server" onclick="lbtBuscar_Click">Busca avançada</asp:LinkButton>
                                        </td>
                                        <td style="height: 22px" width="10">
                                        </td>
                                        <td align="left" style="height: 22px" width="20">
                                            &nbsp;</td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 3px;">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td 
                            style="padding-right: 0px; padding-left: 100px; padding-bottom: 0px; width: 477px; padding-top: 0px">
                            <div class="resultado-beneficiario">
                                <asp:Label ID="lblIdCtt" runat="server"></asp:Label>-
                                <asp:Label ID="lblCttNme" runat="server"></asp:Label>
                            </div>
                        </td>
                        <td 
                            style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 3px">
                            <asp:LinkButton ID="lblRemCtt" runat="server" onclick="lblRemCtt_Click">Retirar contratado</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:RadioButtonList runat="server" ID="rblTip" RepeatDirection="Horizontal" AutoPostBack="True">
                                <asp:ListItem Value="0">Todas</asp:ListItem>
                                <asp:ListItem Value="1">Internações em aberto</asp:ListItem>
                                <asp:ListItem Value="2">Prorrogações em aberto</asp:ListItem>
                                <asp:ListItem Value="3">Internados</asp:ListItem>
                            </asp:RadioButtonList>            
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:GridView id="grdItn" runat="server"
                                    DataSourceID="dtsItn" AllowPaging="True" 
                                    AutoGenerateColumns="False" Width="100%" 
                                    AllowSorting="True" ondatabound="grd_DataBound" 
                                    DataKeyNames="IdIcl">
                                <Columns>
                                    <asp:HyperLinkField DataNavigateUrlFields="IdIcl" DataNavigateUrlFormatString="auditndet.aspx?Icl={0}"
                                            DataTextField="Bnf_Nme" HeaderText="Beneficiário" SortExpression="Bnf_Nme" />
                                    <asp:BoundField DataField="Prf_Nme" HeaderText="Profissional" SortExpression="Prf_Nme" />
                                    <asp:BoundField DataField="Gia_Crt" HeaderText="Caráter" SortExpression="Gia_Crt" />
                                    <asp:BoundField DataField="Itn_Dat" HeaderText="Solicitação" SortExpression="Itn_Dat" DataFormatString="{0:dd/MM/yyyy}" />
                                    <asp:BoundField DataField="Itn_DatSol" HeaderText="Prov. Adm." SortExpression="Itn_DatSol" DataFormatString="{0:dd/MM/yyyy}"/>                                    
                                    <asp:BoundField DataField="Itn_Tip" HeaderText="Tipo" SortExpression="Itn_Tip" ReadOnly="True"></asp:BoundField>
                                    <asp:BoundField DataField="Sti_Dsc" HeaderText="Situação" SortExpression="Sti_Dsc" ReadOnly="True"></asp:BoundField>
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
                            <asp:SqlDataSource id="dtsItn" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                SelectCommand="ssAtz_AudItn" SelectCommandType="StoredProcedure" 
                                CancelSelectOnNullParameter="False">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="rblTip" Name="Itn_Fit" 
                                        PropertyName="SelectedValue" Type="Byte" />
                                    <asp:ControlParameter ControlID="lblIdCtt" Name="IdCtt" PropertyName="Text" 
                                        Type="Int64" />
                                    <asp:Parameter Name="SeqEnd" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource> 
                        </td>
                    </tr>
                </tbody>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <br />
    <br />
    <br />
    
    <ajaxToolKit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground"
        DropShadow="true" PopupControlID="ModalPanel"  TargetControlID="btn1" CancelControlID="btnClosePop" >
    </ajaxToolKit:ModalPopupExtender>                
    <asp:Panel ID="ModalPanel" runat="server" CssClass="modalPopup"  Width="830px" BackColor="White" Direction="LeftToRight">
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
                                        <h2>Busca de contratado</h2>
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
                                    <td style="height: 22px" align="right">Nome:&nbsp;</td>
                                    <td style="width: 140px; height: 22px" align="right">
                                        <asp:TextBox id="txtCtt_NmePop" runat="server" CssClass="campo" Width="140px"></asp:TextBox>
                                    </td>
                                    <td style="height: 22px" valign="top" align="left" width="78"></td>
                                    <td style="width: 56px; height: 22px" align="right">Código:&nbsp;</td>
                                    <td style="height: 22px" align="right" width="140">
                                        <asp:TextBox id="txtCtt_MtrPop" runat="server" Width="140px"></asp:TextBox>
                                    </td>
                                    <td style="padding-right: 0px; padding-left: 5px; padding-bottom: 0px; padding-top: 0px; height: 22px" valign="top" align="left" width="78">
                                        <asp:ImageButton id="btnBuscar" onclick="btnBuscar_Click" runat="server" ImageUrl="../Images/bt_buscar.gif"></asp:ImageButton>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="padding: 0px 4px 0px 4px;" valign="middle" align="center">
                        <asp:GridView id="grdCtt" runat="server" DataSourceID="dtsCtt" Width="100%" 
                                AutoGenerateColumns="False" DataKeyNames="IdCtt,Ctt_Nme" 
                                OnSelectedIndexChanged="grd_SelectedIndexChanged" 
                                OnDataBound="grd_DataBound" AllowPaging="True" AllowSorting="True" 
                            onsorted="grdCtt_Sorted">
                            <Columns>
                                <asp:BoundField DataField="IdCtt" HeaderText="Matrícula" SortExpression="IdCtt" ReadOnly="True">
                                    <ItemStyle Width="15%" />
                                </asp:BoundField>
                                <asp:ButtonField CommandName="Select" DataTextField="Ctt_Nme" Text="Button" HeaderText="Contratado" SortExpression="Ctt_Nme">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" Width="60%" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="Ctt_Tel" HeaderText="Telefone" SortExpression="Ctt_Tel" >
                                    <ItemStyle Width="25%" />
                                </asp:BoundField>
                            </Columns>
                            <PagerTemplate>
                                <div height="20">
                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument="First" ImageUrl="~/Images/seta1_1_on.gif"
                                        OnCommand="paginateGrdCtt" />
                                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CommandArgument="Prev" ImageUrl="~/Images/seta1_2_on.gif"
                                        OnCommand="paginateGrdCtt" />
                                    Página
                                    <asp:DropDownList ID="ddlGridPages" runat="server" AutoPostBack="True" CssClass="campo"
                                        OnSelectedIndexChanged="ddlGrdCttPages_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    de
                                    <asp:Label ID="lblPageCount" runat="server"></asp:Label>
                                    &nbsp;<asp:ImageButton ID="ImageButton3" runat="server" CommandArgument="Next" ImageUrl="~/Images/seta2_1_on.gif"
                                        OnCommand="paginateGrdCtt" />
                                    &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CommandArgument="Last" ImageUrl="~/Images/seta2_2_on.gif"
                                        OnCommand="paginateGrdCtt" />
                                </div>
            
                            </PagerTemplate>
                        </asp:GridView> 
                        <asp:SqlDataSource id="dtsCtt" runat="server" 
                            SelectCommandType="StoredProcedure" SelectCommand="ssAtz_Ctt" 
                            ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                            CancelSelectOnNullParameter="False">
                            <SelectParameters>
                                <asp:Parameter Name="IdCtt" Type="Int64" />
                                <asp:Parameter Name="Ctt_Nme" Type="String" />
                                <asp:Parameter Name="Ctt_NmeRsm" Type="String" />
                                <asp:Parameter Name="Ctt_Doc" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource> 
                        <asp:Label id="lblEmptyGrid" runat="server" Text=""></asp:Label> 
                        <h2 align="right">&nbsp;
                            <asp:ImageButton id="btnClosePop" runat="server" 
                                ImageUrl="~/Images/bt_fecha.gif"></asp:ImageButton>
                        </h2>
                    </td>
                </tr>
            </tbody>
       </table>
    </asp:Panel>
    <%--O TargetId do modalpopuextente não pode estar invisível, se estiver o popup é exibido no page load--%>
    <asp:Button ID="btn1" runat="server" CssClass="linkbutton" />
</asp:Content>