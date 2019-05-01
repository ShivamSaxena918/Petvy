using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Profile1 : System.Web.UI.Page
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
                //bindorder();
                binddata();
                bindrptproduct();
            }
        }
    }


    private void bindrptproduct()
    {
        int IDD = Convert.ToInt32(Session["UID"]);
        var dc = new DataClassesDataContext();
        var count1 = (from obb in dc.tblBusinesses where obb.UserId == IDD select obb).ToList().Count;
        if (count1 > 0)
        {
            lblproducts.Visible = true;
            var count = (from obp in dc.tblProducts join obu in dc.tblUsers on obp.UserId equals obu.UserId where obp.IsActive == true && obp.UserId == IDD select obp).ToList().Count;
            if (count > 0)
            {
                int ID = Convert.ToInt32(Session["UID"]);
                var ob = from ob1 in dc.tblProducts
                         join ob2 in dc.tblUsers on ob1.UserId equals ob2.UserId
                         join ob3 in dc.tblImages on ob1.AlbumId equals ob3.AlbumId
                         where ob3.IsDefault == true && ob1.UserId == ID
                         select new
                         {
                             ob1.ProductId,
                             ob1.Name,
                             ob1.Price
                         };
                rptproducts.DataSource = ob;
                rptproducts.DataBind();
                lblnoproduct.Visible = false;
                foreach (RepeaterItem item in rptproducts.Items)
                {
                    HiddenField hf = (HiddenField)item.FindControl("hfproduct");
                    Image ia = (Image)item.FindControl("Image1");
                    var obn = (from tp in dc.tblProducts join ti in dc.tblImages on tp.AlbumId equals ti.AlbumId where tp.UserId == ID && ti.IsDefault == true && tp.ProductId == Convert.ToInt32(hf.Value) select ti).Take(1).SingleOrDefault().Url;
                    ia.ImageUrl = "Gallery/" + obn;
                }
            }
            else
            {
                
            }
        }
    }

    private void binddata()
    {
        var dc = new DataClassesDataContext();
        int ID = Convert.ToInt32(Session["UID"]);
        tblUser tu = (from obb in dc.tblUsers where obb.UserId == ID select obb).Take(1).SingleOrDefault();
        imgprofile.ImageUrl = "User_Images/" + tu.Image;
        lblname.Text = tu.FName + " " + tu.MName + " " + tu.LName;
        //var cit
        lblcno.Text = tu.ContactNo;
        lblemail.Text = tu.Email;
        var count = (from obb in dc.tblAddresses where obb.UserId == ID && obb.IsActive == true select obb).ToList().Count;
        if (count > 0)
        {
            lbladdress.Visible = true;
            tblAddress ob = (from ta in dc.tblAddresses where ta.UserId == ID select ta).Take(1).SingleOrDefault();
            string city = (from ob1 in dc.CityMasters where ob1.ID == ob.CityId select ob1).Take(1).SingleOrDefault().Name;
            string state = (from ob2 in dc.StateMasters join ob3 in dc.CityMasters on ob2.ID equals ob3.StateID where ob3.ID == ob.CityId select ob2).Take(1).SingleOrDefault().Name;
            lbladdress.Text = state + "," + " " + city;
        }
        else
        {
            lbladdress.Visible = false;
        }
    }

    private void bindrepeater()
    {
        var ID = Convert.ToInt32(Session["UID"]);
        var dc = new DataClassesDataContext();
        var count = (from obpp in dc.tblPosts join ob1 in dc.tblUsers on obpp.UserId equals ob1.UserId where ob1.UserId == ID && obpp.IsActive == true select obpp).ToList().Count;
        if (count > 0)
        {

            var ob = from ob1 in dc.tblPosts
                     join ob2 in dc.tblUsers on ob1.UserId equals ob2.UserId
                     where ob1.UserId == ID && ob1.IsActive == true
                     orderby ob1.CreatedOn descending
                     select new
                     {
                         ob1.PostId,
                         ob1.CreatedOn,
                         ob1.IsActive,
                         ob2.Image,
                         User_Image = (from obn in dc.tblUsers where obn.UserId == ID select obn).Take(1).SingleOrDefault().Image,
                         Post_Image = (from ob3 in dc.tblImages where ob3.AlbumId == ob1.AlbumId select ob3).Take(1).SingleOrDefault().Url,
                     };
            post_repeater.DataSource = ob;
            post_repeater.DataBind();
        }
        else
        {
            lblviewpost.Visible = true;
        }

    }



    protected void rptproducts_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        var ID = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "submit")
        {
            Response.Redirect("EditProduct.aspx?PID=" + ID);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditProfile.aspx");
    }
}
