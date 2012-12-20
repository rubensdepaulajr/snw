<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="atd2.aspx.cs" Inherits="Atz_atd2" Theme="Standard" Title="Página Inicial de Atendente - Solicitações Autorizadas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolKit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server"> 

    <script type="text/javascript" language="javascript">
        var _divUpdateProgress;

        function pageLoad(sender, args) {
            //  register for our events
            Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginRequest);
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequest);

            _divUpdateProgress = $get('divUpdateProgress');
        }

        function beginRequest(sender, args) {
            //  get the gridview element
            var tabContainer = $get('<%= this.TabContainer1.ClientID %>');

            // make it visible
            _divUpdateProgress.style.display = '';

            // get the bounds of both the gridview and the progress div
            var tabContainerwBounds = Sys.UI.DomElement.getBounds(tabContainer);
            var updateProgressDivBounds = Sys.UI.DomElement.getBounds(_divUpdateProgress);

            //  center of gridview
            var x = tabContainerwBounds.x + Math.round(tabContainerwBounds.width / 2) - Math.round(updateProgressDivBounds.width / 2);
            var y = tabContainerwBounds.y + Math.round(tabContainerwBounds.height / 2) - Math.round(updateProgressDivBounds.height / 2);

            //	set the progress element to this position
            Sys.UI.DomElement.setLocation(_divUpdateProgress, 0, 0); 
        }

        function endRequest(sender, args) {
            // make it invisible
            _divUpdateProgress.style.display = 'none';
        }

        // Event that occurs when click the tab of TabContainer
        function clientActiveTabChanged(sender, args) {
            //  if the tab does not exist and it is the active tab, 
            //  trigger the async-postback
            if (sender.get_activeTabIndex() == 0) {
                // load tab1
                __doPostBack('ctl00$MainContent$btnTb1Trigger', '');
            }
            else if (sender.get_activeTabIndex() == 1) {
                // load tab2
                __doPostBack('ctl00$MainContent$btnTb2Trigger', '');
            }
            else if (sender.get_activeTabIndex() == 2) {
                // load tab2
                __doPostBack('ctl00$MainContent$btnTb3Trigger', '');
            }
        }            
    </script> 
    <%--hidden buttons that are used to trigger the postbacks--%>
    <input id="btnTb1Trigger" runat="server" type="button" style="display:none" onserverclick="btnTb1Trigger_Click" />
    <input id="btnTb2Trigger" runat="server" type="button" style="display:none" onserverclick="btnTb2Trigger_Click" />
    <input id="btnTb3Trigger" runat="server" type="button" style="display:none" onserverclick="btnTb3Trigger_Click" />
    <div style="padding: 0px 0 0 10px;">
        <ajaxToolKit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0"  
            CssClass="tabcontainer" OnClientActiveTabChanged="clientActiveTabChanged" >
            <ajaxToolKit:TabPanel runat="server" HeaderText="SOLICITA&#199;&#213;ES AUTORIZADAS" ID="solicitacoesAutorizadas">
                <ContentTemplate>
                    <asp:UpdatePanel id="updPnlTb1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <br />
                            <div style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px">
                                <asp:TextBox id="txtBusca" runat="server" CssClass="campo"></asp:TextBox>&nbsp; &nbsp; 
                                <asp:ImageButton id="btnBuscar" runat="server" ImageUrl="~/Images/bt_buscar.gif"></asp:ImageButton>
                                <br />
                                <br />
                                <asp:GridView id="grdSolAtz" runat="server" CssClass="grid-view-left" 
                                    DataSourceID="dtsSolAtz" AllowPaging="True" OnRowCreated="gvHover_RowCreated" 
                                    AutoGenerateColumns="False" Width="100%" ondatabound="grdSolAtz_DataBound" 
                                    AllowSorting="True">
                                    <Columns>
                                        <asp:BoundField DataField="Bnf_Mtr" HeaderText="Matr&#237;cula" SortExpression="Bnf_Mtr"></asp:BoundField>
                                        <asp:HyperLinkField DataNavigateUrlFields="IdGia" DataNavigateUrlFormatString="solcondet.aspx?Gia={0}" DataTextField="Bnf_Nme" HeaderText="Benefici&#225;rio" SortExpression="Bnf_Nme"></asp:HyperLinkField>
                                        <asp:BoundField DataField="Esp_Dsc" HeaderText="Especialidade" SortExpression="Esp_Dsc"></asp:BoundField>
                                        <asp:BoundField DataField="Gia_TipDsc" HeaderText="Tipo" ReadOnly="True" SortExpression="Gia_TipDsc"></asp:BoundField>
                                    </Columns>
                                    <PagerTemplate>
                                        <div height="20" align="center">
                                            <asp:ImageButton ID="ImageButton1" runat="server"
                                                        ImageUrl="~/Images/seta1_1_on.gif" CommandArgument="First" oncommand="PaginategrdSolAtz" />&#160;&nbsp;
                                            <asp:ImageButton ID="ImageButton2" runat="server"
                                                    ImageUrl="~/Images/seta1_2_on.gif"  CommandArgument="Prev" oncommand="PaginategrdSolAtz" />&#160;Página 
                                            <asp:DropDownList ID="ddlPages" runat="server" CssClass="campo"
                                                        AutoPostBack="True" onselectedindexchanged="ddlPages_SelectedIndexChanged">
                                            </asp:DropDownList>&nbsp;de 
                                            <asp:Label ID="lblPageCount" runat="server"></asp:Label> 
                                            <asp:ImageButton ID="ImageButton3" runat="server"
                                                        ImageUrl="~/Images/seta2_1_on.gif"  CommandArgument="Next" oncommand="PaginategrdSolAtz" />&#160;&nbsp;
                                            <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Images/seta2_2_on.gif"  CommandArgument="Last" oncommand="PaginategrdSolAtz" />
                                        </div>
                                    </PagerTemplate>
                                </asp:GridView>
                            </div>
                            <asp:SqlDataSource id="dtsSolAtz" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                SelectCommand="ssAtz_GiaCon" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False">
                                <SelectParameters>
                                    <asp:ProfileParameter PropertyName="Local.IdCtt" DefaultValue="" Name="IdCtt" Type="Int64"></asp:ProfileParameter>
                                    <asp:ProfileParameter PropertyName="Local.Cte_SeqEnd" DefaultValue="" Name="Cte_SeqEnd" Type="Byte"></asp:ProfileParameter>
                                    <asp:Parameter Name="IdPrf" Type="Int32"></asp:Parameter>
                                    <asp:Parameter DefaultValue="ATZ" Name="Gia_Sit" Type="String"></asp:Parameter>
                                </SelectParameters>
                            </asp:SqlDataSource> 
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnTb1Trigger" />
                        </Triggers>
                    </asp:UpdatePanel> 
                </ContentTemplate>
            </ajaxToolKit:TabPanel>
            
            <ajaxToolKit:TabPanel runat="server" HeaderText="RETORNOS" ID="retornos" >
                <ContentTemplate>
                    <asp:UpdatePanel id="updPnlTb2" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnTb2Trigger" />
                        </Triggers>
                        <ContentTemplate>
                            <div style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px">
                                <br />
                                <asp:TextBox id="TextBox1" runat="server" CssClass="campo"></asp:TextBox>&nbsp; &nbsp; 
                                <asp:ImageButton id="ImageButton1" runat="server" ImageUrl="~/Images/bt_buscar.gif"></asp:ImageButton>
                                <br />
                                <br />
                                <asp:GridView id="grdRet" runat="server" CssClass="grid-view-left" DataSourceID="dtsRet" AllowPaging="True" OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" DataKeyNames="Bnf_Mtr" Width="100%" ondatabound="grdRet_DataBound" AllowSorting="True">
                                    <Columns>
                                        <asp:BoundField DataField="Bnf_Mtr" HeaderText="Matr&#237;cula" SortExpression="Bnf_Mtr"></asp:BoundField>
                                        <asp:HyperLinkField DataNavigateUrlFields="IdGia" DataNavigateUrlFormatString="solcondet.aspx?Gia={0}" DataTextField="Bnf_Nme" HeaderText="Benefici&#225;rio" SortExpression="Bnf_Nme"></asp:HyperLinkField>
                                        <asp:BoundField DataField="Esp_Dsc" HeaderText="Especialidade" SortExpression="Esp_Dsc"></asp:BoundField>
                                        <asp:BoundField DataField="Gia_TipDsc" HeaderText="Tipo" ReadOnly="True" SortExpression="Gia_TipDsc"></asp:BoundField>
                                        <asp:BoundField DataField="Gpd_DatRel" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Execu&#231;&#227;o" SortExpression="Gpd_DatRel"></asp:BoundField>
                                    </Columns>
                                    <PagerTemplate>
                                        <div height="20" align="center">
                                        <asp:ImageButton ID="ImageButton1Retorno" runat="server"
                                            ImageUrl="~/Images/seta1_1_on.gif" CommandArgument="First" oncommand="PaginategrdRet" />&nbsp; 
                                        <asp:ImageButton ID="ImageButton2Retorno" runat="server"
                                            ImageUrl="~/Images/seta1_2_on.gif"  CommandArgument="Prev" oncommand="PaginategrdRet" />&nbsp;Página 
                                        <asp:DropDownList ID="ddlPagesRetorno" runat="server" CssClass="campo"
                                            AutoPostBack="True" onselectedindexchanged="ddlPagesRetorno_SelectedIndexChanged"></asp:DropDownList>&nbsp;de 
                                        <asp:Label ID="lblPageCountRetorno" runat="server"></asp:Label>&nbsp; 
                                        <asp:ImageButton ID="ImageButton3Retorno" runat="server"
                                            ImageUrl="~/Images/seta2_1_on.gif"  CommandArgument="Next" oncommand="PaginategrdRet" />&nbsp; 
                                        <asp:ImageButton ID="ImageButton4Retorno" runat="server"
                                            ImageUrl="~/Images/seta2_2_on.gif"  CommandArgument="Last" oncommand="PaginategrdRet" />
                                        </div>
                                    </PagerTemplate>
                                </asp:GridView>
                            </div>
                            <asp:SqlDataSource id="dtsRet" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" SelectCommand="ssAtz_GiaCon" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False">
                                <SelectParameters>
                                    <asp:ProfileParameter PropertyName="Local.IdCtt" Name="IdCtt" Type="Int64"></asp:ProfileParameter>
                                    <asp:ProfileParameter PropertyName="Local.Cte_SeqEnd" DefaultValue="" Name="Cte_SeqEnd" Type="Byte"></asp:ProfileParameter>
                                    <asp:Parameter Name="IdPrf" Type="Int32"></asp:Parameter>
                                    <asp:Parameter DefaultValue="RET" Name="Gia_Sit" Type="String"></asp:Parameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel> 
                </ContentTemplate>
            </ajaxToolKit:TabPanel>

            <ajaxToolKit:TabPanel runat="server" HeaderText="SOLICITA&#199;&#213;ES PENDENTES" ID="solicitacoesPendentes">
                <ContentTemplate>
                    <asp:UpdatePanel id="updPnlTb3" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnTb3Trigger" />
                        </Triggers>
                        <ContentTemplate>
                        <br />
                        <div style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px">
                            <asp:TextBox id="TextBox2" runat="server" CssClass="campo"></asp:TextBox>&nbsp; &nbsp; 
                            <asp:ImageButton id="ImageButton2" runat="server" ImageUrl="~/Images/bt_buscar.gif"></asp:ImageButton>
                            <br />
                            <br />
                            <asp:GridView id="grdSolPen" runat="server" CssClass="grid-view-left" DataSourceID="dtsSolPen" OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" DataKeyNames="IdGia" Width="100%" ondatabound="grdSolPen_DataBound" OnRowDataBound="grdSolPen_RowDataBound" OnRowCommand="grdSolPen_RowCommand">
                                <Columns>
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Bnf_Mtr") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <table style="width: 100%">
                                                <tbody>
                                                    <tr>
                                                        <td valign="middle" align="center">
                                                            <asp:Label id="Label1" runat="server" Text='<%# Bind("Bnf_Mtr") %>'></asp:Label>&nbsp;
                                                            <img height="17" alt="" src="../Images/divisor_registro.gif" width=1 /> 
                                                            <asp:HyperLink id="HyperLink1" runat="server" Text='<%# Eval("Bnf_Nme") %>' NavigateUrl='<%# String.Concat("solcondet.aspx?Gia=", Eval("IdGia")) %>'></asp:HyperLink>
                                                            <asp:Label id="Label2" runat="server" Text='<%# Eval("Bnf_Nme") %>' Visible="False"></asp:Label>&nbsp;
                                                            <img height="17" alt="" src="../Images/divisor_registro.gif" width="1" /> 
                                                            <asp:Label id="Label3" runat="server" Text='<%# Eval("Esp_Dsc") %>'></asp:Label>&nbsp;
                                                            <img height=17 alt="" src="../Images/divisor_registro.gif" width=1 /> 
                                                            <asp:Label id="Label4" runat="server" Text='<%# Eval("Gia_TipDsc") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:GridView id="grdGiaMsg" runat="server" CssClass="grid-view-left" DataSourceID="dtGiaMsg" AutoGenerateColumns="False" Width="100%" onrowcreated="gvHover_RowCreated" GridLines="None">
                                                                <Columns>
                                                                    <asp:BoundField DataField="Msg_DscAtz" />
                                                                </Columns>
                                                            </asp:GridView>
                                                            <asp:SqlDataSource id="dtGiaMsg" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" SelectCommand="SELECT LTRIM(STR(IdMsg)),  Msg_DscAtz, Msg_Dsc  FROM dbo.Atz_Msg, dbo.Atz_GiaPdmMsg WHERE IdMsg = Gpm_IdMsg AND Gpm_IdGia = @IdGia">
                                                                <SelectParameters>
                                                                    <asp:Parameter Name="IdGia" Type="String" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button id="Button1" runat="server" CssClass="linkbutton" Text="Exibir Motivos" CommandName="Show"></asp:Button> 
                                        </ItemTemplate>
                                        <ItemStyle VerticalAlign="Top" Width="10%"></ItemStyle>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle Font-Bold="True" ForeColor="White"></FooterStyle>
                                <PagerTemplate>
                                    <div height="20" align="center">
                                        <asp:ImageButton ID="ImageButton1SolPendentes" runat="server"
                                                            ImageUrl="~/Images/seta1_1_on.gif" CommandArgument="First" oncommand="PaginategrdSolPen" />&nbsp; 
                                        <asp:ImageButton ID="ImageButton2SolPendentes" runat="server"
                                                        ImageUrl="~/Images/seta1_2_on.gif"  CommandArgument="Prev" oncommand="PaginategrdSolPen" />&nbsp;Página 
                                        <asp:DropDownList ID="ddlPagesSolPendentes" runat="server" CssClass="campo"
                                                            AutoPostBack="True" onselectedindexchanged="ddlPagesSolPendentes_SelectedIndexChanged"></asp:DropDownList>&nbsp;de 
                                        <asp:Label ID="lblPageCountSolPendentes"
                                                            runat="server"></asp:Label>&#160; 
                                        <asp:ImageButton ID="ImageButton3SolPendentes" runat="server"
                                                            ImageUrl="~/Images/seta2_1_on.gif"  CommandArgument="Next" oncommand="PaginategrdSolPen" />&nbsp; 
                                        <asp:ImageButton ID="ImageButton4SolPendentes" runat="server"
                                                            ImageUrl="~/Images/seta2_2_on.gif"  CommandArgument="Last" oncommand="PaginategrdSolPen" />
                                    </div>
                                </PagerTemplate>
                            </asp:GridView>
                        </div>
                        <asp:SqlDataSource id="dtsSolPen" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" SelectCommand="ssAtz_GiaCon" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False">
                            <SelectParameters>
                                <asp:ProfileParameter PropertyName="Local.IdCtt" Name="IdCtt" Type="Int64"></asp:ProfileParameter>
                                <asp:ProfileParameter PropertyName="Local.Cte_SeqEnd" DefaultValue="" Name="Cte_SeqEnd" Type="Byte"></asp:ProfileParameter>
                                <asp:Parameter DefaultValue="PEN" Name="Gia_Sit" Type="String"></asp:Parameter>
                            </SelectParameters>
                        </asp:SqlDataSource> 
                        </ContentTemplate>
                    </asp:UpdatePanel> 
                </ContentTemplate>
            </ajaxToolKit:TabPanel>
        </ajaxToolKit:TabContainer> 
    </div>
    <div id="divUpdateProgress" class="updateProgress" style="display:none">
        <div class="updateProgressMessage">
            <img src="../Images/ajax-loader.gif"alt="Processando..." />
            <br />
            <span > Aguarde, processando ...</span>
        </div>
    </div> 
    
    
<%--                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="updPnlTb2">
                    <ProgressTemplate>
                        <div id="OuterTableCellOverlay">
                            <div id="InnerTableCellOverlay">
                                <b>... LOADING PRODUCTS FOR SELECTED CATEGORY ...</b>
                                <br />
                                <asp:Image ID="LoadImage" runat="server" ImageUrl="Images/ajax-loader.gif" />
                            </div>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>--%>
</asp:Content>