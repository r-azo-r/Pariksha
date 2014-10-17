using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Home : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

        txtName.Focus();   
        if (Session["uid"] != null)
            {
                signin.Visible = false;
                if (Session["uType"] != null)
                    if (Session["uType"].ToString().Equals("fellow"))
                    {
                        AddQuestionLink.Visible = false;
                        AdministratorLink.Visible = false;
                        AddQuestion.Visible = false;
                        Administrator.Visible = false;
                        FellowLink.Visible = true;
                        Fellows.Visible = true;
                    }  
            }
            
    }
    public bool login(String userName, String password,String connString)
    {

        
        SqlConnection conn = new SqlConnection(connString);
        try
        {
            SqlCommand cmd = new SqlCommand("loginUser", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter param1 = null;
            SqlParameter param2 = null;
            SqlParameter param3 = null;
            SqlParameter param4 = null;

            param1 = cmd.Parameters.Add("@uname", SqlDbType.VarChar,50);
            param2 = cmd.Parameters.Add("@pwd", SqlDbType.VarChar,100);
            param3 = cmd.Parameters.Add("@utype", SqlDbType.VarChar,50);
            param4 = cmd.Parameters.Add("@uid",SqlDbType.Int,50);
            
            param1.Direction = ParameterDirection.Input;
            param2.Direction = ParameterDirection.Input;
            param3.Direction = ParameterDirection.Output;
            param4.Direction = ParameterDirection.Output;

            cmd.Parameters["@uname"].Value = userName;
            cmd.Parameters["@pwd"].Value = password;
            cmd.Parameters["@utype"].Value = "";
            cmd.Parameters["@uid"].Value = -1;
            conn.Open();
            cmd.ExecuteNonQuery();

            //utype contains the usertype..  
            //String utype = cmd.Parameters["@utype"].Value.ToString();
            Session.Add("uid", param4.Value);
            Session.Add("uType",param3.Value.ToString());
            conn.Close();
            return true;
        }
        catch (Exception e)
        {
            Session.Add("uid", null);
            Session.Add("uType",null);
            conn.Close();
            txtName.Text = "";
            return false;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
       
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["testgenConnectionString"].ConnectionString);
        try
        {
            SqlCommand cmd = new SqlCommand("loginUser", connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@uname", SqlDbType.VarChar, 50);
            cmd.Parameters.Add("@pwd", SqlDbType.VarChar, 100);
            SqlParameter p = new SqlParameter("utype", SqlDbType.VarChar, 50);
            p.Direction = ParameterDirection.Output;

            cmd.Parameters["@uname"].Value = txtName.Text;
            cmd.Parameters["@pwd"].Value = txtPassword.Text;
          //  cmd.Parameters.Add(p);
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                if (reader.Read())
                {
                
                   
                        Session.Add("uid", reader.GetInt32(0));
                        Session.Add("uType", reader.GetString(1));
                        Session.Add("uname", txtName.Text);
                   
                }
                Label1.Visible = false;
                signin.Visible = false;
                if (Session["uType"] != null)
                    if (Session["uType"].ToString().Equals("fellow"))
                    {
                        AddQuestionLink.Visible = false;
                        AdministratorLink.Visible = false;
                        AddQuestion.Visible = false;
                        Administrator.Visible = false;
                        FellowLink.Visible = true;
                    }
                
                Login.Login.setActive(Int32.Parse(Session["uid"].ToString()), 1);
            }
            else
            {
                Label1.Text = "Wrong Entry";
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Visible = true;
            }
        }
        catch (Exception se)
        {
            connection.Close();
        }


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
    
}
