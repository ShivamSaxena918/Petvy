using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_Seller : System.Web.UI.Page
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
            bindsellar();
        }
    }
    private void bindsellar()
    {

        var dc = new DataClassesDataContext();
        var ob = from tu in dc.tblUsers
                 where tu.IsBusiness==true
                 select new
                 {
                     tu.FName,
                     tu.MName,
                     tu.LName,
                     tu.Email,
                     tu.ContactNo,
                     tu.Image,
                     tu.IsActive,
                     tu.UserId
                 };
        sellar_grid.DataSource = ob;
        sellar_grid.DataBind();
        foreach (RepeaterItem item in sellar_grid.Items)
        {
            HiddenField HId = (HiddenField)item.FindControl("HId");
            Label lbl = (Label)item.FindControl("lblactive");
            tblUser ob2 = (from ob1 in dc.tblUsers where ob1.UserId == Convert.ToInt32(HId.Value) select ob1).Take(1).SingleOrDefault();
            if (ob2.IsActive == true)
            {
                lbl.Text = "check";
            }
            else
            {
                lbl.Text = "clear";
            }
            

        }
    }

    protected void sellar_grid_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        var dc = new DataClassesDataContext();
        var id = Convert.ToInt32(e.CommandArgument);
        tblUser tu = (from ob in dc.tblUsers where ob.UserId == id select ob).Take(1).SingleOrDefault();

       
        dc.SubmitChanges();
        if (e.CommandName == "view")
        {
            Response.Redirect("SellerDetails.aspx?SID="+id);
            //Response.Redirect("UserProfile.aspx?SID="+id);
        }
            bindsellar();
    

    }
}