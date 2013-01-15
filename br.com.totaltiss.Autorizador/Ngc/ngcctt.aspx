<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" 
    Inherits="Atz_ngcctt" Title="Negociação Contratado" Theme="Standard" Codebehind="ngcctt.aspx.cs" %>
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
                                <h2>Negociação Contratado</h2>
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
                                    <td style="padding-right: 10px; border-top: #fff 1px solid; padding-left: 10px; padding-bottom: 0px; width: 899px; padding-top: 0px; height: 26px" valign="middle" align="right" bgColor="#e6e6e6">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                        <tbody>
                                            <tr>
                                                <td style="height: 16px" align="right" width="22%">Id. Negociação:</TD>
                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 16px" align="left">
                                                    <span class="cinza-escuro"><asp:Label id="lblIdNgc" runat="server"></asp:Label></span>
                                                </td>
                                            </tr>
                                         </tbody>
                                         </table>
                                     </td>
                                </tr>
                                <tr>
                                    <td style="padding-right: 10px; border-top: #fff 1px solid; padding-left: 10px; padding-bottom: 0px; width: 899px; padding-top: 0px" valign="middle" align="right" bgColor="#f4f4f4" height="26">
                                        <table cellspacing="0" cellpadding="0" width="100%" border=0>
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
                                    <td style="padding-right: 10px; border-top: #fff 1px solid; padding-left: 10px; padding-bottom: 0px; width: 899px; padding-top: 0px; height: 26px" valign="middle" align="right" bgColor="#e6e6e6">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
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
                                    <td style="padding-right: 10px; border-top: #fff 1px solid; padding-left: 10px; padding-bottom: 0px; width: 899px; padding-top: 0px; height: 26px" valign="middle" align="right" bgColor="#e6e6e6">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                        <tbody>
                                            <tr>
                                                <td style="width: 22%; height: 16px" align="right">Especialidade:</td>
                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 16px" align="left">
                                                    <span class="cinza-escuro"><asp:Label id="lblEspDsc" runat="server"></asp:Label></span>
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
                                    <td style="padding-right: 10px; border-top: #fff 1px solid; padding-left: 10px; padding-bottom: 0px; width: 899px; padding-top: 0px; height: 26px" valign="middle" align="right" bgColor="#e6e6e6">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                        <tbody>
                                            <tr>
                                                <td style="WIDTH: 22%; HEIGHT: 16px" align="right">Data Inicial:</td>
                                                <td style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; height: 16px" align="left">
                                                    <span class="cinza-escuro"><asp:Label id="lblDatIni" runat="server"></asp:Label></span>
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
                                    <td style="padding-right: 10px; border-top: #fff 1px solid; padding-left: 10px; padding-bottom: 0px; width: 899px; padding-top: 0px; height: 26px" valign="middle" align="right" bgColor="#e6e6e6">
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
                                <tr>
                                    <td align="left" valign="top">&nbsp;</td>
                                </tr> 
                            </tbody>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
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
                                                        <td colspan="3"></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="height: 22px" width="150">
                                                            <asp:Label ID="lblIdNgc0" runat="server" Text="Id. Negociação:"></asp:Label>
                                                        </td><td style="height: 22px" width="5">
                                                        </td>
                                                        <td align="left">
                                                            <asp:TextBox ID="txtIdNgc" runat="server" Width="100px"></asp:TextBox></td></tr><tr>
                                                        <td colspan="3" height="10">
                                                            &nbsp;</td></tr><tr>
                                                        <td style="height: 22px" align="right" width="150">
                                                            Matrícula do Contratado:</td><td width="5">
                                                        </td>
                                                        <td align="left">
                                                            <asp:TextBox ID="txtIdCtt" runat="server" AutoPostBack="True" 
                                                                ontextchanged="txtIdCtt_TextChanged" Width="100px"></asp:TextBox></td></tr><tr>
                                                        <td colspan="3" style="height: 10px">
                                                            </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" width="150">
                                                            Local:</td><td width="5">
                                                        </td>
                                                        <td align="left">
                                                            <asp:CheckBoxList ID="cblSeqEnd" runat="server" DataTextField="local" 
                                                                DataValueField="Cte_SeqEnd">
                                                            </asp:CheckBoxList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3" height="10">
                                                            </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" width="150">
                                                            Rede:</td><td width="5">
                                                        </td>
                                                        <td align="left">
                                                            <asp:CheckBoxList ID="cblRde" runat="server" DataTextField="Rde_Nme" 
                                                                DataValueField="IdRde">
                                                            </asp:CheckBoxList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3" height="10">
                                                            &nbsp;</td></tr><tr>
                                                        <td align="right" width="150">
                                                            Especialidade:</td><td width="5">
                                                        </td>
                                                        <td align="left">
                                                            <asp:DropDownList ID="ddlEsp" runat="server" AppendDataBoundItems="true" 
                                                                DataTextField="Esp_Dsc" DataValueField="IdEsp" Height="16px">
                                                                <asp:ListItem Value="-1">Todas</asp:ListItem></asp:DropDownList></td></tr><tr>
                                                        <td colspan="3" height="10">
                                                            </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" width="150">
                                                            Grupo:</td><td width="5">
                                                        </td>
                                                        <td align="left">
                                                            <asp:DropDownList ID="ddlGrp" runat="server" AppendDataBoundItems="true" 
                                                                DataTextField="Grp_Dsc" DataValueField="IdGrp">
                                                                <asp:ListItem Value="-1">Todos</asp:ListItem></asp:DropDownList></td></tr><tr>
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
                                                            <asp:Label ID="lblDatIni0" runat="server" Text="Data Inicial:"></asp:Label></td><td width="5">
                                                        </td>
                                                        <td align="left">
                                                            <asp:TextBox ID="txtDatIni" runat="server" SkinID="datepicker" Width="100px"></asp:TextBox></td></tr><tr>
                                                        <td style="height: 10px" colspan="3">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="height: 22px" width="150">
                                                            <asp:Label ID="lblDatFim0" runat="server" Text="Data Final:"></asp:Label></td><td style="height: 22px" width="5">
                                                        </td>
                                                        <td align="left">
                                                            <asp:TextBox ID="txtDatFim" runat="server" SkinID="datepicker" Width="100px"></asp:TextBox></td></tr><tr>
                                                        <td colspan="3" height="10">
                                                            </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="height: 22px" width="150">
                                                            Procedimento:</td><td style="height: 22px" width="5">
                                                        </td>
                                                        <td align="left">
                                                            
                                                            <div>
                                                                <asp:TextBox ID="txtPdmCod" runat="server"></asp:TextBox>
                                                                <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/Spacer.gif" />
                                                                <asp:LinkButton ID="btnAddPdm" runat="server" OnClick="btnAddPdm_Click">Adicionar</asp:LinkButton>
                                                                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/Spacer.gif" />
                                                                <asp:LinkButton ID="btnDelPdm" runat="server" OnClick="btnDelPdm_Click">Remover</asp:LinkButton>
                                                                <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/Spacer.gif" />
                                                                <asp:LinkButton ID="lbtShowPop" runat="server" CommandName="ShowPopup" OnClick="lbtShowPop_Click">Buscar Procedimento</asp:LinkButton>
                                                            </div>
                                                            <div>
                                                                <asp:ListBox ID="lbxPdm" runat="server" ClientIDMode="Static" Width="400px" CssClass="campo"></asp:ListBox>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3" height="10">
                                                        </td>
                                                    </tr>
                                                    <tr align="center">
                                                        <td colspan="3" height="10">
                                                            <asp:RadioButtonList ID="rblTip" runat="server" AutoPostBack="True" 
                                                                onselectedindexchanged="rblTip_SelectedIndexChanged" 
                                                                RepeatDirection="Horizontal">
                                                                <asp:ListItem Text="Visualizar" Value="V"></asp:ListItem><asp:ListItem Text="Inlcuir" Value="I"></asp:ListItem><asp:ListItem Selected="True" Text="Alterar" Value="U"></asp:ListItem><asp:ListItem Text="Finalizar" Value="F"></asp:ListItem></asp:RadioButtonList></td></tr><tr>
                                                        <td colspan="3" height="10">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3" height="10">
                                                            <asp:Image ID="imgMsg" runat="server" ImageUrl="../Images/ico_alert.gif" 
                                                                Visible="False" />
                                                            &nbsp;<asp:Label ID="lblMsg" runat="server" class="erro"></asp:Label></td></tr><tr>
                                                        <td align="right" style="height: 14px" width="150">
                                                        </td>
                                                        <td style="height: 14px" width="5">
                                                        </td>
                                                        <td align="left" style="width: 147px; height: 14px">
                                                            <asp:ImageButton ID="btnOk" runat="server" Height="19px" 
                                                                ImageUrl="../Images/bt_buscar.gif" OnClick="btnOk_Click" />
                                                        </td>
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
                                        <asp:GridView ID="grdNgc" runat="server" AutoGenerateColumns="False" 
                                            DataSourceID="dtsNgc" OnDataBound="grd_DataBound"
                                            Width="100%" AllowPaging="True" AllowSorting="True" DataKeyNames="IdNgc">
                                            <Columns>
                                                <asp:BoundField DataField="IdNgc" HeaderText="Id.Neg." InsertVisible="False" 
                                                    ReadOnly="True" SortExpression="IdNgc" />
                                                <asp:BoundField DataField="Lcr_IdCtt" HeaderText="Contradado" 
                                                     SortExpression="Lcr_IdCtt" ItemStyle-HorizontalAlign="Center" >
                                                    
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Lcr_SeqEnd" HeaderText="Seq.End." 
                                                    SortExpression="Lcr_SeqEnd" ItemStyle-HorizontalAlign="Center" >
                                                    
                                                    <ItemStyle HorizontalAlign="Center" />
                                                
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Rde_Nme" HeaderText="Rede" 
                                                    SortExpression="Rde_Nme" />
                                                <asp:BoundField DataField="Esp_Dsc" HeaderText="Especialidade" 
                                                    SortExpression="Esp_Dsc" />
                                                <asp:BoundField DataField="Ngc_Crt" HeaderText="Caráter" 
                                                    SortExpression="Ngc_Crt" ItemStyle-HorizontalAlign="Center" >
                                                <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Pdm_Cod" HeaderText="Procedimento" 
                                                    SortExpression="Pdm_Cod" />
                                                <asp:BoundField DataField="Grp_Dsc" HeaderText="Grupo" 
                                                    SortExpression="Grp_Dsc" />
                                                <asp:BoundField DataField="Ngc_DatIni" HeaderText="Data Ini."
                                                    SortExpression="Ngc_DatIni" DataFormatString="{0:dd/MM/yyyy}" />
                                                <asp:BoundField DataField="Ngc_DatFim" HeaderText="Data Fim" 
                                                    SortExpression="Ngc_DatFim" DataFormatString="{0:dd/MM/yyyy}" />
                                                <asp:BoundField DataField="Pdm_QtdCh_" HeaderText="Qtd.CH" 
                                                    SortExpression="Pdm_QtdCh_" ItemStyle-HorizontalAlign="Right" >
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                               <asp:BoundField DataField="Ngc_FtrCh_" HeaderText="Fator" 
                                                    SortExpression="Ngc_FtrCh_" ItemStyle-HorizontalAlign="Right" >
                                                   <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Pdm_QtdFlm" HeaderText="Qtd.Filme" 
                                                    SortExpression="Pdm_QtdFlm" ItemStyle-HorizontalAlign="Right" >
                                                    <ItemStyle HorizontalAlign="Right" />
                                               </asp:BoundField>
                                                <asp:BoundField DataField="Ngc_VlrFlm" HeaderText="Vlr.Filme" 
                                                    SortExpression="Ngc_VlrFlm" ItemStyle-HorizontalAlign="Right" >
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Ngc_Vlr" HeaderText="Valor" 
                                                    SortExpression="Ngc_Vlr" ItemStyle-HorizontalAlign="Right" >
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Ngc_VlrTot" HeaderText="Total" 
                                                    SortExpression="Ngc_VlrTot" ItemStyle-HorizontalAlign="Right" >
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>
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
                                        <asp:SqlDataSource ID="dtsNgc" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                            SelectCommand="ssAtz_NgcCtt" SelectCommandType="StoredProcedure" 
                                            CancelSelectOnNullParameter="False">
                                            <SelectParameters>
                                                <asp:Parameter Name="IdNgc" Type="Int32" />
                                                <asp:Parameter Name="IdCtt" Type="Int64" />
                                                <asp:Parameter Name="Cte_SeqEnd" Type="String" />
                                                <asp:Parameter Name="IdRde" Type="String" />
                                                <asp:Parameter Name="IdEsp" Type="Int16" />
                                                <asp:Parameter Name="IdGrp" Type="Byte" />
                                                <asp:Parameter Name="Pdm_Cod" Type="String" />
                                                <asp:Parameter Name="Ngc_DatIni" Type="DateTime" />
                                                <asp:Parameter Name="Ngc_DatFim" Type="DateTime" />
                                                <asp:Parameter Name="Ngc_Crt" Type="String" />
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
                                        <%--<asp:UpdatePanel runat="server" ID="upnInsert" UpdateMode="Conditional">
                                        <ContentTemplate>--%>
                                        <table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td colspan="3">
                                                    <asp:Label ID="lblTotNgc2" runat="server" CssClass="erro"></asp:Label></td>
                                            </tr>                                            
                                            <tr>
                                                <td colspan="3">
                                                </td>
                                                <td colspan="3" width ="5">
                                                    &nbsp;</td></tr><tr>
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
                                                    <asp:RadioButton ID="rbtFtr2" runat="server" AutoPostBack="True" 
                                                        GroupName="Upd" oncheckedchanged="rbtFtr2_CheckedChanged" Text="Fator CH" 
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
                                                    <asp:RadioButton ID="rbtVlr2" runat="server" AutoPostBack="True" 
                                                        GroupName="Upd" oncheckedchanged="rbtVlr2_CheckedChanged" Text="Valor" 
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
                                                    <asp:Label ID="Label1" runat="server" Text="Valor do Filme:"></asp:Label></td><td width="5">                                                    
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
                                        </tbody>
                                        </table>
                                        <%--</ContentTemplate>
                                        </asp:UpdatePanel>--%>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                            </table> 
                        </asp:View>
                        <asp:View runat="server"  ID="vw3">
                            <table style="width:100%;">
                                <tr>
                                    <td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 20px; width: 752px; padding-top: 20px; " 
                                         valign="top"><h3>Alterar</h3></td>
                                </tr>
                                <tr>
                                    <td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px;
                                        padding-top: 20px" valign="top">
                                        <%--<asp:UpdatePanel runat="server" ID="upnEdit" UpdateMode="Conditional">
                                        <ContentTemplate>--%>
                                        <table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td colspan="3">                                                    
                                                    <asp:Label ID="lblTotNgc3" runat="server" CssClass="erro"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" width ="5">
                                                    &nbsp;</td></tr><tr>
                                                <td align="right" width="150">
                                                    <asp:RadioButton ID="rbtFtr3" runat="server" AutoPostBack="True" 
                                                        GroupName="Upd" Text="Fator CH" 
                                                        TextAlign="Left" oncheckedchanged="rbtFtr_CheckedChanged" />
                                                </td>
                                                <td width ="5">
                                                    </td>
                                                <td align="left">
                                                    <asp:TextBox ID="txtFtr3" runat="server" Enabled="false"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                </td>
                                                </tr><tr>
                                                <td align="right" style="width:150px">
                                                    <asp:RadioButton ID="rbtVlr3" runat="server" AutoPostBack="True" 
                                                        GroupName="Upd" oncheckedchanged="rbtVlr_CheckedChanged" Text="Valor" 
                                                        TextAlign="Left" />
                                                </td>
                                                <td width="5">
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtVlr3" runat="server" Enabled="false"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    
                                                </td>
                                                </tr><tr>
                                                <td align="right" style="width:150px">
                                                    Valor do Filme:</td>
                                                <td>
                                                </td>
                                                <td width="5">
                                                    <asp:TextBox ID="txtVlrFlm3" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    
                                                    </td></tr><tr>
                                                <td colspan="3" height="10">
                                                    <asp:Image ID="imgMsg3" runat="server" ImageUrl="../Images/ico_alert.gif" 
                                                        Visible="False" />
                                                    <asp:Label ID="lblMsg3" runat="server" class="erro"></asp:Label>
                                                </td>
                                            </tr>
                                             <tr>
                                                <td colspan="3" height="10">
                                                    &nbsp;</td></tr><tr>
                                                <td align="right" style="height: 14px" width="150">
                                                    <asp:ImageButton ID="ibtSave3" runat="server" Height="19px" 
                                                        ImageUrl="~/Images/bt_gravar.GIF" onclick="ibtSave3_Click" />
                                                </td>
                                                <td style="height: 14px" width="5">
                                                </td>
                                                <td align="left" style="width: 147px; height: 14px">
                                                    <asp:ImageButton ID="ibtCancel" runat="server" 
                                                        ImageUrl="~/Images/bt_cancelar.GIF" onclick="ibtCancel_Click" />
                                                </td>
                                            </tr>
                                        </tbody>
                                        </table>
                                        <%--</ContentTemplate>
                                        </asp:UpdatePanel>--%>
                                        <br />
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
                                        <%--<asp:UpdatePanel runat="server" ID="upnDelete" UpdateMode="Conditional">
                                        <ContentTemplate>--%>
                                        <table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
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
                                        </tbody>
                                        </table>
                                        <%--</ContentTemplate>
                                        </asp:UpdatePanel>--%>
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
                </td>
            </tr>
        </table>
        <br />
    <ajaxToolKit:ModalPopupExtender ID="ModalPopupExtenderPdm" runat="server" TargetControlID="btnPopPdm" 
        PopupControlID="ModalPanelPdm" DropShadow="true" BackgroundCssClass="modalBackground">
    </ajaxToolKit:ModalPopupExtender> 
        <asp:Panel id="ModalPanelPdm" runat="server" CssClass="modalPopup" Width="830px" Direction="LeftToRight" BackColor="White" >
            <table style="border-right: #ce5c09 thin double; border-top: #ce5c09 thin double; border-left: #ce5c09 thin double; width: 100%; border-bottom: #ce5c09 thin double; background-color: #ffffff">
                <tbody>
                    <tr>
                        <td style="width: 937px; height: 45px">
                            <table cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 9px; height: 37px" align="left"><img height="37" alt="" src="../Images/tit_left.gif" width="9" /></td>
                                        <td style="height: 37px" bgColor="#f4f4f4"><h2>Busca de procedimento</h2></td>
                                        <td style="width: 9px; height: 37px" align="left"><img height="37" alt="" src="../Images/tit_right.gif" width="9" /></td>
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
                                        <td style="height: 22px" align="right">Descrição:&nbsp;</td><td style="width: 140px; height: 22px" align="right"><asp:TextBox id="txtPopPdmDsc" 
                                                runat="server" CssClass="campo" Width="140px"></asp:TextBox></td><td style="height: 22px" valign="top" align="left" width="78"></td>
                                        <td style="width: 56px; height: 22px" align="right">Código:&nbsp;</td><td style="height: 22px" align="right" width="140"><asp:TextBox id="txtPopPdmCod" 
                                                runat="server" Width="140px"></asp:TextBox></td><td style="padding-right: 0px; padding-left: 5px; padding-bottom: 0px; padding-top: 0px; height: 22px" vAlign=top align=left width=78>
                                            <asp:ImageButton id="btnPopBuscarPdm" onclick="btnPopBuscarPdm_Click" 
                                                runat="server" ImageUrl="../Images/bt_buscar.gif"></asp:ImageButton></td>
                                    </tr>
                                </tbody>
                            </table>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-right: 4px; padding-left: 4px; padding-bottom: 0px; padding-top: 0px; " 
                            valign="middle" align="center">
                            <asp:GridView ID="grdPopPdm" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" 
                                DataKeyNames="Pdm_Cod,Pdm_Dsc,IdPdm,Pdm_Atv" DataSourceID="dtsPdm" 
                                OnDataBound="grd_DataBound" 
                                OnSelectedIndexChanged="grdPopPdm_SelectedIndexChanged" 
                                OnSorted="grdPopPdm_Sorted" Width="100%">
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
                                        <asp:DropDownList ID="ddlGrdPages" runat="server" AutoPostBack="True" 
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
                            <asp:SqlDataSource id="dtsPdm" runat="server" SelectCommandType="StoredProcedure" SelectCommand="ssAtz_Pdm" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" CancelSelectOnNullParameter="False">
                                <SelectParameters>
                                    <asp:Parameter Name="IdPdm" Type="Int32" />
                                    <asp:Parameter Name="Pdm_Cod" Type="String" />
                                    <asp:Parameter Name="Pdm_IdGrp" Type="Int16" />
                                    <asp:Parameter Name="Pdm_Dsc" Type="String" />
                                    <asp:Parameter Name="Grp_Dsc" Type="String" />
                                    <asp:Parameter DefaultValue="" Name="Pdm_Atv" Type="Boolean" />
                                </SelectParameters>
                            </asp:SqlDataSource> 
                            <asp:Label id="lblEmptyGrid" runat="server" Text=""></asp:Label><h2 align="right">&nbsp;
                            <asp:ImageButton id="ibtFecharPdm" onclick="ibtFecharPdm_Click" runat="server" 
                                    ImageUrl="~/Images/bt_fecha.gif"></asp:ImageButton></h2>
                        </td>
                    </tr>
                </tbody>
            </table>
        </asp:Panel> 
        <asp:ImageButton ID="btnPgaIni" runat="server" ImageUrl="~/Images/bt_home.gif" OnClick="btnPgaIni_Click" />&nbsp;
        <asp:ImageButton ID="btnNewPsq" runat="server" ImageUrl="~/Images/bt_nova_pesquisa.gif"
                    OnClick="btnNewPsq_Click" />
        <asp:HiddenField ID="hdfIdRde" runat="server" />
        <asp:HiddenField ID="hdfSeqEnd" runat="server" />                
        <asp:HiddenField ID="hdfPdmCod" runat="server" /> 
        <br />
        <asp:Button ID="btnPopPdm" runat="server" CssClass="linkbutton" />  
</ContentTemplate>
</asp:UpdatePanel>        
</asp:Content>

