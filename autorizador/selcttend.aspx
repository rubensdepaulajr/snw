<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="selcttend.aspx.cs" Inherits="selcttend" Title="Selecionar Local do Contratado" %>
<%@ MasterType VirtualPath="~/Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    Selecione abaixo o local do Contratado:<br />
    <br />
    <asp:GridView ID="grd" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="IdCtt,Cte_SeqEnd,Ctt_Nme,IdUsr" DataSourceID="dtsCttEnd" Width="100%" Font-Size="Small" OnSelectedIndexChanged="grd_SelectedIndexChanged" AllowPaging="True" AllowSorting="True">
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#E3EAEB" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ButtonType="Image" SelectText="..." ShowSelectButton="True" SelectImageUrl="~/Img/btn/btnGridSelItem.gif" />
            <asp:BoundField DataField="IdCtt" HeaderText="C&#243;digo" SortExpression="IdCtt">
                <ItemStyle Width="10%" />
            </asp:BoundField>
            <asp:BoundField DataField="Cte_SeqEnd" HeaderText="Seq." SortExpression="Cte_SeqEnd">
                <ItemStyle Width="5%" />
            </asp:BoundField>
            <asp:BoundField DataField="Ctt_Nme" HeaderText="Nome do Contratado" SortExpression="Ctt_Nme">
                <ItemStyle Width="40%" />
            </asp:BoundField>
            <asp:BoundField DataField="Lgr_Nme" HeaderText="Logradouro" SortExpression="Lgr_Nme">
                <ItemStyle Width="20%" />
            </asp:BoundField>
            <asp:BoundField DataField="Brr_Nme" HeaderText="Bairro" SortExpression="Brr_Nme">
                <ItemStyle Width="20%" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="dtsCttEnd" runat="server" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" OnSelecting="dtsLocAtd_Selecting" SelectCommand="ssAtz_UsrCttEnd" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False">
        <SelectParameters>
            <asp:Parameter DefaultValue="" Name="UserName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>


