<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Theme="Standard" Title="Página Inicial de Profissional"  CodeFile="prf.aspx.cs" Inherits="Atz_prf" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolKit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <script type="text/javascript" language="javascript">
        // Event that occurs when click the tab of TabContainer
        function clientActiveTabChanged(sender, args) {
            //  if the tab does not exist and it is the active tab, 
            //  trigger the async-postback
            if (sender.get_activeTabIndex() == 0) {
                // load tab1
                $get("<%= btnTb1Trigger.ClientID %>").click();
            }
            else if (sender.get_activeTabIndex() == 1) {
                // load tab2
                $get("<%= btnTb2Trigger.ClientID %>").click();
            }
            else if (sender.get_activeTabIndex() == 2) {
                // load tab3
                $get("<%= btnTb3Trigger.ClientID %>").click();
            }
        }                  
    </script> 
    <ajaxToolKit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0"  CssClass="tabcontainer" OnClientActiveTabChanged="clientActiveTabChanged" >
        <ajaxToolKit:TabPanel runat="server" HeaderText="Consultas Autorizadas" ID="solicitacoesAutorizadas">
            <ContentTemplate>
                <asp:UpdatePanel id="updPnlTb1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <%--hidden buttons that are used to trigger the postbacks--%>
                        <input id="btnTb1Trigger" runat="server" type="button" style="display:none" onserverclick="btnTb1Trigger_Click" /> 
                        <div align="left">
                        <br />
                        <div style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px">
                            <asp:TextBox id="txtBusca" runat="server" CssClass="campo"></asp:TextBox>&nbsp; &nbsp; 
                            <asp:ImageButton id="btnBuscar" runat="server" ImageUrl="~/Images/bt_buscar.gif"></asp:ImageButton>
                            <br />
                            <br />
                            <asp:GridView id="grdSolAtz" runat="server" CssClass="grid-view-left" DataSourceID="dtsSolAtz" Width="100%" OnRowCreated="gvHover_RowCreated" AllowSorting="True" ondatabound="grdSolAtz_DataBound" DataKeyNames="Bnf_Mtr" AllowPaging="True" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="Bnf_Mtr" HeaderText="Matr&#237;cula" SortExpression="Bnf_Mtr"></asp:BoundField>
                                    <asp:HyperLinkField DataNavigateUrlFields="IdBnf" DataNavigateUrlFormatString="fhapci.aspx?Bnf={0}" DataTextField="Bnf_Nme" HeaderText="Benefici&#225;rio" SortExpression="Bnf_Nme"></asp:HyperLinkField>
                                    <asp:BoundField DataField="Esp_Dsc" HeaderText="Especialidade" SortExpression="Esp_Dsc"></asp:BoundField>
                                    <asp:BoundField DataField="Gia_TipDsc" HeaderText="Tipo" ReadOnly="True" SortExpression="Gia_TipDsc"></asp:BoundField>
                                </Columns>
                                <PagerTemplate>
                                    <div height="20" align="center">
                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/seta1_1_on.gif" CommandArgument="First" oncommand="PaginategrdSolAtz" />&#160;&nbsp;
                                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/seta1_2_on.gif"  CommandArgument="Prev" oncommand="PaginategrdSolAtz" />&#160;Página 
                                        <asp:DropDownList ID="ddlPages" runat="server" CssClass="campo" AutoPostBack="True" onselectedindexchanged="ddlPages_SelectedIndexChanged"></asp:DropDownList>&nbsp;de 
                                        <asp:Label ID="lblPageCount" runat="server"></asp:Label> &nbsp;
                                        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Images/seta2_1_on.gif"  CommandArgument="Next" oncommand="PaginategrdSolAtz" />&#160;&nbsp;
                                        <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Images/seta2_2_on.gif"  CommandArgument="Last" oncommand="PaginategrdSolAtz" />
                                    </div>
                                </PagerTemplate>
                            </asp:GridView>
                        </div>
                        <asp:SqlDataSource id="dtsSolAtz" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" SelectCommand="ssAtz_GiaCon" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ProfileParameter DefaultValue="" Name="IdCtt" PropertyName="Local.IdCtt" Type="Int64" />
                                <asp:ProfileParameter DefaultValue="" Name="Cte_SeqEnd" PropertyName="Local.Cte_SeqEnd" Type="Byte" />
                                <asp:Parameter DefaultValue="ATZ" Name="Gia_Sit" Type="String" />
                                <asp:ControlParameter ControlID="hdfIdPrf" Name="IdPrf" PropertyName="Value" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="updateProgessTb1" runat="server" AssociatedUpdatePanelID="updPnlTb1">
                    <ProgressTemplate>
                        <div id="OuterTableCellOverlay" class="updateProgress">
                            <div id="InnerTableCellOverlay" class="updateProgressMessage">                                    
                                <asp:Image ID="LoadImage" runat="server" ImageUrl="../Images/ajax-loader.gif" />
                                <br />
                                <b>Aguarde, processando ...</b>                                    
                            </div>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </ContentTemplate>
        </ajaxToolKit:TabPanel>
        <ajaxToolKit:TabPanel runat="server" HeaderText="Retornos" ID="retornos">
            <ContentTemplate>
                <asp:UpdatePanel ID="updPnlTb2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <%--hidden buttons that are used to trigger the postbacks--%>
                        <input id="btnTb2Trigger" runat="server" type="button" style="display:none" onserverclick="btnTb2Trigger_Click" /> 
                        <div style="padding: 0px 0 0 20px;">
                            <br />
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="campo"></asp:TextBox>&#160; &#160; 
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/bt_buscar.gif"  />
                            <br />
                            <br />
                            <asp:GridView ID="grdRet" runat="server" AllowPaging="True"  
                                    OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" DataKeyNames="Bnf_Mtr" 
                                    DataSourceID="dtsRet" Width="100%" CssClass="grid-view-left" Visible="false"
                                    ondatabound="grdRet_DataBound" AllowSorting="True" UseAccessibleHeader="True">
                                <Columns>
                                    <asp:BoundField DataField="Bnf_Mtr" HeaderText="Matr&#237;cula" SortExpression="Bnf_Mtr" />
                                    <asp:HyperLinkField DataNavigateUrlFields="IdBnf" DataNavigateUrlFormatString="fhapci.aspx?Bnf={0}" DataTextField="Bnf_Nme" HeaderText="Benefici&#225;rio" SortExpression="Bnf_Nme" />
                                    <asp:BoundField DataField="Esp_Dsc" HeaderText="Especialidade" SortExpression="Esp_Dsc" />
                                    <asp:BoundField DataField="Gia_TipDsc" HeaderText="Tipo" ReadOnly="True" SortExpression="Gia_TipDsc" />
                                    <asp:BoundField DataField="Gpd_DatRel" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Execu&#231;&#227;o" SortExpression="Gpd_DatRel" />
                                </Columns>
                                <PagerTemplate>
                                    <div height="20" align="center">
                                        <asp:ImageButton ID="ImageButton1Retorno" runat="server" ImageUrl="~/Images/seta1_1_on.gif" CommandArgument="First" oncommand="PaginategrdRet" />&nbsp; 
                                        <asp:ImageButton ID="ImageButton2Retorno" runat="server" ImageUrl="~/Images/seta1_2_on.gif"  CommandArgument="Prev" oncommand="PaginategrdRet" />&nbsp;Página 
                                        <asp:DropDownList ID="ddlPagesRetorno" runat="server" CssClass="campo" AutoPostBack="True" onselectedindexchanged="ddlPagesRetorno_SelectedIndexChanged"></asp:DropDownList>&nbsp;de 
                                        <asp:Label ID="lblPageCountRetorno" runat="server"></asp:Label>&nbsp; 
                                        <asp:ImageButton ID="ImageButton3Retorno" runat="server" ImageUrl="~/Images/seta2_1_on.gif"  CommandArgument="Next" oncommand="PaginategrdRet" />&nbsp; 
                                        <asp:ImageButton ID="ImageButton4Retorno" runat="server" ImageUrl="~/Images/seta2_2_on.gif"  CommandArgument="Last" oncommand="PaginategrdRet" />
                                    </div>
                                </PagerTemplate>
                            </asp:GridView>
                        </div>
                        <asp:SqlDataSource ID="dtsRet" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>"
                                SelectCommand="ssAtz_GiaCon" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False">
                            <SelectParameters>
                                <asp:ProfileParameter Name="IdCtt" PropertyName="Local.IdCtt" Type="Int64" />
                                <asp:ProfileParameter DefaultValue="" Name="Cte_SeqEnd" PropertyName="Local.Cte_SeqEnd" Type="Byte" />
                                <asp:Parameter DefaultValue="RET" Name="Gia_Sit" Type="String" />
                                <asp:ControlParameter ControlID="hdfIdPrf" Name="IdPrf" PropertyName="Value" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="updateProgessTb2" runat="server" AssociatedUpdatePanelID="updPnlTb2">
                    <ProgressTemplate>
                        <div id="OuterTableCellOverlay" class="updateProgress">
                            <div id="InnerTableCellOverlay" class="updateProgressMessage">                                    
                                <asp:Image ID="LoadImage" runat="server" ImageUrl="../Images/ajax-loader.gif" />
                                <br />
                                <b>Aguarde, processando ...</b>                                    
                            </div>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </ContentTemplate>
        </ajaxToolKit:TabPanel>
        <ajaxToolKit:TabPanel runat="server" HeaderText="Consultas Executadas" ID="solicitacoesPendentes">
            <ContentTemplate>
                <asp:UpdatePanel id="updPnlTb3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <%--hidden buttons that are used to trigger the postbacks--%>
                        <input id="btnTb3Trigger" runat="server" type="button" style="display:none" onserverclick="btnTb3Trigger_Click" />   
                        <div style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px">
                            <br />
                            <asp:TextBox id="TextBox2" runat="server" CssClass="campo"></asp:TextBox>&nbsp; &nbsp; 
                            <asp:ImageButton id="ImageButton2" runat="server" ImageUrl="~/Images/bt_buscar.gif"></asp:ImageButton>
                            <br />
                            <br />
                            <asp:GridView id="grdSolExe" runat="server" CssClass="grid-view-left" DataSourceID="dtsSolExe" Width="100%" AutoGenerateColumns="False" AllowPaging="True" 
                                    onrowcreated="gvHover_RowCreated" DataKeyNames="IdGia" ondatabound="grdSolExe_DataBound" Visible="false">
                                <FooterStyle  Font-Bold="True" ForeColor="White" />
                                <PagerTemplate>
                                    <div height="20" align="center">
                                        <asp:ImageButton ID="ImageButton1SolPendentes" runat="server" ImageUrl="~/Images/seta1_1_on.gif" CommandArgument="First" oncommand="PaginategrdSolExe" />&nbsp; 
                                        <asp:ImageButton ID="ImageButton2SolPendentes" runat="server" ImageUrl="~/Images/seta1_2_on.gif" CommandArgument="Prev" oncommand="PaginategrdSolExe" />&nbsp;Página 
                                        <asp:DropDownList ID="ddlPagesSolPendentes" runat="server" CssClass="campo" AutoPostBack="True" onselectedindexchanged="ddlPagesSolPendentes_SelectedIndexChanged"></asp:DropDownList>&nbsp;de 
                                        <asp:Label ID="lblPageCountSolPendentes" runat="server"></asp:Label>&#160; 
                                        <asp:ImageButton ID="ImageButton3SolPendentes" runat="server" ImageUrl="~/Images/seta2_1_on.gif" CommandArgument="Next" oncommand="PaginategrdSolExe" />&nbsp; 
                                        <asp:ImageButton ID="ImageButton4SolPendentes" runat="server" ImageUrl="~/Images/seta2_2_on.gif"  CommandArgument="Last" oncommand="PaginategrdSolExe" />
                                    </div>
                                </PagerTemplate>
                                 <Columns>
                                     <asp:BoundField DataField="Bnf_Mtr" HeaderText="Matr&#237;cula" 
                                         SortExpression="Bnf_Mtr" />
                                     <asp:HyperLinkField DataNavigateUrlFields="IdBnf" DataNavigateUrlFormatString="fhapci.aspx?Bnf={0}"
                                         DataTextField="Bnf_Nme" HeaderText="Benefici&#225;rio" 
                                         SortExpression="Bnf_Nme" />
                                     <asp:BoundField DataField="Esp_Dsc" HeaderText="Especialidade" 
                                         SortExpression="Esp_Dsc" />
                                     <asp:BoundField DataField="Gia_TipDsc" HeaderText="Tipo" 
                                         SortExpression="Gia_TipDsc" />
                                 </Columns>
                            </asp:GridView>
                        </div>
                        <asp:SqlDataSource id="dtsSolExe" runat="server" SelectCommandType="StoredProcedure" SelectCommand="ssAtz_GiaCon" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" CancelSelectOnNullParameter="False">
                            <SelectParameters>
                                <asp:ProfileParameter Name="IdCtt" PropertyName="Local.IdCtt" Type="Int64" />
                                <asp:ProfileParameter DefaultValue="" Name="Cte_SeqEnd" PropertyName="Local.Cte_SeqEnd" Type="Byte" />
                                <asp:Parameter DefaultValue="exe" Name="Gia_Sit" Type="String" />
                                <asp:ControlParameter ControlID="hdfIdPrf" Name="IdPrf" PropertyName="Value" Type="Int32" />
                            </SelectParameters></asp:SqlDataSource><!-- inicio do html do grid expansivo --> 
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="updateProgessTb3" runat="server" AssociatedUpdatePanelID="updPnlTb3">
                    <ProgressTemplate>
                        <div id="OuterTableCellOverlay" class="updateProgress">
                            <div id="InnerTableCellOverlay" class="updateProgressMessage">                                    
                                <asp:Image ID="LoadImage" runat="server" ImageUrl="../Images/ajax-loader.gif" />
                                <br />
                                <b>Aguarde, processando ...</b>                                    
                            </div>
                        </div>
                    </ProgressTemplate>
               </asp:UpdateProgress>
            </ContentTemplate>
        </ajaxToolKit:TabPanel>
    </ajaxToolKit:TabContainer>
    <asp:HiddenField ID="hdfIdPrf" runat="server" />
</asp:Content>

