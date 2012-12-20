<%@ Page Title="" Language="C#" MasterPageFile="~/App/Cad/Cad.master" AutoEventWireup="true" CodeFile="CadPdm.aspx.cs" ClientIDMode="Static"
Inherits="br.com.totaltiss.Gestor.Web.App.Cad.CadPdm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="CadPdm.js" type="text/javascript"></script>
    <script type="text/javascript">
        function onUpdating() {
            // get the update progress div
            var updateProgressDiv = $get('updateProgressDiv');

            //  get the gridview element        
            var gridView = $get('<%= this.grd.ClientID %>');

            // make it visible
            updateProgressDiv.style.display = '';

            // get the bounds of both the gridview and the progress div
            var gridViewBounds = Sys.UI.DomElement.getBounds(gridView);
            var updateProgressDivBounds = Sys.UI.DomElement.getBounds(updateProgressDiv);

            var x;
            var y;

            //  top right of gridview
            x = (gridViewBounds.x + gridViewBounds.width - updateProgressDivBounds.width);
            y = gridViewBounds.y;

            //	set the progress element to this position
            Sys.UI.DomElement.setLocation(updateProgressDiv, x, y);
        }

        function onUpdated() {
            // get the update progress div
            var updateProgressDiv = $get('updateProgressDiv');
            // make it invisible
            updateProgressDiv.style.display = 'none';
        }
    </script>

            <asp:MultiView ID="mvw" runat="server" ActiveViewIndex="0">
                <asp:View runat="server" ID="viwBrowse">
                    <div id="ToolBar" >
                        <asp:Button ID="btnNew" runat="server" onclick="btnNew_Click" Text="Novo" 
                            CssClass="button" />
                        <asp:Button ID="btnEdit" runat="server" onclick="btnEdit_Click" 
                            Text="Alterar" CssClass="button" />
                        <asp:Button ID="btnDel" runat="server" onclick="btnDel_Click" Text="Excluir" 
                            CssClass="button" />
                    </div>
                    <br />
                    <asp:TextBox ID="txtPsq" runat="server" Height="22px"></asp:TextBox>
                    <asp:Button ID="Button3" runat="server" CssClass="button" Text="Pesquisar" />
                    <br />
                    <asp:UpdatePanel ID="upnForm" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="grd" runat="server" AllowPaging="True" 
                                    AllowSorting="True" AutoGenerateColumns="False" CssClass="gridview" 
                                DataSourceID="edsPdm" EnableTheming="True" 
                                    onrowdatabound="grdRowDataBound" EnablePersistedSelection="True" 
                                DataKeyNames="IdPdm">
                                <AlternatingRowStyle CssClass="alternatingrowstyle" />
                                <Columns>
                                    <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
                                    <asp:BoundField DataField="IdPdm" HeaderText="Id" ReadOnly="True" 
                                        SortExpression="IdPdm" />
                                    <asp:BoundField DataField="Pdm_Cod" HeaderText="Codigo TUSS" 
                                        SortExpression="Pdm_Cod" />
                                    <asp:BoundField DataField="Pdm_Dsc" HeaderText="Descrição TUSS" 
                                        SortExpression="Pdm_Dsc" />
                                    <asp:BoundField DataField="Pdm_DscRsm" HeaderText="Apelido" 
                                        SortExpression="Pdm_DscRsm" />
                                    <asp:BoundField DataField="Pdm_CodAmb" HeaderText="Código AMB" 
                                        SortExpression="Pdm_CodAmb" />
                                    <asp:BoundField DataField="Pdm_DscAmb" HeaderText="Descrição AMB" 
                                        SortExpression="Pdm_DscAmb" />
                                </Columns>
                                <HeaderStyle CssClass="headerstyle" />
                                <PagerStyle CssClass="pagerstyle" />
                                <SelectedRowStyle CssClass="row-select" />
                                <PagerTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="Linhas por página:" />
                                    <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" 
                                        OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
                                        <asp:ListItem Value="5" />
                                        <asp:ListItem Value="10" />
                                        <asp:ListItem Value="15" />
                                        <asp:ListItem Value="25" />
                                        <asp:ListItem Value="50" />
                                    </asp:DropDownList>
                                    &nbsp;
                                    Página 
                                    <asp:TextBox ID="txtGoToPage" runat="server" AutoPostBack="true" 
                                        OnTextChanged="GoToPage_TextChanged" CssClass="gotopage" />
                                    de
                                    <asp:Label ID="lblTotalNumberOfPages" runat="server" />
                                    &nbsp;
                                    <asp:Button ID="Button1" runat="server" CommandName="Page" 
                                        ToolTip="Página Anterior" CommandArgument="Prev" CssClass="previous" />
                                    <asp:Button ID="Button2" runat="server" CommandName="Page" ToolTip="Próxima Página" 
                                        CommandArgument="Next" CssClass="next" />
                                </PagerTemplate>
                            </asp:GridView>
                            <asp:EntityDataSource ID="edsPdm" runat="server" 
                                ConnectionString="name=AppEntities" DefaultContainerName="AppEntities" 
                                EntitySetName="Atz_Pdm" EnableFlattening="False"></asp:EntityDataSource>         
                        </ContentTemplate>
                    </asp:UpdatePanel>        
                    <asp:QueryExtender ID="qryPdm" runat="server" TargetControlID="edsPdm">
                        <asp:SearchExpression DataFields="Pdm_Cod,Pdm_CodAmb,Pdm_DscAmb,Pdm_DscRsm" SearchType="Contains" >
                            <asp:ControlParameter ControlID="txtPsq" />
                        </asp:SearchExpression>
                    </asp:QueryExtender>
                </asp:View>
                <asp:View runat="server" ID="viwDetail">
                    <table class="tablecrud" >
                        <tr class="alternaterow">
                            <td align="right">Id:</td>
                            <td colspan="3">
                                <asp:Label ID="lblIdPdm" runat="server"></asp:Label>
                            </td>
                        </tr>
                         <tr class="row">
                            <td align="right">Código TUSS:</td>
                            <td colspan="3">
                                <asp:TextBox id="txtPdmCod" runat="server" MaxLength="20"></asp:TextBox>*</td>
                        </tr>
                        <tr class="alternaterow">
                            <td align="right"> Descrição TUSS:</td>
                            <td colspan="3">
                                <asp:TextBox ID="txtPdmDsc" runat="server" MaxLength="50" Width="450px" 
                                    Height="22px" style="margin-bottom: 0px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvAcmDsc" runat="server" 
                                    ControlToValidate="txtPdmDsc" CssClass="validate" Display="None" 
                                    EnableClientScript="False" ErrorMessage="Descrição não pode ser nula." 
                                    ValidationGroup="vdgCadastro" />
                            </td>
                        </tr>
                        <tr class="row">
                            <td align="right">Código AMB:</td>
                            <td style="width: 415px"colspan="3">
                                <asp:TextBox id="txtPdmCodAmb" runat="server"></asp:TextBox></TD>
                        </tr>
                        <tr class="alternaterow">
                            <td align="right">Descrição AMB:</td>
                            <td colspan="3">
                                <asp:TextBox id="txtPdmDscAmb" runat="server" MaxLength="80" Width="450px"></asp:TextBox>&nbsp; </td>
                        </tr>    
                        <tr class="row">
                            <td align="right">Apelido:</td>
                            <td colspan="3">
                                <asp:TextBox id="txtPdmDscRsm" runat="server" MaxLength="35" Width="450px"></asp:TextBox>&nbsp; </td>
                        </tr>
                        <tr class="alternaterow">
                            <td align="right" style="height: 27px">
                                Sexo:</td>
                            <td colspan="3" style="height: 27px">
                                <asp:DropDownList ID="ddlPdmSxo" runat="server">
                                    <asp:ListItem Value="A">TODOS</asp:ListItem>
                                    <asp:ListItem Value="F">FEMININO</asp:ListItem>
                                    <asp:ListItem Value="M">MASCULINO</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr class="row">
                            <td align="right">Ativo?
                            </td>
                            <td>
                                <asp:CheckBox ID="chkPdmAtv" runat="server" />
                            </td>
                            <td align="right">Alta complexidade?
                            </td>
                            <td>
                                <asp:CheckBox id="chkPdmAltCpx" runat="server"></asp:CheckBox>
                            </td>
                        </tr>
                        <tr class="alternaterow">
                            <td align="right">Especial?
                            </td>
                            <td>
                                <asp:CheckBox id="chkPdmEsp" runat="server"></asp:CheckBox>
                            </td>
                            <td align="right">Requer profissional?
                            </td>
                            <td>
                                <asp:CheckBox id="chkPdmPrf" runat="server"></asp:CheckBox>
                            </td>
                        </tr>  
                        <tr class="row">
                            <td align="right">Bloqueado para urgência?
                            </td>
                            <td>
                                <asp:CheckBox ID="chkPdmBlqUrg" runat="server" />
                            </td>
                            <td align="right">
                            </td>
                            <td>            
                            </td>
                        </tr>  
                        <tr class="alternaterow">
                            <td align="right">Tabela:
                            </td>
                            <td colspan="3">
                                <asp:DropDownList id="ddlPdmIdTab" runat="server" 
                                        DataSourceID="dtsPdm_IdTab" DataValueField="IdTab" DataTextField="Tab_Dsc">
                                </asp:DropDownList> <asp:SqlDataSource id="dtsPdm_IdTab" runat="server" 
                                                SelectCommand="SELECT [Tab_Dsc], [IdTab] FROM [Atz_Tab]" 
                                                ConnectionString="<%$ ConnectionStrings:AppConnectionString %>"></asp:SqlDataSource> 
                            </td>
                        </tr> 
                        <tr class="row">
                            <td align="right">Tipo de procedimento:
                            </td>
                            <td>
                                <asp:DropDownList id="ddlPdmIdTpp" runat="server" 
                                            DataSourceID="dtsAtz_Tpp" DataValueField="IdTpp" DataTextField="Tpp_Dsc">
                                </asp:DropDownList> <asp:SqlDataSource id="dtsAtz_Tpp" runat="server" 
                                                    SelectCommand="SELECT [IdTpp], [Tpp_Dsc] FROM [Atz_Tpp]" 
                                                    ConnectionString="<%$ ConnectionStrings:AppConnectionString %>"></asp:SqlDataSource>
                            </td>
                            <td align="right">Grupo de procedimento:
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlPdmIdGrp" runat="server" 
                                            DataSourceID="dtsPdm_IdGrp" DataTextField="Grp_Dsc" DataValueField="IdGrp">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="dtsPdm_IdGrp" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                    SelectCommand="SELECT [IdGrp], [Grp_Dsc] FROM [Atz_Grp]">
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr class="alternaterow">
                            <td align="right">
                                Quantidade de CH:</td><td>
                                <asp:TextBox ID="txtPdmQtdCh_" runat="server" MaxLength="9"></asp:TextBox><%--<cc1:FilteredTextBoxExtender ID="txtPdmQtdCh__FilteredTextBoxExtender" 
                                        runat="server" FilterType="Custom, Numbers" ValidChars="," TargetControlID="txtPdmQtdCh_">
                                    </cc1:FilteredTextBoxExtender>--%>
                            </td>
                            <td align="right">
                                Quantidade de filme:</td><td>
                                <asp:TextBox ID="txtPdmQtdFlm" runat="server" MaxLength="9"></asp:TextBox><%--<cc1:FilteredTextBoxExtender ID="txtPdmQtdFlm_FilteredTextBoxExtender" 
                                    runat="server" FilterType="Custom, Numbers" ValidChars="," TargetControlID="txtPdmQtdFlm">
                                </cc1:FilteredTextBoxExtender>--%>
                            </td>
                        </tr>  
                        <tr class="row">
                            <td align="right">
                                Idade mínima:</td><td>
                                <asp:TextBox ID="txtPdmIddMin" runat="server" MaxLength="3"></asp:TextBox><%--<cc1:FilteredTextBoxExtender id="ftePdmIddMin" runat="server" 
                                        FilterType="Numbers" TargetControlID="txtPdmIddMin">
                            </cc1:FilteredTextBoxExtender>--%> </td>
                            </td>
                            <td align="right">
                                Idade máxima:</td><td>
                                <asp:TextBox ID="txtPdmIddMax" runat="server" MaxLength="3"></asp:TextBox><%--<cc1:FilteredTextBoxExtender id="ftePdmIddMax" runat="server" 
                                        FilterType="Numbers" TargetControlID="txtPdmIddMax">
                                </cc1:FilteredTextBoxExtender>--%> 
                            </td>
                        </tr>
                        <tr class="alternaterow">
                            <td align="right">
                                Qtd. máx solicitada:</td><td>
                                <asp:TextBox ID="txtPdmQtdMax" runat="server" MaxLength="5"></asp:TextBox><%--<cc1:FilteredTextBoxExtender id="ftePdmQtdMax" runat="server" 
                                        FilterType="Numbers" TargetControlID="txtPdmQtdMax">
                                </cc1:FilteredTextBoxExtender>--%>
                            </td>
                            <td align="right" style="height: 17px">
                                Qtd. máx executada dia:</td><td>
                                <asp:TextBox ID="txtPdmQtdDia" runat="server" MaxLength="5"></asp:TextBox><%--<cc1:FilteredTextBoxExtender id="ftePdmQtdDia" runat="server" 
                                        FilterType="Numbers" TargetControlID="txtPdmQtdDia">
                                </cc1:FilteredTextBoxExtender>--%> 
                            </td>
                        </tr>
                        <tr class="row">
                            <td align="right">
                                Qtd. máx executada mês:</td><td>
                                <asp:TextBox ID="txtPdmQtdMes" runat="server" MaxLength="5"></asp:TextBox><%--<cc1:FilteredTextBoxExtender id="ftePdmQtdMes" runat="server" 
                                        FilterType="Numbers" TargetControlID="txtPdmQtdMes">
                                </cc1:FilteredTextBoxExtender>--%>
                            </td>
                            <td align="right">
                                Qtd. máx executada ano:</td><td>
                                <asp:TextBox ID="txtPdmQtdAno" runat="server" MaxLength="5"></asp:TextBox><%--<cc1:FilteredTextBoxExtender id="ftePdmQtdAno" runat="server" 
                                        FilterType="Numbers" TargetControlID="txtPdmQtdAno">
                                </cc1:FilteredTextBoxExtender>--%>
                            </td>
                        </tr>
                        <tr class="alternaterow">
                            <td align="right">
                                Min. dias para repetir o procedimento:</td><td>
                                <asp:TextBox ID="txtPdmRtn" runat="server" MaxLength="5"></asp:TextBox><%--<cc1:FilteredTextBoxExtender ID="ftePdmRtn" runat="server" FilterType="Numbers" 
                                    TargetControlID="txtPdmRtn">
                                </cc1:FilteredTextBoxExtender>--%>
                            </td>
                            <td align="right">
                                &nbsp;</td><td>
                                &nbsp;</td>
                        </tr>
                        <tr class="row">
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnSave" runat="server" CssClass="button" 
                                    onclick="btnSave_Click" Text="Gravar" />
                                <asp:Button ID="btnCancel" runat="server" CssClass="button" 
                                    onclick="btnCancel_Click" Text="Cancelar" />
                            </td>
                        </tr>
                    </table>
                </asp:View>                
            </asp:MultiView>
    <ajaxToolkit:UpdatePanelAnimationExtender ID="upae" BehaviorID="animation" runat="server" TargetControlID="upnForm">
        <Animations>
            <OnUpdating>
                <Parallel duration="0">
                    <%-- place the update progress div over the gridview control --%>
                    <ScriptAction Script="onUpdating();" />  
                    </Parallel>
            </OnUpdating>
            <OnUpdated>
                <Parallel duration="0">
                    <%--find the update progress div and place it over the gridview control--%>
                    <ScriptAction Script="onUpdated();" /> 
                </Parallel> 
            </OnUpdated>
        </Animations>
    </ajaxToolkit:UpdatePanelAnimationExtender>
    <div id="updateProgressDiv" style="background-color:#4b6c9e; display:none; position:absolute;">
        <span style="color:#fff; margin:3px">Atualizando ...</span>
    </div>
</asp:Content>
