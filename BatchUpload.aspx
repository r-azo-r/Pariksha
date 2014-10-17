<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BatchUpload.aspx.cs" Inherits="BatchUpload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Pariksha</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #header
        {
            height: 99px;
        }
    </style>
    
</head>
<body>

    <form id="form2" runat="server" method="post">
<div id="wrapper">
  <div id="content">
  
    <div id="header">
      <div id="logo">
        <h1><font color="black">TEACH</font><span style="color:Blue">FOR</span><font color="black">INDIA</font></h1>
        <h4>PARIKSHA</h4>
      </div>
      <div id="links">
          <ul>
          <li id="homesLink" runat="server"><a id="Homes" runat="server" href="Home.aspx">Home</a></li>
          <li id="AddQuestionLink" runat="server"><a id ="AddQuestion" runat = "server" href="AddQuestion.aspx">AddQuestions</a></li>
          <li id="GenerateTestLink" runat="server"><a id="GenerateTest" runat="server" href="GenerateTest.aspx">GenerateTest</a></li>
          <li id="FellowLink" runat="server" visible="false"><a id="Fellows" runat="server" href="Fellow.aspx" >Search</a></li>
          <li id="AdministratorLink" runat="server"><a id = "Administrator" runat="server" href="Administrator.aspx">Administration</a></li>
          <li id="SignoutLink" runat="server"><asp:LinkButton ID="lbSignOut" runat="server" onclick="lbSignOut_Click">Sign Out</asp:LinkButton></li>         
        </ul>
      </div>
    </div>
    <div id="mainimg">

    </div>
    <hr />
    <div id="contentarea">
      <div>
      Select The file to upload.
      Please ensure that the data is filled properly and in the pre-described format.
    <asp:FileUpload ID="fileUpload" runat ="server" />
    <asp:Button ID="Uploadbtn" Text="Batch Upload" runat ="server" onclick="Uploadbtn_Click" />
    <asp:Label ID="lblmessage" runat="server" Visible="false"></asp:Label>
    </div>
    </div>

  </div>

</form>
</body>
</html>




