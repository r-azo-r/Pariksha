<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fellow.aspx.cs" Inherits="Fellow" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
 

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Pariksha</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #links
        {
            height: 101px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server" method="post">
<div id="wrapper">
  <div id="content">
    <div id="header">
      <div id="logo">
        <h1>&nbsp;</h1>
          <h1><font color="black">TEACH</font><span style="color:Blue">FOR</span><font color="black">INDIA</font></h1>

        <h4>PARIKSHA</h4>
      </div>
       <% if (Session["uType"] != null) if (!Session["uType"].ToString().Equals("fellow")) { Response.Redirect("Home.aspx"); } %>
      <div id="links">
        <ul>
          <li id="homesLink" runat="server"><a id="Homes" runat="server" href="Home.aspx">Home</a></li>
          <li id="GenerateTestLink" runat="server"><a id="GenerateTest" runat="server" href="GenerateTest.aspx">GenerateTest</a></li>
          <li id="FellowLink" runat="server"><a id="Fellows" runat="server" href="Fellow.aspx">Search</a></li>
          <li id="SignoutLink" runat="server"><asp:LinkButton ID="lbSignOut" runat="server" onclick="lbSignOut_Click">Sign Out</asp:LinkButton></li>         
        </ul>
      </div>
    </div>
    <div id="mainimg">
    </div>
    <hr />
    <div id="contentarea">
        <h2 style="font-family:'Trebuchet MS';font-size:26px;color:#EE8907;font-weight:normal;">Welcome <%Response.Write(Session["uname"]); %> !</h2>     
        <br />
        <fieldset>
        <legend>Search Test</legend>
        <asp:Label ID="lblSearchTest" runat="server" Text="Enter The TestId"></asp:Label>
        <asp:TextBox ID="txtSearchTest" runat="server" ToolTip="Enter The TestId"></asp:TextBox>
        <asp:Button ID="btnSearchTest"  runat="server" Text="Search Test" 
            ToolTip="Search Test" onclick="btnSearchTest_Click"/>
        <br />
        <asp:Label ID="lblMessage" runat="server" Text="No Test Is Available" Visible = "false"></asp:Label>
        <br />
        <asp:HyperLink ID="HyperLink_fellow" runat="server" NavigateUrl="~/Display.aspx?show=1" Target="_blank" Visible="false">Fellow Version</asp:HyperLink> 
        <br />
        <br />
        <asp:HyperLink ID="HyperLink_student" runat="server" NavigateUrl="~/Display.aspx?show=0" Target="_blank" Visible="false">Student Version</asp:HyperLink>
        <br />
        </fieldset>
        <fieldset>
        <legend>Previous Tests</legend>
        <br />
        <asp:ObjectDataSource ID="ObjectDataSource_fellow" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="DataSet2TableAdapters.DataTable1TableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="creator" SessionField="uid" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" ShowRefreshButton="False" 
            Font-Names="Verdana" Font-Size="8pt" Height="600px" Width="700px" 
            style="margin-right: 131px">
            <LocalReport ReportPath="Report_Fellow.rdlc">
               
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource_fellow" 
                        Name="DataSet1_DataTable1" />
                </DataSources>
               
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="GetData" TypeName="DataSet1TableAdapters.DataTable1TableAdapter">
        </asp:ObjectDataSource>
        </fieldset>
    </div>
        </div>
      </div>
      
    </form>
  </body>
</html>
