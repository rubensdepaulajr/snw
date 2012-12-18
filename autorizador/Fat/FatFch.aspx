<%@ Page Title="" Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="FatFch.aspx.cs" Inherits="Fat_FatFch" %>

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


    <div style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px" bgcolor="#f4f4f4">
        <table cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
            <tbody>
                <tr><td style="width: 9px" align="left"><img height="37" alt="" src="../Images/tit_left.gif" width="9" /></td>
                <td bgcolor="#f4f4f4">
                    <h2>Período Fechamento</h2>
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
                    <td colspan="3" style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px">
                        <asp:Image id="ImgErro" runat="server" Visible="False" ImageAlign="AbsMiddle" ImageUrl="~/Images/ico_alert.gif" Height="25px" Width="25px"></asp:Image> 
                        <asp:Label id="lblErro" runat="server" CssClass="erro"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3"></td></tr>
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
                    <td style="height: 14px; width: 150px;" align=right>
                        Grupo de Contratado:
                    </td>
                    <td style="width: 5px; height: 14px"></td>
                    <td style="height: 14px" align="left" colspan="2">
                        <span class="cinza-claro">
                            <asp:DropDownList ID="ddlTpd" runat="server" DataSourceID="edsTpd" 
                                DataTextField="Tpd_Dsc" DataValueField="IdTpd" AppendDataBoundItems="true">
                                <asp:ListItem Value="">TODOS</asp:ListItem>
                            </asp:DropDownList>
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
                    <td style="height: 14px" align="left" colspan="2">
                        <span class="cinza-claro">
                            <asp:ImageButton id="ibtBuscar" runat="server" 
                            ImageUrl="~/Images/bt_buscar.gif" onclick="ibtBuscar_Click"></asp:ImageButton>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="height: 33px">
                        <br />
                    </td></tr>
                <tr>
                    <td style="padding-right: 0px; padding-left: 40px; padding-bottom: 0px; padding-top: 0px" valign="middle" colspan="3" height="35">
                        <strong>RESULTADO DA PESQUISA</strong>
                    </td>
                </tr>
                <tr>
                    <td style="padding-right: 0px; padding-left: 40px; padding-bottom: 0px; padding-top: 0px" valign="middle" colspan="3" height="35">
                        <asp:ImageButton ID="ibtNew" runat="server" 
                            ImageUrl="~/Images/bt_adicionar.gif" onclick="ibtNew_Click" />
                        <img alt="" src="../Images/Spacer.gif" style="width: 1px; height: 1px" />
                        <asp:ImageButton ID="ibtUpd" runat="server" ImageUrl="~/Images/bt_alterar.gif" />
                    </td>                    
                </tr>
                <tr>
                    <td style="padding-right: 0px; padding-left: 40px; padding-bottom: 0px; padding-top: 0px" valign="middle" colspan="3" height="35">
                        <asp:Panel ID="pnlIns" runat="server">
                            <table cellspacing="0" cellpadding="0" border="0">
                                <tbody>
                                    <tr>
                                        <td colspan="3"></td></tr>
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
                                                <asp:Label ID="lblFchCpc" runat="server" Text=""></asp:Label>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" height="10"></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 14px; width: 150px;" align="right">
                                            Grupo de Contratado:
                                        </td>
                                        <td style="width: 5px; height: 14px"></td>
                                        <td style="height: 14px" align="left" colspan="2">
                                            <span class="cinza-claro">
                                                <asp:DropDownList ID="ddlTpd2" runat="server" DataSourceID="edsTpd" 
                                                    DataTextField="Tpd_Dsc" DataValueField="IdTpd" AppendDataBoundItems="true">                                                    
                                                </asp:DropDownList>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" height="10"></td>
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
                                </tbody>
                            </table>
                       </asp:Panel>
                    </td> 
                </tr>
                <tr>
                    <td style="padding-right: 0px; padding-left: 60px; padding-bottom: 0px; padding-top: 0px" colspan="3">
                        <asp:GridView ID="grd" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" CssClass="grid-view-left" DataSourceID="dts" OnDataBound="grd_DataBound"
                                OnRowCreated="gvHover_RowCreated" PageSize="15" Width="800px">
                            <Columns>
                                <asp:BoundField DataField="Fch_Cpc" 
                                    HeaderText="Competência" SortExpression="Fch_Cpc" ReadOnly="True" >
                                <ItemStyle Width="110px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IdCtt" 
                                    HeaderText="Matrícula" SortExpression="IdCtt" ReadOnly="True" >
                                <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Ctt_Nme" 
                                    HeaderText="Contratado" SortExpression="Ctt_Nme" ReadOnly="True" >
                                <ItemStyle Width="240px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Fch_Ent" 
                                    HeaderText="Entrega" SortExpression="Fch_Ent" ReadOnly="True" 
                                    DataFormatString="{0:dd/MM/yyyy}" >
                                <ItemStyle Width="110px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Fch_DatIni" 
                                    HeaderText="Início" SortExpression="Fch_DatIni" ReadOnly="True" 
                                    DataFormatString="{0:dd/MM/yyyy}" >
                                <ItemStyle Width="110px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Fch_DatFim" HeaderText="Término" ReadOnly="True" 
                                    SortExpression="Fch_DatFim" DataFormatString="{0:dd/MM/yyyy}" >
                                <ItemStyle Width="120px" />
                                </asp:BoundField>
                                <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
                            </Columns>
                            <PagerTemplate>
                                <div align="center" height="20">
                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument="First" ImageUrl="~/Images/seta1_1_on.gif"
                                        OnCommand="Paginategrd" />
                                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CommandArgument="Prev" ImageUrl="~/Images/seta1_2_on.gif"
                                        OnCommand="Paginategrd" />&#160;Página 
                                    <asp:DropDownList ID="ddlPages" runat="server" AutoPostBack="True" CssClass="campo"
                                        OnSelectedIndexChanged="ddlPages_SelectedIndexChanged">
                                    </asp:DropDownList>&nbsp;de 
                                    <asp:Label ID="lblPageCount" runat="server"></asp:Label>
                                    <asp:ImageButton ID="ImageButton3" runat="server" CommandArgument="Next" ImageUrl="~/Images/seta2_1_on.gif"
                                        OnCommand="Paginategrd" />
                                    &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CommandArgument="Last" ImageUrl="~/Images/seta2_2_on.gif"
                                        OnCommand="Paginategrd" /></div>
                            </PagerTemplate>
                        </asp:GridView>
                        <asp:SqlDataSource id="dts" runat="server" SelectCommandType="StoredProcedure" 
                            SelectCommand="ssFat_Fch" 
                            ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                            CancelSelectOnNullParameter="False">
                            <SelectParameters>
                                <asp:Parameter Name="IdOpe" Type="Int16" DefaultValue="1" />
                                <asp:Parameter Name="IdCtt" Type="Int64" />
                                <asp:ControlParameter ControlID="ddlTpd" Name="IdTpd" 
                                    PropertyName="SelectedValue" Type="Byte" />
                                <asp:ControlParameter ControlID="txtFchCpc" Name="FchCpc" PropertyName="Text" 
                                    Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource> 
                    </td>
                </tr>
                <tr>
                    <td valign="top" colspan="3" height="35">
                        <br />
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:EntityDataSource ID="edsTpd" runat="server" 
            ConnectionString="name=AppEntities" DefaultContainerName="AppEntities" 
            EnableFlattening="False" EntitySetName="Atz_Tpd">
        </asp:EntityDataSource>
</asp:Content>

