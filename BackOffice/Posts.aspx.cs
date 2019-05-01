using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Posts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AID"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                BindPost();
            }
        }
    }
    private void BindPost()
    {
        var dc = new DataClassesDataContext();
        var ob = from ta in dc.tblUsers
                 join ta2 in dc.tblPosts on ta.UserId equals ta2.UserId
                 select new
                 {
                     ta.FName,
                     ta.Image,
                     ta2.PostId,
                     ta2.Caption,
                     ta2.CreatedOn,
                     ta2.IsActive,
                     ta2.AlbumId,
                     ta2.UserId,
                     ImageName = (from ob2 in dc.tblImages where ob2.AlbumId == ta2.AlbumId && ob2.IsDefault == true select ob2).Take(1).SingleOrDefault().Url

                 };
        rptpost.DataSource = ob;
        rptpost.DataBind();
        foreach (RepeaterItem it in rptpost.Items)
        {

            HiddenField HId = (HiddenField)it.FindControl("HId");
            Label lblActive = (Label)it.FindControl("lblactive");
            tblPost post = (from obe in dc.tblPosts where obe.PostId == Convert.ToInt32(HId.Value) select obe).Take(1).SingleOrDefault();
            if (post.IsActive == true)
            {
                lblActive.Text = "check";
            }
            else
            {
                lblActive.Text = "clear";
            }

        }
    }

    protected void rptpost_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        var dc = new DataClassesDataContext();
        int ID = Convert.ToInt32(e.CommandArgument);
        tblPost ta = dc.tblPosts.SingleOrDefault(ob => ob.PostId == ID);
        if (e.CommandName == "View")
        {
            Response.Redirect("PostDetail.aspx?VID=" + ID);
        }
        if(e.CommandName == "Active")
        {
            if(ta.IsActive == true)
            {
                ta.IsActive = false;
            }
            else
            {
                ta.IsActive = true;
            }
            dc.SubmitChanges();
        }
        BindPost();

    }
}