<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Inherits="Atz_ngcprf" 
Title="Negociação Profissional" Theme="Standard" Codebehind="ngcprf.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <script type="text/javascript">
        $(function() {
        $("input[class *= 'datepicker']").datepicker({
            changeMonth: true,
            changeYear: true,
            monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
            monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
            dayNames: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
            dayNamesMin: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab'],
            nextText: 'Próximo',
            prevText: 'Anterior',
            dateFormat: 'dd/mm/yy'
            });
        });
	 </script>

     <script language="javascript" type="text/javascript">
            $(document).ready(function () {
                //If you want to move selected item from fromListBox to toListBox
                $("#add").click(function () {
                    $("#fromListBox  option:selected").appendTo("#toListBox");
                });
                //If you want to move all item from fromListBox to toListBox
                $("#addAll").click(function () {
                    $("#fromListBox option").appendTo("#toListBox");
                });
                //If you want to remove selected item from toListBox to fromListBox
                $("#remove").click(function () {
                    $("input[class *= 'lbx' option:selected").remove();
                });
                //If you want to remove all items from toListBox to fromListBox
                $("#removeAll").click(function () {
                    $("#toListBox option").appendTo("#fromListBox");
                });

            });
  </script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>	 
        <table style="width: 100%;">
            <tr>
                <td>
                    <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="left" style="width: 8px">
                                <img alt="" height="37" src="../images/tit_left.gif" width="9" /></td>
                            <td bgcolor="#f4f4f4">
                                <h2>Negociação Profissional</h2>
                            </td>
                            <td align="left" width="9">
                                <img alt="" height="37" src="../images/tit_right.gif" width="9" /></td>
                        </tr>
                    </table>              
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel runat="server" ID="pnlFiltro" Visible="False">
                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tbody>
                                <tr>
                                    <td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 20px; width: 752px; padding-top: 20px; " 
                                         valign="top"><h3>Filtro aplicado</h3></td>
                                </tr> 
                                <tr>
                                    <td style="padding-right: 10px; border-top: #fff 1px solid; padding-left: 10px; padding-bottom: 0px; width: 899px; padding-top: 0px" valign="middle" align="right" bgColor="#e6e6e6" height="26">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                        <tbody>
                                            <tr>
                                                <td style="height: 14px" align="right" width="22%">Id. Negociação:</td>
                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 14px" align="left">
                                                    <span class="cinza-escuro"><asp:Label id="lblIdNgc" runat="server"></asp:Label></span>
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
                                                <td style="height: 16px" align="right" width="22%">Matrícula do Contratado:</TD>
                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 16px" align="left">
                                                    <span class="cinza-escuro"><asp:Label id="lblIdCtt" runat="server"></asp:Label></span>
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
                                                <td style="height: 28px" align="right" width="22%">Local:</td>
                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 28px" align="left">
                                                    <span class="cinza-escuro"><asp:Label id="lblSeqEnd" runat="server"></asp:Label></span>
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
                                                <td style="height: 16px" align="right" width="22%">Profissional:</TD>
                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 16px" align="left">
                                                    <asp:TextBox ID="txtPrfNme" runat="server" TextMode="MultiLine" BackColor="#F4F4F4" BorderStyle="None" Width="450px"></asp:TextBox>
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
                                            <tr><td style="height: 14px" align="right" width="22%">Rede:</TD>
                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 14px" align="left">
                                                    <span class="cinza-escuro"><asp:Label id="lblRdeNme" runat="server"></asp:Label></span>
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
                                                <td style="WIDTH: 22%; HEIGHT: 16px" align="right">Especialidade:</TD>
                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; PADDING-TOP: 0px; HEIGHT: 16px" align="left">
                                                    <span class="cinza-escuro"><asp:Label id="lblEspDsc" runat="server"></asp:Label></span>
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
                                                <td style="width: 22%; height: 14px" align="right">Grupo:</td>
                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 14px" align="left">
                                                    <span class="cinza-escuro"><asp:Label id="lblGrpDsc" runat="server"></asp:Label></span>
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
                                                <td style="WIDTH: 22%; HEIGHT: 16px" align="right">Data Inicial:</TD>
                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; PADDING-TOP: 0px; HEIGHT: 16px" align="left">
                                                    <span class="cinza-escuro"><asp:Label id="lblDatIni" runat="server"></asp:Label></span>
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
                                                <td style="width: 22%; height: 14px" align="right">Data Final:</td>
                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 14px" align="left">
                                                    <span class="cinza-escuro"><asp:Label id="lblDatFim" runat="server"></asp:Label></span>
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
                                                <td style="WIDTH: 22%; HEIGHT: 16px" align="right">Procedimento:</TD>
                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; PADDING-TOP: 0px; HEIGHT: 16px" align="left">
                                                    <asp:TextBox ID="txtPdmDsc" runat="server" BackColor="#F4F4F4" BorderStyle="None" TextMode="MultiLine" Width="450px"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>


                </td>
            </tr>
            <tr>
                <td>


                </td>
            </tr>
        </table>
        <br />

    <asp:MultiView ID="mvw" runat="server" ActiveViewIndex="0">
        <asp:View ID="vw0" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
                        height: 37px">

                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px;
                        padding-top: 20px" valign="top">
                        <table border="0" cellpadding="0" cellspacing="0">
                        <tbody>
                            <tr>
                                <td colspan="3">                                    
                                    <asp:Label ID="lblTotNgc" runat="server" CssClass="erro"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 22px; width: 150px;">
                                    <asp:Label ID="lblIdNgc0" runat="server" Text="Id. Negociação:"></asp:Label>
                                </td>
                                <td style="height: 22px" width="5">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtIdNgc" runat="server" Width="100px"></asp:TextBox>                                    
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">                                    
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 22px" width="150">
                                    Matrícula do Contratado:</td>
                                <td style="height: 22px" width="5">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtIdCtt" runat="server" Width="100px"></asp:TextBox></td>    
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 22px" width="150">
                                    Local:</td>
                                <td width="5">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtSeqEnd" runat="server" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 22px" width="150">
                                    Profissional:</td>
                                <td width="5">
                                    
                                </td>
                                <td align="left">
                                    <div>
                                        <asp:ListBox ID="lbxPrf" runat="server" ClientIDMode="Static" Width="400px" CssClass="campo"></asp:ListBox>
                                    </div>
                                    <div>
                                        <asp:TextBox ID="txtPrfMtr" runat="server"></asp:TextBox>
                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Spacer.gif" />
                                        <asp:LinkButton ID="btnAddPrf" runat="server" OnClick="btnAddPrf_Click">Adicionar</asp:LinkButton>
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Spacer.gif" />
                                        <asp:LinkButton ID="btnDelPrf" runat="server" OnClick="btnDelPrf_Click">Remover</asp:LinkButton>
                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/Spacer.gif" />
                                        <asp:LinkButton ID="lbtShowPop" runat="server" CommandName="ShowPopupPrf" OnClick="lbtShowPop_Click" >Buscar Profissional</asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="150">
                                    Rede:</td>
                                <td width="5">
                                </td>
                                <td align="left">
                                    <asp:CheckBoxList ID="cblRde" runat="server" DataTextField="Rde_Nme" 
                                        DataValueField="IdRde">
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="150">
                                    Especialidade:</td>
                                <td width="5">
                                </td>
                                <td align="left">
                                    <asp:DropDownList runat="server" ID="ddlEsp" AppendDataBoundItems="true" 
                                        DataValueField="IdEsp" DataTextField="Esp_Dsc">
                                        <asp:ListItem Value="-1">Todas</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="150">
                                    Grupo:</td>
                                <td width="5">
                                </td>
                                <td align="left">
                                    <asp:DropDownList runat="server" ID="ddlGrp" AppendDataBoundItems="true" 
                                        DataValueField="IdGrp" DataTextField="Grp_Dsc">
                                        <asp:ListItem Value="-1">Todos</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="height: 10px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="150">
                                    Caráter:</td><td width="5">
                                </td>
                                <td align="left">
                                    <span class="cinza-claro">
                                    <asp:RadioButtonList ID="rbtCrt" runat="server" AutoPostBack="True"
                                        RepeatDirection="Horizontal">
                                        <asp:ListItem Selected="True" Value="A">Ambos</asp:ListItem>
                                        <asp:ListItem Value="E">Eletiva</asp:ListItem>
                                        <asp:ListItem Value="U">Urgência</asp:ListItem>
                                    </asp:RadioButtonList>
                                    </span></td>
                            </tr>
                            <tr>
                                <td colspan="3" width ="5">
                                    &nbsp;</td></tr>
                            <tr>
                                <td align="right" width="150">
                                    <asp:Label ID="lblDatIni0" runat="server" Text="Data Inicial:"></asp:Label>
                                </td>
                                <td width="5">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtDatIni" runat="server" Width="100px" SkinID="datepicker"></asp:TextBox>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="height: 10px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 22px" width="150">
                                    <asp:Label ID="lblDatFim0" runat="server" Text="Data Final:"></asp:Label>
                                </td>
                                <td style="height: 22px" width="5">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtDatFim" runat="server" Width="100px" SkinID="datepicker"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 22px" width="150">
                                    Procedimento:</td>
                                <td style="height: 22px" width="5">
                                </td>
                                <td align="left">
                                    <div>
                                        <asp:ListBox ID="lbxPdm" runat="server" ClientIDMode="Static" Width="400px" CssClass="campo"></asp:ListBox>
                                    </div>
                                    <div>
                                        <asp:TextBox ID="txtPdmCod" runat="server"></asp:TextBox>
                                        <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/Spacer.gif" />
                                        <asp:LinkButton ID="btnAddPdm" runat="server" OnClick="btnAddPdm_Click">Adicionar</asp:LinkButton>
                                        <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/Spacer.gif" />
                                        <asp:LinkButton ID="btnDelPdm" runat="server" OnClick="btnDelPdm_Click">Remover</asp:LinkButton>
                                        <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/Spacer.gif" />
                                        <asp:LinkButton ID="btnPesPdm" runat="server" CommandName="ShowPopupPdm" OnClick="btnPesPdm_Click">Buscar Procedimento</asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                </td>
                            </tr>
                            <tr align="center">
                                <td colspan="3" height="10">
                                    <asp:RadioButtonList runat="server" ID="rblTip" RepeatDirection="Horizontal" 
                                        AutoPostBack="True" onselectedindexchanged="rblTip_SelectedIndexChanged">
                                        <asp:ListItem Text="Visualizar" Value="V"></asp:ListItem>
                                        <asp:ListItem Text="Incluir" Value="I"></asp:ListItem>
                                        <asp:ListItem Text="Alterar" Value="U" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Finalizar" Value="F"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                    &nbsp;</td>
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
                                        OnClick="btnOk_Click" style="height: 19px" /></td>
                            </tr>
                        </tbody>
                        </table>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="vw1" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 20px; width: 752px; padding-top: 20px; " 
                         valign="top"><h3>Resultado da Pesquisa</h3></td></tr><tr>
                    <td height="15">
                        &nbsp;</td></tr><tr>
                    <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
                        height: 47px">
                    <br />
                        <asp:GridView ID="grdNgc" runat="server" AllowPaging="True" AllowSorting="True" 
                            AutoGenerateColumns="False" DataKeyNames="IdNgc" 
                            DataSourceID="dtsNgc" OnDataBound="grd_DataBound" 
                            Width="100%">
                            <Columns>
                                <asp:BoundField DataField="IdNgc" HeaderText="Id.Neg." 
                                    SortExpression="IdNgc" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                                <asp:BoundField DataField="Lcr_IdCtt" HeaderText="Contratado" 
                                    SortExpression="Lcr_IdCtt" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Lcr_SeqEnd" HeaderText="Seq.End." 
                                    SortExpression="Lcr_SeqEnd" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Rde_Nme" HeaderText="Rede" 
                                    SortExpression="Rde_Nme" />
                                <asp:BoundField DataField="Prf_Mtr" HeaderText="Profissional" 
                                    SortExpression="Prf_Mtr" />
                                <asp:BoundField DataField="Esp_Dsc" HeaderText="Especialidade" 
                                    SortExpression="Esp_Dsc" />
                                <asp:BoundField DataField="Ngc_Crt" HeaderText="Caráter" 
                                    SortExpression="Ngc_Crt" ItemStyle-HorizontalAlign="Center" />    
                                <asp:BoundField DataField="Pdm_Cod" HeaderText="Procedimento" 
                                    SortExpression="Pdm_Cod" />
                                <asp:BoundField DataField="Grp_Dsc" HeaderText="Grupo" 
                                    SortExpression="Grp_Dsc" />
                                <asp:BoundField DataField="Ngc_DatIni" DataFormatString="{0:dd/MM/yyyy}" 
                                    HeaderText="Data Ini." SortExpression="Ngc_DatIni" />
                                <asp:BoundField DataField="Ngc_DatFim" DataFormatString="{0:dd/MM/yyyy}" 
                                    HeaderText="Data Fim" SortExpression="Ngc_DatFim" />
                                <asp:BoundField DataField="Pdm_QtdCh_" HeaderText="Qtd.CH" 
                                    SortExpression="Pdm_QtdCh_" ItemStyle-HorizontalAlign="Right" />
                                <asp:BoundField DataField="Ngc_FtrCh_" HeaderText="Fator" 
                                    SortExpression="Ngc_FtrCh_" ItemStyle-HorizontalAlign="Right" />
                                <asp:BoundField DataField="Pdm_QtdFlm" HeaderText="Qtd.Filme" 
                                    SortExpression="Pdm_QtdFlm" ItemStyle-HorizontalAlign="Right" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                <asp:BoundField DataField="Ngc_VlrFlm" HeaderText="Vlr.Filme" 
                                    SortExpression="Ngc_VlrFlm" ItemStyle-HorizontalAlign="Right" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                <asp:BoundField DataField="Ngc_Vlr" HeaderText="Valor" 
                                    SortExpression="Ngc_Vlr" ItemStyle-HorizontalAlign="Right" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                                <asp:BoundField DataField="Ngc_VlrTot" HeaderText="Total" 
                                    SortExpression="Ngc_VlrTot" ItemStyle-HorizontalAlign="Right" ><ItemStyle HorizontalAlign="Right" /></asp:BoundField>
                            </Columns>
                            <FooterStyle Font-Bold="True" ForeColor="White" />
                            <PagerTemplate>
                                <div height="20" align="center" style="vertical-align: middle">
                                    <asp:ImageButton ID="ibtFirst" runat="server" CommandArgument="First" 
                                        ImageUrl="~/Images/seta1_1_on.gif" OnCommand="paginateGrd" />
                                    &nbsp;
                                    <asp:ImageButton ID="ibtPrev" runat="server" CommandArgument="Prev" 
                                        ImageUrl="~/Images/seta1_2_on.gif" OnCommand="paginateGrd" />
                                    Página
                                    <asp:DropDownList ID="ddlGridPages" runat="server" AutoPostBack="True" 
                                        CssClass="campo" OnSelectedIndexChanged="ddlGrdPages_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    de
                                    <asp:Label ID="lblPageCount" runat="server"></asp:Label>
                                    &nbsp;
                                    <asp:ImageButton ID="ibtNext" runat="server" CommandArgument="Next" 
                                        ImageUrl="~/Images/seta2_1_on.gif" OnCommand="paginateGrd" />
                                    &nbsp;
                                    <asp:ImageButton ID="ibtLast" runat="server" CommandArgument="Last" 
                                        ImageUrl="~/Images/seta2_2_on.gif" OnCommand="paginateGrd" />
                                </div>
                            </PagerTemplate>
                        </asp:GridView>
                        <asp:SqlDataSource ID="dtsNgc" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                            SelectCommand="ssAtz_NgcPrf" SelectCommandType="StoredProcedure" 
                            CancelSelectOnNullParameter="False">
                            <SelectParameters>
                                <asp:Parameter Name="IdNgc" Type="Int32" />
                                <asp:Parameter Name="Prf_Mtr" Type="String" />
                                <asp:Parameter Name="IdCtt" Type="Int64" />
                                <asp:Parameter Name="Cte_SeqEnd" Type="Byte" />
                                <asp:Parameter Name="IdRde" Type="String" />
                                <asp:Parameter Name="IdEsp" Type="Int16" />
                                <asp:Parameter Name="IdGrp" Type="Byte" />
                                <asp:Parameter Name="Pdm_Cod" Type="String" />
                                <asp:Parameter Name="Ngc_DatIni" Type="DateTime" />
                                <asp:Parameter Name="Ngc_DatFim" Type="DateTime" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <div align="right">
                            &nbsp;
                        </div>
                    </td>
                </tr>
            </table>    
        </asp:View>
        <asp:View ID="vw2" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 20px; width: 752px; padding-top: 20px; " 
                         valign="top"><h3>Incluir</h3></td></tr><tr>
                    <td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px;
                        padding-top: 20px" valign="top">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td colspan="3">
                                    <asp:Label ID="lblTotNgc2" runat="server" CssClass="erro"></asp:Label></td></tr><tr>
                                <td colspan="3" width ="5">
                                    &nbsp;</td></tr>
                            <tr>
                                <td align="right" width="150">
                                    Data Inicial:</td><td width="5">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtDatIni2" runat="server" SkinID="datepicker" Width="100px"></asp:TextBox></td></tr><tr>
                                <td colspan="3">
                                </td>
                            </tr>
                            <tr>
                                <td style="width:150px" align="right">
                                    <asp:RadioButton ID="rblFtr2" runat="server" AutoPostBack="True" 
                                        GroupName="Upd" oncheckedchanged="rblFtr2_CheckedChanged" Text="Fator CH" 
                                        TextAlign="Left" />
                                </td>
                                <td width="5">                                                    
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFtr2" runat="server" Enabled="false"></asp:TextBox></td></tr><tr>
                                <td colspan="3">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width:150px">
                                    <asp:RadioButton ID="rblVlr2" runat="server" AutoPostBack="True" 
                                        GroupName="Upd" oncheckedchanged="rblVlr2_CheckedChanged" Text="Valor" 
                                        TextAlign="Left" />
                                </td>
                                <td>
                                    
                                </td>
                                <td width="5">
                                    <asp:TextBox ID="txtVlr2" runat="server" Enabled="false"></asp:TextBox></td></tr><tr>
                                <td colspan="3">
                                </td>
                            </tr>
                            <tr>
                                <td style="width:150px" align="right">
                                    <asp:Label ID="Label100" runat="server" Text="Valor do Filme:"></asp:Label></td><td width="5">                                                    
                                </td>
                                <td>
                                    <asp:TextBox ID="txtVlrFlm2" runat="server"></asp:TextBox></td></tr><tr>
                                <td colspan="3">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                    <asp:Image ID="imgMsg2" runat="server" ImageUrl="../Images/ico_alert.gif" 
                                        Visible="False" />
                                    &nbsp;<asp:Label ID="lblMsg2" runat="server" class="erro"></asp:Label></td></tr><tr>
                                <td align="right" style="height: 14px" width="150">
                                </td>
                                <td style="height: 14px" width="5">
                                </td>
                                <td align="left" style="width: 147px; height: 14px">
                                    <asp:ImageButton ID="ibtSave2" runat="server" Height="19px" 
                                        ImageUrl="../Images/bt_gravar.gif" OnClick="ibtSave2_Click" />
                                </td>
                            </tr>
                        </table>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
            </table> 
        </asp:View>
        <asp:View ID="vw3" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 20px; width: 752px; padding-top: 20px; " 
                         valign="top"><h3>Alterar</h3></td>
                </tr>
                <tr>
                    <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
                        height: 47px">
                        <br />
                        <%--<asp:Panel runat="server" ID="pnlEdit" >--%>                            
                            <br />
                            <table style="width:100%;">
                                <tr>
                                    <td colspan="3"><asp:Label ID="lblTotNgc3" runat="server" CssClass="erro" ></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width:150px">
                                        &nbsp;</td>
                                    <td  style="width:200px">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width:150px" align="right">
                                        <asp:RadioButton ID="rbtFtr3" runat="server" Text="Fator CH" 
                                            oncheckedchanged="rbtFtr3_CheckedChanged" TextAlign="Left" 
                                            AutoPostBack="True" GroupName="Upd" />
                                    </td>
                                    <td>
                                        
                                        <asp:TextBox ID="txtFtr3" runat="server" Enabled="false"></asp:TextBox>
                                        
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width:150px" align="right">
                                        <asp:RadioButton ID="rbtVlr3" runat="server" Text="Valor" 
                                            oncheckedchanged="rbtVlr3_CheckedChanged" TextAlign="Left" 
                                            AutoPostBack="True" GroupName="Upd" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtVlr3" runat="server" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width:150px" align="right">
                                        <asp:Label ID="lblVlrFlm" runat="server" Text="Valor do Filme:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtVlrFlm3" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:Image ID="imgMsg3" runat="server" ImageUrl="../Images/ico_alert.gif" 
                                            Visible="False" />
                                        &nbsp;<asp:Label ID="lblMsg3" runat="server" class="erro"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:ImageButton ID="ibtSave3" runat="server" Height="19px" 
                                            ImageUrl="~/Images/bt_gravar.GIF" onclick="ibtSave3_Click" />
                                        &nbsp;<asp:ImageButton ID="ibtCancel" runat="server" 
                                            ImageUrl="~/Images/bt_cancelar.GIF" onclick="ibtCancel_Click" />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <br />
                        <%--</asp:Panel>--%>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View runat="server" ID="vw4">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 20px; width: 752px; padding-top: 20px; " 
                         valign="top"><h3>Finalizar</h3></td></tr><tr>
                    <td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px;
                        padding-top: 20px" valign="top">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td colspan="3">
                                    <asp:Label ID="lblTotNgc4" runat="server" CssClass="erro"></asp:Label></td></tr><tr>
                                <td colspan="3">
                                    &nbsp;</td></tr><tr>
                                <td align="right" width="150">
                                    Data Final:</td><td width="5">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtDatFim4" runat="server" SkinID="datepicker" Width="100px"></asp:TextBox></td></tr><tr>
                                <td colspan="3" height="10">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                    <asp:Image ID="imgMsg4" runat="server" ImageUrl="../Images/ico_alert.gif" 
                                        Visible="False" />
                                    &nbsp;<asp:Label ID="lblMsg4" runat="server" class="erro"></asp:Label></td></tr><tr>
                                <td align="right" style="height: 14px" width="150">
                                </td>
                                <td style="height: 14px" width="5">
                                </td>
                                <td align="left" style="width: 147px; height: 14px">
                                    <asp:ImageButton ID="ibtSave4" runat="server" Height="19px" 
                                        ImageUrl="../Images/bt_gravar.gif" OnClick="ibtSave4_Click" />
                                </td>
                            </tr>
                        </table>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
            </table> 
        </asp:View>
    </asp:MultiView>
    <asp:ImageButton ID="btnPgaIni" runat="server" ImageUrl="~/Images/bt_home.gif" OnClick="btnPgaIni_Click" />&nbsp;
    <asp:ImageButton ID="btnNewPsq" runat="server" ImageUrl="~/Images/bt_nova_pesquisa.gif"
                OnClick="btnNewPsq_Click" />
        <ajaxToolKit:ModalPopupExtender ID="mpePrf" runat="server" BackgroundCssClass="modalBackground"
            DropShadow="true" PopupControlID="ModalPanelPrf"
            TargetControlID="btnPop">
        </ajaxToolKit:ModalPopupExtender>
        <asp:Panel id="ModalPanelPrf" runat="server" CssClass="modalPopup" Width="830px" Direction="LeftToRight" BackColor="White" >
        <table style="border-right: #ce5c09 thin double; border-top: #ce5c09 thin double; border-left: #ce5c09 thin double; width: 100%; border-bottom: #ce5c09 thin double; BACKGROUND-COLOR: #ffffff">
                <tbody>
                    <tr>
                        <TD style="width: 937px; height: 45px">
                            <table cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 9px; height: 37px" align="left"><img height="37" alt="" src="../Images/tit_left.gif" width=9 /></td>
                                        <td style="height: 37px" bgColor="#f4f4f4"><h2>Busca de profissional</h2></td>
                                        <td style="width: 9px; height: 37px" align="left"><img height="37" alt="" src="../Images/tit_right.gif" width=9 /></td>
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
                                        <td style="width: 140px; height: 22px" align="right"><asp:TextBox id="txtPopDsc" 
                                                runat="server" CssClass="campo" Width="140px"></asp:TextBox></td>
                                        <td style="height: 22px" valign="top" align="left" width="78"></td>
                                        <td style="width: 56px; height: 22px" align="right">Matrícula:&nbsp;</td>
                                        <td style="height: 22px" align="right" width="140"><asp:TextBox id="txtPopCod" 
                                                runat="server" Width="140px"></asp:TextBox></td>
                                        <td style="padding-right: 0px; padding-left: 5px; padding-bottom: 0px; padding-top: 0px; height: 22px" vAlign="top" align="left" width="78">
                                            <asp:ImageButton id="ImageButton5" onclick="btnPopBuscarPrf_Click" 
                                                runat="server" ImageUrl="../Images/bt_buscar.gif" Height="19px"></asp:ImageButton></td>
                                    </tr>
                                </tbody>
                            </table>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-right: 4px; padding-left: 4px; padding-bottom: 0px; padding-top: 0px; " 
                            valign="middle" align="center">
                            <asp:GridView ID="grdPopPrf" runat="server" AllowPaging="True" AllowSorting="True" 
                                AutoGenerateColumns="False" DataKeyNames="Prf_Mtr,Prf_Nme" 
                                DataSourceID="dtsPop" OnDataBound="grd_DataBound" 
                                OnSelectedIndexChanged="grdPop_SelectedIndexChanged" onsorted="grd_Sorted" 
                                Width="100%" onpageindexchanged="grd_Sorted">
                                <Columns>
                                    <asp:BoundField DataField="Prf_Mtr" HeaderText="Matrícula" 
                                        SortExpression="Prf_Mtr">
                                        <ItemStyle Width="30%" />
                                    </asp:BoundField>
                                    <asp:ButtonField CommandName="Select" DataTextField="Prf_Nme" 
                                        HeaderText="Nome do Profissional" SortExpression="Prf_Mtr" Text="Button">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="70%" />
                                    </asp:ButtonField>
                                </Columns>
                                <PagerTemplate>
                                    <div height="20">
                                        <asp:ImageButton ID="ibtPopFirst" runat="server" CommandArgument="First" 
                                            ImageUrl="~/Images/seta1_1_on.gif" OnCommand="paginateGrdPopPrf" />
                                        &nbsp;
                                        <asp:ImageButton ID="ibtPopPrev" runat="server" CommandArgument="Prev" 
                                            ImageUrl="~/Images/seta1_2_on.gif" OnCommand="paginateGrdPopPrf" />
                                        Página
                                        <asp:DropDownList ID="ddlGridPages" runat="server" AutoPostBack="True" 
                                            CssClass="campo" OnSelectedIndexChanged="ddlGrdPopPrfPages_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        de
                                        <asp:Label ID="lblPageCount" runat="server"></asp:Label>
                                        &nbsp;
                                        <asp:ImageButton ID="ibtPopNext" runat="server" CommandArgument="Next" 
                                            ImageUrl="~/Images/seta2_1_on.gif" OnCommand="paginateGrdPopPrf" />
                                        &nbsp;
                                        <asp:ImageButton ID="ibtPopLast" runat="server" CommandArgument="Last" 
                                            ImageUrl="~/Images/seta2_2_on.gif" OnCommand="paginateGrdPopPrf" />
                                    </div>
                                </PagerTemplate>
                            </asp:GridView>
                            <br />
                            <asp:Label ID="lblPopGrdEmpty" runat="server"></asp:Label>
                            <asp:SqlDataSource ID="dtsPop" runat="server" 
                                CancelSelectOnNullParameter="False" 
                                ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                SelectCommand="ssAtz_Prf" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter Name="Prf_Mtr" Type="String" />
                                    <asp:Parameter Name="Prf_Nme" Type="String" />
                                    <asp:ControlParameter ControlID="txtIdCtt" Name="IdCtt" PropertyName="Text" 
                                        Type="Int64" />
                                    <asp:ControlParameter ControlID="txtSeqEnd" Name="SeqEnd" PropertyName="Text" 
                                        Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <h2 align="right">
                                <asp:ImageButton ID="btn_fechar" runat="server" 
                                    ImageUrl="~/Images/bt_fecha.gif" onclick="btn_fechar_Click" />
                            </h2>
                        </td>
                    </tr>
                </tbody>
            </table>
        </asp:Panel> 
    <ajaxToolKit:ModalPopupExtender ID="mpePdm" runat="server" TargetControlID="btnPopPdm" PopupControlID="ModalPanelPdm" 
            DropShadow="true" BackgroundCssClass="modalBackground">
    </ajaxToolKit:ModalPopupExtender> 
        <asp:Panel id="ModalPanelPdm" runat="server" CssClass="modalPopup" Width="830px" Direction="LeftToRight" BackColor="White" >
            <table style="border-right: #ce5c09 thin double; border-top: #ce5c09 thin double; border-left: #ce5c09 thin double; width: 100%; border-bottom: #ce5c09 thin double; BACKGROUND-COLOR: #ffffff">
                <tbody>
                    <tr>
                        <td style="width: 937px; height: 45px">
                            <table cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 9px; height: 37px" align=left><img height=37 alt="" src="../Images/tit_left.gif" width="9" /></td>
                                        <td style="height: 37px" bgColor="#f4f4f4"><h2>Busca de procedimento</h2></td>
                                        <td style="width: 9px; height: 37px" align="left"><img height=37 alt="" src="../Images/tit_right.gif" width="9" /></td>
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
                        <td align="center" 
                            style="padding-right: 10px; padding-left: 0px; padding-bottom: 0px; width: 937px; padding-top: 0px; height: 47px" 
                            valign="middle">
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td align="right" style="height: 22px">
                                            Descrição:&nbsp;</td>
                                        <td align="right" style="width: 140px; height: 22px">
                                            <asp:TextBox ID="txtPopPdmDsc" runat="server" CssClass="campo" Width="140px"></asp:TextBox>
                                        </td>
                                        <td align="left" style="height: 22px" valign="top" width="78">
                                        </td>
                                        <td align="right" style="width: 56px; height: 22px">
                                            Código:&nbsp;</td>
                                        <td align="right" style="height: 22px" width="140">
                                            <asp:TextBox ID="txtPopPdmCod" runat="server" Width="140px"></asp:TextBox>
                                        </td>
                                        <td align="left" 
                                            style="padding-right: 0px; padding-left: 5px; padding-bottom: 0px; padding-top: 0px; height: 22px" 
                                            valign="top" width="78">
                                            <asp:ImageButton ID="btnPopBuscarPdm" runat="server" 
                                                ImageUrl="../Images/bt_buscar.gif" onclick="btnPopBuscarPdm_Click" />
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
                            <asp:GridView ID="grdPopPdm" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" 
                                DataKeyNames="Pdm_Cod,Pdm_Dsc,IdPdm,Pdm_Atv" DataSourceID="dtsPdm" 
                                OnDataBound="grd_DataBound" 
                                OnSelectedIndexChanged="grdPopPdm_SelectedIndexChanged" 
                                OnSorted="grdPopPdm_Sorted" Width="100%" onpageindexchanged="grd_Sorted">
                                <Columns>
                                    <asp:BoundField DataField="Pdm_Cod" HeaderText="Código" 
                                        SortExpression="Pdm_Cod">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundField>
                                    <asp:ButtonField CommandName="Select" DataTextField="Pdm_Dsc" 
                                        HeaderText="Descrição" SortExpression="Pdm_Dsc" Text="Button">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="40%" />
                                    </asp:ButtonField>
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
                                            ImageUrl="~/Images/seta1_1_on.gif" OnCommand="paginateGrdPopPdm" />
                                        &nbsp;
                                        <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument="Prev" 
                                            ImageUrl="~/Images/seta1_2_on.gif" OnCommand="paginateGrdPopPdm" />
                                        Página
                                        <asp:DropDownList ID="ddlGridPages" runat="server" AutoPostBack="True" 
                                            CssClass="campo" 
                                            OnSelectedIndexChanged="ddlGrdPopPdmPages_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        de
                                        <asp:Label ID="lblPageCount" runat="server"></asp:Label>
                                        &nbsp;
                                        <asp:ImageButton ID="ImageButton3" runat="server" CommandArgument="Next" 
                                            ImageUrl="~/Images/seta2_1_on.gif" OnCommand="paginateGrdPopPdm" />
                                        &nbsp;
                                        <asp:ImageButton ID="ImageButton4" runat="server" CommandArgument="Last" 
                                            ImageUrl="~/Images/seta2_2_on.gif" OnCommand="paginateGrdPopPdm" />
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
                                    <asp:Parameter DefaultValue="" Name="Pdm_Atv" Type="Boolean" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:Label ID="lblEmptyGrid" runat="server" Text=""></asp:Label>
                            <h2 align="right">
                                &nbsp;
                                <asp:ImageButton ID="ibtFecharPdm" runat="server" 
                                    ImageUrl="~/Images/bt_fecha.gif" onclick="ibtFecharPdm_Click" />
                            </h2>
                        </td>
                    </tr>
                </tbody>
            </table>
        </asp:Panel> 
    <asp:HiddenField ID="hdfIdRde" runat="server" />
    <asp:HiddenField ID="hdfPrfMtr" runat="server" />
    <asp:HiddenField ID="hdfPdmCod" runat="server" />
    <%--O TargetId do modalpopupextender não pode estar invisível, se estiver o popup é exibido no page load--%>
    <asp:Button ID="btnPop" runat="server" CssClass="linkbutton" /> 
    <asp:Button ID="btnPopPdm" runat="server" CssClass="linkbutton" />
    
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

