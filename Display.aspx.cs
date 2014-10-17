using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Text;

public partial class Display : System.Web.UI.Page
{
    //static ArrayList qBrief,qChoice,qFill,qCustom,qMatch;
    static List<Int32> qBrief, qChoice, qFill, qCustom, qMatch;
    static question[] qB,qC,qF,qCs,qM;
    //static HtmlImage[] himg; 

    protected void Page_Load(object sender, EventArgs e)
    {
       //just for now...static populating 
        if (!IsPostBack)
        {
           
            //retrieve
            retrieveData();
            //call as per query
            if (Request["show"] != null)
            {
                if (Int32.Parse(Request["show"]) == 0)
                    output.InnerHtml = studentVersion();
                if (Int32.Parse(Request["show"]) == 1)
                    output.InnerHtml = fellowVersion();
                clearSession();
            }
        }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {


      
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        retrieveData();
    }
    public void retrieveData()
    { 
        //sql work
        SqlConnection con = new SqlConnection((ConfigurationManager.ConnectionStrings["con1"]).ToString());
        SqlCommand cmd2 = new SqlCommand("selectQuestion2", con);
        cmd2.CommandType = CommandType.StoredProcedure;
        SqlDataReader sdr;
        con.Open();
        
        //initialization of parameter variables
        cmd2.Parameters.Clear();
        SqlParameter paraQT = new SqlParameter("@questionType", SqlDbType.VarChar);
        SqlParameter paraID = new SqlParameter("@qid", SqlDbType.Int);
        
        
        //initializing arraylist and question store objects 
        if (Session["qidBrief"] != null)
        {
            qBrief = (List<Int32>)Session["qidBrief"];
            qB = new question[qBrief.Count];
            for (int i = 0; i < qBrief.Count; i++)
            {
                qB[i] = new question();
                cmd2.Parameters.Clear();
                //SqlParameter paraQT = new SqlParameter("@questionType", SqlDbType.VarChar);
                paraQT.Value = "brief";
                cmd2.Parameters.Add(paraQT);
                //SqlParameter paraID = new SqlParameter("@qid", SqlDbType.Int);
                paraID.Value = (Int32)qBrief[i];
                cmd2.Parameters.Add(paraID);
                
                sdr = cmd2.ExecuteReader();
                while (sdr.Read())
                {
                    //Label1.Text += sdr["questionText"] + "  " + sdr["answer"];
                    qB[i].qText = sdr["questionText"].ToString();
                    qB[i].answer = sdr["answer"].ToString();
                }
                sdr.Close();

            }
        }
        if (Session["qidMatch"] != null)
        {
            qMatch = (List<Int32>)Session["qidMatch"];
            qM = new question[qMatch.Count];
            for (int i = 0; i < qMatch.Count; i++)
            {
                qM[i] = new question();
                
                cmd2.Parameters.Clear();
                paraQT.Value = "match";
                cmd2.Parameters.Add(paraQT);
                paraID.Value = (Int32)qMatch[i];
                cmd2.Parameters.Add(paraID);

                sdr = cmd2.ExecuteReader();
                while (sdr.Read())
                {
                    qM[i].qText = sdr["questionText"].ToString();
                    qM[i].left[0] = sdr["leftChoice1"].ToString();
                    qM[i].left[1] = sdr["leftChoice2"].ToString();
                    qM[i].left[2] = sdr["leftChoice3"].ToString();
                    qM[i].left[3] = sdr["leftChoice4"].ToString();
                    qM[i].left[4] = sdr["leftChoice5"].ToString();
                    qM[i].left[5] = sdr["leftChoice6"].ToString();
                    qM[i].right[0] = sdr["rightChoice1"].ToString();
                    qM[i].right[1] = sdr["rightChoice2"].ToString();
                    qM[i].right[2] = sdr["rightChoice3"].ToString();
                    qM[i].right[3] = sdr["rightChoice4"].ToString();
                    qM[i].right[4] = sdr["rightChoice5"].ToString();
                    qM[i].right[5] = sdr["rightChoice6"].ToString();

                }
                sdr.Close();

            }
        }
        if (Session["qidFill"] != null)
        {
            qFill = (List<Int32>)Session["qidFill"];
            qF = new question[qFill.Count];
            for (int i = 0; i < qFill.Count; i++)
            {
                qF[i] = new question();

               cmd2.Parameters.Clear();
               
                paraQT.Value = "fill";
                cmd2.Parameters.Add(paraQT);
                
                paraID.Value = (Int32)qFill[i];
                cmd2.Parameters.Add(paraID);
              
                sdr = cmd2.ExecuteReader();
                while (sdr.Read())
                {
                    //Label1.Text += sdr["questionText"] + "  " + sdr["answer"];
                    qF[i].qText = sdr["questionText"].ToString();
                    qF[i].answer = sdr["answer"].ToString();
                }
                sdr.Close();


            }
        }
        if (Session["qidChoice"] != null)
        {
            qChoice = (List<Int32>)Session["qidChoice"];
            qC = new question[qChoice.Count];
            for (int i = 0; i < qChoice.Count; i++)
            {
                qC[i] = new question();

                cmd2.Parameters.Clear();
                paraQT.Value = "choice";
                cmd2.Parameters.Add(paraQT);
                paraID.Value = (Int32)qChoice[i];
                cmd2.Parameters.Add(paraID);

                sdr = cmd2.ExecuteReader();
                while (sdr.Read())
                {
                    //Label1.Text += sdr["questionText"] + "  " + sdr["answer"];
                    qC[i].qText = sdr["questionText"].ToString();
                    qC[i].answer = sdr["answer"].ToString();
                    qC[i].choiceA = sdr["choiceA"].ToString();
                    qC[i].choiceB = sdr["choiceB"].ToString();
                    qC[i].choiceC = sdr["choiceC"].ToString();
                    qC[i].choiceD = sdr["choiceD"].ToString();
                }
                sdr.Close();
            }
        }
        if (Session["qidCustom"] != null)
        {
            qCustom = (List<Int32>)Session["qidCustom"];
            qCs = new question[qCustom.Count];
            //himg = new HtmlImage[qCustom.Count];

            for (int i = 0; i < qCustom.Count; i++)
            {
                qCs[i] = new question();
                cmd2.Parameters.Clear();
                paraQT.Value = "custom";
                cmd2.Parameters.Add(paraQT);
                paraID.Value = (Int32)qCustom[i];
                cmd2.Parameters.Add(paraID);
                sdr = cmd2.ExecuteReader();
                while (sdr.Read())
                {
                    
                    qCs[i].qText = sdr["questionText"].ToString();
                    qCs[i].answer = sdr["answer"].ToString();
                    qCs[i].img =sdr["questionImage"].ToString();
                    //qCs[i].img.ID = "himg" + i;
                    //qCs[i].img.Src = "image.aspx?qid=" + qCustom[i];
                    
                }
                sdr.Close();

            }
        }

     }
    public void display(string k)
    {
         
        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.Charset = "";
        HttpContext.Current.Response.ContentType = "application/msword";
        
        string strFileName = "Pariksha" +DateTime.Now.ToString() + ".doc";
        HttpContext.Current.Response.AddHeader("Content-Disposition", "inline;filename=" + strFileName);

        StringBuilder strHTMLContent = new StringBuilder();
        
        strHTMLContent.Append(" <h1 title='Heading' align='Center' style='font-family:verdana;font-size:80%;color:black'><u>Document Heading</u> </h1>".ToString());
        strHTMLContent.Append(k);
        strHTMLContent.Append("<p align='Center'> Note : This is dynamically generated word document </p>".ToString());
            
       
        HttpContext.Current.Response.Write(strHTMLContent);
        HttpContext.Current.Response.End();
        HttpContext.Current.Response.Flush();
    }
    public string studentVersion()
    {
        
        int c = 1;
        StringBuilder res = new StringBuilder();
        //header
        res.Append(studentHeader());

        //Fillups
       if (qF!=null && qF.Length > 0)
        {
            res.Append("<b>" + (c++) + ".Fill in the blanks:</b><br/><br/>");

            for (int i = 0; i < qF.Length; i++)
            {
                res.Append((i+1) + ".  " + qF[i].qText + " <br/>");
            }
            res.Append("<br/>");
        }
        
        //Match
       if (qM != null && qM.Length > 0)
        {
            res.Append("<b>" + (c++) + ".Match the following:</b><br/><br/>");
            StringBuilder temp = new StringBuilder();
            for (int i = 0; i < qM.Length; i++)
            {
                res.Append((i + 1) + "  " + qM[i].qText + " <br/>");
                String[] l = qM[i].left;
                String[] r = qM[i].right;
                Array.Sort(l);
                Array.Sort(r);


                temp.Append("<table border='0'>");
                for (int j = 0; j < l.Length; j++)
                {
                    temp.Append("<tr><td>" + (char)(j + 97) + ") " + l[j] + "</td><td><pre>         </pre></td><td>" + r[j] + "</td></tr>");
                }
                temp.Append("</table>");
                res.Append(temp.ToString() + "<br/>");
                temp.Remove(0, temp.Length);
                
            }
            res.Append("<br/>");

        }

        //Choice
       if (qC != null && qC.Length > 0)
        {
            res.Append("<b>" + (c++) + ".Multiple Choice:</b><br/><br/>");
            for (int i = 0; i < qC.Length; i++)
            {
                res.Append((i + 1) + ".  " + qC[i].qText + " <br/>");
                res.Append("A)" + qC[i].choiceA + "<br/>");
                res.Append("B)" + qC[i].choiceB + "<br/>");
                res.Append("C)" + qC[i].choiceC + "<br/>");
                res.Append("D)" + qC[i].choiceD + "<br/>");
                res.Append("<br/>");
            }
            res.Append("<br/>");
        }
        
        //brief
       if (qB != null && qB.Length > 0)
        {
            res.Append("<b>" + (c++) + ".Answer in brief:</b><br/><br/>");
            for (int i = 0; i < qB.Length; i++)
            {
                res.Append((i + 1) + ".  " + qB[i].qText + " <br/>");
                for (int k = 0; k < 4; k++)
                {
                    res.Append("_________________________________________________________________________________________<br/>");
                }
                res.Append("<br/>");
            }
            res.Append("<br/>");
        }
        //custom
       if (qCs != null && qCs.Length > 0)
        {
            res.Append("<b>" + (c++) + ".Image:</b><br/><br/>");
            for (int i = 0; i < qCs.Length; i++)
            {
                res.Append("<br/>");
                res.Append((i + 1) + ".  " + qCs[i].qText + " <br/>");
                res.Append("<img src='" + qCs[i].img  + "' height='300' width='300'/><br/>");

            }
            res.Append("<br/>");
        }
        return res.ToString();
    }
    public string studentHeader()
    {
        StringBuilder sb = new StringBuilder();
        try
        {
        sb.Append("STANDARD:"+Session["standard"]);
        sb.Append("<br/>SUBJECT:"+Session["subjectName"]);
        sb.Append("<br/>TOPIC ID:"+Session["subjectCategory"]);
        sb.Append("<br/>NAME:______________________________________________DIV:_______ROLL NO.___________");
        sb.Append("<br/>SCHOOL:_________________________________________________________");
        sb.Append("<hr/>");
        return sb.ToString(); 
        }
        catch(Exception e)
        {
            return "";
        }
    }
    public string fellowHeader()
    {
        StringBuilder sb = new StringBuilder();
        try
        {
            sb.Append("NAME:" + Session["uName"]);
            sb.Append("<br/>STANDARD:" + Session["standard"]);
            sb.Append("<br/>SUBJECT:" + Session["subjectName"]);
            sb.Append("<br/>TOPIC ID:" + Session["subjectCategory"]);
            sb.Append("<br/>TESTID:"+Session["testid"]+"<br/>DATE OF CREATION:"+DateTime.Now.Date.ToString());
            sb.Append("<hr/>");
            return sb.ToString();
        }
        catch (Exception e)
        {
            return "";
        }
    }
    public string fellowVersion()
    {
        int c = 1;
        StringBuilder res = new StringBuilder();
        
        //header 
        res.Append(fellowHeader());
        //Fillups
        if (qF != null && qF.Length > 0)
        {
            res.Append("<b>" + (c++) + ".Fill in the blanks:</b><br/><br/>");

            for (int i = 0; i < qF.Length; i++)
            {
                res.Append((i + 1) + ".  " + qF[i].qText + " <br/>");
                res.Append("Answer:<i>  " + qF[i].answer + "</i><br/><br/>");
            }
            res.Append("<br/>");
        }

        //Match
        if (qM != null && qM.Length > 0)
        {
            res.Append("<b>" + (c++) + ".Match the following:</b><br/><br/>");
            StringBuilder temp = new StringBuilder();
            for (int i = 0; i < qM.Length; i++)
            {
                res.Append((i + 1) + "  " + qM[i].qText + " <br/>");
                String[] l = qM[i].left;
                String[] r = qM[i].right;
                //Array.Sort(l);
                //Array.Sort(r);


                temp.Append("<table border='0'>");
                for (int j = 0; j < l.Length; j++)
                {
                    temp.Append("<tr><td>"+(char)(j+97)+") " + l[j] + "</td><td><pre>         </pre></td><td>" + r[j] + "</td></tr>");
                }
                temp.Append("</table>");
                
                res.Append(temp.ToString() + "<br/>");
                temp.Remove(0, temp.Length);
            }
            res.Append("<br/>");

        }

        //Choice
        if (qC != null && qC.Length > 0)
        {
            res.Append("<b>" + (c++) + ".Multiple Choice:</b><br/><br/>");
            for (int i = 0; i < qC.Length; i++)
            {
                res.Append((i + 1) + ".  " + qC[i].qText + " <br/>");
                res.Append("A)" + qC[i].choiceA + "<br/>");
                res.Append("B)" + qC[i].choiceB + "<br/>");
                res.Append("C)" + qC[i].choiceC + "<br/>");
                res.Append("D)" + qC[i].choiceD + "<br/>");
                res.Append("Answer:<i>  " + qC[i].answer + "</i><br/>");
                res.Append("<br/>");
            }
            res.Append("<br/>");
        }

        //brief
        if (qB != null && qB.Length > 0)
        {
            res.Append("<b>" + (c++) + ".Answer in brief:</b><br/><br/>");
            for (int i = 0; i < qB.Length; i++)
            {
                res.Append((i + 1) + ".  " + qB[i].qText + " <br/>");
                res.Append("Answer:<i>" + qB[i].answer + "</i><br/>");
                res.Append("<br/>");
            }
            res.Append("<br/>");
        }
        //custom
        if (qCs != null && qCs.Length > 0)
        {
            res.Append("<b>" + (c++) + ".Image:</b><br/><br/>");
            for (int i = 0; i < qCs.Length; i++)
            {
                
                res.Append((i + 1) + ".  " + qCs[i].qText + " <br/>");
                res.Append("<img src='" + qCs[i].img +"' height='300' width='300'/>");
                res.Append("<br/>Answer:<i>  " + qCs[i].answer + "</i><br/><br/>");

            }
            res.Append("<br/>");
        }
        return res.ToString();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        
        display(studentVersion());
      }
    protected void Button4_Click(object sender, EventArgs e)
    {
      display(fellowVersion());
   
        
    }
    protected void clearSession()
    {
        Session.Remove("qidBrief");
        Session.Remove("qidFill");
        Session.Remove("qidChoice");
        Session.Remove("qidCustom");
        Session.Remove("qidMatching");
        Session.Remove("standard");
        Session.Remove("subjectName");
        Session.Remove("subjectCategory");
    }
}

        
