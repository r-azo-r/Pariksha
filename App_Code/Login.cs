using System;
using System.Data;
using System.Configuration;
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


namespace Login
{
    /// <summary>
    /// Summary description for Login
    /// </summary>
    public class Login
    {
        public Login()
        {
            //
            // TODO: Add constructor logic here
            //
          
        }
        public static void setActive(int userId, int flag)
        {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["testgenConnectionString"].ConnectionString);
        try
        {

            SqlCommand cmd = new SqlCommand("setActive", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter param1 = cmd.Parameters.Add("@userId", SqlDbType.Int, 50);
            cmd.Parameters["@userId"].Value = userId;

            SqlParameter param2 = cmd.Parameters.Add("@flag", SqlDbType.VarChar, 50);
            cmd.Parameters["@flag"].Value = flag;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

        }
    
        catch(Exception se)
        {
            conn.Close();
        }
        }
        public static void signOut()
        {
            try
            {
                setActive(Int32.Parse(System.Web.HttpContext.Current.Session["uid"].ToString()), 0);
                System.Web.HttpContext.Current.Session.Clear();
                System.Web.HttpContext.Current.Session.RemoveAll();
                System.Web.HttpContext.Current.Session.Abandon();
                System.Web.HttpContext.Current.Response.Redirect("Home.aspx");
            }
            catch (Exception e)
            {
                System.Web.HttpContext.Current.Session.Clear();
                System.Web.HttpContext.Current.Session.RemoveAll();
                System.Web.HttpContext.Current.Session.Abandon();
                System.Web.HttpContext.Current.Response.Redirect("Home.aspx");
            }
        }
    }
}