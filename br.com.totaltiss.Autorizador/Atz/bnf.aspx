<%@ Page Title="" Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Inherits="Atz_bnf" Codebehind="bnf.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolKit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

<script type="text/javascript">
    $(function() {
        $("#accordion").accordion();
    });    
</script>
<div id="pesquisa">
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
            </tbody>
        </table>
        <br />
</div>

<div id="accordion">
	<h3><a href="#">Informações Pessoais</a></h3>
	<div>
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
                                <td style="height: 14px" align="right" width="22%">Matrícula:</td>
                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 14px" align="left">
                                    <span class="cinza-escuro"><asp:Label id="lblBnfMtr" runat="server"></asp:Label></span>
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
                                <td style="height: 16px" align="right" width="22%">Beneficiário:</td>
                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 16px" align="left">
                                    <span class="cinza-escuro"><asp:Label id="lblBnfNme" runat="server"></asp:Label></span>
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
                                <td style="height: 16px" align="right" width="22%">Idade:</td>
                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 16px" align="left">
                                    <span class="cinza-escuro"><asp:Label id="lblBnfIdd" runat="server"></asp:Label></span>
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
                                <td style="height: 28px" align="right" width="22%">Data de nascimento:</td>
                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 28px" align="left">
                                    <span class="cinza-escuro"><asp:Label id="lblBnfDatNas" runat="server"></asp:Label></span>
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
                            <tr><td style="height: 14px" align="right" width="22%">Sexo:</td>
                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 14px" align="left">
                                    <span class="cinza-escuro"><asp:Label id="lblBnfSxo" runat="server"></asp:Label></span>
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
                                <td style="width: 22%; height: 16px" align="right">Titularidade:</td>
                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 16px" align="left">
                                    <span class="cinza-escuro"><asp:Label id="lblBnfTit" runat="server"></asp:Label></span>
                                </td>
                            </tr>
                        </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
	</div>
	<h3><a href="#">Contrato</a></h3>
	<div>
        <br />
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
                                <td style="height: 14px" align="right" width="22%">Produto:</td>
                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 14px" align="left">
                                    <span class="cinza-escuro"><asp:Label id="lblPrdNme" runat="server"></asp:Label></span>
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
                                <td style="height: 16px" align="right" width="22%">Posição Financeira:</td>
                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 16px" align="left">
                                    <span class="cinza-escuro"><asp:Label id="lblBnfPosFin" runat="server"></asp:Label></span>
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
                                <td style="height: 16px" align="right" width="22%">Situação:</td>
                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 16px" align="left">
                                    <span class="cinza-escuro"><asp:Label id="lblBnfSit" runat="server"></asp:Label></span>
                                </td>
                            </tr>
                        </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
        <br />
	</div>
	<h3><a href="#">Biometria</a></h3>
	<div>
        <br />
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
                                <td style="height: 14px" align="right" width="22%">Elegibilidade via Biometria:</td>
                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 14px" align="left">
                                    <span class="cinza-escuro"><asp:Label id="lblBnfBio" runat="server"></asp:Label></span>
                                </td>
                            </tr>
                        </tbody>
                        </table>
                    </td>
                </tr>
                
                <tr>
                    <td style="padding-right: 10px; border-top: #fff 1px solid; padding-left: 10px; padding-bottom: 0px; width: 899px; padding-top: 0px" valign="middle" align="right" bgColor="#f4f4f4" height="26">
                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tbody>
                            <tr>
                                <td style="height: 14px" align="right" width="22%">&nbsp;</td>
                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 14px" align="left">
                                                                                        <asp:Label runat="server" 
                                        ID="lblBio" CssClass="erro"></asp:Label> 
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
                                <td style="height: 16px" align="right" width="22%">&nbsp;</td>
                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 16px" align="left">
                                        <asp:ImageButton ID="btnAtivar" runat="server" ImageUrl="~/Images/bt_ativar.gif" 
                                            onclick="btnAtivar_Click" />
                                        &nbsp;<asp:ImageButton ID="btnAlterar" runat="server" ImageUrl="~/Images/bt_alterar.gif" 
                                            onclick="btnAtivar_Click" Visible="False" />
                                        &nbsp;<asp:ImageButton ID="btnDesativar" runat="server" ImageUrl="~/Images/bt_desativar.jpg" 
                                            onclick="btnDesativar_Click" />
                                    </td>
                            </tr>
                         </tbody>
                         </table>
                     </td>
                </tr>
                
                <tr>
                    <td style="padding-right: 10px; border-top: #fff 1px solid; padding-left: 10px; padding-bottom: 0px; width: 899px; padding-top: 0px" valign="middle" align="right" bgColor="#e6e6e6" height="26">
                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tbody>
                            <tr>
                                <td style="height: 16px" align="right" width="22%">&nbsp;</td>
                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 16px" align="left">
                                    &nbsp;</td>
                            </tr>
                        </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:HiddenField ID="hdfIdBnf" runat="server" />
        <br />
	</div>
</div>

        <ajaxtoolkit:modalpopupextender id="ModalPopupExtender1" runat="server"
        TargetControlID="lbtBuscar" PopupControlID="ModalPanel" DropShadow="true" 
        BackgroundCssClass="modalBackground"></ajaxtoolkit:modalpopupextender> 
        <asp:Panel id="ModalPanel" runat="server" CssClass="modalPopup" Width="830px" Direction="LeftToRight" BackColor="White">
<%--        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
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
                                  DataKeyNames="IdBnf,Bnf_Mtr,Bnf_Nme,Prd_Nme,IdRde,Bnf_IdTit,Bnf_Idd" 
                                  DataSourceID="dtsBnf" OnDataBound="grd_DataBound" 
                                  OnRowCreated="gvHover_RowCreated" 
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
                                  SelectCommand="ssAtz_Bnf" SelectCommandType="StoredProcedure" 
                                  UpdateCommand="UPDATE dbo.Atz_Bnf SET Bnf_Bio = @Bnf_Bio WHERE IdBnf = @IdBnf">
                                  <SelectParameters>
                                      <asp:Parameter Name="Bnf_Mtr" Type="String" />
                                      <asp:Parameter Name="Bnf_Nme" Type="String" />
                                  </SelectParameters>
                                  <UpdateParameters>
                                      <asp:Parameter Name="Bnf_Bio" Type="Boolean"/>
                                      <asp:ControlParameter ControlID="hdfIdBnf" Name="IdBnf" PropertyName="Value" />
                                  </UpdateParameters>
                              </asp:SqlDataSource>
                    <h2 align="right">&nbsp;<asp:ImageButton ID="btn_fechar" runat="server" 
                              ImageUrl="~/Images/bt_fecha.gif" onclick="btn_fechar_Click"></asp:ImageButton></h2></td></tr>
                </tbody>
            </table>
<%--            </ContentTemplate>
        </asp:UpdatePanel>--%>
    </asp:Panel>

</asp:Content>

