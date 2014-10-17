<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddQuestion.aspx.cs" Inherits="AddQuestion" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Pariksha</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #header
        {
            height: 100px;
        }
    </style>
    
     
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data" method="post">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div id="wrapper">
  <div id="content">
    <div id="header">
      <div id="logo">
         <h1><font color="black">TEACH</font><span style="color:Blue">FOR</span><font color="black">INDIA</font></h1>
          
        <h4>PARIKSHA</h4>
      </div>
       <% if (Session["uType"] != null) if (Session["uType"].ToString().Equals("fellow"))
          { 
              AddQuestionLink.Visible = false;
              AdministratorLink.Visible = false; 
              AddQuestions.Visible = false; 
              Administrator.Visible = false; 
          }
       %>
      <div id="links">
        <ul>
          <li id="homesLink" runat="server"><a id="Homes" runat="server" href="Home.aspx">Home</a></li>
         
          <li id="AddQuestionLink" runat="server"><a id ="AddQuestions" runat = "server" href="AddQuestion.aspx">AddQuestions</a></li>
          <li id="GenerateTestLink" runat="server"><a id="GenerateTest" runat="server" href="GenerateTest.aspx">GenerateTest</a></li>
          <li id="AdministratorLink" runat="server"><a id ="Administrator" runat="server" href="Administrator.aspx">Administration</a></li>
          <li id="SignoutLink" runat="server">
              <asp:LinkButton ID="lbSignOut" runat="server" onclick="lbSignOut_Click">Sign Out</asp:LinkButton></li>         
        </ul>
      </div>
    </div>
    <div id="mainimg">
       <br />
      </div>
 
    <hr />
    <div id="contentarea">
     <h2 style="font-family:'Trebuchet MS';font-size:26px;color:#EE8907;font-weight:normal;">Welcome <%Response.Write(Session["uname"]); %> !</h2>
    <p> To add a question to the database , specify the following criteria about the question.</p>
    <p><b>Rating is optional </b>   </p>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        
        <ContentTemplate>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"   
          ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>"
          SelectCommand="SELECT distinct subjectName from subject"></asp:SqlDataSource>      
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"   
          ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>"
            SelectCommand="SELECT distinct subjectCategory from subject where subjectName=@subjectName">
               <SelectParameters>
                    <asp:ControlParameter ControlID="dropdown_Subject" Name="subjectName" PropertyName="SelectedValue" />
                </SelectParameters>          
          </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>" 
                
                
                SelectCommand="select subjectLevel from subject where
                
            subjectName = @subjectName and subjectCategory=@subjectCategory and stdid=(select stdid from standard where standardName=@standardName)">
                 <SelectParameters>
                    <asp:ControlParameter ControlID="dropdown_Subject" Name="subjectName" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="dropdown_subjectCategory" 
                        Name="subjectCategory" PropertyName="SelectedValue" />
                         <asp:ControlParameter ControlID="dropdown_Standard" Name="standardName" 
                        PropertyName="SelectedValue" />

                </SelectParameters>                
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>" 
                SelectCommand="select description from subject where subjectName = @subjectName and subjectcategory=@subjectCategory and subjectlevel = @subjectLevel">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dropdown_Subject" Name="subjectName" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="dropdown_subjectCategory" 
                        Name="subjectCategory" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="dropdown_SubjectLevel" Name="subjectLevel" 
                        PropertyName="SelectedValue" />                    
                </SelectParameters>
            </asp:SqlDataSource>
             
            <asp:Table ID="selectiontable" runat="server" Width="749px">
           <asp:TableHeaderRow HorizontalAlign="Left">
                <asp:TableHeaderCell HorizontalAlign="Left">
                    Grade
                </asp:TableHeaderCell>
                <asp:TableHeaderCell HorizontalAlign="Left">
                    SubjectName
                </asp:TableHeaderCell >
                <asp:TableHeaderCell HorizontalAlign="Left">
                    SubjectCategory
                </asp:TableHeaderCell>
                <asp:TableHeaderCell HorizontalAlign="Left">
                Standard
                </asp:TableHeaderCell>
            </asp:TableHeaderRow>
           <asp:TableRow >
               <asp:TableCell HorizontalAlign="Left">
                            <asp:DropDownList ID="dropdown_standard" runat="server" AutoPostBack="True" Width="100">
                                <asp:ListItem Text="K.G." Value="k.g."></asp:ListItem>
                                <asp:ListItem Text="First" Value="first"></asp:ListItem>
                                <asp:ListItem Text="Second" Value="second"></asp:ListItem>
                                <asp:ListItem Text="Third" Value="third"></asp:ListItem>
                                <asp:ListItem Text="Fourth" Value="fourth"></asp:ListItem>
                                <asp:ListItem Text="Fifth" Value="fifth"></asp:ListItem>
                            </asp:DropDownList>
           </asp:TableCell>
           <asp:TableCell HorizontalAlign="Left">
           <asp:DropDownList ID="dropdown_Subject" runat="server" AutoPostBack="True" Width="150" DataSourceID="SqlDataSource1" DataTextField="subjectName" DataValueField="subjectName" OnSelectedIndexChanged="dropdown_Subject_SelectedIndexChanged"> </asp:DropDownList> 
            
           </asp:TableCell>
           <asp:TableCell HorizontalAlign="Left">
                    <asp:DropDownList ID="dropdown_subjectCategory" runat="server" width="150" AutoPostBack="True"
                DataSourceID="SqlDataSource2" DataTextField="subjectCategory" 
                DataValueField = "subjectCategory" > </asp:DropDownList>
           </asp:TableCell>
          <asp:TableCell HorizontalAlign="Left">
            <asp:DropDownList ID="dropdown_subjectLevel" runat="server"  
                DataSourceID="SqlDataSource3" DataTextField="subjectLevel" 
                DataValueField = "subjectLevel"  Width="100" AutoPostBack="True"
    onselectedindexchanged="dropdown_subjectLevel_SelectedIndexChanged"> </asp:DropDownList>
            
            
           </asp:TableCell> 
           </asp:TableRow>
           <asp:TableHeaderRow HorizontalAlign="Left">
                <asp:TableHeaderCell HorizontalAlign="Left">
                    QuestionType
                </asp:TableHeaderCell>
                <asp:TableHeaderCell HorizontalAlign="Left">
                    Difficulty
                </asp:TableHeaderCell>
                
               <asp:TableHeaderCell HorizontalAlign="Left">
               Rating
               </asp:TableHeaderCell>
           </asp:TableHeaderRow>
           <asp:TableRow>
           <asp:TableCell>
             <asp:DropDownList ID="dropdown_questionType" runat="server" Width="150" AutoPostBack="true">
                                <asp:ListItem Text="Brief Answer" Value="brief" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Multiple Choice" Value="choice"></asp:ListItem>
                                <asp:ListItem Text="Image Based" Value="custom"></asp:ListItem>
                                <asp:ListItem Text="Fill In The Blank" Value="fill"></asp:ListItem>
                                <asp:ListItem Text="Match The Following" Value="match"></asp:ListItem>
                        </asp:DropDownList>
        
           </asp:TableCell>
           <asp:TableCell>
            <asp:DropDownList ID="dropdown_difficulty" runat="server">
            <asp:ListItem Text="Easy" Value="easy" ></asp:ListItem>
            <asp:ListItem Text="Medium" Value="medium"></asp:ListItem>
            <asp:ListItem Text="Hard" Value="hard"></asp:ListItem> 
            </asp:DropDownList>
           </asp:TableCell>
           <asp:TableCell>
           <asp:DropDownList ID="dropdown_rating" runat="server" Width="75">
                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
            </asp:DropDownList>
           </asp:TableCell>
        
          
           </asp:TableRow>
                      </asp:Table>
                      <asp:Table ID="tnew" runat ="server"><asp:TableRow><asp:TableCell><asp:Label ID="lblDescription" runat="server" Text=""></asp:Label></asp:TableCell></asp:TableRow> </asp:Table>
           
            <hr />
            <asp:Table ID="table_content" runat="server" Width="863px">
            <asp:TableRow>
            <asp:TableCell  ColumnSpan="2"><asp:Label ID="lblQuestion" runat="server" Font-Bold="true" ForeColor="CadetBlue" Font-Size="Medium" Text="Write Your Question Here" Visible="false"></asp:Label></asp:TableCell>
            <asp:TableCell><cc1:Editor ID="txtQuestion" runat="server" Visible="True" AutoFocus="false" Width="650" Height="325"/></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell ColumnSpan="2"><asp:Label ID="lblImageUpload" runat="server" Font-Bold="true" ForeColor="CadetBlue" Font-Size="Medium" Text="Specify Image Path" Visible="false"></asp:Label></asp:TableCell>
            <asp:TableCell> <asp:FileUpload ID="fileUpload" runat="server" Visible="false" /> </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell ColumnSpan="2"> <asp:Label ID="lbl_MultiChoice" runat = "server" Font-Bold="true" ForeColor="CadetBlue" Font-Size="Medium" Text="You can mark multiple answers correct" Visible="false" ></asp:Label></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell ColumnSpan="2" ></asp:TableCell>
            <asp:TableCell>
            <asp:Table ID ="table_MultiChoice" runat="server" Visible="false" >
          <asp:TableHeaderRow>
          <asp:TableHeaderCell>
          Text
          </asp:TableHeaderCell>
          <asp:TableHeaderCell>
          Check The Answer
          </asp:TableHeaderCell>
          </asp:TableHeaderRow>
          <asp:TableRow>
          <asp:TableCell>
          <asp:TextBox ID="choiceA" runat="server" TextMode="MultiLine"></asp:TextBox>
          </asp:TableCell>
          <asp:TableCell>
          <asp:CheckBox ID = "choiceA_checkbox" runat="server" />
          </asp:TableCell>
          </asp:TableRow>
                    <asp:TableRow>
          <asp:TableCell>
          <asp:TextBox ID="choiceB" runat="server" TextMode="MultiLine"></asp:TextBox>
          </asp:TableCell>
          <asp:TableCell>
          <asp:CheckBox ID = "choiceB_checkbox" runat="server" />
          </asp:TableCell>
          </asp:TableRow>
                    <asp:TableRow>
          <asp:TableCell>
          <asp:TextBox ID="choiceC" runat="server" TextMode="MultiLine"></asp:TextBox>
          </asp:TableCell>
          <asp:TableCell>
          <asp:CheckBox ID = "choiceC_checkbox" runat="server" />
          </asp:TableCell>
          </asp:TableRow>
                    <asp:TableRow>
          <asp:TableCell>
          <asp:TextBox ID="choiceD" runat="server" TextMode="MultiLine"></asp:TextBox>
          </asp:TableCell>
          <asp:TableCell>
          <asp:CheckBox ID = "choiceD_checkbox" runat="server" />
          </asp:TableCell>
          </asp:TableRow>
          </asp:Table>
          </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell  ColumnSpan="2">
          <asp:Label ID="lbl_Matching" runat ="server" Font-Bold="true" ForeColor="CadetBlue" Font-Size="Medium" Text="Enter the left right pairs for matching." Visible="false"></asp:Label>  
            </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell  ColumnSpan="2"></asp:TableCell>
            <asp:TableCell>
            <asp:Table ID="table_Matching" runat="server" Visible ="false" >
          <asp:TableHeaderRow>
          <asp:TableHeaderCell>
          Left Choice
          </asp:TableHeaderCell>
          <asp:TableHeaderCell>
          Right Choice
          </asp:TableHeaderCell>
          </asp:TableHeaderRow>
          <asp:TableRow>
          <asp:TableCell>
          <asp:TextBox ID ="table_matching_lchoice1" runat="server" TextMode="MultiLine"></asp:TextBox>
          </asp:TableCell>
          <asp:TableCell>
          <asp:TextBox ID ="table_matching_rchoice1" runat="server" TextMode="MultiLine"></asp:TextBox>
          </asp:TableCell>
          </asp:TableRow>
          <asp:TableRow>
          <asp:TableCell>
          <asp:TextBox ID ="table_matching_lchoice2" runat="server" TextMode="MultiLine"></asp:TextBox>
          </asp:TableCell>
          <asp:TableCell>
          <asp:TextBox ID ="table_matching_rchoice2" runat="server" TextMode="MultiLine"></asp:TextBox>
          </asp:TableCell>
          </asp:TableRow>
          <asp:TableRow>
          <asp:TableCell>
          <asp:TextBox ID ="table_matching_lchoice3" runat="server" TextMode="MultiLine"></asp:TextBox>
          </asp:TableCell>
          <asp:TableCell>
          <asp:TextBox ID ="table_matching_rchoice3" runat="server" TextMode="MultiLine"></asp:TextBox>
          </asp:TableCell>
          </asp:TableRow>
          <asp:TableRow>
          <asp:TableCell>
          <asp:TextBox ID ="table_matching_lchoice4" runat="server" TextMode="MultiLine"></asp:TextBox>
          </asp:TableCell>
          <asp:TableCell>
          <asp:TextBox ID ="table_matching_rchoice4" runat="server" TextMode="MultiLine"></asp:TextBox>
          </asp:TableCell>
          </asp:TableRow>
          <asp:TableRow>
          <asp:TableCell>
          <asp:TextBox ID ="table_matching_lchoice5" runat="server" TextMode="MultiLine"></asp:TextBox>
          </asp:TableCell>
          <asp:TableCell>
          <asp:TextBox ID ="table_matching_rchoice5" runat="server" TextMode="MultiLine"></asp:TextBox>
          </asp:TableCell>
          </asp:TableRow>
          <asp:TableRow>
          <asp:TableCell>
          <asp:TextBox ID ="table_matching_lchoice6" runat="server" TextMode="MultiLine"></asp:TextBox>
          </asp:TableCell>
          <asp:TableCell>
          <asp:TextBox ID ="table_matching_rchoice6" runat="server" TextMode="MultiLine"></asp:TextBox>
          </asp:TableCell>
          </asp:TableRow>
          </asp:Table>
            </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell  ColumnSpan="2"><asp:Label ID="lblAnswer" runat="server" Text="Write Your Answer Here" Font-Bold="true" ForeColor="CadetBlue" Font-Size="Medium" Visible="false"></asp:Label></asp:TableCell>
           <asp:TableCell><cc1:Editor ID="txtAnswer" runat="server" AutoFocus="False" Width="650" Height="325"/> </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell ColumnSpan="2"></asp:TableCell>
            <asp:TableCell><asp:Button ID="btn_addQuestion" runat="server" Text="Add Question" onclick="btn_addQuestion_Click" ToolTip="Add Question To Database" Visible="false"/></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell ColumnSpan="2"></asp:TableCell>
            <asp:TableCell><asp:Button ID="btn_reset" runat="server" Text="Reset" onclick="btn_reset_Click"  ToolTip="Reset Question Details" Visible="false"/></asp:TableCell>
            </asp:TableRow>
  
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblMessage_AddQuestion" runat="server" Visible="false"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            </asp:Table>
             </ContentTemplate>
            
        <Triggers>
                <asp:PostBackTrigger ControlID="btn_addQuestion" />
                <asp:AsyncPostBackTrigger ControlID="btn_reset" EventName="click" />
                <asp:AsyncPostBackTrigger ControlID="dropdown_questionType" EventName="selectedindexchanged" />
       
        </Triggers>
        </asp:UpdatePanel>
   
    </div>
    </div>
   
  </div>
    </form>
</body>
</html>

