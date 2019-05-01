using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminDetail : System.Web.UI.Page
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
            bindrepeater();
        }
     
    }

    private void bindrepeater()
    {
        var dc = new DataClassesDataContext();
        var ob = from tu in dc.tblUsers
                 where tu.IsBusiness == false
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
        user_grid.DataSource = ob;
        user_grid.DataBind();
        foreach (RepeaterItem item in user_grid.Items)
        {
            HiddenField HId = (HiddenField)item.FindControl("HId");
            Label lbl = (Label)item.FindControl("lblactive");
            LinkButton lbdelete = (LinkButton)item.FindControl("lbdelete");
            tblUser ob2 = (from ob1 in dc.tblUsers where ob1.UserId == Convert.ToInt32(HId.Value) select ob1).Take(1).SingleOrDefault();
            if (ob2.IsActive == true)
            {
                lbl.Text = "check";
            }
            else
            {
                lbl.Text = "clear";
            }
            tblPermission obj1 = (from oba1 in dc.tblAdmins join obp1 in dc.tblPermissions on oba1.AdminId equals obp1.AdminId where oba1.AdminId == Convert.ToInt32(Session["AID"]) select obp1).Take(1).SingleOrDefault();
            if (obj1.IsDelete == true)
            {
                lbdelete.Visible = true;
            }
            else
            {
                lbdelete.Visible = false;
            }

        }
    }
    protected void user_grid_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        var dc = new DataClassesDataContext();
        var id = Convert.ToInt32(e.CommandArgument);
        tblUser tu = (from ob in dc.tblUsers where ob.UserId == id select ob).Take(1).SingleOrDefault();

        if (e.CommandName == "delete")
        {
            try
            {

                if (tu.IsActive == true)
                {
                    tu.IsActive = false;
                }
                tblAction ac = new tblAction();
                ac.AdminId = Convert.ToInt32(Session["AID"]);
                ac.PageName = "User.aspx";
                ac.Action = "Delete";
                ac.CreatedOn = DateTime.Now;
                ac.MacAddress = Service.GetMacAddress();
                dc.tblActions.InsertOnSubmit(ac);
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                tblError err = new tblError();
                err.PageName = "AdminDetail.aspx";
                err.MacAddress = Service.GetMacAddress();
                err.Description = ex.ToString();
                err.CreatedOn = DateTime.Now;
                err.AdminId = Convert.ToInt32(Session["AID"]);
                dc.tblErrors.InsertOnSubmit(err);
                dc.SubmitChanges();
                Response.Redirect("Error.aspx");
            }
        }
        if (e.CommandName == "active")
        {
            if (tu.IsActive == false)
            {
                tu.IsActive = true;
            }
        }
        dc.SubmitChanges();
        if (e.CommandName == "view")
        {
            Response.Redirect("UserProfile.aspx?UID="+id);
        }
            bindrepeater();
    }
}