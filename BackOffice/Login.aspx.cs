using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnLogin_Click(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        tblAdmin ta = (from ob in dc.tblAdmins where ob.Email == txtemail.Value && ob.Password == txtpass.Value && ob.IsActive == true select ob).Take(1).SingleOrDefault();
        if(ta !=null)
        {
            Session["AID"] = ta.AdminId;
            Response.Redirect("Dashboard.aspx");
        }  
        else
        {
            txtemail.Value = "";
            txtpass.Value = "";
            Page.ClientScript.RegisterStartupScript(this.GetType(),"ClientScript1", "JSFunction1()",true);
        }      
           
        
    }
}