using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Insta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var ID = Convert.ToString(Session["UID"]);
            if (ID == "")
            {
                Response.Redirect("Userlogin.aspx");
            }
            else
            {
                bindrepeater();

            }
        }
    }


    private void bindrepeater()
    {
        var ID = Convert.ToInt32(Session["UID"]);
        var dc = new DataClassesDataContext();
        var img = (from tp in dc.tblUsers where tp.UserId == ID && tp.IsActive == true select tp).Take(1).SingleOrDefault().Image;
        imgproo.ImageUrl = "User_Images/" + img;
        var ob = from ob1 in dc.tblPosts
                 join ob2 in dc.tblUsers on ob1.UserId equals ob2.UserId
                 orderby ob1.CreatedOn descending
                 where ob1.IsActive == true
                 select new
                 {
                     ob1.PostId,
                     ob1.Caption,
                     ob1.CreatedOn,
                     ob1.IsActive,
                     ob2.FName,
                     ob2.LName,
                     ob2.Image,
                     User_Image = (from obn in dc.tblUsers where obn.UserId == ID select obn).Take(1).SingleOrDefault().Image,
                     Post_Image = (from ob3 in dc.tblImages where ob3.AlbumId == ob1.AlbumId select ob3).Take(1).SingleOrDefault().Url,
                 };
        post_repeater.DataSource = ob;
        post_repeater.DataBind();
        foreach (RepeaterItem item in post_repeater.Items)
        {
            HiddenField Hid = (HiddenField)item.FindControl("HiddenField1");
            Label lblname = (Label)item.FindControl("lblname");
            Label lbldt = (Label)item.FindControl("lbldatetime");
            Label lblcaption = (Label)item.FindControl("lblcaption");
            Repeater rpt1 = (Repeater)item.FindControl("Repeater2");
            Image imgfirst = (Image)item.FindControl("imgfirst");
            string caption = (from tpc in dc.tblPosts where tpc.PostId == Convert.ToInt32(Hid.Value) select tpc).Take(1).SingleOrDefault().Caption;
            string fname = (from ob1 in dc.tblUsers
                            join ob2 in dc.tblPosts on ob1.UserId equals ob2.UserId
                            where ob2.PostId == Convert.ToInt32(Hid.Value) && ob2.IsActive == true
                            select ob1).Take(1).SingleOrDefault().FName;
            string lname = (from ob1 in dc.tblUsers
                            join ob2 in dc.tblPosts on ob1.UserId equals ob2.UserId
                            where ob2.PostId == Convert.ToInt32(Hid.Value) && ob2.IsActive == true
                            select ob1).Take(1).SingleOrDefault().LName;

            lblname.Text = fname + " " + lname;
            lblcaption.Text = caption;
            lbldt.Text = Convert.ToDateTime((from ob5 in dc.tblPosts where ob5.PostId == Convert.ToInt32(Hid.Value) where ob5.IsActive == true select ob5).Take(1).SingleOrDefault().CreatedOn).ToLongDateString();

            var tb = (from obp in dc.tblPosts join obi in dc.tblImages on obp.AlbumId equals obi.AlbumId where obp.PostId == Convert.ToInt32(Hid.Value) && obi.IsDefault == true && obp.IsActive == true select obi).Take(1).SingleOrDefault().Url;
            imgfirst.ImageUrl = "Gallery/" + tb;
            var count = (from obmm in dc.tblPosts join obii in dc.tblImages on obmm.AlbumId equals obii.AlbumId where obmm.PostId == Convert.ToInt32(Hid.Value) select obii).ToList().Count;
            if (count > 1)
            {
                var obdd = from ob1 in dc.tblPosts
                           join ob2 in dc.tblImages on ob1.AlbumId equals ob2.AlbumId
                           where ob1.PostId == Convert.ToInt32(Hid.Value) && ob2.IsDefault == false && ob1.IsActive == true
                           select new
                           {
                               ob2.ImageId,
                               ob2.Url
                           };
                rpt1.DataSource = obdd;
                rpt1.DataBind();
            }


            Label lbllikecounter = (Label)item.FindControl("lbllikecounter");
            Label lblcommentcounter = (Label)item.FindControl("lblcommentcounter");
            Label lblshowcomment = (Label)item.FindControl("lblshowcomment");
            Image commentimage = (Image)item.FindControl("CommentImage");
            ImageButton lblike = (ImageButton)item.FindControl("lblike");
            var like = (from lk in dc.tblLikes join pk in dc.tblPosts on lk.PostId equals pk.PostId where lk.PostId == Convert.ToInt32(Hid.Value) && pk.IsActive == true select lk).Count();
            var comment = (from comt in dc.tblComments where comt.PostId == Convert.ToInt32(Hid.Value) select comt).Count();
            lbllikecounter.Text = Convert.ToString(like);
            lblcommentcounter.Text = Convert.ToString(comment);
            if (Hid.Value == null)
            {

            }
            else
            {
                tblComment sc = (from oc in dc.tblComments join pk in dc.tblPosts on oc.PostId equals pk.PostId orderby oc.CommentId descending where oc.PostId == Convert.ToInt32(Hid.Value) && pk.IsActive == true select oc).Take(1).SingleOrDefault();
                if (sc != null)
                {
                    tblUser nm = (from tu in dc.tblUsers where tu.UserId == sc.UserId select tu).Take(1).SingleOrDefault();
                    commentimage.ImageUrl = "User_Images/" + nm.Image;
                    lblshowcomment.Text = nm.FName + " " + nm.LName + ":" + " " + sc.Comment;
                }
                else
                {
                    lblshowcomment.Text = null;
                    commentimage.Visible = false;
                }
            }
            //tblLike tl = dc.tblLikes.SingleOrDefault(obe => obe.UserId == 1);
            //var tl = from obl in dc.tblLikes where obl.PostId  
            var tl = (from obl in dc.tblLikes where obl.PostId == Convert.ToInt32(Hid.Value) && obl.UserId == ID select obl).Take(1).SingleOrDefault();
            if (tl == null)
            {
                lblike.ImageUrl = "maxcdn.bootstrapcdn.com/font-awesome/5.0.8/css/002-dog.png";

            }
            else
            {
                lblike.ImageUrl = "maxcdn.bootstrapcdn.com/font-awesome/5.0.8/css/001-shape.png";
            }
        }


    }

    protected void post_repeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        var ID = Convert.ToInt32(Session["UID"]);
        var dc = new DataClassesDataContext();
        var id = Convert.ToInt32(e.CommandArgument);
        var ob = (from ob1 in dc.tblLikes where ob1.UserId == ID && ob1.PostId == id select ob1).Take(1).SingleOrDefault();
        if (e.CommandName == "btnlike")
        {
            if (ob == null)
            {
                tblLike tl = new tblLike();
                tl.CreatedOn = DateTime.Now;
                tl.IsLike = true;
                tl.PostId = id;
                tl.UserId = ID;
                dc.tblLikes.InsertOnSubmit(tl);
            }
            else
            {
                var obes = (from obe in dc.tblLikes where obe.PostId == id && obe.UserId == ID select obe);
                dc.tblLikes.DeleteAllOnSubmit(obes);
            }

            dc.SubmitChanges();
            //tblLike tls = (from obs in dc.tblLikes where obs.PostId == id where obs.UserId == 1 select obs).Take(1).SingleOrDefault();
        }
        else if (e.CommandName == "AddComment")
        {
            TextBox tb = (TextBox)e.Item.FindControl("txtcomment");
            var str = tb.Text.Trim();
            if (str == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "swal('Error', 'Comment Cannot Be Empty', 'error')", true);
            }
            else
            {
                tblComment tc = new tblComment();
                tc.Comment = tb.Text;
                tc.UserId = ID;
                tc.IsActive = true;
                tc.PostId = id;
                tc.CreatedOn = DateTime.Now;
                dc.tblComments.InsertOnSubmit(tc);
                dc.SubmitChanges();
            }
        }
        else if (e.CommandName == "btncomment")
        {
            Response.Redirect("postdetail.aspx?POID=" + id);
        }

        bindrepeater();

    }


    protected void btnPost_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            var ID = Convert.ToInt32(Session["UID"]);
            var dc = new DataClassesDataContext();
            var cnt = (from obd in dc.tblPosts select obd).Count();
            tblAlbum ta = new tblAlbum();
            ta.Name = "Post" + cnt;
            ta.IsActive = true;
            ta.CreatedOn = DateTime.Now;
            ta.IsVideo = false;
            ta.IsImage = true;
            ta.IsAudio = false;
            dc.tblAlbums.InsertOnSubmit(ta);
            dc.SubmitChanges();
            string path = Server.MapPath("Gallery");
            int ob = (from taab in dc.tblAlbums orderby taab.AlbumId descending select taab).Take(1).SingleOrDefault().AlbumId;
            if (FileUpload1.HasFile)
            {
                foreach (HttpPostedFile file in FileUpload1.PostedFiles)
                {
                    string ext = System.IO.Path.GetExtension(file.FileName);
                    int IDD;
                    tblImage LastID = (from oi in dc.tblImages orderby oi.ImageId descending select oi).Take(1).SingleOrDefault();
                    if (LastID == null)
                    {
                        IDD = 1;

                    }
                    else
                    {
                        IDD = LastID.ImageId + 1;
                    }
                    tblImage obj = new tblImage();
                    if (FileUpload1.PostedFiles.First() == file)
                    {
                        obj.IsDefault = true;
                    }
                    else
                    {
                        obj.IsDefault = false;
                    }
                    obj.AlbumId = ob;
                    obj.CreatedOn = DateTime.Now;
                    obj.Url = IDD + ext;
                    obj.IsActive = true;
                    dc.tblImages.InsertOnSubmit(obj);
                    dc.SubmitChanges();
                    file.SaveAs(path + "/" + IDD + "" + ext);
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "swal('Fatal Error', 'No Image Found', 'error')", true);
            }

            //tblImage ti = new tblImage();
            //if (FileUpload1.HasFile)
            //{
            //    ti.Url = FileUpload1.FileName;
            //    FileUpload1.SaveAs(Server.MapPath("User_Images") + "/" + FileUpload1.FileName);
            //}
            //else
            //{

            //}
            //ti.IsActive = true;
            //ti.IsDefault = true;
            //ti.CreatedOn = DateTime.Now;
            //ti.AlbumId = (from taa in dc.tblAlbums orderby taa.AlbumId descending select taa).Take(1).SingleOrDefault().AlbumId;
            //dc.tblImages.InsertOnSubmit(ti);
            //dc.SubmitChanges();

            tblPost tp = new tblPost();
            tp.CreatedOn = DateTime.Now;
            tp.Caption = xyz.Value;
            tp.IsActive = true;
            tp.UserId = ID;
            tp.AlbumId = (from taa1 in dc.tblAlbums orderby taa1.AlbumId descending select taa1).Take(1).SingleOrDefault().AlbumId;
            dc.tblPosts.InsertOnSubmit(tp);
            dc.SubmitChanges();

        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "swal('Error', 'Please Provide Image/Video For Post', 'error')", true);
        }
        xyz.Value = null;
        bindrepeater();
    }

}

