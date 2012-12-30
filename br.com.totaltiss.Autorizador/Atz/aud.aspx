<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Inherits="Atz_aud" Title="Auditoria" Codebehind="aud.aspx.cs" %>
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

        $(function($) {
            $(".datepicker").mask("99/99/9999");
            $("[name$='txtPdmCod']").mask("99.99.999-9");
            $("[name$='txtBnfMtr']").mask("99999.999999.99");
        });
     </script>    
    <asp:MultiView ID="mvw" runat="server" ActiveViewIndex="0">    
        <asp:View ID="vw1" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
                        height: 37px">
                        <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td align="left" style="width: 8px">
                                    <img alt="" height="37" src="../images/tit_left.gif" width="9" /></td>
                                <td bgcolor="#f4f4f4">
                                    <h2>
                                        Auditoria</h2>
                                </td>
                                <td align="left" width="9">
                                    <img alt="" height="37" src="../images/tit_right.gif" width="9" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px;
                        padding-top: 20px" valign="top">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td colspan="3">
                                    <asp:Image ID="imgMsg" runat="server" ImageUrl="../Images/ico_alert.gif" Visible="False" />
                                    &nbsp;<asp:Label ID="lblMsg" runat="server" class="erro"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" height="25">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="150">
                                    Data Inicial:</td>
                                <td width="5">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtDatIni" runat="server" CssClass="datepicker" Width="100px" 
                                        MaxLength="10"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td colspan="3" style="height: 10px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 22px" width="150">
                                    Data Final:</td>
                                <td style="height: 22px" width="5">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtDatFim" runat="server" CssClass="datepicker" Width="100px" 
                                        MaxLength="10"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="150" style="height: 20px">
                                    Ordernar por:</td>
                                <td width="5" style="height: 20px">
                                </td>
                                <td align="left" style="height: 20px">
                                    <asp:DropDownList ID="ddlOrd" runat="server" CssClass="campo" Width="150px">
                                        <asp:ListItem Value="1">Data</asp:ListItem>
                                        <asp:ListItem Value="1">Guia</asp:ListItem>
                                        <asp:ListItem Value="3">Benefici&#225;rio</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="150">
                                    Tipo:</td>
                                <td width="5">
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="ddlTip" runat="server" AppendDataBoundItems="True" CssClass="campo"
                                        Width="150px">
                                        <asp:ListItem Value="-1">Selecione</asp:ListItem>
                                        <asp:ListItem Value="1">Consulta Eletiva</asp:ListItem>
                                        <asp:ListItem Value="2">SP/SADT</asp:ListItem>
                                        <asp:ListItem Value="0">Solicita&#231;&#227;o SP/SADT</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="150">
                                    Situação:</td>
                                <td width="5">
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="ddlSit" runat="server" AppendDataBoundItems="True" CssClass="campo"
                                        Width="150px" DataTextField="Sit_Dsc" DataValueField="IdSit">
                                        <asp:ListItem Value="-1">Selecione</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="150">
                                    Código do Procedimento:</td>
                                <td width="5">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtPdmCod" runat="server" CssClass="campo" Width="100px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="150">
                                    Número da Autorização:</td>
                                <td width="5">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtSnh" runat="server" CssClass="campo" Width="100px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 22px" width="150">
                                    Matrícula do Beneficiário:</td>
                                <td style="height: 22px" width="5">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtBnfMtr" runat="server" CssClass="campo" Width="100px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 22px" width="150">
                                    Matrícula do Contratado:</td>
                                <td width="5">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtIdCtt" runat="server" CssClass="campo" Width="100px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 22px" width="150">
                                    Matrícula do Profissional:</td>
                                <td style="height: 22px" width="5">
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtPrfMtr" runat="server" CssClass="campo" Width="100px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 14px" width="150">
                                </td>
                                <td style="height: 14px" width="5">
                                </td>
                                <td align="left" style="width: 147px; height: 14px">
                                    <asp:ImageButton ID="btnOk" runat="server" ImageUrl="../Images/bt_buscar.gif" OnClick="btnOk_Click" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="vw2" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px;
                                    padding-top: 0px; height: 37px" width="9">
                                    <img alt="" height="37" src="../Images/tit_left.gif" width="9" /></td>
                                <td bgcolor="#f4f4f4" style="height: 37px">
                                    <h2>
                                        Auditoria - Resultado da Pesquisa</h2>
                                </td>
                                <td align="left" style="height: 37px" width="9">
                                    <img alt="" height="37" src="../Images/tit_right.gif" width="9" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="15">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
                        height: 47px">
                        <div align="right">
                            &nbsp;&nbsp;<a href="pes.aspx"></a> &nbsp;</div>
                        <br />
                        <asp:GridView ID="grdMaster" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="dts" OnDataBound="grdSolPen_DataBound"
                            OnRowCreated="gvHover_RowCreated" 
                            Width="100%" AllowPaging="True" AllowSorting="True" PageSize="15">
                            <Columns>
                                <asp:BoundField DataField="Bnf_Mtr" HeaderText="Matr&#237;cula" SortExpression="Bnf_Mtr" />
                                <asp:HyperLinkField DataNavigateUrlFields="IdSol,Sol_Tip" DataNavigateUrlFormatString="audres.aspx?Sol={0}&amp;Tip={1}"
                                    DataTextField="Bnf_Nme" HeaderText="Benefici&#225;rio" SortExpression="Bnf_Nme" />
                                <asp:BoundField DataField="Sol_Snh" HeaderText="Senha" SortExpression="Sol_Snh" />
                                <asp:BoundField DataField="Sol_DatEms" HeaderText="Emiss&#227;o" 
                                    SortExpression="Sol_DatEms" ItemStyle-HorizontalAlign="Center" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Sol_IdCtt" HeaderText="Contratado" 
                                    SortExpression="Sol_IdCtt" ItemStyle-HorizontalAlign="Center" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Sol_SeqEnd" HeaderText="Seq.End." 
                                    SortExpression="Sol_SeqEnd" ItemStyle-HorizontalAlign="Center" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Prf_Mtr" HeaderText="Profissional" SortExpression="Prf_Mtr" />
                                <asp:BoundField DataField="Sol_TipDsc" HeaderText="Tipo" ReadOnly="True" SortExpression="Sol_TipDsc" />
                                <asp:BoundField DataField="Sol_Crt" HeaderText="Caráter" ReadOnly="True" 
                                    SortExpression="Sol_Crt" ItemStyle-HorizontalAlign="Center" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                            <FooterStyle Font-Bold="True" ForeColor="White" />
                            <PagerTemplate>
                                <div align="center" height="20">
                                    <asp:ImageButton ID="ImageButton1SolPendentes" runat="server" CommandArgument="First"
                                        ImageUrl="~/Images/seta1_1_on.gif" OnCommand="PaginategrdSolPen" />&nbsp;
                                    <asp:ImageButton ID="ImageButton2SolPendentes" runat="server" CommandArgument="Prev"
                                        ImageUrl="~/Images/seta1_2_on.gif" OnCommand="PaginategrdSolPen" />
                                    Página
                                    <asp:DropDownList ID="ddlPagesSolPendentes" runat="server" AutoPostBack="True" CssClass="campo"
                                        OnSelectedIndexChanged="ddlPagesSolPendentes_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    de
                                    <asp:Label ID="lblPageCountSolPendentes" runat="server"></asp:Label>&nbsp;
                                    <asp:ImageButton ID="ImageButton3SolPendentes" runat="server" CommandArgument="Next"
                                        ImageUrl="~/Images/seta2_1_on.gif" OnCommand="PaginategrdSolPen" />&nbsp;
                                    <asp:ImageButton ID="ImageButton4SolPendentes" runat="server" CommandArgument="Last"
                                        ImageUrl="~/Images/seta2_2_on.gif" OnCommand="PaginategrdSolPen" /></div>
                            </PagerTemplate>
                        </asp:GridView>
                        &nbsp; &nbsp;
                        <asp:SqlDataSource ID="dts" runat="server" CancelSelectOnNullParameter="False"
                            ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" SelectCommand="ssAtz_Aud"
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:Parameter Name="IdSit" Type="Byte" />
                                <asp:Parameter Name="Gia_DatIni" Type="DateTime" />
                                <asp:Parameter Name="Gia_DatFim" Type="DateTime" />
                                <asp:Parameter Name="Gia_Tip" Type="Byte" />
                                <asp:Parameter Name="Gia_Snh" Type="String" />
                                <asp:Parameter Name="Bnf_Mtr" Type="String" />
                                <asp:Parameter Name="IdCtt" Type="Int64" />
                                <asp:Parameter Name="Prf_Mtr" Type="String" />
                                <asp:Parameter Name="Ord" Type="String" />
                                <asp:Parameter Name="Pdm_Cod" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <div align="right">
                            &nbsp; <a href="pes.aspx"></a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
                        height: 47px">
                            <asp:Image ID="Image1" runat="server" ImageUrl="../Images/ico_alert.gif" Visible="False" />
                            <asp:Label ID="Label1" runat="server" CssClass="erro"></asp:Label></td>
                </tr>
            </table>
            <asp:ImageButton ID="btnPgaIni" runat="server" ImageUrl="~/Images/bt_home.gif" OnClick="btnPgaIni_Click" />&nbsp;
            <asp:ImageButton ID="btnNewPsq" runat="server" ImageUrl="~/Images/bt_nova_pesquisa.gif"
                OnClick="btnNewPsq_Click" /></asp:View>
    </asp:MultiView>
</asp:Content>

