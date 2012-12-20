<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="sellocatd.aspx.cs" Inherits="sellocatd" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    Selecione abaixo o local do Contratado:<br />
    <br />
    <asp:GridView ID="grd" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="IdCrd" DataSourceID="dtsLocAtd" Width="100%" Font-Size="Small" OnSelectedIndexChanged="grd_SelectedIndexChanged">
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#E3EAEB" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
            <asp:BoundField DataField="IdCtt" HeaderText="C&#243;digo" ReadOnly="True" SortExpression="IdCtt" >
                <HeaderStyle Width="80px" />
                <ItemStyle Width="80px" />
            </asp:BoundField>
            <asp:BoundField DataField="Ctt_Nme" HeaderText="Nome do Contratado" SortExpression="Ctt_Nme" />
            <asp:BoundField DataField="Lgr_Nme" HeaderText="Logradouro" SortExpression="Lgr_Nme" />
            <asp:BoundField DataField="Brr_Nme" HeaderText="Bairro" SortExpression="Brr_Nme" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="dtsLocAtd" runat="server" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" OnSelecting="dtsLocAtd_Selecting" SelectCommand="ssAtz_UsrCttEnd" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False">
        <SelectParameters>
            <asp:Parameter DefaultValue="" Name="UserName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button ID="btnAtdCon" runat="server" Enabled="False" PostBackUrl="~/Atd/atdcon.aspx"
        Text="Ir para o atendimento" />
</asp:Content>


