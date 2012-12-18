<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cript.aspx.cs" Inherits="Administration_cript" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <script src="../Scripts/mascaras.js" type="text/javascript"></script>
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <br />
        <br />
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
        <br />
        <br />
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Button ID="bntNewUsrPrf" runat="server" OnClick="bntNewUsrPrf_Click" Text="Create User Prf" /><br />
        <br />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Create User Ctt" /><br />
        <br />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Reiniciar Senhas" />
        <br />
        <br />
        <asp:ImageButton ID="Button5" runat="server" OnClick="Button5_Click" ImageUrl="~/Images/bt_concluir.gif"/><br />
        <br />
        <asp:Button ID="Button6" runat="server" Text="teste multiple post back" OnClick="Button5_Click"/>
        <br />
        <asp:Button ID="Button7" runat="server" onclick="Button7_Click" 
            Text="App Settings" />
        <br />
        <br />
        <asp:Button ID="Button8" runat="server" Text="Host name" 
            onclick="Button8_Click" />
        <br />
        <asp:TextBox ID="TextBox4" runat="server" onkeypress="mascara(this,sms)" 
            MaxLength="15" ></asp:TextBox>
        <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="Button" />
        <br />
        <br />
    </div>
    </form>
</body>
</html>
