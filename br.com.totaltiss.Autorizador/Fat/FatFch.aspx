<%@ Page Title="" Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Inherits="Fat_FatFch" Codebehind="FatFch.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <script type="text/javascript">
        $(function () {
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
    <asp:MultiView ID="mvw" runat="server" ActiveViewIndex="0">
        <asp:View ID="vw1" runat="server">
            <div style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px" bgcolor="#f4f4f4">
                <table cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                    <tbody>
                        <tr><td style="width: 9px" align="left"><img height="37" alt="" src="../Images/tit_left.gif" width="9" /></td>
                        <td bgcolor="#f4f4f4">
                            <h2>Período de Fechamento Competência</h2>
                        </td>
                            <td style="width: 9px" align="left"><img height="37" alt="" src="../Images/tit_right.gif" width="9" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 40px">&nbsp;</div>

            <table cellspacing="0" cellpadding="0" border="0">
                <tbody>
                    <tr>
                        <td style="padding-right: 0px; padding-left: 40px; padding-bottom: 0px; padding-top: 0px; height: 35px;" valign="middle" colspan="3">
                            <strong>PESQUISA</strong>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 150px; height: 14px">
                            Competência:</td>
                        <td style="width: 5px; height: 14px;"></td>
                        <td style="width: 623px; height: 14px;" align="left">
                            <span class="cinza-escuro">
                                <asp:TextBox ID="txtFchCpc" runat="server" CssClass="campo" MaxLength="6"></asp:TextBox>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" height="10"></td>
                    </tr>
                    <tr>
                        <td style="height: 14px; width: 150px;" align="right">
                        </td>
                        <td style="width: 5px; height: 14px">
                        </td>
                        <td style="height: 14px" align="left">
                            <span class="cinza-claro">
                                <asp:ImageButton id="ibtBuscar" runat="server" 
                                ImageUrl="~/Images/bt_buscar.gif" onclick="ibtBuscar_Click"></asp:ImageButton>
                            </span>
                        </td>
                    </tr>
                    <tr>                
                        <td style="height: 14px; width: 150px;" align="right">
                        </td>
                        <td style="width: 5px; height: 14px">
                        </td>
                        <td style="height: 14px" align="left">
                            <asp:Image ID="imgMsg" runat="server" ImageUrl="../Images/ico_alert.gif" Visible="False" />&nbsp;
                            <asp:Label ID="lblMsg" runat="server" class="erro"></asp:Label>
                        </td>
                    </tr>    
                    <tr>
                        <td colspan="3" style="padding-right: 0px; padding-left: 40px; padding-bottom: 0px; padding-top: 0px; height: 35px;" valign="middle"><strong>RESULTADO DA PESQUISA</strong> </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="padding-right: 0px; padding-left: 60px; padding-bottom: 0px; padding-top: 0px">
                            <asp:GridView ID="grd" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="grid-view-left" DataKeyNames="Ctt_IdTpd,Fch_Cpc" DataSourceID="dts" OnDataBound="grd_DataBound" OnRowCreated="gvHover_RowCreated" PageSize="15" Width="800px">
                                <Columns>
                                    <asp:BoundField DataField="Tpd_Dsc" HeaderText="Grupo de Contratdos" ReadOnly="True" SortExpression="Tpd_Dsc">
                                    <ItemStyle Width="240px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Fch_Cpc" HeaderText="Competência" ReadOnly="True" SortExpression="Fch_Cpc">
                                    <ItemStyle HorizontalAlign="Center" Width="110px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Fch_DatIni" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Início" ReadOnly="True" SortExpression="Fch_DatIni">
                                    <ItemStyle HorizontalAlign="Center" Width="110px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Fch_DatFim" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Fim" ReadOnly="True" SortExpression="Fch_DatFim">
                                    <ItemStyle HorizontalAlign="Center" Width="110px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Fch_Ent" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Entrega" ReadOnly="True" SortExpression="Fch_Ent">
                                    <ItemStyle HorizontalAlign="Center" Width="110px" />
                                    </asp:BoundField>
                                    <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
                                </Columns>
                                <PagerTemplate>
                                    <div align="center" height="20">
                                        <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument="First" ImageUrl="~/Images/seta1_1_on.gif" OnCommand="Paginategrd" />
                                        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CommandArgument="Prev" ImageUrl="~/Images/seta1_2_on.gif" OnCommand="Paginategrd" />
                                        &nbsp;Página
                                        <asp:DropDownList ID="ddlPages" runat="server" AutoPostBack="True" CssClass="campo" OnSelectedIndexChanged="ddlPages_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        &nbsp;de
                                        <asp:Label ID="lblPageCount" runat="server"></asp:Label>
                                        <asp:ImageButton ID="ImageButton3" runat="server" CommandArgument="Next" ImageUrl="~/Images/seta2_1_on.gif" OnCommand="Paginategrd" />
                                        &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CommandArgument="Last" ImageUrl="~/Images/seta2_2_on.gif" OnCommand="Paginategrd" />
                                    </div>
                                </PagerTemplate>
                            </asp:GridView>
                            <asp:SqlDataSource ID="dts" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" DeleteCommand="DELETE fch
    FROM dbo.Fat_Fch fch, dbo.Atz_Ctt
    WHERE IdCtt = Fch_IdCtt AND
    Fch_Cpc = @FchCpc AND 
    Ctt_IdTpd = @IdTpd" SelectCommand="SELECT 
    DISTINCT Ctt_IdTpd, Tpd_Dsc, Fch_Cpc, Fch_DatIni, Fch_DatFim, Fch_Ent
    FROM 
    dbo.Fat_Fch, dbo.Atz_Ctt, dbo.Atz_Tpd
    WHERE 
    IdCtt = Fch_IdCtt AND
    IdTpd = Ctt_IdTpd AND
    Fch_Cpc = @FchCpc AND
    Fch_IdOpe = @IdOpe
    ORDER BY 
    Tpd_Dsc">
                                <DeleteParameters>
                                    <asp:Parameter Name="FchCpc" />
                                    <asp:Parameter Name="IdTpd" />
                                </DeleteParameters>
                                <SelectParameters>
                                    <asp:Parameter Name="FchCpc" />
                                    <asp:Parameter Name="IdOpe" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" height="35" valign="top">
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-right: 0px; padding-left: 40px; padding-bottom: 0px; padding-top: 0px" valign="middle" colspan="3" height="35">
                            <asp:ImageButton ID="ibtNew" runat="server" ImageUrl="~/Images/bt_adicionar.gif" onclick="ibtNew_Click" />
                            <img alt="" src="../Images/Spacer.gif" style="width: 1px; height: 1px" />
                            <asp:ImageButton ID="ibtDel" runat="server" ImageUrl="~/Images/bt_excluir.jpg" OnClick="ibtDel_Click" />
                        </td>                    
                    </tr>
                </tbody>
            </table>
            <asp:EntityDataSource ID="edsTpd" runat="server" 
                ConnectionString="name=AppEntities" DefaultContainerName="AppEntities" 
                EnableFlattening="False" EntitySetName="Atz_Tpd">
            </asp:EntityDataSource>
        </asp:View>
        <asp:View ID="vw2" runat="server">
            <table cellspacing="0" cellpadding="0" border="0">
                <tbody>
                    <tr>
                        <td colspan="3"></td></tr>
                    <tr>
                        <td style="padding-right: 0px; padding-left: 40px; padding-bottom: 0px; padding-top: 0px; height: 35px;" valign="middle" colspan="3">
                            <strong>CADASTRAR PERÍODO</strong>
                        </td>
                    </tr>
                                    
                    <tr>
                        <td style="height: 14px; width: 150px;" align="right">
                            Grupo de Contratado:
                        </td>
                        <td style="width: 5px; height: 14px"></td>
                        <td style="height: 14px" align="left" colspan="2">
                            <span class="cinza-claro">
                                <asp:DropDownList ID="ddlTpd" runat="server" DataSourceID="edsTpd" AutoPostBack="true"
                                    DataTextField="Tpd_Dsc" DataValueField="IdTpd" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlTpd_SelectedIndexChanged">                                                    
                                    <asp:ListItem Value="-1">Selecione</asp:ListItem>
                                </asp:DropDownList>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" height="10"></td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 150px; height: 14px">
                            Competência:</td>
                        <td style="width: 5px; height: 14px;"></td>
                        <td style="width: 623px; height: 14px;" align="left">
                            <span class="cinza-escuro">
                                <asp:Label ID="lblFchCpc" runat="server" Text=""></asp:Label>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" height="10"></td>
                    </tr>
                    <tr>
                        <td style="height: 14px; width: 150px;" align="right">
                            Data Entrega:
                        </td>
                        <td style="width: 5px; height: 14px"></td>
                        <td style="height: 14px" align="left" colspan="2">
                            <span class="cinza-claro">
                                <asp:TextBox ID="txtDatEnt" runat="server" CssClass="datepicker"></asp:TextBox>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 14px; width: 150px;" align="right">
                            Período:
                        </td>
                        <td style="width: 5px; height: 14px"></td>
                        <td style="height: 14px" align="left" colspan="2">
                            <span class="cinza-claro">
                                <asp:TextBox ID="txtDatIni" runat="server" CssClass="datepicker"></asp:TextBox>
                                a
                                <asp:TextBox ID="txtDatFim" runat="server" CssClass="datepicker"></asp:TextBox>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" height="10"></td>
                    </tr>
                    <tr>
                        <td colspan="3" height="10">
                            <asp:ImageButton ID="ibtGravar" runat="server" ImageUrl="~/Images/bt_gravar.gif" onclick="ibtGravar_Click" />
                            <img alt="" src="../Images/Spacer.gif" style="width: 1px; height: 1px" />
                            <asp:ImageButton ID="ibtCancelar" runat="server" ImageUrl="~/Images/bt_cancelar.gif" OnClick="ibtCancelar_Click" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>

