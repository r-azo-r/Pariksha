<%@ Application Language="C#"  %>

<script runat="server">

    
    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }
    public static void setActive(int userId, int flag)
    {
        System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["testgenConnectionString"].ConnectionString);
        try
        {

            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("setActive", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            System.Data.SqlClient.SqlParameter param1 = cmd.Parameters.Add("@userId", System.Data.SqlDbType.Int, 50);
            cmd.Parameters["@userId"].Value = userId;

            System.Data.SqlClient.SqlParameter param2 = cmd.Parameters.Add("@flag", System.Data.SqlDbType.VarChar, 50);
            cmd.Parameters["@flag"].Value = flag;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

        }

        catch (Exception se)
        {
            conn.Close();
        }
    }
    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
        try
        {
            setActive(Int32.Parse(System.Web.HttpContext.Current.Session["uid"].ToString()), 0);
            System.Web.HttpContext.Current.Session.Clear();
            System.Web.HttpContext.Current.Session.RemoveAll();
            System.Web.HttpContext.Current.Session.Abandon();
            System.Web.HttpContext.Current.Response.Redirect("Home.aspx");
        }
        catch (Exception se)
        {
            System.Web.HttpContext.Current.Session.Clear();
            System.Web.HttpContext.Current.Session.RemoveAll();
            System.Web.HttpContext.Current.Session.Abandon();
            System.Web.HttpContext.Current.Response.Redirect("Home.aspx");
        }
    }
       
</script>
