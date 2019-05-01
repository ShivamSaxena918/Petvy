using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Events : System.Web.UI.Page
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
                BindGrid();
            }
        }
    }

    private void BindGrid()
    {
        var dc = new DataClassesDataContext();
        var Event = from ob in dc.tblEvents
                    select new
                    {
                        ob.EventName,
                        ob.EventId,
                        ob.Details,
                        ob.EndTime,
                        ob.EndDate,
                        ob.IsActive,
                        ob.StartDate,
                        ob.StartTime,
                        ImageName = (from ob3 in dc.tblImages where ob3.AlbumId == ob.AlbumId && ob3.IsDefault == true select ob3).Take(1).SingleOrDefault().Url

                    };

        rptevent.DataSource = Event;
        rptevent.DataBind();
        tblPermission objp = (from oba in dc.tblAdmins join obp in dc.tblPermissions on oba.AdminId equals obp.AdminId where oba.AdminId == Convert.ToInt32(Session["AID"]) select obp).Take(1).SingleOrDefault();
        if (objp.IsInsert == true)
        {
            lbinsert.Visible = true;
        }
        else
        {
            lbinsert.Visible = false;
        }
        foreach (RepeaterItem item in rptevent.Items)
        {
            HiddenField HId = (HiddenField)item.FindControl("HId");
            Label lblactive = (Label)item.FindControl("lblactive");
            LinkButton lbedit = (LinkButton)item.FindControl("lbedit");
            LinkButton lbdelete = (LinkButton)item.FindControl("lbdelete");
            tblEvent obj = (from obe in dc.tblEvents where obe.EventId == Convert.ToInt32(HId.Value) select obe).Take(1).SingleOrDefault();
            if (obj.IsActive == true)
            {
                lblactive.Text = "check";
            }
            else
            {
                lblactive.Text = "clear";
            }
            tblPermission obj1 = (from oba1 in dc.tblAdmins join obp1 in dc.tblPermissions on oba1.AdminId equals obp1.AdminId where oba1.AdminId == Convert.ToInt32(Session["AID"]) select obp1).Take(1).SingleOrDefault();
            if (obj1.IsUpdate == true)
            {
                lbedit.Visible = true;
            }
            else
            {
                lbedit.Visible = false;
            }
            tblPermission obj2 = (from oba1 in dc.tblAdmins join obp1 in dc.tblPermissions on oba1.AdminId equals obp1.AdminId where oba1.AdminId == Convert.ToInt32(Session["AID"]) select obp1).Take(1).SingleOrDefault();
            if (obj2.IsDelete == true)
            {
                lbdelete.Visible = true;
            }
            else
            {
                lbdelete.Visible = false;
            }
        }


    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        var taa = (from oba in dc.tblEvents where oba.EventName == txteventname.Value select oba).ToList().Count();
        if (taa > 0)
        {
            //cvemail.ErrorMessage = "Email Already Exist!!!";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "Eventnamevarification()", true);
        }
        else
        {
            if (Convert.ToDateTime(txtstartdate.Value) > DateTime.Today)
            {
                tblAlbum obj1 = new tblAlbum();
                obj1.Name = txteventname.Value;
                obj1.IsImage = true;
                obj1.IsActive = true;
                obj1.CreatedOn = DateTime.Now;
                obj1.IsAudio = false;
                obj1.IsVideo = false;
                dc.tblAlbums.InsertOnSubmit(obj1);
                dc.SubmitChanges();
                int LastAlbum = (from ob in dc.tblAlbums orderby ob.AlbumId descending select ob).Take(1).SingleOrDefault().AlbumId;
                string path = Server.MapPath("../Gallery");
                if (imgupload.HasFiles)
                {
                    bool flag = true;
                    foreach (HttpPostedFile file in imgupload.PostedFiles)
                    {
                        string ext = System.IO.Path.GetExtension(file.FileName);
                        int size = file.ContentLength / 1024;
                        if (ext.ToLower() == ".jpg" || ext.ToLower() == ".png" || ext.ToLower() == ".gif" && size < 1024)
                        {
                            int ID;
                            int LastId = (from ob in dc.tblImages orderby ob.ImageId descending select ob).Take(1).SingleOrDefault().ImageId;
                            if (LastId == 0)
                            {
                                ID = 1;
                            }
                            else
                            {
                                ID = LastId + 1;
                            }
                            tblImage obj2 = new tblImage();
                            obj2.IsActive = true;
                            obj2.Url = ID + "" + ext;
                            obj2.IsDefault = flag;
                            obj2.CreatedOn = DateTime.Now;
                            obj2.AlbumId = LastAlbum;
                            dc.tblImages.InsertOnSubmit(obj2);
                            dc.SubmitChanges();
                            file.SaveAs(path + "/" + ID + "" + ext);
                            flag = false;
                        }
                    }
                }
                tblEvent obj = new tblEvent();
                obj.EventName = txteventname.Value;
                obj.StartTime = TimeSpan.Parse(txtstarttime.Value);
                obj.EndTime = TimeSpan.Parse(txtendtime.Value);
                obj.StartDate = Convert.ToDateTime(txtstartdate.Value);
                obj.EndDate = Convert.ToDateTime(txtenddate.Value);
                obj.Details = textarea1.Value;
                obj.AlbumId = LastAlbum;
                obj.AdminId = Convert.ToInt32(Session["AID"]);
                obj.IsActive = true;
                dc.tblEvents.InsertOnSubmit(obj);
                dc.SubmitChanges();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "alert('Incorrect Start Date')", true);
            }
        }
        BindGrid();


    }

    protected void rptevent_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        var dc = new DataClassesDataContext();
        tblEvent obj = dc.tblEvents.SingleOrDefault(ob => ob.EventId == id);
        if (e.CommandName == "EventEdit")
        {
            Response.Redirect("EventUpdate.aspx?EID=" + id);
        }
        else if (e.CommandName == "EventDelete")
        {
            if (obj.IsActive == true)
            {
                obj.IsActive = false;
            }
        }
        else if (e.CommandName == "active")
        {
            if (obj.IsActive == false)
            {
                obj.IsActive = true;
            }
            else
            {
                obj.IsActive = false;
            }
        }
        dc.SubmitChanges();
        BindGrid();



    }
}