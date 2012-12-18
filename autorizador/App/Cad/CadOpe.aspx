<%@ Page Title="" Language="C#" MasterPageFile="~/App/Cad/Cad.master" AutoEventWireup="true" CodeFile="CadOpe.aspx.cs" Theme="Cad"
Inherits="br.com.totaltiss.Gestor.Web.App.Cad.CadOpe" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Cadastro de Operadoras</h1>

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
                        DataSourceID="edsOpe" EnableTheming="True" 
                            onrowdatabound="grdRowDataBound" EnablePersistedSelection="True" 
                        DataKeyNames="IdOpe">
                        <AlternatingRowStyle CssClass="alternatingrowstyle" />
                        <Columns>
                            <asp:CommandField SelectText="selecionar" ShowSelectButton="True" />
                            <asp:DynamicField DataField="IdOpe" HeaderText="Id" ReadOnly="True" 
                                SortExpression="IdOpe" />
                            <asp:DynamicField DataField="Ope_Nme" HeaderText="Nome" 
                                SortExpression="Ope_Nme" />                            
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
                    <asp:EntityDataSource ID="edsOpe" runat="server" 
                        ConnectionString="name=AppEntities" DefaultContainerName="AppEntities" 
                        EntitySetName="Cad_Ope" EnableFlattening="False" EnableDelete="True" 
                        EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>                
                    <asp:QueryExtender ID="qryOpe" runat="server" TargetControlID="edsOpe"></asp:QueryExtender>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <br />
        </asp:View>

        <asp:View runat="server" ID="viwDetail">
            <table class="tablecrud" >
                <tr class="alternaterow">
                    <td>Código:</td>
                    <td>
                        <asp:Label ID="lblIdOpe" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr class="row">
                    <td>Nome:</td>
                    <td>
                        <asp:TextBox ID="txtOpeNme" runat="server" MaxLength="50" Width="300px" 
                            Height="22px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvOpeNme" runat="server" 
                            ControlToValidate="txtOpeNme" CssClass="validate" Display="None" 
                            EnableClientScript="False" ErrorMessage="Nome" 
                            ValidationGroup="vdgCadastro" />
                    </td>
                </tr>
                <tr class="alternaterow">
                    <td>Registro ANS:</td>
                    <td>
                        <asp:TextBox ID="txtOpeRegAns" runat="server" MaxLength="6" Width="100px" 
								Height="22px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvOpeRegAns" runat="server" 
                            ControlToValidate="txtOpeRegAns" CssClass="validate" Display="None" 
                            EnableClientScript="False" ErrorMessage="Registro ANS"
                            ValidationGroup="vdgCadastro" />
                    </td>
                </tr>
                <tr class="row">
                    <td>CNPJ:</td>
                    <td>
                        <asp:TextBox ID="txtOpeCnp" runat="server" MaxLength="14" Width="150px" 
								Height="22px"></asp:TextBox> 
                        <asp:RequiredFieldValidator ID="rfvOpeCnp" runat="server" 
                            ControlToValidate="txtOpeCnp" CssClass="validate" Display="None" 
                            EnableClientScript="False" ErrorMessage="CNPJ"
                            ValidationGroup="vdgCadastro" />
                    </td>
                </tr>
                <tr class="alternaterow">
                    <td>Início:</td>
                    <td>
                        <asp:TextBox ID="txtOpeDatIni" runat="server" Width="100px" 
								Height="22px" CssClass="datepicker" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvOpeDatIni" runat="server" 
                            ControlToValidate="txtOpeDatIni" CssClass="validate" Display="None" 
                            EnableClientScript="False" ErrorMessage="Data de Início"
                            ValidationGroup="vdgCadastro" />
                    </td>
                </tr>
                <tr class="row">
                    <td>Término</td>
                    <td>
                        <asp:TextBox ID="txtOpeDatFim" runat="server" Width="100px" 
								Height="22px" CssClass="datepicker"></asp:TextBox>
                    </td>
                </tr>
                <tr class="alternaterow">
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
        <span style="color:#fff; margin:3px">Carregando ...</span>
    </div>
    <script type="text/javascript">
        $(function () {
            $(".button").button();
        });
        </script>
    <script type="text/javascript">
        $(function ($) {
            $(".datepicker").datepicker({
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
        $(function ($) {
            $(".datepicker").mask("99/99/9999");
        });
	 </script>
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
</asp:Content>

