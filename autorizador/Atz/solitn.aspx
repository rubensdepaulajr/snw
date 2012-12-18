<%@ Page Language="C#" MasterPageFile="~/atz.master" AutoEventWireup="true" CodeFile="solitn.aspx.cs"  Theme="Standard" Inherits="Atz_solitn" Title="Solicitação Internação" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>--%>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
            <tr>
                <td style="width: 9px" align="left"><img height="37" alt="" src="../Images/tit_left.gif" width="9" /></td>
                <td bgColor="#f4f4f4"><h2>Solicitação de Internação</h2></td>
                <td style="width: 9px" align="left"><img height="37" alt="" src="../Images/tit_right.gif" width="9" /></td>
            </tr>
        </tbody>
    </table>
    <br />
<table cellspacing="0" cellpadding="0" align="left" border="0">
<tbody>
    <tr>
        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px" valign="middle" colspan="3" height="35">
            <strong>GERAL</srtong></td>
    </tr>
    <tr>
        <td align="right" height="10">Beneficiário:</td>
        <td style="width: 5px"></td>
        <td align="left"><span class="cinza-escuro"><asp:Label id="lblBnf_Mtr" runat="server"></asp:Label>-<asp:Label id="lblBnf_Nme" runat="server"></asp:Label></span></td>
    </tr>
    <tr>
        <td colspan="3" height="5px"></td>
    </tr>
    <tr>
        <td align="right" height="10">Profissional:</td>
        <td style="width: 5px"></td>
        <td align="left"><asp:Label id="lblIdPrf" runat="server" Height="14px"></asp:Label> - <asp:Label id="lblPrf_Nme" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td colspan="3" height="5"></td>
    </tr>
    <tr>
        <td style="height: 14px" align="right" >Especialidade:</td>
        <td style="width: 5px; height: 14px"></td>
        <td style="height: 14px" align="left"><asp:Label id="lblIdEsp" runat="server"></asp:Label>-<asp:Label id="lblEsp_Dsc" runat="server" Height="14px"></asp:Label></td>
    </tr>
    <tr>
        <td valign="middle" colspan="3" height=""><br /></td>
    </tr>
    <tr>
        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px" valign="middle" colspan="3" height="35"><strong>DADOS DA SOLICITAÇÃO</strong></td>
    </tr>
    <tr>
        <td colspan="3" height="5"></td>
    </tr>
    <tr>
        <td align="right" height="10">Caráter da Internação:</td>
        <td style="width: 5px"></td>
        <td align="left"><span class="cinza-escuro"><span class="cinza-claro">
            <asp:RadioButtonList ID="rblGiaCrt" runat="server" AutoPostBack="True"  
                RepeatDirection="Horizontal">
                <asp:ListItem Selected="True" Value="E">Eletiva</asp:ListItem>
                <asp:ListItem Value="U">Urgência</asp:ListItem>
            </asp:RadioButtonList>
            </span></span></td>
    </tr>
    <tr>
        <td colspan="3" height=5"></td>
    </tr>
    <tr>
        <td align="right" height="10">Tipo de Internação:</td>
        <td style="width: 5px"></td>
        <td align="left"><span class="cinza-escuro"><asp:DropDownList runat="server" 
                ID="ddlTipItn" CssClass="campo" AppendDataBoundItems="True" 
                DataTextField="Tpi_Dsc" DataValueField="IdTpi">
            <asp:ListItem Value="0">Selecione</asp:ListItem>
            </asp:DropDownList> </span></td>
    </tr>
    <tr>
        <td colspan="3" height="5"></td>
    </tr>
        <tr>
        <td align="right" height="10">Regime de Internação:</td>
        <td style="width: 5px"></td>
        <td align="left"><span class="cinza-escuro"><asp:DropDownList runat="server" 
                ID="ddlRgm" CssClass="campo" AppendDataBoundItems="True" 
                DataTextField="Rgm_Dsc" DataValueField="IdRgm">
            <asp:ListItem Value="0">Selecione</asp:ListItem>
            </asp:DropDownList> </span></td>
    </tr>
    <tr>
        <td colspan="3" height="5"></td>
    </tr>
    <tr>
        <td align="right" height="10">Qtd. de Diárias:</td>
        <td style="width: 5px"></td>
        <td align="left"><span class="cinza-escuro">
            <asp:TextBox ID="txtDri" runat="server" CssClass="campo" MaxLength="2"></asp:TextBox>
            <ajaxToolkit:FilteredTextBoxExtender ID="txtDri_FilteredTextBoxExtender" runat="server" 
                FilterType="numbers" TargetControlID="txtDri">
            </ajaxToolkit:FilteredTextBoxExtender>
            </span></td>
    </tr>
    <tr>
        <td colspan="3" height="5"></td>
    </tr>
    <tr>
        <td align="right">Tipo de Doença:</td>
        <td width="5">
        </td>
        <td align="left">
            <table>
                <tr>
                    <td>
                        <asp:RadioButtonList ID="rblTipDoe" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="A">Aguda</asp:ListItem>
                            <asp:ListItem Value="C">Crônica</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </td>
        <tr>
            <td colspan="3" height="5">
            </td>
        </tr>
        <tr>
            <td align="right" >Tempo de Doença:</td>
            <td width="5"></td>
            <td align="left">
                    <table>
                        <tr><td>
                            <asp:TextBox ID="txtTemDoe" runat="server" CssClass="campo" MaxLength="2"></asp:TextBox>
                            <asp:DropDownList ID="ddlTemDoe" runat="server" CssClass="campo">
                                <asp:ListItem Value="0">Selecione</asp:ListItem>
                                <asp:ListItem Value="-D">Dias</asp:ListItem>
                                <asp:ListItem Value="-M">Meses</asp:ListItem>
                                <asp:ListItem Value="-A">Anos</asp:ListItem>
                                </asp:DropDownList>
                        </td></tr>
                    </table>
                <ajaxToolkit:FilteredTextBoxExtender ID="fteTemDoe" runat="server" FilterType="numbers" TargetControlID="txtTemDoe">
                </ajaxToolkit:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td colspan="3" height="5"></td>
        </tr>
        <tr>
            <td align="right" >Indicação de Acidente:</td>
            <td width="5"></td>
            <td align="left">
                    <table>
                        <tr>
                            <td>
                                <asp:RadioButtonList ID="rblIndAdn" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Selected="True" Value="-1">Nenhum</asp:ListItem>
                                    <asp:ListItem Value="0">Acidente ou doença relacionada ao trabalho</asp:ListItem>
                                    <asp:ListItem Value="1">Trânsito</asp:ListItem>
                                    <asp:ListItem Value="2">Outros</asp:ListItem>
                                </asp:RadioButtonList>                            
                            </td>
                        </tr>
                    </table>
            </td>
        </tr>
        <tr>
            <td colspan="3" height="5"></td>
        </tr>
        <tr>
            <td align="right" >Data sugerida para internação:</td>
            <td width="5"></td>
            <td align="left">
                <asp:TextBox runat="server" ID="txtDatItn" CssClass="campo" MaxLength="50" 
                    Width="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="3" height="5"></td>
        </tr>
        <tr>
            <td align="right" >Sugestão do local de internação:</td>
            <td width="5"></td>
            <td align="left">
                <asp:DropDownList ID="ddlCadPrdCtt" runat="server" DataTextField="Ctt_Loc" 
                    DataValueField="IdPrt" Width="400px" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">Selecione</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="3" height="5"></td>
        </tr> 
        <tr>
            <td align="right" >CID:</td>
            <td width="5" style="height: 44px"></td>
            <td align="left" style="height: 44px">
                    <table>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtIdCid" runat="server" CssClass="campo"></asp:TextBox>
                            </td>
                            <td>
                                <asp:ImageButton ID="btnAdicionarCid" ImageUrl="~/Images/bt_adicionar.gif" 
                                    runat="server" onclick="btnAdicionarCid_Click" />
                            </td>
                            <td>
                                <asp:LinkButton ID="lbtBuscar" runat="server">Buscar CID</asp:LinkButton>
                            </td>
                            <td>
                                <asp:ImageButton ID="btnAjudaCid" ImageUrl="~/Images/ico_ajuda_campos.gif" runat="server" />
                            </td>
                        </tr>
                    </table>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="height: 10px"><br /></td>
        </tr>
        <tr>
            <td colspan="3" style="padding: 0px 0 0px 60px;">
                <asp:GridView ID="grdCID" runat="server" BorderStyle="None" GridLines="None"
                     AutoGenerateColumns="False" ondatabound="grd_DataBound" 
                    onselectedindexchanged="grdCID_SelectedIndexChanged" Width="80%" >
                    <Columns>
                        <asp:BoundField DataField="IdCid" HeaderText="CID" />
                        <asp:BoundField DataField="Cid_Dsc" HeaderText="Descri&#231;&#227;o" />
                        <asp:CommandField ButtonType="Button" SelectText="Remover" ShowSelectButton="True" >
                            <ControlStyle CssClass="linkbutton" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>&nbsp;
            </td>
        </tr>  
        <tr>
            <td colspan="3" height="5">
            </td>
        </tr>        
        <tr>
            <td align="right" height="10" valign="top">
                Indicação Clínica:</td>
            <td width="5">
            </td>
            <td align="left">
                <asp:TextBox ID="txtIndCln" runat="server" CssClass="campo" Height="89px" 
                    MaxLength="500" Rows="7" TextMode="MultiLine" Width="356px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="3" height="25">
            </td>
        </tr>
        <tr>
            <td align="right" height="10" valign="middle">
                Procedimento:</td>
            <td style="width: 5px">
            </td>
            <td align="left">
                <asp:TextBox ID="txtPsqPdm" runat="server" CssClass="campo"></asp:TextBox>
                &nbsp;<asp:ImageButton ID="imgBtnAdicionar" runat="server" 
                    ImageUrl="~/Images/bt_adicionar.gif" onclick="imgBtnAdicionar_Click" />
                <asp:Button ID="btnPsqPdm" runat="server" CssClass="linkbutton" 
                    onclick="btnPsqPdm_Click" Text="Buscar Procedimento" />
                <asp:Image ID="Image1" runat="server" 
                    ImageUrl="~/Images/ico_ajuda_campos.gif" />
            </td>
        </tr>
        <tr>
            <td colspan="3" height="5">
            </td>
        </tr>
        <tr>
            <td colspan="3" 
                style="padding-right: 0pt; padding-left: 150px; padding-bottom: 0pt; padding-top: 0pt">
                <asp:GridView ID="grdPdm" runat="server" AutoGenerateColumns="False" onselectedindexchanged="grdPdm_SelectedIndexChanged" 
                    Width="100%" ondatabound="grd_DataBound" >
                    <Columns>
                        <asp:BoundField DataField="Pdm_Cod" HeaderText="Código" />
                        <asp:BoundField DataField="Pdm_Dsc" HeaderText="Descrição do Procedimento" />
                        <asp:TemplateField HeaderText="Quantidade">
                        <ItemTemplate>
                            <asp:TextBox ID="txtQtd_Pdm" runat="server" CssClass="campo" Width="35px" 
                                Text='<%# Bind("Pdm_Qtd") %>'></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                        <asp:CommandField ButtonType="Button" SelectText="Remover" ShowSelectButton="True">
                            <ControlStyle CssClass="linkbutton" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="3" height="5">
            </td>
        </tr>
        <tr>
            <td align="right" height="10">OPM:</td>
            <td style="width: 5px"></td>
            <td align="left" valign="middle">
                <asp:TextBox ID="txtOpmDsc" runat="server" CssClass="campo" Width="300"></asp:TextBox>&nbsp;Quantidade:&nbsp;
                <asp:TextBox ID="txtOpmQtd" runat="server" CssClass="campo" Width="40" 
                    MaxLength="2"></asp:TextBox>
                <ajaxToolkit:FilteredTextBoxExtender ID="fteOpmQtd" runat="server" 
                    FilterType="numbers" TargetControlID="txtOpmQtd">
                </ajaxToolkit:FilteredTextBoxExtender>
                &nbsp;
                <asp:ImageButton ID="ibtAddOpm" runat="server" 
                    ImageUrl="~/Images/bt_adicionar.gif" onclick="ibtAddOpm_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;&nbsp;</td>
        </tr>         
        <tr>
            <td colspan="3" style="padding-right: 0pt; padding-left: 150px; padding-bottom: 0pt; padding-top: 0pt">
                <asp:GridView ID="grdOpm" runat="server" AutoGenerateColumns="False" onselectedindexchanged="grdOpm_SelectedIndexChanged" 
                    Width="100%" onrowdatabound="grd_DataBound" >
                    <Columns>
                        <asp:BoundField DataField="Opm_Dsc" HeaderText="Descrição do OPM" >
                            <ItemStyle Width="75%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Opm_Qtd" HeaderText="Quantidade" >
                            <ItemStyle Width="15%" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" SelectText="Remover" ShowSelectButton="True">
                            <ControlStyle CssClass="linkbutton" />
                            <ItemStyle Width="10%" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>        
        <tr>
            <td colspan="3" height="5">
            </td>
        </tr>
        <tr>
            <td colspan="3" height="15">
            </td>
        </tr>
        <tr>
            <td colspan="3" height="20">
                <asp:Image ID="ImgErr" runat="server" Height="25px" ImageAlign="AbsMiddle" 
                    ImageUrl="~/Images/ico_alert.gif" Visible="False" Width="25px" />
                <asp:Label ID="lblErr" runat="server" CssClass="erro"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3" height="15">
            </td>
        </tr>
        <tr>
            <td colspan="3" 
                style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 42px" 
                valign="middle">
                <asp:ImageButton ID="btnSolAtz" runat="server" 
                    ImageUrl="~/Images/bt_solicitar_autorizacao.gif" 
                    onclick="btnSolAtz_Click" />
                &nbsp;&nbsp;
                <asp:ImageButton ID="btnFhaPci" runat="server" ImageUrl="~/Images/bt_ficha.gif" 
                    onclick="btnFhaPci_Click" />
                &nbsp;&nbsp;
                <asp:ImageButton ID="btnPgaIni" runat="server" ImageUrl="~/Images/bt_home.gif" 
                    onclick="btnPgaIni_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="3" height="15">
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <ajaxToolkit:ModalPopupExtender ID="mpeCID" runat="server" BackgroundCssClass="modalBackground"
                            DropShadow="true" PopupControlID="pnlModalCID" TargetControlID="lbtBuscar">
                </ajaxToolkit:ModalPopupExtender>
                <asp:Panel ID="pnlModalCID" runat="server" BackColor="White" CssClass="modalPopup"
                Direction="LeftToRight" Width="830px">
    <%--            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>--%>
                    <table style="border-right: #ce5c09 thin double; border-top: #ce5c09 thin double;
                        border-left: #ce5c09 thin double; width: 100%; border-bottom: #ce5c09 thin double;
                        background-color: #ffffff">
                        <tbody>
                            <tr>
                                <td style="width: 937px; height: 45px">
                                    <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody>
                                            <tr>
                                                <td align="left" style="width: 9px; height: 37px;">
                                                    <img alt="" height="37" src="../Images/tit_left.gif" width="9" /></td>
                                                <td bgcolor="#f4f4f4" style="height: 37px">
                                                    <h2>Busca de CID</h2>
                                                </td>
                                                <td align="left" style="width: 9px; height: 37px;">
                                                    <img alt="" height="37" src="../Images/tit_right.gif" width="9" /></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="15" style="width: 937px">
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="padding-right: 10px; padding-left: 0px; padding-bottom: 0px;
                                    width: 937px; padding-top: 0px; height: 47px" valign="middle">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td align="right" style="height: 22px">
                                                    Descrição:&nbsp;</td>
                                                <td align="right" style="width: 140px; height: 22px">
                                                    <asp:TextBox ID="txtPopCidDsc" runat="server" CssClass="campo" Width="140px"></asp:TextBox></td>
                                                <td align="left" style="height: 22px" valign="top" width="78">
                                                </td>
                                                <td align="right" style="width: 56px; height: 22px">
                                                    Código:&nbsp;</td>
                                                <td align="right" style="height: 22px" width="140">
                                                    <asp:TextBox ID="txtPopCidCod" runat="server" Width="140px"></asp:TextBox></td>
                                                <td align="left" style="padding-right: 0px; padding-left: 5px; padding-bottom: 0px;
                                                    padding-top: 0px; height: 22px" valign="top" width="78">
                                                    <asp:ImageButton ID="ibtPopCidBuscar" runat="server" ImageUrl="../Images/bt_buscar.gif"
                                                        OnClick="ibtPopCidBuscar_Click" /></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="padding: 0px 4px 0px 4px;" valign="middle">
                                    <asp:GridView ID="grdPopCID" runat="server" AllowPaging="True" 
                                        AutoGenerateColumns="False" DataKeyNames="IdCid,Cid_Dsc" DataSourceID="dtsCID"
                                        OnSelectedIndexChanged="grdPopCID_SelectedIndexChanged" Width="100%" 
                                        AllowSorting="True" OnSorted="grdPopCID_Sorted" OnDataBound="grd_DataBound">
                                        <Columns>
                                            <asp:BoundField DataField="IdCid" HeaderText="CID" SortExpression="IdCid" >
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                            </asp:BoundField>
                                            <asp:ButtonField CommandName="Select" DataTextField="Cid_Dsc" HeaderText="Descri&#231;&#227;o"
                                                Text="Button" SortExpression="Cid_Dsc" >
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:ButtonField>
                                        </Columns>
                                        <PagerTemplate>
                                            <div height="20" align="center">
                                                <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument="First" ImageUrl="~/Images/seta1_1_on.gif"
                                                    OnCommand="paginateGrdCID" />
                                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CommandArgument="Prev" ImageUrl="~/Images/seta1_2_on.gif"
                                                    OnCommand="paginateGrdCID" />
                                                Página
                                                <asp:DropDownList ID="ddlGridPages" runat="server" AutoPostBack="True" CssClass="campo"
                                                    OnSelectedIndexChanged="ddlGrdCIDPages_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                de
                                                <asp:Label ID="lblPageCount" runat="server"></asp:Label>
                                                &nbsp;<asp:ImageButton ID="ImageButton3" runat="server" CommandArgument="Next" ImageUrl="~/Images/seta2_1_on.gif"
                                                    OnCommand="paginateGrdCID" />
                                                &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CommandArgument="Last" ImageUrl="~/Images/seta2_2_on.gif"
                                                    OnCommand="paginateGrdCID" /></div>
                                        </PagerTemplate>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="dtsCID" runat="server" CancelSelectOnNullParameter="False"
                                        ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" SelectCommand="ssAtz_Cid"
                                        SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:Parameter Name="IdCid" Type="String" />
                                            <asp:Parameter Name="Cid_Cod" Type="String" />
                                            <asp:Parameter Name="Cid_Dsc" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:Label ID="lblPopEmptyCid" runat="server"></asp:Label>
                                    <h2 align="right">
                                        &nbsp;<asp:ImageButton ID="ibtPopCIDClose" runat="server" ImageUrl="~/Images/bt_fecha.gif"
                                            OnClick="ibtPopCIDClose_Click" /></h2>
                                </td>
                            </tr>
                        </tbody>
                    </table>
    <%--            </ContentTemplate>
                </asp:UpdatePanel>--%></asp:Panel>
            </td>        
        </tr>
        <tr>
            <td colspan="3">
                <%-- inicio do bloco do popup --%>
                <ajaxToolkit:ModalPopupExtender ID="mpePdm" runat="server" 
                    BackgroundCssClass="modalBackground" DropShadow="true" 
                    PopupControlID="ModalPanel" TargetControlID="btnPsqPdm">
                </ajaxToolkit:ModalPopupExtender>
                <asp:Panel ID="ModalPanel" runat="server" BackColor="White" 
                    CssClass="modalPopup" Direction="LeftToRight" Width="830px">
                    <table style="border-right: #ce5c09 thin double; border-top: #ce5c09 thin double; border-left: #ce5c09 thin double; width: 100%; border-bottom: #ce5c09 thin double; background-color: #ffffff">
                        <tbody>
                            <tr>
                                <td style="width: 937px; height: 45px">
                                    <table align="left" border="0" cellspacing="0" cellpadding="0" width="100%">
                                        <tbody>
                                            <tr>
                                                <td align="left" style="width: 9px; height: 37px">
                                                    <img alt="" height="37" src="../Images/tit_left.gif" width="9" />
                                                </td>
                                                <td bgcolor="#f4f4f4" style="height: 37px">
                                                    <h2>
                                                        Busca de procedimento</h2>
                                                </td>
                                                <td align="left" style="width: 9px; height: 37px">
                                                    <img alt="" height="37" src="../Images/tit_right.gif" width="9" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="15" style="WIDTH: 937px">
                                </td>
                            </tr>
                            <tr>
                                <td align="center" 
                                    style="padding-right: 10px; padding-left: 0px; padding-bottom: 0px; width: 937px; padding-top: 0px; height: 47px" 
                                    valign="middle">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td align="right" style="height: 22px">
                                                    Descrição:&nbsp;</td>
                                                <td align="right" style="width: 140px; height: 22px">
                                                    <asp:TextBox ID="txtBnf_NmePop" runat="server" CssClass="campo" Width="140px"></asp:TextBox>
                                                </td>
                                                <td align="left" style="height: 22px" valign="top" width="78">
                                                </td>
                                                <td align="right" style="width: 56px; height: 22px">
                                                    Código:&nbsp;</td>
                                                <td align="right" style="height: 22px" width="140">
                                                    <asp:TextBox ID="txtBnf_MtrPop" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td align="left" 
                                                    style="padding-right: 0px; padding-left: 5px; padding-bottom: 0px; padding-top: 0px; height: 22px" 
                                                    valign="top" width="78">
                                                    <asp:ImageButton ID="btnBuscar" runat="server" 
                                                        ImageUrl="../Images/bt_buscar.gif" onclick="btnBuscar_Click" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" 
                                    style="padding-right: 4px; padding-left: 4px; padding-bottom: 0px; padding-top: 0px; " 
                                    valign="middle">
                                    <asp:GridView ID="grdPopPdm" runat="server" AllowPaging="True" AllowSorting="True" 
                                        AutoGenerateColumns="False" DataKeyNames="Pdm_Cod,Pdm_Dsc,IdPdm" DataSourceID="dtsPdm" 
                                        OnSelectedIndexChanged="grd_SelectedIndexChanged" OnSorted="grd_Sorted" 
                                        Width="100%" onpageindexchanged="grd_PageIndexChanged" 
                                        OnDataBound="grd_DataBound" PageSize="6">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Código" SortExpression="Pdm_Cod">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Pdm_Cod") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Pdm_Cod") %>'></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Pdm_CodAmb") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Descrição" ShowHeader="False" 
                                                SortExpression="Pdm_Dsc">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                                        CommandName="Select" Text='<%# Eval("Pdm_Dsc") %>'></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Pdm_DscAmb") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" Width="40%" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Pdm_DscRsm" HeaderText="Apelido" 
                                                SortExpression="Pdm_DscRsm">
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" Width="28%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Grp_Dsc" HeaderText="Grupo" SortExpression="Grp_Dsc">
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" Width="22%" />
                                            </asp:BoundField>
                                        </Columns>
                                        <PagerTemplate>
                                            <div height="20">
                                                <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument="First" 
                                                    ImageUrl="~/Images/seta1_1_on.gif" OnCommand="paginateGrdPdm" />
                                                &nbsp;
                                                <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument="Prev" 
                                                    ImageUrl="~/Images/seta1_2_on.gif" OnCommand="paginateGrdPdm" />
                                                Página
                                                <asp:DropDownList ID="ddlGridPages" runat="server" AutoPostBack="True" 
                                                    CssClass="campo" OnSelectedIndexChanged="ddlGrdPdmPages_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                de
                                                <asp:Label ID="lblPageCount" runat="server"></asp:Label>
                                                &nbsp;
                                                <asp:ImageButton ID="ImageButton3" runat="server" CommandArgument="Next" 
                                                    ImageUrl="~/Images/seta2_1_on.gif" OnCommand="paginateGrdPdm" />
                                                &nbsp;
                                                <asp:ImageButton ID="ImageButton4" runat="server" CommandArgument="Last" 
                                                    ImageUrl="~/Images/seta2_2_on.gif" OnCommand="paginateGrdPdm" />
                                            </div>
                                        </PagerTemplate>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="dtsPdm" runat="server" 
                                        CancelSelectOnNullParameter="False" 
                                        ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                        SelectCommand="ssAtz_Pdm" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:Parameter Name="IdPdm" Type="Int32" />
                                            <asp:Parameter Name="Pdm_Cod" Type="String" />
                                            <asp:Parameter Name="Pdm_IdGrp" Type="Int16" />
                                            <asp:Parameter Name="Pdm_Dsc" Type="String" />
                                            <asp:Parameter Name="Grp_Dsc" Type="String" />
                                            <asp:Parameter DefaultValue="True" Name="Pdm_Atv" Type="Boolean" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:Label ID="lblEmptyGrid" runat="server" Text=""></asp:Label>
                                    <h2 align="right">
                                        &nbsp;
                                        <asp:ImageButton ID="btn_fechar" runat="server" 
                                            ImageUrl="~/Images/bt_fecha.gif" onclick="btn_fechar_Click" />
                                    </h2>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </asp:Panel>
                <%-- fim do bloco do popup --%>
                <asp:HiddenField ID="hdfIdGia" runat="server" />
                <asp:HiddenField ID="hdfIdBnf" runat="server" />
            </td>
        </tr>
    </tr>
</tbody>
</table>
<br />
<br />
<%--</contenttemplate>
</asp:UpdatePanel>--%>
</asp:Content>
	            
