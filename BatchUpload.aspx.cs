using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;


public partial class BatchUpload : System.Web.UI.Page
{
    static string filePath;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lbSignOut_Click(object sender, EventArgs e)
    {
        //Login.Login.setActive(Int32.Parse(Session["uid"].ToString()), 0);
        //Session.Clear();
        //Session.RemoveAll();
        //Session.Abandon();
        //Response.Redirect("Home.aspx");
        Login.Login.signOut();
    }
    protected void Uploadbtn_Click(object sender, EventArgs e)
    {
        display(sender, e);
        
    }
    protected void display(object sender, EventArgs e)
    {
        #region db con
        //db connectivity
        SqlConnection condb = new SqlConnection(ConfigurationManager.ConnectionStrings["con1"].ToString());
        condb.Open();
        SqlCommand comdb = new SqlCommand();
        comdb.Connection = condb;
        comdb.CommandType = CommandType.Text;
        //comdb.CommandText = "insert into questionDescriptor values('brief','first','1','1','easy','1000','"+DateTime.Now.Date.ToString()+"')";
        #endregion
        #region excel upload and connectivity and data fetch
        //excel file upload to project folder

        if (fileUpload.PostedFile != null && fileUpload.PostedFile.FileName != "")
        {
            filePath = "Excel/" + Session.SessionID.ToString() + fileUpload.FileName.ToString();
            fileUpload.PostedFile.SaveAs(Server.MapPath(filePath));
        }

        //excel connectivity
        String sConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;" + "Data Source=" + Server.MapPath(filePath) + ";" + "Extended Properties=Excel 8.0;";
        OleDbConnection con = new OleDbConnection(sConnectionString);
        con.Open();
        OleDbCommand cmd = new OleDbCommand("SELECT * FROM [Brief$]", con);
        OleDbDataReader dr = cmd.ExecuteReader();

        //data fetch from excel
        string grade, sbjCat, sbjName, sbjStd, rat, dif, creator, dtCreation, qText, ans, stdid;
        int sid = -1;
        while (dr.Read())
        {
            grade = dr["Grade"].ToString();
            sbjStd = dr["Standard"].ToString();
            sbjCat = dr["SubjectCategory"].ToString();
           // stdid = dr["stdid"].ToString();
            sbjName = dr["SubjectName"].ToString();
            rat = dr["Rating"].ToString();
            dif = dr["Difficulty"].ToString();
            creator = Session["uid"].ToString();
            dtCreation = DateTime.Now.Date.ToString();
            qText = dr["QuestionText"].ToString();
            ans = dr["Answer"].ToString();
        #endregion
        #region mapping
            int stdidfinal=-1;
            switch (grade)
            {

                case "kg":
                    stdidfinal = 0;
                    break;
                case "first":
                    stdidfinal = 1;
                    break;

                case "second":
                    stdidfinal = 2;
                    break;

                case "third":
                    stdidfinal = 3;
                    break;

                case "fourth":
                    stdidfinal = 4;
                    break;

                case "fifth":
                    stdidfinal = 5;
                    break;

                default: stdidfinal = 1;
                    break;
            }
            #endregion
        #region db insert
            //to determine sid based on subject name,cat and level
            //AND STDID
            SqlConnection sidc = new SqlConnection(ConfigurationManager.ConnectionStrings["con1"].ToString());
            SqlCommand sidcom = new SqlCommand("select sid from subject where subjectName='" + sbjName + "' and subjectCategory='" + sbjCat + "' and subjectLevel='" + sbjStd + "' and stdid='" + stdidfinal + "'", sidc);
            sidc.Open();
            SqlDataReader sidreader = sidcom.ExecuteReader();
            while (sidreader.HasRows && sidreader.Read())
            {
                sid = Int32.Parse(sidreader["sid"].ToString());
            }
            sidc.Close();

            //adding para for insert descriptor
            comdb.CommandText = "insertquestionDescriptor";
            comdb.CommandType = CommandType.StoredProcedure;
            comdb.Parameters.Clear();
            SqlParameter p2 = comdb.Parameters.Add("@qtype", SqlDbType.VarChar, 50);
            SqlParameter p3 = comdb.Parameters.Add("@standard", SqlDbType.VarChar, 50);
            SqlParameter p4 = comdb.Parameters.Add("@subject", SqlDbType.VarChar, 50);
            SqlParameter p5 = comdb.Parameters.Add("@rating", SqlDbType.Int);
            SqlParameter p6 = comdb.Parameters.Add("@difficulty", SqlDbType.VarChar, 50);
            SqlParameter p7 = comdb.Parameters.Add("@creator", SqlDbType.VarChar, 50);
            SqlParameter p8 = comdb.Parameters.Add("@qtid", SqlDbType.Int);
            SqlParameter p9 = comdb.Parameters.Add("@dateOfCreation", SqlDbType.DateTime);
            SqlParameter p10 = comdb.Parameters.Add("@qid", SqlDbType.Int);
            p8.Direction = ParameterDirection.Output;
            p10.Direction = ParameterDirection.Output;
            p2.Value = "brief";
            p3.Value = grade;
            p4.Value = sid;
            p5.Value = rat;
            p6.Value = dif;
            p7.Value = Int32.Parse(creator);
            p9.Value = dtCreation;

            //executing proc for qd and retrieving qtid and qid
            comdb.ExecuteNonQuery();
            string qtid = p8.Value.ToString();
            string qid = p10.Value.ToString();

            //inserting in questionbrief table and executing
            if (qtid == "1")
            {
                comdb.CommandText = "insertQuestionBrief";
                comdb.Parameters.Clear();
                SqlParameter p11 = comdb.Parameters.Add("@qid", SqlDbType.VarChar);
                SqlParameter p12 = comdb.Parameters.Add("@qtext", SqlDbType.VarChar);
                SqlParameter p13 = comdb.Parameters.Add("@flag", SqlDbType.Int);
                SqlParameter p14 = comdb.Parameters.Add("@answer", SqlDbType.VarChar);
                p11.Value = qid;
                p12.Value = qText;
                p13.Value = 1;
                p14.Value = ans;
                comdb.ExecuteNonQuery();
            }
        }
        //closing connection with sql server
        condb.Close();
        con.Close();
            #endregion
        
      
        //trying for deleting excel file after upload
        lblmessage.Text = "Upload  Successful";
        lblmessage.ForeColor = System.Drawing.Color.DarkGreen;
        lblmessage.Visible = true; 

    }
}
