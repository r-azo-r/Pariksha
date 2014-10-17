<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GenerateTest.aspx.cs" Inherits="GenerateTest" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
<form id="form1" runat="server" method="post" >
<div id="wrapper">
  <div id="content">
    <div id="header">
      <div id="logo">
        <h1><font color="black">TEACH</font><span style="color:Blue">FOR</span><font color="black">INDIA</font></h1>
                <h4>PARIKSHA</h4>
      </div>
      <% if (Session["uType"] != null)
             if (Session["uType"].ToString().Equals("fellow"))
             {
                 AddQuestionLink.Visible = false;
                 AdministratorLink.Visible = false;
                 AddQuestion.Visible = false;
                 Administrator.Visible = false;
                 FellowLink.Visible = true;
                 Fellows.Visible = true;
             }
             
       %>
      <div id="links">
        <ul>
          <li id="homesLink" runat="server"><a id="Homes" runat="server" href="Home.aspx">Home</a></li>
          <li id="AddQuestionLink" runat="server"><a id ="AddQuestion" runat = "server" href="AddQuestion.aspx">AddQuestions</a></li>
          <li id="GenerateTestLink" runat="server"><a id="GenerateTests" runat="server" href="GenerateTest.aspx">GenerateTest</a></li>
           <li id="FellowLink" runat="server" visible="false"><a id="Fellows" runat="server" href="Fellow.aspx" visible="false">Search</a></li>
          <li id="AdministratorLink" runat="server"><a id = "Administrator" runat="server" href="Administrator.aspx">Administration</a></li>
          <li id="SignoutLink" runat="server">
              <asp:LinkButton ID="lbSignOut" runat="server" onclick="lbSignOut_Click">Sign Out</asp:LinkButton></li>         
        </ul>
      </div>
    </div>
    <div id="mainimg">
    </div>
    <hr />
    <div id="contentarea">
         <h2 style="font-family:'Trebuchet MS';font-size:26px;color:#EE8907;font-weight:normal;">Welcome <%Response.Write(Session["uname"]); %> !</h2>  
        <br />
   </diWelcome <%Response.Write(Session["uname"]); %> !</h2>  
        <br />
   </div>
      <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager> 
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
          <ContentTemplate>
          <asp:Table ID ="Selection" runat="server" Width="749px">
              <asp:TableHeaderRow>
          <asp:TableHeaderCell HorizontalAlign="Left">Grade</asp:TableHeaderCell>
          <asp:TableHeaderCell HorizontalAlign="Left">Subject Name</asp:TableHeaderCell>
          <asp:TableHeaderCell HorizontalAlign="Left">Subject category</asp:TableHeaderCell>
          <asp:TableHeaderCell HorizontalAlign="Left">Standard</asp:TableHeaderCell>
          <asp:TableHeaderCell HorizontalAlign="Left">Rating</asp:TableHeaderCell>
          </asp:TableHeaderRow>
              
              <asp:TableRow>
          <asp:TableCell> <asp:DropDownList ID="dropdown_standard" AutoPostBack="True" runat="server" Width="100">
                                <asp:ListItem Text="K.G." Value="k.g."></asp:ListItem>
                                <asp:ListItem Text="First"  Value="first"></asp:ListItem>
                                <asp:ListItem Text="Second" Value="second"></asp:ListItem>
                                <asp:ListItem Text="Third" Value="third"></asp:ListItem>
                                <asp:ListItem Text="Fourth" Value="fourth"></asp:ListItem>
                                <asp:ListItem Text="Fifth" Value="fifth"></asp:ListItem>
                            </asp:DropDownList>
           </asp:TableCell>
         <asp:TableCell>  <asp:DropDownList ID="dropdown_Subject" runat="server" AutoPostBack="true" Width="150" DataSourceID="SqlDataSource1" DataTextField="subjectName" DataValueField="subjectName"  > </asp:DropDownList> 
          </asp:TableCell>
          
          <asp:TableCell> <asp:DropDownList ID="dropdown_subjectCategory" runat="server" Width="150" DataSourceID="SqlDataSource2" AutoPostBack="True"  DataTextField="subjectCategory" DataValueField = "subjectCategory" > </asp:DropDownList>   
          </asp:TableCell>
              <asp:TableCell>
           
              <asp:DropDownList ID="dropdown_subjectLevel" runat="server"  
          DataSourceID="SqlDataSource3" DataTextField="subjectLevel" 
                DataValueField = "subjectLevel"  Width="100px" AutoPostBack="True"> </asp:DropDownList> 
      
          
           
               
           </asp:TableCell>         
          <asp:TableCell> <asp:DropDownList ID="dropdown_rating" runat="server" Width="75">
                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                           </asp:DropDownList>
          </asp:TableCell>
        
          
          <asp:TableCell>
          <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" ToolTip="Submit Search Criteria"/>
          </asp:TableCell>
          
          </asp:TableRow>
          <asp:TableRow><asp:TableCell ColumnSpan="6" HorizontalAlign="Center"><b><asp:Label ID="lblQuestionCount" runat ="server" Visible="true" ForeColor="CadetBlue" Font-Size="Medium"></asp:Label></b></asp:TableCell></asp:TableRow>
          </asp:Table>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server"   
                            ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>"
                            SelectCommand="SELECT distinct subjectName from subject">
           </asp:SqlDataSource>      
          <asp:SqlDataSource ID="SqlDataSource2" runat="server"   
                            ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>"
                            SelectCommand="SELECT distinct subjectCategory from subject where subjectName=@subjectName">
                            <SelectParameters>
                            <asp:ControlParameter ControlID="dropdown_Subject" Name="subjectName" PropertyName="SelectedValue" />
                            </SelectParameters>
          </asp:SqlDataSource> 
          <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>" 
                
                  SelectCommand="select subjectLevel from subject where(subjectName = @subjectName and subjectCategory=@subjectCategory and stdid=(select stdid from standard where standardName=@standardName))">
                 <SelectParameters>
                    <asp:ControlParameter ControlID="dropdown_Subject" Name="subjectName" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="dropdown_subjectCategory" 
                        Name="subjectCategory" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dropdown_standard" 
                        Name="standardName" PropertyName="SelectedValue" />
                     
                </SelectParameters>
                
            </asp:SqlDataSource>         
          <asp:SqlDataSource ID="SqlDataSource_brief" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>" 
                  SelectCommand="getQuestion" SelectCommandType="StoredProcedure">
              <SelectParameters>
                  <asp:Parameter DefaultValue="brief" Name="questionType" Type="String" />
                  <asp:ControlParameter ControlID="dropdown_standard" DefaultValue="" 
                      Name="standard" PropertyName="SelectedValue" Type="String" />
                  <asp:ControlParameter ControlID="dropdown_Subject" Name="subjectName" 
                      PropertyName="SelectedValue" Type="String" />
                  <asp:ControlParameter ControlID="dropdown_subjectCategory" 
                      Name="subjectCategory" PropertyName="SelectedValue" Type="String" />
                  <asp:ControlParameter ControlID="dropdown_rating" DefaultValue="1" 
                      Name="rating" PropertyName="SelectedValue" Type="Int32" />
                  <asp:ControlParameter ControlID="dropdown_subjectLevel" 
                  Name="subjectLevel" PropertyName="SelectedValue" Type="String" />
              </SelectParameters>
              </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource_choice" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>" 
                  SelectCommand="getQuestion" SelectCommandType="StoredProcedure">
              <SelectParameters>
                  <asp:Parameter DefaultValue="choice" Name="questionType" Type="String" />
                  <asp:ControlParameter ControlID="dropdown_standard" DefaultValue="" 
                      Name="standard" PropertyName="SelectedValue" Type="String" />
                  <asp:ControlParameter ControlID="dropdown_Subject" Name="subjectName" 
                      PropertyName="SelectedValue" Type="String" />
                  <asp:ControlParameter ControlID="dropdown_subjectCategory" 
                      Name="subjectCategory" PropertyName="SelectedValue" Type="String" />
                  <asp:ControlParameter ControlID="dropdown_rating" Name="rating" 
                      PropertyName="SelectedValue" Type="Int32" />
                      <asp:ControlParameter ControlID="dropdown_subjectLevel" 
                  Name="subjectLevel" PropertyName="SelectedValue" Type="String" />
              </SelectParameters>
              </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource_custom" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>" 
                  SelectCommand="getQuestion" SelectCommandType="StoredProcedure">
              <SelectParameters>
                  <asp:Parameter DefaultValue="custom" Name="questionType" Type="String" />
                  <asp:ControlParameter ControlID="dropdown_standard" DefaultValue="" 
                      Name="standard" PropertyName="SelectedValue" Type="String" />
                  <asp:ControlParameter ControlID="dropdown_Subject" Name="subjectName" 
                      PropertyName="SelectedValue" Type="String" />
                  <asp:ControlParameter ControlID="dropdown_subjectCategory" 
                      Name="subjectCategory" PropertyName="SelectedValue" Type="String" />
                  <asp:ControlParameter ControlID="dropdown_rating" Name="rating" 
                      PropertyName="SelectedValue" Type="Int32" />
                  <asp:ControlParameter ControlID="dropdown_subjectLevel" 
                  Name="subjectLevel" PropertyName="SelectedValue" Type="String" />
              </SelectParameters>
              </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource_fill" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>" 
                  SelectCommand="getQuestion" SelectCommandType="StoredProcedure">
              <SelectParameters>
                  <asp:Parameter DefaultValue="fill" Name="questionType" Type="String" />
                  <asp:ControlParameter ControlID="dropdown_standard" DefaultValue="" 
                      Name="standard" PropertyName="SelectedValue" Type="String" />
                  <asp:ControlParameter ControlID="dropdown_Subject" Name="subjectName" 
                      PropertyName="SelectedValue" Type="String" />
                  <asp:ControlParameter ControlID="dropdown_subjectCategory" 
                      Name="subjectCategory" PropertyName="SelectedValue" Type="String" />
                  <asp:ControlParameter ControlID="dropdown_rating" Name="rating" 
                      PropertyName="SelectedValue" Type="Int32" />
                  <asp:ControlParameter ControlID="dropdown_subjectLevel" 
                  Name="subjectLevel" PropertyName="SelectedValue" Type="String" />
              </SelectParameters>
              </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource_matching" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>" 
                  SelectCommand="getQuestion" SelectCommandType="StoredProcedure">
              <SelectParameters>
                  <asp:Parameter DefaultValue="matching" Name="questionType" Type="String" />
                  <asp:ControlParameter ControlID="dropdown_standard" DefaultValue="" 
                      Name="standard" PropertyName="SelectedValue" Type="String" />
                  <asp:ControlParameter ControlID="dropdown_Subject" Name="subjectName" 
                      PropertyName="SelectedValue" Type="String" />
                  <asp:ControlParameter ControlID="dropdown_subjectCategory" 
                      Name="subjectCategory" PropertyName="SelectedValue" Type="String" />
                  <asp:ControlParameter ControlID="dropdown_rating" Name="rating" 
                      PropertyName="SelectedValue" Type="Int32" />
                      <asp:ControlParameter ControlID="dropdown_subjectLevel" 
                  Name="subjectLevel" PropertyName="SelectedValue" Type="String" />
              </SelectParameters>
              </asp:SqlDataSource>          
          <br />
              <asp:Table ID = "Content" runat="Server" Height="72px" Width="267px">
           
              <asp:TableRow>
          <asp:TableCell ColumnSpan="4"><asp:Label ID ="lblbrief" runat="server"  Visible = "False" Width="175" Text = "Brief Answer Questions"  Font-Bold="true" ForeColor="CadetBlue" Font-Size="Medium"></asp:Label></asp:TableCell>
          <asp:TableCell>
          <asp:GridView ID="GridView_brief" runat="server" AllowPaging="True" 
                  AutoGenerateColumns="False" DataKeyNames="qid"  
                  OnPageIndexChanging="GridView_briefPageChanging" Width="600" CellPadding="4" 
                  ForeColor="#333333" GridLines="None" PageSize="5" >
                   <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                  <Columns>
                      <asp:TemplateField HeaderText="Select" visible="false">
                     <ItemTemplate>
                     <asp:Label ID="GridView_brief_qid" runat="server" Text='<%#Eval("qid") %>'/>
                     </ItemTemplate>
                     </asp:TemplateField>
                     
                     <asp:TemplateField HeaderText="Select" >
                     <ItemTemplate>
                     <asp:CheckBox ID="GridView_brief_checkbox" runat="server" OnCheckedChanged="addBriefQid"/>
                     </ItemTemplate>
                     </asp:TemplateField>                     
                     <asp:TemplateField HeaderText="Question">
                     <ItemTemplate>
                     <asp:Literal ID="GridView_brief_Question" runat="server" Text='<%#Eval("questionText") %>'/>
                     </ItemTemplate>
                     </asp:TemplateField> 
                     
                     <asp:TemplateField HeaderText="Answer">
                     <ItemTemplate>
                     <asp:Literal ID="GridView_brief_answer" runat="server"  Text='<%#Eval("Answer") %>'/>
                     </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Difficulty">
                     <ItemTemplate>
                     <asp:Label ID="GridView_brief_Difficulty" runat="server" Text='<%#Eval("difficulty") %>'/>
                     </ItemTemplate>
                     </asp:TemplateField> 
                     
                  </Columns>
                   <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                   <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                   <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                   <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                   <EditRowStyle BackColor="#999999" />
                   <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
              </asp:GridView></asp:TableCell>
      </asp:TableRow>
              
              <asp:TableRow>
           <asp:TableCell></br></asp:TableCell>
           </asp:TableRow>                
              <asp:TableRow>
           <asp:TableCell ColumnSpan="4"><asp:Label ID = "lblchoice" Font-Bold="true" ForeColor="CadetBlue" Font-Size="Medium" runat="server"  Visible = "False" Width="175" Text="Multiple Choice "></asp:Label></asp:TableCell>
          <asp:TableCell>
          <asp:GridView ID="GridView_choice" runat="server" AllowPaging="True" 
                  AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" Width="600"
                  GridLines="None" PageSize="5" OnPageIndexChanging="GridView_choicePageChanging">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
              
                 <asp:TemplateField Visible="False" HeaderText="Qid">
                      <ItemTemplate>
                           <asp:Label ID="GridView_choice_qid" runat="Server" Text='<%#Eval("qid") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  
                  <asp:TemplateField HeaderText="Select">
                     <ItemTemplate>
                            <asp:CheckBox ID="GridView_choice_checkbox" runat="server" OnCheckedChanged="addChoiceQid"/>
                     </ItemTemplate>
                     </asp:TemplateField>
                     
                  <asp:TemplateField HeaderText="Question">
                        <ItemTemplate>
                        <asp:Literal ID="GridView_choice_qtext" runat="Server" 
                                Text='<%# Eval("QuestionText") %>'></asp:Literal>
                        </ItemTemplate>
                  </asp:TemplateField>
                  
                  <asp:TemplateField HeaderText="ChoiceA">
                        <ItemTemplate>
                        <asp:Label ID="GridView_choice_choiceA" runat="server" Text='<%#Eval("choiceA") %>'></asp:Label>
                        </ItemTemplate>
                  </asp:TemplateField>
                  
                  <asp:TemplateField HeaderText="ChoiceB">
                        <ItemTemplate>
                        <asp:Label ID="GridView_choice_choiceB" runat="server" Text='<%#Eval("choiceB") %>'></asp:Label>
                        </ItemTemplate>
                  </asp:TemplateField>
                  
                  <asp:TemplateField HeaderText="ChoiceC">
                        <ItemTemplate>
                        <asp:Label ID="GridView_choice_choiceC" runat="server" Text='<%#Eval("choiceC") %>'></asp:Label>
                        </ItemTemplate>
                  </asp:TemplateField>
                  
                  <asp:TemplateField HeaderText="ChoiceD">
                        <ItemTemplate>
                        <asp:Label ID="GridView_choice_choiceD" runat="server" Text='<%#Eval("choiceD") %>'></asp:Label>
                        </ItemTemplate>
                  </asp:TemplateField>
                  
                  <asp:TemplateField HeaderText="Answer">
                        <ItemTemplate>
                        <asp:Label ID="GridView_choice_answer" runat="server" Text='<%#Eval("answer") %>'></asp:Label>
                        </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Difficulty">
                     <ItemTemplate>
                     <asp:Label ID="GridView_choice_Difficulty" runat="server" Text='<%#Eval("difficulty") %>'/>
                     </ItemTemplate>
                     </asp:TemplateField> 
              </Columns>
              
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
              
              </asp:GridView></asp:TableCell>
              </asp:TableRow>              
              
              <asp:TableRow>
           <asp:TableCell></br></asp:TableCell>
           </asp:TableRow>
              <asp:TableRow>
           <asp:TableCell ColumnSpan="4"><asp:Label ID ="lblfill" Font-Bold="true" ForeColor="CadetBlue" Font-Size="Medium" runat="server" Visible="false" Width="175" Text="Fill In The Blanks"></asp:Label></asp:TableCell>
          <asp:TableCell>
          <asp:GridView ID="GridView_fill" runat="server" 
                  OnPageIndexChanging="GridView_fillPageChanging" AllowPaging="True" Width="600"
                  AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                  GridLines="None" PageSize="5">
                  <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
              <Columns>
                <asp:TemplateField HeaderText="Qid" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="GridView_fill_qid" runat="Server" Text='<%# Eval("qid") %>' />  
                    </ItemTemplate>
                </asp:TemplateField>
              
              <asp:TemplateField HeaderText="Select">
                    <ItemTemplate>
                    <asp:CheckBox ID="GridView_fill_checkbox" runat="server" OnCheckedChanged="addFillQid"/>
                    </ItemTemplate>
              </asp:TemplateField> 
               
                <asp:TemplateField HeaderText="Question">
                    <ItemTemplate>
                            <asp:Literal ID="GridView_fill_question" runat="server" Text='<%#Eval("questionText") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Answer"> 
                    <ItemTemplate>
                        <asp:Literal ID="GridView_fill_answer" runat="server" Text='<%#Eval("answer") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Difficulty">
                     <ItemTemplate>
                     <asp:Label ID="GridView_fill_Difficulty" runat="server" Text='<%#Eval("difficulty") %>'/>
                     </ItemTemplate>
                     </asp:TemplateField> 
              
              </Columns>
                  <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                  <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                  <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                  <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                  <EditRowStyle BackColor="#999999" />
                  <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
              </asp:GridView></asp:TableCell>
              </asp:TableRow>
              
              <asp:TableRow>
           <asp:TableCell></br></asp:TableCell>
           </asp:TableRow>
              <asp:TableRow>
           <asp:TableCell ColumnSpan="4"><asp:Label ID="lblcustom" runat="server" Font-Bold="true" ForeColor="CadetBlue" Font-Size="Medium" Visible ="False" Width="175" Text="Image Based Questions"></asp:Label></asp:TableCell>
          <asp:TableCell>
          <asp:GridView ID="GridView_custom" runat="server" 
                  OnPageIndexChanging="GridView_customPageChanging" AutoGenerateColumns="False" Width="600"
                  CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="2" AllowPaging="True" >
                  <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
              <Columns>
              <asp:TemplateField HeaderText="Qid" Visible="False">
                    <ItemTemplate>
                            <asp:Label ID="GridView_custom_qid" runat="Server" Text='<%#Eval("Qid") %>' ></asp:Label>
                    </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Select">
                    <ItemTemplate>
                    <asp:CheckBox ID="GridView_custom_checkbox" runat="Server" OnCheckedChanged="addCustomQid" />
                    </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Question">
                    <ItemTemplate>
                        <asp:Literal ID="GridView_custom_question" runat="Server" Text='<%#Eval("questionText") %>' ></asp:Literal>
                    </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                          <!-- <img id="customimage"  alt="no Image" src="getImage.aspx?qid=<%# Eval("qid") %>"  /> -->
                          
                          <asp:Image ID="customimage" AlternateText="N/A" runat="Server"   Height='150' Width='150' ImageUrl='<%#  Eval("questionImage","{0}") %>' />
                          
                    </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Answer">
                    <ItemTemplate>
                    <asp:Literal ID="GridView_custom_answer" runat="Server" Text='<%#Eval("answer") %>'> </asp:Literal>
                    </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Difficulty">
                     <ItemTemplate>
                     <asp:Label ID="GridView_custom_Difficulty" runat="server" Text='<%#Eval("difficulty") %>'/>
                     </ItemTemplate>
                     </asp:TemplateField> 
              </Columns>
                  <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                  <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                  <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                  <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                  <EditRowStyle BackColor="#999999" />
                  <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
              </asp:GridView></asp:TableCell>
              </asp:TableRow> 
               
           <asp:TableRow>
           <asp:TableCell></br></asp:TableCell>
           </asp:TableRow>            
              <asp:TableRow>
           <asp:TableCell ColumnSpan="4">
           <asp:Label ID="lblmatching" ForeColor="CadetBlue" Font-Bold="true" Font-Size="Medium" runat="server" Visible="False" Width="175" Text="Match the Following"></asp:Label></asp:TableCell>
          <asp:TableCell>
          <asp:GridView ID="GridView_matching" runat="server" AutoGenerateColumns="False" Width="600"
                  CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" 
                  PageSize="1" OnPageIndexChanging="GridView_fillPageMatching">
                  <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
              <Columns>
              
              <asp:TemplateField HeaderText="Qid" Visible="False">
                <ItemTemplate>
                    <asp:Label ID="GridView_matching_qid" runat="Server" Text='<%#Eval("qid") %>' ></asp:Label>
                </ItemTemplate>
              </asp:TemplateField>
              
              <asp:TemplateField HeaderText="Select">
                <ItemTemplate>
                    <asp:CheckBox ID="GridView_matching_checkbox" OnCheckedChanged="addMatchingQid" runat="Server" />
                </ItemTemplate>
              </asp:TemplateField>
              
              <asp:TemplateField HeaderText = "Question">
                <ItemTemplate>
                    <asp:Literal ID="GridView_matching_question" runat="Server" Text='<%#Eval("questionText") %>'></asp:Literal>
                </ItemTemplate>
              </asp:TemplateField>
              
          
              <asp:TemplateField HeaderText="Matching Choice">
              <ItemTemplate>
                <asp:Table ID ="GridView_matching_table" runat="Server">
                    <asp:TableHeaderRow>
                            <asp:TableHeaderCell> Left Choice</asp:TableHeaderCell>
                            <asp:TableHeaderCell> Right Choice</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow>
                            <asp:TableCell> <%#Eval("leftchoice1") %></asp:TableCell>
                            <asp:TableCell> <%#Eval("rightchoice1") %></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow>
                            <asp:TableCell> <%#Eval("leftchoice2") %></asp:TableCell>
                            <asp:TableCell> <%#Eval("rightchoice2") %></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                            <asp:TableCell> <%#Eval("leftchoice3") %></asp:TableCell>
                            <asp:TableCell> <%#Eval("rightchoice3") %></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                            <asp:TableCell> <%#Eval("leftchoice4") %></asp:TableCell>
                            <asp:TableCell> <%#Eval("rightchoice4") %></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                            <asp:TableCell> <%#Eval("leftchoice5") %></asp:TableCell>
                            <asp:TableCell> <%#Eval("rightchoice5") %></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                            <asp:TableCell> <%#Eval("leftchoice6") %></asp:TableCell>
                            <asp:TableCell> <%#Eval("rightchoice6") %></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
              </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Difficulty">
                     <ItemTemplate>
                     <asp:Label ID="GridView_matching_Difficulty" runat="server" Text='<%#Eval("difficulty") %>'/>
                     </ItemTemplate>
                     </asp:TemplateField> 
              </Columns>
                  <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                  <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                  <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                  <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                  <EditRowStyle BackColor="#999999" />
                  <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
              </asp:GridView></asp:TableCell>
          </asp:TableRow>
              <asp:TableRow>
                    <asp:TableCell ColumnSpan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:TableCell>
                    <asp:TableCell>
                        <asp:Button  ID="AddQuestionsToTest" runat="server" Text="AddQuestionsToTest" onclick="AddQuestionsToTest_Click" Visible="false" ToolTip="Add Questions To Test"/> 
                    </asp:TableCell>
                    <asp:TableCell><asp:Label ID="lblMessage_AddQuestionToTest" runat="server" Visible="false"></asp:Label></asp:TableCell>
           </asp:TableRow>
              <asp:TableRow>         
            <asp:TableCell ColumnSpan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:TableCell>
                    <asp:TableCell  ColumnSpan="3" >
                        <asp:Button ID="btnGenTest" runat="server" Text="Generate Test" onclick="GenTest_Click" visible="false" ToolTip="Generate Test"/>
                   &nbsp&nbsp&nbsp
                        <asp:HyperLink ID="showFellow" NavigateUrl="~/Display.aspx?show=1"  Visible="false" runat="server"  ToolTip="Click To See Fellow Version" Target ="_blank" Text="Fellow Version"></asp:HyperLink>
                   &nbsp&nbsp&nbsp
                  <asp:HyperLink ID="showStudent" NavigateUrl="~/Display.aspx?show=0" runat = "server"  Visible="false"  Target="_blank" Text="Student Version" ToolTip="Click To See Student Version"></asp:HyperLink>    
                </asp:TableCell>
          </asp:TableRow>
          </asp:Table>
              
              </ContentTemplate>
          <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Button1" EventName="click" />            
             <asp:AsyncPostBackTrigger ControlID="AddQuestionsToTest" EventName="click" />
          </Triggers>
          </asp:UpdatePanel>
         
     </div>
    </div>

     </form>
  </body>
</html>

