using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class postdetail : System.Web.UI.Page
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
                binddata();
                bindrepeater();
            }
        }
    }

    private void bindrepeater()
    {
        var ID = Convert.ToInt32(Request.QueryString["POID"]);
        var dc = new DataClassesDataContext();
        var count = (from obp in dc.tblPosts join obc in dc.tblComments on obp.PostId equals obc.PostId where obp.PostId == ID select obc).ToList().Count;
        if (count > 0)
        {

            var ob = from ob1 in dc.tblPosts
                     join ob2 in dc.tblComments on ob1.PostId equals ob2.PostId
                     join ob3 in dc.tblUsers on ob2.UserId equals ob3.UserId
                     where ob1.PostId == ID
                     select new
                     {
                         ob2.Comment,
                         ob3.Image,
                         ob3.FName,
                         ob3.MName,
                         ob3.LName
                     };
            Repeater2.DataSource = ob;
            Repeater2.DataBind();
        }
        else
        {
            lblnocomment.Visible = true;
        }

    }

    private void binddata()
    {
        var ID = Convert.ToInt32(Request.QueryString["POID"]);
        var dc = new DataClassesDataContext();
        var tp1 = (from ob1 in dc.tblImages join ob2 in dc.tblPosts on ob1.AlbumId equals ob2.AlbumId where ob2.PostId == ID && ob1.IsDefault == true select ob1).Take(1).SingleOrDefault().Url;

        imgfirst.ImageUrl = "Gallery/" + tp1;
        var tp2 = from ob1 in dc.tblImages join ob2 in dc.tblPosts on ob1.AlbumId equals ob2.AlbumId where ob2.PostId == ID && ob1.IsDefault == false select ob1;
        Repeater1.DataSource = tp2;
        Repeater1.DataBind();
        var img = (from ob in dc.tblPosts join ob1 in dc.tblUsers on ob.UserId equals ob1.UserId where ob.PostId == ID select ob1).Take(1).SingleOrDefault().Image;
        imguser.ImageUrl = "User_Images/" + img;
        var Fname = (from ob in dc.tblPosts join ob1 in dc.tblUsers on ob.UserId equals ob1.UserId where ob.PostId == ID select ob1).Take(1).SingleOrDefault().FName;
        var Mname = (from ob in dc.tblPosts join ob1 in dc.tblUsers on ob.UserId equals ob1.UserId where ob.PostId == ID select ob1).Take(1).SingleOrDefault().MName;
        var Lname = (from ob in dc.tblPosts join ob1 in dc.tblUsers on ob.UserId equals ob1.UserId where ob.PostId == ID select ob1).Take(1).SingleOrDefault().LName;
        lblname.Text = Fname + " " + Mname + " " + Lname;
        lblemail.Text = (from ob in dc.tblPosts join ob1 in dc.tblUsers on ob.UserId equals ob1.UserId where ob.PostId == ID select ob1).Take(1).SingleOrDefault().Email;
        var likecount = (from ob in dc.tblLikes join ob1 in dc.tblPosts on ob.PostId equals ob1.PostId where ob1.PostId == ID select ob).ToList().Count;
        var commentcount = (from ob in dc.tblComments join ob1 in dc.tblPosts on ob.PostId equals ob1.PostId where ob1.PostId == ID select ob).ToList().Count;
        lbllikecounter.Text = likecount.ToString();
        lblcommentcounter.Text = commentcount.ToString();
        var del = (from ob in dc.tblPosts where ob.PostId == ID && ob.UserId == Convert.ToInt32(Session["UID"]) select ob).ToList().Count;
        if (del > 0)
        {
            lbdelete.Visible = true;
        }
       
    }

    protected void lbdelete_Click(object sender, EventArgs e)
    {
        var dc = new DataClassesDataContext();
        int ID = Convert.ToInt32(Request.QueryString["POID"]);
        tblPost ob = (from ob1 in dc.tblPosts where ob1.PostId == ID select ob1).Take(1).SingleOrDefault();
        ob.IsActive = false;
        dc.SubmitChanges();
        Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", "swal('Post Deleted', 'No One Now Can See This Post', 'success')", true);
    }
}