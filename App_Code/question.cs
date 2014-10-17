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

/// <summary>
/// Summary description for question
/// </summary>
public class question
{
    public int qid;
    //choice,brief,fill,image
    public String qType,qText, answer, choiceA, choiceB, choiceC, choiceD;
    public String img;
    //MATCH
    public String[] left, right;
    
    public question()
	{
        
        left = new String[6];

        right = new String[6];
        //
		// TODO: Add constructor logic here
		//
	}
}
