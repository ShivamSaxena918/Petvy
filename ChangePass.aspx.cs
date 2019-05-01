using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["UID"] == null)
        {
            Response.Redirect("Userlogin.aspx");
        }
        else
        {

        }
    }

    protected void btnchange_Click(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        tblUser c = (from ob in dc.tblUsers where ob.UserId == Convert.ToInt32(Session["UID"]) select ob).Take(1).SingleOrDefault();
        c.Password = txtconpass.Value;
        dc.SubmitChanges();
        Response.Redirect("Default.aspx");
    }
}