<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

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

    <form id="form1" runat="server" method="post">
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
      <div id="leftbar" style="height:200px">
        <h2>Welcome <%Response.Write(Session["uname"]); %> !</h2>
        <br />
        <p> 
        </p>
        <p> Join the movement to end educational inequity in India.</p>
        <a href="http://www.teachforindia.org/" >Teach For India</a>
        <br />
       
        <br />
      </div>
      <div id="rightbar">
        
       
        <div id="signin" runat="server">
        
         <fieldset>
         
       <legend><span style="color:#EE8907;">Sign In</span></legend>
                    <table>
                    <tr>
                    <td colspan="2"><b> UserName </b></td>
                    <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox> </td>
                    </tr>
                    <tr>
                    <td colspan="2"><b> Password </b></td>
                    <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox> </td>
                    </tr>
                     <tr>
                    <td colspan="2">  </td>
                    <td><asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                            onclick="btnSubmit_Click" /></td>
                    </tr>
                    <tr>
                    <td colspan="3">
                        <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label></td>
                    </tr>
                                        </table>      
                     <br />                
         </fieldset> 
         </div>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator_txtname" ControlToValidate="txtName" runat="server" ErrorMessage="Required User Name "> </asp:RequiredFieldValidator>
          <br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator_txtPassword" ControlToValidate="txtPassword" runat="server" ErrorMessage="Required Password"> </asp:RequiredFieldValidator>
      </div>
    </div>
    <div id="bottom" visible="false">
    
      
      
    </div>
  </div>

</form>
</body>
</html>

