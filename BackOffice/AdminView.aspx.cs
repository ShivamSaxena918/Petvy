using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
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



        
    }

    private void bindcard()
    {
        var Id = Request.QueryString["VID"];
        var dc = new DataClassesDataContext();
        tblAdmin ta = (from ob in dc.tblAdmins where ob.AdminId==Convert.ToInt32(Id) select ob).Take(1).SingleOrDefault();
        imgLogo.ImageUrl = "Admin_Images/" + ta.Image;
        lblName.Text = "  " + ta.FName +" "+ ta.LName;
        lblfullname.Text= "  " + ta.FName + " "+ta.MName+" "+ ta.LName;
        lblcno.Text = "  " + ta.ContactNo;
        lblemail.Text ="  "+ta.Email;
        lblCreatedOn.Text = "  " + Convert.ToString(ta.CreatedOn);
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminDetails.aspx");
    }
}