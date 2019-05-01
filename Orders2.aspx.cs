using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Orders2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UID"] == null)
            {
                Response.Redirect("Userlogin.aspx");
            }
            else
            {
                bind();
            }
        }

    }
    private void bind()
    {
        var dc = new DataClassesDataContext();
        var UID = Convert.ToInt32(Session["UID"]);
        //var city = (from ob in dc.CityMasters where ob.ID == obb.CityId select ob).Take(1).SingleOrDefault().Name;
        //var cityy = (from ob in dc.CityMasters where ob.ID == ta.CityId select ob).Take(1).SingleOrDefault().StateID;
        //var state = (from ob in dc.StateMasters where ob.ID == cityy select ob).Take(1).SingleOrDefault().Name;
        var to = from ob in dc.tblOrderDetails
                 join ob1 in dc.tblOrders on ob.OrderId equals ob1.OrderId
                 join ob2 in dc.tblProducts on ob.ProductId equals ob2.ProductId
                 where ob2.UserId == Convert.ToInt32(Session["UID"])
                 orderby ob.OrderDetailId descending
                 select new
                 {
                     ob2.ProductId,
                     ob.OrderDetailId,
                     ob1.CreatedOn,
                     ob2.Name,
                     ob2.Price,
                     ob.Qty,
                     ob1.Amt,
                     username = (from obdd in dc.tblUsers where obdd.UserId == ob1.UserId select obdd).Take(1).SingleOrDefault().FName

                 };
        rpthead.DataSource = to;
        rpthead.DataBind();

        foreach (RepeaterItem item in rpthead.Items)
        {
            HiddenField hid = (HiddenField)item.FindControl("Hid");
            Image imgpro = (Image)item.FindControl("imgproduct");
            Label lbl1 = (Label)item.FindControl("lbladdress1");
            Label lbl2 = (Label)item.FindControl("lbladdress2");
            Label lbl3 = (Label)item.FindControl("lbladdress3");
            var ob = (from obp in dc.tblProducts join obi in dc.tblImages on obp.AlbumId equals obi.AlbumId join obmm in dc.tblOrderDetails on obp.ProductId equals obmm.ProductId where obmm.OrderDetailId == Convert.ToInt32(hid.Value) && obi.IsDefault == true select obi).Take(1).SingleOrDefault().Url;
            imgpro.ImageUrl = "Gallery/" + ob;
            tblAddress ta = (from obbb in dc.tblAddresses join ob11 in dc.tblOrders on obbb.UserId equals ob11.UserId join ob12 in dc.tblOrderDetails on ob11.OrderId equals ob12.OrderId where ob12.OrderDetailId == Convert.ToInt32(hid.Value) select obbb).Take(1).SingleOrDefault();
            lbl1.Text = ta.Address;
            lbl2.Text = ta.Landmark + " " + ta.Area;
            var city = (from obcc in dc.CityMasters where obcc.ID == ta.CityId select obcc).Take(1).SingleOrDefault().Name;
            var cityy = (from obcc in dc.CityMasters where obcc.ID == ta.CityId select obcc).Take(1).SingleOrDefault().StateID;
            var state = (from obss in dc.StateMasters where obss.ID == cityy select obss).Take(1).SingleOrDefault().Name;
            lbl3.Text = ta.Pincode + " " + city + " " + state;
        }



    }



    //foreach (RepeaterItem item in rpt1.Items)
    //{


    //    Label lblship = (Label)item.FindControl("lblship");
    //    HiddenField hfid = (HiddenField)item.FindControl("Hid");
    //    Image img = (Image)item.FindControl("imgproduct");
    //    var ob3 = (from ob4 in dc.tblImages join ob5 in dc.tblProducts on ob4.AlbumId equals ob5.AlbumId where ob5.ProductId == Convert.ToInt32(hfid.Value) && ob4.IsDefault == true select ob4).Take(1).SingleOrDefault().Url;
    //    img.ImageUrl = "Gallery/" + ob3;

    //}
}

