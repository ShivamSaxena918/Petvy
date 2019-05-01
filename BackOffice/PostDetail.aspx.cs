using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PostDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            BindGrid();
        }


    }
    private void BindGrid()
    {

        string Id = Request.QueryString["VID"];
        var dc = new DataClassesDataContext();
        var ta3 = from ta in dc.tblUsers
                 join ta2 in dc.tblPosts on ta.UserId equals ta2.UserId
                 where ta2.PostId == Convert.ToInt32(Id)
        //var ta = from ob in dc.tblPosts
        //         where ob.PostId == Convert.ToInt32(Id)
                 select new
                 {
                     ta2.PostId,
                     ta2.AlbumId,
                     ImageName = (from ob2 in dc.tblImages where ob2.AlbumId == ta2.AlbumId && ob2.IsDefault == true select ob2).Take(1).SingleOrDefault().Url
                 };
        rptpost.DataSource = ta3;
        rptpost.DataBind();
        foreach (RepeaterItem it in rptpost.Items)
        {
            Label lblcaption = (Label)it.FindControl("lblcaption");
            Label lblActive = (Label)it.FindControl("lblactive");
            tblPost tp = (from ob1 in dc.tblPosts where ob1.PostId == Convert.ToInt32(Id) select ob1).Take(1).SingleOrDefault();
            lblcaption.Text = tp.Caption;
            if (tp.IsActive == true)
            {
                lblActive.Text = "check";
            }
            else if (tp.IsActive == false)
            {
                lblActive.Text = "clear";
            }


        }

    }

    protected void rptpost_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        var dc = new DataClassesDataContext();
        int ID = Convert.ToInt32(e.CommandArgument);
        tblPost tp = dc.tblPosts.SingleOrDefault(ob => ob.PostId == ID);
        if (e.CommandName == "Active")
        {
            if (tp.IsActive == false)
            {
                tp.IsActive = true;
            }
            else
            {
                tp.IsActive = false;
            }
            dc.SubmitChanges();
            BindGrid();
        }
    }
}
