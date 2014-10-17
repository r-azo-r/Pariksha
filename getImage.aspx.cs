using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class getImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         
        try
        {
            string ImageId = Request.QueryString["qid"];
            string sqlText = "SELECT questionImage FROM questionCustom WHERE qid = " + ImageId;

         
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["testgenConnectionString"].ConnectionString);
            SqlCommand command = new SqlCommand(sqlText, connection);

            //open the database and get a datareader
            connection.Open();
            SqlDataReader dr = command.ExecuteReader();
            if (dr.Read()) //yup we found our image
            {
                Response.ContentType = "image/jpeg";
                Response.BinaryWrite((byte[])dr["questionImage"]);
            }
            connection.Close();
        }
        catch (Exception se)
        {
        }
       
        
    }
}
