using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Data.SqlClient;

public partial class Administrator : System.Web.UI.Page
{
    public static string filePath;
    protected void lbSignOut_Click(object sender, EventArgs e)
    {
        //Session.Clear();
        //Session.RemoveAll();
        //Session.Abandon();
        ////Response.Redirect("Home.aspx");
        Login.Login.signOut();
    } 
    #region SessionVariables for Qid
    private List<Int32> qidMatching
    {
        get
        {
            if (ViewState["qidMatching"] == null)
            {
                ViewState["qidMatching"] = new List<Int32>();
            }

            return (List<Int32>)ViewState["qidMatching"];
        }
    }
    private List<Int32> qidCustom
    {
        get
        {
            if (ViewState["qidCustom"] == null)
            {
                ViewState["qidCustom"] = new List<Int32>();

            }
            return (List<Int32>)ViewState["qidCustom"];
        }
    }
    private List<Int32> qidBrief
    {
        get
        {
            if (ViewState["qidBrief"] == null)
            {
                ViewState["qidBrief"] = new List<Int32>();

            }
            return (List<Int32>)ViewState["qidBrief"];
        }
    }
    private List<Int32> qidChoice
    {
        get
        {
            if (ViewState["qidChoice"] == null)
            {
                ViewState["qidChoice"] = new List<Int32>();

            }
            return (List<Int32>)ViewState["qidChoice"];
        }
    }
    private List<Int32> qidFill
    {
        get
        {
            if (ViewState["qidFill"] == null)
            {
                ViewState["qidFill"] = new List<Int32>();

            }
            return (List<Int32>)ViewState["qidFill"];
        }
    }
    private List<Int32> qid
    {
        get
        {
            if (ViewState["qid"] == null)
            {
                ViewState["qid"] = new List<Int32>();

            }
            return (List<Int32>)ViewState["qid"];
        }
    }
    
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uType"] != null)
        {
            if (Session["uType"].ToString().Equals("fellow"))
            {
                Response.Redirect("Home.aspx");
            }
            
        }
        else
        {
            Response.Redirect("Home.aspx");
        }
        //for (int i = 1; i <= 50; i++)
        //{
        //    ListItem li = new ListItem();
        //    li.Text = i.ToString();
        //    li.Value = i.ToString();
        //    DropDownList_subjectLevel.Items.Add(li);
        //}

    }
    protected void UserManagement_Click(object sender, EventArgs e)
    {
        refreshDisplay();
        GenerateLogReport.Visible = false;
        ManageSubjectsPanel.Visible = false;
        ManageQuestionsUpdatePanel.Visible = false;
        userMangementVisible(1);
        ManageUsers.Visible = true;
       // BatchUploadUpdatePanel.Visible = false;
        
    }
    protected void userMangementVisible(int i)
    {

        if (i == 1)
        {
            ChangePassword.Visible = true;
            AddUser.Visible = true;
            DeleteUser.Visible = true;
        }
        else
        {
            ChangePassword.Visible = false;
            AddUser.Visible = false;
            DeleteUser.Visible = false;
            lblMessage_AddUser.Visible = false;
            lblMessage_changePassword.Visible = false;
            lblMessage_deleteUser.Visible = false;
        }
    }
    protected void btnSubmit_changePassword_Click(object sender, EventArgs e)
    {

        lblMessage_changePassword.Visible = false;
        lblMessage_AddUser.Visible = false;
        lblMessage_deleteUser.Visible = false;
        bool flag = true;
        if (txtConfirmPassword_changePassword.Text.Length == 0)
        {
            flag = false;
        }
        if (txtPassword_changePassword.Text.Length == 0)
        {
            flag = false;
        }
        if(! (txtConfirmPassword_changePassword.Text.Equals(txtPassword_changePassword.Text)))
        {
            flag = false;
        }
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["testgenConnectionString"].ConnectionString);
        try
        {
            if (flag)
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("changePassword", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter param1 = cmd.Parameters.Add("@userName", SqlDbType.VarChar, 50);
                SqlParameter param2 = cmd.Parameters.Add("@password", SqlDbType.VarChar, 50);

                cmd.Parameters["@userName"].Value = DropDownList_username_changepassword.SelectedValue;
                cmd.Parameters["@password"].Value = txtPassword_changePassword.Text.ToString();

                param1.Direction = ParameterDirection.Input;
                param2.Direction = ParameterDirection.Input;

                int flag1 = cmd.ExecuteNonQuery();
                if (flag1 == 1)
                {
                    lblMessage_changePassword.ForeColor = System.Drawing.Color.DarkGreen;
                    lblMessage_changePassword.Text = "Change Successful";
                }
                else
                {
                    lblMessage_changePassword.ForeColor = System.Drawing.Color.Red;
                    lblMessage_changePassword.Text = "Change Not Successful.";
                }
                refreshDisplay();
                lblMessage_changePassword.Visible = true;
                txtName_changePassword.Text = "";
                conn.Close();
            }
            if (!flag)
            {
                lblMessage_changePassword.ForeColor = System.Drawing.Color.Red;
                lblMessage_changePassword.Text = "Change Not Successful .";
                lblMessage_changePassword.Visible = true;
                
            }
        }
        catch (Exception se)
        {
            conn.Close();
            lblMessage_changePassword.ForeColor = System.Drawing.Color.Red;
            lblMessage_changePassword.Text = "Change Not Successful .";
            lblMessage_changePassword.Visible = true;
            
            
        }

    }
    protected void btn_deleteUser_Click(object sender, EventArgs e)
    {
      
        lblMessage_deleteUser.Visible = false;
        lblMessage_changePassword.Visible = false;
        lblMessage_AddUser.Visible = false;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["testgenConnectionString"].ConnectionString);
        try
        {

            conn.Open();
            SqlCommand cmd = new SqlCommand("deleteUser", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter param1 = cmd.Parameters.Add("@userName", SqlDbType.VarChar, 50);
            cmd.Parameters["@userName"].Value = DropDownList_UserName.SelectedValue;
            param1.Direction = ParameterDirection.Input;
            int flag = cmd.ExecuteNonQuery();
            if (flag == 1)
            {
                lblMessage_deleteUser.Text = "Deletion Successful";
                DropDownList_UserName.SelectedIndex = 0;
            }
            else
            {
                lblMessage_deleteUser.Text = "Deletion Not Successful.";
                
            }
            refreshDisplay();
            lblMessage_deleteUser.Visible = true;
            txtname_deleteUser.Text = "";
            conn.Close();
            DropDownList_UserName.DataBind();
            DropDownList_username_changepassword.DataBind();
        }
        catch (Exception se)
        {
            conn.Close();
            lblMessage_deleteUser.Text = "Change Not Successful .";
            lblMessage_deleteUser.Visible = true;
            DropDownList_UserName.DataBind();
            DropDownList_username_changepassword.DataBind();
        }
    }
    protected void btn_AddUser_Click(object sender, EventArgs e)
    {

        lblMessage_changePassword.Visible = false;
        lblMessage_AddUser.Visible = false;
        lblMessage_deleteUser.Visible = false;
        bool check = createUser(txtName_AddUser.Text.ToString(), dropdown_AddUser.SelectedValue.ToString(), txtPassword_AddUser.Text.ToString());
       if (check)
       {
           lblMessage_AddUser.ForeColor = System.Drawing.Color.DarkGreen;
           lblMessage_AddUser.Text = "Successfully Added";
           DropDownList_UserName.DataBind();
           DropDownList_username_changepassword.DataBind();
       }
       else
       {
           lblMessage_AddUser.ForeColor = System.Drawing.Color.Red;
           lblMessage_AddUser.Text = "Unsuccessful";
           DropDownList_UserName.DataBind();
           DropDownList_username_changepassword.DataBind();
       }
       refreshDisplay();
       lblMessage_AddUser.Visible = true;
       txtName_AddUser.Text = "";
    }
    protected bool createUser(String userName, String userType, String password)
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["testgenConnectionString"].ConnectionString);
        try
        {
            bool flag = checkUser(userName);
            if (flag)
            {


                SqlCommand cmd = new SqlCommand("createUser", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                
                SqlParameter param2 = cmd.Parameters.Add("@password", SqlDbType.VarChar, 50);
                SqlParameter param3 = cmd.Parameters.Add("@utype", SqlDbType.VarChar, 50);
                SqlParameter param4 = cmd.Parameters.Add("@uname", SqlDbType.VarChar, 50);
                SqlParameter param5 = cmd.Parameters.Add("@datetime", SqlDbType.DateTime, 50);

                DateTime dt = DateTime.Now;

                
                cmd.Parameters["@uname"].Value = userName;
                cmd.Parameters["@password"].Value = password;
                cmd.Parameters["@utype"].Value = userType;
                cmd.Parameters["@datetime"].Value = dt;

                
                param2.Direction = ParameterDirection.Input;
                param3.Direction = ParameterDirection.Input;
                param4.Direction = ParameterDirection.Input;
                param5.Direction = ParameterDirection.Input;

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                return true;
            }
            else
            {

                //The User Cannot be created 

                return false;
            }
        }
        catch (Exception se)
        {
            conn.Close();
            return false;
        }
    }
    protected bool checkUser(String userName)
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["testgenConnectionString"].ConnectionString);
        try
        {

            SqlCommand cmd = new SqlCommand("checkUser", conn);
            cmd.CommandType = CommandType.StoredProcedure;


            SqlParameter param1 = cmd.Parameters.Add("@userName", SqlDbType.VarChar, 50);
            SqlParameter param2 = cmd.Parameters.Add("@uid", SqlDbType.Int, 50);
            cmd.Parameters["@userName"].Value = userName;

            param1.Direction = ParameterDirection.Input;
            param2.Direction = ParameterDirection.Output;

            conn.Open();
            cmd.ExecuteNonQuery();


            String uid = cmd.Parameters["@uid"].Value.ToString();


            if (uid.Length > 0)
                return false;

            else
                return true;
        }
        catch (Exception se)
        {
            conn.Close();
            return false;
        }

    }
    protected void GenerateLog_Click(object sender, EventArgs e)
    {
        userMangementVisible(0);
        ManageSubjectsPanel.Visible = false;
        ManageQuestionsUpdatePanel.Visible = false;
        GenerateLogReport.Visible = true;
        ReportViewer1.ShowRefreshButton = false;
        ReportViewer1.Visible = true;
        //BatchUploadUpdatePanel.Visible = false;
    }
    protected void ManageSubjects_Click(object sender, EventArgs e)
    {

        refreshDisplay();
        GenerateLogReport.Visible = false;
        ManageUsers.Visible = false;
        ManageQuestionsUpdatePanel.Visible = false;
        ManageSubjectsPanel.Visible = true;
        lblSubject.Visible = true;
        dropdown_subject.Visible = true;
        dropdown_subject.Enabled = true;
        lblAddNewSubject.Visible = false;
        lblNewCategory.Visible = true;
        btnAddSubject.Visible = true;
        btnnewSubjectCategory.Visible = true;
        txtNewCategory.Visible = false;
        dropdown_ExistingCategory.Visible = true;
        dropdown_ExistingCategory.Enabled = true;
        txtDescription.Text = "";
      //  BatchUploadUpdatePanel.Visible = false;
    }
    protected void btnAddSubject_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["testgenConnectionString"].ConnectionString);
        try
        {
            string subjectName = "";
            string subjectCategory = "";
            bool flag = true;
            if (!dropdown_subject.Enabled)
            {
                if (txtNewSubject.Text.ToString().Length > 0)
                    subjectName = txtNewSubject.Text.ToString().ToLower();
                else
                {
                    displayMessage(0);
                    flag = false;
                }

            }
            else
            {
                subjectName = dropdown_subject.SelectedValue.ToString();
            }
            if (!dropdown_ExistingCategory.Enabled)
            {
                if (txtNewCategory.Text.ToString().Length > 0)
                    subjectCategory = txtNewCategory.Text.ToString().ToLower();
                else
                {
                    displayMessage(0);
                    flag = false;

                }
            }
            else
            {
                subjectCategory = dropdown_ExistingCategory.SelectedValue.ToString();
            }

            //int subjectLevel = Int32.Parse(DropDownList_subjectLevel.SelectedValue);
            String subjectLevel = "";
            double temp = 0;
            if (txtSubjectLevel.Text.ToString().Length > 0)
            {

                subjectLevel = txtSubjectLevel.Text.ToString();
                temp = double.Parse(subjectLevel);
            }
            else
            {
                displayMessage(0);
                flag = false;

            }
            if (double.IsNaN(temp))
            {
                displayMessage(3);
                flag = false;

            }
            foreach (ListItem li in DropDownList_subjectLevel.Items)
            {
                if (subjectLevel.Equals(li.Value))
                {
                    displayMessage(2);
                    flag = false;
                    break;
                }
            }
            if (txtDescription.Text.ToString().Length <= 0)
            {
                flag = false;

            }
            if (flag)
            {

                SqlCommand cmd = new SqlCommand("addSubjectCategory", conn);
                cmd.CommandType = CommandType.StoredProcedure;


                SqlParameter param1 = cmd.Parameters.Add("@subjectName", SqlDbType.VarChar, 50);
                SqlParameter param2 = cmd.Parameters.Add("@subjectCategory", SqlDbType.VarChar, 50);
                SqlParameter param3 = cmd.Parameters.Add("@subjectLevel", SqlDbType.VarChar, 50);
                SqlParameter param4 = cmd.Parameters.Add("@description", SqlDbType.VarChar, 8000);
                SqlParameter param5 = cmd.Parameters.Add("@stdid",SqlDbType.Int,50);

                cmd.Parameters["@subjectName"].Value = subjectName;
                cmd.Parameters["@subjectCategory"].Value = subjectCategory;
                cmd.Parameters["@subjectLevel"].Value = subjectLevel;
                cmd.Parameters["@description"].Value = txtDescription.Text;
                cmd.Parameters["@stdid"].Value = dropdown_Standard.SelectedValue;

                conn.Open();
                cmd.ExecuteNonQuery();
                refreshDisplay();
                displayMessage(1);

            }
        }
        catch (Exception se)
        {
            conn.Close();
            refreshDisplay();
            displayMessage(0);

        }
        
        
    }  
    protected void btnNewSubject_Click(object sender, EventArgs e)
    {

        lblAddNewSubject.Visible = true;
        txtNewSubject.Visible = true;
        txtNewSubject.Text = "";
        txtNewSubject.ForeColor = System.Drawing.Color.Black;
        btnNewSubject.Visible = false;
        dropdown_subject.Enabled = false;
    }
    protected void btnSearchTest_Click(object sender, EventArgs e)
    {

        lblMessage_searchTest.Text = "";
        
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["testgenConnectionString"].ConnectionString);
        try
        {

            SqlCommand cmd = new SqlCommand("getTest", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter param1 = cmd.Parameters.Add("@testid", SqlDbType.Int, 50);
            cmd.Parameters["@testid"].Value = Int32.Parse(txtSearchTest.Text.ToString());

            SqlParameter param2 = cmd.Parameters.Add("@standard", SqlDbType.VarChar, 50);
            SqlParameter param3 = cmd.Parameters.Add("@subjectName", SqlDbType.VarChar, 50);
            SqlParameter param4 = cmd.Parameters.Add("@subjectCategory", SqlDbType.VarChar, 50);
            
            param2.Direction = ParameterDirection.Output;
            param3.Direction = ParameterDirection.Output;
            param4.Direction = ParameterDirection.Output;
           
            
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            SqlCommand cmd3 = new SqlCommand("getTestQuestion", conn);
            cmd3.CommandType = CommandType.StoredProcedure;
            SqlParameter param7 = cmd3.Parameters.Add("@testid", SqlDbType.Int, 50);
            cmd3.Parameters["@testid"].Value = Int32.Parse(txtSearchTest.Text.ToString());
            conn.Open();
            cmd3.ExecuteNonQuery();

            SqlDataReader reader = cmd3.ExecuteReader();
            qid.Clear();
            qidBrief.Clear();
            qidChoice.Clear();
            qidCustom.Clear();
            qidFill.Clear();
            qidMatching.Clear();

            while (reader.Read())
            {
                qid.Add(reader.GetInt32(0));
            }
            conn.Close();

            for (int i = 0; i < qid.Count; i++)
            {
                SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["testgenConnectionString"].ConnectionString);
                SqlCommand cmd1 = new SqlCommand("getQtype", conn1);
                cmd1.CommandType = CommandType.StoredProcedure;

                SqlParameter param5 = cmd1.Parameters.Add("@qid", SqlDbType.Int, 50);
                SqlParameter param6 = cmd1.Parameters.Add("@qtype", SqlDbType.VarChar, 50);
                cmd1.Parameters["@qid"].Value = qid[i];

                param5.Direction = ParameterDirection.Input;
                param6.Direction = ParameterDirection.Output;
                
                conn1.Open();
                cmd1.ExecuteNonQuery();

                
                if (param6.Value.ToString().Equals("brief"))
                            qidBrief.Add(qid[i]);

                else if (param6.Value.ToString().Equals("choice"))
                    qidChoice.Add(qid[i]);

                else  if (param6.Value.ToString().Equals("custom"))
                    qidCustom.Add(qid[i]);

                else if (param6.Value.ToString().Equals("fill"))
                    qidFill.Add(qid[i]);

                else if (param6.Value.ToString().Equals("match"))
                    qidMatching.Add(qid[i]);
            }

            clearSession();
            
            Session.Add("qidBrief", qidBrief);
            Session.Add("qidCustom", qidCustom);
            Session.Add("qidFill", qidFill);
            Session.Add("qidChoice", qidChoice);
            Session.Add("qidMatch", qidMatching);
            Session.Add("standard", param2.Value.ToString().ToUpper());
            Session.Add("subjectName", param3.Value.ToString().ToUpper());
            Session.Add("subjectCategory", param4.Value.ToString().ToUpper());
            Session.Add("testid", txtSearchTest.Text);
            if (qid.Count > 0)
            {
                showFellow.Visible = true;
                showStudent.Visible = true;
            }
            else
            {
                lblMessage_searchTest.ForeColor = System.Drawing.Color.Red;
                lblMessage_searchTest.Text = "Test Not Found";
            }
        }
        catch (Exception se)
        {
            conn.Close();

            lblMessage_searchTest.ForeColor = System.Drawing.Color.Red;
            lblMessage_searchTest.Text = "Test Not Found";
        }
    }
    protected void displayMessage(int flag)
    {
        if (flag == 1)
        {
            lblMessage.Text = "Successfully Added";
            lblMessage.ForeColor = System.Drawing.Color.DarkGreen;
            lblMessage.Visible = true;
            
            DropDownList_subjectLevel.DataBind();
            dropdown_subject.DataBind();
            dropdown_ExistingCategory.DataBind();
        }
        else if (flag == 2)
        {
            lblMessage.Text = "Standard Already Present";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Visible = true;
        }
        else if (flag == 3)
        {
            lblMessage.Text = "Standard Should Be A Number Like 1.1 , 2.2 etc...";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Visible = true;
        }
        else
        {
            lblMessage.Text = "NOT Successful";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Visible = true;

        }
    }
    protected void clearSession()
    {
        Session.Remove("qidBrief");
        Session.Remove("qidFill");
        Session.Remove("qidChoice");
        Session.Remove("qidCustom");
        Session.Remove("qidMatch");
        Session.Remove("standard");
        Session.Remove("subjectName");
        Session.Remove("subjectCategory");
        Session.Remove("testid");

    }
    protected void ManageQuestions_Click(object sender, EventArgs e)
    {
        GenerateLogReport.Visible = false;
        ManageUsers.Visible = false;  
        ManageSubjectsPanel.Visible = false;
        ManageQuestionsUpdatePanel.Visible = true;
        showFellow.Visible = false;
        showStudent.Visible = false;
        txtSearchTest.Text = "";
     //   BatchUploadUpdatePanel.Visible = false;
       
    }
    protected void btnSearchQuestion_Click(object sender, EventArgs e)
    {
        if (DropDownList_qtype.SelectedValue.ToString().Equals("brief"))
        {
            GridView_brief.Visible = true;
            GridView_fill.Visible = false;
            GridView_choice.Visible = false;
            GridView_match.Visible = false;
            GridView_custom.Visible = false;
        }
        if (DropDownList_qtype.SelectedValue.ToString().Equals("choice"))
        {
            GridView_brief.Visible = false;
            GridView_fill.Visible = false;
            GridView_choice.Visible = true;
            GridView_match.Visible = false;
            GridView_custom.Visible = false;
        }
        if (DropDownList_qtype.SelectedValue.ToString().Equals("custom"))
        {
            GridView_brief.Visible = false;
            GridView_fill.Visible = false;
            GridView_choice.Visible = false;
            GridView_match.Visible = false;
            GridView_custom.Visible = true;
        }
        if (DropDownList_qtype.SelectedValue.ToString().Equals("fill"))
        {
            GridView_brief.Visible = false;
            GridView_fill.Visible = true;
            GridView_choice.Visible = false;
            GridView_match.Visible = false;
            GridView_custom.Visible = false;
        }
        if (DropDownList_qtype.SelectedValue.ToString().Equals("match"))
        {
            GridView_brief.Visible = false;
            GridView_fill.Visible = false;
            GridView_choice.Visible = false;
            GridView_match.Visible = true;
            GridView_custom.Visible = false;
        }

    }
    protected void refreshDisplay()
    {
       //for manage subjects
        dropdown_subject.Enabled = true;
        dropdown_ExistingCategory.Enabled = true;
        btnNewSubject.Visible = true;
        lblAddNewSubject.Visible = false;
        txtNewSubject.Visible = false;
        txtNewCategory.Text = "";
        lblMessage.Visible = false;
        lblNewCategory.Visible = false;
        txtNewCategory.Visible = false;
        btnnewSubjectCategory.Visible = true;
        txtDescription.Text = "";
        //for manage users  
        
        //add user
        txtName_AddUser.Text = "";
        txtPassword_AddUser.Text = ""; 
        dropdown_AddUser.SelectedIndex = 0;
        lblMessage_AddUser.Visible = false;

        //change pwd    
        txtName_changePassword.Text = "";
        txtPassword_changePassword.Text = "";
        lblMessage_changePassword.Visible = false;
        
        //del user
        txtname_deleteUser.Text = "";
        lblMessage_deleteUser.Visible = true;


        //search test
        txtSearchTest.Text = "";
        lblMessage_searchTest.Visible = false;
    }
    //Update codes for updating the questions that have been edited in the grid view 
    protected void updateBrief(object sender, SqlDataSourceCommandEventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["testgenConnectionString"].ConnectionString);
        try
        {
            SqlCommand cmd = new SqlCommand("update questionBrief set questionText=@questiontext ,answer=@answer where qid = @qid", conn);
            cmd.CommandType = CommandType.Text;
            SqlParameter param1 = cmd.Parameters.Add("@questionText", SqlDbType.VarChar, 5000);
            SqlParameter param2 = cmd.Parameters.Add("@answer", SqlDbType.VarChar, 5000);
            SqlParameter param3 = cmd.Parameters.Add("@qid", SqlDbType.VarChar, 5000);
            GridViewRow row = GridView_brief.Rows[GridView_brief.EditIndex];
            var qtext = (AjaxControlToolkit.HTMLEditor.Editor)(row.FindControl("Editor1"));
            var answer = (AjaxControlToolkit.HTMLEditor.Editor)(row.FindControl("Editor2"));
            var id = (Literal)row.FindControl("Literal1");
            cmd.Parameters["@questionText"].Value = qtext.Content;
            cmd.Parameters["@answer"].Value = answer.Content;
            cmd.Parameters["@qid"].Value = Int32.Parse(id.Text.ToString());
            conn.Open();
            cmd.ExecuteNonQuery();
            GridView_brief.DataBind();
        }
        catch (Exception se)
        {
            conn.Close();
        }
    }
    protected void updateFill(object sender, SqlDataSourceCommandEventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["testgenConnectionString"].ConnectionString);
        try
        {
            SqlCommand cmd = new SqlCommand("update questionFill set questionText=@questiontext ,answer=@answer where qid = @qid", conn);
            cmd.CommandType = CommandType.Text;
            SqlParameter param1 = cmd.Parameters.Add("@questionText", SqlDbType.VarChar, 5000);
            SqlParameter param2 = cmd.Parameters.Add("@answer", SqlDbType.VarChar, 5000);
            SqlParameter param3 = cmd.Parameters.Add("@qid", SqlDbType.VarChar, 5000);
            GridViewRow row = GridView_fill.Rows[GridView_fill.EditIndex];
            var qtext = (AjaxControlToolkit.HTMLEditor.Editor)(row.FindControl("Editor3"));
            var answer = (AjaxControlToolkit.HTMLEditor.Editor)(row.FindControl("Editor4"));
            var id = (Label)row.FindControl("Label1");
            cmd.Parameters["@questionText"].Value = qtext.Content;
            cmd.Parameters["@answer"].Value = answer.Content;
            cmd.Parameters["@qid"].Value = Int32.Parse(id.Text.ToString());
            conn.Open();
            cmd.ExecuteReader();
            GridView_fill.DataBind();
        }
        catch (Exception se)
        {
            conn.Close();
        }
    }
    protected void updateChoice(object sender, SqlDataSourceCommandEventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["testgenConnectionString"].ConnectionString);
        try
        {
            SqlCommand cmd = new SqlCommand("update questionChoice set questionText=@questiontext ,answer=@answer,choiceA=@choiceA,choiceB=@choiceB,choiceC=@choiceC,choiceD=@choiceD where qid = @qid", conn);
            cmd.CommandType = CommandType.Text;
            SqlParameter param1 = cmd.Parameters.Add("@questionText", SqlDbType.VarChar, 5000);
            SqlParameter param2 = cmd.Parameters.Add("@answer", SqlDbType.VarChar, 5000);
            SqlParameter param3 = cmd.Parameters.Add("@qid", SqlDbType.Int, 5000);
            SqlParameter param4 = cmd.Parameters.Add("@choiceA", SqlDbType.VarChar, 50);
            SqlParameter param5 = cmd.Parameters.Add("@choiceB", SqlDbType.VarChar, 50);
            SqlParameter param6 = cmd.Parameters.Add("@choiceC", SqlDbType.VarChar, 50);
            SqlParameter param7 = cmd.Parameters.Add("@choiceD", SqlDbType.VarChar, 50);

            GridViewRow row = GridView_choice.Rows[GridView_choice.EditIndex];
            var qtext = (AjaxControlToolkit.HTMLEditor.Editor)(row.FindControl("Editor5"));
            var answer =  (TextBox)(row.FindControl("txtchoiceanswer"));
            var id =      (Label)row.FindControl("lblchoiceqid");
            var choiceA = (TextBox)row.FindControl("txtchoiceA");
            var choiceB = (TextBox)row.FindControl("txtchoiceB");
            var choiceC = (TextBox)row.FindControl("txtchoiceC");
            var choiceD = (TextBox)row.FindControl("txtchoiceD");

            cmd.Parameters["@questionText"].Value = qtext.Content;
            cmd.Parameters["@choiceA"].Value = choiceA.Text;
            cmd.Parameters["@choiceB"].Value = choiceB.Text;
            cmd.Parameters["@choiceC"].Value = choiceC.Text;
            cmd.Parameters["@choiceD"].Value = choiceD.Text;
            cmd.Parameters["@answer"].Value = answer.Text.ToString();
            cmd.Parameters["@qid"].Value = Int32.Parse(id.Text.ToString());
            
            conn.Open();
            cmd.ExecuteNonQuery();
            GridView_choice.DataBind();
        }
        catch (Exception se)
        {
            conn.Close();
        }
    }
    protected void updateMatch(object sender, SqlDataSourceCommandEventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["testgenConnectionString"].ConnectionString);
        try
        {
            SqlCommand cmd = new SqlCommand("update questionMatch set questionText=@questiontext ,leftChoice1=@lchoice1,leftChoice2=@lchoice2,leftChoice3=@lchoice3,leftChoice4=@lchoice4,leftChoice5=@lchoice5,leftChoice6=@lchoice6,rightChoice1=@rchoice1,rightChoice2=@rchoice2,rightChoice3=@rchoice3,rightChoice4=@rchoice4,rightChoice5=@rchoice5,rightChoice6=@rchoice6 where qid = @qid", conn);
            cmd.CommandType = CommandType.Text;
            SqlParameter param1 = cmd.Parameters.Add("@questionText", SqlDbType.VarChar, 5000);
           // SqlParameter param2 = cmd.Parameters.Add("@answer", SqlDbType.VarChar, 5000);
            SqlParameter param3 = cmd.Parameters.Add("@qid", SqlDbType.Int, 50);
            SqlParameter param4 = cmd.Parameters.Add("@lchoice1", SqlDbType.VarChar, 50);
            SqlParameter param5 = cmd.Parameters.Add("@lchoice2", SqlDbType.VarChar, 50);
            SqlParameter param6 = cmd.Parameters.Add("@lchoice3", SqlDbType.VarChar, 50);
            SqlParameter param7 = cmd.Parameters.Add("@lchoice4", SqlDbType.VarChar, 50);
            SqlParameter param8 = cmd.Parameters.Add("@lchoice5", SqlDbType.VarChar, 50);
            SqlParameter param9 = cmd.Parameters.Add("@lchoice6", SqlDbType.VarChar, 50);
            SqlParameter param10 = cmd.Parameters.Add("@rchoice1", SqlDbType.VarChar, 50);
            SqlParameter param11 = cmd.Parameters.Add("@rchoice2", SqlDbType.VarChar, 50);
            SqlParameter param12 = cmd.Parameters.Add("@rchoice3", SqlDbType.VarChar, 50);
            SqlParameter param13 = cmd.Parameters.Add("@rchoice4", SqlDbType.VarChar, 50);
            SqlParameter param14 = cmd.Parameters.Add("@rchoice5", SqlDbType.VarChar, 50);
            SqlParameter param15 = cmd.Parameters.Add("@rchoice6", SqlDbType.VarChar, 50);

            GridViewRow row = GridView_match.Rows[GridView_match.EditIndex];
            var qtext = (AjaxControlToolkit.HTMLEditor.Editor)(row.FindControl("Editor6"));
           // var answer = (TextBox)(row.FindControl("txtchoiceanswer"));
            var id = (Label)row.FindControl("lblmatchqid");
            var lchoice1 = (TextBox)row.FindControl("txtlchoice1");
            var lchoice2 = (TextBox)row.FindControl("txtlchoice2");
            var lchoice3 = (TextBox)row.FindControl("txtlchoice3");
            var lchoice4 = (TextBox)row.FindControl("txtlchoice4");
            var lchoice5 = (TextBox)row.FindControl("txtlchoice5");
            var lchoice6 = (TextBox)row.FindControl("txtlchoice6");
            var rchoice1 = (TextBox)row.FindControl("txtrchoice1");
            var rchoice2 = (TextBox)row.FindControl("txtrchoice2");
            var rchoice3 = (TextBox)row.FindControl("txtrchoice3");
            var rchoice4 = (TextBox)row.FindControl("txtrchoice4");
            var rchoice5 = (TextBox)row.FindControl("txtrchoice5");
            var rchoice6 = (TextBox)row.FindControl("txtrchoice6");

            cmd.Parameters["@questionText"].Value = qtext.Content;
            cmd.Parameters["@lchoice1"].Value = lchoice1.Text;
            cmd.Parameters["@lchoice2"].Value = lchoice2.Text;
            cmd.Parameters["@lchoice3"].Value = lchoice3.Text; 
            cmd.Parameters["@lchoice4"].Value = lchoice4.Text;
            cmd.Parameters["@lchoice5"].Value = lchoice5.Text;
            cmd.Parameters["@lchoice6"].Value = lchoice6.Text;
            cmd.Parameters["@rchoice1"].Value = rchoice1.Text;
            cmd.Parameters["@rchoice2"].Value = rchoice2.Text;
            cmd.Parameters["@rchoice3"].Value = rchoice3.Text;
            cmd.Parameters["@rchoice4"].Value = rchoice4.Text;
            cmd.Parameters["@rchoice5"].Value = rchoice5.Text;
            cmd.Parameters["@rchoice6"].Value = rchoice6.Text;
            //cmd.Parameters["@answer"].Value = answer.Text.ToString();
            cmd.Parameters["@qid"].Value = Int32.Parse(id.Text.ToString());

            conn.Open();
            cmd.ExecuteNonQuery();
            GridView_match.DataBind();
        }
        catch (Exception se)
        {
            conn.Close();
        }
    }
    protected void DropDownList_UserName_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void dropdown_subject_SelectedIndexChanged(object sender, EventArgs e)
    {
        dropdown_ExistingCategory.DataBind();
    }
    protected void btnnewSubjectCategory_Click(object sender, EventArgs e)
    {
        
        lblNewCategory.Visible = true;
        txtNewCategory.Visible = true;
        txtNewCategory.Text = "";
        txtNewCategory.ForeColor = System.Drawing.Color.Black;
        btnnewSubjectCategory.Visible = false;
        dropdown_ExistingCategory.Enabled = false;
    }
  
}
