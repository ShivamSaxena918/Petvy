using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var dc = new DataClassesDataContext();
            var ID = Convert.ToString(HttpContext.Current.Session["AID"]);
            if (ID == "")
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Panel1.Visible = false;
                BindAlbum();
                tblPermission admin = (from ob in dc.tblPermissions where ob.AdminId == Convert.ToInt32(Session["AID"]) select ob).Take(1).SingleOrDefault();
                if(admin.IsDelete == true)
                {
                    btndeletealbum.Visible = true;
                }
                else
                {
                    btndeletealbum.Visible = false;
                }
            }
        }
    }
    private void BindAlbum()
    {
        var dc = new DataClassesDataContext();
        var Albums = from ob in dc.tblAlbums orderby ob.AlbumId  descending where ob.IsActive == true select ob;
        ddAlbumNames.DataTextField = "Name";
        ddAlbumNames.DataValueField = "AlbumID";
        ddAlbumNames.DataSource = Albums;
        ddAlbumNames.DataBind();
        ListItem itm = new ListItem("Select Album", "0");
        itm.Selected = true;
        ddAlbumNames.Items.Add(itm);


    }

    protected void btndeletealbum_Click(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        if(ddAlbumNames.SelectedValue != "0")
        {
            tblAlbum ob = (from ob1 in dc.tblAlbums where ob1.AlbumId == Convert.ToInt32(ddAlbumNames.SelectedValue) select ob1).Take(1).SingleOrDefault();
            ob.IsActive = false;
            dc.SubmitChanges();
            Response.Redirect("Gallery.aspx");
        }

    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }

    protected void ddAlbumNames_SelectedIndexChanged(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        var Images = from ob in dc.tblImages
                     join ob2 in dc.tblAlbums on ob.AlbumId equals ob2.AlbumId
                     where ob.AlbumId == Convert.ToInt32(ddAlbumNames.SelectedValue)
                     select new
                     {
                         ob.ImageId,
                         ob.Url,
                         ob2.Name
                     };
        Datalist1.DataSource = Images;
        Datalist1.DataBind();
        Panel1.Visible = true;
        foreach (DataListItem item in Datalist1.Items)
        {
            LinkButton lb = (LinkButton)item.FindControl("lbdelete");
            tblPermission admin = (from ob in dc.tblPermissions where ob.AdminId == Convert.ToInt32(Session["AID"]) select ob).Take(1).SingleOrDefault();
            if (admin.IsDelete == true)
            {
                lb.Visible = true;
            }
            else
            {
                lb.Visible = false;
            }
        }
    }

    protected void Datalist1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        var dc = new DataClassesDataContext();
        if (e.CommandName == "delete")
        {
            var ID = Convert.ToInt32(e.CommandArgument);
            var ob = (from ob1 in dc.tblImages where ob1.ImageId == ID select ob1).Take(1).SingleOrDefault();
            dc.tblImages.DeleteOnSubmit(ob);
            dc.SubmitChanges();
            Response.Redirect("Gallery.aspx");
        }
    }
}