using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var ID = Convert.ToString(HttpContext.Current.Session["AID"]);
        if (ID == "")
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            bindcard();
        }
    }

    private void bindcard()
    {
        var Id = Request.QueryString["UID"];
        var dc = new DataClassesDataContext();
        tblUser tu = (from ob in dc.tblUsers where ob.UserId == Convert.ToInt32(Id) select ob).Take(1).SingleOrDefault();
        imgLogo.ImageUrl = "../User_Images/" + tu.Image;
        lblName.Text = "  " + tu.FName + " " + tu.LName;
        lblfullname.Text = "  " + tu.FName + " " + tu.MName + " " + tu.LName;
        lblcno.Text = "  " + tu.ContactNo;
        //lblemail.Text = "  " + tu.Email;
        lblCreatedOn.Text = "  " + Convert.ToString(tu.CreatedOn);
        lblDOB.Text = " " + tu.DOB;
        LblGender.Text =" " + tu.Gender.ToUpper();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("User.aspx");
    }
}