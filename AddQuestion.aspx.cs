using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data.SqlTypes;
using System.Data;
using System.Configuration;
using System.IO;
using System.ComponentModel;

public partial class AddQuestion : System.Web.UI.Page
{
    protected void lbSignOut_Click(object sender, EventArgs e)
    {
     
        // Session.Clear();
        //Session.RemoveAll();
        //Session.Abandon();
      //  Response.Redirect("Home.aspx");
        Login.Login.signOut();
    }  
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
        dropdown_questionType.SelectedIndexChanged += new EventHandler(dropdown_questionType_SelectedIndexChanged);
      //  dropdown_Subject.SelectedIndexChanged += new EventHandler(dropdown_Subject_SelectedIndexChanged);
        if (!IsPostBack)
        {

            lblQuestion.Visible = true;
            txtQuestion.Visible = true;
            lblAnswer.Visible = true;
            txtAnswer.Visible = true;
            btn_addQuestion.Visible = true;
            btn_reset.Visible = true;
            displayDescription();
        }
        
        
        

        
    }
    protected void dropdown_Subject_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataSource2.DataBind();
        dropdown_subjectCategory.DataBind();
    }
    protected void dropdown_questionType_SelectedIndexChanged(object sender, EventArgs e)
    {
        int change = dropdown_questionType.SelectedIndex;

        //KSH CODE
        txtQuestion.Content = "";
        txtAnswer.Content = "";
        resetChoices();
        resetMatching();

        //
        switch (change)
        {
            
            case 0:
                //Brief Answers
                lblQuestion.Visible = true;
                txtQuestion.Visible = true;
                lblAnswer.Visible = true;
                txtAnswer.Visible = true;
                lblImageUpload.Visible = false;
                fileUpload.Visible = false;
                lbl_MultiChoice.Visible = false;
                lbl_Matching.Visible = false;
                table_Matching.Visible = false;
                table_MultiChoice.Visible = false;
                break;

            case 1:
                //Multiple Choice 
                lblQuestion.Visible = true;
                txtQuestion.Visible = true;
                lblAnswer.Visible = false;
                txtAnswer.Visible = false;
                lbl_MultiChoice.Visible = true;
                table_MultiChoice.Visible = true;
                lblImageUpload.Visible = false;
                fileUpload.Visible = false;
                lbl_Matching.Visible = false;

                table_Matching.Visible = false;
                table_MultiChoice.Visible = true;
                break;
            case 2:
                //Custom Question 
                lblQuestion.Visible = true;
                txtQuestion.Visible = true;
                lblAnswer.Visible = true;
                txtAnswer.Visible = true;
                lblImageUpload.Visible = true;
                fileUpload.Visible = true;
                lbl_Matching.Visible = false;
                lbl_MultiChoice.Visible = false;
                table_Matching.Visible = false;
                table_MultiChoice.Visible = false;
                break;
            case 3:
                //Fill in the blanks
                lblQuestion.Visible = true;
                txtQuestion.Visible = true;
                lblAnswer.Visible = true;
                txtAnswer.Visible = true;
                lblImageUpload.Visible = false;
                fileUpload.Visible = false;
                lbl_Matching.Visible = false;
                lbl_MultiChoice.Visible = false;
                table_Matching.Visible = false;
                table_MultiChoice.Visible = false;
                break;
            case 4:
                //Match the following
                lblQuestion.Visible = true;
                txtQuestion.Visible = true;
                txtQuestion.Width = 300;
                lblAnswer.Visible = false;
                txtAnswer.Visible = false;
                lblImageUpload.Visible = false;
                fileUpload.Visible = false;
                lbl_MultiChoice.Visible = false;
                table_MultiChoice.Visible = false;
                lbl_Matching.Visible = true;
                table_Matching.Visible = true;
                break;
            default:
                break;
        }

    }
    protected void btn_reset_Click(object sender, EventArgs e)
    {
        txtQuestion.Content = "";
        txtAnswer.Content = "";
        resetChoices();
        resetMatching();
    }
    protected void btn_addQuestion_Click(object sender, EventArgs e)
    {
       
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["testgenConnectionString"].ConnectionString);
        String connString = connection.ConnectionString;
        InsertQuestion iq = new InsertQuestion();
        String qtype = dropdown_questionType.SelectedValue.ToString();
        String standard = dropdown_standard.SelectedValue.ToString();
        Int32 subject = iq.getSubjectId(dropdown_Subject.SelectedValue.ToString(),dropdown_subjectCategory.SelectedValue.ToString(),dropdown_subjectLevel.SelectedValue,connString);
        Int32 rating = Int32.Parse(dropdown_rating.SelectedValue.ToString());
        Int32 creator = Int32.Parse(Session["uid"].ToString());
        String difficulty = dropdown_difficulty.SelectedValue.ToString();
        int []temp =  iq.insertQuestionDescriptor(qtype, standard, subject, rating,difficulty,creator, connString);
        int qid = temp[0];
        int qtid = temp[1];
        if (qid == -1 || qtid == -1)
        {
            //Display Error Message
            lblMessage_AddQuestion.Text = "Unsuccesful";
            lblMessage_AddQuestion.ForeColor = System.Drawing.Color.Red;
            lblMessage_AddQuestion.Visible = true;
        }
        else
        {
            switch (qtid)
            {
                case 1:
                    //insert into table quesionBrief
                    iq.insertQuestionBrief(qid, txtQuestion.Content, 1, txtAnswer.Content, connString);
                    break;
                case 2:
                    //insert into table questionChoice
                    String answer = "";
                    if (choiceA_checkbox.Checked)
                    {
                        answer += "A ";
                    }
                    if (choiceB_checkbox.Checked)
                    {
                        answer += " B";
                    }
                    if (choiceC_checkbox.Checked)
                    {
                        answer += " C";
                    }
                    if (choiceD_checkbox.Checked)
                    {
                        answer += " D";
                    }
                    iq.insertQuestionChoice(qid, txtQuestion.Content, choiceA.Text, choiceB.Text, choiceC.Text, choiceD.Text, answer, connString);

                    break;
                case 3:
                    // insert into table questionCustom
                    //Stream imgStream = fileUpload.PostedFile.InputStream;

                    // int imgLen = fileUpload.PostedFile.ContentLength;
                    // Byte[] imageData = new Byte[imgLen];
                    // int n = imgStream.Read(imageData,0,imgLen);


                    // iq.insertQuestionCustom(qid, txtQuestion.Content, txtAnswer.Content, imageData, connString);


                    //ksh code
                    startUpLoad(qid);

                    //
                    break;
                case 4:
                    //insert into table questionFill
                    iq.insertQuestionFill(qid, txtQuestion.Content, txtAnswer.Content, connString);
                    break;
                case 5:
                    //insert into table questionMatch
                    String[] lchoice = new String[6];
                    String[] rchoice = new String[6];
                    lchoice[0] = table_matching_lchoice1.Text;
                    lchoice[1] = table_matching_lchoice2.Text;
                    lchoice[2] = table_matching_lchoice3.Text;
                    lchoice[3] = table_matching_lchoice4.Text;
                    lchoice[4] = table_matching_lchoice5.Text;
                    lchoice[5] = table_matching_lchoice6.Text;
                    rchoice[0] = table_matching_rchoice1.Text;
                    rchoice[1] = table_matching_rchoice2.Text;
                    rchoice[2] = table_matching_rchoice3.Text;
                    rchoice[3] = table_matching_rchoice4.Text;
                    rchoice[4] = table_matching_rchoice5.Text;
                    rchoice[5] = table_matching_rchoice6.Text;
                    String answer_matching = "Matching Pairs are give alongside each other";
                    iq.insertQuestionMatching(qid, txtQuestion.Content, lchoice, rchoice, answer_matching, connString);
                    break;
                default:
                    break;


            }

            lblMessage_AddQuestion.Text = "Question succesfully added";
            lblMessage_AddQuestion.ForeColor = System.Drawing.Color.DarkGreen;
            lblMessage_AddQuestion.Visible = true;
        }
        
        txtQuestion.Content = "";
        txtAnswer.Content = "";
        resetChoices();
        resetMatching();

    }
    public void resetChoices()
    {
        choiceA.Text = "";
        choiceB.Text = "";
        choiceC.Text = "";
        choiceC.Text = "";
        choiceD.Text = "";
        choiceA_checkbox.Checked = false;
        choiceB_checkbox.Checked = false;
        choiceC_checkbox.Checked = false;
        choiceD_checkbox.Checked = false;
    }
    public void resetMatching()
    {
         table_matching_lchoice1.Text = "";
         table_matching_lchoice2.Text = "";
         table_matching_lchoice3.Text = "";
         table_matching_lchoice4.Text = "";
         table_matching_lchoice5.Text = "";
         table_matching_lchoice6.Text = "";
         table_matching_rchoice1.Text = "";
         table_matching_rchoice2.Text = "";
         table_matching_rchoice3.Text = "";
         table_matching_rchoice4.Text = "";
         table_matching_rchoice5.Text = "";
         table_matching_rchoice6.Text = "";
    }
    public void startUpLoad(int qid)
    {
        //get the file name of the posted image
        string imgName = fileUpload.FileName.ToString();
        //sets the image path
        string imgPath = "ImageStorage/"+imgName;
        //then save it to the Folder
        fileUpload.SaveAs(Server.MapPath(imgPath));

        //get the size in bytes that
        int imgSize = fileUpload.PostedFile.ContentLength;

        //validates the posted file before saving
        if (fileUpload.PostedFile != null && fileUpload.PostedFile.FileName != "")
        {
            if (fileUpload.PostedFile.ContentLength > (5 * 1024 * 1024)) // 5120 KB means 5MB
            {
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('File is too big')", true);

            }
            else
            {
                //save the file
                //Call the method to execute Insertion of data to the Database

                insertImage(qid, imgPath);
                // Response.Write("Save Successfully!");
            }
        }
    }
    public void insertImage(int qid, string path)
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con1"].ToString());
        //string sql = "INSERT INTO image VALUES "
        //            + " (@ImgName,@ImgSize,@ImgPath)";
        try
        {

            conn.Open();
            SqlCommand cmd = new SqlCommand("insertQuestionCustom", conn);
            SqlParameter[] param = new SqlParameter[4];


            param[0] = new SqlParameter("@qid", SqlDbType.Int);
            param[1] = new SqlParameter("@qtext", SqlDbType.VarChar);
            param[2] = new SqlParameter("@answer", SqlDbType.VarChar);
            param[3] = new SqlParameter("@qimage", SqlDbType.VarChar);
            param[0].Value = qid;
            param[1].Value = txtQuestion.Content;
            param[2].Value = txtAnswer.Content;
            param[3].Value = path;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.Add(param[0]);
            cmd.Parameters.Add(param[1]);
            cmd.Parameters.Add(param[2]);
            cmd.Parameters.Add(param[3]);
            //for (int i = 0; i < param.Length; i++)
            //{
            //    cmd.Parameters.Add(param[i]);
            //}


            cmd.ExecuteNonQuery();
        }
        catch (System.Data.SqlClient.SqlException ex)
        {
            string msg = "Insert Error:";
            msg += ex.Message;
            throw new Exception(msg);
        }
        finally
        {
            conn.Close();
        }
    }

    protected void dropdown_subjectLevel_SelectedIndexChanged(object sender, EventArgs e)
    {
        displayDescription();
    }
    protected void displayDescription()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["testgenconnectionstring"].ConnectionString);
        try
        {
            
            conn.Open();
            SqlCommand cmd = new SqlCommand("select description from subject where subjectName = @subjectName and subjectCategory=@subjectCategory and subjectLevel = @subjectLevel", conn);
            cmd.CommandType = CommandType.Text;

            SqlParameter param1 = cmd.Parameters.Add("@subjectName", SqlDbType.VarChar,50);
            SqlParameter param2 = cmd.Parameters.Add("@subjectCategory", SqlDbType.VarChar, 50);
            SqlParameter param3 = cmd.Parameters.Add("@subjectLevel", SqlDbType.VarChar, 50);
            
            cmd.Parameters["@subjectName"].Value = dropdown_Subject.SelectedValue;
            cmd.Parameters["@subjectCategory"].Value = dropdown_subjectCategory.SelectedValue;
            cmd.Parameters["@subjectLevel"].Value = dropdown_subjectLevel.SelectedValue;
            
            param1.Direction = ParameterDirection.Input;
            param2.Direction = ParameterDirection.Input;
            param3.Direction = ParameterDirection.Input;
            
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
                while (reader.Read())
                {
                    lblDescription.Text = "Standard Description :-"+reader.GetString(0);
                    lblDescription.ForeColor = System.Drawing.Color.DarkGreen;
                }
            else
            {
                    lblDescription.Text = "No Description Available";
                    lblDescription.ForeColor = System.Drawing.Color.Red;
            }
            conn.Close();

        }
        catch (Exception e)
        {
            conn.Close();
        }

    }
}
public class InsertQuestion
    {
        public int getSubjectId(String subjectName, String subjectCategory,String subjectLevel,String connString)
        {
            SqlConnection conn = null;
            try
            {

                conn = new SqlConnection(connString);
                conn.Open();

                SqlCommand cmd = new SqlCommand("getSubjectId", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter param1 = cmd.Parameters.Add("@subjectName", SqlDbType.VarChar, 50);
                SqlParameter param2 = cmd.Parameters.Add("@subjectCategory", SqlDbType.VarChar, 50);
                SqlParameter param3 = cmd.Parameters.Add("@sid", SqlDbType.Int, 50);
                SqlParameter param4 = cmd.Parameters.Add("@subjectLevel", SqlDbType.VarChar, 50);
            

                cmd.Parameters["@subjectName"].Value = subjectName;
                cmd.Parameters["@subjectCategory"].Value = subjectCategory;
                cmd.Parameters["@subjectLevel"].Value =subjectLevel;                
           

                param1.Direction = ParameterDirection.Input;
                param2.Direction = ParameterDirection.Input;
                param3.Direction = ParameterDirection.Output;
                param4.Direction = ParameterDirection.Input;
               

                cmd.ExecuteNonQuery();
                int ch = Int32.Parse(cmd.Parameters["@sid"].Value.ToString());
                conn.Close();
                return ch;
            }
            catch (Exception e)
            {
                conn.Close();
                return -1;
            }
        }
        public int[] insertQuestionDescriptor(String qtype, String standard, Int32 subject, Int32 rating, String difficulty,Int32 creator, String connString)
        {
            SqlConnection conn = null;
            try
            {

                conn = new SqlConnection(connString);
                conn.Open();

                SqlCommand cmd = new SqlCommand("insertQuestionDescriptor", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter param1 = cmd.Parameters.Add("@qtype", SqlDbType.VarChar, 50);
                SqlParameter param2 = cmd.Parameters.Add("@standard", SqlDbType.VarChar, 50);
                SqlParameter param3 = cmd.Parameters.Add("@subject", SqlDbType.VarChar, 50);
                SqlParameter param4 = cmd.Parameters.Add("@rating", SqlDbType.Int, 50);
                SqlParameter param5 = cmd.Parameters.Add("@creator", SqlDbType.Int, 50);
                SqlParameter param6 = cmd.Parameters.Add("@qtid", SqlDbType.Int, 50);
                SqlParameter param7 = cmd.Parameters.Add("@dateOfCreation", SqlDbType.DateTime, 50);
                SqlParameter param8 = cmd.Parameters.Add("@qid", SqlDbType.Int, 50);
                SqlParameter param9 = cmd.Parameters.Add("@difficulty", SqlDbType.VarChar,50);

                cmd.Parameters["@qtype"].Value = qtype;
                cmd.Parameters["@standard"].Value = standard;
                cmd.Parameters["@subject"].Value = subject;
                cmd.Parameters["@rating"].Value = rating;
                cmd.Parameters["@creator"].Value = creator;
                cmd.Parameters["@dateOfCreation"].Value = DateTime.Now;
                cmd.Parameters["@difficulty"].Value = difficulty;


                param1.Direction = ParameterDirection.Input;
                param2.Direction = ParameterDirection.Input;
                param3.Direction = ParameterDirection.Input;
                param4.Direction = ParameterDirection.Input;
                param5.Direction = ParameterDirection.Input;
                param6.Direction = ParameterDirection.Output;
                param7.Direction = ParameterDirection.Input;
                param8.Direction = ParameterDirection.Output;
                param9.Direction = ParameterDirection.Input;

                cmd.ExecuteNonQuery();
                int[] temp = new int[2];
                temp[0] = Int32.Parse(cmd.Parameters["@qid"].Value.ToString());
                temp[1] = Int32.Parse(cmd.Parameters["@qtid"].Value.ToString());
                conn.Close();
                return temp;
            }
            catch (Exception e)
            {
                
                conn.Close();
                int[] temp = new int[2];
                temp[0] = -1;
                temp[1] = -1;
                return temp;
            }
        }
        public void insertQuestionBrief(Int32 qid, String qtext, Int32 flag, String answer, String connString)
        {
            SqlConnection conn = null;
            try
            {
                conn = new SqlConnection(connString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("insertQuestionBrief", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter param1 = cmd.Parameters.Add("@qid", SqlDbType.Int, 50);
                SqlParameter param2 = cmd.Parameters.Add("@qtext", SqlDbType.VarChar, 5000);
                SqlParameter param3 = cmd.Parameters.Add("@flag", SqlDbType.Int, 50);
                SqlParameter param4 = cmd.Parameters.Add("@answer", SqlDbType.VarChar, 5000);

                cmd.Parameters["@qid"].Value = qid;
                cmd.Parameters["@qtext"].Value = qtext;
                cmd.Parameters["@flag"].Value = flag;
                cmd.Parameters["@answer"].Value = answer;

                param1.Direction = ParameterDirection.Input;
                param2.Direction = ParameterDirection.Input;
                param3.Direction = ParameterDirection.Input;
                param4.Direction = ParameterDirection.Input;

                cmd.ExecuteNonQuery();
                conn.Close();

            }
            catch (Exception e)
            {
                conn.Close();
            }

        }
        public void insertQuestionChoice(Int32 qid, String qtext, String choiceA, String choiceB, String choiceC, String choiceD, String answer, String connString)
        {
            SqlConnection conn = null;
            try
            {

                conn = new SqlConnection(connString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("insertQuestionChoice", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter param1 = cmd.Parameters.Add("@qid", SqlDbType.Int, 50);
                SqlParameter param2 = cmd.Parameters.Add("@qtext", SqlDbType.VarChar, 5000);
                SqlParameter param3 = cmd.Parameters.Add("@choiceA", SqlDbType.VarChar, 5000);
                SqlParameter param4 = cmd.Parameters.Add("@choiceB", SqlDbType.VarChar, 5000);
                SqlParameter param5 = cmd.Parameters.Add("@choiceC", SqlDbType.VarChar, 5000);
                SqlParameter param6 = cmd.Parameters.Add("@choiceD", SqlDbType.VarChar, 5000);
                SqlParameter param7 = cmd.Parameters.Add("@answer", SqlDbType.VarChar, 5000);

                cmd.Parameters["@qid"].Value = qid;
                cmd.Parameters["@qtext"].Value = qtext;
                cmd.Parameters["@choiceA"].Value = choiceA;
                cmd.Parameters["@choiceB"].Value = choiceB;
                cmd.Parameters["@choiceC"].Value = choiceC;
                cmd.Parameters["@choiceD"].Value = choiceD;
                cmd.Parameters["@answer"].Value = answer;

                param1.Direction = ParameterDirection.Input;
                param2.Direction = ParameterDirection.Input;
                param3.Direction = ParameterDirection.Input;
                param4.Direction = ParameterDirection.Input;
                param5.Direction = ParameterDirection.Input;
                param6.Direction = ParameterDirection.Input;
                param7.Direction = ParameterDirection.Input;

                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception e)
            {
                conn.Close();

            }

        }
        public void insertQuestionCustom(Int32 qid, String qtext, String answer, Byte[] qimage, String connString)
        {
            SqlConnection conn = null;
            try
            {

                conn = new SqlConnection(connString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("insertQuestionCustom", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter param1 = cmd.Parameters.Add("@qid", SqlDbType.Int, 50);
                SqlParameter param2 = cmd.Parameters.Add("@qtext", SqlDbType.VarChar, 8000);
                SqlParameter param3 = cmd.Parameters.Add("@answer", SqlDbType.VarChar, 8000);
                SqlParameter param4 = cmd.Parameters.Add("@qimage", SqlDbType.VarBinary, 8000);

                cmd.Parameters["@qid"].Value = qid;
                cmd.Parameters["@qtext"].Value = qtext;
                cmd.Parameters["@answer"].Value = answer;
                cmd.Parameters["@qimage"].Value = qimage;

                param1.Direction = ParameterDirection.Input;
                param2.Direction = ParameterDirection.Input;
                param3.Direction = ParameterDirection.Input;
                param4.Direction = ParameterDirection.Input;

                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception e)
            {
                conn.Close();
            }
        }
        public void insertQuestionCustomNoImage(Int32 qid, String qtext, String answer, String connString)
        {
            SqlConnection conn = null;
            try
            {

                conn = new SqlConnection(connString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("insertQuestionCustomNoImage", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter param1 = cmd.Parameters.Add("@qid", SqlDbType.Int, 50);
                SqlParameter param2 = cmd.Parameters.Add("@qtext", SqlDbType.VarChar, 5000);
                SqlParameter param3 = cmd.Parameters.Add("@answer", SqlDbType.VarChar, 5000);

                cmd.Parameters["@qid"].Value = qid;
                cmd.Parameters["@qtext"].Value = qtext;
                cmd.Parameters["@answer"].Value = answer;

                param1.Direction = ParameterDirection.Input;
                param2.Direction = ParameterDirection.Input;
                param3.Direction = ParameterDirection.Input;

                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception e)
            {
                conn.Close();

            }
        }
        public void insertQuestionFill(Int32 qid, String qtext, String answer, String connString)
        {
            SqlConnection conn = null;
            try
            {

                conn = new SqlConnection(connString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("insertQuestionFill", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter param1 = cmd.Parameters.Add("@qid", SqlDbType.Int, 50);
                SqlParameter param2 = cmd.Parameters.Add("@qtext", SqlDbType.VarChar, 5000);
                SqlParameter param3 = cmd.Parameters.Add("@answer", SqlDbType.VarChar, 5000);

                cmd.Parameters["@qid"].Value = qid;
                cmd.Parameters["@qtext"].Value = qtext;
                cmd.Parameters["@answer"].Value = answer;

                param1.Direction = ParameterDirection.Input;
                param2.Direction = ParameterDirection.Input;
                param3.Direction = ParameterDirection.Input;

                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception e)
            {
                conn.Close();
            }
        }
        public void insertQuestionMatching(Int32 qid, String qtext,String[] lchoice, String[] rchoice, String answer, String connString)
        {
            SqlConnection conn = null;
            try
            {

                conn = new SqlConnection(connString);
                conn.Open();

                SqlCommand cmd = new SqlCommand("insertQuestionMatching", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter param1 = cmd.Parameters.Add("@qid", SqlDbType.Int, 50);
                SqlParameter param2 = cmd.Parameters.Add("@lchoice1", SqlDbType.VarChar, 50);
                SqlParameter param3 = cmd.Parameters.Add("@rchoice1", SqlDbType.VarChar, 50);
                SqlParameter param4 = cmd.Parameters.Add("@lchoice2", SqlDbType.VarChar, 50);
                SqlParameter param5 = cmd.Parameters.Add("@rchoice2", SqlDbType.VarChar, 50);
                SqlParameter param6 = cmd.Parameters.Add("@lchoice3", SqlDbType.VarChar, 50);
                SqlParameter param7 = cmd.Parameters.Add("@rchoice3", SqlDbType.VarChar, 50);
                SqlParameter param8 = cmd.Parameters.Add("@lchoice4", SqlDbType.VarChar, 50);
                SqlParameter param15 = cmd.Parameters.Add("@rchoice4", SqlDbType.VarChar, 50);
                SqlParameter param9 = cmd.Parameters.Add("@lchoice5", SqlDbType.VarChar, 50);
                SqlParameter param10 = cmd.Parameters.Add("@rchoice5", SqlDbType.VarChar, 50);
                SqlParameter param11 = cmd.Parameters.Add("@lchoice6", SqlDbType.VarChar, 50);
                SqlParameter param12 = cmd.Parameters.Add("@rchoice6", SqlDbType.VarChar, 50);
                SqlParameter param13 = cmd.Parameters.Add("@qtext", SqlDbType.VarChar, 8000);
                SqlParameter param14 = cmd.Parameters.Add("@answer", SqlDbType.VarChar, 8000);

                cmd.Parameters["@qid"].Value = qid;
                cmd.Parameters["@lchoice1"].Value = lchoice[0];
                cmd.Parameters["@rchoice1"].Value = rchoice[0];
                cmd.Parameters["@lchoice2"].Value = lchoice[1];
                cmd.Parameters["@rchoice2"].Value = rchoice[1];
                cmd.Parameters["@lchoice3"].Value = lchoice[2];
                cmd.Parameters["@rchoice3"].Value = rchoice[2];
                cmd.Parameters["@lchoice4"].Value = lchoice[3];
                cmd.Parameters["@rchoice4"].Value = rchoice[3];
                cmd.Parameters["@lchoice5"].Value = lchoice[4];
                cmd.Parameters["@rchoice5"].Value = rchoice[4];
                cmd.Parameters["@lchoice6"].Value = lchoice[5];
                cmd.Parameters["@rchoice6"].Value = rchoice[5];
                cmd.Parameters["@qtext"].Value = qtext;
                cmd.Parameters["@answer"].Value = answer;

                param1.Direction = ParameterDirection.Input;
                param2.Direction = ParameterDirection.Input;
                param3.Direction = ParameterDirection.Input;
                param4.Direction = ParameterDirection.Input;
                param5.Direction = ParameterDirection.Input;
                param6.Direction = ParameterDirection.Input;
                param7.Direction = ParameterDirection.Input;
                param8.Direction = ParameterDirection.Input;
                param9.Direction = ParameterDirection.Input;
                param10.Direction = ParameterDirection.Input;
                param11.Direction = ParameterDirection.Input;
                param12.Direction = ParameterDirection.Input;
                param13.Direction = ParameterDirection.Input;
                param14.Direction = ParameterDirection.Input;
                param15.Direction = ParameterDirection.Input;

                cmd.ExecuteNonQuery();
             
                conn.Close();
           
            }
            catch (Exception e)
            {
                conn.Close();
               
            }
 
        }
    }


