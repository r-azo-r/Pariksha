  <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrator.aspx.cs" Inherits="Administrator" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="asp" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
        <h1><font color="black">TEACH</font><span style="color:Blue">FOR</span><font color="black">INDIA</font></h1>

        <h4>PARIKSHA</h4>
      </div>
       <% if (Session["uType"] != null) if (Session["uType"].ToString().Equals("fellow")) { AddQuestionLink.Visible = false; AdministratorLink.Visible = false; AddQuestion.Visible = false; Administrators.Visible = false; } %>
      <div id="links">
        <ul>
          <li id="homesLink" runat="server"><a id="Homes" runat="server" href="Home.aspx">Home</a></li>
         
          <li id="AddQuestionLink" runat="server"><a id ="AddQuestion" runat = "server" href="AddQuestion.aspx">AddQuestions</a></li>
          <li id="GenerateTestLink" runat="server"><a id="GenerateTest" runat="server" href="GenerateTest.aspx">GenerateTest</a></li>
          <li id="AdministratorLink" runat="server"><a id = "Administrators" runat="server" href="Administrator.aspx">Administration</a></li>
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
  
        <Welcome <%Response.Write(Session["uname"]); %> !</h2>
  
        <br />
          <asp:Button ID="UserManagement" runat="server" Text="Manage Users" 
              onclick="UserManagement_Click"  ToolTip="Manage Users" Width="133px" 
                  Font-Size="Medium" />&nbsp;
          <asp:Button ID="ManageSubjects" runat="server" Text="Manage Subjects" 
              Width="148px" onclick="ManageSubjects_Click"  ToolTip="Manage Subjects" 
                   Font-Size="Medium" />&nbsp;
          <asp:Button ID="GenerateLog" runat="server" Text="Generate Log" 
             Width="128px"  onclick="GenerateLog_Click" ToolTip="Generate Log" 
                   Font-Size="Medium" />&nbsp;
          <asp:Button ID="ManageQuestions" runat="Server" Text="Search & Edit" 
              Width="117px" onclick="ManageQuestions_Click" ToolTip="Search" 
                   Font-Size="Medium"/>&nbsp; 
                  <asp:Button ID="batchlink" runat ="server" Text="Batch Upload"  Width="117px" PostBackUrl="~/BatchUpload.aspx"  Font-Size="Medium"></asp:Button>
         <br /><br /> 
         
         <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
          </asp:ToolkitScriptManager>
              <asp:SqlDataSource ID="SqlDataSource_userName" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>" 
                  SelectCommand="SELECT [userName] FROM [userDetail] where deleted=0"></asp:SqlDataSource>
          <br />
          <asp:UpdatePanel ID="ManageUsers" runat ="server">
          <ContentTemplate>
         <div id="AddUser" visible = "False" runat="server">
         <fieldset>
                    <legend>Add User</legend>
                    <table>
                    <tr>
                        <td> <span style="color:#5f9ea0">UserName</span></td>
                        <td><asp:TextBox ID="txtName_AddUser" runat="server"></asp:TextBox> </td>
                    </tr>
                    <tr>
                        <td> <span style="color:#5f9ea0">Password</span></td>
                        <td><asp:TextBox ID="txtPassword_AddUser" runat="server" TextMode="Password"></asp:TextBox> </td>
                    </tr>
                    <tr>
                        <td ><span style="color:#5f9ea0">Select Profile</span></td>
                    
                    
                        <td>
                            <asp:DropDownList ID = "dropdown_AddUser" runat="server" >
                               <asp:ListItem Text="Fellow" Value="fellow"></asp:ListItem>
                               <asp:ListItem Text="Program Manager" Value="manager"></asp:ListItem>
                               <asp:ListItem Text="Administrator" Value="admin"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                     <tr>
                    <td>  </td>
                    <td><asp:Button ID="btn_AddUser" runat="server" Text="Submit" Width="60px" 
                            onclick="btn_AddUser_Click"/></td>
                    </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblMessage_AddUser" runat="server" Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>      
                     <br />                
         </fieldset> 
         </div>
         <div id="ChangePassword" visible = "False" runat = "server">
         <fieldset>
                    <legend>Change Password</legend>
                    <table>
                    <tr>
                    <td> <span style="color:#5f9ea0">User Name</span> </td>
                    <td><br />
                        <asp:ListSearchExtender ID="ListSearchExtender1" runat="server" TargetControlID="DropDownList_username_changepassword">
                        </asp:ListSearchExtender>
                        <asp:DropDownList ID="DropDownList_username_changepassword" runat="server" 
                            DataSourceID="SqlDataSource_userName" DataTextField="userName" 
                            DataValueField="userName" Width="100">
                        </asp:DropDownList>
                        <asp:TextBox ID="txtName_changePassword" runat="server" Visible="False"></asp:TextBox> </td>
                    </tr>
                    <tr>
                    <td> <span style="color:#5f9ea0">Password</span> </td>
                    <td><br /><asp:TextBox ID="txtPassword_changePassword" runat="server" TextMode="Password"></asp:TextBox> </td>
                    </tr>
                    <tr>
                    <td><span style="color:#5f9ea0">Re-Type Password</span></td>
                    <td>
                    <asp:TextBox ID="txtConfirmPassword_changePassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                      </tr>
                     </td>
                     <tr>
                    <td>  </td>
                    <td><asp:Button ID="btnSubmit_changePassword" runat="server" Text="Submit" 
                            onclick="btnSubmit_changePassword_Click"  style="margin-right: 2px" /></td>
                    </tr>
                    </table>
                    <table>
                    <tr>
                        <td>
                            <asp:Label ID = "lblMessage_changePassword" runat="server" Text="" ></asp:Label>
                        </td>
                    </tr>
                    </table>      
                     <br />                
         </fieldset> 
         </div>         
         <div id="DeleteUser" visible = "False" runat="server">
         <fieldset>
                    <legend>Delete User</legend>
                    <table>
                        <tr>
                            <td><span style="color:#5f9ea0">User Name</span></td>
                            <td><br />
                                <asp:DropDownList ID="DropDownList_UserName" runat="server" 
                                    DataSourceID="SqlDataSource_userName" DataTextField="userName" 
                                    DataValueField="userName" 
                                    onselectedindexchanged="DropDownList_UserName_SelectedIndexChanged" Width="100">
                                </asp:DropDownList>
                                <br />
                                <asp:ListSearchExtender ID="extender1" runat="server" TargetControlID="DropDownList_UserName"></asp:ListSearchExtender>
                                <asp:TextBox ID="txtname_deleteUser" runat="server" Visible="False"></asp:TextBox> </td>
                        </tr>
                        <tr>
                            <td>  </td>
                            <td><asp:Button ID="btn_deleteUser" runat="server" Text="Delete" Width="60px" 
                                    onclick="btn_deleteUser_Click"/></td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblMessage_deleteUser" runat="server" Visible="false"></asp:Label>
                            </td>
                        </tr>
                    </table>      
                     <br />                
         </fieldset> 
         </div>  
          </ContentTemplate>
          <Triggers>                    
          <asp:AsyncPostBackTrigger ControlID="btnSubmit_changePassword" EventName="click" />
          <asp:AsyncPostBackTrigger ControlID="btn_AddUser" EventName="click" />
          <asp:AsyncPostBackTrigger ControlID="btn_deleteUser" EventName="click" />
          </Triggers>
          </asp:UpdatePanel>          
          <asp:UpdatePanel ID="GenerateLogReport" runat="server" Visible = "false">
            <ContentTemplate>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Trebuchet MS"
                    Font-Size="9pt" Height="700px" Width="850px">
                    <LocalReport ReportPath="Report.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource3" 
                                Name="DataSet1_DataTable1" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="DataSet1TableAdapters.DataTable1TableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                    SelectMethod="GetData" TypeName="DataSet1TableAdapters.userDetailTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                    SelectMethod="GetData" TypeName="DataSet1TableAdapters.testTableAdapter">
                </asp:ObjectDataSource>
            </ContentTemplate>
            </asp:UpdatePanel>         
          <asp:UpdatePanel ID="ManageSubjectsPanel" runat="server" Visible = "false">
         <ContentTemplate>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>" 
                 SelectCommand="SELECT DISTINCT [subjectName] FROM [subject]"></asp:SqlDataSource>
                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>" 
                 
                 SelectCommand="SELECT DISTINCT [subjectCategory] FROM [subject] where subjectName=@subjectName">
                     <SelectParameters>
                         <asp:ControlParameter ControlID="dropdown_subject" Name="subjectName" 
                             PropertyName="SelectedValue" />
                     </SelectParameters>
             </asp:SqlDataSource>
                 <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>" 
                 SelectCommand="SELECT [subjectLevel] FROM [subject] where subjectName=@subjectName and  subjectCategory=@subjectCategory">
                 
                     <SelectParameters>
                         <asp:ControlParameter ControlID="dropdown_subject" Name="subjectName" 
                             PropertyName="SelectedValue" />
                         <asp:ControlParameter ControlID="dropdown_ExistingCategory" 
                             Name="subjectCategory" PropertyName="SelectedValue" />
                     </SelectParameters>
                 
                 </asp:SqlDataSource>
            <fieldset >
            
            <legend> Add New Subject Category</legend>
            <table>
            <tr>
            <td>
            <asp:Label ID="lblGrade" runat="server" Text="Choose Grade" Font-Bold="true"></asp:Label>
            </td>
            <td>                <asp:DropDownList ID="dropdown_Standard" runat="server" >
                                        <asp:ListItem Text="K.G." Value="0"></asp:ListItem>
                                        <asp:ListItem Text="First" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Second" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Third" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Fourth" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Fifth" Value="5"></asp:ListItem>
                                </asp:DropDownList>
              </td>
            </tr>
               <tr>
                  <td colspan="2">
                    <asp:Label ID ="lblWarning" Visible="false" runat="server" Text="Choose From the list or add new"></asp:Label>
                   </td>
               </tr>
               <tr>
                <td>
                    <b><asp:Label ID="lblSubject" runat="server" Text="Choose from Existing Subject"></asp:Label> </b>
                </td>
               
                    <td>
                        <asp:DropDownList ID="dropdown_subject" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="subjectName" 
                        DataValueField="subjectName" AutoPostBack="True">
                </asp:DropDownList>
                   </td>
                    </tr>
                
               <tr>
                        <td>
                            OR&nbsp;<asp:Button ID="btnNewSubject" runat="Server" onclick="btnNewSubject_Click" 
                                Text="New subject" /><asp:Label ID="lblAddNewSubject" runat="server" Text="Add New Subject" Visible="false" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtNewSubject" runat="server" ForeColor="#CCCCCC" 
                                Text="Enter New subject" visible="false"></asp:TextBox>
                        </td>
                        
                        <tr>
                            <td>
                                <b><asp:Label ID="lblNewCategory" runat="server" Text="Choose Subject Category"></asp:Label></b>
                            </td>
                            <td>
                                
                            <asp:DropDownList ID="dropdown_ExistingCategory" runat="server" 
                                    DataSourceID="SqlDataSource2" DataTextField="subjectCategory" 
                                    DataValueField="subjectCategory" AutoPostBack="True"></asp:DropDownList></td>  
                        </tr>
                        <tr>
                        <td>OR<asp:Button ID="btnnewSubjectCategory" runat="Server" onclick="btnnewSubjectCategory_Click" 
                                Text="New Category" />
                                <asp:Label ID="lbladdnewCategory" runat="Server" Text="Add New Category" Visible="false"></asp:Label></td>
                        <td><asp:TextBox ID="txtNewCategory" runat="server"></asp:TextBox></td>
                        </tr>
                    </tr>
              
               <tr>
               <td><b><asp:Label ID="lblSubjectlevel1" runat="server" Text="Enter Subject Standard" ></asp:Label></b></td>
               <td><asp:DropDownList ID="DropDownList_subjectLevel" runat="server"  
                        Visible ="False" DataSourceID="SqlDataSource3" DataTextField="subjectLevel" 
                       DataValueField="subjectLevel"></asp:DropDownList> 
               
               <asp:TextBox ID="txtSubjectLevel" runat="server"></asp:TextBox>
               </td>
               </tr>
               <tr>
               <td><b><asp:Label ID="lblDescription" runat="server" Text="Standard Description"></asp:Label></b></td>
               <td><asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" ></asp:TextBox></td>
               </tr>
               <tr>
               <td></td>
               <td>
                <asp:Button ID="btnAddSubject" runat="server" onclick="btnAddSubject_Click" 
                                    Text="Add Subject Category" />
               </td>
               <td><asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label></td>
               </tr>
                     
              </table>
            </fieldset>
             
            
             
              <br />
              <br />
                                  
         </ContentTemplate>
         </asp:UpdatePanel>          
          <asp:SqlDataSource ID="SqlDataSource_subjectName" runat="server" 
              ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>" 
              SelectCommand="SELECT DISTINCT [subjectName] FROM [subject]"></asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource_subjectCategory" runat="server" 
              ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>" 
              SelectCommand="SELECT DISTINCT [subjectCategory] FROM [subject] WHERE ([subjectName] = @subjectName)">
              <SelectParameters>
                  <asp:ControlParameter ControlID="DropDownList_subject" Name="subjectName" 
                      PropertyName="SelectedValue" Type="String" />
              </SelectParameters>
          </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource_brief" runat="server" OnUpdating="updateBrief"
            ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>" 
            SelectCommand="SELECT questionBrief.qid, questionBrief.questionText, questionBrief.answer FROM questionBrief WHERE (questionBrief.qid IN (SELECT qid FROM questionDescriptor AS questionDescriptor_1 WHERE (standard = @standard) AND (sid in (SELECT sid FROM subject WHERE (subjectName = @subjectName) AND (subjectCategory = @subjectCategory)))))" 
             UpdateCommand="select * from questionBrief" DeleteCommand="deleteQuestion" 
                  DeleteCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList_standard" Name="standard" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList_subject" Name="subjectName" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList_subjectCategory" 
                    Name="subjectCategory" PropertyName="SelectedValue" />
            </SelectParameters>
            
            
              <DeleteParameters>
                  <asp:Parameter Name="qid" Type="Int32" />
                  <asp:Parameter Name="qtype" Type="String" DefaultValue="brief"/>
              </DeleteParameters>
            
        </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource_fill" runat="server" OnUpdating="updateFill"
              ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>" 
              UpdateCommand="select * from questionFill"
              SelectCommand="select * from questionFill where qid in 
                 (select qid from questionDescriptor where 
                     ( standard=@standard and sid in (select sid from subject where subjectName=@subjectName and subjectCategory=@subjectCategory)
                      )
                 )" DeleteCommand="deleteQuestion" DeleteCommandType="StoredProcedure">
                 
              <SelectParameters>
                  <asp:ControlParameter ControlID="DropDownList_standard" Name="standard" 
                      PropertyName="SelectedValue" />
                  <asp:ControlParameter ControlID="DropDownList_subject" Name="subjectName" 
                      PropertyName="SelectedValue" />
                  <asp:ControlParameter ControlID="DropDownList_subjectCategory" 
                      Name="subjectCategory" PropertyName="SelectedValue" />
              </SelectParameters>
              <DeleteParameters>
                  <asp:Parameter Name="qid" Type="Int32" />
                  <asp:Parameter Name="qtype" Type="String"  DefaultValue="fill"/>
              </DeleteParameters>
          </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource_choice" runat="server" OnUpdating="updateChoice"
            ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>" 
                  UpdateCommand="select * from questionChoice" SelectCommand="select * from questionChoice where qid in 
(
select qid from questionDescriptor where standard=@standard and sid in (select sid from subject where subjectName = @subjectName and subjectCategory=@subjectCategory)
)" DeleteCommand="deleteQuestion" DeleteCommandType="StoredProcedure">  

              <SelectParameters>
                  <asp:ControlParameter ControlID="DropDownList_standard" Name="standard" 
                      PropertyName="SelectedValue" />
                  <asp:ControlParameter ControlID="DropDownList_subject" Name="subjectName" 
                      PropertyName="SelectedValue" />
                  <asp:ControlParameter ControlID="DropDownList_subjectCategory" 
                      Name="subjectCategory" PropertyName="SelectedValue" />
              </SelectParameters>
              <DeleteParameters>
                  <asp:Parameter Name="qid" Type="Int32" />
                  <asp:Parameter Name="qtype" Type="String" DefaultValue="choice"/>
              </DeleteParameters>
        </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource_match" runat="server" OnUpdating="updateMatch"
            ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>" UpdateCommand="select * from questionMatch"
            
                  
                  SelectCommand="select * from questionMatch where qid in 
(select qid from questionDescriptor where standard = @standard and sid in 
(select sid from subject where subjectName=@subjectName and subjectCategory=@subjectCategory))" 
                  DeleteCommand="deleteQuestion" DeleteCommandType="StoredProcedure">
                  
              <SelectParameters>
                  <asp:ControlParameter ControlID="DropDownList_standard" Name="standard" 
                      PropertyName="SelectedValue" />
                  <asp:ControlParameter ControlID="DropDownList_subject" Name="subjectName" 
                      PropertyName="SelectedValue" />
                  <asp:ControlParameter ControlID="DropDownList_subjectCategory" 
                      Name="subjectCategory" PropertyName="SelectedValue" />
              </SelectParameters>
              <DeleteParameters>
                  <asp:Parameter Name="qid" Type="Int32" />
                  <asp:Parameter Name="qtype" Type="String" DefaultValue="match"/>
              </DeleteParameters>
        </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource_custom" runat="server" OnUpdating="updateBrief"
            ConnectionString="<%$ ConnectionStrings:testgenConnectionString %>" 
            SelectCommand="SELECT questionCustom.qid, questionCustom.questionText, questionCustom.answer ,questionCustom.questionImage FROM questionCustom WHERE (questionCustom.qid IN (SELECT qid FROM questionDescriptor AS questionDescriptor_1 WHERE (standard = @standard) AND (sid in (SELECT sid FROM subject WHERE (subjectName = @subjectName) AND (subjectCategory = @subjectCategory)))))" 
             UpdateCommand="select * from questionCustom" DeleteCommand="deleteQuestion" 
                  DeleteCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList_standard" Name="standard" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList_subject" Name="subjectName" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList_subjectCategory" 
                    Name="subjectCategory" PropertyName="SelectedValue" />
            </SelectParameters>
            
            
              <DeleteParameters>
                  <asp:Parameter Name="qid" Type="Int32" />
                  <asp:Parameter Name="qtype" Type="String" DefaultValue="Custom"/>
              </DeleteParameters>
            
        </asp:SqlDataSource>     
          <asp:UpdatePanel ID="ManageQuestionsUpdatePanel" runat="server" Visible ="false" >
                <ContentTemplate>
                   <fieldset>
                   <legend title="Search And Edit Questions"></legend>
                   <table width="749px">
                   <tr> 
                   <td><b>Grade</b></td>
                    <td><b>Subject</b></td>
                    <td><b>SubjectCategory</b></td>
                    <td><b>QuestionType</b></td>
                   </tr>
                   <tr>
                   <td>
                   <asp:DropDownList ID="DropDownList_standard" runat="server" Width="100">
                     <asp:ListItem Text="K.G." Value="k.g."></asp:ListItem>
                                <asp:ListItem Text="First" Value="first"></asp:ListItem>
                                <asp:ListItem Text="Second" Value="second"></asp:ListItem>
                                <asp:ListItem Text="Third" Value="third"></asp:ListItem>
                                <asp:ListItem Text="Fourth" Value="fourth"></asp:ListItem>
                                <asp:ListItem Text="Fifth" Value="fifth"></asp:ListItem>
                    </asp:DropDownList>
                    </td>
                   <td>
                    <asp:DropDownList ID="DropDownList_subject" runat="server" 
                        DataSourceID="SqlDataSource_subjectName" DataTextField="subjectName" 
                        DataValueField="subjectName" AutoPostBack="True" Width="125">
                    </asp:DropDownList>
                    </td>
                    <td>
                    <asp:DropDownList ID="DropDownList_subjectCategory" runat="server" 
                        DataSourceID="SqlDataSource_subjectCategory" DataTextField="subjectCategory" 
                        DataValueField="subjectCategory" Width="125">
                    </asp:DropDownList>
                    </td>
                    <td>
                    <asp:DropDownList ID="DropDownList_qtype" runat="server">
                    <asp:ListItem Text="Brief Answer" Value="brief" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Multiple Choice" Value="choice"></asp:ListItem>
                                <asp:ListItem Text="Fill In The Blank" Value="fill"></asp:ListItem>
                                <asp:ListItem Text="Match The Following" Value="match"></asp:ListItem>
                                <asp:ListItem Text="Image Based Question" Value="custom"></asp:ListItem>
                    </asp:DropDownList>
                   </td>
                   <td>
                    <asp:Button ID="btnSearchQuestion" runat="server" Text="SearchQuestion" onclick="btnSearchQuestion_Click" ToolTip="Search and Edit Questions Based on Criteria"/>
                   </td>
                   </tr>
                   </table>
                    <br />
                    <br />
                    <asp:GridView ID="GridView_brief" runat="server" Visible = "False" 
                        AllowPaging="True" AllowSorting="True"  AutoGenerateColumns="False" 
                        CellPadding="4" DataSourceID="SqlDataSource_brief" ForeColor="#333333" 
                        GridLines="None" DataKeyNames="qid" Width="700px" 
                           >
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:CommandField ShowEditButton="True"  ShowDeleteButton="true"/>
                                                                              
                            <asp:TemplateField HeaderText="qid" SortExpression="qid" Visible="False">
                                <EditItemTemplate>
                                    <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("qid") %>'></asp:Literal>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("qid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Question" SortExpression="questionText">
                                <EditItemTemplate>
                                    <asp:Editor ID="Editor1" runat="server"  Width="350" Content='<%# Bind("questionText") %>'/>
                                    <!-- <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("questionText") %>'></asp:TextBox> -->
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="Literal2" runat="server" Text='<%# Eval("questionText") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Answer" SortExpression="answer">
                                <EditItemTemplate>
                                <asp:Editor ID="Editor2" runat="server" Content='<%# Bind("answer") %>' Width="350" />
                                    <!-- <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("answer") %>'></asp:TextBox>  -->
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("answer") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                        </Columns>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                    <asp:GridView ID="GridView_fill" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="qid" 
                        DataSourceID="SqlDataSource_fill" Visible="False" Width="700px" 
                        CellPadding="4" ForeColor="#333333" GridLines="None">
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"/>
                            <asp:TemplateField HeaderText="qid" SortExpression="qid" Visible="False">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("qid") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("qid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Question" SortExpression="questionText">
                                <EditItemTemplate>
                                  <asp:Editor ID="Editor3" runat="server" Width="350" Content='<%# Bind("questionText") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="Label2" runat="server" Text='<%# Bind("questionText") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Answer" SortExpression="answer">
                                <EditItemTemplate>
                                   <asp:Editor ID="Editor4" runat="server" Content='<%# Bind("answer") %>' Width="350" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="Label3" runat="server" Text='<%# Bind("answer") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>                   
                    <asp:GridView ID="GridView_choice" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="qid" 
                        DataSourceID="SqlDataSource_choice" Visible="False" Width="700px" 
                        CellPadding="4" ForeColor="#333333" GridLines="None">
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"/>
                            <asp:TemplateField HeaderText="qid" SortExpression="qid" Visible="False">
                                <EditItemTemplate>
                                    <asp:Label ID="lblchoiceqid" runat="server" Text='<%# Eval("qid") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("qid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Question" SortExpression="questionText">
                                <EditItemTemplate>
                                  <asp:Editor ID="Editor5" runat="server" Width="350" Content='<%# Bind("questionText") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="Literal_choice_qtext" runat="server" Text='<%# Bind("questionText") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText = "Choices">
                            <EditItemTemplate>
                            <asp:Table ID="choiceedit" runat="server">
                                    <asp:TableRow>
                                        <asp:TableCell>ChoiceA</asp:TableCell>
                                        <asp:TableCell><asp:TextBox ID="txtchoiceA" runat="server" Text='<%#Bind("choiceA") %>'></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>ChoiceB</asp:TableCell>
                                        <asp:TableCell>  <asp:TextBox ID="txtchoiceB" runat="server" Text='<%#Bind("choiceB") %>'></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>ChoiceC</asp:TableCell>
                                        <asp:TableCell><asp:TextBox ID="txtchoiceC" runat="server" Text='<%#Bind("choiceC") %>'></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>ChoiceD</asp:TableCell>
                                        <asp:TableCell><asp:TextBox ID="txtchoiceD" runat="server" Text='<%#Bind("choiceD") %>'></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>
                              </asp:Table>
                            </EditItemTemplate>
                           <ItemTemplate>
                             <asp:Table ID="choice" runat="server">
                                    <asp:TableRow>
                                        <asp:TableCell>ChoiceA</asp:TableCell>
                                        <asp:TableCell><asp:Literal ID="ltrChoiceA" runat="server" Text='<%# Bind("choiceA") %>'></asp:Literal></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>ChoiceB</asp:TableCell>
                                        <asp:TableCell>   <asp:Literal ID="ltrChoiceB" runat="server" Text='<%# Bind("choiceB") %>'></asp:Literal></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>ChoiceC</asp:TableCell>
                                        <asp:TableCell> <asp:Literal ID="ltrChoiceC" runat="server" Text='<%# Bind("choiceC") %>'></asp:Literal></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>ChoiceD</asp:TableCell>
                                        <asp:TableCell> <asp:Literal ID="ltrChoiceD" runat="server" Text='<%# Bind("choiceD") %>'></asp:Literal></asp:TableCell>
                                    </asp:TableRow>
                              </asp:Table>
                           </ItemTemplate> 
                            </asp:TemplateField>                                                     
                           <asp:TemplateField HeaderText="Answer" SortExpression="answer">
                                <EditItemTemplate>
                                   <asp:TextBox ID="txtchoiceanswer" runat="server" Text='<%#Bind("answer") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="ltranswer" runat="server" Text='<%# Bind("answer") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                    <asp:GridView ID="GridView_match" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="qid" 
                        DataSourceID="SqlDataSource_match" Visible="False" Width="700px" 
                        CellPadding="4" ForeColor="#333333" GridLines="None">
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"/>
                            
                            <asp:TemplateField HeaderText="qid" SortExpression="qid" Visible="False">
                                <EditItemTemplate>
                                    <asp:Label ID="lblmatchqid" runat="server" Text='<%# Eval("qid") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("qid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Question" SortExpression="questionText">
                                <EditItemTemplate>
                                  <asp:Editor ID="Editor6" runat="server" Width="350" Content='<%# Bind("questionText") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Literal ID="ltrqtext" runat="server" Text='<%# Bind("questionText") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="LeftChoice" >
                                <EditItemTemplate>
                                  <asp:Table ID="leftchoiceedit" runat="server">
                                <asp:TableRow>
                                <asp:TableCell> <asp:TextBox ID="txtlchoice1" runat="server" Text='<%#Bind("leftChoice1") %>'></asp:TextBox></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell> <asp:TextBox ID="txtlchoice2" runat="server" Text='<%#Bind("leftChoice2") %>'></asp:TextBox></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell> <asp:TextBox ID="txtlchoice3" runat="server" Text='<%#Bind("leftChoice3") %>'></asp:TextBox></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell> <asp:TextBox ID="txtlchoice4" runat="server" Text='<%#Bind("leftChoice4") %>'></asp:TextBox></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell> <asp:TextBox ID="txtlchoice5" runat="server" Text='<%#Bind("leftChoice5") %>'></asp:TextBox></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell> <asp:TextBox ID="txtlchoice6" runat="server" Text='<%#Bind("leftChoice6") %>'></asp:TextBox></asp:TableCell>
                                </asp:TableRow>
                                </asp:Table>
                                </EditItemTemplate>
                                <ItemTemplate>
                                <asp:Table ID="leftchoice" runat="server">
                                <asp:TableRow>
                                <asp:TableCell> <asp:Label ID="lbllchoice1" runat="server" Text='<%#Bind("leftChoice1") %>'></asp:Label></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell> <asp:Label ID="lbllchoice2" runat="server" Text='<%#Bind("leftChoice2") %>'></asp:Label></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell> <asp:Label ID="lbllchoice3" runat="server" Text='<%#Bind("leftChoice3") %>'></asp:Label></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell> <asp:Label ID="lbllchoice4" runat="server" Text='<%#Bind("leftChoice4") %>'></asp:Label></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell> <asp:Label ID="lbllchoice5" runat="server" Text='<%#Bind("leftChoice5") %>'></asp:Label></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell> <asp:Label ID="lbllchoice6" runat="server" Text='<%#Bind("leftChoice6") %>'></asp:Label></asp:TableCell>
                                </asp:TableRow>
                                </asp:Table>
                               
                                </ItemTemplate>
                            </asp:TemplateField>                         
                            
                              <asp:TemplateField HeaderText="RightChoice" >
                                <EditItemTemplate>
                                  <asp:Table ID="RightchoiceEdit" runat="server">
                                <asp:TableRow>
                                <asp:TableCell> <asp:TextBox ID="txtrchoice1" runat="server" Text='<%#Bind("rightChoice1") %>'></asp:TextBox></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell> <asp:TextBox ID="txtrchoice2" runat="server" Text='<%#Bind("rightChoice2") %>'></asp:TextBox></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell> <asp:TextBox ID="txtrchoice3" runat="server" Text='<%#Bind("rightChoice3") %>'></asp:TextBox></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell> <asp:TextBox ID="txtrchoice4" runat="server" Text='<%#Bind("rightChoice4") %>'></asp:TextBox></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell> <asp:TextBox ID="txtrchoice5" runat="server" Text='<%#Bind("rightChoice5") %>'></asp:TextBox></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell> <asp:TextBox ID="txtrchoice6" runat="server" Text='<%#Bind("rightChoice6") %>'></asp:TextBox></asp:TableCell>
                                </asp:TableRow>
                                </asp:Table>
                                </EditItemTemplate>
                                <ItemTemplate>
                                <asp:Table ID="rightchoice" runat="server">
                                <asp:TableRow>
                                <asp:TableCell> <asp:Label ID="lblrchoice1" runat="server" Text='<%#Bind("rightChoice1") %>'></asp:Label></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell> <asp:Label ID="lblrchoice2" runat="server" Text='<%#Bind("rightChoice2") %>'></asp:Label></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell> <asp:Label ID="lblrchoice3" runat="server" Text='<%#Bind("rightChoice3") %>'></asp:Label></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell> <asp:Label ID="lblrchoice4" runat="server" Text='<%#Bind("rightChoice4") %>'></asp:Label></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell> <asp:Label ID="lblrchoice5" runat="server" Text='<%#Bind("rightChoice5") %>'></asp:Label></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                <asp:TableCell> <asp:Label ID="lblrchoice6" runat="server" Text='<%#Bind("rightChoice6") %>'></asp:Label></asp:TableCell>
                                </asp:TableRow>
                                </asp:Table>
                               
                                </ItemTemplate>
                            </asp:TemplateField>        
                      </Columns>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                    <asp:GridView ID="GridView_custom" runat="server" Visible = "False" 
                        AllowPaging="True" AllowSorting="True"  AutoGenerateColumns="False" 
                        CellPadding="4" DataSourceID="SqlDataSource_custom" ForeColor="#333333" 
                        GridLines="None" DataKeyNames="qid" Width="700px"  PageSize="3"
                           >
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:CommandField  ShowDeleteButton="true"/>
                                                                              
                        <asp:TemplateField HeaderText="Qid" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="GridView_custom_qid" runat="Server" Text='<%#Eval("Qid") %>' ></asp:Label>
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
               
                            
                        </Columns>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                 </fieldset>   
                    <br />
                    <fieldset>
                    <legend title="Search Test"></legend>
                    <asp:Label ID="lblSearchTest" runat="server" Text="Enter Test Id" ToolTip="Enter Your TestId In The Adjacent Box"></asp:Label>
                    <asp:TextBox ID ="txtSearchTest" runat="server"  ToolTip="Enter Your TestId Here"></asp:TextBox>
                    <asp:Button ID= "btnSearchTest" runat="server" Text="SearchTest" onClick="btnSearchTest_Click" ToolTip="Enter TestId To See Fellow And Student Version"/>
                    <br />
                    <asp:Label ID="lblMessage_searchTest" runat="server" Text="" /><br />                        
                    <asp:HyperLink ID="showFellow" NavigateUrl="~/Display.aspx?show=1"  Visible="false" runat="server"  Target="_blank" Text="Fellow Version"></asp:HyperLink>
                    
                    <br />
                    <asp:HyperLink ID="showStudent" NavigateUrl="~/Display.aspx?show=0" runat = "server" Visible="false"  Target="_blank" Text="Student Version"></asp:HyperLink> 
                    
                    <br />
                    </fieldset>
                    
                </ContentTemplate>
                
                <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSearchTest" EventName="click" />
                        <asp:AsyncPostBackTrigger ControlID="DropDownList_subject" EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="DropDownList_subject" EventName="DataBinding" />
                        
                </Triggers>
                
          </asp:UpdatePanel>
    </div>
  
</div>
</div>
</form>
</body>
</html>
