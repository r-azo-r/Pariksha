using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GenerateTest : System.Web.UI.Page
{
    protected void lbSignOut_Click(object sender, EventArgs e)
    {
       // Session.Clear();
        //Session.RemoveAll();
        //Session.Abandon();
        //Response.Redirect("Home.aspx");
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
                ViewState["qidCustom"] = new List<Int32 >();

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
    private List<String> subjectCategory = new List<String>();
    private List<String> subjectCategory2 = new List<String>();
    private static String subjectCategoryFinal = "";

#endregion
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["uid"] == null)
        {
            Response.Redirect("Home.aspx");
        }

        if (!Page.IsPostBack)
        {
            dropdown_Subject.SelectedIndexChanged += new EventHandler(dropdown_Subject_SelectedIndexChanged);
            bindBrief();
            bindChoice();
            bindCustom();
            bindFill();
            bindMatching();
            
            
        } 
    }
    protected void dropdown_Subject_SelectedIndexChanged(object sender, EventArgs e)
    {
        Content.Visible = false;
        SqlDataSource2.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        makeVisible();
        bindBrief();
        bindChoice();
        bindCustom();
        bindFill();
        bindMatching();
        makeVisible();
        Content.Visible = true;
        AddQuestionsToTest.Visible = true;

        
    }
    protected void AddQuestionsToTest_Click(object sender, EventArgs e)
    {
        Session.Add("qidBrief", qidBrief);
        Session.Add("qidMatch",qidMatching);
        Session.Add("qidChoice", qidChoice);
        Session.Add("qidCustom", qidCustom);
        Session.Add("qidFill",qidFill);

        btnGenTest.Visible = true;
        qid.AddRange(qidBrief);
        qid.AddRange(qidChoice);
        qid.AddRange(qidCustom);
        qid.AddRange(qidFill);
        qid.AddRange(qidMatching);
        Session.Add("qid", qid);
        if (Session["qid"] != null)
            lblQuestionCount.Text = "Question Count:"+((List<Int32>)Session["qid"]).Count.ToString();

    }
    protected String getSubjectCategory(int qid)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["testgenConnectionString"].ConnectionString);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("getSubjectCategory", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@qid", SqlDbType.Int, 50);
            SqlParameter param2 = cmd.Parameters.Add("@subjectCategory",SqlDbType.VarChar,50);

            cmd.Parameters["@qid"].Value = qid;          

            param1.Direction = ParameterDirection.Input;
            param2.Direction = ParameterDirection.Output;

            cmd.ExecuteNonQuery();
            conn.Close();

            return param2.Value.ToString();

        }

        catch (Exception e)
        {
            conn.Close();
            return "";

        }
 
    }
    protected int addToLog(int creator)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["testgenConnectionString"].ConnectionString);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("addToLog", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@dateofCreation", SqlDbType.VarChar, 50);
            SqlParameter param2 = cmd.Parameters.Add("@creator", SqlDbType.Int, 50);
            SqlParameter param3 = cmd.Parameters.Add("@testid", SqlDbType.Int, 50);
            SqlParameter param4 = cmd.Parameters.Add("@standard", SqlDbType.VarChar, 50);
            SqlParameter param5 = cmd.Parameters.Add("@subjectName", SqlDbType.VarChar, 50);
            SqlParameter param6 = cmd.Parameters.Add("@subjectCategory", SqlDbType.VarChar, 50);

            cmd.Parameters["@dateofCreation"].Value = DateTime.Now;
            cmd.Parameters["@creator"].Value = creator;
            cmd.Parameters["@standard"].Value = Session["standard"].ToString();
            cmd.Parameters["@subjectName"].Value = Session["subjectName"].ToString();
            cmd.Parameters["@subjectCategory"].Value = Session["subjectCategory"].ToString();

            param1.Direction = ParameterDirection.Input;
            param2.Direction = ParameterDirection.Input;

            param3.Direction = ParameterDirection.Output;
            param4.Direction = ParameterDirection.Input;
            param5.Direction = ParameterDirection.Input;
            param6.Direction = ParameterDirection.Input;
            cmd.ExecuteNonQuery();
            conn.Close();
            return int.Parse(param3.Value.ToString());
        }
        catch (Exception e)
        {
            conn.Close();
            return -1;

        }
    }
    protected void addQuestionToTestLog(int testid,int qid)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["testgenConnectionString"].ConnectionString);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("addQuestionToTest", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@qid", SqlDbType.Int, 50);
            SqlParameter param2 = cmd.Parameters.Add("@testid", SqlDbType.Int, 50);
            

            cmd.Parameters["@qid"].Value = qid;
            cmd.Parameters["@testid"].Value = testid;
            


            param1.Direction = ParameterDirection.Input;
            param2.Direction = ParameterDirection.Input;
            

            cmd.ExecuteNonQuery();
            conn.Close();

        }
        catch (Exception e)
        {
            conn.Close();

        }
    }
    protected void makeVisible()
    {
        lblchoice.Visible = true;
        lblcustom.Visible = true;
        lblfill.Visible = true;
        lblbrief.Visible = true;
        lblmatching.Visible = true;

    }
    #region Populating Session Variables
    protected void addMatchingQid(Object sender, EventArgs e)
    {

        foreach (GridViewRow row in GridView_matching.Rows)
        {
            var chkBox = row.FindControl("GridView_matching_checkbox") as CheckBox;

            var lbl = row.FindControl("GridView_matching_qid") as Label;

            int id = Int32.Parse(lbl.Text.ToString());

            if (chkBox.Checked)
            {
                if (!qidMatching.Exists(i => i == id))
                {
                    qidMatching.Add(id);
                }
            }
            else
            {
                if(qidMatching.Exists(i=> i==id))
                    qidMatching.Remove(id);
            }
        }

   }
    protected void addCustomQid(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView_custom.Rows)
        {
            var chkBox = row.FindControl("GridView_custom_checkbox") as CheckBox;

            var lbl = row.FindControl("GridView_custom_qid") as Label;

            int id = Int32.Parse(lbl.Text.ToString());

            if (chkBox.Checked)
            {
                if (!qidCustom.Exists(i => i == id))
                {
                    qidCustom.Add(id);
                }
            }
                else
                {
                    if (qidCustom.Exists(i => i == id))
                        qidCustom.Remove(id);
                }
        }
    }
    protected void addBriefQid(Object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView_brief.Rows)
        {
            var chkBox = row.FindControl("GridView_brief_checkbox") as CheckBox;
            var lbl = row.FindControl("GridView_brief_qid") as Label;
            var id = Int32.Parse(lbl.Text.ToString());
            if (chkBox.Checked)
            {
                if (!qidBrief.Exists(i => i == id))
                {
                    qidBrief.Add(id);
                }
            }
            else
            {
                if (qidBrief.Exists(i => i == id))
                    qidBrief.Remove(id);
            }
            
        }
    }
    protected void addFillQid(Object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView_fill.Rows)
        {
            var chkBox = row.FindControl("GridView_fill_checkbox") as CheckBox;
            var lbl = row.FindControl("GridView_fill_qid") as Label;
            var id = Int32.Parse(lbl.Text.ToString());
            if (chkBox.Checked)
            {
                if (!qidFill.Exists(i => i == id))
                {
                    qidFill.Add(id);
                }
            }
            else
            {
                if (qidFill.Exists(i => i == id))
                    qidFill.Remove(id);
            }

        }
    }
    protected void addChoiceQid(Object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView_choice.Rows)
        {
            var chkBox = row.FindControl("GridView_choice_checkbox") as CheckBox;
            var lbl = row.FindControl("GridView_choice_qid") as Label;
            var id = Int32.Parse(lbl.Text.ToString());
            if (chkBox.Checked)
            {
                if (!qidChoice.Exists(i => i == id))
                {
                    qidChoice.Add(id);
                }
            }
            else
            {
                if (qidChoice.Exists(i => i == id))
                    qidChoice.Remove(id);
            }

        }
    }
    #endregion
    #region HelperMethods
    protected void bindBrief()
    {
        try
        {
           
            GridView_brief.DataSource = SqlDataSource_brief;
            GridView_brief.DataBind();
            RePopulateCheckBoxes_Brief();
        }
        catch (Exception e)
        {

        }
    }
    protected void GridView_briefPageChanging(object sender, GridViewPageEventArgs e)
    {

        foreach (GridViewRow row in GridView_brief.Rows)
        {
            var chkBox = row.FindControl("GridView_brief_checkbox") as CheckBox;

            IDataItemContainer container = (IDataItemContainer)chkBox.NamingContainer;

            if (chkBox.Checked)
            {
                PersistRowIndex_brief(container.DataItemIndex);
            }
            else
            {
                RemoveRowIndex_brief(container.DataItemIndex);
            }
        }

        GridView_brief.PageIndex = e.NewPageIndex;

        bindBrief();
    }
    protected void RePopulateCheckBoxes_Brief()
    {
        foreach (GridViewRow row in GridView_brief.Rows)
        {
            var chkBox = row.FindControl("GridView_brief_checkbox") as CheckBox;

            IDataItemContainer container = (IDataItemContainer)chkBox.NamingContainer;

            if (brief != null)
            {
                if (brief.Exists(i => i == container.DataItemIndex))
                {
                    chkBox.Checked = true;
                }

            }
        }
    }
    private List<Int32> brief
    {
        get
        {
            if (ViewState["brief"] == null)
            {
                ViewState["brief"] = new List<Int32>();
            }

            return (List<Int32>)ViewState["brief"];
        }
    }
    private void RemoveRowIndex_brief(int index)
    {
        brief.Remove(index);
    }
    private void PersistRowIndex_brief(int index)
    {
        if (!brief.Exists(i => i == index))
        {
            brief.Add(index);
        }
    }

    protected void bindChoice()
    {
        try
        {
          
            GridView_choice.DataSource = SqlDataSource_choice;
            GridView_choice.DataBind();
            RePopulateCheckBoxes_Choice();
        }
        catch(Exception e )
        {}
    }
    protected void GridView_choicePageChanging(object sender, GridViewPageEventArgs e)
    {

        foreach (GridViewRow row in GridView_choice.Rows)
        {
            var chkBox = row.FindControl("GridView_choice_checkbox") as CheckBox;

            IDataItemContainer container = (IDataItemContainer)chkBox.NamingContainer;

            if (chkBox.Checked)
            {
                PersistRowIndex_choice(container.DataItemIndex);
            }
            else
            {
                RemoveRowIndex_choice(container.DataItemIndex);
            }
        }

        GridView_choice.PageIndex = e.NewPageIndex;

        bindChoice();
    }
    protected void RePopulateCheckBoxes_Choice()
    {
        foreach (GridViewRow row in GridView_choice.Rows)
        {
            var chkBox = row.FindControl("GridView_choice_checkbox") as CheckBox;

            IDataItemContainer container = (IDataItemContainer)chkBox.NamingContainer;

            if (choice != null)
            {
                if (choice.Exists(i => i == container.DataItemIndex))
                {
                    chkBox.Checked = true;
                }
            }
        }
    }
    private List<Int32> choice
    {
        get
        {
            if (ViewState["choice"] == null)
            {
                ViewState["choice"] = new List<Int32>();
            }
            return (List<Int32>)ViewState["choice"];
        }
    }
    private void RemoveRowIndex_choice(int index)
    {
        choice.Remove(index);
    }
    private void PersistRowIndex_choice(int index)
    {
        if (!choice.Exists(i => i == index))
        {
            choice.Add(index);
        }
    }

    protected void bindCustom()
    {
        try 
        {
           
            GridView_custom.DataSource = SqlDataSource_custom;
            GridView_custom.DataBind();
            RePopulateCheckBoxes_Custom();
        }
        catch(Exception)
        {

        }
        
    }
    protected void GridView_customPageChanging(object sender, GridViewPageEventArgs e)
    {

        foreach (GridViewRow row in GridView_custom.Rows)
        {
            var chkBox = row.FindControl("GridView_custom_checkbox") as CheckBox;

            IDataItemContainer container = (IDataItemContainer)chkBox.NamingContainer;

            if (chkBox.Checked)
            {
                PersistRowIndex_custom(container.DataItemIndex);
            }
            else
            {
                RemoveRowIndex_custom(container.DataItemIndex);
            }
        }

        GridView_custom.PageIndex = e.NewPageIndex;

        bindCustom();
    }
    protected void RePopulateCheckBoxes_Custom()
    {
        foreach (GridViewRow row in GridView_custom.Rows)
        {
            var chkBox = row.FindControl("GridView_custom_checkbox") as CheckBox;

            IDataItemContainer container = (IDataItemContainer)chkBox.NamingContainer;

            if (custom != null)
            {
                if (custom.Exists(i => i == container.DataItemIndex))
                {
                    chkBox.Checked = true;
                }
            }
        }
    }
    private List<Int32> custom
    {
        get
        {
            if (ViewState["custom"] == null)
            {
                ViewState["custom"] = new List<Int32>();
            }
            return (List<Int32>)ViewState["custom"];
        }
    }
    private void RemoveRowIndex_custom(int index)
    {
        custom.Remove(index);
    }
    private void PersistRowIndex_custom(int index)
    {
        if (!custom.Exists(i => i == index))
        {
            custom.Add(index);
        }
    }

    protected void bindFill()
    {
        try
        {
           
            GridView_fill.DataSource = SqlDataSource_fill;
            GridView_fill.DataBind();
            RePopulateCheckBoxes_Fill();
        }
      
    catch(Exception e)
    {}
    }
    protected void GridView_fillPageChanging(object sender, GridViewPageEventArgs e)
    {

        foreach (GridViewRow row in GridView_fill.Rows)
        {
            var chkBox = row.FindControl("GridView_fill_checkbox") as CheckBox;

            IDataItemContainer container = (IDataItemContainer)chkBox.NamingContainer;

            if (chkBox.Checked)
            {
                PersistRowIndex_fill(container.DataItemIndex);
            }
            else
            {
                RemoveRowIndex_fill(container.DataItemIndex);
            }
        }

        GridView_fill.PageIndex = e.NewPageIndex;

        bindFill();
    }
    protected void RePopulateCheckBoxes_Fill()
    {
        foreach (GridViewRow row in GridView_fill.Rows)
        {
            var chkBox = row.FindControl("GridView_fill_checkbox") as CheckBox;

            IDataItemContainer container = (IDataItemContainer)chkBox.NamingContainer;

            if (fill != null)
            {
                if (fill.Exists(i => i == container.DataItemIndex))
                {
                    chkBox.Checked = true;
                }
            }
        }
    }
    private List<Int32> fill
    {
        get
        {
            if (ViewState["fill"] == null)
            {
                ViewState["fill"] = new List<Int32>();
            }
            return (List<Int32>)ViewState["fill"];
        }
    }
    private void RemoveRowIndex_fill(int index)
    {
        fill.Remove(index);
    }
    private void PersistRowIndex_fill(int index)
    {
        if (!fill.Exists(i => i == index))
        {
            fill.Add(index);
        }
    }

    protected void bindMatching()
    {
        try
        {
            
            GridView_matching.DataSource = SqlDataSource_matching;
            GridView_matching.DataBind();
            RePopulateCheckBoxes_Matching();
        }
        catch (Exception e)
        { }
        
    }
    protected void GridView_fillPageMatching(object sender, GridViewPageEventArgs e)
    {

        foreach (GridViewRow row in GridView_matching.Rows)
        {
            var chkBox = row.FindControl("GridView_matching_checkbox") as CheckBox;
            var id = row.FindControl("GridView_matching_qid") as Label;
            IDataItemContainer container = (IDataItemContainer)chkBox.NamingContainer;

            if (chkBox.Checked)
            {
                PersistRowIndex_matching(container.DataItemIndex);
                
            }
            else
            {
                RemoveRowIndex_matching(container.DataItemIndex);
            }
        }

        GridView_matching.PageIndex = e.NewPageIndex;

        bindMatching();
    }
    protected void RePopulateCheckBoxes_Matching()
    {
        foreach (GridViewRow row in GridView_matching.Rows)
        {
            var chkBox = row.FindControl("GridView_matching_checkbox") as CheckBox;

            IDataItemContainer container = (IDataItemContainer)chkBox.NamingContainer;

            if (matching != null)
            {
                if (matching.Exists(i => i == container.DataItemIndex))
                {
                    chkBox.Checked = true;
                }
            }
        }
    }
    private List<Int32> matching
    {
        get
        {
            if (ViewState["matching"] == null)
            {
                ViewState["matching"] = new List<Int32>();
            }
            return (List<Int32>)ViewState["matching"];
        }
    }
    private void RemoveRowIndex_matching(int index)
    {
        matching.Remove(index);
    }
    private void PersistRowIndex_matching(int index)
    {
        if (!matching.Exists(i => i == index))
        {
            matching.Add(index);
        }
    }
    #endregion
    protected void GenTest_Click(object sender, EventArgs e)
    {

        try
        {
            qid.Clear();
            qid.AddRange(qidBrief);
            qid.AddRange(qidChoice);
            qid.AddRange(qidCustom);
            qid.AddRange(qidFill);
            qid.AddRange(qidMatching);

            subjectCategoryFinal = "";
            for (int i = 0; i < qid.Count; i++)
            {
                subjectCategory.Add(getSubjectCategory(qid[i]).ToString());
            }

            foreach (String var in subjectCategory)
            {
                if (subjectCategory2.Contains(var))
                    continue;
                subjectCategory2.Add(var);
            }

            for (int i = 0; i < subjectCategory2.Count - 1; i++)
            {
                subjectCategoryFinal += subjectCategory2[i] + ",";
            }

            subjectCategoryFinal += subjectCategory2[subjectCategory2.Count - 1];
            Session.Add("subjectName", dropdown_Subject.SelectedValue.ToUpper().ToString());
            Session.Remove("subjectCategory");
            Session.Add("subjectCategory", subjectCategoryFinal);
            Session.Add("standard", dropdown_standard.SelectedValue.ToUpper().ToString());
            int testid = addToLog(int.Parse(Session["uid"].ToString()));

            Session.Add("testid", testid);

            for (int i = 0; i < qid.Count; i++)
            {
                addQuestionToTestLog(testid, qid[i]);
            }

            showFellow.Visible = true;
            showStudent.Visible = true;
        }
        catch (Exception se)
        {
 
        }
    }
}

