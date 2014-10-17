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
using System.Data.Sql;
using System.Data.SqlClient;

public partial class image : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        try
        {
            string ImageId = Request.QueryString["qid"];        
           
            SqlConnection con = new SqlConnection((ConfigurationManager.ConnectionStrings["con1"]).ToString());
            SqlCommand cmd2 = new SqlCommand("selectQuestion2", con);
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Parameters.Clear();
            SqlParameter paraQT = new SqlParameter("@questionType", SqlDbType.VarChar);
            SqlParameter paraID = new SqlParameter("@qid", SqlDbType.Int);
           
            paraQT.Value = "custom";
            paraID.Value = ImageId;
            cmd2.Parameters.Add(paraQT);
            cmd2.Parameters.Add(paraID);
            con.Open();
           
            //open the database and get a datareader
           
            SqlDataReader sdr = cmd2.ExecuteReader();
            if (sdr.Read()) //yup we found our image
            {
                Response.ContentType = "image/jpeg";
                Response.BinaryWrite((byte[])sdr["questionImage"]);
            }
            con.Close();
        }
        catch (Exception se)
        {
        }
    }
}
