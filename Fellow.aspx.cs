using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Collections.Generic;

public partial class Fellow : System.Web.UI.Page
{
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
    private List<Int32> qid = new List<int>();
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lbSignOut_Click(object sender, EventArgs e)
    {
        //Session.Clear();
        //Session.RemoveAll();
        //Session.Abandon();
        //Response.Redirect("Home.aspx");
        Login.Login.signOut();
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

    }
    protected void btnSearchTest_Click(object sender, EventArgs e)
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["testgenConnectionString"].ConnectionString);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("getTestQuestion", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@testid", SqlDbType.Int, 50);

            cmd.Parameters["@testid"].Value = Int32.Parse(txtSearchTest.Text.ToString());

            param1.Direction = ParameterDirection.Input;

            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            int i = 0;
            while (reader.Read())
            {
                qid.Add(reader.GetInt32(0));
            }
            conn.Close();

        }
        catch (Exception se)
        {
            conn.Close();

        }
        for (int i = 0; i < qid.Count; i++)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("getQtype", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter param1 = cmd.Parameters.Add("@qid", SqlDbType.Int, 50);
                SqlParameter param2 = cmd.Parameters.Add("@qtype", SqlDbType.VarChar, 50);

                cmd.Parameters["@qid"].Value = qid[i];
                param1.Direction = ParameterDirection.Input;
                param2.Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                String qtype = param2.Value.ToString();
                if (param2.Value.ToString().Equals("brief"))
                    qidBrief.Add(qid[i]);

                else if (param2.Value.ToString().Equals("choice"))
                    qidChoice.Add(qid[i]);

                else if (param2.Value.ToString().Equals("custom"))
                    qidCustom.Add(qid[i]);

                else if (param2.Value.ToString().Equals("fill"))
                    qidFill.Add(qid[i]);

                else if (param2.Value.ToString().Equals("match"))
                    qidMatching.Add(qid[i]);
                conn.Close();

               

            }
            catch (Exception sse)
            {
                conn.Close();
            }
        }
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

            clearSession();

            Session.Add("qidBrief", qidBrief);
            Session.Add("qidCustom", qidCustom);
            Session.Add("qidFill", qidFill);
            Session.Add("qidChoice", qidChoice);
            Session.Add("qidMatch", qidMatching);
            Session.Add("standard", param2.Value.ToString().ToUpper());
            Session.Add("subjectName", param3.Value.ToString().ToUpper());
            Session.Add("subjectCategory", param4.Value.ToString().ToUpper());
            Session.Add("testid", Int32.Parse(txtSearchTest.Text));
            if (qid.Count > 0)
            {
                HyperLink_fellow.Visible = true;
                HyperLink_student.Visible = true;
                lblMessage.Visible = false;
            }
            else
            {
                lblMessage.Visible = true;
            }
        }
        catch (Exception ee)
        {
            conn.Close();
        }
    }
}
