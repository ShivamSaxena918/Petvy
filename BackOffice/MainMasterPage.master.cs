using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        binddata();
    }

    private void binddata()
    {
        var dc = new DataClassesDataContext();
        var ob = (from ob1 in dc.tblAdmins where ob1.AdminId == Convert.ToInt32(Session["AID"]) select ob1).Take(1).SingleOrDefault().Image;
        Imageavatar.ImageUrl = "Admin_Images/" + ob;
    }

    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session["AID"] = "";
        Response.Redirect("Login.aspx");   
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminView.aspx?VID=" + Session["AID"]);
    }
}
