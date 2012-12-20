<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true"  Theme="Standard" CodeFile="exeexa.aspx.cs" Inherits="Atz_exeexa" Title="Execução de SP/SADT" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="server">
    <table cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
        <tbody>
            <tr>
                <td style="width: 9px" align="left"><img height="37" alt="" src="../Images/tit_left.gif" width="9" /></td>
                <td bgcolor="#f4f4f4"><h2>Execução de SP/SADT</h2></td>
                <td style="width: 9px" align="left"><img height="37" alt="" src="../Images/tit_right.gif" width="9" /></td>
            </tr>
        </tbody>
    </table>
    <div style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 40px">&nbsp;</div>
    <table>
        <tbody>
            <tr>
                <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 20px" 
                    valign="top" align="left" colspan="4">
                    <h3>Beneficiário</h3><br />
                </td>
            </tr>
            <tr>
                <td colspan="4" height="10"></td>
            </tr>
            <tr>
                <td valign="middle" align="right" width="150" height="10">Matrícula:</td>
                <td style="WIDTH: 5px"></td>
                <td align="left" ><asp:TextBox id="txtPsqBnf" runat="server" CssClass="campo"></asp:TextBox> &nbsp;
                <asp:ImageButton id="imgBtnAdicionar" onclick="imgBtnAdicionar_Click" runat="server" ImageUrl="~/Images/bt_adicionar.gif"></asp:ImageButton>
                <asp:Button id="lbtBuscar" onclick="lbtBuscar_Click" runat="server" CssClass="linkbutton" Font-Underline="True" Text="Busca avançada"></asp:Button> 
                <asp:Image id="Image1" runat="server" ImageUrl="~/Images/ico_ajuda_campos.gif"></asp:Image> </td>
                <td></td>
            </tr>
            <tr>
                <td style="height: 46px"></td>
                <td style="width: 5px; height: 46px;"></td>
                <td style="padding: 0px; height: 46px;">
                    <span class="resultado-beneficiario">
                        <asp:Label id="lblBnf_Mtr" runat="server" ForeColor="Black"></asp:Label>- 
                        <asp:Label id="lblBnf_Nme" runat="server" ForeColor="Black"></asp:Label>
                    </span></td>
                <td style="height: 46px">
                    <asp:Button id="lbtAlterarBnf" onclick="lbtBuscar_Click" runat="server" CssClass="linkbutton" Font-Underline="True" Text="Alterar Beneficiário"></asp:Button> 
                </td>
            </tr>
            <tr>
                <td height="10" colspan="4"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="width: 5px">&nbsp;</td>
                <td style="padding-right: 0px; padding-left: 0px; padding-bottom: 0px; padding-top: 0px">
                    <asp:Label runat="server" ID="lblBio" CssClass="erro"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td height="10" colspan="4"></td>
            </tr>
            <tr>
                <td align="right">Produto:</td>
                <td style="width: 5px"></td>
                <td colspan="2">
                    <asp:Label ID="lblPrdNme" runat="server"></asp:Label> </td>
            </tr>
            <tr>
                <td height="10" colspan="4"></td>
            </tr>
            <tr>
                <td align="right">Tipo de Atendimento:</td>
                <td style="width: 5px"></td>
                <td colspan="2">
                    <asp:DropDownList id="ddlTipoAtendimento" runat="server" CssClass="campo">                    
                        <asp:ListItem Value="-1">Selecione</asp:ListItem>
                        <asp:ListItem Value="1">1 - Remo&#231;&#227;o</asp:ListItem>
                        <asp:ListItem Value="2">2 - Pequena Cirurgia</asp:ListItem>
                        <asp:ListItem Value="3">3 - Terapias</asp:ListItem>
                        <asp:ListItem Value="4">4 - Consulta</asp:ListItem>
                        <asp:ListItem Value="5">5 - Exame</asp:ListItem>
                        <asp:ListItem Value="6">6 - Atendimento Domiciliar</asp:ListItem>
                        <asp:ListItem Value="7">7 - SADT Internado</asp:ListItem>
                        <asp:ListItem Value="8">8 - Quimioterapia</asp:ListItem>
                        <asp:ListItem Value="9">9 - Radioterapia</asp:ListItem>
                        <asp:ListItem Value="10">10 - Terapia Renal Substitutiva</asp:ListItem>                    
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td height="10" colspan="4"></td>
            </tr>
            <tr>
                <td align="right" style="height: 23px">Tipo de Saída:</td>
                <td style="width: 5px; height: 23px;"></td>
                <td colspan="2" style="height: 23px">
                    <asp:DropDownList id="ddlTipoSaida" runat="server" CssClass="campo">      
                        <asp:ListItem Value="-1">Selecione</asp:ListItem>
                        <asp:ListItem Value="1">1 - Retorno</asp:ListItem>
                        <asp:ListItem Value="2">2 - Retorno SADT</asp:ListItem>
                        <asp:ListItem Value="3">3 - Refer&#234;ncia</asp:ListItem>
                        <asp:ListItem Value="4">4 - Interna&#231;&#227;o</asp:ListItem>
                        <asp:ListItem Value="5">5 - Alta</asp:ListItem>
                        <asp:ListItem Value="6">6 - &#211;bito</asp:ListItem>
                    </asp:DropDownList> 
                </td>
            </tr>
            <tr>
                <td align="right" colspan="4">
                </td>                
            </tr>
            <tr>
                <td align="right" colspan="4"></td>                
            </tr>
            <tr>
                <td style="height: 16px" align="right">Data da Execução:</td>
                <td style="width: 5px; height: 16px"></td>
                <td style="height: 16px" colspan="2">
                    <asp:TextBox id="txtDat" runat="server" CssClass="cinza-claro" Width="72px" Enabled="False"></asp:TextBox> Hora: 
                    <asp:TextBox id="txtHor" runat="server" CssClass="campo" Width="30px" 
                        Enabled="False"></asp:TextBox> : 
                    <asp:TextBox id="txtMin" runat="server" CssClass="campo" Width="30px" 
                        Enabled="False"></asp:TextBox>
                    <img height="16" alt="" src="../Images/ico_ajuda_campos.gif" width="20" border="0" />
                </td>
            </tr>
            <tr>
                <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 20px" 
                    valign="top" align="left" colspan="4">
                    <h3>Procedimentos permitidos</h3>
                    <br />
                </td>
            </tr>
            </tbody>
    </table>
    <br />
    <table>
        <tbody>
            <tr>
                <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; width: 100%;">
                    <br />
                    <asp:UpdatePanel runat="server" ID="upnPdmCtt" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="pnlPdm" runat="server" Width="100%" Visible="False">
                                <asp:GridView id="grdPdm" runat="server" CssClass="grid-view" 
                                    DataSourceID="dtsExeExa" Width="100%" 
                                    DataKeyNames="IdPdm,IdSol,Spd_QtdAtz,Spd_IdSit,Gia_Crt" 
                                    OnRowCreated="gvHover_RowCreated" BorderWidth="1px" BorderStyle="Solid" 
                                    BorderColor="White" PageSize="5" Font-Size="X-Small" 
                                    AutoGenerateColumns="False">
                                    <RowStyle BackColor="#F4F4F4"></RowStyle>
                                    <Columns>
                                        <asp:TemplateField>
                                            <EditItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                            </EditItemTemplate>
                                            <HeaderTemplate>
                                                <asp:Button ID="Button1" runat="server"  CommandName="Show" Text="Todos"  CssClass="linkbutton" OnClick="chkSelectAll_CheckedChanged" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect" runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%">
                                            </ItemStyle>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Prf_Nme" HeaderText="Solicitante" SortExpression="Prf_Nme">
                                            <ItemStyle Width="30%"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Pdm_Cod" HeaderText="C&#243;digo" SortExpression="Pdm_Cod">
                                            <ItemStyle Width="10%"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Pdm_Dsc" HeaderText="Procedimento" SortExpression="Pdm_Dsc">
                                            <ItemStyle HorizontalAlign="Left" Width="35%">
                                            </ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Gia_Crt" HeaderText="Caráter" SortExpression="Gia_Crt">
                                            <ItemStyle Width="5%"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Spd_QtdAtz" HeaderText="Autorizados" SortExpression="Spd_QtdAtz">
                                            <ItemStyle Width="5%"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Spd_QtdRel" HeaderText="Realizados">
                                            <ItemStyle Width="5%"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Executados">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtExecutados" runat="server" CssClass="campo" Width="45px"></asp:TextBox>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%"></ItemStyle>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle Font-Size="Larger"></HeaderStyle>
                                </asp:GridView> 
                                <asp:SqlDataSource id="dtsExeExa" runat="server" CancelSelectOnNullParameter="false"
                                    SelectCommandType="StoredProcedure" SelectCommand="ssAtz_ExeExa" 
                                    ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                    onselected="dtsExeExa_Selected">
                                    <SelectParameters>
                                        <asp:Parameter Name="IdCtt" Type="Int64" />
                                        <asp:Parameter Name="Lcr_SeqEnd" Type="Byte" />
                                        <asp:Parameter Name="IdBnf" Type="Int32" />
                                        <asp:Parameter Name="Pdm_Prf" Type="Boolean" />
                                    </SelectParameters>
                                </asp:SqlDataSource> 
                                <br />
                                <table>
                                    <tbody>
                                        <tr>
                                            <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 20px" valign=top align=left colSpan=3>
                                                <h3>
                                                    Especialidade Contratado</h3>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" height="10">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Especialidade:</td>
                                            <td style="width: 5px">
                                            </td>
                                            <td style="width: 303px">
                                                &nbsp;
                                            <asp:DropDownList id="ddlEspCtt" runat="server" CssClass="campo" Width="300px" 
                                                    DataValueField="IdEsp" DataTextField="Esp_Dsc" AppendDataBoundItems="True" 
                                                    AutoPostBack="True" onselectedindexchanged="ddlEspCtt_SelectedIndexChanged">
                                                <asp:ListItem Value="-1">Selecione</asp:ListItem>
                                            </asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Atendimento Permitido:</td>
                                            <td style="width: 5px"></td>
                                            <td style="width: 303px">
                                                <asp:RadioButtonList ID="rblCrtCtt" runat="server" RepeatDirection="Horizontal" Enabled="false" >
                                                    <asp:ListItem Selected="True" Value="E">ELETIVA</asp:ListItem>
                                                    <asp:ListItem Value="U">URGÊNCIA</asp:ListItem>
                                                    <asp:ListItem Value="A">AMBOS</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br />
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel runat="server" ID="upnPdmPrf" UpdateMode="Conditional" >
                        <ContentTemplate>                            
                            <asp:Panel ID="pnlPdmPrf" runat="server" Width="100%" Visible="False">
                                <strong>
                                    <br />
                                </strong>
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                                        Text="Procedimentos que exigem Profissional para execução"></asp:Label><br />
                                <br />
                                <asp:GridView id="grdPdmPrf" runat="server" CssClass="grid-view" 
                                    DataSourceID="dtsExeExaPrf" Width="100%" 
                                    DataKeyNames="IdPdm,IdSol,Spd_QtdAtz,Spd_IdSit,Gia_Crt" 
                                    OnRowCreated="gvHover_RowCreated" BorderWidth="1px" BorderStyle="Solid" 
                                    BorderColor="White" PageSize="5" Font-Size="X-Small" 
                                    AutoGenerateColumns="False">
                                    <RowStyle BackColor="#F4F4F4"></RowStyle>
                                    <Columns>
                                    <asp:TemplateField><EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" />                                                                       
                                    </EditItemTemplate>
                                    <HeaderTemplate>
                                        <asp:Button id="btnSelectAll2" runat="server" CssClass="linkbutton" Text="Todos" CommandName="Show" OnClick="btnSelectAll2_Click"></asp:Button>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox id="chkSelect" runat="server"></asp:CheckBox> 
                                    </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Prf_Nme" HeaderText="Solicitante" SortExpression="Prf_Nme">
                                        <ItemStyle Width="25%"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Pdm_Cod" HeaderText="C&#243;digo" SortExpression="Pdm_Cod">
                                        <ItemStyle Width="25%"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Pdm_Dsc" HeaderText="Procedimento" SortExpression="Pdm_Dsc">
                                        <ItemStyle Width="50%"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Gia_Crt" HeaderText="Caráter" SortExpression="Gia_Crt">
                                        <ItemStyle Width="5%"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Spd_QtdAtz" HeaderText="Autorizados" SortExpression="Spd_QtdAtz">
                                        <ItemStyle Width="5%"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Spd_QtdRel" HeaderText="Realizados">
                                        <ItemStyle Width="5%"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Executados"><ItemTemplate>
                                        <asp:TextBox id="txtExecutados" runat="server" CssClass="campo" Width="45px"></asp:TextBox> 
                                        </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%"></ItemStyle>
                                    </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle Font-Size="Larger"></HeaderStyle>
                                </asp:GridView> 
                                <asp:SqlDataSource id="dtsExeExaPrf" runat="server" SelectCommandType="StoredProcedure" SelectCommand="ssAtz_ExeExa" 
                                ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                                        CancelSelectOnNullParameter="false" onselected="dtsExeExaPrf_Selected">
                                   <SelectParameters>
                                       <asp:Parameter Name="IdCtt" Type="Int64" />
                                       <asp:Parameter Name="Lcr_SeqEnd" Type="Byte" />
                                       <asp:Parameter Name="IdBnf" Type="Int32" />
                                       <asp:Parameter Name="Pdm_Prf" Type="Boolean" />
                                   </SelectParameters>
                                </asp:SqlDataSource> 
                                <table>
                                    <tbody>
                                        <tr>
                                            <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 20px" valign="top" align="left" colspan="3">
                                                <h3>Especialidade Profissional</h3><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" height="10"></td>
                                        </tr>
                                        <tr>
                                            <td style="height: 22px" align="right">Profissional:</td>
                                            <td style="width: 5px; height: 22px"></td>
                                            <td style="height: 22px; width: 303px;">
                                                <asp:DropDownList id="ddlPrf" runat="server" CssClass="campo" Width="300px" DataValueField="IdPrf" DataTextField="Prf_Nme" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlPrf_SelectedIndexChanged" AutoPostBack="true">
                                                    <asp:ListItem Value="-1">Selecione</asp:ListItem>
                                                </asp:DropDownList> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="10"></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Especialidade:</td>
                                            <td style="width: 5px"></td>
                                            <td style="width: 303px">
                                                <asp:DropDownList id="ddlEspPrf" runat="server" CssClass="campo" Width="300px" DataValueField="IdEsp" DataTextField="Esp_Dsc" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlEspPrf_SelectedIndexChanged" AutoPostBack="true">
                                                    <asp:ListItem Value="-1">Selecione</asp:ListItem>
                                                </asp:DropDownList> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Atendimento Permitido:</td>
                                            <td style="width: 5px"></td>
                                            <td style="width: 303px">
                                                <asp:RadioButtonList ID="rblCrtPrf" runat="server" RepeatDirection="Horizontal" Enabled="false" >
                                                    <asp:ListItem Selected="True" Value="E">ELETIVA</asp:ListItem>
                                                    <asp:ListItem Value="U">URGÊNCIA</asp:ListItem>
                                                    <asp:ListItem Value="A">AMBOS</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td style="height: 15px;">
                    <span class="erro">
                        <asp:Image ID="imgErr" runat="server" ImageUrl="../Images/ico_alert.gif" 
                            Visible="False"></asp:Image> &nbsp;
                        <asp:Label ID="lblErr" runat="server"></asp:Label>
                     </span>        
                </td>
            </tr>
            <tr>
                <td height="15"></td>
            </tr>
            <tr>
                <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 21px; width: 460px;" 
                    colspan="3">
                    <asp:ImageButton id="btnExeExa" onclick="btnExeExa_Click" runat="server" ImageUrl="~/Images/bt_executar.gif"></asp:ImageButton>&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
                    <asp:ImageButton id="btnPgaIni" runat="server" ImageUrl="~/Images/bt_home.gif" OnClick="btnPgaIni_Click"></asp:ImageButton> &nbsp; &nbsp; &nbsp; 
                    <asp:ImageButton id="btnFhaPci" runat="server" ImageUrl="~/Images/bt_ficha.gif" Visible="False"></asp:ImageButton>
                </td>
            </tr>
        </tbody>
    </table>    
    <br />
    <br />
    <br />
    <ajaxToolkit:ModalPopupExtender id="ModalPopupExtender1" runat="server" TargetControlID="lbtBuscar" 
        PopupControlID="ModalPanel" DropShadow="true" BackgroundCssClass="modalBackground">
    </ajaxToolkit:ModalPopupExtender> 
    <asp:Panel id="ModalPanel" runat="server" CssClass="modalPopup" Width="830px" Direction="LeftToRight" BackColor="White" >
        <table style="border-right: #ce5c09 thin double; border-top: #ce5c09 thin double; border-left: #ce5c09 thin double; width: 100%; border-bottom: #ce5c09 thin double; background-color: #ffffff">
            <tbody>
                <tr>
                    <td style="width: 937px; height: 45px">
                        <table cellspacing="0" cellpadding="0" width="100%" align="left" border=0>
                            <tbody>
                                <tr>
                                    <td style="width: 9px; height: 37px" align="left">
                                        <img height="37" alt="" src="../Images/tit_left.gif" width="9" />
                                    </td>
                                    <td style="height: 37px" bgColor="#f4f4f4">
                                        <h2>Busca de Beneficiário</h2>
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
                                    <td style="height: 22px" align=right>Nome:&nbsp;</td>
                                    <td style="width: 140px; height: 22px" align="right">
                                        <asp:TextBox id="txtBnf_NmePop" runat="server" CssClass="campo" Width="140px"></asp:TextBox></td>
                                    <td style="height: 22px" valign="top" align="left" width="78"></td>
                                    <td style="width: 56px; height: 22px" align="right">Matrícula:&nbsp;</td>
                                    <td style="height: 22px" align="right" width="140"><asp:TextBox id="txtBnf_MtrPop" runat="server" Width="140px"></asp:TextBox></td>
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
                    <td style="padding-right: 10px; padding-left: 0px; padding-bottom: 0px; padding-top: 0px; " 
                        valign="middle" align="center">
                        <asp:GridView ID="grd" runat="server" AllowPaging="True" AllowSorting="True" 
                            AutoGenerateColumns="False" CssClass="grid-view" 
                            DataKeyNames="IdBnf,Bnf_Mtr,Bnf_Nme,Prd_Nme,IdRde,Bnf_Bio,Bnf_Idd" DataSourceID="dtsBnf" 
                            ondatabound="grd_DataBound" OnRowCreated="gvHover_RowCreated" 
                            onselectedindexchanged="grd_SelectedIndexChanged" OnSorted="grd_Sorted" 
                            Width="100%">
                            <Columns>
                                <asp:BoundField DataField="Bnf_Mtr" HeaderText="Matrícula" 
                                    SortExpression="Bnf_Mtr">
                                    <ItemStyle Width="20%" />
                                </asp:BoundField>
                                <asp:ButtonField CommandName="Select" DataTextField="Bnf_Nme" 
                                    HeaderText="Beneficiário" SortExpression="Bnf_Nme">
                                    <ItemStyle Width="50%" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="Prd_Nme" HeaderText="Produto" 
                                    SortExpression="Prd_Nme">
                                    <ItemStyle Width="30%" />
                                </asp:BoundField>
                            </Columns>
                            <PagerTemplate>
                                <div height="20">
                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument="First" 
                                        ImageUrl="~/Images/seta1_1_on.gif" oncommand="Paginategrd" />
                                    &nbsp;&nbsp;
                                    <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument="Prev" 
                                        ImageUrl="~/Images/seta1_2_on.gif" oncommand="Paginategrd" />
                                    &nbsp;Página
                                    <asp:DropDownList ID="ddlPages" runat="server" AutoPostBack="True" 
                                        CssClass="campo" onselectedindexchanged="ddlPages_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    &nbsp;de
                                    <asp:Label ID="lblPageCount" runat="server"></asp:Label>
                                    &nbsp;
                                    <asp:ImageButton ID="ImageButton3" runat="server" CommandArgument="Next" 
                                        ImageUrl="~/Images/seta2_1_on.gif" oncommand="Paginategrd" />
                                    &nbsp;&nbsp;
                                    <asp:ImageButton ID="ImageButton4" runat="server" CommandArgument="Last" 
                                        ImageUrl="~/Images/seta2_2_on.gif" oncommand="Paginategrd" />
                                </div>
                            </PagerTemplate>
                        </asp:GridView>
                        <asp:SqlDataSource id="dtsBnf" runat="server" SelectCommandType="StoredProcedure" SelectCommand="ssAtz_Bnf" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" CancelSelectOnNullParameter="False">
                            <SelectParameters>
                                <asp:Parameter Name="Bnf_Mtr" Type="String" />
                                <asp:Parameter Name="Bnf_Nme" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource> 
                        <asp:Label ID="lblEmptyGrid" runat="server"></asp:Label>
                        <br />
                        <h2 align="right">&nbsp;
                            <asp:ImageButton id="btn_fechar" onclick="btn_fechar_Click" runat="server" ImageUrl="~/Images/bt_fecha.gif"></asp:ImageButton>
                        </h2>
                     </td>
                </tr>
            </tbody>
        </table>
    </asp:Panel>
    <br />
    <asp:Label id="lblIdBnf" runat="server" Visible="False"></asp:Label> 
    <asp:HiddenField id="hdfGiaSnh" runat="server"></asp:HiddenField> 
    <asp:HiddenField id="hdfIdRde" runat="server"></asp:HiddenField>
</asp:Content>

