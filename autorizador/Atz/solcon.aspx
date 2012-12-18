<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="solcon.aspx.cs" Theme="Standard" Inherits="solcon" Title="Solicitação de Consulta" 
ValidateRequest="false" EnableEventValidation="false" %>
<%@ PreviousPageType VirtualPath="../Bio/biobnf.aspx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolKit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:MultiView ID="mvw" runat="server" ActiveViewIndex="0">
        <asp:View ID="vw1" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
        <tbody>
                <tr><td style="width: 1949px; height: 443px">
                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tbody>
                            <tr>
                                <td 
                                    style="padding-right: 0px; padding-left: 5px; padding-bottom: 5px; padding-top: 5px; height: 587px" 
                                    valign="top">
                                    <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody><tr>
                                            <td style="width: 752px; height: 37px;">
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%"><tbody>
                                                        <tr>
                                                        <td align="left" style="width: 9px">
                                                            <img alt="" height="37" src="../Images/tit_left.gif" width="9" /></td>
                                                        <td bgcolor="#f4f4f4"><h2>Solicitação de Consulta</h2></td>
                                                        <td align="left" width="9">
                                                            <img alt="" height="37" src="../Images/tit_right.gif" width="9" /></td></tr></tbody></table></td></tr>
                                            <tr><td style="height: 15px">&nbsp;
                                                </td></tr>
                                            <tr>
                                                <td align="left" 
                                                    style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; width: 752px; padding-top: 20px; " 
                                                    valign="top">
                                                    
                                                    <table>
                                                        <tbody>
                                                        <tr>
                                                            <td 
                                                                style="width: 477px; padding-right: 0px; padding-left: 0px; padding-bottom: 0px; padding-top: 0px;">
                                                                <h3>
                                                                    Beneficiário</h3>
                                                            </td>
                                                            <td 
                                                                style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 3px;">
                                                                &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 0px; width: 477px; height: 13px;">
                                                                    <table align="left" border="0" cellpadding="0" cellspacing="0">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td align="right" style="height: 22px" width="150">
                                                                                    Matrícula:</td>
                                                                                <td style="height: 22px" width="5">
                                                                                </td>
                                                                                <td align="left" style="height: 22px; width: 138px;">
                                                                                    <asp:TextBox ID="txtBnf_Mtr" runat="server" Width="140px" onkeypress="mascara(this,sms)" MaxLength="15"></asp:TextBox>
                                                                                </td>
                                                                                <td style="height: 22px" width="5">
                                                                                </td>
                                                                                <td style="height: 22px; width: 29px;">
                                                                                    <asp:ImageButton ID="btnOk" runat="server" ImageUrl="~/Images/bt_adicionar.gif" 
                                                                                        onclick="btnOk_Click" Height="19px" />
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
                                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 3px; height: 13px;">
                                                                    </td>
                                                            </tr>
                                                            <tr>
                                                                <td 
                                                                    style="padding-right: 0px; padding-left: 150px; padding-bottom: 0px; width: 477px; padding-top: 0px">
                                                                    <div class="resultado-beneficiario">
                                                                        <asp:Label ID="lblBnf" runat="server"></asp:Label>
                                                                    </div>
                                                                </td>
                                                                <td 
                                                                    style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 3px">
                                                                    <asp:LinkButton ID="lblAlterarBnf" runat="server" onclick="lbtBuscar_Click">Alterar beneficiário</asp:LinkButton>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 477px; padding-right: 0px; padding-left: 0px; padding-bottom: 0px; padding-top: 0px;" colspan="2">
                                                                    <asp:UpdatePanel runat="server" ID="upnDoc" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td align="right" style="height: 22px" width="150">
                                                                                        &nbsp;</td>
                                                                                    <td style="height: 22px" width="5">
                                                                                        &nbsp;</td>
                                                                                    <td align="left" style="height: 22px; width: 400px;">
                                                                                        <asp:Label ID="lblSolInf" runat="server"></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="right" style="height: 22px" width="150">
                                                                                        &nbsp;</td>
                                                                                    <td style="height: 22px" width="5">
                                                                                    </td>
                                                                                    <td align="left" style="height: 22px; width: 400px;">
                                                                                        <span class="cinza-claro">
                                                                                        <asp:RadioButtonList ID="rblTipDoc" runat="server" AutoPostBack="True" 
                                                                                            onselectedindexchanged="rblGiaCrt_SelectedIndexChanged" 
                                                                                            RepeatDirection="Horizontal">
                                                                                            <asp:ListItem Selected="True" Value="IDD">Identidade</asp:ListItem>
                                                                                            <asp:ListItem Value="CPF">CPF</asp:ListItem>
                                                                                        </asp:RadioButtonList>
                                                                                        </span>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="right" style="height: 22px" width="150">
                                                                                        &nbsp;</td>
                                                                                    <td style="height: 22px" width="5">
                                                                                        &nbsp;</td>
                                                                                    <td align="left" style="height: 22px; width: 400px;">
                                                                                        <asp:TextBox ID="txtSolInf" runat="server" Width="300px" MaxLength="30" 
                                                                                            Visible="True"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                    <br />
                                                                    <asp:Panel runat="server" ID="pnlBio" Visible="false">
                                                                        <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td align="right" style="height: 22px" width="150">
                                                                                        </td>
                                                                                    <td style="height: 22px" width="5">
                                                                                        <%--<asp:ImageButton ID="ibtBio" runat="server" 
                                                                                            ImageUrl="~/Images/bt_ident_biometrica.jpg" onclick="ibtBio_Click" /></td>--%>
                                                                                    <td align="left" style="height: 22px; width: 400px;">                                                                                       
                                                                                        <asp:Label runat="server" ID="lblBio" CssClass="erro"></asp:Label> 
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>                                                                        
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>     
                                                </td></tr>
                                            <tr>
                                                <td align="left" 
                                                    style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; width: 752px; padding-top: 20px; " 
                                                    valign="top">
                                                    <h3>
                                                        Geral
                                                    </h3>
                                                    <br />
                                                    <asp:UpdatePanel ID="upnGeral" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>                                                        
                                                        <table align="left" border="0" cellpadding="0" cellspacing="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td align="right" style="height: 20px" width="150">
                                                                        Caráter da Solicitação:</td>
                                                                    <td style="height: 20px" width="5">
                                                                    </td>
                                                                    <td align="left" style="height: 20px">
                                                                        <span class="cinza-claro">
                                                                        <asp:RadioButtonList ID="rblGiaCrt" runat="server" AutoPostBack="True" 
                                                                            onselectedindexchanged="rblGiaCrt_SelectedIndexChanged" 
                                                                            RepeatDirection="Horizontal">
                                                                            <asp:ListItem Selected="True" Value="E">Eletiva</asp:ListItem>
                                                                            <asp:ListItem Value="U">Urgência</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                        </span>
                                                                    </td>
                                                                    <td align="left" style="height: 20px" width="20">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="4" height="10">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" style="height: 20px" width="150">
                                                                        Profissional:</td>
                                                                    <td style="height: 20px" width="5">
                                                                    </td>
                                                                    <td align="left" style="height: 20px">
                                                                        &nbsp;<asp:DropDownList ID="ddlPrf" runat="server" AppendDataBoundItems="True" 
                                                                            AutoPostBack="True" CssClass="campo" DataTextField="Prf_Nme" 
                                                                            DataValueField="IdPrf" OnSelectedIndexChanged="ddlPrf_SelectedIndexChanged" 
                                                                            Width="300px">
                                                                            <asp:ListItem Value="-1">Selecione</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td align="left" style="height: 20px" width="20">
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="4" height="10">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" style="height: 20px" width="150">
                                                                        Especialidade:</td>
                                                                    <td style="HEIGHT: 20px" width="5">
                                                                    </td>
                                                                    <td align="left" style="height: 20px">
                                                                        &nbsp;<asp:DropDownList ID="ddlEsp" runat="server" AppendDataBoundItems="True" 
                                                                            CssClass="campo" DataTextField="Esp_Dsc" 
                                                                            DataValueField="IdEsp" 
                                                                            Width="300px">
                                                                            <asp:ListItem Value="-1">Selecione</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td align="left" style="height: 20px" width="20">
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="4" height="10">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" style="height: 28px" width="150">
                                                                        Procedimento:</td>
                                                                    <td style="height: 28px" width="5">
                                                                    </td>
                                                                    <td align="left" colspan="2" style="height: 28px">
                                                                        <span class="cinza-claro">&nbsp;<asp:Label ID="lblPdmCod" runat="server"></asp:Label>
                                                                        -<asp:Label ID="lblPdmDsc" runat="server"></asp:Label>
                                                                        </span>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" 
                                                    style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; width: 752px; padding-top: 10px; " 
                                                    valign="top">
                                                    <table align="left" border="0" cellpadding="0" cellspacing="0">
                                                        <tbody>
                                                            <tr>
                                                                <td align="right" style="height: 24px; width: 150px;">
                                                                    Produto:</td>
                                                                <td style="height: 24px" width="5">
                                                                    &nbsp;</td>
                                                                <td align="left" colspan="7" style="width: 60px; height: 24px" valign="middle">
                                                                    <span class="cinza-claro">&nbsp;<asp:Label ID="lblPrd" runat="server"></asp:Label>
                                                                    </span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4" height="10">
                                                                    </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" style="height: 24px; width: 150px;">
                                                                    Data da Solicitação:</td>
                                                                <td style="height: 24px" width="5">
                                                                </td>
                                                                <td align="left" style="width: 60px; height: 24px">
                                                                    
                                                                    <span class="cinza-claro">
                                                                    <asp:TextBox ID="txtDatEms" runat="server" CssClass="cinza-claro" 
                                                                        Enabled="False" Width="72px"></asp:TextBox>
                                                                    </span>
                                                                    
                                                                </td>
                                                                <td style="height: 24px" width="10">
                                                                </td>
                                                                <td style="height: 24px">
                                                                    Hora:</td>
                                                                <td style="height: 24px" width="10">
                                                                </td>
                                                                <td style="height: 24px; width: 45px;">
                                                                    <asp:TextBox ID="txtHor" runat="server" CssClass="campo" Width="30px"></asp:TextBox>
                                                                    :
                                                                </td>
                                                                <td style="width: 10px; height: 24px">
                                                                    <asp:TextBox ID="txtMin" runat="server" CssClass="campo" Width="30px"></asp:TextBox>
                                                                </td>
                                                                <td align="left" style="width: 20px; height: 24px">
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" colspan="9">
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" colspan="9" height="25">
                                                                    <span class="erro">
                                                                    <asp:Image ID="imgMsg" runat="server" ImageUrl="../Images/ico_alert.gif" 
                                                                        Visible="False" />
                                                                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                                                    </span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" colspan="9">
                                                                &nbsp;
                                                                    </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" colspan="9" 
                                                                    style="padding-right: 0px; padding-left: 150px; padding-bottom: 0px; padding-top: 0px; height: 19px">
                                                                    <asp:ImageButton ID="btnSolAtz" runat="server" 
                                                                        ImageUrl="../Images/bt_solicitar_autorizacao.gif" 
                                                                        onclick="btnSolAtz_Click" style="height: 19px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" colspan="9">
                                                                    <asp:SqlDataSource ID="dts" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                                                        ProviderName="<%$ ConnectionStrings:AppConnectionString.ProviderName %>" 
                                                                        UpdateCommand="ssItg_VldPdmBnf" UpdateCommandType="StoredProcedure" 
                                                                        onupdated="dts_Updated">
                                                                        <UpdateParameters>
                                                                            <asp:Parameter Name="CodigoUsuario" Type="String" />
                                                                            <asp:Parameter Name="CodigoServico" Type="String" />
                                                                            <asp:Parameter Name="Out_Atz" Type="Boolean" Direction="InputOutput" />
                                                                            <asp:Parameter Name="Out_Car" Type="DateTime" Direction="InputOutput" />
                                                                        </UpdateParameters>
                                                                    </asp:SqlDataSource>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            </tbody></table></td></tr>
                            <tr>
                                <td style="width: 752px; height: 14px;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 752px; height: 14px">
                                </td>
                            </tr>
                        </tbody></table></td></tr>
            </tbody>
        </table>
        <ajaxToolKit:ModalPopupExtender id="ModalPopupExtender1" runat="server" TargetControlID="lbtBuscar" PopupControlID="ModalPanel" DropShadow="true" BackgroundCssClass="modalBackground"></ajaxToolKit:ModalPopupExtender> 
        <asp:Panel id="ModalPanel" runat="server" CssClass="modalPopup" Width="830px" Direction="LeftToRight" BackColor="White">
<%--        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
            <table style="border-right: #ce5c09 thin double; border-top: #ce5c09 thin double; border-left: #ce5c09 thin double; width: 100%; border-bottom: #ce5c09 thin double; BACKGROUND-COLOR: #ffffff">
                <tbody>
                    <tr>
                        <td style="width: 937px; height: 45px">
                            <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tbody>
                                    <tr>
                                        <td align="left" style="width: 9px; height: 37px;">
                                            <img alt="" height="37" src="../Images/tit_left.gif" width="9" /></td>
                                        <td style="height: 37px;" bgcolor="#f4f4f4">
                                            <h2>Busca de Beneficiário</h2></td>
                                        <td align="left" style="WIDTH: 9px; height: 37px;">
                                            <img alt="" height="37" src="../Images/tit_right.gif" width="9" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr><td style="width: 937px; " height="15"></td></tr><tr>
                              <td align="center" 
                          style="padding-right: 10px; padding-left: 0px; padding-bottom: 0px; width: 937px; padding-top: 0px; height: 47px" 
                          valign="middle"><table border="0" cellpadding="0" cellspacing="0"><tbody>
                                          <tr><td align="right" style="height: 22px">Nome:&nbsp;</td>
                                              <td align="right" style="width: 140px; height: 22px">
                                                  <asp:TextBox ID="txtBnf_NmePop" runat="server" 
                          CssClass="campo" Width="140px"></asp:TextBox></td>
                                              <td align="left" style="height: 22px" valign="top" width="78"></td>
                                              <td align="right" style="height: 22px">Matrícula:&nbsp;</td>
                                              <td align="right" 
                          style="height: 22px" width="140">
                                                  <asp:TextBox ID="txtBnf_MtrPop" runat="server" Width="140px" onkeypress="mascara(this,sms)" MaxLength="15"></asp:TextBox></td>
                                              <td align="left" 
                                                  style="padding-right: 0px; padding-left: 5px; padding-bottom: 0px; padding-top: 0px; height: 22px" 
                                                  valign="top" width="78">
                                                  <asp:ImageButton ID="btnBuscar" runat="server" 
                                                      ImageUrl="../Images/bt_buscar.gif" onclick="btnBuscar_Click"></asp:ImageButton></td></tr></tbody></table>
                                  <br /></td></tr>
                          <tr><td align="center" style="padding: 0px 4px 0px 4px;" valign="middle">
                              <asp:GridView ID="grd" runat="server" AllowPaging="True" AllowSorting="True" 
                                  AutoGenerateColumns="False" CssClass="grid-view-left" 
                                  DataKeyNames="IdBnf,Bnf_Mtr,Bnf_Nme,Prd_Nme,IdRde,Bnf_IdTit,Bnf_Idd,Bnf_Bio" 
                                  DataSourceID="dtsBnf" OnDataBound="grd_DataBound" 
                                  OnRowCreated="gvHover_RowCreated" OnRowDataBound="grd_RowDataBound" 
                                  OnSelectedIndexChanged="grd_SelectedIndexChanged" OnSorted="grd_Sorted" 
                                  Width="100%">
                                  <Columns>
                                      <asp:BoundField DataField="Bnf_Mtr" HeaderText="Matrícula" 
                                          SortExpression="Bnf_Mtr">
                                          <ItemStyle Width="20%" />
                                      </asp:BoundField>
                                      <asp:ButtonField CommandName="Select" DataTextField="Bnf_Nme" 
                                          HeaderText="Nome do Beneficiário" SortExpression="Bnf_Nme" Text="Button">
                                          <ItemStyle Width="50%" />
                                      </asp:ButtonField>
                                      <asp:BoundField DataField="Prd_Nme" HeaderText="Produto" 
                                          SortExpression="Prd_Nme">
                                          <ItemStyle Width="30%" />
                                      </asp:BoundField>
                                  </Columns>
                                  <PagerTemplate>
                                      <div align="center" height="20">
                                          <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument="First" 
                                              ImageUrl="~/Images/seta1_1_on.gif" OnCommand="Paginategrd" />
                                          &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CommandArgument="Prev" 
                                              ImageUrl="~/Images/seta1_2_on.gif" OnCommand="Paginategrd" />
                                          Página
                                          <asp:DropDownList ID="ddlPages" runat="server" AutoPostBack="True" 
                                              CssClass="campo" OnSelectedIndexChanged="ddlPages_SelectedIndexChanged">
                                          </asp:DropDownList>
                                          de
                                          <asp:Label ID="lblPageCount" runat="server"></asp:Label>
                                          &nbsp;<asp:ImageButton ID="ImageButton3" runat="server" CommandArgument="Next" 
                                              ImageUrl="~/Images/seta2_1_on.gif" OnCommand="Paginategrd" />
                                          &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CommandArgument="Last" 
                                              ImageUrl="~/Images/seta2_2_on.gif" OnCommand="Paginategrd" />
                                      </div>
                                  </PagerTemplate>
                              </asp:GridView>
                              <br />
                    <asp:Label ID="lblEmptyGrid" runat="server"></asp:Label>
                              <br />
                              <asp:SqlDataSource ID="dtsBnf" runat="server" 
                                  CancelSelectOnNullParameter="False" 
                                  ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                  SelectCommand="ssAtz_Bnf" SelectCommandType="StoredProcedure">
                                  <SelectParameters>
                                      <asp:Parameter Name="Bnf_Mtr" Type="String" />
                                      <asp:Parameter Name="Bnf_Nme" Type="String" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                    <h2 align="right">&nbsp;<asp:ImageButton ID="btn_fechar" runat="server" 
                              ImageUrl="~/Images/bt_fecha.gif" onclick="btn_fechar_Click"></asp:ImageButton></h2></td></tr>
                </tbody>
            </table>
<%--            </ContentTemplate>
        </asp:UpdatePanel>--%>
    </asp:Panel>
    
        </asp:View>
        <asp:View ID="vw2" runat="server">
        <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td style="width: 1002px">
            <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="left" width="9">
                        <img alt="" height="37" src="../Images/tit_left.gif" width="9" /></td>
                    <td bgcolor="#f4f4f4">
                        <h2>
                            Solicitação de Consulta</h2>
                    </td>
                    <td align="left" width="9">
                        <img alt="" height="37" src="../Images/tit_right.gif" width="9" /></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td height="15" style="width: 1002px">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 1002px; height: 27px;" valign="middle">
            <span class="erro">
                <asp:Image ID="Image1" runat="server" ImageUrl="../Images/ico_alert.gif" Visible="False" />
                <asp:Label ID="Label1" runat="server"></asp:Label>&nbsp;</span></td>
    </tr>
    <tr>
        <td align="left" style="width: 1002px" valign="top">
            <br />
            <br />
            <asp:Panel ID="pnlAtz" runat="server">
            <table align="center" border="0" cellpadding="20" cellspacing="0" width="95%">
                <tr bgcolor="#f4f4f4">
                    <td width="1%" style="height: 77px">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="height: 23px">
                                    <img alt="" height="23" src="../Images/ico_autorizada.gif" style="float: left" width="25" />
                                    &nbsp;</td>
                                <td style="height: 23px">
                                    <strong>Solicitação Autorizada - <span class="numero-solicitacao">Senha:
                                        <asp:Label ID="lblSnh" runat="server"></asp:Label>
                                    </span></strong></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td align="left">
                        &nbsp;
                        &nbsp;<asp:ImageButton ID="btnNewSol" runat="server" ImageUrl="../Images/bt_nova_solicitacao.gif" OnClick="btnNewSol_Click" /></td>
                </tr>
            </table>
            </asp:Panel>
            <br />
            <br />
            <asp:Panel ID="pnlPen" runat="server">
            <table align="center" border="0" cellpadding="20" cellspacing="0" width="95%">
                <tr bgcolor="#f4f4f4">
                    <td width="1%">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="top">
                                    <img alt="" height="23" src="../Images/ico_negada.gif" style="float: left" width="25" />
                                    &nbsp;</td>
                                <td style="padding-right: 0px; padding-left: 0px; padding-bottom: 0px; padding-top: 5px"
                                    valign="top">
                                    <strong>SOLICITAÇÃO PENDENTE - BENEFICIÁRIO DEVE BUSCAR AUTORIZAÇÃO NO SM SAÚDE<br />
                                    </strong><br />
                                    <br />
                                    <br />
                                    <strong>Motivos:</strong>
                                    <blockquote>
                                        <asp:BulletedList ID="btlMsg" runat="server" CssClass="vermelhonormal" DataTextField="Msg_DscAtz"
                                            DataValueField="Msg_DscAtz">
                                        </asp:BulletedList>
                                        &nbsp;</blockquote>
                                    <br />
                                    <strong>Entre em contato com a Central SM Saúde no telefone 0800 286 3320 </strong>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr bgcolor="#ffffff">
                    <td align="left"><asp:ImageButton ID="btnNewSol2" runat="server" ImageUrl="../Images/bt_nova_solicitacao.gif" OnClick="btnNewSol_Click" /></td>
                </tr>
            </table>
            </asp:Panel>
            <br />
            <asp:HiddenField ID="hdfIdBnf" runat="server" />
            <asp:HiddenField ID="hdfIdGia" runat="server" />
            <asp:HiddenField ID="hdfIdRde" runat="server" />
            <asp:HiddenField ID="hdfIdPdm" runat="server" />
        </td>
    </tr>
</table>
</asp:View>
</asp:MultiView>
</asp:Content>


