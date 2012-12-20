<%@ Page Title="" Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="biobnf.aspx.cs" Inherits="Bio_biobnf" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


<!-- NBioBSP Component -->
<OBJECT classid="CLSID: F66B9251-67CA-4d78-90A3-28C2BFAE89BF"
    height="0" width="0"
    id="objNBioBSP"
    name="objNBioBSP">
</OBJECT>
<!-- ----------------- --
  -- JavaScript Sample --
  -- ----------------- -->
<script language="javascript">

function regist()
{	
	var err, payload;
	var result = false;

	// Check ID is not NULL
//	if (aspnetForm.ctl00_MainContent_UserID.value == '')
//	{
//		alert('Please enter user id !');
//		return(false);
//	}

	try // Exception handling
	{
		DEVICE_AUTO_DETECT	= 255;
		
		var objNBioBSP = new ActiveXObject('NBioBSPCOM.NBioBSP.1');
		var objDevice = objNBioBSP.Device;
		var objExtraction = objNBioBSP.Extraction;		

		// Open device. [AUTO_DETECT]
		// You must open device before enroll.
		objDevice.Open(DEVICE_AUTO_DETECT);

		err = objDevice.ErrorCode;	// Get error code	
		if ( err != 0 )		// Device open failed
		{
			alert('Device open failed !');
		}
		else
		{
			// Enroll user's fingerprint.
			objExtraction.Enroll(payload);
			err = objExtraction.ErrorCode;	// Get error code
		
			if ( err != 0 )		// Enroll failed
			{
				alert('Registration failed ! Error Number : [' + err + ']');
			}
			else	// Enroll success
			{
				// Get text encoded FIR data from NBioBSP module.
			    //document.Form1.FIRTextData.value = objExtraction.TextEncodeFIR;
			    aspnetForm.ctl00_MainContent_txtFIR.value = objExtraction.TextEncodeFIR;
				alert('Registration success !');
				result = true;
			}
			
			// Close device. [AUTO_DETECT]
			objDevice.Close(DEVICE_AUTO_DETECT);
		}

		objExtraction = 0;
		objDevice = 0;
		objNBioBSP = 0;		
	}
	catch(e)
	{
		alert(e.message);
		return(false);
	}
	
	if ( result )
	{
		// Submit main form
		//document.MainForm.submit();
	}
	return result;
}
</script>

    <p>
        &nbsp;<span class="erro"><asp:Image ID="imgMsg" 
            runat="server" ImageUrl="../Images/ico_alert.gif" Visible="False" />
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                                                    </span>
        <br />
    </p>
    <p>
        <asp:Label ID="lblBnfMtr" runat="server"></asp:Label>
        -<asp:Label ID="lblBnfNme" runat="server"></asp:Label>
    </p>
    <p>
        
        Selecione o dedo que será registrado:</p>
    <p>
        
        <asp:RadioButtonList ID="rblFinger" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem>0</asp:ListItem>
            <asp:ListItem Selected="True">1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem Value="8"></asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
        </asp:RadioButtonList>
        
    </p>
    <p>        
        <asp:Image ID="Image1" runat="server" Height="240px" 
            ImageUrl="~/Images/Bio/handsandnumbers.jpg" Width="226px" />        
    </p>
    <p>
<%--        <asp:ImageButton ID="ibtEnroll" runat="server" 
            ImageUrl="~/Images/bt_gravar.GIF" onclick="regist()"/>--%>        
        <img alt="Gravar" src="../Images/bt_gravar.GIF" 
            style="width: 77px; height: 19px" onclick="regist()" />
        <asp:ImageButton ID="ibtVoltar" runat="server" 
            ImageUrl="~/Images/bt_voltar.gif" onclick="ibtVoltar_Click" 
            Height="19px" />
    <p>
        &nbsp;</p>
    <p>        
        &nbsp;</p>
    <p>
        FIR:
        <asp:TextBox ID="txtFIR" runat="server" Width="90%" ReadOnly="True"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="btnEnroll" runat="server" onclick="btnEnroll_Click" 
            Text="Registrar" Visible="False" />&nbsp;
        <asp:Button ID="btnVerify" runat="server" onclick="btnVerify_Click" 
            Text="Verificar" Visible="False" />&nbsp;
        <asp:Button ID="btnSave" runat="server" Text="Gravar" onclick="btnSave_Click" 
            Visible="False" />
    </p>
</asp:Content>

