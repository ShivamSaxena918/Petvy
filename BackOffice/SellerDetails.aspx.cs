using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_SellerDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var ID = Convert.ToString(Session["AID`"]);
        if (Request.QueryString["SID"] == null)
        {
            Response.Redirect("Seller.aspx");
            if(ID == "")
            {
                Response.Redirect("Login.aspx");
            }
        }
        else
        {
            Bindsellar();
        }
    }
    private void Bindsellar()
    {
        var Id = Request.QueryString["SID"];
        var dc = new DataClassesDataContext();
        tblBusiness ta = (from ob in dc.tblBusinesses where ob.BusinessId == Convert.ToInt32(Id) select ob).Take(1).SingleOrDefault();
        lblTitle.Text = ta.Title;
        lblGSTno.Text = " " + ta.GSTNo;
        lblContactno.Text = " " + ta.ContactNo;
        lblEmail.Text = " " + ta.Email;
        lblWebURL.Text = " " + ta.WebURL;
        var Images = from ob in dc.tblBusinesses
                     join ob2 in dc.tblImages on ob.AlbumId equals ob2.AlbumId
                     where ob.BusinessId == Convert.ToInt32(Id)
                     select new
                     {
                         ob2.Url,
                         ob.AlbumId
                     };
        rptseller.DataSource = Images;
        rptseller.DataBind();

        //var obb = from ob1 in dc.tblImages join ob2 in dc.tblBusinesses on ob1.AlbumId equals ob2.AlbumId where ob2.BusinessId == 1 && ob1.IsDefault == false select ob1.Url;
        //rptseller.DataSource = obb;
        //rptseller.DataBind();
        //foreach (RepeaterItem item in rptseller.Items)
        //{
        //    Image imgssc = (Image)item.FindControl("imgscc");
        //    imgssc.ImageUrl = "../Gallery/" + obb;
        //}
    
    }
}
